# -*- coding: utf-8 -*-

from django.db import models

#посмотреть натипы полей в models и расписать нашу примерную 
#схему по классам.
#права пользователей
rights_choices = (
    ('B', 'Начальник'),#умеет одобрять, пишет комментарий и графу, откуда оплата.
    ('A', 'Администратор'),#не убрать. все может править и удалять
    ('E', 'Оператор'),#убрать
    ('U', 'Пользователь'),#видит все заказы, но не видит, кто заказал
    )

# и срочность!!!!1

#статусы заказов
status_choices = (
    ('N', 'Новый'), #New
    ('P', 'В рассмотрении'), #Pending лишнее
    ('A', 'Ободрен'), #Approved
    ('R', 'Отклонен'), #Rejected
    ('O', 'Ожидание счета'), #waiting for Order лишнее
    ('D', 'Ожидание поставки'), #waiting for Delivery лишнее
    ('R', 'Частично получен'), #partially Received лишнее
    # и добавить "отложен"
    ('C', 'Выполнен'), #Completed 
    )
#группы объектов
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
    """
    Класс для списка оборудования,
    когда-либо заказывавшегося
    """
    name_rus = models.CharField("название", max_length=50)
    name_exact = models.CharField("точное название", max_length=50)
    manuf = models.CharField("производитель", max_length=50)
    man_site = models.URLField("сайт производителя")
    cat_num = models.CharField("номер в каталоге", max_length=15)
    package = models.IntegerField("фасовка")
    group = models.CharField("группа", max_length=1, choices=group_choices)
    
    class Meta:
        verbose_name = "оборудование"
        verbose_name_plural = "оборудование"

    def __unicode__(self):
        return "{0} ({1})".format(self.name_rus, self.group)

class User(models.Model):
    """
    Класс для списка пользователей
    """
    name = models.CharField("логин", max_length=10)
    real_name = models.CharField("имя", max_length=30)
    passwd = models.CharField("пароль", max_length=30)
    email = models.EmailField("электронная почта")
    rights = models.CharField("права", max_length=1, choices=rights_choices)
    
    class Meta:
        verbose_name = "пользователь"
        verbose_name_plural = "пользователи"

    def __unicode__(self):
        return "%s" % self.real_name

class Order(models.Model):
    """
    Класс для заказов
    """
    stuff = models.ForeignKey(Stuff, verbose_name="оборудование")
    pieces = models.IntegerField("количество")
    price_man = models.DecimalField("цена производителя", max_digits=1000, decimal_places=2)#не обязательно, но с указанием валюты
    price_rus = models.DecimalField("фактическая цена", max_digits=1000, decimal_places=2)#не обязательно, но с указанием валюты
    order_date = models.DateTimeField("дата заказа", auto_now=True)
    user = models.ForeignKey(User, verbose_name="пользователь")
    # и срочность!!!!1
    status = models.CharField("статус заказа", max_length=1, choices=status_choices)
    order_num = models.CharField("номер заказа", max_length=30)
    g_letter = models.BooleanField("гарантийное письмо")
    comment = models.TextField("комментарий")
    
    class Meta:
        verbose_name = 'заказ'
        verbose_name_plural = 'заказы'

    def __unicode__(self):
        return "Заказ №{0}, {1} [{2}]".format(self.id, self.stuff, self.status)

class Balance(models.Model):
    """
    Класс для учета имеющегося оборудования 
    и расходников
    """
    stuff = models.ForeignKey(Stuff, verbose_name="оборудование")
    remains = models.IntegerField("остаток")
    
    class Meta:
        verbose_name = "остаток"
        verbose_name_plural = "остаток"
    
    def __unicode__(self):
        return "Осталось {0} {1}".format(self.stuff, self.remains)

