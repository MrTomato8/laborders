# -*- coding: utf-8 -*

from django import forms
from laborder.orders.models import Wish, Stuff

class ContactForm(forms.Form):
    subject = forms.CharField()
    email = forms.EmailField(required=False)
    message = forms.CharField(widget=forms.Textarea)
    
class WishForm(forms.ModelForm):
    class Meta:
        model = Wish
