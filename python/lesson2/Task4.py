user_value = input("Введите строку: ")
arr = user_value.split()
for i in range(len(arr)):
    print(f"Номер: {i} текст {arr[i][:10]}")
