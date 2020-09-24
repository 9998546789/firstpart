USE moto_school;

DELETE FROM student;
INSERT student(aggregate_id) 
VALUES
(1),(2),(3),(4),(5),(6),(7),(8),(9),(10);

DELETE FROM lesson;
INSERT lesson(aggregate_id) 
VALUES
(1),(2),(3),(4),(5),(6),(7),(8),(9),(10);

-- bike

DELETE FROM bike_history_item;
DELETE FROM bike;
INSERT bike(aggregate_id) 
VALUES
(1),(2),(3);

DELETE FROM bike_type;
INSERT bike_type(id, name) 
VALUES
(1, 'KTM_390'),(2, 'DUKE_200'),(3, 'BMW_350GS'),(4, 'BMW_650GS');

INSERT bike_history_item(bike_type_id, serviceable, year_of_production, id, aggregate_id, created_at, active) 
VALUES
-- изменяем дату выпуска первого мото
(1, 1, '2015-11-01', 1, 1, DATE_ADD(NOW(), INTERVAL -7 HOUR), 1),
(1, 1, '2016-11-01', 2, 1, DATE_ADD(NOW(), INTERVAL -6 HOUR), 1),
(1, 1, '2017-11-01', 3, 1, DATE_ADD(NOW(), INTERVAL -5 HOUR), 1),
(1, 1, '2018-11-01', 4, 1, DATE_ADD(NOW(), INTERVAL -4 HOUR), 1),
(1, 1, '2019-11-01', 5, 1, DATE_ADD(NOW(), INTERVAL -3 HOUR), 1),
(1, 1, '2020-01-01', 6, 1, DATE_ADD(NOW(), INTERVAL -2 HOUR), 1),
(1, 1, '2017-12-01', 7, 1, DATE_ADD(NOW(), INTERVAL -1 HOUR), 1),
-- второй мото сломан
(1, 1, '2015-10-01', 8, 2, DATE_ADD(NOW(), INTERVAL -8 HOUR), 1),
(1, 0, '2015-10-01', 9, 2, DATE_ADD(NOW(), INTERVAL -9 HOUR), 1),
-- третиий мото удален из системы
(1, 1, '2015-10-01', 10, 3, DATE_ADD(NOW(), INTERVAL -1 HOUR), 1),
(1, 1, '2015-10-01', 11, 3, NOW(), 0)
;

-- staff

DELETE FROM staff_history_item;
DELETE FROM staff;
INSERT staff(aggregate_id) 
VALUES
(1),(2),(3),(4),(5);

DELETE FROM staff_type;
INSERT staff_type(id, name) 
VALUES
(1, 'Инструктор'),(2, 'Админ'),(3, 'Директор'),(4, 'Уборщик');

INSERT staff_history_item(staff_type_id, firstname, lastname, email, birthday, phone, id, aggregate_id, created_at, active) 
VALUES
(1, 'Олег', 'Иванов', 'adsddsff@sdfa.sadf', '1950-10-01', '465465465', 1, 1, DATE_ADD(NOW(), INTERVAL -7 HOUR), 1),
(2, 'Игорь', 'Сидоров', 'agddsdf@sdfa.sdfadf', '1950-10-01', '465465465', 2, 2, DATE_ADD(NOW(), INTERVAL -6 HOUR), 1),
(1, 'Иван', 'Иванович', 'adsdvdfsdf@sdfa.sadfdf','1950-10-01','465465465', 3, 3, DATE_ADD(NOW(), INTERVAL -5 HOUR), 1),
(2, 'Иван', 'Петров', 'adsdf@sdfa.sadf', '1950-10-01','465465465', 4, 4, DATE_ADD(NOW(), INTERVAL -4 HOUR), 1),
(3, 'Иван', 'Иванов', 'advsdf@sdfa.sadf', '1950-10-01','465465465', 5, 5, DATE_ADD(NOW(), INTERVAL -3 HOUR), 1);



-- place

DELETE FROM place_history_item;
DELETE FROM place;
INSERT place(aggregate_id) 
VALUES
(1),(2),(3);

INSERT place_history_item(name, email, phone, aggregate_id, created_at, active)
VALUES 
('fugiat','clint22@example.org',4564654, 1,'1974-11-22 12:39:38',0),
('alias','orn.geovany@example.net',43, 1,'1987-10-11 02:24:20',0),
('provident','chadrick78@example.org',1075690274,1,'2013-01-27 18:43:36',0),
('fugiat','dbuckridge@example.org',739780,1,'1985-10-16 15:31:12',1),
('beatae','alvena39@example.net',0,1,'1978-01-20 09:31:45',1),
('et','wunsch.brigitte@example.org','447012',1,'1991-10-27 04:29:27',1),
('et','neoma79@example.com','293828',1,'1970-04-16 17:16:28',1),
('reiciendis','talon.jacobs@example.org','1',1,'1998-08-02 11:33:59',1),
('nihil','max93@example.com','225',1,'1997-03-15 01:01:44',1),
('et','medhurst.lucio@example.net','0',1,'1977-08-24 06:20:05',1),
('suscipit','ucummerata@example.org','142',1,'2009-12-29 16:53:47',1),
('ut','lebsack.kamille@example.net','918437',1,'2012-05-14 23:26:51',1),
('autem','lmonahan@example.org','0',1,'1996-11-01 21:25:01',1),
('autem','pheller@example.org','652',1,'2013-08-26 11:14:39',1),
('cum','jrolfson@example.com','1',1,'2000-03-06 20:00:57',1),
('iure','syble98@example.net','0',1,'1991-12-25 04:52:29',1),
('vel','nannie.durgan@example.com','992',1,'1978-10-05 15:04:19',0),
('quod','meggie93@example.net','524',1,'1994-02-14 05:50:51',0),
('atque','kprice@example.net','9675762938',1,'1982-08-26 18:50:24',0),
('assumenda','sfisher@example.org','0',1,'2016-09-14 14:59:36',1),
('minus','kaitlyn18@example.org','184',1,'1981-05-25 12:34:44',1),
('id','selena64@example.org','66',1,'1986-06-28 11:13:15',1),
('cupiditate','jaqueline69@example.net','294155',1,'1999-04-19 04:13:22',1),
('impedit','nwelch@example.com','998750',1,'1980-02-18 02:20:09',1),
('sit','constantin35@example.com','1',1,'1975-06-09 02:12:43',1),
('harum','shyann54@example.org','422',1,'2000-11-11 06:35:48',1),
('consectetur','devante30@example.net','848',1,'2020-03-17 16:15:43',1),
('aut','harold94@example.org','549457',1,'2019-01-20 22:14:51',1),
('eveniet','pbaumbach@example.com','237',1,'2005-01-29 14:19:46',1),
('ut','umarquardt@example.com','1',1,'1979-03-30 03:08:30',1),
('deserunt','zdavis@example.net','1384925858',1,'2019-11-18 00:09:18',0),
('aliquid','hane.benton@example.com','1',1,'1971-03-12 23:09:18',1),
('veritatis','bosco.mohammed@example.org','1',1,'1987-07-04 01:03:32',0);

