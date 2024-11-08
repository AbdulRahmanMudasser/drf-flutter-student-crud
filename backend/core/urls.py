"""
URL configuration for core project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/5.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from students import views

urlpatterns = [
    path('admin/', admin.site.urls),
    path('student/create/', views.create_student, name='create_student'),
    path('students/', views.list_students, name='list_students'),
    path('student/<int:pk>/', views.student_details, name='student_details'),
    path('student/update/<int:pk>/', views.update_student, name='update_student'),
    path('student/delete/<int:pk>/', views.delete_student, name='delete_student'),
]
