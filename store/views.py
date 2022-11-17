""" Views """

import json
from datetime import timedelta

from django.contrib.auth.mixins import LoginRequiredMixin
from django.contrib.auth.decorators import login_required
from django.utils import timezone
from django.contrib import messages
from django.views import generic
from django.core.mail import send_mail
from django.template.loader import render_to_string
from django.core.exceptions import PermissionDenied
from django.template.response import TemplateResponse
from django.shortcuts import (
                      get_object_or_404, 
                      redirect, 
                      render, 
                      reverse,
                      HttpResponseRedirect
                    )

from allauth.account.views import SignupView

from .models import Category
from .models import Product
from .models import Order
from .models import OrderDetail
from .models import User

from .forms import (
            CheckoutAddressForm,
            CheckoutForm
          )

from store.utils import has_cart, get_cart, get_cart_content_details

def home_view(request):
  """ Index view """
  categories = Category.objects.filter(parent__isnull=True)

  now = timezone.now().date()
  products = Product.objects.filter(
      date_added__gt=now - timedelta(days=30),
      active=True).order_by('?')[:5]
  # ... just in case...
  if products.count() < 5:
    products = Product.objects.filter(active=True).order_by('?')[:5]

  context = { 'categories': categories, 'products': products }

  if not has_cart(request):
    request.session.set_test_cookie()
  return render(request, context=context, template_name='index.html')

class SubCategoryView(generic.ListView):
  """ Subcategories/products view """
  model = Category
  template_name = 'subcat.html'

  def get_context_data(self, **kwargs):
    pk = self.kwargs['pk']
    context = super().get_context_data(**kwargs)
    context['categories'] = Category.objects.filter(parent__isnull=True)
    context['parent'] = Category.objects.get(pk=pk)
    context['ancestors'] = Category.objects.with_tree_fields().ancestors(pk)
    context['subcategories'] = Category.objects.filter(parent=pk)

    # Activate products sorting...
    if not context['subcategories'].exists():
      sort_by = self.request.GET.get('sort')
      if sort_by is None:
        sort_by = '-date_added'
      context['products'] = Product.objects.filter(
          category=self.kwargs['pk'], active=True).order_by(sort_by)
    # elif context['subcategories'].exists():
      # TODO: Get random products from subcategories children...
    # pass
    else:
    # Or get 5 random products in the category (carousel).
      context['products'] = Product.objects.filter(
          category__in=Category.objects.filter(parent=pk),
          active=True).order_by('?')[:5]

    return context

class ProductView(generic.DetailView):
  """ Product view """
  model = Product
  template_name = 'product.html'
  context_object_name = 'product'

  slug_field = 'ref'
  slug_url_kwarg = 'ref'

  def get_context_data(self, **kwargs):
    context = super().get_context_data(**kwargs)
    context['categories'] = Category.objects.filter(parent__isnull=True)
    context['parent'] = Category.objects.get(pk=self.kwargs['ppk'])
    context['ancestors'] = Category.objects.with_tree_fields().ancestors(self.kwargs['ppk'])
    return context

def add_product(request, ref):
  """ Add a product to cart and redirect to previous view """
  # Get product
  # TODO: display a message if the product cannot be found,
  # instead of a 404 error.
  product = get_object_or_404(Product, ref=ref)

  if not has_cart(request):
    if request.session.test_cookie_worked():
      request.session.delete_test_cookie()
    else:
      raise PermissionDenied(
        """
        <h2>&#127850 Les <em>petits gâteaux</em> semblent desactivés sur votre navigateur.</h2>
        <p>Sans eux, <b>SunsetMusicStore®</b> ne pourra pas fonctionner correctement si
        vous désirez y effectuer des achats.</p>
        """
      )

  # Get cart from cookie or create a new one
  cart = get_cart(request)

  # Add product or increment quantity
  try:
    cart[product.ref] += 1
  except KeyError:
    cart[product.ref] = 1

  messages.info(request, f'Ajouté : {product.name}')
  response = HttpResponseRedirect(request.META.get('HTTP_REFERER'))
  response.set_cookie('cart', json.dumps(cart), samesite='lax', expires='Session')

  return response

def remove_product(request, ref):
  """ Remove a product from cart """
  cart = get_cart(request)
  if ref in cart:
    if not cart.pop(ref, None) is None:
      product = Product.objects.get(ref=ref)
      messages.info(request, f'Retiré : {product.name}')
      response = HttpResponseRedirect(request.META.get('HTTP_REFERER'))
      response.set_cookie('cart', json.dumps(cart), samesite='lax', expires='Session')
      return response
  return redirect(request.META.get('HTTP_REFERER'))

def empty_cart(request):
  """ Empty cart and redirect to home """
  if has_cart(request):
    messages.info(request, '&#x2139;&#xFE0F; Votre caddie est désormais vide...')
    response = HttpResponseRedirect(reverse('index'))
    response.delete_cookie('cart')
    request.session.set_test_cookie()
    return response

  return redirect(request.META.get('HTTP_REFERER'))

def inc_quantity(request, ref):
  """ Increment product quantity """
  cart = get_cart(request)
  if ref in cart:
    cart[ref] += 1
    response = HttpResponseRedirect(request.META.get('HTTP_REFERER'))
    response.set_cookie('cart', json.dumps(cart), samesite='lax', expires='Session')
    return response

  return redirect(request.META.get('HTTP_REFERER'))

def dec_quantity(request, ref):
  """ Decrement product quantity and redirect to cart view """
  cart = get_cart(request)
  if ref in cart:
    cart[ref] -= 1
    if cart[ref] <= 0:
      return remove_product(request, ref)
    response = HttpResponseRedirect(request.META.get('HTTP_REFERER'))
    response.set_cookie('cart', json.dumps(cart), samesite='lax', expires='Session')
    return response

  return redirect(request.META.get('HTTP_REFERER'))

class OrderView(LoginRequiredMixin, generic.ListView):
  """ Order view """
  model = OrderDetail
  template_name = 'cart.html'

  def get_context_data(self, **kwargs):
    context = super().get_context_data(**kwargs)
    context['order'] = Order.objects.get(pk=self.kwargs['pk'])
    context['details'] = OrderDetail.objects.filter(order=self.kwargs['pk'])
    return context

def cart_view(request):
  """ Cart view """
  context = get_cart_content_details(request)
  context['categories'] = Category.objects.filter(parent__isnull=True)

  if 'cart' in context:
    cart = context.pop('cart')
    response = HttpResponseRedirect(request.path)
    response.set_cookie('cart', json.dumps(cart), samesite='lax', expires='Session')
    return response

  return render(
      request,
      context=context,
      template_name='cart.html'
  )

def checkout_view(request):
  """ Checkout view """
  context = get_cart_content_details(request)

  # Redirect to index view if no context
  if not context:
    return redirect('index')

  user = request.user
  must_add_address = not user.billing_address or not user.shipping_address

  if request.method == 'POST':
    if must_add_address:
      form = CheckoutAddressForm(request.POST, user=request.user)
      if form.is_valid():
        return redirect(request.META.get('HTTP_REFERER'))
    else:
      form = CheckoutForm(
          request.POST,
          user=request.user,
          order_details=context
      )
      if form.is_valid():
        order_ref = Order.objects.filter(user=request.user).latest('id').order_ref
        return redirect('payment', order=order_ref)
        
  else:
    if must_add_address:
      form = CheckoutAddressForm()
    else:
      form = CheckoutForm(user=request.user)

  context['address_form'] = form

  context['categories'] = Category.objects.filter(parent__isnull=True)

  return render(
      request,
      context=context,
      template_name='checkout.html'
  )

@login_required
def payment_view(request, order):
  """ Payment view """
  order = get_object_or_404(Order, order_ref=order)

  return TemplateResponse(
      request,
      'payment.html',
      context={ 'order': order }
  )

@login_required
def thankyou_view(request, order):
  order = get_object_or_404(Order, order_ref=order)
  order_details = OrderDetail.objects.filter(order=order)
  context = {
      'order': order,
      'details': order_details,
  }
  subject = f'Votre commande n° {order.order_ref}'
  message = render_to_string('email.txt', context=context)
  to = f'{request.user.email}'
  try:
    send_mail(subject, message, from_email=None, recipient_list=[to])
  except ConnectionRefusedError:
    messages.error(
        request,
        '&excl; Suite à une erreur interne, l\'e-mail de confirmation n\'a pas pu être envoyé.'
    )

    messages.warning(
        request,
        'Vous pouvez toutefois consulter l\'état de votre commande dans votre profil utilisateur.'
    )

  messages.info(request, '&hearts; Merci pour votre achat !')
  return redirect('/view-cart/empty-cart')

class OrderListView(LoginRequiredMixin, generic.ListView):
  model = Order
  template_name = 'orderlist.html'

  def get_context_data(self, **kwargs):
    context = super().get_context_data(**kwargs)
    context['orders'] = Order.objects.filter(user=self.request.user)
    return context

class OrderDetailView(LoginRequiredMixin, generic.DetailView):
  """ Order detail view """
  model=OrderDetail
  template_name = 'order_details.html'

  def get_context_data(self, **kwargs):
    context = super().get_context_data(**kwargs)
    context['order'] = Order.objects.filter(order_ref=self.kwargs['order'])[0]
    context['orderdetails'] = OrderDetail.objects.filter(order=self.kwargs['pk'])
    return context

class UserSignupView(SignupView):
  template_name = 'account/signup.html'

class UserProfileView(LoginRequiredMixin, generic.DetailView):
  model = User;
  template_name = 'user_profile.html'
