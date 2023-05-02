create table emp( empno numeric(4), ename varchar(10), designation varchar(10), salary
numeric(8,2));
insert into emp values (1,'jenny','manager',200000.00);
select * from emp;
alter table emp alter column empno set data type numeric(6);
alter table emp add column qualification varchar(6);
alter table emp add column dob date, add column doj date;
alter table emp drop column doj;
alter table emp drop column dob, drop column qualification;
truncate table emp;
drop table emp;
