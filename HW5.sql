create database HW5;
use HW5;
create table Cars(
id serial primary key,
name varchar(50),
cost int);
insert Cars (name, cost)
values
('Audi', 52642),
('Mercedes', 57127),
('Skoda', 9000),
('Volvo', 29000),
('Bentley', 350000),
('Citroen', 21000),
('Hummer', 41400),
('Volkswagen', 21600);

-- Создайте представление, в которое попадут автомобили стоимостью  до 25 000 долларов

create view Cars_25000 as
select *
from Cars
where cost <= 25000;

-- Изменить в существующем представлении порог для стоимости: пусть цена будет до 30 000 долларов (используя оператор ALTER VIEW) 

alter view Cars_25000 as
select *
from Cars
where cost <= 30000;

-- Создайте представление, в котором будут только автомобили марки “Шкода” и “Ауди”

create view cars_1 as
select *
from Cars
where name in ('Skoda', 'Audi');

-- --------------------------------------------------------------------------------

CREATE TABLE analysis
(       
  an_id VARCHAR(2) PRIMARY KEY, 
  an_name VARCHAR(10), 
  an_cost INT,
  an_price INT, 
  an_group VARCHAR(10)
);

INSERT INTO analysis values
(1 , 'second', 10, 12, 'common'),
(2 , 'first', 11, 12, 'common'),
(3 , 'first', 11, 12, 'common'),
(4 , 'third', 20, 25, 'spec'),
(5 , 'second', 10, 12, 'common'),
(6 , 'first', 11, 12, 'common'),
(7 , 'third', 20, 25, 'spec');

CREATE TABLE grops
(       
  gr_id VARCHAR(2) PRIMARY KEY, 
  gr_name VARCHAR(10), 
  gr_temp_cost INT
);

INSERT INTO grops values
(1 , 'common', 10),
(2 , 'spec', 2);


CREATE TABLE orders
(       
  ord_id VARCHAR(2) PRIMARY KEY, 
  ord_datetime datetime, 
  ord_an INT
);

INSERT INTO orders values
(1 , '2020-02-05 00:00:00', 1),
(2 , '2020-02-06 00:00:00', 2),
(3 , '2020-02-07 00:00:00', 3),
(4 , '2020-02-08 00:00:00', 4),
(5 , '2020-02-10 00:00:00', 5),
(6 , '2020-02-13 00:00:00', 6),
(7 , '2020-02-15 00:00:00', 7);

-- Вывести название и цену для всех анализов, которые продавались 5 февраля 2020 и всю следующую неделю.

create view orders_price as
SELECT analysis.an_price, analysis.an_name, orders.ord_datetime
FROM analysis
RIGHT JOIN orders ON orders.ord_id = analysis.an_id;

SELECT an_price, ord_datetime, an_name
FROM orders_price
WHERE ord_datetime BETWEEN '2020-02-05' AND '2020-02-12';

-- --------------------------------------------------------------------------------
/*
Добавьте новый столбец под названием «время до следующей станции». 
Чтобы получить это значение, мы вычитаем время станций для пар смежных станций. 
Мы можем вычислить это значение без использования оконной функции SQL, но это может быть очень сложно. 
Проще это сделать с помощью оконной функции LEAD . 
Эта функция сравнивает значения из одной строки со следующей строкой, чтобы получить результат. 
В этом случае функция сравнивает значения в столбце «время» для станции со станцией сразу после нее.
*/
create table staions(
id serial primary key,
train_id int,
station varchar(50),
statin_time time);

INSERT INTO `HW5`.`staions` (`train_id`, `station`, `statin_time`)
values
(110, 'San Francisco', '10:00:00'),
(110, 'Redwood City', '10:54:00'),
(110, 'Palo Alto', '11:02:00'),
(110, 'San Jose', '12:35:00'),
(120, 'San Francisco', '11:00:00'),
(120, 'Palo Alto', '12:49:00'),
(120, 'San Jose', '13:30:00');

SELECT train_id, station, statin_time,
  subtime(LEAD(statin_time) OVER (PARTITION BY train_id ORDER BY train_id), statin_time) AS time_to_next_station
FROM staions;
