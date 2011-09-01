# -*- coding: utf-8 -*-

from django.db import models

#посмотреть натипы полей в models и расписать нашу примерную 
#схему по классам.

rights_choices = (
    ('B', 'Начальник'),
    ('A', 'Администратор'),
    ('E', 'Оператор'),
    ('U', 'Пользователь'),
    )

status_choices = (
    ('N', 'Новый'), #New
    ('P', 'В рассмотрении'), #Pending
    ('A', 'Ободрен'), #Approved
    ('R', 'Отклонен'), #Rejected
    ('O', 'Ожидание счета'), #waiting for Order
    ('D', 'Ожидание поставки'), #waiting for Delivery
    ('R', 'Частично получен'), #partially Received
    ('C', 'Выполнен'), #Completed
    )

group_choices = (
    ("C", "Культуральные"),
    ("P", "Пластик"),
    ("G", "Общелабораторные"),
    ("S", "Соли"),
    ("I", "ИФА АВ"),
    ("W", "Гели Вестерн"),
    ("O", "Канцелярия"),
    ("F", "Феремнты, наборы и т.д."),
    ("U", "Upd"),
    )

class Stuff(models.Model):
    """                                                                      Класс для списка оборудования,                                           когда-либо заказывавшегося                                               """
    name_rus = models.CharField(max_length=50)
    name_exact = models.CharField(max_length=50)
    manuf = models.CharField(max_length=50)
    man_site = models.URLField()
    cat_num = models.CharField(max_length=15)
    package = models.IntegerField()
    group = models.CharField(max_length=1, choices=group_choices)

    def __unicode__(self):
        return "{0} ({1})".format(self.name_rus, self.group)

class Users(models.Model):
    """
    Класс для списка пользователей
    """
    name = models.CharField(max_length=10)
    real_name = models.CharField(max_length=30)
    passwd = models.CharField(max_length=30)
    email = models.EmailField()
    rights = models.CharField(max_length=1, choices=rights_choices)

    def __unicode__(self):
        return "%s" % self.real_name

class Order(models.Model):
    """
    Класс для заказов
    """
    stuff = models.ForeignKey(Stuff)
    pieces = models.IntegerField()
    price_man = models.DecimalField(max_digits=1000, decimal_places=2)
    price_rus = models.DecimalField(max_digits=1000, decimal_places=2)
    order_date = models.DateTimeField(auto_now=True)
    user = models.ForeignKey(Users)
    status = models.CharField(max_length=1, choices=status_choices)
    order_num = models.CharField(max_length=30)
    g_letter = models.BooleanField()
    comment = models.TextField()
    
    def __unicode__(self):
        return "Заказ №{0}, {1} [{2}]".format(self.id, self.stuff, self.status)

class Balance(models.Model):
    """
    Класс для учета имеющегося оборудования 
    и расходников
    """
    stuff = models.ForeignKey(Stuff)
    remains = models.IntegerField()
    
    def __unicode__(self):
        return "Осталось {0} {1}".format(self.stuff, self.remains)
