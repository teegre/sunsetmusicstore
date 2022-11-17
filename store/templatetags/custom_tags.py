""" Custom tags """

from django import template
from django.db.models import Max

from store.utils import get_cart
from store.models import VAT
register = template.Library()

@register.filter
def cart_item_count(request):
  """ Return quantity in user's cart """
  cart = get_cart(request)
  if cart is None:
    return 0
  return sum(cart.values())

@register.filter
def cart_product_count(request, ref):
  """ Return quantity of product in cart """
  cart = get_cart(request)
  if ref in cart:
    return cart[ref]
  return 0

@register.filter
def add_css(field, css):
  """ Add a css class attribute to a form widget """
  return field.as_widget(attrs={'class': css})

@register.filter
def product_vat(price, user):
  """ Retourne le prix HT ou le prix TTC """
  if user.is_authenticated and user.business_customer:
    return price 
  else:
    vat = VAT.objects.latest('start_date').rate
    return price * (1 + vat) 
