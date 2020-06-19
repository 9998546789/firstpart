# 2. Реализовать проект расчета суммарного расхода ткани на производство одежды.
# Основная сущность (класс) этого проекта — одежда, которая может иметь определенное название.
# К типам одежды в этом проекте относятся пальто и костюм.
# У этих типов одежды существуют параметры: размер (для пальто) и рост (для костюма).
# Это могут быть обычные числа: V и H, соответственно.
# Для определения расхода ткани по каждому типу одежды использовать формулы: для пальто (V/6.5 + 0.5),
# для костюма (2 * H + 0.3). Проверить работу этих методов на реальных данных.
# Реализовать общий подсчет расхода ткани.
# Проверить на практике полученные на этом уроке знания:
# реализовать абстрактные классы для основных классов проекта,
# проверить на практике работу декоратора @property.
from abc import ABC, abstractmethod


class Clothes(ABC):
    @abstractmethod
    def tissue_consumption(self):
        pass


class Coat(Clothes):
    def __init__(self, v: float):
        self.v = v

    @property
    def v(self):
        return self.__v

    @v.setter
    def v(self, v):
        if v < 0:
            raise ValueError('Значение параметра не может быть меньше нуля.')
        self.__v = v

    def tissue_consumption(self):
        return self.__v / 6.5 + 0.5


class Costume(Clothes):
    def __init__(self, h: float):
        self.h = h

    @property
    def h(self):
        return self.__h

    @h.setter
    def h(self, h):
        if h < 0:
            raise ValueError('Значение параметра не может быть меньше нуля.')
        self.__h = h

    def tissue_consumption(self):
        return 2 * self.h + 0.3


coat = Coat(10)
print(coat.tissue_consumption())


costume = Costume(10)
print(costume.tissue_consumption())