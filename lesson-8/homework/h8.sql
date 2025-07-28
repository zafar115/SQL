--lesson-8 Practice

--1.
SELECT Category,
	   SUM(StockQuantity) AS TotQuant
FROM Products
GROUP BY Category;

--2.
SELECT Category,
	   AVG(Price) AS Avg_price
FROM Products
WHERE Category = 'Electronics'
GROUP BY Category;

--3.
SELECT FirstName, LastName, City
FROM Customers
WHERE City LIKE 'L%';

--4. 
SELECT ProductName 
FROM Products
WHERE ProductName LIKE '%er';

--5. 
SELECT FirstName, LastName, Country
FROM Customers
WHERE Country like '%A';

--6. 
SELECT 
	   MAX(Price) AS HighestPrice
FROM Products;

--7. 
SELECT ProductName,
	CASE 
		WHEN Price < 30 THEN 'Low Stock'
		ELSE 'Sufficient'
	END AS StockPrice
FROM Products;

--8.
SELECT Country,
	   COUNT(CustomerID) AS TotalCustomer
FROM Customers
GROUP BY Country;

--9.
SELECT MAX(Quantity) AS MaxQuantity,
	   MIN(Quantity) AS MinQuantity
FROM Orders;

--10.
SELECT DISTINCT o.CustomerID
FROM Orders o
WHERE YEAR(o.OrderDate) = 2023 
  AND MONTH(o.OrderDate) = 1
  AND NOT EXISTS (
    SELECT 1 
    FROM Invoices i 
    WHERE i.CustomerID = o.CustomerID
  );

--11.
SELECT ProductName FROM Products
UNION ALL
SELECT ProductName FROM Products_Discounted;

--12.
SELECT ProductName FROM Products
UNION
SELECT ProductName FROM Products_Discounted;

--13.
SELECT 
    YEAR(OrderDate) AS Year,
    AVG(TotalAmount) AS AverageOrderAmount
FROM Orders
GROUP BY YEAR(OrderDate)
ORDER BY Year;

--14. 
SELECT 
    ProductName,
    CASE 
        WHEN Price < 100 THEN 'Low'
        WHEN Price BETWEEN 100 AND 500 THEN 'Mid'
        WHEN Price > 500 THEN 'High'
    END AS PriceGroup
FROM Products
ORDER BY Price;

--15. 
SELECT 
    district_id,
    district_name,
    SUM(CASE WHEN year = '2012' THEN population ELSE 0 END) AS [2012],
    SUM(CASE WHEN year = '2013' THEN population ELSE 0 END) AS [2013]
INTO Population_Each_Year
FROM city_population
GROUP BY district_id, district_name
ORDER BY district_id;

--16. 
SELECT 
    ProductID,
    SUM(SaleAmount) AS TotalSales
FROM Sales
GROUP BY ProductID
ORDER BY ProductID;

--17. 
SELECT ProductName
FROM Products
WHERE ProductName LIKE '%oo%';

--18.
SELECT 
    year,
    SUM(CASE WHEN district_name = 'Bektemir' THEN population ELSE 0 END) AS Bektemir,
    SUM(CASE WHEN district_name = 'Chilonzor' THEN population ELSE 0 END) AS Chilonzor,
    SUM(CASE WHEN district_name = 'Yakkasaroy' THEN population ELSE 0 END) AS Yakkasaroy,
    SUM(CASE WHEN district_name = 'Mirobod' THEN population ELSE 0 END) AS Mirobod,
    SUM(CASE WHEN district_name = 'Yashnobod' THEN population ELSE 0 END) AS Yashnobod
INTO Population_Each_City
FROM city_population
GROUP BY year
ORDER BY year;

--19.
SELECT TOP 3
    CustomerID,
    SUM(TotalAmount) AS TotalSpent
FROM Invoices
GROUP BY CustomerID
ORDER BY TotalSpent DESC;

--20.
SELECT district_id, district_name, [2012] AS population, '2012' AS year
FROM Population_Each_Year
WHERE [2012] > 0
UNION ALL
SELECT district_id, district_name, [2013] AS population, '2013' AS year
FROM Population_Each_Year
WHERE [2013] > 0
ORDER BY district_id, year;

--21.
SELECT 
    p.ProductName,
    COUNT(s.SaleID) AS TimesSold
FROM Products p
LEFT JOIN Sales s ON p.ProductID = s.ProductID
GROUP BY p.ProductID, p.ProductName
ORDER BY TimesSold DESC, p.ProductName;

--22. 
SELECT 1 AS district_id, 'Chilonzor' AS district_name, Chilonzor AS population, year
FROM Population_Each_City
WHERE Chilonzor > 0
UNION ALL
SELECT 2 AS district_id, 'Yakkasaroy' AS district_name, Yakkasaroy AS population, year
FROM Population_Each_City
WHERE Yakkasaroy > 0
UNION ALL
SELECT 3 AS district_id, 'Mirobod' AS district_name, Mirobod AS population, year
FROM Population_Each_City
WHERE Mirobod > 0
UNION ALL
SELECT 4 AS district_id, 'Yashnobod' AS district_name, Yashnobod AS population, year
FROM Population_Each_City
WHERE Yashnobod > 0
UNION ALL
SELECT 5 AS district_id, 'Bektemir' AS district_name, Bektemir AS population, year
FROM Population_Each_City
WHERE Bektemir > 0
ORDER BY district_id, year;
