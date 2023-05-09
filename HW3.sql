USE Mysecond_DB;
create table SALESPEOPLE(
id serial primary key,
snum int not null,
sname varchar (30) not null,
city  varchar (30) not null
);
insert SALESPEOPLE (snum, sname, city)
values
(1001, 'Peel', 'London'),
(1002, 'Serres', 'San Jose'),
(1004, 'Motika', 'London'),
(1007, 'Rifkin', 'Barcelona'),
(1003, 'Axelrod', 'New York');

create table CUSTOMERS(
id serial primary key,
cnum int not null,
cname varchar (30) not null,
city varchar (30) not null,
rating int not null,
snum int not null
);

insert CUSTOMERS (cnum, cname, city, rating, snum)
values
(2001, 'Hoffman', 'London', 100, 1001),
(2002, 'Giovanni', 'Rome', 200, 1003),
(2003, 'Liu', 'San Jose', 200, 1002),
(2004, 'Grass', 'Berlin', 300, 1002),
(2005, 'Clemens', 'London', 100, 1001),
(2006, 'Cisneros', 'San Jose', 300, 1007),
(2007, 'Pereira', 'Rome', 100, 1004);

create table ORDERS(
id serial primary key,
onum int not null,
amt decimal(10,2),
odate date,
cnum int not null,
snum int not null
);
insert ORDERS (onum, amt, odate, cnum, snum)
values
(3001, 18.69, '1990-03-10', 2008, 1007),
(3003, 767.19, '1990-03-10', 2001, 1001),
(3002, 1900.10, '1990-03-10', 2007, 1004),
(3005, 5160.45, '1990-03-10', 2003, 1002),
(3006, 1098.16, '1990-03-10', 2008, 1007),
(3009, 1713.23, '1990-04-10', 2002, 1003),
(3007, 75.75, '1990-04-10', 2004, 1002),
(3008, 4723.00, '1990-05-10', 2006, 1001),
(3010, 1309.95, '1990-06-10', 2004, 1002),
(3011, 9891.88, '1990-06-10', 2006, 1001);

-- part 1
-- 1
select city, cname, snum from CUSTOMERS;
-- 2
select rating, cname from CUSTOMERS
where city = 'San Jose';
-- 3
select distinct snum from SALESPEOPLE;
-- 4
select * from CUSTOMERS where cname LIKE 'G%';
-- 5
select * from ORDERS where amt > 1000;
-- 6
select min(amt) from ORDERS;
-- 7
select * from CUSTOMERS
where rating > 100 and city <> 'Rome';

-- part 2
-- 1
select * from staff
order by salary desc;
select * from staff
order by salary;
-- 2
SELECT * FROM staff
WHERE salary IN (
SELECT salary FROM staff
ORDER BY salary DESC
LIMIT 5
)
ORDER BY salary;
-- 3
SELECT post, SUM(salary) as сумма_зарплаты
FROM staff
GROUP BY post
HAVING SUM(salary) > 100000;