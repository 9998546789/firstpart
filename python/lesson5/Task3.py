# 3. Создать текстовый файл (не программно), построчно записать фамилии сотрудников и величину их окладов.
# Определить, кто из сотрудников имеет оклад менее 20 тыс.,
# вывести фамилии этих сотрудников. Выполнить подсчет средней величины дохода сотрудников.


def salary_parse(input_str):
    return input_str.replace('\n', '').split()


def salary_parse_dict(lst):
    return {salary_parse(item)[0]: float(salary_parse(item)[1]) for item in lst}


try:
    with open("task3_text.txt", "r", encoding="utf-8") as f_obj:
        salaries = salary_parse_dict(f_obj.readlines())
        print(f"Получают меньше 20к {[name for name, salary in salaries.items() if salary < 200000]}")
        print(f"Средняя величина зп {sum(salaries.values()) / len(salaries)}")
except IOError:
    print('Ошибка чтения файла')
