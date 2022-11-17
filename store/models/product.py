""" Product model. """

import os
from datetime import timedelta

from django.db import models
from django.urls import reverse
from django.utils import timezone

from .utils import images_path


class Product(models.Model):
  """ A product. """

  ref = models.CharField(max_length=15, blank=False)
  name = models.CharField(max_length=50, blank=False)
  short_desc = models.CharField(max_length=100, default=None)
  desc = models.TextField()
  price = models.FloatField()
  pic = models.FilePathField(path=images_path, max_length=255, blank=False)
  quantity = models.IntegerField()
  category = models.ForeignKey('Category', on_delete=models.CASCADE, default=None)
  supplier = models.ForeignKey('Supplier', on_delete=models.CASCADE)
  date_added = models.DateTimeField(auto_now_add=True)
  active = models.BooleanField(default=True)

  class Meta:
    ordering = ['-date_added']

  @property
  def pic_static_path(self):
    """ Picture static filepath """
    return os.path.join('store/img', os.path.split(self.pic)[1])

  @property
  def is_new(self):
    """ Return True if product was added within 1 month """
    limit = timezone.now().date() - timedelta(days=30)
    return self.date_added.date() > limit

  def save(self, *args, **kwargs):
    """ Store pic filename only """
    self.pic = os.path.basename(self.pic)
    super(Product, self).save(*args, **kwargs)

  def get_absolute_url(self):
    return reverse(
        'product',
        kwargs={
          'slug': self.category.slug,
          'ppk': self.category.id,
          'ref': self.ref
        }
    )

  def __str__(self):
    return f'{self.name} ({self.ref})'
