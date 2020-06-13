# 7. Создать (не программно) текстовый файл, в котором каждая строка должна содержать данные о фирме: название, форма собственности, выручка, издержки.
# Пример строки файла: firm_1 ООО 10000 5000.
# Необходимо построчно прочитать файл, вычислить прибыль каждой компании, а также среднюю прибыль.
# Если фирма получила убытки, в расчет средней прибыли ее не включать.
# Далее реализовать список. Он должен содержать словарь с фирмами и их прибылями, а также словарь со средней прибылью.
# Если фирма получила убытки, также добавить ее в словарь (со значением убытков).
# Пример списка: [{“firm_1”: 5000, “firm_2”: 3000, “firm_3”: 1000}, {“average_profit”: 2000}].
# Итоговый список сохранить в виде json-объекта в соответствующий файл.
# Пример json-объекта:
# [{"firm_1": 5000, "firm_2": 3000, "firm_3": 1000}, {"average_profit": 2000}]
#
# Подсказка: использовать менеджеры контекста.


import statistics
import json


def average_profit(values_list):
    return {"average_profit": statistics.mean(values_list)}


def company_data(row, index):
    return float(row.replace(r"\n", "").split()[index])


def profit_dict(lst):
    return {item.split()[0]: company_data(item, 2) - company_data(item, 3) for item in lst if
            company_data(item, 3) < company_data(item, 2)}


try:
    with open("task7_read.txt", "r", encoding="utf-8") as f_obj:
        d = profit_dict(f_obj.readlines())
        result = [d, average_profit(d.values())]
        print(result)
        with open("task7_write.json", "w") as write_f:
            json.dump(result, write_f)
except IOError:
    print('Ошибка чтения файла')
