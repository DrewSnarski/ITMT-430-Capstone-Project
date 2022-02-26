from django.urls import path
from . import views

app_name = 'stackbase'

urlpatterns = [
    path('', views.welcome, name="welcome"),
    path('register_1/', views.register_1, name="register_1"),
    path('login/', views.login, name="login"),
    path('register_2/', views.register_2, name="register_2"),
    path('home/', views.home, name="home"),
    path('profile/', views.profile, name="profile"),
    path('profile_edit/', views.profile_edit, name="profile_edit"),
    path('question_ask/', views.question_ask, name="question_ask"),
    path('question_post/', views.question_post, name="question_post"),
    path('question_list/', views.question_list, name="question_list"),
    path('answer_comment/', views.answer_comment, name="answer_comment"),
    
]
