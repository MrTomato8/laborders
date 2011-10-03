# -*- coding: utf-8 -*-

from django.db import models
from django.contrib.auth.models import User

#посмотреть на типы полей в models и расписать нашу примерную 
#схему по классам.
#права пользователей
rights_choices = (
    ('B', 'Начальник'),#умеет одобрять, пишет комментарий и графу, откуда оплата.
    #('A', 'Администратор'),#не убрать. все может править и удалять
    #('E', 'Оператор'),#убрать
    ('U', 'Пользователь'),#видит все заказы, но не видит, кто заказал
    )

# и срочность!!!!1

#статусы заказов
status_choices = (
    ('N', 'Новое'), #New
    ('D', 'Отложено'), #Delayed
    #('P', 'В рассмотрении'), #Pending лишнее
    ('A', 'Одобрено'), #Approved
    ('R', 'Отклонено'), #Rejected
    #('O', 'Ожидание счета'), #waiting for Order лишнее
    #('D', 'Ожидание поставки'), #waiting for Delivery лишнее
    #('R', 'Частично получен'), #partially Received лишнее
    # и добавить "отложен"
    ('C', 'Выполнено'), #Completed 
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
    man_site = models.URLField("сайт производителя", blank=True, null=True)
    cat_num = models.CharField("номер в каталоге", max_length=15, blank=True, null=True)
    package = models.CharField("фасовка", max_length=10, blank=True, null=True)
    group = models.CharField("группа", max_length=1, choices=group_choices)
    
    class Meta:
        verbose_name = "оборудование"
        verbose_name_plural = "оборудование"

    def __unicode__(self):
        return "{0} ({1})".format(self.name_rus, self.group)

class Wish(models.Model):
    """
    Класс для пожеланий
    """
    stuff = models.ForeignKey(Stuff, verbose_name="оборудование")
    pieces = models.IntegerField("количество")
    price_man = models.DecimalField("цена производителя", max_digits=1000, decimal_places=2, blank=True, null=True)#не обязательно, но с указанием валюты
    price_rus = models.DecimalField("фактическая цена", max_digits=1000, decimal_places=2, blank=True, null=True)#не обязательно, но с указанием валюты
    order_date = models.DateTimeField("дата заказа", auto_now=True)
    user = models.ForeignKey(User, verbose_name="пользователь")
    urgent = models.BooleanField("срочно")
    status = models.CharField("статус пожелания", max_length=1, choices=status_choices, default='N')
    comment = models.TextField("комментарий")
    
    class Meta:
        verbose_name = 'пожелание'
        verbose_name_plural = 'пожелания'

    def __unicode__(self):
        return "Пожелание №{0}, {1} [{2}]".format(self.id, self.stuff, self.status)


