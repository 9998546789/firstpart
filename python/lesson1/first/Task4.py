value = int(input("Введите число: "))
remainder = value % 10
last_part = value // 10
while last_part > 0:
    if remainder == 9:
        break
    if last_part % 10 > remainder:
        remainder = last_part % 10
    last_part = last_part // 10
print(remainder)
