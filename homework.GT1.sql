
--1.Вывести название и стоимость товаров от 20 до 150 EUR--
SELECT ProductName, Price 
FROM Products
WHERE
Price BETWEEN 20 AND 150

--2.Вывести телефоны поставщиков из Japan и Spain--
SELECT Phone 
FROM Suppliers
WHERE Country IN ('Japan', 'Spain')

--3.Вывести название и стоимость товаров от всех поставщиков, кроме поставщика 1.--
SELECT ProductName, Price
FROM Products
WHERE SupplierID <1 OR SupplierID >1

--4.Вывести контактные имена клиентов, кроме тех, что из Germany и Brazil--
SELECT ContactName
FROM Customers
WHERE NOT (Country = 'Germany' OR Country = 'Brazil');


