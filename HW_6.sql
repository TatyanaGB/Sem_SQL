CREATE DATABASE IF NOT EXISTS lesson6; -- 
USE lesson6;
/* 1.	Создайте функцию, которая принимает кол-во сек и форматирует их в кол-во дней, часов, минут и секунд.
-- Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds'*/

DROP PROCEDURE IF EXISTS format_time;
DELIMITER $$
CREATE PROCEDURE format_time
(
	IN num INT,
    OUT format_time_text VARCHAR(60)
)

BEGIN
	DECLARE days INT DEFAULT 0;
    DECLARE hours INT DEFAULT 0;
    DECLARE minutes INT DEFAULT 0;
    DECLARE seconds INT DEFAULT 0;
		
    SET format_time_text = "";     
    
    If num > 0 THEN
		SET days = FLOOR(num / (24 * 60 * 60));
        SET num = num - days * 24 * 60 * 60;
	END IF;
    If num > 0 THEN
		SET hours = FLOOR(num / (60 * 60));
        SET num = num - hours * 60 * 60;
    END IF;    
	If num > 0 THEN
		SET minutes = FLOOR(num / 60);
        SET num = num - minutes * 60;
	END IF;
	If num > 0 THEN 
		SET seconds = num;
	END IF;
    IF days > 0 THEN
		SET format_time_text = concat(format_time_text, concat(days, " days"), " ");
	END IF;
    IF hours > 0 THEN
		SET format_time_text = concat(format_time_text, concat(hours, " hours"), " ");
	END IF;
	IF minutes > 0 THEN
		SET format_time_text = concat(format_time_text, concat(minutes, " minutes"), " ");
	END IF;
    IF seconds > 0 THEN
		SET format_time_text = concat(format_time_text, concat(seconds, " seconds"), " ");
	END IF;
END $$

CALL format_time(123456, @res);
SELECT @res;

-- 2. Выведите только четные числа от 1 до 10. Пример: 2,4,6,8,10

-- DROP PROCEDURE IF EXISTS numbers
DELIMITER $$
CREATE PROCEDURE numbers()
BEGIN
    DECLARE n INT default 0;
    DROP TABLE IF EXISTS nums;
    CREATE TABLE nums (n INT);

    WHILE n < 10 DO
    SET n = n + 2;
    INSERT INTO nums VALUES(n);
    END WHILE;

SELECT * FROM nums;
END $$
DELIMITER ;

CALL numbers();

