-- 1 Пусть задан некоторый пользователь. Из всех пользователей соц.
-- сети найдите человека, который больше всех общался с выбранным пользователем (написал ему сообщений).
use vk;

set @current_user = 1;

select 
	group_m.from_user_id,
	max(group_m.count_messages)
from (
		select 
			m.from_user_id,
			count(m.from_user_id) as count_messages
		from messages m
		where m.to_user_id = @current_user 
		group by m.from_user_id
	) group_m

-- 2. Подсчитать общее количество лайков, которые получили пользователи младше 10 лет..

select 
	l.user_id,
	count(l.user_id)
from likes l 
	join profiles p on p.user_id = l.user_id 
	where p.birthday >= now() - interval 10 year 
group by l.user_id
	
-- 3. Определить кто больше поставил лайков (всего): мужчины или женщины.

select 
	p.gender,
	count(p.gender)
from likes l 
	join profiles p on p.user_id = l.user_id 
	where p.birthday >= now() - interval 10 year 
group by p.gender 