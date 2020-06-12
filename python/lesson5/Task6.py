# 6. Необходимо создать (не программно) текстовый файл,
# где каждая строка описывает учебный предмет и наличие лекционных,
# практических и лабораторных занятий по этому предмету и их количество.
# Важно, чтобы для каждого предмета не обязательно были все типы занятий.
# Сформировать словарь, содержащий название предмета и общее количество занятий по нему. Вывести словарь на экран.
# Примеры строк файла:
# Информатика: 100(л) 50(пр) 20(лаб).
# Физика: 30(л) — 10(лаб)
# Физкультура: — 30(пр) —
#
# Пример словаря:
# {“Информатика”: 170, “Физика”: 40, “Физкультура”: 30}


def hours_parse(input_str):
    return input_str.split(":")


def hours_sum(input_str):
    result = [int(in_s) for s in input_str.split() for in_s in s.split(r"(") if in_s.isdigit()]
    return sum(result)


def hours_parse_dict(lst):
    return {hours_parse(item)[0]: hours_sum(hours_parse(item)[1]) for item in lst}


try:
    with open("task6_text.txt", "r", encoding="utf-8") as f_obj:
        print(hours_parse_dict(f_obj.readlines()))
except IOError:
    print('Ошибка чтения файла')
