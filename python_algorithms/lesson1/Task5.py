# 5. Пользователь вводит номер буквы в алфавите. Определить, какая это буква.


import string


a = int(input("Введите номер буквы в английском алфавите: "))
alphabet_dictionary = dict(zip([i for i in range(1, 27)], string.ascii_lowercase))
if a in alphabet_dictionary:
    print(f"Буква: {alphabet_dictionary[a]}")
else:
    print(f"Нет такого номера буквы")
