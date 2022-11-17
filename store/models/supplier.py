""" Supplier model. """

import os

from django.db import models
from .utils import validate_digit, images_path

class Supplier(models.Model):
  """ A supplier (brand). """

  # Supplier unique id: can be DUNS or SIRET number for France.
  # Since a supplier may not have a DUNS number (which is made up of 9 digits),
  # uid field max length is set to 15.
  uid = models.CharField(max_length=15, unique=True, blank=False, validators=[validate_digit])
  name = models.CharField(max_length=50, blank=False)
  shortname = models.CharField(max_length=25)
  address = models.CharField(max_length=50, blank=False)
  zipcode = models.CharField(max_length=10, blank=False, validators=[validate_digit])
  city = models.CharField(max_length=50)
  country = models.ForeignKey('Country', on_delete=models.CASCADE, null=True, blank=False)
  contact = models.CharField(max_length=25, blank=False)
  phone = models.CharField(max_length=15, blank=False)
  email = models.EmailField(blank=False)
  # TODO: Do not store full path!
  pic = models.FilePathField(path=images_path, max_length=255, null=True, blank=False)

  @property
  def pic_static_path(self):
    """ Picture static filepath """
    return os.path.join('store/img', os.path.split(self.pic)[1])

  def __str__(self):
    return f'{self.name}'
