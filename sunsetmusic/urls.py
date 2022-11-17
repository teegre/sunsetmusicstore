"""SunsetMusic URL Configuration"""

from django.contrib import admin
from django.urls import include, path
from store.views import UserSignupView

urlpatterns = [
    path('console/', admin.site.urls),
    path('accounts/', include('allauth.urls')),
    path(
      'accounts/signup',
      UserSignupView.as_view(),
      name='account_signup'
    ),
    path('', include('store.urls')),
]
