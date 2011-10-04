# -*- coding: utf-8 -*-


from numpy import array
from django.shortcuts import render_to_response
from laborder.orders.forms import ContactForm
from django.core.mail import send_mail
from django.core.context_processors import csrf
from django.http import HttpResponseRedirect
from laborder.orders.models import Stuff
from django.contrib import auth

def main(request, template_name='login.html'):
    c = {}
    c.update(csrf(request))
    if 'username' in request.POST:
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
            c.update({'login_error':True})
            return render_to_response("login.html", c)
    else:
        return render_to_response('login.html', c)
        

def wishes(request):
    objs = Stuff.objects.order_by('stgroup')
    return render_to_response("base.html", {'stuff':objs, 'page_name':u'Список оборудования', 'username':request.user.username})

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

