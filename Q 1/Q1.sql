DROP TABLE client_master;
DROP TABLE product_master;
CREATE TABLE client_master(client_no varchar(6), client_name VARCHAR(20), address VARCHAR(30),
city
varchar(15), pincode numeric(8),client_state varchar(15),bal_due numeric(10,2));
INSERT INTO client_master VALUES('C001', 'Sam', 'Kothrud', 'Pune', 411077, 'Maharashtra',
10000.23);
INSERT INTO client_master VALUES('C002', 'John', 'Kurla', 'Mumbai', 400087, 'Tamil Nadu',
50000.55);
INSERT INTO client_master VALUES('C003', 'Jack', 'Kishan Nagar', 'Gandhinagar', 400055, 'Gujarat',
25000.93);
INSERT INTO client_master VALUES('C004', 'Ann', 'Charminar', 'Hyderabad', 400090, 'Telangana',
77000.00);
INSERT INTO client_master VALUES('C005', 'Piter', 'Bandra', 'Mumbai', 400045, 'Maharashtra',
88000.23);
INSERT INTO client_master VALUES('C006', 'Nick', 'Vasai', 'Mumbai', 400077, 'Maharashtra',
10000.23);
SELECT * FROM client_master;
CREATE TABLE product_master(product_no varchar(6), description VARCHAR(15), profit_percent
numeric(4,2), unit_measure varchar(10), qty_on_hand numeric(8),reorder_level
numeric(8),sell_price numeric(8,2),cost_price numeric(8,2));
SELECT * FROM product_master;
INSERT INTO product_master VALUES('p1', 'laptop', 30.12, 'low', 50, 13000, 60000.23, 50000.34);
INSERT INTO product_master VALUES('p2', 'refrigerator', 30.92, 'medium', 4354, 42255, 42423.24,
35000.55);
INSERT INTO product_master VALUES('p3', 'hard disk', 10.00, 'high', 78, 8723, 3500.00, 2500.00);
INSERT INTO product_master VALUES('p4', 'mixture', 40.12, 'low', 2535, 44000, 10000.23, 8000.34);
INSERT INTO product_master VALUES('p5', 'washing machine', 35.12, 'high', 9000, 90000, 40000.99,
28000.90);
SELECT * FROM product_master;
SELECT client_name FROM client_master;
SELECT * FROM client_master;
SELECT client_name,city FROM client_master;
SELECT description FROM product_master;
SELECT * FROM client_master WHERE city='Mumbai';
UPDATE client_master SET city='Mumbai' WHERE client_no='C001';
UPDATE client_master SET bal_due=1000 WHERE client_no='C005';
UPDATE product_master SET cost_price=3000 WHERE description='hard disk';
DELETE FROM product_master WHERE qty_on_hand<100;
DELETE FROM client_master WHERE client_state='Tamil Nadu';
