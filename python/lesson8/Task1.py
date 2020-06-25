# 1. Реализовать класс «Дата», функция-конструктор которого должна принимать дату в виде строки формата «день-месяц-год».
# В рамках класса реализовать два метода. Первый, с декоратором @classmethod,
# должен извлекать число, месяц, год и преобразовывать их тип к типу «Число».
# Второй, с декоратором @staticmethod, должен проводить валидацию числа,
# месяца и года (например, месяц — от 1 до 12). Проверить работу полученной структуры на реальных данных.
from collections import namedtuple


DateTime = namedtuple('DateTime', 'day month year')


class Date:
    def __init__(self, date_string):
        self.date_string = date_string

    @classmethod
    def get_day_month_year(cls, date_string):
        day, month, year = map(int, date_string.split('-'))
        return DateTime(day, month, year)

    @staticmethod
    def is_date_valid(day, month, year):
        return 1 <= day <= 31 and 1 <= month <= 12 and year >= 1


date_time = Date("10-10-2020")
get_day_month_year = Date.get_day_month_year("10-10-2020")
print(get_day_month_year)

print(Date.is_date_valid(get_day_month_year.day, get_day_month_year.month, get_day_month_year.year))


date_time2 = Date("0-0-2020")
get_day_month_year2 = Date.get_day_month_year("0-0-2020")
print(get_day_month_year2)

print(Date.is_date_valid(get_day_month_year2.day, get_day_month_year2.month, get_day_month_year2.year))
