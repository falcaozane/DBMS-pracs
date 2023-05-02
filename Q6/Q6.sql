CREATE TABLE sales_order_details (
 order_no VARCHAR(6),
 product_no VARCHAR(6),
 qty_ordered NUMERIC(8),
 qty_disp NUMERIC(8),
 product_rate NUMERIC(10,2),
 CONSTRAINT order_no_unique UNIQUE (order_no)
);
CREATE TABLE customer (
 cid INT,
 cname VARCHAR(50),
 address VARCHAR(100),
 pno VARCHAR(15),
 PRIMARY KEY (cid)
);
CREATE TABLE cust_order (
 cid INT,
 order_no VARCHAR(6),
 FOREIGN KEY (cid) REFERENCES customer(cid),
 FOREIGN KEY (order_no) REFERENCES sales_order_details(order_no)
);
drop table sales_order_details;
drop table customer;
drop table cust_order;
INSERT INTO sales_order_details VALUES
('ORD001', 'P001', 10, 5, 100.00),
('ORD002', 'P002', 5, 5, 50.00),
('ORD003', 'P003', 20, 10, 200.00),
('ORD004', 'P001', 15, 10, 100.00),
('ORD005', 'P004', 8, 8, 80.00),
('ORD006', 'P005', 12, 10, 120.00);
INSERT INTO customer VALUES
(101, 'John Doe', '123 Main St', '555-1234'),
(102, 'Jane Smith', '456 Oak Ave', '555-5678'),
(103, 'Bob Johnson', '789 Elm St', '555-9012'),
(104, 'Mary Lee', '101 Pine St', '555-3456'),
(105, 'Tom Jones', '234 Maple Ave', '555-7890');
INSERT INTO cust_order VALUES
(101, 'ORD001'),
(102, 'ORD002'),
(103, 'ORD003'),
(101, 'ORD004'),
(104, 'ORD005'),
(105, 'ORD006');
select*from sales_order_details;
select*from customer;
select*from cust_order;
--q3
SELECT Product_no, SUM(Qty_ordered) AS total_qty_sold
FROM sales_order_details
GROUP BY Product_no;
--q4
SELECT Product_no, SUM(Qty_disp * Product_rate) AS total_value_sold
FROM sales_order_details
GROUP BY Product_no;
--q5
SELECT c.cname, AVG(s.Qty_ordered) AS avg_qty_sold
FROM customer c
JOIN cust_order co ON c.cid = co.cid
JOIN sales_order_details s ON co.order_no = s.order_no
WHERE co.order_no IN (
 SELECT order_no
 FROM sales_order_details
 GROUP BY order_no
 HAVING SUM(Qty_disp * Product_rate) <= 15000
)
GROUP BY c.cname;
--q6
SELECT SUM(Qty_disp * Product_rate) AS total_billed
FROM sales_order_details
WHERE order_no LIKE 'JAN%';
--q7
SELECT DISTINCT c.cname
FROM customer c
JOIN cust_order co ON c.cid = co.cid
JOIN sales_order_details s ON co.order_no = s.order_no
WHERE s.Qty_ordered > 10;
--q8
SELECT c.cname, s.Product_no, MAX(s.Qty_ordered) AS max_qty_ordered
FROM customer c
JOIN
