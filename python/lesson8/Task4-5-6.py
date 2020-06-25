# 4. Начните работу над проектом «Склад оргтехники».
# Создайте класс, описывающий склад. А также класс «Оргтехника», который будет базовым для классов-наследников.
# Эти классы — конкретные типы оргтехники (принтер, сканер, ксерокс).
# В базовом классе определить параметры, общие для приведенных типов.
# В классах-наследниках реализовать параметры, уникальные для каждого типа оргтехники.

# 5. Продолжить работу над первым заданием. Разработать методы,
# отвечающие за приём оргтехники на склад и передачу в определенное подразделение компании.
# Для хранения данных о наименовании и количестве единиц оргтехники, а также других данных,
# можно использовать любую подходящую структуру, например словарь.

# 6. Продолжить работу над вторым заданием.
# Реализуйте механизм валидации вводимых пользователем данных.
# Например, для указания количества принтеров, отправленных на склад,
# нельзя использовать строковый тип данных.
# Подсказка: постарайтесь по возможности реализовать в проекте
# «Склад оргтехники» максимум возможностей, изученных на уроках по ООП.
import json


class OfficeEquipment:
    def __init__(self, name: str, part_number: int, company_id: int):
        self.name = name
        self.part_number = part_number
        self.company_id = company_id

    def __str__(self):
        return str(type(self))


class Printer(OfficeEquipment):
    def __init__(self, name, part_number, company_id, paper_type: int):
        super().__init__(name, part_number, company_id)
        self.paper_type = paper_type


class Scanner(OfficeEquipment):
    def __init__(self, name, part_number, company_id, glass_type: int):
        super().__init__(name, part_number, company_id)
        self.glass_type = glass_type


class Laptop(OfficeEquipment):
    def __init__(self, name, part_number, company_id, processor: str):
        super().__init__(name, part_number, company_id)
        self.processor = processor


class Warehouse:
    def __init__(self, warehouse_type: str):
        self.warehouse_type = warehouse_type
        self.__shelving = {}

    def add_new_equipment(self, office_equipment: OfficeEquipment):
        key = str(office_equipment)
        if key in self.__shelving:
            self.__shelving[key].append(office_equipment)
        else:
            self.__shelving.update({key: [office_equipment]})

    def delete_all_equipment_by_type(self, office_equipment: OfficeEquipment):
        key = str(office_equipment)
        if key in self.__shelving:
            self.__shelving.pop(key)

    def count(self, office_equipment: OfficeEquipment):
        key = str(office_equipment)
        if key in self.__shelving:
            return len(self.__shelving[key])
        else:
            return 0

    def __str__(self):
        return json.dumps(self.__shelving, default=lambda x: x.__dict__)


laptop = Laptop("lenovo", 1, 12, "intel")
laptop2 = Laptop("hp", 1, 12, "intel")
laptop3 = Laptop("mac", 1, 12, "intel")

printer = Printer("lenovo", 1, 12, "a4")
printer2 = Printer("hp", 1, 12, "a5")

scanner = Scanner("lenovo", 1, 12, 5)
scanner2 = Scanner("hp", 1, 12, 6)

warehouse = Warehouse("MSK")
warehouse.add_new_equipment(laptop)
warehouse.add_new_equipment(laptop2)
warehouse.add_new_equipment(laptop3)

warehouse.add_new_equipment(printer)
warehouse.add_new_equipment(printer2)

warehouse.add_new_equipment(scanner)
warehouse.add_new_equipment(scanner2)

print(warehouse)

print(warehouse.count(Printer))
print(warehouse.count(Scanner))
print(warehouse.count(Laptop))

warehouse.delete_all_equipment_by_type(Printer)
print(warehouse.count(Printer))
