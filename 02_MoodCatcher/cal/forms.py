from django.forms import ModelForm, DateInput,TextInput , Textarea
from cal.models import Event

class EventForm(ModelForm):
  class Meta:
    model = Event
    # datetime-local is a HTML5 input type, format to make date time show on fields
    widgets = {
      'diary_date': DateInput(attrs={'type': 'date'}, format='%Y-%m-%d'),
      # 'end_time': DateInput(attrs={'type': 'date'}, format='%Y-%m-%d'),
      'title': TextInput(attrs={'placeholder': 'Title'}),
      'description': Textarea(attrs={'placeholder': 'How was your Day?'}),
     
    }
    #fields = ['title', 'description', 'start_time']
    fields = '__all__'

  def __init__(self, *args, **kwargs):
    super(EventForm, self).__init__(*args, **kwargs)
    # input_formats parses HTML5 datetime-local input to datetime field
    self.fields['diary_date'].input_formats = ('%Y-%m-%d',)
    # self.fields['end_time'].input_formats = ('%Y-%m-%d',)
