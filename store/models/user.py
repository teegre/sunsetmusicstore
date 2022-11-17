""" Custom user model """

import uuid

from django.db import models
from django.db.models import Q

from .address import Address

from django.contrib.auth.models import (
    BaseUserManager, AbstractBaseUser, PermissionsMixin
)

from phonenumber_field.modelfields import PhoneNumberField

class UserManager(BaseUserManager):
  def create_user(self, email, password=None):
    if not email:
      raise ValueError('Users must have an email address.')

    user = self.model(email=self.normalize_email(email))
    user.set_password(password)
    user.save()

    return user

  def create_superuser(self, email, password):
    user = self.create_user(email, password=password)
    user.is_superuser = True
    user.is_staff = True
    user.save()

    return user

class User(AbstractBaseUser, PermissionsMixin):
  """ A customer """
  user_id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
  objects = UserManager()
  email = models.EmailField(unique=True, db_index=True)
  first_name = models.CharField(max_length=127)
  last_name = models.CharField(max_length=127)
  phone_number = PhoneNumberField()
  business_customer = models.BooleanField(default=False)
  is_active = models.BooleanField(default=True)
  is_staff = models.BooleanField(default=False)
  USERNAME_FIELD = 'email'

  @property
  def has_address(self):
    """
    Return True if user has at least one address,
    False otherwise.
    """
    return Address.objects.filter(user=self.user_id).count() > 0

  @property
  def shipping_address(self):
    """
    Return user's shipping address(es) if any.
    """
    address = Address.objects.filter(
        Q(address_type=Address.SHIPPING) | Q(use_for_shipping=True),
        user=self.user_id
    )
    return address

  @property
  def billing_address(self):
    """
    Return user's billing address(es) if any.
    """
    address = Address.objects.filter(
        user=self.user_id,
        address_type=Address.BILLING
    )
    return address
