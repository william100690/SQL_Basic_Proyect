USE computer_store;

-- list the name of all the products that are in the product table
SELECT NAME from product;


-- list the name and the prices of all the products from product table
SELECT name, price from product;


-- list all the columns from the product table
SELECT * from product;


-- list the name of the products, the price in EUROS and price in USD dollars
SELECT Name, price usd, price * 0.90 euros from product; 


-- change the name of the products to UPPER
UPDATE product set Name = UPPER(Name);
SELECT * from product;


-- change the name of the products to LOWER
UPDATE product set Name = LOWER(Name);
SELECT* from product;


-- list all the manufacturers name on a column, in other column list in upper the 2 first letters of the 
-- manufacturer Name
SELECT Name, UPPER (LEFT(Name, 2)) from manufacturer;


-- List the names and prices of all products in the product table, rounding the price value.
SELECT NAME, ROUND(Price, 1) from product;


-- List the names and prices of all products in the product table, 
--truncating the price value to display it without any decimal places.
SELECT NAME, TRUNCATE(Price, 0) from product;


-- List the identifier of the manufacturers that have products in the product table.
SELECT product.ID_Manufacturer, manufacturer.name from product
join manufacturer on product.ID_Manufacturer = manufacturer.ID_Manufacturer;


-- List the identifier of the manufacturers that have products in the product table,
-- removing any duplicate identifiers.
SELECT DISTINCT product.ID_Manufacturer, manufacturer.name from product
join manufacturer on product.ID_Manufacturer = manufacturer.ID_Manufacturer;


-- List the names of the manufacturers sorted in ascending order.
SELECT * from manufacturer ORDER BY NAME ASC;


-- Lista los nombres de los fabricantes ordenados de forma descendente.
SELECT * from manufacturer ORDER BY NAME DESC;


-- List the names of the products sorted first by name in ascending order and then by price in descending order.
SELECT * from product ORDER BY NAME asc;
SELECT * from product ORDER BY NAME DESC;


-- Return a list with the first 5 rows of the manufacturer table.
SELECT * FROM manufacturer LIMIT 5;


-- Return a list with 2 rows starting from the fourth row of the manufacturer table. 
--The fourth row should also be included in the response.
SELECT * from manufacturer LIMIT 2 OFFSET 3;


-- List the name and price of the cheapest product. (Use only the ORDER BY and LIMIT clauses)
SELECT * from product ORDER BY price asc LIMIT 1;


-- List the name and price of the most expensive product. (Use only the ORDER BY and LIMIT clauses)
SELECT * from product ORDER BY price DESC LIMIT 1;


-- List the name of all products from the manufacturer whose manufacturer identifier is equal to 2.
SELECT * from product where ID_Manufacturer = 2;


-- List the name of the products that have a price less than or equal to 120€.
select * from product where Price >= 120;


-- List the name of the products that have a price less than or equal to 400€. 
select * from product where Price >= 400;


-- List the name of the products that do not have a price greater than or equal to 400€.
SELECT * from product where Price < 400;


-- List all the products that have a price between 80€ and 300€. Without using the BETWEEN operator.
SELECT * from product where price >= 80 and price <= 300;


--List all the products that have a price between 60€ and 200€. Using the BETWEEN operator.
SELECT * from product WHERE price BETWEEN 60 AND 200;


-- List all the products that have a price greater than 200€ and whose manufacturer identifier is equal to 6.
SELECT * from product where price >= 200 and ID_Manufacturer = 6;


-- List all products where the manufacturer identifier is 1, 3, or 5. Without using the IN operator.
SELECT * from product where ID_Manufacturer = 1 or ID_Manufacturer = 3 or ID_Manufacturer = 5;


-- List all products where the manufacturer identifier is 1, 3, or 5. Using the IN operator.
SELECT * from product where ID_Manufacturer in (1,3,5);


-- List the name and price of the products in cents (the price value will need to be multiplied by 100). 
--Create an alias for the column that contains the price called 'cents'
SELECT name, price * 100 cents FROM product;


-- List the names of the manufacturers whose names begin with the letter S.
SELECT * from manufacturer where left(name,1) = "S";


-- "List the names of the manufacturers whose names end with the vowel e."
SELECT * from manufacturer where right(name,1) = "e";


-- List the names of the manufacturers whose names contain the character w."
SELECT * from manufacturer where name like '%w%';


-- "List the names of the manufacturers whose names are 4 characters long."
SELECT * from manufacturer where LENGTH(Name)=4;


-- Return a list with the name of all products that contain the string 'Portátil' in their name.
SELECT * from product where name like '%Portátil%';


-- Return a list with the name of all products that contain the string 'Monitor' in their name 
--and have a price lower than €215.
SELECT * from product where name like '%Monitor%' and price <= 215;


-- List the name and price of all products that have a price greater than or equal to €180. 
--Sort the result first by price (in descending order) and then by name (in ascending order).
SELECT * from product WHERE price >= 180 ORDER BY price DESC;
SELECT * from product WHERE price >= 180 ORDER BY price ASC;