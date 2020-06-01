my_list = []
while True:
    user_value = int(input("Введите элемент: "))
    length_array = len(my_list)
    if length_array == 0:
        my_list.append(user_value)
    else:
        for i in range(length_array):
            if user_value >= my_list[i]:
                my_list.insert(i, user_value)
                break
            if i == length_array - 1:
                my_list.append(user_value)
    print(my_list)
