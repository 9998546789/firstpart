use vk;

-- 1. Составьте список пользователей users, которые осуществили хотя бы один заказ orders в интернет магазине.

select 
	distinct u.id 
from users u 
join orders o on u.id = o.user_id 
order by u.id

-- 2. Выведите список товаров products и разделов catalogs, который соответствует товару.

select *
from products p
right join catalogs c on c.id = p.catalog_id 

-- 3. (по желанию) Пусть имеется таблица рейсов flights (id, from, to) 
-- и таблица городов cities (label, name). Поля from, to и label содержат английские названия городов, 
-- поле name — русское. Выведите список рейсов flights с русскими названиями городов.

select f.id, c_from.label, c_to.label
from flights f
join cities c_from on binary f.`from` = c_from.label
join cities c_to on binary f.`to` = c_to.label
group by f.id, c_from.label, c_to.label