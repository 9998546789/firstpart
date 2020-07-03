# 5. В массиве найти максимальный отрицательный элемент. Вывести на экран его значение и позицию в массиве.
# Примечание к задаче: пожалуйста не путайте «минимальный» и «максимальный отрицательный». Это два абсолютно разных значения.


import random
array_my = [random.randint(-50, -20) for _ in range(100)]


def get_max_negative_value(current_array):
    negative_values = [x for x in current_array if x < 0]
    max_negative_value = negative_values[0]
    for x in negative_values:
        if 0 > x > max_negative_value:
            max_negative_value = x
    return max_negative_value


print(array_my)
print(get_max_negative_value(array_my))
