CREATE TABLE prodmaster (
 Product_no VARCHAR(6),
 Product_desc VARCHAR(100),
 PRIMARY KEY (Product_no)
);
CREATE TABLE salesorderdetails (
 Order_no VARCHAR(6),
 Product_no VARCHAR(6),
 Qty_ordered NUMERIC(8),
 Qty_disp NUMERIC(8),
 Product_rate NUMERIC(10,2),
 PRIMARY KEY (Order_no, Product_no),
 FOREIGN KEY (Product_no) REFERENCES prodmaster(Product_no)
);
INSERT INTO prodmaster (Product_no, Product_desc) VALUES
 ('P001', 'Product 1'),
 ('P002', 'Product 2'),
 ('P003', 'Product 3'),
 ('P004', 'Product 4'),
 ('P005', 'Product 5');
INSERT INTO salesorderdetails (Order_no, Product_no, Qty_ordered, Qty_disp, Product_rate) VALUES
 ('O001', 'P001', 10, 5, 100.00),
 ('O002', 'P001', 15, 15, 100.00),
 ('O003', 'P002', 20, 20, 200.00),
 ('O004', 'P002', 25, 0, 200.00),
 ('O005', 'P003', 30, 0, 300.00);
-- Query to find non-moving products
SELECT p.Product_no, p.Product_desc
FROM prodmaster p
LEFT JOIN salesorderdetails sod ON p.Product_no = sod.Product_no
WHERE sod.Order_no IS NULL;
-- Create customer table
CREATE TABLE customere (
 Customer_no VARCHAR(6),
 Customer_name VARCHAR(100),
 Address VARCHAR(200),
 PRIMARY KEY (Customer_no)
);
-- Create sales_order table
CREATE TABLE salesorder (
 Order_no VARCHAR(6),
 Order_date DATE,
 Customer_no VARCHAR(6),
 PRIMARY KEY (Order_no),
 FOREIGN KEY (Customer_no) REFERENCES customere(Customer_no)
);
-- Insert sample data
INSERT INTO customere (Customer_no, Customer_name, Address) VALUES
 ('C001', 'Rahul Desai', 'Address 1'),
 ('C002', 'Sofia Vergara', 'Address 2'),
 ('C003', 'Phil Dunphy', 'Address 3'),
 ('C004', 'Alex Dunphy', 'Address 4'),
 ('C005', 'Manny Delgago', 'Address 5');
INSERT INTO salesorder (Order_no, Order_date, Customer_no) VALUES
 ('O191', '1996-07-01', 'C003'),
 ('O192', '1996-07-02', 'C004'),
 ('O193', '1996-07-03', 'C005'),
 ('O194', '1996-07-04', 'C001'),
 ('O195', '1996-07-05', 'C002');
-- Query to find customer name and address for Order no 'O191'
SELECT c.Customer_name, c.Address
FROM customere c
JOIN salesorder so ON c.Customer_no = so.Customer_no
WHERE so.Order_no = 'O191';
SELECT DISTINCT c.client_name
FROM salesorder o
JOIN client c ON o.client_no = c.client_no
WHERE o.order_date < '1996-05-01';
SELECT DISTINCT o.client_no, c.client_name
FROM salesorderdetails d
JOIN salesorder o ON d.order_no = o.order_no
JOIN client c ON o.client_no = c.client_no
JOIN prodmaster p ON d.product_no = p.product_no
WHERE p.product_description = '1.44 Drive';
SELECT c.client_name
FROM sales_order o
JOIN client c ON o.client_no = c.client_no
GROUP BY c.client_name
HAVING SUM(o.order_total) >= 10000;
SELECT *
FROM sales_order o
JOIN client c ON o.client_no = c.client_no
WHERE c.client_name = 'Rahul Desai';
SELECT p.product_no, p.product_description
FROM product_master p
LEFT JOIN sales_order_details d ON p.product_no = d.product_no
WHERE d.product_no IS NULL;
SELECT p.product_no, p.product_description, SUM(d.qty_ordered) AS total_qty_ordered
FROM product_master p
JOIN sales_order_details d ON p.product_no = d.product_no
GROUP BY p.product_no, p.product_description;
