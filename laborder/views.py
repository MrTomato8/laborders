# -*- coding: utf-8 -*-

from numpy import array
from django.shortcuts import render_to_response
from django.core.mail import send_mail, mail_admins
from django.core.context_processors import csrf
from django.http import HttpResponseRedirect
from django.contrib import auth
from django.contrib.auth.decorators import login_required
from django.db.models import Q
from django.contrib.auth.models import User
from django.utils import simplejson
from django.http import HttpResponse
from orders.models import Stuff, Wish, Event
from orders.forms import ContactForm, WishForm, StuffForm

def main(request, template_name='login.html'):
    c = {}
    c.update(csrf(request))
    if 'username' in request.POST:
        username = request.POST['username']
        password = request.POST['password']
        user = auth.authenticate(username=username, password=password)
        if user is not None and user.is_active:
            auth.login(request, user)
            return HttpResponseRedirect("/wishes")
        else:
            if len(username) > 0 and len(password) > 0:
                c.update({'login_error':u'%s, вы точно ввели правильный пароль? А может быть вы вовсе не %s?' % (username, username)})
            elif len(username) > 0 and len(password) == 0:
                c.update({'login_error':u'%s, напишите пожалуйста пароль' % (username)})
            else:
                c.update({'login_error':u'нужно написать имя и пароль'})
            return render_to_response(template_name, c)
    else:
        if request.user.is_authenticated():
            return HttpResponseRedirect("/wishes")
        else:
            return render_to_response(template_name, c)

def logout(request):
    auth.logout(request)
    return HttpResponseRedirect('/')


@login_required()
def extsearch(request):
    """
    Extented search function
    """
    #обработать поисковый запрос и вернцть результат
    stuffform = StuffForm() 
    wishform = WishForm()
    
    return render_to_response("extsearch.html", {'wish':wishform, 'stuff':stuffform, 'user':request.user, 'page_name':u'Расширенный поиск'})

@login_required()
def contact(request):
    if request.POST:
        message = request.POST.get('comment', None)
        if len(message) == 0:
            c = {'page_name':u'Обратная связь', 'user':request.user, 'err':u'Вы пытаетесь отправить пустое сообщение. Напишите хоть что-нибудь.'}

            return render_to_response("contact.html", c)
        else:
            msg0 = u"{0} ({1}) передает:\n{2}".format(request.user.first_name, request.user.email, message)
            send_mail(u"Замечание по работе orders.ogtr.ru", msg0, 'piggy@piggy.thruhere.net', ['gontchar@gmail.com','piggy@piggy.thruhere.net', ], fail_silently=False)
            c = {'page_name':u'Обратная связь', 'user':request.user, 'err':u'Ваше сообщение отправлено. <a href="/">Вернуться</a> на главную страницу.'}
            return render_to_response("contact.html", c)
    c = {'page_name':u'Обратная связь', 'user':request.user}
    c.update(csrf(request))
    return render_to_response("contact.html", c)

@login_required()
def wishes(request, status):
    if request.GET:
        #ssearch - simple search
        #остальные параметры - для расширенного поиска
        s = request.GET.get('ssearch', None)
        if s is not None:
        #простой поиск    
        #надо сделать какое-то автодополнение при вводе 
        #оборудования - чтобы можно было вводить русское, альтернативоне
        #названия или каталожный номер.
            qset = (Q(stuff__name_rus__icontains=s) | Q(stuff__name_exact__icontains=s) | Q(stuff__cat_num__icontains=s))
            wish_list = Wish.objects.filter(qset)
            c = {'wishes':wish_list, 'page_name':u'Поиск %s' % s, 'user':request.user, 'status':False, 'back':True}
            return render_to_response("wishes.html", c)
        #расширенный поиск
        #по 18 пунктам
        else:
            qset = (
                Q(stuff__stgroup__exact=request.GET.get('stgroup', None)) |
                Q(stuff__name_rus__icontains=request.GET.get('name_rus', None)) |
                Q(stuff__name_exact__icontains=request.GET.get('name_exact', None)) |
                Q(stuff__manuf__icontains=request.GET.get('manuf', None)) |
                Q(stuff__cat_num__icontains=request.GET.get('cat_num', None)) |
                Q(stuff__package__exact=request.GET.get('package', None)) |
                Q(price_rus__exact=request.GET.get('price_rus', None)) |
                Q(user__exact=request.GET.get('user', None)) |
                Q(urgent__exact=request.GET.get('urgent', False)) |
                Q(status__exact=request.GET.get('status', None)) |
                Q(comment__icontains=request.GET.get('comment', None))
                )

            wish_list = Wish.objects.filter(qset)
            c = {'wishes':wish_list, 'page_name':u'Расширенный поиск %s' % request.GET, 'user':request.user, 'status':False, 'back':True}
            return render_to_response("wishes.html", c)
    
    wish_user = Wish.objects.filter(user=request.user.id)
    wish_user = wish_user.exclude(status='5').exclude(status='3')
    wish_other = Wish.objects.exclude(user=request.user.id).exclude(status='5').exclude(status='3')
    st_dict = {'delete':u'удалена', 'edit':u'изменена', 'add':u'добавлена'}

    if status is not False:
        st = st_dict.get(status, False)
    else:
        st = False

    c = {'wishes':wish_user, 'other_wishes':wish_other, 'page_name':u'Список заказов', 'user':request.user, 'status':False, 'newww':True}
    c.update(csrf(request))

    return render_to_response("wishes.html", c)

@login_required()
def delete(request, num):
    #delete object
    #return httpredirect /wishes 
    e = Event.objects.filter(wish=num)
    e.delete()
    w = Wish.objects.get(id=num)
    w.delete()
    
    return HttpResponseRedirect('/wishes')

@login_required()
def userwish(request, userid):
    w = Wish.objects.filter(user=userid)
    uname = User.objects.get(id=userid)
    c = {'wishes':w, 'page_name':u'Заказы пользователя %s' % uname.first_name, 'user':request.user, 'status':False, 'newww':True, 'back':True}
    return render_to_response("wishes.html", c)

@login_required()
def showstatus(request, st):
    w = Wish.objects.filter(status=st)
    wlist = list(w)
    if len(wlist) > 0:
        statusname = wlist[0].get_status_display()
        c = {'wishes':w, 'page_name':u'Заказы со статусом "%s"' % statusname, 'user':request.user, 'status':False, 'newww':True, 'back':True}
        
    else:
        w = Wish.objects.all()
        c = {'wishes':w, 'page_name':u'Статуса "%s" нет' % st, 'user':request.user, 'status':False, 'newww':True, 'back':True}
        
    return render_to_response("wishes.html", c)

@login_required
def showhistory(request, num):
    e = Event.objects.filter(wish=num)
    w = Wish.objects.get(id=num)
    c = {'events':e, 'page_name':u'История заказа [{0}] от {1}'.format(w.stuff.name_rus, w.order_date), 'user':request.user, 'status':False, 'newww':False, 'back':True}
    return render_to_response('history.html', c)

@login_required()
def edit(request, num):
    wish = Wish.objects.get(id=num)
    form = WishForm(instance=wish)
    status_old = wish.status

    if request.method == 'POST':
        f = WishForm(request.POST, instance=wish)
        
        if f.is_valid():
            f.save()
            #и тут, если в форме все правильно, добавляем запись об изменении статуса в таблицу.
            #if wish.status != :
            status_new = f.cleaned_data['status']
            newevent = Event(wish=wish, oldstatus=status_old, newstatus=status_new, user=request.user)
            newevent.save()
            return HttpResponseRedirect('/wishes')
        
    stuff_name = unicode(wish.stuff.name_rus)
    c = {'form':form, 'user':request.user, 'title':u'Правка записи {0}, русское название: {1}'.format(num, wish.stuff.name_rus), 'page_name':u'Правка записи {0}, русское название: {1}'.format(num, wish.stuff.name_rus), 'modif':'Изменить', 'wstat':wish.status, 'uid':wish.user.id, 'stuff_id':wish.stuff_id, 'stuff_name':stuff_name}
    request.session['stuff_name'] = stuff_name
    c.update(csrf(request))
    return render_to_response("add.html", c)

def back(url):
    back = url.strip('/').split('/')
    if len(back) > 1:
        back.pop()
        return back[-1]
    else:
        return ''

@login_required()
def addstuff(request):
    form = StuffForm()

    if request.method == 'POST':
        f = StuffForm(request.POST, instance=Stuff())
        if f.is_valid():
            new_stuff = f.save()
            #тут надо не перенаправлять, а возвращать форму добавления нового пожелания, где оборудование заполнено 
            #только что добавленными данными. 
            request.session['stuff'] = new_stuff.id
            #c = {'form':wishform, 'user':request.user, 'page_name':u'Новое пожелание', 'back':back(request.path), 'modif':'Добавить', 'wstat':"N"}
            #c.update(csrf(request))
            return HttpResponseRedirect("/new")

        else:
            c = {'form':f, 'user':request.user, 'back':'/new', 'page_name':u'Добавление в список', 'modif':'Добавить'}
            c.update(csrf(request))
            return render_to_response("add.html", c)
    else:
        c = {'form':form, 'user':request.user, 'back':'/new', 'page_name':u'Добавление в список', 'modif':'Добавить'}
        c.update(csrf(request))
        return render_to_response("add.html", c)

@login_required()
def reservedwishes(request):
    w = Wish.objects.filter(status='5', user=request.user.id)
    c = {'wishes':w, 'page_name':u'Отложенные заказы', 'user':request.user, 'status':False, 'newww':True, 'back':True}
    return render_to_response("wishes.html", c)
    
@login_required()
def completedwishes(request):
    w = Wish.objects.filter(status='3')
    c = {'wishes':w, 'page_name':u'Выполненные заказы', 'user':request.user, 'status':False, 'newww':True, 'back':True}
    return render_to_response("wishes.html", c)

@login_required()
def new(request):
    stuff_id =  request.session.get("stuff")
    stuff_name = request.session.get("stuff_name")
    if stuff_id:
        form = WishForm(initial = {'stuff':stuff_id})
    else:
        form = WishForm()

    if request.method == 'POST':
        form = WishForm(request.POST, instance=Wish())
        if form.is_valid():
            #Вначале сохраняем форму, добавляем новое пожелание
            new_wish = form.save()
            #а потом добавляем его в историю
            newevent = Event(wish=new_wish, oldstatus=' ', newstatus='0', user=request.user)
            newevent.save()
            return HttpResponseRedirect('/wishes')
        else:
            c = {'form':form, 'user':request.user, 'page_name':u'Новое пожелание', 'back':'/', 'modif':'Добавить', 'wstat':"0"}
            c.update(csrf(request))
            return render_to_response("add.html", c)

    else:
        c = {'form':form, 'user':request.user, 'page_name':u'Новое пожелание', 'back':'/', 'modif':'Добавить', 'wstat':"0"}
        c.update(csrf(request))
        return render_to_response("add.html", c)
