from datetime import datetime, timedelta, date
from django.shortcuts import render, get_object_or_404 ,redirect
from django.http import HttpResponse, HttpResponseRedirect
from django.views import generic
from django.urls import reverse
from django.utils.safestring import mark_safe
import calendar
from konlpy.tag import Okt
import jpype
import os
from django.db.models import Sum
import operator
import csv
from .models import *
from .utils import Calendar
from .forms import EventForm

def index(request):
    return HttpResponse('hello')

class CalendarView(generic.ListView):
    model = Event
    template_name = 'cal/calendar.html'

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        d = get_date(self.request.GET.get('month', None))
        cal = Calendar(d.year, d.month)
        html_cal = cal.formatmonth(withyear=True)
        context['calendar'] = mark_safe(html_cal)
        context['prev_month'] = prev_month(d)
        context['next_month'] = next_month(d)
        context['cur_month'] = d
        return context

def get_date(req_month):
    if req_month:
        year, month = (int(x) for x in req_month.split('-'))
        return date(year, month, day=1)
    return datetime.today()

def prev_month(d):
    first = d.replace(day=1)
    prev_month = first - timedelta(days=1)
    month = 'month=' + str(prev_month.year) + '-' + str(prev_month.month)
    return month

def next_month(d):
    days_in_month = calendar.monthrange(d.year, d.month)[1]
    last = d.replace(day=days_in_month)
    next_month = last + timedelta(days=1)
    month = 'month=' + str(next_month.year) + '-' + str(next_month.month)
    return month

def event(request, event_id=None):
    instance = Event()
   
   
    if event_id:
        instance = get_object_or_404(Event, pk=event_id)
        
        newFlag = False
        analysis = instance.analysis
        


    else:
        instance = Event()
        newFlag = True
        analysis = Analysis()
    form = EventForm(request.POST or None, instance=instance)


    if request.POST and form.is_valid():
        
        newdiary = form.save()

        sentence = newdiary.description
        
        okt = Okt()

        sentences_tag = []
        
        morph = okt.pos(sentence)
        sentences_tag.append(morph)

        noun_adj_list = []
        result_feeling = []
        
        for sentence1 in sentences_tag:
            for testword, tag in sentence1:
                if tag in ['Noun','Adjective']:
                    dic = Dic.objects.filter(word = testword)
                    result_feeling.extend(dic)
                    noun_adj_list.append(testword)
            
        if not result_feeling:
        
            if event_id is None:
                analysis = Analysis(report = newdiary)
            else:
                analysis = Analysis.objects.get(report = newdiary)
        
  
            analysis.myfeeling = ' '
            analysis.feelings = [0,0,0,0,0]
            analysis.save()
        else:    
            happys = pleasures = hates = sadnesses = angers = 0
            n = len(result_feeling)
            for feel in result_feeling:
                happys += feel.happy
                pleasures += feel.pleasure
                hates += feel.hate
                sadnesses += feel.sadness
                angers += feel.anger
            rfeelings ={ '행복':happys/n, '기쁨':pleasures/n, '혐오':hates/n,'슬픔': sadnesses/n,'분노':angers/n }

            if abs((happys+pleasures)/n-(hates+sadnesses+angers)/n) < 10 :
                rmyfeeling = '보통'
            else:
                rmyfeeling = max(rfeelings.items(), key=operator.itemgetter(1))[0]

           
                    

            if event_id is None:
                analysis = Analysis(report = newdiary)
            else:
                analysis = Analysis.objects.get(report = newdiary)
            

            
            analysis.myfeeling = rmyfeeling
            analysis.feelings = list(rfeelings.values())
            analysis.save()
            analysis.feel = analysis.feelings
                
        return redirect('cal:event_edit',  newdiary.id )
       

    return render(request, 'cal/event.html', {'form': form, 'newFlag': newFlag,'analysis':analysis})
