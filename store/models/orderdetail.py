""" OrderDetail model. """

from django.db import models
from django.urls import reverse

class OrderDetail(models.Model):
  """ A product in an order. """
  order = models.ForeignKey('Order', on_delete=models.CASCADE)
  product = models.ForeignKey('Product', on_delete=models.CASCADE)
  quantity = models.IntegerField(default=0)
  price = models.FloatField()

  def __str__(self):
    return f'{self.order}: {self.product.ref} x{self.quantity}'
