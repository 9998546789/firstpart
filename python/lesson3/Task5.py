# 5. Программа запрашивает у пользователя строку чисел, разделенных пробелом.
# При нажатии Enter должна выводиться сумма чисел.
# Пользователь может продолжить ввод чисел, разделенных пробелом и снова нажать Enter.
# Сумма вновь введенных чисел будет добавляться к уже подсчитанной сумме.
# Но если вместо числа вводится специальный символ, выполнение программы завершается.
# Если специальный символ введен после нескольких чисел,
# то вначале нужно добавить сумму этих чисел к полученной ранее сумме и после этого завершить программу.


def iter_str_rec(array, i, acc):
    try:
        if i < len(array):
            return iter_str_rec(array, i + 1, acc + int(array[i]))
        return acc
    except ValueError:
        return acc


sum_str = 0
while True:
    str_input = input("Введите строку чисел")
    sum_str += iter_str_rec(str_input.split(), 0, 0)
    print(sum_str)