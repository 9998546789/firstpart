# 3. Реализовать базовый класс Worker (работник),
# в котором определить атрибуты: name, surname, position (должность),
# income (доход). Последний атрибут должен быть защищенным и ссылаться
# на словарь, содержащий элементы: оклад и премия, например,
# {"wage": wage, "bonus": bonus}. Создать класс Position (должность)
# на базе класса Worker. В классе Position реализовать
# методы получения полного имени сотрудника (get_full_name)
# и дохода с учетом премии (get_total_income).
# Проверить работу примера на реальных данных
# (создать экземпляры класса Position, передать данные,


class Worker:
    def __init__(self, name, surname, position, wage, bonus):
        self.name = name
        self.surname = surname
        self.position = position
        self.__income = {"wage": wage, "bonus": bonus}


class Position(Worker):
    def get_full_name(self):
        return f"{self.name} {self.surname}"

    def get_total_income(self):
        return self._Worker__income["wage"] + self._Worker__income["bonus"]


curr_name = input("Введите имя")
curr_surname = input("Введите фамилию")
curr_position = input("Введите позицию")
curr_wage = float(input("wage"))
curr_bonus = float(input("bonus"))
pos = Position(curr_name, curr_surname, curr_position, curr_wage, curr_bonus)
print(pos.get_full_name())
print(pos.get_total_income())
