-- sum of 3 digit number
create or replace function sum_three(num int) returns int as 
$$
declare 
	total int:=0;
	digit int;
begin
	digit:= num/100;
	total=total+digit;
	
	digit:=(num%100)/10;
	total=total+digit;
	
	digit:=num%10;
	total=total+digit;
	
	return total;
end;
$$ language plpgsql;

select sum_three(345);

--Write a block to display square of 1 to 10

DO $$
DECLARE
   i INTEGER := 1;
BEGIN
   WHILE i <= 10 LOOP
      RAISE NOTICE 'The square of % is %', i, i*i;
      i := i + 1;
   END LOOP;
END $$;

--Write a function to find fibo for n numbers
create or replace function fibo(n int) returns int as 
$$
DECLARE 
 a int:=0;
 b int:=1;
 c int:=0;
BEGIN 
	FOR i in 0..n-1 LOOP
	raise notice '%',a; 
 	c=a; 
 	a=b; 
 	b=c+b; 
 	END LOOP;
	return c;
end;
$$ language plpgsql;

select fibo(7);

--Write a function to find factorial of a number
create or replace function fact(n int) returns int as 
$$
DECLARE 
 fact int:=1; 
BEGIN 
	WHILE n>0 LOOP 
	fact:=n*fact; 
	n:=n-1; 
	END LOOP; 
	return fact;
end;
$$ language plpgsql;

select fact(6);
