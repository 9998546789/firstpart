# 5. Реализовать класс Stationery (канцелярская принадлежность).
# Определить в нем атрибут title (название) и метод draw (отрисовка).
# Метод выводит сообщение “Запуск отрисовки.”
# Создать три дочерних класса Pen (ручка), Pencil (карандаш),
# Handle (маркер). В каждом из классов реализовать переопределение метода draw.
# Для каждого из классов методы должен выводить уникальное сообщение.
# Создать экземпляры классов и проверить,
# что выведет описанный метод для каждого экземпляра.


class Stationery:
    def __init__(self):
        self.title = "base"

    def draw(self):
        print(self.title)


class Pen(Stationery):
    def __init__(self):
        self.title = "Pen"

    def draw(self):
        print(self.title)


class Pencil(Stationery):
    def __init__(self):
        self.title = "Pencil"

    def draw(self):
        print(self.title)


class Handle(Stationery):
    def __init__(self):
        self.title = "Handle"

    def draw(self):
        print(self.title)


Pen().draw()
Pencil().draw()
Handle().draw()
