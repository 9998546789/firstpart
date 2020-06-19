# 1. Реализовать класс Matrix (матрица). Обеспечить перегрузку конструктора класса (метод __init__()),
# который должен принимать данные (список списков) для формирования матрицы.
# Подсказка: матрица — система некоторых математических величин, расположенных в виде прямоугольной схемы.
# Примеры матриц вы найдете в методичке.
# Следующий шаг — реализовать перегрузку метода __str__() для вывода матрицы в привычном виде.
# Далее реализовать перегрузку метода __add__() для реализации операции сложения двух объектов
# класса Matrix (двух матриц). Результатом сложения должна быть новая матрица.
# Подсказка: сложение элементов матриц выполнять поэлементно — первый элемент
# первой строки первой матрицы складываем с первым элементом первой строки второй матрицы и т.д.
from functools import reduce


class Matrix:
    def __init__(self, array2d):
        self.rows = self.get_rows_count(array2d)
        self.columns = self.get_columns_count(array2d)
        self.array2d = array2d

    def get_rows_count(self, array2d):
        return len(array2d)

    def get_columns_count(self, array2d):
        columns_in_rows = [len(x) for x in array2d]
        bad_rows = filter(lambda x: x != columns_in_rows[0], columns_in_rows)
        if len(list(bad_rows)) > 0:
            raise ValueError('Количество колонок во всех строках матрицы должно быть одинаково.')
        return columns_in_rows[0]

    def reducer_elements_func(self, el_prev, el):
        return f"{str(el_prev)}, {str(el)}"

    def __str__(self):
        string_rows = [f"{reduce(self.reducer_elements_func, x)} \n" for x in self.array2d]
        return reduce(lambda x1, x2: f"{x1}{x2}", string_rows)

    def add_matrices(self, c, d):
        return [[a + b for a, b in zip(row1, row2)] for row1, row2 in zip(c, d)]

    def __add__(self, other):
        if self.rows != other.rows or self.columns != other.columns:
            raise ValueError('Количество строк и колонок складываемых матриц должно быть одинаково.')
        sum = self.add_matrices(self.array2d, other.array2d)
        return Matrix(sum)


matrix1 = Matrix([[1, 2], [1, 3]])
print(matrix1)

matrix2 = Matrix([[1, 2], [1, 3]])
print(matrix1 + matrix2)


matrix4 = Matrix([[1, 2, 6], [1, 3, 4]])
matrix5 = Matrix([[1, 1, 1], [1, 1, 1]])

print(matrix4 + matrix5)

matrix6 = Matrix([[1, 2], [1, 3, 4]]) #ошибка Количество колонок во всех строках матрицы должно быть одинаково
matrix7 = matrix2 + matrix5 #ошибка Количество строк и колонок складываемых матриц должно быть одинаково.