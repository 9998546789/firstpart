input_n = input("Введите число n: ")
result = 0
for i in range(1, 4):
    current = int("".join([input_n] * i))
    result += current
print(result)
