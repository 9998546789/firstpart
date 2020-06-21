# 2. Создайте собственный класс-исключение, обрабатывающий ситуацию деления на нуль.
# Проверьте его работу на данных, вводимых пользователем.
# При вводе пользователем нуля в качестве делителя программа
# должна корректно обработать эту ситуацию и не завершиться с ошибкой.


class OwnError(Exception):
    def __init__(self, txt):
        self.txt = txt


a = input("Введите положительное число a: ")
b = input("Введите положительное число b: ")

try:
    inp_a_data = int(a)
    inp_b_data = int(b)
    if inp_b_data == 0:
        raise OwnError("Деление на ноль!")
    result = inp_a_data / inp_b_data
except ValueError:
    print("Вы ввели не число")
except OwnError as err:
    print(err)
else:
    print(f"Все хорошо. Ваше число: {result}")