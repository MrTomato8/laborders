# -*- coding: utf-8 -*-  

from django.conf.urls.defaults import *
from django.views.generic.simple import direct_to_template

# Uncomment the next two lines to enable the admin:
from django.contrib import admin
admin.autodiscover()

urlpatterns = patterns( 
    'laborder.views',
    # Example:
    (r'^wishes/', 'wishes'),
    (r'^logout/', 'logout'),
    # Uncomment the admin/doc line below to enable admin documentation:
    # (r'^admin/doc/', include('django.contrib.admindocs.urls')),

    # Uncomment the next line to enable the admin:
    (r'^admin/', include(admin.site.urls)),
    #главная страница, авторизация, после нее показ 
    #всего остального или же отказ при неправильном пароле.
    (r'^hello/$', 'hello'), 
    #или так:
    (r'^$', 'main'),    
    #(r'^$', direct_to_template, {'template':'base.html'}),                   
    #список наличного оборудования
    #(r'^available/$', show_avail),
    #список заказов                   
    #(r'^orders\$', show_orders),             
    #новый заказ
    #(r'^new_order\$'),
    
)
