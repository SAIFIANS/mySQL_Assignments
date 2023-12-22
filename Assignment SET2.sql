#SET 2 -

#Question 1 -
SELECT * FROM employee 
WHERE deptno = 10 AND salary >3000;

#Question 2 a -
SELECT * FROM students;
SELECT COUNT(id) FROM students 
WHERE marks >=60 AND marks <=80;

#Question 2 b -
SELECT COUNT(id) FROM students 
WHERE marks >=80 AND marks <=100;

SELECT * FROM station;

#Question 3 -
SELECT DISTINCT city FROM station 
WHERE id %2 != 0;

#Question 4 -
SELECT COUNT(city) - COUNT(DISTINCT city) FROM station;

#Question 5.a -
SELECT DISTINCT city FROM station 
WHERE LEFT(city,1) IN ('a','e','i','o','u','A','E','I','O','U');

#Question 5.b -
SELECT DISTINCT city FROM station 
WHERE LEFT(city,1) IN ('a','e','i','o','u','A','E','I','O','U') AND RIGHT(city,1) IN ('a','e','i','o','u','A','E','I','O','U');

#Question 5.c -
SELECT DISTINCT city FROM station 
WHERE LEFT(city,1) NOT IN ('a','e','i','o','u','A','E','I','O','U');

#Question 5.d -
SELECT DISTINCT city FROM station 
WHERE LEFT(city,1) NOT IN ('a','e','i','o','u','A','E','I','O','U') OR RIGHT(city,1) NOT IN ('a','e','i','o','u','A','E','I','O','U');

#Question 6 -
SELECT * FROM emp;
SELECT * FROM emp WHERE salary > 2000 AND timestampdiff(MONTH,hire_date,NOW()) <36;


#Question 7 -
SELECT * FROM employee;
SELECT deptno, sum(salary) as total_salary FROM employee GROUP BY deptno;

#Question 8 -
SELECT * FROM city;
SELECT count(name) AS no_of_cities FROM city WHERE population > 100000;

#Question 9 -
SELECT * FROM city;
SELECT SUM(population) AS Total_Population FROM city WHERE district = 'California';

#Question 10 -
SELECT * FROM city;
SELECT district, AVG(population) AS Avg_Pop FROM city GROUP BY district;

#Question 11 -
SELECT * FROM orders;
SELECT orders.orderNumber, orders.status, orders.customerNumber, customers.customerName, orders.comments FROM orders 
JOIN customers ON orders.customerNumber = customers.customerNumber
WHERE orders.status = 'Disputed';
