$$
declare
fact int;
begin
if n=0 then
return 1;
else
fact:=n*fact(n-1);
return fact;
raise notice 'factorial of % is %',n,fact;
end if;
end;
$$
language plpgsql;
select fact(5);


