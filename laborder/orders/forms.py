# -*- coding: utf-8 -*

from django import forms
from laborder.orders.models import Wish, Stuff

class ContactForm(forms.Form):
    subject = forms.CharField()
    email = forms.EmailField(required=False)
    message = forms.CharField(widget=forms.Textarea)

class StuffForm(forms.ModelForm):
    class Meta:
        model = Stuff
        
        #exclude = ()
    #def __init__(self, *args, **kwargs):
    #    super(StuffForm, self).__init__(*args, **kwargs)

    #    for key in self.fields:
    #        self.fields[key].required = False

class WishForm(forms.ModelForm):
    class Meta:
        model = Wish
        exclude = ('user',)
        #fields = ('order_date',)
    #def __init__(self, *args, **kwargs):
    #    super(WishForm, self).__init__(*args, **kwargs)

    #    for key in self.fields:
    #        self.fields[key].required = False

