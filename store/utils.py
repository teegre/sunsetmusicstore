""" General utility functions """

import json

from django.contrib import messages
from store.models import Product, VAT

def get_cart(request):
  """ Return cart if any or None """
  try:
    cart = json.loads(request.COOKIES.get('cart'))
    return cart
  except TypeError:
    return {}

def has_cart(request):
  """ Return True if a user has a cart """
  return request.COOKIES.get('cart') is not None

def get_product_vat(price, user):
  """ Retourne le prix HT ou le prix TTC """
  if user.is_authenticated and user.business_customer:
    return price
  else:
    vat = VAT.objects.latest('start_date').rate
    return round(price * (1 + vat), 2)

def get_cart_content_details(request):
  """ 
  Return cart content details, ready to use
  in a view as context object.
  """
  
  if not has_cart(request):
    return {}

  cart = get_cart(request)
  products = Product.objects.filter(ref__in=cart.keys())

  problematic_products = []
  
  order_details = []
  total = 0
  itemcount = 0

  for ref, quantity in cart.items():
    if quantity > 0: # We never know...
      try:
        product = products.get(ref=ref)
      except Product.DoesNotExist:
        messages.error(request,
            f"""
            &#128561; Une erreur est survenue sur le produit référencé {ref}.
            Il a été retiré de votre caddie...
            """
        )

        problematic_products.append(ref)
        continue

      product_total = round(get_product_vat(product.price * quantity, request.user), 2)

      order_details.append(
          {
            'product': product,
            'quantity': quantity,
            'total': product_total
          }
      )

      total += product_total
      itemcount += quantity

  totalvat = round(total - (total / (1 + VAT.objects.latest('start_date').rate)), 2)

  if problematic_products:
    for ref in problematic_products:
      cart.pop(ref)

    return {'details': order_details, 'total': total, 'itemcount': itemcount, 'totalvat': totalvat, 'cart': cart}
    
  return {'details': order_details, 'total': total, 'itemcount': itemcount, 'totalvat': totalvat}
