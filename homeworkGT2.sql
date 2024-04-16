--1. Вывести данные о товарах не из категорий 2 и 4 и не от поставщиков 2 и 3 с ценой от 20 до 90 EUR (проекция: название, ценаснаценкой_6%)--

SELECT ProductName,Price * 1.06 AS PriceWithMarkup
FROM Products
WHERE (CategoryID NOT IN (2, 4) OR SupplierID NOT IN (2, 3))
AND Price BETWEEN 20 AND 90;

--2. Вывести клиентов не из Germany, имена которых не заканчиваются на букву t--

SELECT
    CustomerName
FROM
    Customers
WHERE
    Country <> 'Germany'
    AND RIGHT (CustomerName, 1) <> 't';

 --3. Вывести два самых дешевых товара с ценой от 10 EUR и более (проекция: название, ценасоскидкой_20%) --
 
 SELECT 
    ProductName,
    Price * 0.8 AS discounted_price_20_percent
FROM 
    Products
WHERE
    price >= 10
ORDER BY
    price
LIMIT 2;