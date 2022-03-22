from django.db import models
from django.urls import reverse

class Event(models.Model):
    title = models.CharField(max_length=200)
    description = models.TextField()
    diary_date = models.DateField(unique=True)
    # end_time = models.DateField()

    @property
    def get_html_url(self):
        url = reverse('cal:event_edit', args=(self.id,))
        return f'<a href="{url}"> {self.title} </a>'


class Analysis(models.Model):
    myfeeling = models.CharField(max_length=20) #나의 최종 기분
    report = models.OneToOneField(Event, on_delete=models.CASCADE)
    feelings = models.CharField(max_length=300) # 분석차트에 뿌릴기분

    def __str__(self):
        return f'{self.feelings,self.myfeeling}'


    
class Dic(models.Model):
    word = models.CharField(max_length = 50)
    happy =  models.IntegerField()
    pleasure = models.IntegerField()
    hate = models.IntegerField()
    sadness =  models.IntegerField()
    anger =  models.IntegerField()

    def __str__(self):
        return f'{self.word , self.happy , self.pleasure , self.hate , self.sadness , self.anger}'
