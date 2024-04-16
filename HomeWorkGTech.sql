--Домашняя работа от 11.04.24--


--1.Вывести компании-перевозчиков, которые доставили клиентам более 250 заказов (проекция: название_компании, ко-во заказов)--

SELECT Shippers.ShipperName, 
COUNT(Orders.OrderID)
AS OrderCount
FROM Shippers
JOIN Orders ON Shippers.ShipperID = Orders.ShipperID
GROUP BY Shippers.ShipperName
HAVING COUNT(Orders.OrderID) > 250;

--2.Вывести заказы, где ко-во товаров 3 и более (проекция: номерзаказа, ко-вотовароввзаказе)--

SELECT Orders.OrderID, 
COUNT(OrderDetails.ProductID)
AS ProductCount
FROM Orders
JOIN OrderDetails ON Orders.OrderID = OrderDetails.OrderID
GROUP BY Orders.OrderID

--3.Вывести минимальную стоимость товара для каждой категории, кроме категории 2 (проекция: названиекатегории, минстоимость_товара)--

SELECT Categories.CategoryName, 
MIN(Products.Price) AS MinPrice
FROM Categories
JOIN Products ON Categories.CategoryID = Products.CategoryID
WHERE Categories.CategoryID <> 2
GROUP BY Categories.CategoryName;

--4.Вывести менеджера, который находится на 4 месте по ко-ву созданных заказов (проекция: фамилияменеджера, к-восозданных_заказов)--

SELECT LastName, COUNT(OrderID) AS OrderCount
FROM Employees
JOIN Orders USING(EmployeeID)
GROUP BY EmployeeID
ORDER BY OrderCount DESC
LIMIT 1 OFFSET 3;

--5.Вывести данные о товарах от поставщиков 4 и 8 (проекция: всеимеющиесяполя, ценасоскидкой1.5процента, ценаснаценкой0.5процента)--


SELECT *,
Price * (1 - 0.015) AS PriceWith1_5Discount, 
Price * (1 - 0.005) AS PriceWith0_5Discount 
FROM Products
WHERE SupplierID IN (4, 8);