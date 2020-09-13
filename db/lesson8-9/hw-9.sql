-- Практическое задание по теме “Транзакции, переменные, представления”

-- 1
-- В базе данных shop и sample присутствуют одни и те же таблицы, учебной базы данных. 
-- Переместите запись id = 1 из таблицы shop.users в таблицу sample.users.
-- Используйте транзакции.

START TRANSACTION;

INSERT INTO sample.users as sample_users
SELECT *,
FROM shop.users as shop_users
WHERE sample_users.id = 1;

DELETE 
FROM sample.users us
WHERE us.id = 1

COMMIT;


-- 2 Создайте представление, которое выводит название filename из таблицы media 
-- и соответствующее название каталога firstname из таблицы users.

create view filename_firstname as
select m.filename, u.firstname 
from media m
join users u on m.user_id = u.id 

select * from filename_firstname;

-- Практическое задание по теме “Хранимые процедуры и функции, триггеры"

-- Создайте хранимую функцию hello(), 
-- которая будет возвращать приветствие, в зависимости от текущего времени суток.
-- С 6:00 до 12:00 функция должна возвращать фразу "Доброе утро",
-- с 12:00 до 18:00 функция должна возвращать фразу "Добрый день",
-- с 18:00 до 00:00 — "Добрый вечер", с 00:00 до 6:00 — "Доброй ночи".

DROP FUNCTION hello;

DELIMITER $$
CREATE FUNCTION hello() 
RETURNS text
DETERMINISTIC
BEGIN 
	DECLARE str text;
	set str = IF(HOUR(NOW()) > 6 and HOUR(NOW()) <= 12 , "Доброе утро",
					IF(HOUR(NOW()) > 12 and HOUR(NOW()) <= 18 , "Добрый день", 
						"Доброй ночи")); 
RETURN str;
END$$
DELIMITER ;

select hello()

-- В таблице products есть два текстовых поля: name с названием товара и description с его описанием.
-- Допустимо присутствие обоих полей или одно из них. Ситуация, когда оба поля принимают неопределенное значение NULL неприемлема. 
-- Используя триггеры, добейтесь того, чтобы одно из этих полей или оба поля были заполнены.
-- При попытке присвоить полям NULL-значение необходимо отменить операцию.

CREATE TABLE products (name varchar(100) null, description varchar(100) null);

DELIMITER $$
CREATE TRIGGER kill_null BEFORE INSERT ON vk.products
FOR EACH ROW
begin 
	IF(new.name is null and new.description is null) THEN
	SIGNAL SQLSTATE '45000'
	SET MESSAGE_TEXT = 'You can not insert record';
	END IF;
end
DELIMITER ;


INSERT INTO products (name, description)
VALUES (null, null);