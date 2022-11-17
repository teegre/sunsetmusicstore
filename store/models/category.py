""" Category model. """

from django.db import models
from django.urls import reverse
from .product import Product
from tree_queries.models import TreeNode

class Category(TreeNode):
  """ A category or a subcategory. """

  name = models.CharField(max_length=50)
  slug = models.SlugField()
  shortname = models.CharField(max_length=15, blank=True, null=True)
  priority = models.IntegerField()
  icon = models.CharField(
    max_length=50,
    blank=True,
    null=True,
  )

  class Meta:
    """ Meta """
    verbose_name_plural = 'categories'
    ordering = ['priority']

  @property
  def has_products(self):
    """ Return True if a subcategory has products """
    return Product.objects.filter(category=self.id).filter(active=True).count() > 0

  def get_absolute_url(self):
    return reverse('subcat', kwargs={'slug': self.slug, 'pk': self.id })

  def __str__(self):
    return f'{self.name} ({self.priority})'
