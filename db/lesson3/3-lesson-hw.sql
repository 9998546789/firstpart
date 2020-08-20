-- lesson 3 Написать cкрипт, добавляющий в БД vk,
-- которую создали на занятии, 3 новые таблицы (с перечнем полей, указанием индексов и внешних ключей)
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





