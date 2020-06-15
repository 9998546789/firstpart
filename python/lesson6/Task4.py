# 4. Реализуйте базовый класс Car.
# У данного класса должны быть следующие атрибуты:
# speed, color, name, is_police (булево).
# А также методы: go, stop, turn(direction),
# которые должны сообщать, что машина поехала,
# остановилась, повернула (куда).
# Опишите несколько дочерних классов:
# TownCar, SportCar, WorkCar, PoliceCar.
# Добавьте в базовый класс метод show_speed,
# который должен показывать
# текущую скорость автомобиля. Для классов TownCar
# и WorkCar переопределите метод show_speed.
# При значении скорости свыше 60 (TownCar) и 40 (WorkCar)
# должно выводиться сообщение о превышении скорости.
# Создайте экземпляры классов, передайте значения атрибутов.
# Выполните доступ к атрибутам, выведите результат.
# Выполните вызов методов и также покажите результат.


class Car:
    def __init__(self, speed, color, name, is_police):
        self.speed = speed
        self.color = color
        self.name = name
        self.is_police = is_police

    def go(self):
        print("Машина поехала")

    def stop(self):
        print("Машина остановлена")

    def turn(self):
        print("Машина поворачивает")

    def show_speed(self):
        print(f"show_speed base {self.speed}")


class TownCar(Car):
    def __init__(self, speed, color, name):
        super().__init__(speed, color, name, False)

    def show_speed(self):
        print(f"show_speed TownCar {self.speed}")
        if self.speed > 60:
            print("Превышение")


class SportCar(Car):
    def __init__(self, speed, color, name):
        super().__init__(speed, color, name, False)


class WorkCar(Car):
    def __init__(self, speed, color, name):
        super().__init__(speed, color, name, False)

    def show_speed(self):
        print(f"show_speed WorkCar {self.speed}")
        if self.speed > 40:
            print("Превышение")


class PoliceCar(Car):
    def __init__(self, speed, color, name):
        super().__init__(speed, color, name, True)


town_car = TownCar(100, "red", "Mazda")
sport_car = SportCar(150, "green", "BMW")
work_car = WorkCar(90, "green", "VW")
police_car = PoliceCar(50, "green", "UAZ")

print("TownCar")
town_car.show_speed()
town_car.go()
town_car.stop()
town_car.turn()

print("SportCar")
sport_car.show_speed()
sport_car.go()
sport_car.stop()
sport_car.turn()

print("WorkCar")
work_car.show_speed()
work_car.go()
work_car.stop()
work_car.turn()

print("PoliceCar")
police_car.show_speed()
police_car.go()
police_car.stop()
police_car.turn()

