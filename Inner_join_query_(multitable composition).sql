use computer_store;

-- "Return a list with the name of the product, price, and name of the manufacturer of all products in the database."
select * from product
join manufacturer on product.ID_Manufacturer = manufacturer.ID_Manufacturer;