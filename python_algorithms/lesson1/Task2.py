# 2. По введенным пользователем координатам двух
# точек вывести уравнение прямой вида y = kx + b,
# проходящей через эти точки.


x1 = float(input("Введите x1: "))
y1 = float(input("Введите y1: "))

x2 = float(input("Введите x2: "))
y2 = float(input("Введите y2: "))

a = y2 - y1
b = x1 - x2

if a == 0 and b == 0:
    print("Неверно заданы точки для прямой. Точки не могут совпадать")
else:
    c = x2 * y1 - x1 * y2
    k = -a / b
    b = - c / b
    print(f"y = {k} * x + {b}")
