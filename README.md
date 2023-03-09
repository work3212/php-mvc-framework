## PHP MVC фреймворк + DOCKER: 

###### Инструкция:
1. Склонировать репозиторий 
2. Запустить сборку контейнера командой `docker-compose up --build -d`
3. После успешной сборки загрузить тестовую БД:
- Зайдите в контейнер : `docker exec -it docker_mysql bash`
- Войдите в MySQL: `mysql -u root -proot`
- Находясь в MySQL CLI, создайте базу данных: `create database shop;`
- Выполните импорт БД: 
- `USE shop;`
- `SOURCE /var/shop.sql;`
