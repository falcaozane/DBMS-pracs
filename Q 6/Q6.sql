Create Table Salesss( order_no
varchar(6) PRIMARY KEY,
product_no varchar(6),
qty_ordered numeric(8), qty_disp
numeric(8),
product_rate numeric(10,2)
);
select * from Salesss;
insert into Salesss
values('Or001','P001',12,10,100);
insert into Salesss
values('Or002','P002',22,11,200);
insert into Salesss
values('Or003','P003',32,12,300);
insert into Salesss
values('Or004','P004',42,13,400);
insert into Salesss
values('Or005','P005',52,14,500);
Create Table customers( cid
numeric(8) PRIMARY KEY, 
cname varchar(8), address
varchar(8),
pno numeric(8))
select * from customers;
insert into customers
values(1,'Namrata','Andheri',123);
insert into customers
values(2,'Neha','Dresden',345);
insert into customers
values(3,'Pearl','Parle',456); insert
into customers
values(4,'Risa','Vasai',567); insert
into customers
values(5,'Nimish','Virar',678);
CREATE TABLE customer_orders
(
 cid INTEGER REFERENCES customers(cid),
 order_no VARCHAR(6) REFERENCES Salesss(order_no)
);
select * from customer_orders;
insert into customer_orders
values(1,'Or001'); insert
into customer_orders
values(2,'Or002'); insert
into customer_orders
values(3,'Or003'); insert
into customer_orders
values(4,'Or004'); insert
into customer_orders
values(5,'Or005');
select order_no,product_no,qty_disp from Salesss;
select qty_disp*product_rate as total_value from Salesss;
SELECT c.cid,
c.cname,
 AVG(s.qty_disp) AS avg_qty_sold
FROM customers c
JOIN customer_orders co ON c.cid = co.cid
JOIN Salesss s ON co.order_no = s.order_no
WHERE co.order_no IN (
 SELECT order_no
 FROM Salesss
 GROUP BY order_no 
 HAVING SUM(product_rate * qty_disp) <= 15000
)
GROUP BY c.cid;
SELECT c.cname
FROM customers c
JOIN customer_orders co ON c.cid = co.cid
JOIN Salesss s ON co.order_no = s.order_no
WHERE s.qty_ordered > 10;
WITH max_qty AS (
 SELECT product_no,
 MAX(qty_disp) AS max_qty
 FROM sales_order_details
 GROUP BY product_no
)
WITH max_qty AS (
 SELECT product_no,
 MAX(qty_disp) AS max_qty
 FROM Salesss
 GROUP BY product_no
)
SELECT c.cname,
 s.product_no
FROM customers c
JOIN customer_orders co ON c.cid = co.cid
JOIN Salesss s ON co.order_no = s.order_no
JOIN max_qty mq ON s.product_no = mq.product_no AND s.qty_disp = mq.max_qty; 
