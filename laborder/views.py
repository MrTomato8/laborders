# -*- coding: utf-8 -*-


from numpy import array
from django.shortcuts import render_to_response
from laborder.orders.forms import ContactForm
from django.core.mail import send_mail
from django.core.context_processors import csrf
from django.http import HttpResponseRedirect
from laborder.orders.models import Stuff

def main(request):
    return render_to_response("base.html", {'page_name':u'Начальная страница'})

def wishes(request):
    objs = Stuff.objects.order_by('stgroup')
    return render_to_response("base.html", {'stuff':objs, 'page_name':u'Список оборудования'})

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

