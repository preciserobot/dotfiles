#!/usr/bin/env python
# -*- coding: utf-8 -*-

'''gets weather forecast from openweathermap'''

import sys
import json
import time
from urllib.request import urlopen
import codecs

apikey = '5f579dd6745778b8a2c52dc0ef759ddc'  #sys.argv[1]
location = 'London,uk'  # sys.argv[2]
#url = "http://api.openweathermap.org/data/2.5/forecast/city"
url = "http://api.openweathermap.org/data/2.5/weather"

url += "?q={location}&APPID={apikey}".format(location=location, apikey=apikey)

response = urlopen(url)
reader = codecs.getreader("utf-8")
obj = json.load(reader(response))

# string values
humidity = str(obj['main']['humidity'])
temp_min = str(int(obj['main']['temp_min'])-273)
temp = str(int(obj['main']['temp'])-273)
temp_max = str(int(obj['main']['temp_max'])-273)
weather = obj['weather'][0]['description']
sunrise = time.strftime('%H:%M', time.localtime(obj['sys']['sunrise']) )
sunset = time.strftime('%H:%M', time.localtime(obj['sys']['sunset']) )

print("{} ( {}%)".format(weather, humidity))
print(" {}°C ({}-{}°C)".format(temp, temp_min, temp_max))
print(" {} - {}".format(sunrise, sunset))

print(json.dumps(obj, sort_keys=True, indent=4, separators=(',', ': ')),file=sys.stderr)
