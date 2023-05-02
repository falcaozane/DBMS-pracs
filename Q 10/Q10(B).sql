drop table emp;
create table emp(id int, name text, salary real);
insert into emp values(1,'jenny',1000);
insert into emp values(2,'janvi',2000);
insert into emp values(3,'anuf',3000);
select * from emp;
create or replace function avg_salary() returns numeric(10,2) as
$$
declare
total numeric(10,2):=0;
count int:=0;
avg numeric(10,2);
begin
select sum(salary), count(*) into total, count from emp;
avg := total/count;
RAISE NOTICE 'Average of salary is %', avg;
RETURN avg;
end;
$$
language plpgsql;
select avg_salary();
