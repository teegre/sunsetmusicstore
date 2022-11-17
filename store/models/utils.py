""" Models utility functions. """
import os

from django.core.exceptions import ValidationError
from django.utils.translation import gettext_lazy
from django.conf import settings

def validate_digit(value):
  """ Check whether a string contains only digits. """
  if not value.isdigit():
    raise ValidationError(
      gettext_lazy('%(value)s is not a number.'),
      params={'value': value,}
    )

def images_path():
  """ Prepend static file path to picture file. """
  return os.path.join(settings.BASE_DIR, 'store/static/store/img')

def get_zipcode_validator(country_code):
  """
  Get zipcode validator for the given country code.
  This function returns a validator from the module :
  localflavor.country_code.forms 
  'country_code' is a two characters string, i.e. fr, uk, us...
  Depending on the country, localflavor classes/fields for zipcode
  may have different names :
    - PostcodeField
    - PostCodeField
    - PostalCodeField
    - ZipCodeField
  For these classes, uppercase country code is prepended to the class name, i.e.:
    FRZipCodeField.
  """
  module_path = f'localflavor.{country_code.lower()}'
  try:
    module = __import__(module_path, fromlist=['forms'])
  except ImportError:
    return lambda x: x

  fieldname_variants = [
      'PostcodeField',
      'PostCodeField',
      'PostalCodeField',
      'ZipCodeField',
  ]

  for variant in fieldname_variants:
    fieldname = f'{country_code.upper()}{variant}'
    if hasattr(module.forms, fieldname):
      return getattr(module.forms, fieldname)().clean

  return lambda x: x

def validate_zipcode(zipcode, country_code):
  """
    Return True if zipcode is valid
    or if no validator could be found for the given country.
    Return False otherwise...
  """
  try:
    get_zipcode_validator(country_code)(zipcode)
  except ValidationError:
    return False
  return True
