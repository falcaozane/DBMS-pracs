create table emp(id int, name text, salary real);
insert into emp values(1,'jenny',1000);
insert into emp values(2,'janvi',2000);
insert into emp values(3,'anuf',3000);
select * from emp;
drop table emp;
create or replace function
insertrow()returns trigger
as $$
declare a
date;begin
select current_date into
a;raise notice 'Date: %',a;
return new;
end;
$$
language plpgsql;
create trigger inserttrig
after insert on emp for each
row execute procedure
insertrow();
insert into emp values(5,'joey',80000);
drop trigger inserttrig on emp;
create or replace function updaterow() returns trigger as
$$
declare
a date;
begin
select current_date into a;
raise notice 'Date: %',a;
return new;
end;
$$
language plpgsql;
create trigger updatetrig after update on emp for each row execute procedure updaterow();
update emp set name='john' where id=1;
create or replace function deleterow() returns trigger as
$$
declare
a date;
begin
select current_date into a;
raise notice 'Date: %',a;
return old;
end;
$$
language plpgsql;
create trigger deletetrig after delete on emp for each row execute procedure deleterow();
delete from emp where id=2;
create or replace function insertrow() returns trigger as
$$
begin
raise notice 'insertion not allowed.';
return null;
end;
$$
language plpgsql;
create trigger inserttrig before insert on emp for each row execute procedure insertrow();
insert into emp values(2,'jenny',3000);
drop trigger deletetrig on emp
create or replace function deleterow() returns trigger as
$$
begin
raise notice 'deletion not allowed.';
return null;
end;
$$
language plpgsql;
create trigger deletetrig before delete on emp for each row execute procedure deleterow();
delete from emp where id=3;
drop trigger updatetrig on emp
create or replace function updatetrig() returns trigger as
$$
begin
raise notice 'updation not allowed.';
return null;
end;
$$
language plpgsql;
create trigger updatetrig before update on emp for each row execute procedure updatetrig();
update emp set name='rue' where id=3;
