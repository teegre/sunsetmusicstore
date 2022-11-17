""" Administration """
from django.contrib import admin

from store.models import User
from store.models import Address
from store.models import Category
from store.models import Product
from store.models import VAT
from store.models import Supplier
from store.models import Order
from store.models import OrderDetail

admin.site.register(User)
admin.site.register(Address)
admin.site.register(Supplier)
admin.site.register(Category)
admin.site.register(Product)
admin.site.register(VAT)
admin.site.register(Order)
admin.site.register(OrderDetail)
