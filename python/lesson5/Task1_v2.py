# 1. Создать программно файл в текстовом формате,
# записать в него построчно данные, вводимые пользователем.
# Об окончании ввода данных свидетельствует пустая строка.


with open("task1_text.txt", 'a') as f_obj:
    while True:
        value = input("Ввод пустой строки - выход. Ведите строку для записи в файл: ")
        if value == "":
            break
        f_obj.write(f"{value}\n")