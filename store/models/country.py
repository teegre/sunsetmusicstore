""" Country model """

from django.db import models

class Country(models.Model):
  """ A country and its 2 letters code. """

  name = models.CharField(max_length=50)
  code = models.CharField(max_length=2)

  def __str__(self):
    return f'{self.name}'
