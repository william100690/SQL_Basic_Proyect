use computer_store;

-- "Return a list with the name of the product, price, and name of the manufacturer of all products in the database."
select product.name, product.price, manufacturer.name from product
join manufacturer on product.ID_Manufacturer = manufacturer.ID_Manufacturer;


-- "Return a list with the name of the product, price, and name of the manufacturer of all products in the database. 
--Sort the result by the name of the manufacturer in alphabetical order"
select product.name, product.price, manufacturer.name from product
join manufacturer on product.ID_Manufacturer = manufacturer.ID_Manufacturer 
ORDER BY manufacturer.Name asc;


-- Return a list with the product ID, product name,
-- manufacturer ID, and manufacturer name of all products in the database.
select * from product
join manufacturer on product.ID_Manufacturer = manufacturer.ID_Manufacturer 
ORDER BY manufacturer.Name asc;


-- "Return the name of the product, its price, and the name of its manufacturer, of the cheapest product."
select * from product
join manufacturer on product.ID_Manufacturer = manufacturer.ID_Manufacturer 
ORDER BY product.price asc LIMIT 1;


-- "Return the name of the product, its price, and the name of its manufacturer, of the most expensive product."
select * from product
join manufacturer on product.ID_Manufacturer = manufacturer.ID_Manufacturer 
ORDER BY product.price desc LIMIT 1;


-- "Return a list of all products from the manufacturer Lenovo."
SELECT * from product
join manufacturer on product.ID_Manufacturer = manufacturer.ID_Manufacturer
WHERE manufacturer.name = "Lenovo";


-- "Return a list of all products from the manufacturer Crucial that have a price greater than €200."
SELECT * from product
join manufacturer on product.ID_Manufacturer = manufacturer.ID_Manufacturer
WHERE manufacturer.name = "Crucial" and price > 200;


-- "Return a list with all products from the manufacturers Asus, Hewlett-Packard, and Seagate. 
--Without using the IN operator."
SELECT * from product
join manufacturer on product.ID_Manufacturer = manufacturer.ID_Manufacturer
WHERE manufacturer.name = "Asus" or manufacturer.name = "Hewlett-Packard" or manufacturer.name = "Seagate" ;


-- Return a list with all products from the manufacturers Asus, Hewlett-Packard, and Seagate. Using the IN operator
SELECT * from product
join manufacturer on product.ID_Manufacturer = manufacturer.ID_Manufacturer
WHERE manufacturer.name in ("Asus", "Hewlett-Packard", "Seagate");


-- "Return a list with the name and price of all products whose manufacturer name contains the character w in its name."
SELECT product.name, product.price, manufacturer.name from product
join manufacturer on product.ID_Manufacturer = manufacturer.ID_Manufacturer
where manufacturer.name LIKE '%w%';


-- "Return a list with the product name, price, and manufacturer name of all products that have a price 
--greater than or equal to €180. Sort the result first by price (in descending order) and secondly by name 
--(in ascending order)."
SELECT product.name, product.price, manufacturer.name from product
join manufacturer on product.ID_Manufacturer = manufacturer.ID_Manufacturer
where price >= 180;


-- "Return a list with the identifier and manufacturer name, only of those manufacturers who have associated 
--products in the database."
SELECT DISTINCT product.ID_Manufacturer, manufacturer.Name from product
join manufacturer on product.ID_Manufacturer = manufacturer.ID_Manufacturer;


-- "Return a list of all manufacturers in the database, along with the products each one has. 
--The list should also display those manufacturers who do not have associated products."
SELECT DISTINCT manufacturer.ID_Manufacturer, manufacturer.Name, product.Name from product
RIGHT join manufacturer on product.ID_Manufacturer = manufacturer.ID_Manufacturer;


-- "Return a list where only those manufacturers who do not have any associated products are listed."
SELECT DISTINCT manufacturer.ID_Manufacturer, manufacturer.Name, product.Name from product
RIGHT join manufacturer on product.ID_Manufacturer = manufacturer.ID_Manufacturer
WHERE product.Name is null;