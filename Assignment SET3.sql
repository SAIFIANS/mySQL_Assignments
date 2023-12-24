#SET 3 -


# Question 1 - 
/*
CREATE DEFINER=`root`@`localhost` PROCEDURE `order_status`(Year_Par INT, Month_Par INT)
BEGIN

SELECT orderNumber, orderDate, status FROM orders 
WHERE YEAR(orderDate) = Year_Par AND MONTH(orderDate) = Month_Par;

END
*/

call order_status(2005, 05);


# Question 2.a. - 

/*
CREATE DEFINER=`root`@`localhost` FUNCTION `pur_stat`(cNum int) RETURNS varchar(20) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
    DECLARE purchase_status VARCHAR(20);
    DECLARE credit numeric;
    SET credit = (select sum(amount) from payments where customerNumber = cNum);

    IF credit > 50000 THEN
        SET purchase_status = 'platinum';
    ELSEIF (credit >= 25000 AND 
            credit <= 50000) THEN
        SET purchase_status = 'gold';
    ELSEIF credit < 25000 THEN
        SET purchase_status = 'silver';
    END IF;
    RETURN (purchase_status);
END
*/

select assignment.pur_stat(103);


# Question 2.b. - 

SELECT customerNumber, customerName,assignment.pur_stat(146) FROM customers WHERE customerNumber = 146;


# Question 3 - 

SELECT * FROM movies;
SELECT * FROM rentals;

CREATE TRIGGER cascading_delete_movies
AFTER DELETE ON movies
FOR EACH ROW
BEGIN
    DELETE FROM rentals WHERE movieid = OLD.id;
END;


CREATE TRIGGER cascading_updating_rentals
AFTER UPDATE ON movies
FOR EACH ROW
BEGIN
	UPDATE rentals SET movieid = NEW.id WHERE movieid = OLD.id
END;


# Question 4 - 

SELECT * FROM employee ORDER BY salary DESC;

SELECT fname FROM employee ORDER BY salary DESC LIMIT 1 OFFSET 2;


# Question 5 - 

SELECT * FROM employee;

SELECT *,RANK() OVER(ORDER BY salary DESC) AS Employee_Rank FROM employee;