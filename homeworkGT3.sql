--1.Вывести данные о товарах (проекция: название товара, цена, названиекатегории, названиекомпаниипоставщика)--

SELECT
    Products.ProductName,
    Products.Price,
    Categories.CategoryName,
    Suppliers.SupplierName AS SupplierCompanyName
FROM
    Products
JOIN
    Categories ON Products.CategoryID = Categories.CategoryID
JOIN
    Suppliers ON Products.SupplierID = Suppliers.SupplierID;

--2.Вывести заказы клиентов не из France  (номерзаказа, имяклиента, страна_клиента--

SELECT 
    Orders.OrderID AS OrderNumber,
    Customers.CustomerName AS CustomerName,
    Customers.Country AS CustomerCountry
FROM 
    Orders
JOIN 
    Customers ON Customers.CustomerID = Customers.CustomerID
WHERE 
    Customers.Country <> 'France';

--3.Вывести название и стоимость в USD одного самого дорогого проданного товара--

SELECT 
ProductName, Price
FROM Products
ORDER BY Price DESC
LIMIT 1;

--4.Вывести список стран, которые поставляют морепродукты--

SELECT DISTINCT
    Customers.Country
FROM
    Customers
JOIN
    Orders ON Customers.CustomerID = Orders.CustomerID
JOIN
    OrderDetails ON Orders.OrderID = OrderDetails.OrderID
JOIN
    Products ON OrderDetails.ProductID = Products.ProductID
JOIN
    Categories ON Products.CategoryID = Categories.CategoryID
WHERE
    Categories.CategoryName = 'Seafood';

--5.Вывести два самых дорогих товара из категории Beverages из USA--

SELECT
    Products.ProductName AS Name, Products.Price AS Price
FROM
    Products
JOIN
    Categories ON Products.CategoryID = Categories.CategoryID
JOIN
    Suppliers ON Products.SupplierID = Suppliers.SupplierID
JOIN
    OrderDetails ON Products.ProductID = OrderDetails.ProductID
JOIN
    Orders ON OrderDetails.OrderID = Orders.OrderID
JOIN
    Customers ON Orders.CustomerID = Customers.CustomerID
WHERE
    Categories.CategoryName = 'Beverages' AND Customers.Country = 'USA'
ORDER BY
    Products.Price DESC
LIMIT 2;