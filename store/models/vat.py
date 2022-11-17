""" VAT model """
from django.db import models

class VAT(models.Model):
  rate = models.FloatField()
  start_date = models.DateField(auto_now=True)

  class Meta:
    verbose_name = 'VAT rate'
    verbose_name_plural =  'VAT rates'
    ordering = ['start_date']

  def __str__(self):
    return f'{self.rate*100}% ({self.start_date})'
