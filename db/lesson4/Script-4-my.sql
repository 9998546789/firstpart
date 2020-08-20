
-- insert

USE vk;
INSERT INTO users(id, firstname, lastname, email, phone)
VALUES (1, 'User1', 'Surname1', 'aelsdosd@sdkjkjlsdf.sdf', '688688648648');

INSERT INTO vk.users 
SET
	firstname = '1sdf',
	email ='sdf@sdf.sdf',
	lastname = 'dsf2',
	phone = 465855
;

INSERT INTO users (firstname, lastname, email)
select first_name, last_name, email 
from sakila.staff;

-- update

UPDATE friend_request 
SET status = 'approved'
where initiator_user_id = 1 and target_user_id = 2;

-- delete

DELETE FROM messages 
where initiator_user_id = 1 and target_user_id = 2;

truncate table messages; 



