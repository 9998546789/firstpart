# 1. Создать класс TrafficLight (светофор) и определить у него один
# атрибут color (цвет) и метод running (запуск).
# Атрибут реализовать как приватный. В рамках метода реализовать переключение
# светофора в режимы: красный, желтый, зеленый.
# Продолжительность первого состояния (красный) составляет 7 секунд,
# второго (желтый) — 2 секунды, третьего (зеленый) — на ваше усмотрение.
# Переключение между режимами должно осуществляться только в указанном порядке
# (красный, желтый, зеленый).
# Проверить работу примера, создав экземпляр и вызвав описанный метод.
# Задачу можно усложнить, реализовав проверку порядка режимов,
# и при его нарушении выводить соответствующее сообщение и завершать скрипт.


import enum
import time
from statemachine import StateMachine, State  # pip install python-statemachine


class TrafficLightColor(enum.Enum):
    red = (0, "Красный")
    yellow = (1, "Желтый")
    green = (1, "Зеленый")


class TrafficLightMachine(StateMachine):
    green = State(TrafficLightColor.green.value)
    yellow = State(TrafficLightColor.yellow.value)
    red = State(TrafficLightColor.red.value, initial=True)

    slowdown = green.to(yellow)
    stop = yellow.to(red)
    wait = red.to(yellow)
    go = yellow.to(green)

    def __print_current_state(self):
        print(f"Текущее состояние {self.current_state}")

    def running(self):
        while True:
            if self.is_yellow:
                self.stop()
            self.__print_current_state()
            time.sleep(7)

            self.wait()
            self.__print_current_state()
            time.sleep(2)

            self.go()
            self.__print_current_state()
            time.sleep(2)

            self.slowdown()
            self.__print_current_state()
            time.sleep(1)


traffic_light = TrafficLightMachine()
traffic_light.running()
