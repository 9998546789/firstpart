# 5. Создать (программно) текстовый файл, записать в него программно набор чисел,разделенных пробелами.
# Программа должна подсчитывать сумму чисел в файле и выводить ее на экран.


my_list = [123, 1234, 546, 3546]


with open("task5_text.txt", 'a+') as f_obj:
    f_obj.writelines([f"{item} " for item in my_list])
    f_obj.seek(0)
    figures = map(int, f_obj.read().strip().split(" "))
    print(len(list(figures)))
