# 7. Реализовать проект «Операции с комплексными числами». Создайте класс «Комплексное число»,
# реализуйте перегрузку методов сложения и умножения комплексных чисел. Проверьте работу проекта,
# создав экземпляры класса (комплексные числа) и выполнив сложение и умножение созданных экземпляров.
# Проверьте корректность полученного результата.


class Complex:
    def __init__(self, a: float, b: float):
        self.a = a
        self.b = b

    @property
    def a(self): return self.__a

    @a.setter
    def a(self, a): self.__a = a

    @property
    def b(self): return self.__b

    @b.setter
    def b(self, b): self.__b = b

    def __str__(self):
        sign = "+" if self.b >= 0 else "-"
        return f"{self.a} {sign} {abs(self.b)}i"

    def __add__(self, other):
        return Complex(self.a + other.a, self.b + other.b)

    def __sub__(self, other):
        return Complex(self.a - other.a, self.b - other.b)

    def __mul__(self, other):
        return Complex(self.a * other.a - self.b * other.b, self.a * other.b - self.b * other.a)


complex1 = Complex(1, 2)
print(complex1)
complex2 = Complex(2, 1)
print(complex2)

print(complex1 + complex2)
print(complex1 * complex2)
