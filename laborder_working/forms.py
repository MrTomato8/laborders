# -*- coding: utf-8 -*-
from django import forms
from django.contrib import auth
 
class LoginForm(forms.Form):
    username = forms.CharField(label='Логин', max_length=30)
    password = forms.CharField(label='Пароль', widget=forms.PasswordInput)
 
    def clean(self):
        username = self.cleaned_data.get('username')
        password = self.cleaned_data.get('password')
 
        if username and password:
            self.user_cache = auth.authenticate(username=username, password=password)
            if self.user_cache is None:
                raise forms.ValidationError("Неправильная пара логин-пароль! Попробуйте еще раз.")
            elif not self.user_cache.is_active:
                raise forms.ValidationError("Аккаунт заблокирован.")
        return self.cleaned_data
 
    def get_user(self):
        return self.user_cache
