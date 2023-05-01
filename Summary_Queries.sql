USE computer_store;

-- "Calculate the total number of products in the 'products' table."
SELECT COUNT(*) from product;


-- "Calculate the total number of manufacturers in the 'manufacturer' table."
SELECT COUNT(*) from manufacturer;


-- "Calculate the number of distinct manufacturer identifier values that appear in the 'products' table."
SELECT COUNT(DISTINCT product.ID_Manufacturer) from product
join manufacturer on product.ID_Manufacturer = manufacturer.ID_Manufacturer;


-- "Calculate the average price of all products."
SELECT AVG(price) from product;


-- "Calculate the cheapest price among all products."
SELECT * from product where price = (SELECT min(price) from product);


-- "Calculate the most expensive price among all products."
SELECT * from product where price = (SELECT max(price) from product);


-- "Calculate the sum of prices of all products."
SELECT sum(price) from product;


-- "Calculate the number of products that the manufacturer Asus has."
SELECT COUNT(*) from product
join manufacturer on product.ID_Manufacturer = manufacturer.ID_Manufacturer
where manufacturer.ID_Manufacturer like "Asus";


-- "Calculate the average price of all products from the manufacturer Asus."
SELECT AVG (price) Asus_AVG_price from product
join manufacturer on product.ID_Manufacturer = manufacturer.ID_Manufacturer
where manufacturer.ID_Manufacturer like "Asus";


-- "Calculate the cheapest price among all products from the manufacturer Asus."
SELECT min (price) from product
join manufacturer on product.ID_Manufacturer = manufacturer.ID_Manufacturer
where manufacturer.ID_Manufacturer like "Asus";


-- "Calculate the most expensive price among all products from the manufacturer Asus."
SELECT max (price) from product
join manufacturer on product.ID_Manufacturer = manufacturer.ID_Manufacturer
where manufacturer.ID_Manufacturer like "Asus";


-- "Calculate the sum of prices of all products from the manufacturer Asus."
SELECT sum (price) from product
join manufacturer on product.ID_Manufacturer = manufacturer.ID_Manufacturer
where manufacturer.ID_Manufacturer like "Asus";


-- "Show the maximum price, minimum price, average price, and the total number of products
-- that the manufacturer Crucial has."
SELECT  max (price) AS max_price,  min (price) AS min_price, avg (price) AS avg_price, count (*) AS total_products 
FROM product join manufacturer on product.ID_Manufacturer = manufacturer.ID_Manufacturer
WHERE manufacturer.name = 'Crucial';


-- Show the total number of products each manufacturer has. The listing should also include manufacturers
-- that have no products. The result will display two columns, one with the manufacturer's name and another 
--with the number of products they have. Sort the result in descending order by the number of products.
SELECT manufacturer.ID_Manufacturer, COUNT(product.ID_Manufacturer) from product
RIGHT join  manufacturer on product.ID_Manufacturer = manufacturer.ID_Manufacturer
GROUP BY (manufacturer.ID_Manufacturer);


-- Show the maximum price, minimum price, and average price of products for each manufacturer.
-- The result will display the manufacturer's name along with the requested data.
SELECT manufacturer.ID_Manufacturer, count (product.name) products, max (price), min (price), avg (price) from product
join manufacturer on product.ID_Manufacturer = manufacturer.ID_Manufacturer
GROUP BY (manufacturer.ID_Manufacturer);


-- Show the maximum price, minimum price, average price, and total number of products for manufacturers 
--whose average price is above 200€. It is not necessary to display the manufacturer's name;
-- the manufacturer's identifier is sufficient.

SELECT manufacturer.ID_Manufacturer, count (product.name) products, max (price), min (price), avg (price) 
as AVG_Price from product join manufacturer on product.ID_Manufacturer = manufacturer.ID_Manufacturer
GROUP BY (manufacturer.ID_Manufacturer) having AVG_Price > 200;


-- Show the name of each manufacturer along with the maximum price, minimum price, average price, 
--and total number of products for manufacturers whose average price is above 200€.
-- It is necessary to display the manufacturer's name.
SELECT manufacturer.name, count (product.name) products, max (price), min (price), avg (price) 
as AVG_Price from product join manufacturer on product.ID_Manufacturer = manufacturer.ID_Manufacturer
GROUP BY (manufacturer.name) HAVING AVG_Price > 200;


--Show the number of products that have a price greater than or equal to 180€
SELECT COUNT(*) from product where price >= 180;


-- List the average price of each manufacturer's products, displaying only the manufacturer's identifier.
SELECT manufacturer.ID_Manufacturer, avg(product.price) from product 
join manufacturer on product.ID_Manufacturer = manufacturer.ID_Manufacturer
GROUP BY manufacturer.ID_Manufacturer;


-- List the average price of each manufacturer's products, displaying only the manufacturer's name.
SELECT manufacturer.name, avg(product.price) from product 
join manufacturer on product.ID_Manufacturer = manufacturer.ID_Manufacturer
GROUP BY manufacturer.name;


-- List the names of the manufacturers whose products have an average price greater than or equal to 150€.
SELECT manufacturer.name, avg (price) 
as AVG_Price from product join manufacturer on product.ID_Manufacturer = manufacturer.ID_Manufacturer
GROUP BY (manufacturer.name) HAVING AVG_Price >= 150;


-- Return a list with the names of the manufacturers that have 2 or more products.
select manufacturer.Name, COUNT (product.name) products from product 
join manufacturer on product.ID_Manufacturer = manufacturer.ID_Manufacturer
GROUP BY (manufacturer.Name) HAVING products >= 2;


-- Return a list with the names of the manufacturers and the number of products that each one has
-- with a price greater than or equal to 220 €. It is not necessary to display the names of manufacturers 
--who do not have any products that meet the condition.
SELECT manufacturer.Name, COUNT(*) from product
join manufacturer on product.ID_Manufacturer = manufacturer.ID_Manufacturer 
where product.price >= 220
GROUP BY(manufacturer.Name);


-- Return a list with the names of the manufacturers where the sum of the price of all their products 
--is greater than 1000€.
SELECT manufacturer.Name, sum (product.price) Sum_Price from product
join manufacturer on product.ID_Manufacturer = manufacturer.ID_Manufacturer
GROUP BY (manufacturer.Name) HAVING Sum_price >1000;


--Return a list with the name of the most expensive product that each manufacturer has. 
--The result must have three columns: product name, price, and manufacturer name. 
--The result should be ordered alphabetically from least to greatest by manufacturer name.
select manufacturer.NAME, max (product.price), max(product.Name) from product
join manufacturer on product.ID_Manufacturer = manufacturer.ID_Manufacturer
GROUP BY manufacturer.ID_Manufacturer;