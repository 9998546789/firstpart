# 5. Реализовать формирование списка, используя функцию range() и возможности генератора.
# В список должны войти четные числа от 100 до 1000 (включая границы).
# Необходимо получить результат вычисления произведения всех элементов списка.
# Подсказка: использовать функцию reduce().


from functools import reduce


def multiply(prev_el, el):
    return prev_el * el


print(reduce(multiply, [x for x in range(100, 1001) if x % 2 == 0]))
