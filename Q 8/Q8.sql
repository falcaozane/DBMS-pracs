$$
DECLARE
digit1 INTEGER;
digit2 INTEGER;
digit3 INTEGER;
sum INTEGER;
BEGIN
digit1 := num / 100;
digit2 := (num % 100) / 10;
digit3 := num % 10;
sum := digit1 + digit2 + digit3;
RAISE NOTICE 'Sum of digits of % is %', num, sum;
RETURN sum;
END;
$$
LANGUAGE PLPGSQL;
select sum_of_digits(345);

$$
DECLARE
num INTEGER := 1;
square INTEGER;
BEGIN
WHILE num <= 10 LOOP
square := num * num;
RAISE NOTICE '%^2 = %', num, square;
num := num + 1;
END LOOP;
END;
$$
LANGUAGE PLPGSQL;
select squares();
