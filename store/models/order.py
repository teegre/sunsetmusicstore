""" Order model """

import string
import random

from django.db import models
from django.apps import apps

class Order(models.Model):
  """ An order """
  order_ref = models.CharField(max_length=6, null=True, blank=True, unique=True, editable=False)
  user = models.ForeignKey('User', on_delete=models.CASCADE)
  order_date = models.DateTimeField(null=True)
  vat = models.ForeignKey('VAT', on_delete=models.CASCADE, null=True, blank=True)
  shipping_address = models.ForeignKey('Address', on_delete=models.CASCADE, null=True)
  shipped = models.BooleanField(default=False)
  shipped_date = models.DateTimeField(null=True)

  @property
  def total_amount(self):
    OrderDetail = apps.get_model('store.OrderDetail')
    return OrderDetail.objects.filter(
        order=self.id
    ).aggregate(sum=models.Sum('price'))['sum']

  def order_ref_generator(self):
    chars = string.ascii_uppercase + string.digits
    return ''.join(random.choice(chars) for _ in range(6))

  def save(self):
    if not self.order_ref:
      self.order_ref = self.order_ref_generator()
      while Order.objects.filter(order_ref=self.order_ref).exists():
        self.order_ref = self.order_ref_generator()
    super().save()

  def __str__(self):
    status = '[OK]' if self.shipped else '[x]'
    return f'{self.order_ref} {self.order_date.date()} ({self.user.first_name} {self.user.last_name}) {status}'
