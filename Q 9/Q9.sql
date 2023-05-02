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

$$
DECLARE
prev1 INTEGER := 0;
prev2 INTEGER := 1;
fib INTEGER;
i INTEGER := 1;
BEGIN
WHILE i <= 8 LOOP
IF i = 1 THEN
fib := 0;
ELSEIF i = 2 THEN
fib := 1;
ELSE
fib := prev1 + prev2;
prev1 := prev2;
prev2 := fib;
END IF;
RAISE NOTICE 'Fibonacci(%): %', i, fib;
i := i + 1;
END LOOP;
END;
$$
LANGUAGE PLPGSQL;
select fibonacci();
