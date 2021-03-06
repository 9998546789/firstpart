# 3. Реализовать функцию my_func(),
# которая принимает три позиционных аргумента,
# и возвращает сумму наибольших двух аргументов.


"""
Возвращает сумму наибольших двух аргументов
>>> my_func(1, 2, 3)
5
>>> my_func(1, 1, 1)
2
>>> my_func(-1, 2, 3)
5
"""


def my_func(var_1, var_2, var_3):
    sum_var = var_1 + var_2 + var_3
    return sum_var - min(var_1, var_2, var_3)

