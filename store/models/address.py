""" Address model """

from django.db import models
from django.core.exceptions import ValidationError

from .utils import validate_zipcode

class Address(models.Model):
  """ An address """

  BILLING = 0
  SHIPPING = 1

  ADDRESS_TYPE = [
    (BILLING, 'billing'),
    (SHIPPING, 'shipping'),
  ]

  # Title of address (example: 'home', 'work')
  title = models.CharField(max_length=64)
  address1 = models.CharField(max_length=127, null=False)
  address2 = models.CharField(max_length=127, blank=True)
  city = models.CharField(max_length=64)
  zipcode = models.CharField(max_length=15)
  country = models.ForeignKey('Country', on_delete=models.CASCADE, blank=False)
  user = models.ForeignKey('User', on_delete=models.CASCADE, blank=False)
  address_type = models.IntegerField(choices=ADDRESS_TYPE)
  # If True, also use current address for shipping.
  use_for_shipping = models.BooleanField(verbose_name='Use this address also for shipping')

  class Meta:
    verbose_name = 'Adresse'
    verbose_name_plural = 'Adresses'
    # Address title should be unique
    # Address should be unique
    constraints = [
        models.UniqueConstraint(
          fields=['title', 'user'],
          name='Unique address title'
        ),
        models.UniqueConstraint(
          fields=['address1', 'city', 'zipcode', 'country', 'user'],
          name='Unique address'
        ),
    ]

  def clean(self):
    """ Validation """
    super().clean()
    if not validate_zipcode(self.zipcode, self.country.code):
      raise ValidationError(
          {'zipcode': f'Invalid zipcode ({self.zipcode})'}
      )
    if self.address_type == self.SHIPPING and self.use_for_shipping:
      raise ValidationError(
          {'use_for_shipping': 'This address is already a shipping address !'}
      )

  def save(self):
    self.title = self.title.capitalize()
    self.address1 = self.address1.title()
    self.address2 = self.address2.title()
    self.city = self.city.upper()
    super().save()

  def __str__(self):
    if self.use_for_shipping:
      return f'{self.user.email} [ {self.title} ] ({self.ADDRESS_TYPE[self.address_type][1]}+shipping)'
    return f'{self.user.email} [ {self.title} ] ({self.ADDRESS_TYPE[self.address_type][1]})'
