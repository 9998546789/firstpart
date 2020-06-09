# 1. Реализовать скрипт, в котором должна быть предусмотрена
# функция расчета заработной платы сотрудника.
# В расчете необходимо использовать формулу:
# (выработка в часах * ставка в час) + премия.
# Для выполнения расчета для конкретных значений необходимо
# запускать скрипт с параметрами.


from sys import argv

script_name, work_time, rate, prize = argv
try:
    print("Имя скрипта: ", script_name)
    print(float(work_time) * float(rate) + float(prize))
except ValueError:
    print('Введите float')


#python Task1.py 10 10 5

