# 2. Реализовать функцию, принимающую несколько параметров,
# описывающих данные пользователя: имя, фамилия, год рождения,
# город проживания, email, телефон.
# Функция должна принимать параметры как именованные аргументы.
# Реализовать вывод данных о пользователе одной строкой.


def user(name, surname, year_of_birth, address, email, telephone):
    print(f"Имя: {name}, "
          f"Фамилия {surname}, "
          f"Год рождения {year_of_birth}, "
          f"Адресс {address}, "
          f"Почта {email}, "
          f"Номер{telephone}")


user(name="John",
     surname="Smith",
     year_of_birth="1950",
     address="NY",
     email="John.Smith@gmail.com",
     telephone="111 1222")
