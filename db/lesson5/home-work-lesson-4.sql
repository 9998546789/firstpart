-- урок 4
-- ii. Написать скрипт, возвращающий список имен (только firstname) пользователей без повторений в алфавитном порядке

USE vk;
SELECT u.firstname
FROM users u  
GROUP BY u.firstname 
ORDER BY u.firstname;

-- iii. Написать скрипт, отмечающий несовершеннолетних пользователей как неактивных (поле is_active = false). 
-- Предварительно добавить такое поле в таблицу profiles со значением по умолчанию = true (или 1)

ALTER TABLE profiles ADD COLUMN is_active BOOL DEFAULT TRUE;

UPDATE profiles 
SET is_active = false 
WHERE DATE(birthday) > DATE_SUB(CURDATE(), INTERVAL 18 YEAR);


-- iv. Написать скрипт, удаляющий сообщения «из будущего» (дата больше сегодняшней)
DELETE FROM profiles 
WHERE DATE(birthday) > NOW();

-- v. Написать название темы курсового проекта (в комментарии)
-- Схема бд для приложения мотошколы.
