# -*- coding: utf-8 -*-  

from django.conf.urls.defaults import *
from laborder.views import hello

# Uncomment the next two lines to enable the admin:
# from django.contrib import admin
# admin.autodiscover()

urlpatterns = patterns('',
    # Example:
    # (r'^laborder/', include('laborder.foo.urls')),

    # Uncomment the admin/doc line below to enable admin documentation:
    # (r'^admin/doc/', include('django.contrib.admindocs.urls')),

    # Uncomment the next line to enable the admin:
    # (r'^admin/', include(admin.site.urls)),
    #главная страница, авторизация, после нее показ 
    #всего остального или же отказ при неправильном пароле.
    (r'^/$', hello), 
    #список наличного оборудования
    #(r'^available/$', show_avail),
    #список заказов                   
    #(r'^orders\$', show_orders),             
    #новый заказ
    #(r'^new_order\$'),
    
)
