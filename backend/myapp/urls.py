from django.urls import path
from .views import image_upload

app_name = 'myapp'

urlpatterns = [
    path("upload", image_upload, name="upload"),
]
