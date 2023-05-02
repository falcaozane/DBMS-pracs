DROP TABLE client_master;
DROP TABLE product_master;
DROP TABLE sales_order;
CREATE TABLE sales_order(
order_no varchar(6),
order_date date,
Client_no varchar(6),
Dely_addr varchar(25),
Salesman_no varchar(6),
Dely_type char(5),
Billed_yn char(1),
Dely_date date,
Order_status varchar(10)
);
CREATE TABLE client_master(
client_no varchar(6), client_name varchar(20),
address varchar(30), city varchar(15),
pincode numeric(8), client_state
varchar(15), due_bal numeric(10,2)
);
CREATE TABLE product_master(
product_no varchar(6), description varchar(15),
profit_percent numeric(4,2),
unit_measure varchar(10),
qty_on_hand varchar(8), reorder_level
numeric(8), sell_price numeric(8,2),
cost_price numeric(8,2)
);
INSERT INTO client_master VALUES('C001','Sam','Kothrud','Pune',411077,'Maharashtra',10000.23);
INSERT INTO client_master VALUES('C002','John','Kurla','Mumbai',400087,'Maharashtra',50000.55);
INSERT INTO client_master VALUES('C003','Jack','Kishan
Nagar','Gandhinagar',400055,'Gujarat',25000.93);
INSERT INTO client_master VALUES('C004','Ann','Charminar','Hydrabad',400090,'Andhra
Pradesh',77000.00);
INSERT INTO client_master
VALUES('C005','Peter','Bandra','Mumbai',400045,'Maharashtra',88000.23);
INSERT INTO client_master VALUES('C006','Nick','Vasai','Mumbai',400077,'Maharashtra',10000.23);
INSERT INTO product_master VALUES('P1','Laptop',30.12,'low',1200,13000,60000.23,50000.34);
INSERT INTO product_master
VALUES('P2','Refrigerator',30.92,'medium',4354,42255,42423.24,35000.55);
INSERT INTO product_master VALUES('P3','Hard Disk',10.00,'high',5678,8723,3500.00,2500.00);
INSERT INTO product_master VALUES('P4','Mixture',40.12,'low',2535,44000,10000.23,8000.34);
INSERT INTO product_master VALUES('P5','Washing
Machine',35.12,'high',9000,90000,40000.99,28000.90);
insert into sales_order values('1','2022-02-11','C001','Link Road','S001','FAST','Y','2022-02-
15','CONFIRMED');
insert into sales_order values('2','2022-01-13','C002','Link Road','S001','REG','Y','2022-02-
14','CONFIRMED');
insert into sales_order values('3','2022-02-01','C003','Andheri','S002','FAST','N','2022-03-
25','CANCELLED');
insert into sales_order values('4','2021-12-21','C004','Matunga','S004','REG','Y','2022-03-
13','DELIVERY');
insert into sales_order values('5','2022-01-10','C005','Bandra','S003','REG','N','2022-04-
25','CONFIRMED');
insert into sales_order values('6','2021-11-30','C006','Worli','S001','REG','Y','2022-02-15','DELIVERY');
select * from client_master;
select * from product_master;
select * from sales_order;
select * from client_master where client_name like '_a%';
select * from client_master where substr(client_name,2,1)='a';
select * from client_master where city like '_a%';
select * from client_master where city='Mumbai' order by client_name asc;
select * from client_master where due_bal>10000;
select * from sales_order where to_char(Order_date,'mm')='01';
select * from client_master where client_no in('C001','C002');
select * from product_master where Sell_price>2000 AND sell_price<=5000;
select description, sell_price*1.5 as new_price from product_master where sell_price>1500;
select count(*) as total_count from sales_order;
select avg(sell_price) as avg_sell_price from product_master;
select min(sell_price) as min_sell_price, max(sell_price) as max_sell_price from product_master;
select count(*) as sell_price_greater_than_or_equal_to_1500 from product_master where
sell_price>=1500;
select order_no, to_char(order_date,'dd') as day_of_order from sales_order;
select to_char(order_date,'dd-month-yy') as order_date_dd_mm_yy from sales_order;
select to_char(Dely_date,'Month dd') as delivery_date from sales_order;
select current_date + interval '15 days' as date_15_days_after_today;
select now()-Dely_date as days_elapsed from sales_order;
