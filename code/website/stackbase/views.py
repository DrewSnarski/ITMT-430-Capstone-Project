from django.shortcuts import render

def index(request):
    return render(request, 'welcome.html')

def welcome(request):
    return render(request, 'welcome.html')

def register_1(request):
    return render(request, 'register_1.html')

def login(request):
    return render(request, 'login.html')

def register_2(request):
    return render(request, 'register_2.html')

def home(request):
    return render(request, 'home.html')

def profile(request):
    return render(request, 'profile.html')

def profile_edit(request):
    return render(request, 'profile_edit.html')

def question_ask(request):
    return render(request, 'question_ask.html')

def question_post(request):
    return render(request, 'question_post.html')

def question_list(request):
    return render(request, 'question_list.html')

def answer_comment(request):
    return render(request, 'answer_comment.html')
