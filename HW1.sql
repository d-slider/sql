use Mysecond_DB;
create table HW1
(
id serial primary key,
product_name varchar(50) not null,
manufacturer varchar(50) not null,
product_count int,
price decimal(10,0)
);
insert HW1 (product_name, manufacturer, product_count, price)
values
('iPhone X', 'Apple', 3, 76000),
('iPhone X8', 'Apple', 2, 51000),
('Galaxy S9', 'Samsung', 2, 56000),
('Galaxy S8', 'Samsung', 1, 41000),
('P20 Pro', 'Huawei', 5, 36000);

Select manufacturer, product_name, price from HW1
where product_count > 2;

Select manufacturer, product_name, price from HW1
where manufacturer = 'Samsung';

Select manufacturer, product_name, price from HW1
where manufacturer LIKE '%Samsung%';

Select manufacturer, product_name, price from HW1
where product_name LIKE '%iphone%';

Select * from HW1
where product_name LIKE '%8%';

SELECT * FROM HW1
WHERE product_name LIKE '%[0-9]%';