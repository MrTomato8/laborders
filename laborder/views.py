# -*- coding: utf-8 -*-

#from django.http import HttpResponse
#from django.template import Template, Context
from numpy import array
#from django.template.loader import get_template
from django.shortcuts import render_to_response

def main(request):
    return render_to_response("base.html")

def hello(request):
    lst = range(1, 100)
    return render_to_response("hello.html", {'list':lst})

