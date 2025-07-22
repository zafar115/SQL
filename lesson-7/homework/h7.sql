--1. 
SELECT MIN(Price) AS min_price 
FROM Products;

--2.
SELECT MAX(Salary) AS max_salary 
FROM Employees;

--3. 
SELECT COUNT(CustomerID) AS total_cust 
FROM Customers;

--4. 
SELECT COUNT(distinct Category)
FROM Products;

--5. 
SELECT COUNT(ProductID) AS Total_sale
FROM Sales
Where ProductID = 7;

--6.
SELECT AVG(Age) AS Avg_age
FROM Employees

--7. 
SELECT DepartmentName, COUNT(EmployeeID) AS cnt_depart
FROM Employees
GROUP BY DepartmentName;

--8. 
Select Category,
	   MAX(Price) AS Max_price,
	   MIN(Price) AS Min_price
From Products
GROUP BY Category;

--9. 
SELECT CustomerID, SUM(SaleAmount) AS Total_sale
FROM Sales
GROUP BY CustomerID;

--10. 
SELECT DepartmentName
FROM Employees
GROUP BY DepartmentName
HAVING COUNT(EmployeeID) > 5;

--11. 
SELECT ProductID,
	   SUM(SaleAmount) AS Total_sale,
	   AVG(SaleAmount) AS AVG_Sale
FROM Sales
GROUP BY ProductID

--12. 
SELECT COUNT(EmployeeID) AS Total_Empl
FROM Employees
Where DepartmentName = 'HR';

--13.
SELECT DepartmentName, 
	   MAX(Salary) AS Max_salary,
	   MIN(Salary) AS Min_salary
FROM Employees
GROUP BY DepartmentName;

--14. 
SELECT DepartmentName,
	   AVG(Salary) AS AVG_salary
FROM Employees
GROUP BY DepartmentName;

--15. 
SELECT DepartmentName,
	   AVG(Salary) AS Avg_salary,
	   COUNT(EmployeeID) AS Total_emp
FROM Employees
GROUP BY DepartmentName;
--16. 
SELECT Category 
FROM Products
GROUP BY Category
HAVING AVG(Price) > 400;

--17. 
SELECT SaleDate,
	   SUM(SaleAmount) AS Total_sale
FROM Sales
GROUP BY SaleDate;

--18.
SELECT CustomerID 
FROM Sales 
GROUP BY CustomerID 
HAVING COUNT(*) >= 3;

--19. 
SELECT DepartmentName
FROM Employees
GROUP BY DepartmentName
HAVING AVG(Salary)>60000;

--20.
SELECT Category,
	   AVG(Price) AS avg_price
FROM Products
GROUP BY Category
HAVING AVG(price)>150;

--21. 
SELECT CustomerID,
	   SUM(SaleAmount) AS Total_saleAm
FROM Sales
GROUP BY CustomerID
HAVING SUM(SaleAmount)>1500;

--22.
SELECT DepartmentName,
	   SUM(Salary) AS Total_salary,
	   AVG(Salary) AS Avg_salary
FROM Employees
GROUP BY DepartmentName
HAVING AVG(Salary)>65000

--23. 
SELECT CustomerID,
	   SUM(TotalAmount) AS Tot_Amount,
	   MIN(TotalAmount) AS Min_amount
FROM Orders
WHERE TotalAmount > 50
GROUP BY CustomerID;

--24.
SELECT 
    YEAR(OrderDate) AS Year,
    MONTH(OrderDate) AS Month,
    SUM(TotalAmount) AS TotalSales,
    COUNT(DISTINCT ProductID) AS UniqueProductsSold
FROM Orders
GROUP BY YEAR(OrderDate), MONTH(OrderDate)
HAVING COUNT(DISTINCT ProductID) >= 2
ORDER BY Year, Month;

--25. 
SELECT 
    YEAR(OrderDate) AS Year,
    MIN(Quantity) AS MinOrderQuantity,
    MAX(Quantity) AS MaxOrderQuantity
FROM Orders
GROUP BY YEAR(OrderDate)
ORDER BY Year;
