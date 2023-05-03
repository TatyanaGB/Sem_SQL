 /* 1. Создайте таблицу с мобильными телефонами, используя графический интерфейс.
 Заполните БД данными. Добавьте скриншот на платформу в качестве ответа на ДЗ */ 
 
  -- Создание БД
DROP DATABASE IF EXISTS telefon; 
CREATE DATABASE IF NOT EXISTS telefon; 

-- Выбираем активную БД
USE telefon;

-- Создание таблицы с телефонами 
CREATE TABLE IF NOT EXISTS mobile_telefon
(
	-- Столбцы   таблицы
    -- Формула столбца: имя_столбца тип данных ограничения
    Id INT PRIMARY KEY AUTO_INCREMENT, -- PK = NOT NULL , UNIQUE
    ProductName VARCHAR(30), 
    Manufacturer VARCHAR(30), 
    ProductCount INT, 
    Price INT
);

-- Заполнение таблицы значениями
-- INSERT INTO table_name(столбец1, столбец2) VALUES (значение1, значение2) 
INSERT mobile_telefon (ProductName, Manufacturer, ProductCount, Price)
VALUES
	("iPhone X", "Apple", 3, 76000), -- id = 1
    ("iPhone 8", "Apple", 2, 51000), -- id = 2
	("Galaxy S9", "Samsung", 2, 56000), -- id = 3
	("Galaxy S8", "Samsung", 1, 41000), -- id = 4
	("P20 Pro", "Huawei", 5, 36000); -- id = 5
	
    -- Вывести содержимое таблицы mobile_telefon
SELECT * # "дурный" тон 
FROM mobile_telefon;

  -- 2. Вывести название, производителя и цену для товаров, количество которых превышает 2 
SELECT ProductName, Manufacturer, Price
FROM mobile_telefon
WHERE ProductCount > 2;

 -- 3. Вывести весь ассортимент товаров марки Samsung 
SELECT ProductName
FROM mobile_telefon
WHERE Manufacturer = "Samsung";

-- 4. Вывести информацию о телефонах, где суммарный чек больше 100 000 и меньше 145000
SELECT ProductName, Manufacturer
From mobile_telefon
WHERE ProductCount * Price > 100000 AND ProductCount * Price < 145000;

-- 5. Вывести товары, в которых есть упоминание "IPhone"
SELECT ProductName
FROM mobile_telefon
WHERE ProductName LIKE "IPhone%";

-- 6. Вывести товары, в которых есть упоминание "Galaxy"
SELECT ProductName
FROM mobile_telefon
WHERE ProductName LIKE "Galaxy%";

-- 7. Вывести товары, в которых есть  ЦИФРЫ
SELECT ProductName
FROM mobile_telefon
WHERE ProductName RLIKE "[0-9]";

-- 8. Вывести товары, в которых есть  ЦИФРА "8"
SELECT ProductName
FROM mobile_telefon
WHERE ProductName RLIKE "[8]";