# 2. Создать текстовый файл (не программно),
# сохранить в нем несколько строк,
# выполнить подсчет количества строк,
# количества слов в каждой строке.


def words_count(input_str):
    return len(input_str.split(" "))


row_count = 0
try:
    with open("task2_text.txt", "r", encoding="utf-8") as f_obj:
        for line in f_obj:
            print(f"{line}")
            print(f"Количество слов в строке {words_count(line)}")
            row_count += 1
            print(f"Количество строк {row_count}")
except IOError:
    print('Ошибка чтения файла')
