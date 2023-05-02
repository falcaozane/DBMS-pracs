create table company1( id int, company1_name text not null, age int not null, address varchar(50),
salary real );
INSERT INTO company1 (company1_name) VALUES (NULL);
INSERT INTO company1(age) VALUES (NULL);
select * from company1;
create table company3( id int not null, name text not null, age int unique, address varchar(50), salary
real);
select * from company3;
insert into company3 values(1, 'jenny',20, 'parijatak',12345);
insert into company3 values(2,'janvi',20,'kofraad',3456);
create table company4( id int primary key, name text, age int, address varchar(50), salary real);
insert into company4 values(1, 'jenny',20, 'parijatak',12345);
insert into company4 values(1,'janvi',20,'kofraad',3456);
create table employee( id int primary key, name text, age int, address varchar(50), salary real);
create table department(id int primary key, name varchar(50) not null, emp_id int references
employee(id));
insert into employee values(1, 'jenny',20, 'parijatak',12345);
insert into employee values(2,'janvi',20,'kofraad',3456);
insert into department values(3,'jenny',433);
create table company5( id int, name text, age int, address varchar(50), salary real check(salary > 0));
insert into company5 values(1,'jenny',22,'parijatak',-2);
