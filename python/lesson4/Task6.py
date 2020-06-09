# 6. Реализовать два небольших скрипта:
# а) итератор, генерирующий целые числа, начиная с указанного,
# б) итератор, повторяющий элементы некоторого списка, определенного заранее.
# Подсказка: использовать функцию count() и cycle() модуля itertools.
# Обратите внимание, что создаваемый цикл не должен быть бесконечным.
# Необходимо предусмотреть условие его завершения.
# Например, в первом задании выводим целые числа, начиная с 3, а при достижении числа 10 завершаем цикл.
# Во втором также необходимо предусмотреть условие, при котором повторение элементов списка будет прекращено.
# python Task6.py 10 20 2


from sys import argv
from itertools import count
from itertools import cycle


script_name, start, stop, step = argv
try:
    print("Задание A:")
    print("Имя скрипта: ", script_name)
    for el in count(int(start), int(step)):
        if el > int(stop):
            break
        else:
            print(el)
except ValueError:
    print('Введите int')


print("Задание Б:")
array_alphabet = ["A", "B", "C", "D"]
iter_alphabet = cycle(array_alphabet)
for el in count(1):
    if el > len(array_alphabet):
        break
    else:
        print(next(iter_alphabet))



