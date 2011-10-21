# -*- coding: utf-8 -*-


from numpy import array
from django.shortcuts import render_to_response
from laborder.orders.forms import ContactForm
from django.core.mail import send_mail
from django.core.context_processors import csrf
from django.http import HttpResponseRedirect
from laborder.orders.models import Stuff, Wish
from django.contrib import auth
from django.contrib.auth.decorators import login_required

def main(request, template_name='login.html'):
    c = {}
    c.update(csrf(request))
    if 'username' in request.POST:
        #если передаем данные из формы
        username = request.POST['username']
        password = request.POST['password']
        user = auth.authenticate(username=username, password=password)
        if user is not None and user.is_active:
        # Правильный пароль и пользователь "активен"
            auth.login(request, user)
        # Перенаправление на "правильную" страницу
            return HttpResponseRedirect("/wishes")
        else:
        # Отображение страницы с ошибкой
            c.update({'login_error':u'Попробуйте еще раз'})
            return render_to_response("login.html", c)
    else:
        #в противонм случае
        if request.user.is_authenticated():
            #если пользователь залогинен
            #то перенаправляем его куда надо
            return HttpResponseRedirect("/wishes")
        else:
            #если не залогинен, предлагаем это сделать. 
            return render_to_response('login.html', c)


def logout(request):
    auth.logout(request)
    return HttpResponseRedirect('/')

@login_required()
def wishes(request):
    wish_user = Wish.objects.filter(user=request.user.id)
    wish_other = Wish.objects.exclude(user=request.user.id)
    
    return render_to_response("base.html", {'wishes':wish_user, 'other_wishes':wish_other, 'page_name':u'Я хочу... Чтобы гоблины пришли и забрали тебя!', 'user':request.user})

@login_required()
def new(request):
    #
    pass

@login_required()
def delete(request, num):
    pass

@login_required()
def edit(request, num):
    pass

def hello(request):
    lst = request.META.items()
    if request.method == 'POST':
        form = ContactForm(request.POST)
        if form.is_valid():
            cd = form.cleaned_data
            send_mail(
                cd['subject'],
                cd['message'],
                cd.get('email', 'piggy@piggy.thruhere.net'),
                ['piggy@piggy.thruhere.net',],
                )
            return HttpResponseRedirect('/hello')
    else:
        form = ContactForm()
    c = {'form':form}
    c.update(csrf(request))
    return render_to_response("hello.html", c)

