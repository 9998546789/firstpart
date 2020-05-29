a = float(input("Начальное значениек Км: "))
b = float(input("Требуемое Км: "))
day = 1
while b > a:
    day = day + 1
    a = a + (a * 0.1)

print(day)
