USE computer_store;

-- Return all products from the manufacturer Lenovo. (Without using JOIN).
SELECT * from product p, manufacturer m WHERE p.ID_Manufacturer = m.ID_Manufacturer and m.Name = "Lenovo";


-- Return all data of the products that have the same price as the most expensive product from
-- the manufacturer Lenovo. (Without using JOIN).
SELECT * from product p, manufacturer m WHERE p.ID_Manufacturer = m.ID_Manufacturer
and p.price = (SELECT max(p.price) from product p, manufacturer m where m.name = "Lenovo" GROUP BY(m.name));


-- List the name of the most expensive product from the manufacturer Lenovo.
SELECT p.name product, m.name manufacturer, p.price from product p, manufacturer m WHERE p.ID_Manufacturer = m.ID_Manufacturer 
and p.price = (SELECT max(p.price) from product p, manufacturer m 
where p.ID_Manufacturer = m.ID_Manufacturer and m.name = "Lenovo" GROUP BY (m.Name));


-- List the name of the cheapest product from the manufacturer Hewlett-Packard.
SELECT p.name product, m.name manufacturer, p.price from product p, manufacturer m WHERE p.ID_Manufacturer = m.ID_Manufacturer 
and p.price = (SELECT min(p.price) from product p, manufacturer m 
where p.ID_Manufacturer = m.ID_Manufacturer and m.name = "Hewlett-Packard" GROUP BY (m.Name));


-- Return all products from the database that have a price greater than or equal to the most expensive 
--product from the manufacturer Lenovo.
SELECT * from product p, manufacturer m where p.ID_Manufacturer = m.ID_Manufacturer
and p.price >= (SELECT max(p.price) from product p, manufacturer m where p.ID_Manufacturer = m.ID_Manufacturer
and m.name = "Lenovo" GROUP BY m.name);


-- List all products from the manufacturer Asus that have a price greater than the average price of all their products.
SELECT * from product p, manufacturer m where p.ID_Manufacturer = m.ID_Manufacturer and m.name ="Asus"
and p.price >= (SELECT avg(p.price) from product p, manufacturer m where p.ID_Manufacturer = m.ID_Manufacturer 
and m.name = "Asus"GROUP BY(m.name));


-- Return the most expensive product in the product table without using MAX, ORDER BY, or LIMIT.
SELECT name, price FROM product p1
WHERE price >= ALL (SELECT price FROM product p2 WHERE p1.name <> p2.name);


-- Return the cheapest product in the product table without using MIN, ORDER BY, or LIMIT.
SELECT name, price FROM product p1
WHERE price <= all (SELECT price FROM product p2 WHERE p1.name <> p2.name);
