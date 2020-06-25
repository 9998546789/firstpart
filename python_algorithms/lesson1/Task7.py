# 7. Определить, является ли год,
# который ввел пользователь, високосным или не високосным.


year = int(input("Введите год: "))
year_type = ""
if year % 4 != 0:
    year_type = "usual year"
elif year % 100 == 0:
    if year % 400 == 0:
        year_type = "intercalary year"
    else:
        year_type = "usual year"
else:
    year_type = "intercalary year"

print(year_type)
