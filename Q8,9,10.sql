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

-- fibo
do $$ 
DECLARE 
 n1 int:=0; 
 n2 int:=1; 
 temp int:=0; 
BEGIN 
 	FOR i in 0..7 LOOP 
 	raise notice '%',n1; 
 	temp=n1; 
 	n1=n2; 
 	n2=temp+n2; 
 	END LOOP; 
end $$;

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
