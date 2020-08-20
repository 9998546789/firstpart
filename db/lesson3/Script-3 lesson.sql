DROP DATABASE IF EXISTS vk;
CREATE DATABASE vk;
USE vk;

DROP TABLE IF EXISTS users;
CREATE TABLE users(
	-- id SERIAL, = BIGINT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE 
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	lastname VARCHAR(100),
	firstname VARCHAR(100),
	email VARCHAR(100) UNIQUE,
	phone BIGINT UNSIGNED,
	INDEX users_firstname_lastname_idx (firstname, lastname)
);

-- 1 to 1
DROP TABLE IF EXISTS `profiles`;
CREATE TABLE `profiles`(
	user_id BIGINT UNSIGNED NOT NULL PRIMARY KEY,
	hometown VARCHAR(100),
	gender CHAR(1),
	created_at DATETIME DEFAULT NOW()
);

-- ALTER TABLE profiles ADD CONSTRAINT fk_profiles_user_id
FOREIGN KEY (user_id) REFERENCES users(id)
ON UPDATE CASCADE;
-- ON DELETE restrict;

ALTER TABLE profiles ADD COLUMN birthday DATE;
-- ALTER TABLE profiles RENAME COLUMN birthday TO b2;
-- ALTER TABLE profiles DROP COLUMN b2;

-- 1 to M
DROP TABLE IF EXISTS messages;
CREATE TABLE messages(
	id SERIAL,
	from_user_id BIGINT UNSIGNED NOT NULL,
	to_user_id BIGINT UNSIGNED NOT NULL,
	created_at DATETIME DEFAULT NOW(),
	body TEXT,
	FOREIGN KEY (from_user_id) REFERENCES users(id),
	FOREIGN KEY (to_user_id) REFERENCES users(id)
);

DROP TABLE IF EXISTS friend_request;
CREATE TABLE friend_request(
	-- id SERIAL,
	initiator_user_id BIGINT UNSIGNED NOT NULL,
	target_user_id BIGINT UNSIGNED NOT NULL,
	created_at DATETIME DEFAULT NOW(),
	updated_at DATETIME ON UPDATE NOW(), -- current_timestamp
	
	status ENUM('requested', 'approved', 'declined', 'unfriended'),
	
	PRIMARY KEY (initiator_user_id, target_user_id),
	FOREIGN KEY (initiator_user_id) REFERENCES users(id),
	FOREIGN KEY (target_user_id) REFERENCES users(id),
	CHECK (initiator_user_id != target_user_id)
);

-- ИЛИ МОЖНО ОТДЕЛЬНЫМ ЗАПРОСОМ ОТПРАВИТЬ ПРОВЕРКУ 
-- ALTER TABLE friend_request 
-- ADD CHECK (initiator_user_id <> target_user_id)

-- M to M
DROP TABLE IF EXISTS communities;
CREATE TABLE communities(
	id SERIAL,
	name VARCHAR(200),
	admin_user_id BIGINT UNSIGNED NOT NULL,
	created_at DATETIME DEFAULT NOW(),
	
	INDEX (name),
	FOREIGN KEY (admin_user_id) REFERENCES users(id)
);

DROP TABLE IF EXISTS user_communities;
CREATE TABLE user_communities(
	user_id BIGINT UNSIGNED NOT NULL,
	community_id BIGINT UNSIGNED NOT NULL,
	
	FOREIGN KEY (user_id) REFERENCES users(id),
	FOREIGN KEY (community_id) REFERENCES communities(id)
);


DROP TABLE IF EXISTS media_types;
CREATE TABLE media_types(
	id SERIAL,
	name VARCHAR(100)
);


DROP TABLE IF EXISTS media;
CREATE TABLE media(
	id SERIAL,
	user_id BIGINT UNSIGNED NOT NULL,
	media_type_id BIGINT UNSIGNED NOT NULL,
	body TEXT,
	filename VARCHAR(255),
	metadata JSON,
	
	created_at DATETIME DEFAULT NOW(),
	updated_at DATETIME ON UPDATE NOW(), -- current_timestamp
	
	FOREIGN KEY (user_id) REFERENCES users(id),
	FOREIGN KEY (media_type_id) REFERENCES media_types(id)
);


DROP TABLE IF EXISTS likes;
CREATE TABLE likes(
	id SERIAL,
	user_id BIGINT UNSIGNED NOT NULL,
	media_id BIGINT UNSIGNED NOT NULL,
	
	created_at DATETIME DEFAULT NOW(),
	
	FOREIGN KEY (user_id) REFERENCES users(id),
	FOREIGN KEY (media_id) REFERENCES media(id)
);

-- lesson 3 Написать cкрипт, добавляющий в БД vk, которую создали на занятии, 3 новые таблицы (с перечнем полей, указанием индексов и внешних ключей)
DROP TABLE IF EXISTS comments;
CREATE TABLE comments(
	id SERIAL,
	user_id BIGINT UNSIGNED NOT NULL,
	media_id BIGINT UNSIGNED NOT NULL,		
	body TEXT,
	
	created_at DATETIME DEFAULT NOW(),
	updated_at DATETIME ON UPDATE NOW(),
	
	FOREIGN KEY (user_id) REFERENCES users(id),
	FOREIGN KEY (media_id) REFERENCES media(id)
);

DROP TABLE IF EXISTS likes_comments;
CREATE TABLE likes_comments(
	like_id BIGINT UNSIGNED NOT NULL,
	comment_id BIGINT UNSIGNED NOT NULL,
	
	PRIMARY KEY (like_id, comment_id), -- у одного комментария только один лайк 
	FOREIGN KEY (like_id) 
		REFERENCES likes(id)
		ON DELETE CASCADE,
	FOREIGN KEY (comment_id) 
		REFERENCES comments(id)
		ON DELETE CASCADE
);

DROP TABLE IF EXISTS walls; -- Дуров, верни стену!
CREATE TABLE walls(
	user_id BIGINT UNSIGNED NOT NULL PRIMARY KEY,
	user_description VARCHAR(1000),
	
	created_at DATETIME DEFAULT NOW(),
	
	FOREIGN KEY (user_id) 
		REFERENCES users(id)
		ON DELETE CASCADE
);

DROP TABLE IF EXISTS walls_media;
CREATE TABLE walls_media(
	wall_id BIGINT UNSIGNED NOT NULL,
	media_id BIGINT UNSIGNED NOT NULL,
	
	FOREIGN KEY (wall_id) 
		REFERENCES walls(user_id)
		ON DELETE CASCADE,
	FOREIGN KEY (media_id) 
		REFERENCES media(id)
		ON DELETE CASCADE
);





