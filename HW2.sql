use Mysecond_DB;
create table HW2
(
id serial primary key,
order_date date not null,
product_count int
);
insert HW2 (order_date, product_count)
values
('2022-01-01', 156),
('2022-01-02', 180),
('2022-01-03', 21),
('2022-01-04', 124),
('2022-01-05', 341);

SELECT id, product_count,
	CASE
      WHEN product_count < 100 THEN 'Маленький заказ'
      WHEN product_count BETWEEN 100 AND 300 THEN 'Средний заказ'
      ELSE 'Большой заказ'
   END AS 'Тип заказа'
FROM HW2;

create table HW2_orders
(
id serial primary key,
eployee_id varchar(10) not null,
amount decimal(5,2),
order_status ENUM ('OPEN', 'CLOSED', 'CANCELLED')
);

INSERT INTO HW2_orders (`eployee_id`, `amount`, `order_status`) 
VALUES 
('e03', 15.00, 'OPEN'),
('e01', '25.50', 'OPEN'),
('e05', '100.70', 'CLOSED'),
('e02', '22.18', 'OPEN'),
('e04', '9.50', 'CANCELLED');

SELECT eployee_id,
	CASE
		WHEN order_status = 'OPEN' THEN 'Order is in open state'
        WHEN order_status = 'CLOSED' THEN 'Order is closed'
        ELSE 'Order is cancelled'
	END AS 'full_order_status'
FROM HW2_orders;
