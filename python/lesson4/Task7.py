# 7. Реализовать генератор с помощью функции с ключевым словом yield,
# создающим очередное значение. При вызове функции должен создаваться объект-генератор.
# Функция должна вызываться следующим образом: for el in fact(n).
# Функция отвечает за получение факториала числа, а в цикле необходимо выводить только первые n чисел,
# начиная с 1! и до n!.
# Подсказка: факториал числа n — произведение чисел от 1 до n.
# Например, факториал четырёх 4! = 1 * 2 * 3 * 4 = 24.


# def fact(x):
#     def factorial_rec(i, value, acc):
#         if i >= value:
#             yield acc
#         else:
#             yield from factorial_rec(i + 1, value, acc * (i + 1))
#     return factorial_rec(0, x, 1)


def fact(x: int):
    acc = 1
    for item in range(1, x + 1):
        acc *= item
        yield acc


for el in fact(4):
    print(el)




