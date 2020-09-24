
-- 7 представления;

create view active_bikes 
(bike_type_id, serviceable, year_of_production, id, aggregate_id, created_at, active)
 as select 
 history.bike_type_id, 
 history.serviceable,
 history.year_of_production,
 history.id,
 history.aggregate_id,
 history.created_at,
 history.active
from bike_history_item history
  left join bike_history_item bhi on history.aggregate_id = bhi.aggregate_id 
  	and history.created_at < bhi.created_at
where bhi.created_at is null and history.active = 1;


create view all_bikes 
(bike_type_id, serviceable, year_of_production, id, aggregate_id, created_at, active)
 as select 
 history.bike_type_id, 
 history.serviceable,
 history.year_of_production,
 history.id,
 history.aggregate_id,
 history.created_at,
 history.active
from bike_history_item history
  left join bike_history_item bhi on history.aggregate_id = bhi.aggregate_id 
  	and history.created_at < bhi.created_at
where bhi.created_at is null 