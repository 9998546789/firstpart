DROP DATABASE IF EXISTS moto_school;
CREATE DATABASE moto_school;
USE moto_school;

-- bike

DROP TABLE IF EXISTS bike;
CREATE TABLE bike (
	aggregate_id SERIAL
) COMMENT 'мото';

DROP TABLE IF EXISTS bike_type;
CREATE TABLE bike_type (
	id SERIAL,
	name VARCHAR(150) UNIQUE
) COMMENT 'типы мото';

DROP TABLE IF EXISTS bike_history_item;
CREATE TABLE bike_history_item (
	bike_type_id BIGINT NOT NULL,
	serviceable BIT(1),
	year_of_production DATETIME DEFAULT NOW(),
	
	id SERIAL,
	aggregate_id BIGINT NOT NULL,
	created_at DATETIME DEFAULT NOW(),
	active BIT(1)
	
	FOREIGN KEY (aggregate_id) REFERENCES bike(aggregate_id),
	FOREIGN KEY (bike_type_id) REFERENCES bike_type(id)
);

-- staff

DROP TABLE IF EXISTS staff;
CREATE TABLE staff (
	aggregate_id SERIAL
) COMMENT 'штат сотрудников';

DROP TABLE IF EXISTS staff_type;
CREATE TABLE staff_type (
	id SERIAL,
	name VARCHAR(150) UNIQUE
) COMMENT 'тип рабочего';

DROP TABLE IF EXISTS staff_history_item;
CREATE TABLE staff_history_item (
	staff_type_id BIGINT UNSIGNED NOT NULL,
  	firstname VARCHAR(50),
    lastname VARCHAR(50),
    email VARCHAR(120),
	birthday DATETIME DEFAULT NOW(),
	phone BIGINT UNSIGNED,
	
	id SERIAL,
	aggregate_id BIGINT UNSIGNED NOT NULL,
	created_at DATETIME DEFAULT NOW(),
	active BIT(1),
	
	FOREIGN KEY (aggregate_id) REFERENCES staff(aggregate_id),
	FOREIGN KEY (staff_type_id) REFERENCES staff_type(id)
);

-- place 
DROP TABLE IF EXISTS place;
CREATE TABLE place (
	aggregate_id SERIAL
) COMMENT 'площадка';

DROP TABLE IF EXISTS place_history_item;
CREATE TABLE place_history_item (
    name VARCHAR(500),
    email VARCHAR(120),
	phone BIGINT UNSIGNED,
	
	aggregate_id BIGINT UNSIGNED NOT NULL,
	created_at DATETIME DEFAULT NOW(),
	active BIT(1),
	
	FOREIGN KEY (aggregate_id) REFERENCES place(aggregate_id)
);

-- student

DROP TABLE IF EXISTS student;
CREATE TABLE student (
	aggregate_id SERIAL
) COMMENT 'ученики';

DROP TABLE IF EXISTS student_history_item;
CREATE TABLE student_history_item (
  	firstname VARCHAR(50),
    lastname VARCHAR(50),
    email VARCHAR(120),
	birthday DATETIME DEFAULT NOW(),
	bike_id BIGINT UNSIGNED NOT NULL,
	phone BIGINT UNSIGNED,
	
	id SERIAL,
	aggregate_id BIGINT UNSIGNED NOT NULL,
	created_at DATETIME DEFAULT NOW(),
	active BIT(1),
	
	FOREIGN KEY (aggregate_id) REFERENCES student(aggregate_id),
	FOREIGN KEY (bike_id) REFERENCES bike(aggregate_id)
);

-- lesson

DROP TABLE IF EXISTS lesson;
CREATE TABLE lesson (
	aggregate_id SERIAL
) COMMENT 'урок';

DROP TABLE IF EXISTS lesson_history_item;
CREATE TABLE lesson_history_item (
	start_time DATETIME DEFAULT NOW(),
	end_time DATETIME DEFAULT NOW(),
	
	id SERIAL,
	aggregate_id BIGINT UNSIGNED NOT NULL,
	created_at DATETIME DEFAULT NOW(),
	active BIT(1),
	
	FOREIGN KEY (aggregate_id) REFERENCES lesson(aggregate_id)
);

-- lessons to students

DROP TABLE IF EXISTS students_lessons;
CREATE TABLE students_lessons(
	id SERIAL,
    lesson_id BIGINT UNSIGNED NOT NULL,
    student_id BIGINT UNSIGNED NOT NULL,
    created_at DATETIME DEFAULT NOW(),

    FOREIGN KEY (lesson_id) REFERENCES lesson(aggregate_id),
    FOREIGN KEY (student_id) REFERENCES student(aggregate_id)

);

-- lessons to bikes

DROP TABLE IF EXISTS bikes_lessons;
CREATE TABLE bikes_lessons(
	id SERIAL,
    lesson_id BIGINT UNSIGNED NOT NULL,
    bike_id BIGINT UNSIGNED NOT NULL,
    created_at DATETIME DEFAULT NOW(),

    FOREIGN KEY (lesson_id) REFERENCES lesson(aggregate_id),
    FOREIGN KEY (bike_id) REFERENCES bike(aggregate_id)

);

