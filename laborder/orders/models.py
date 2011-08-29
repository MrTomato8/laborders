# -*- coding: utf-8 -*-

from django.db import models

#посмотреть натипы полей в models и расписать нашу примерную 
#схему по классам.

class Order(models.Model):
    """
    Класс для заказов
    """


class Stuff(models.Model):
    """
    Класс для списка оборудования,
    когда-либо заказывавшегося
    """

class User(models.Model):
    """
    Класс для списка пользователей
    """

class Balance(models.Model):
    """
    Класс для учета имеющегося оборудования 
    и расходников
    """
