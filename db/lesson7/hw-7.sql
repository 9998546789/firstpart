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



server {
    listen 8080;
    listen [::]:8080;

    root /var/www/zip.test.com/html;
    index index.html index.htm index.nginx-debian.html;

    server_name zip.test.com;

    # описываем upload-секцию:
    location /upload{
        # максимальный размер файла, который можно залить.
        client_max_body_size 15g;
        # каталог, куда заливать
        root /var/www/zip.test.com;
        # chmod для залитых файлов - здесь 777, чтобы user тоже мог удалять файлы
        dav_access user:rw group:rw all:rw;
        # разрешаем методы webdav-a. Для примера я перечислил все, для аплоада фа$
        dav_methods PUT DELETE MKCOL COPY MOVE;
        # nginx будет создавать весь путь при аплоаде файлов (можно будет не созд$
        create_full_put_path on;
        # включаем autoindex в каталоге upload (чтобы на самом images.example.com$
        autoindex on;
        autoindex_exact_size off;
        autoindex_localtime on;
        charset utf-8;
        # включаем авторизацию в /upload:
        auth_basic "Upload directory";
        auth_basic_user_file /etc/nginx/htpasswd;
        }
    # теперь описываем раздачу файлов по http из "корня" сайта:
    location / {
        root /var/www/zip.test.com;
    }
}


curl -T /tmp/test http://username:password@176.119.156.205:8080/upload/archives/test.zip





http://username:password@176.119.156.205:85/upload/archives/test.zip
