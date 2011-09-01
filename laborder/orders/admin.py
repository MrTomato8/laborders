from django.contrib import admin
from laborder.orders.models import Stuff, Users, Order, Balance

admin.site.register(Stuff)
admin.site.register(Users)
admin.site.register(Order)
admin.site.register(Balance)
