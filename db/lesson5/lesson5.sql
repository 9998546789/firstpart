use vk;

-- 1 Пусть в таблице users поля created_at и updated_at оказались незаполненными. Заполните их текущими датой и временем.
ALTER TABLE profiles ADD COLUMN updated_at DATETIME DEFAULT NOW();

UPDATE profiles
	SET 
		updated_at = NOW(),
		created_at = NOW() 
	;
	
-- 2 Таблица users была неудачно спроектирована. Записи created_at и updated_at были заданы типом 
-- VARCHAR и в них долгое время помещались значения в формате "20.10.2017 8:10". 
-- Необходимо преобразовать поля к типу DATETIME, сохранив введеные ранее значения.

ALTER TABLE profiles ADD COLUMN wrong_created_at varchar(50) DEFAULT '20.10.2017 8:10';
ALTER TABLE profiles ADD COLUMN wrong_updated_at varchar(50) DEFAULT '20.10.2017 8:10';

UPDATE profiles
	SET 
		updated_at = STR_TO_DATE(wrong_updated_at, '%d.%m.%Y %H:%i'),
		created_at = STR_TO_DATE(wrong_created_at, '%d.%m.%Y %H:%i')
	;
	
-- 3. В таблице складских запасов storehouses_products в поле value могут встречаться самые разные цифры: 0,
-- если товар закончился и выше нуля, если на складе имеются запасы. Необходимо отсортировать записи таким образом,
-- чтобы они выводились в порядке увеличения значения value. Однако, нулевые запасы должны выводиться в конце, после всех записей.

SELECT sp.value 
	FROM storehouses_products sp
	ORDER BY CASE
		WHEN sp.value <> 0
		THEN 1 
		ELSE 2
		END ASC;

-- 4. (по желанию) Из таблицы users необходимо извлечь пользователей,
-- родившихся в августе и мае. Месяцы заданы в виде списка английских названий ('may', 'august')

select *
from profiles p
where month(p.birthday) in
	(SELECT month(str_to_date(LEFT(p2.column_0 , 3), '%b'))
		FROM (
				VALUES ROW('may'), ROW('august')
			) p2); 
 
-- Практическое задание теме “Агрегация данных”
-- 1. Подсчитайте средний возраст пользователей в таблице users

SELECT AVG(TIMESTAMPDIFF(YEAR, p.birthday, CURDATE())) AS avg_age
  	FROM profiles p
  	
-- 2. Подсчитайте количество дней рождения, которые приходятся на каждый из дней недели.
-- Следует учесть, что необходимы дни недели текущего года, а не года рождения.

SELECT day_of_week, count(day_of_week)
FROM 	(
		  SELECT DAYOFWEEK(DATE_FORMAT(p.birthday,'2020-%m-%d')) AS day_of_week
		 	FROM profiles p
 		) day_of_week
 	GROUP BY day_of_week
 	ORDER BY day_of_week ASC 
 	
 -- 3 (по желанию) Подсчитайте произведение чисел в столбце таблицы
 
SELECT exp(SUM(log(p.column_0))) 
FROM (
		VALUES ROW(2), ROW(5), ROW(10) 
	) p; 
 	