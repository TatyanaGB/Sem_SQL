-- Создание БД
DROP DATABASE IF EXISTS les_2;
CREATE DATABASE IF NOT EXISTS les_2;

-- Выбираем БД для работы
USE les_2;


/* 1.Используя операторы языка SQL, 
создайте таблицу “sales”. Заполните ее данными*/

--  DROP TABLE IF EXISTS sales  -- Удалить таблицу, если она существует
CREATE TABLE IF NOT EXISTS sales

(
	id INT PRIMARY KEY AUTO_INCREMENT, -- PRIMARY KEY = UNIQUE, NOT NULL
    order_date DATE,
    count_product INT
);

INSERT INTO sales (order_date, count_product)
VALUES 
	('2022-01-01', 156),
    ('2022-01-02', 180),
    ('2022-01-03', 21),
    ('2022-01-04', 124),
    ('2022-01-05', 341);
    
 SELECT * FROM sales;   
 
 
/* 2.Для данных таблицы “sales” укажите тип заказа в зависимости от кол-ва : 
меньше 100  -    Маленький заказ
от 100 до 300 - Средний заказ
больше 300  -     Большой заказ*/
 
 SELECT
	id AS "id заказа",
	-- order_date AS "Тип заказа",
	IF (count_product < 100, "Маленький заказ",
		IF(count_product BETWEEN 100 AND 300, "Средний заказ",
			IF(count_product > 300, "Большой заказ", "Огромный заказ")))
	AS "Тип заказа"
FROM sales;
    
   /* 3. Создайте таблицу “orders”, заполните ее значениями
   Выберите все заказы. В зависимости от поля order_status выведите столбец full_order_status:
OPEN – «Order is in open state» ; CLOSED - «Order is closed»; CANCELLED -  «Order is cancelled»*/

-- DROP TABLE IF EXISTS orders;
CREATE TABLE IF NOT EXISTS orders

(
	id INT PRIMARY KEY AUTO_INCREMENT, -- PRIMARY KEY = UNIQUE, NOT NULL
    employee_id VARCHAR(5) NOT NULL UNIQUE DEFAULT 'e00',
    amount FLOAT (7,2) NOT NULL DEFAULT '0.00',
    order_status VARCHAR(30) 
);

INSERT INTO orders (employee_id, amount, order_status)
VALUES 
	('e03', 15.00, 'OPEN'),
    ('e01', 25.50, 'OPEN'),
    ('e05', 100.70, 'CLOSED'),
    ('e02', 22.18, 'OPEN'),
    ('e04', 9.50, 'CANCELLED');
    
 SELECT * FROM orders;   
 
 SELECT
	id,
	employee_id,
	amount,
	order_status,
	IF (order_status = "OPEN", "Order is in open state",
		IF(order_status = "CLOSED", "Order is closed",
			IF(order_status = "CANCELLED", "Order is cancelled", "нет ничего")))
	AS "full_order_status"
FROM orders;
    