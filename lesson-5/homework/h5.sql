--Lesson 5: Aliases, Unions, and Conditional columns

--Easy-Level Tasks

--1.
Select ProductName AS Name 
from Products;

--2. 
Select * from Customers AS Client;

--3. 
Select ProductName
from Products
Union 
Select ProductName
from Products_Discounted;

--4. 
SELECT ProductID, ProductName, Price, Category, StockQuantity
FROM Products
INTERSECT
SELECT ProductID, ProductName, Price, Category, StockQuantity
FROM Products_Discounted;

--5. 
Select Distinct FirstName, LastName, Country 
from Customers;

--6. 
Select *, 
	Case when Price > 1000 then 'High'
	 	 when Price <= 1000 then 'Low'
	end AS PriceCategory
from Products;

--7. 
Select *,
    IIF(StockQuantity > 100, 'Yes', 'No') AS HighStock
from Products_Discounted;

--Medium-Level Tasks

--8. 
Select ProductName
from Products
UNION 
Select ProductName
from Products_Discounted;

--9. 
SELECT ProductID, ProductName, Price, Category, StockQuantity
FROM Products
EXCEPT
SELECT ProductID, ProductName, Price, Category, StockQuantity
FROM Products_Discounted;

--10. 
Select *,
    IIF(Price > 1000, 'Expensive', 'Affordable') AS PriceCategory
from Products;

--11. 
Select * from Employees
Where Age < 25 OR Salary > 60000;

--12. 
UPDATE Employees 
SET Salary = Salary * 1.1
WHERE DepartmentName = 'HR' OR EmployeeID = 5;

--Hard-Level Tasks

--13. 
Select *,
	Case 
		When SaleAmount > 500 then 'Top Tier'
		When SaleAmount BETWEEN 200 AND 500 then 'Mid Tier'
		Else 'Low Tier'
	End AS StatusSales
from Sales;

--14. 
Select CustomerID
from Orders
EXCEPT
Select CustomerID
from Sales

--15. 
Select CustomerID, Quantity,
	Case 
        WHEN Quantity = 1 THEN 3
        WHEN Quantity BETWEEN 1 AND 3 THEN 5
        ELSE 7
    END AS 'Discount%'
FROM Orders;
