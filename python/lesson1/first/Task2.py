import datetime

seconds = int(input("Введите секунды: "))
date = datetime.datetime.fromtimestamp(seconds).strftime("%A, %B %d, %Y %I:%M:%S")
print(date)
