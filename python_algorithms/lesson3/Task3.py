# 3. В массиве случайных целых чисел поменять местами минимальный и максимальный элементы.

import random
array_my = [random.randint(0, 50) for _ in range(100)]


def get_max_min_value(current_array):
    max_value, min_value = 0, 0
    for x in current_array:
        if x > max_value:
            max_value = x
        if x < min_value:
            min_value = x
    return (max_value, min_value)


print(array_my)
print(get_max_min_value(array_my))

