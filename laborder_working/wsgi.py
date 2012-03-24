#! /usr/bin/python

import sys
import os
import os.path

sys.path.insert(0, os.path.dirname(__file__))
sys.path.append('/media/MEDIA1/')
sys.path.append('/media/MEDIA1/laborder')
sys.path.append('/media/MEDIA1/laborder/orders')

os.environ['DJANGO_SETTINGS_MODULE'] = 'laborder.settings'

from django.core.handlers.wsgi import WSGIHandler
application = WSGIHandler()
