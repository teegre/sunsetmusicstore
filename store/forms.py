""" Forms """

from decimal import Decimal

from django import forms
from django.db.models import F
from django.db.utils import IntegrityError
from allauth.account.forms import SignupForm
from django.utils import timezone

from phonenumber_field.formfields import PhoneNumberField

from .models import Address
from .models import Country
from .models import Order
from .models import OrderDetail
from .models import VAT
from .models import Country

class UserSignupForm(SignupForm):
  """ Custom sign up form inherited from allauth SignupForm """
  first_name = forms.CharField(
      max_length=127, 
      widget=forms.TextInput(
        attrs={'placeholder': 'Prénom'}
      )
  )
  last_name = forms.CharField(
    max_length=127,
    widget=forms.TextInput(
      attrs={'placeholder': 'Nom'}
    )
  )
  phone_number = PhoneNumberField(
      widget=forms.TextInput(
        attrs={'placeholder': 'Téléphone'}
      )
  )
  
  def custom_signup(self, request, user):
    user.first_name = self.cleaned_data['first_name']
    user.last_name = self.cleaned_data['last_name']
    user.phone_number = self.cleaned_data['phone_number']

    user.save()

class CheckoutAddressForm(forms.Form):
  """ Address form in checkout view """
  title = forms.CharField(
      max_length=64,
      widget=forms.TextInput(
        attrs={'placeholder': 'Titre (par exemple : Maison, Travail...)'}
      )
  )

  address1 = forms.CharField(
      max_length=127,
      widget=forms.TextInput(
        attrs={'placeholder': 'Adresse'}
      )
  )

  address2 = forms.CharField(
      max_length=127,
      required=False,
      widget=forms.TextInput(
        attrs={'placeholder': 'Complément d\'adresse'}
      )
  )
  zipcode = forms.CharField(
      max_length=15,
      widget=forms.TextInput(
        attrs={'placeholder': 'Code postal'}
      )
  )
  city = forms.CharField(
      max_length=64,
      widget=forms.TextInput(
        attrs={'placeholder': 'Ville'}
      )
  )

  billing = forms.BooleanField(
      required=False,
      widget=forms.CheckboxInput()
  )

  def __init__(self, *args, **kwargs):
    self.user = kwargs.pop('user', None)
    super().__init__(*args, **kwargs)

  def clean(self):
    cleaned_data = super().clean()
    address = Address()
    address.title = cleaned_data['title']
    address.address1 = cleaned_data['address1']
    address.address2 = cleaned_data['address2']
    address.zipcode = cleaned_data['zipcode']
    address.city = cleaned_data['city']
    address.country = Country.objects.get(pk=73)
    address.user = self.user

    if cleaned_data['billing']:
      address.address_type = Address.BILLING
      address.use_for_shipping = True
    elif not self.user.shipping_address and not self.user.billing_address:
      address.address_type = Address.SHIPPING
      address.use_for_shipping = False
    else:
      address.address_type = Address.BILLING
      address.use_for_shipping = False

    address.clean()

    try:
      address.save()
    except IntegrityError:
      self.add_error(None, 'Cette adresse existe déjà')

class AddressChoiceField(forms.ModelChoiceField):
  """ Custom ModelChoiceField """

  def label_from_instance(self, address):
    return f'{address.title} : {address.address1} - {address.zipcode} {address.city}'

class CheckoutForm(forms.Form):
  """ Checkout form """
  billing_address = AddressChoiceField(queryset=None)
  shipping_address = AddressChoiceField(queryset=None)

  def __init__(self, *args, **kwargs):
    """ Populate select input options with already known addresses """
    self.user = kwargs.pop('user', None)
    self.order_details = kwargs.pop('order_details', None)
    super().__init__(*args, **kwargs)
    
    self.fields['billing_address'].queryset = self.user.billing_address
    self.fields['shipping_address'].queryset = self.user.shipping_address
    
    if self.user.billing_address.count() == 1:
      self.fields['billing_address'].empty_label = None
    else:
      self.fields['billing_address'].empty_label = "Sélectionnez une adresse de facturation"


    if self.user.shipping_address.count() == 1:
      self.fields['shipping_address'].empty_label = None
    else:
      self.fields['shipping_address'].empty_label = 'Sélectionnez une adresse de livraison'

  def clean(self):
    cleaned_data = super().clean()
    # New order
    order = Order()
    order.user = self.user
    order.order_date = timezone.now()
    order.vat = VAT.objects.latest('start_date')
    order.shipping_address = cleaned_data['shipping_address']
    order.save()

    # Order details
    for item in self.order_details['details']:

      product = item['product']
      quantity = item['quantity']

      order_detail = OrderDetail()
      order_detail.order = order
      order_detail.product = product
      order_detail.quantity = quantity
      # update product quantity
      product.quantity = F('quantity') - quantity
      product.save()

      order_detail.price = round(item['total'], 2)
      order_detail.save()
