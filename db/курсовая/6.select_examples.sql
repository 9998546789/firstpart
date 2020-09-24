-- 6

use moto_school;
					
-- выбрать запись для bike с id = 3

select *
	from bike b
	join bike_history_item bhi on bhi.aggregate_id = bhi.aggregate_id 
	where b.aggregate_id = 3
	order by bhi.created_at desc
	limit 1;
					
-- выбрать все записи 

select *
from bike_history_item history
  left join bike_history_item bhi on history.aggregate_id = bhi.aggregate_id 
  	and history.created_at < bhi.created_at
where bhi.created_at is null 

-- выбрать все неудаленные записи 

select *
from bike_history_item history
  left join bike_history_item bhi on history.aggregate_id = bhi.aggregate_id 
  	and history.created_at < bhi.created_at
where bhi.created_at is null and history.active = 1

