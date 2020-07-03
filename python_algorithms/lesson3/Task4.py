# 4. Определить, какое число в массиве встречается чаще всего.


import random
array_my = [random.randint(0, 10) for _ in range(50)]


def get_dictionary(current_array):
    dictionary = {}
    max_value = 0
    for x in current_array:
        if x in dictionary:
            dictionary[x] += 1
            if dictionary[x] > max_value:
                max_value = x
        else:
            dictionary[x] = 1
    return dictionary, max_value


print(get_dictionary(array_my))