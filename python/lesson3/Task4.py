# 4. Программа принимает действительное положительное число x и целое отрицательное число y.
# Необходимо выполнить возведение числа x в степень y.
# Задание необходимо реализовать в виде функции my_func(x, y).
# При решении задания необходимо обойтись без встроенной функции возведения числа в степень.
# Подсказка: попробуйте решить задачу двумя способами.
# Первый — возведение в степень с помощью оператора **.
# Второй — более сложная реализация без оператора **, предусматривающая использование цикла.


def exponentiation_rec(x: float, y: int, i, acc):
    if i < y:
        return exponentiation_rec(x, y, i + 1, acc * x)
    return acc


def my_func(x: float, y: int):
    return 1 / exponentiation_rec(x, abs(y), 0, 1)


print(my_func(5, -3) == 5 ** -3)
print(my_func(0.5, -3) == 0.5 ** -3)


