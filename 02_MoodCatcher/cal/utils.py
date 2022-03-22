from datetime import datetime, timedelta
from calendar import HTMLCalendar
from .models import Event,Analysis

class Calendar(HTMLCalendar):
	def __init__(self, year=None, month=None):
		self.year = year
		self.month = month
		super(Calendar, self).__init__()

	# formats a day as a td
	# filter events by day
	def formatday(self, day, events):
		events_per_day = events.filter(diary_date__day=day)
		
		d = ''
		diary_title = ''
		diary_color = ''
		
		dic = {'행복':'#FEF1FA', '기쁨':'#FFFE9F', '슬픔':'lightblue','분노':'crimson','혐오':'#777777',' ':'white','보통':'white'}
		for event in events_per_day:
			d = f'<li style="list-style:none;"> {event.get_html_url} </li>' # 요녀석이 등록 글 리스트
			diary_title = event.title
			diary_color = dic[event.analysis.myfeeling]
			
		if day != 0:
			return f"<td class='td-{day} day-elem' data-id='{diary_title}' bgcolor={diary_color}><span class='date'>{day}</span><ul> {d} </ul></td>"
			# 이녀석이 Day 찍는 부분.
			# td 에 id 나 class를 붙여서 td 블록으로 관리가 가능.
			# js로 해당 값의 style 을 주면 색 주는것도 이지 하지 싶네요.
		return '<td></td>'

	# formats a week as a tr
	def formatweek(self, theweek, events):
		week = ''
		for d, weekday in theweek:
			week += self.formatday(d, events)
		return f'<tr> {week} </tr>'

	# formats a month as a table
	# filter events by year and month
	def formatmonth(self, withyear=True):
		events = Event.objects.filter(diary_date__year=self.year, diary_date__month=self.month)

		cal = f'<table border="0" cellpadding="0" cellspacing="0" class="calendar">\n'
		#cal += f'{self.formatmonthname(self.year, self.month, withyear=withyear)}\n'
		cal += f'{self.formatweekheader()}\n'
		for week in self.monthdays2calendar(self.year, self.month):
			cal += f'{self.formatweek(week, events)}\n'
		return cal
