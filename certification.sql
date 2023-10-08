create database interim_certification;
use interim_certification;

/*
1.	Создайте функцию, которая принимает кол-во сек и форматирует их в кол-во дней, часов, 
минут и секунд. Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '
*/

DELIMITER $$
CREATE PROCEDURE FormatSeconds(IN seconds INT)
BEGIN
    DECLARE days INT;
    DECLARE hours INT;
    DECLARE minutes INT;
    DECLARE remaining_seconds INT;
    
    SET days = seconds / (24 * 60 * 60);
    SET seconds = seconds % (24 * 60 * 60);
    SET hours = seconds / (60 * 60);
    SET seconds = seconds % (60 * 60);
    SET minutes = seconds / 60;
    SET remaining_seconds = seconds % 60;
    
    SELECT CONCAT(days, ' days, ', hours, ' hours, ', minutes, ' minutes, ', remaining_seconds, ' seconds') AS formatted_time;
END $$;
DELIMITER ;
CALL FormatSeconds(123456);


/*
2.	Выведите только четные числа от 1 до 10 включительно.
Пример: 2,4,6,8,10 (можно сделать через шаг +  2: х = 2, х+=2)
*/

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
