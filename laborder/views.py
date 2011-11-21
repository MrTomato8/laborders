# -*- coding: utf-8 -*-


from numpy import array
from django.shortcuts import render_to_response
from laborder.orders.forms import ContactForm, WishForm, StuffForm
from django.core.mail import send_mail
from django.core.context_processors import csrf
from django.http import HttpResponseRedirect
from laborder.orders.models import Stuff, Wish
from django.contrib import auth
from django.contrib.auth.decorators import login_required
from django.db.models import Q


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
            c.update({'login_error':u'Попробуйте еще раз'})
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
    print 'wishform', wishform
    return render_to_response("extsearch.html", {'wish':wishform, 'stuff':stuffform, 'user':request.user, 'page_name':u'Расширенный поиск'})
    
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
            stgroup
            name_rus
            name_exact
            pieces
            price_man
            currency_man
            price_rus
            currency_rus
            user
            order_date
            status
            comment
            urgent
            manuf
            man_site
            cat_num
            package
            measure
            

            qset = (Q(stuff__name_rus__icontains=s) | Q(stuff__name_exact__icontains=s) | Q(stuff__cat_num__icontains=s))
            wish_list = Wish.objects.filter(qset)
            c = {'wishes':wish_list, 'page_name':u'Расширенный поиск %s' % s, 'user':request.user, 'status':False, 'back':True}

    wish_user = Wish.objects.filter(user=request.user.id)
    wish_other = Wish.objects.exclude(user=request.user.id)
    st_dict = {'delete':u'удалена', 'edit':u'изменена', 'add':u'добавлена'}
    if status is not False:
        st = st_dict.get(status, False)
    else:
        st = False
    c = {'wishes':wish_user, 'other_wishes':wish_other, 'page_name':u'Список заказов', 'user':request.user, 'status':False}
    c.update(csrf(request))
    return render_to_response("wishes.html", c)

@login_required()
def delete(request, num):
    #delete object
    #return httpredirect /wishes 
    w = Wish.objects.get(id=num)
    w.delete()
    return HttpResponseRedirect('/wishes')

@login_required()
def edit(request, num):
    wish = Wish.objects.get(id=num)
    form = WishForm(instance=wish)
    if request.method == 'POST':
        f = WishForm(request.POST, instance=wish)
        f.save()
        return HttpResponseRedirect('/wishes')
    c = {'form':form, 'title':u'Правка записи %s' % num, 'page_name':u'Правка записи %s' % num}
    c.update(csrf(request))
    return render_to_response("add.html", c)

@login_required()
def new(request):
    form = WishForm()
    
    if request.method == 'POST':
        f = WishForm(request.POST, instance=Wish())
        new_wish = f.save()
        return HttpResponseRedirect('/wishes')
    c = {'form':form, 'user':request.user, 'page_name':u'Новая запись'}
    c.update(csrf(request))
    return render_to_response("add.html", c)

