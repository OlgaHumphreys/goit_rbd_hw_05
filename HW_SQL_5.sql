use hw3;

SELECT od.*, (SELECT id FROM orders as o WHERE od.order_id = o.id) as id_1
FROM order_details as od;

-- 2

SELECT od.*
FROM order_details as od
WHERE order_id IN (SELECT id FROM orders WHERE shipper_id =3)
;

-- 3

SELECT temp.id, AVG(temp.quantity)
FROM (SELECT * FROM order_details WHERE order_id >10) as temp
GROUP BY temp.id;

-- 4

SELECT @@version;

WITH temp1 AS (SELECT * FROM order_details WHERE order_id >10) 
SELECT temp1.id, AVG(temp1.quantity)
FROM temp1
GROUP BY temp1.id;

-- 5

DROP FUNCTION IF EXISTS new_function;

delimiter //


CREATE FUNCTION `new_function` (
num1 float,
num2 float
) RETURNS float
NO SQL
DETERMINISTIC

BEGIN
 
 DECLARE result float;
 SET result = num1*num2;
 RETURN result;
 
END


//
delimiter ;

SELECT new_function(3,4);

-- 6

DROP FUNCTION IF EXISTS divide_values;

delimiter //


CREATE FUNCTION `divide_values` (
a float,
b float
) RETURNS float
NO SQL
DETERMINISTIC

BEGIN
 
 DECLARE result float;
 SET result = a/b;
 RETURN result;
 
END


//
delimiter ;

SELECT divide_values(12,4);


