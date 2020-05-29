revenue = float(input("Выручка: "))
expenses = float(input("Издержки: "))
if revenue > expenses:
    print("Компания в плюсе, милорд.")
    profit = revenue - expenses
    print(f"Рентабельность: {profit / revenue}")
    staff = int(input("Количество людей."))
    print(f"Отношение прибыли к сотрудникам: {profit / staff}")
elif revenue == expenses:
    print("Все ок")
else:
    print("убыток")
