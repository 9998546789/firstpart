# 4. Создать (не программно) текстовый файл со следующим содержимым:
# One — 1
# Two — 2
# Three — 3
# Four — 4
# Необходимо написать программу, открывающую файл на чтение и считывающую построчно данные.
# При этом английские числительные должны заменяться на русские.
# Новый блок строк должен записываться в новый текстовый файл.


from googletrans import Translator


def translate(input_str):
    translator = Translator()
    result = translator.translate(input_str, src='en', dest='ru')
    return f'{result.origin} -> {result.text}'


with open("task4_text.txt", "r", encoding="utf-8") as f_obj:
    for el in f_obj.readlines():
        print(translate(el.split()[0]))
