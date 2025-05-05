from django.shortcuts import render
# myapp/views.py

def home(request):
    return render(request, 'githubActions/home.html')
