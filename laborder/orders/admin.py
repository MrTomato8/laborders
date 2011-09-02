from django.contrib import admin
from laborder.orders.models import Stuff, User, Order, Balance

admin.site.register(Stuff)
admin.site.register(User)
admin.site.register(Order)
admin.site.register(Balance)
