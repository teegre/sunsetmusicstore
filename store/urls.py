""" URLs """

from django.urls import path, re_path
from . import views

urlpatterns = [
  # Home
  path('', views.home_view, name='index'),


  # Subcategories
  path(
    'category/<slug:slug>-<int:pk>',
    views.SubCategoryView.as_view(),
    name='subcat'
  ),

  # Sort products
  re_path(
    r'^category/<slug:slug>-<int:pk>\?sort=[\w]$',
    views.SubCategoryView.as_view(),
    name='subcat'
  ),

  # Product
  path(
    'category/<slug:slug>-<int:ppk>/product/<slug:ref>',
    views.ProductView.as_view(),
    name='product'
  ),

  # Cart
  path('view-cart', views.cart_view, name='cart'),

  # Add to cart
  path(
    'product/<slug:ref>/add-product',
    views.add_product,
    name='add-product'
  ),

  # Remove from cart
  path(
    'view-cart/<slug:ref>/remove-product',
    views.remove_product,
    name='remove-product'
  ),

  # Empty cart
  path(
    'view-cart/empty-cart',
    views.empty_cart,
    name='empty-cart'
  ),

  # Increment quantity
  path(
    'view-cart/<slug:ref>/inc',
    views.inc_quantity,
    name='inc-quantity'
  ),

  # Decrement quantity
  path(
    'view-cart/<slug:ref>/dec',
    views.dec_quantity,
    name='dec-quantity'
  ),

  # Checkout
  path(
    'checkout',
    views.checkout_view,
    name='checkout'
  ),

  # Payment
  path(
      'payment/<slug:order>',
      views.payment_view,
      name='payment'
  ),

  path(
      'payment/<slug:order>/thankyou',
      views.thankyou_view,
      name='thankyou'
  ),

  # User profile
  path(
      'accounts/<str:pk>/profile',
      views.UserProfileView.as_view(),
      name='profile'
  ),

  # Order list
  path(
      'accounts/profile/orders',
      views.OrderListView.as_view(),
      name='orders'
  ),

  # Order details
  path(
      'accounts/profile/orders/<slug:order>/<int:pk>',
      views.OrderDetailView.as_view(),
      name='order-details'
  ),
]
