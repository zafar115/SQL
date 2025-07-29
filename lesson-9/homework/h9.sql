--1.
SELECT p.ProductName, s.SupplierName
FROM Products p
CROSS JOIN Suppliers s;

--2.
SELECT d.DepartmentName, e.Name AS EmployeeName
FROM Departments d
CROSS JOIN Employees e;

--3.
SELECT Suppliers.SupplierName, Products.ProductName
FROM Suppliers
INNER JOIN Products
ON Suppliers.SupplierID = Products.SupplierID;

--4.
SELECT Customers.FirstName, Customers.LastName, Orders.OrderID
FROM Customers
INNER JOIN Orders
on Customers.CustomerID = Orders.CustomerID;

--5.
SELECT Students.Name, Courses.CourseName
FROM Students
CROSS JOIN Courses;

--6.
SELECT Products.ProductName, Orders.OrderID
FROM Products
INNER JOIN Orders
ON Products.ProductID = Orders.ProductID;

--7.
SELECT Employees.Name AS EmployeeName, Departments.DepartmentName
FROM Employees
INNER JOIN Departments
ON Employees.DepartmentID = Departments.DepartmentID;

--8. 
SELECT Students.Name AS StudentName, Enrollments.CourseID
FROM Students
INNER JOIN Enrollments
ON Students.StudentID = Enrollments.StudentID;

--9.
SELECT Orders.OrderID, Payments.PaymentID, Payments.Amount
FROM Orders
INNER JOIN Payments 
ON Orders.OrderID = Payments.OrderID;

--10. 
SELECT Orders.OrderID, Products.ProductName, Products.Price
FROM Orders
INNER JOIN Products ON Orders.ProductID = Products.ProductID
WHERE Products.Price > 100;

--11.
SELECT Employees.Name AS EmployeeName, Departments.DepartmentName
FROM Employees
CROSS JOIN Departments 
WHERE Employees.DepartmentID <> Departments.DepartmentID;

--12. 
SELECT Orders.OrderID, Orders.Quantity, Products.ProductName, Products.StockQuantity
FROM Orders
INNER JOIN Products ON Orders.ProductID = Products.ProductID
WHERE Orders.Quantity > Products.StockQuantity;

--13. 
SELECT Customers.FirstName, Customers.LastName, Sales.ProductID
FROM Customers
INNER JOIN Sales ON Customers.CustomerID = Sales.CustomerID
WHERE Sales.SaleAmount >= 500;

--14. 
SELECT Students.Name AS StudentName, Courses.CourseName
FROM Students
INNER JOIN Enrollments ON Students.StudentID = Enrollments.StudentID
INNER JOIN Courses ON Courses.CourseID = Enrollments.CourseID;

--15. 
SELECT Products.ProductName, Suppliers.SupplierName
FROM Products
INNER JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID
WHERE Suppliers.SupplierName LIKE '%TECH%';

--16. 
SELECT Orders.OrderID, Orders.TotalAmount, Payments.Amount AS PaymentAmount
FROM Orders
INNER JOIN Payments ON Orders.OrderID = Payments.OrderID
WHERE Orders.TotalAmount > Payments.Amount;

--17. 
SELECT Departments.DepartmentName 
FROM Departments
INNER JOIN Employees ON Departments.DepartmentID = Employees.DepartmentID;

--18. 
SELECT Products.ProductName
FROM Products
INNER JOIN Categories ON Products.Category = Categories.CategoryID
WHERE Categories.CategoryName IN ('Electronics', 'Furniture');

--19.
SELECT Sales.SaleID, Customers.FirstName + ' ' + Customers.LastName AS CustomerName, Sales.SaleAmount
FROM Sales
INNER JOIN Customers ON Sales.CustomerID = Customers.CustomerID
WHERE Customers.Country = 'USA';

--20.
SELECT Orders.OrderID, Customers.FirstName + ' ' + Customers.LastName AS CustomerName, Orders.TotalAmount
FROM Orders
INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID
WHERE Customers.Country = 'Germany' and Orders.TotalAmount > 100; 

--21.
SELECT e1.Name AS Employee1, e2.Name AS Employee2, 
       d1.DepartmentName AS Dept1, d2.DepartmentName AS Dept2
FROM Employees e1
INNER JOIN Employees e2 ON e1.EmployeeID < e2.EmployeeID
INNER JOIN Departments d1 ON e1.DepartmentID = d1.DepartmentID
INNER JOIN Departments d2 ON e2.DepartmentID = d2.DepartmentID
WHERE e1.DepartmentID <> e2.DepartmentID;


--22.
SELECT p.PaymentID, p.Amount AS PaidAmount, 
       (o.Quantity * pr.Price) AS ExpectedAmount,
       pr.ProductName
FROM Payments p
INNER JOIN Orders o ON p.OrderID = o.OrderID
INNER JOIN Products pr ON o.ProductID = pr.ProductID
WHERE p.Amount <> (o.Quantity * pr.Price);

--23.
SELECT Students.Name AS StudentName
FROM Students
LEFT JOIN Enrollments ON Students.StudentID = Enrollments.StudentID
WHERE Enrollments.StudentID IS NULL;

--24. 
SELECT m.Name AS ManagerName, m.Salary AS ManagerSalary,
       e.Name AS EmployeeName, e.Salary AS EmployeeSalary
FROM Employees e
INNER JOIN Employees m ON e.ManagerID = m.EmployeeID
WHERE m.Salary <= e.Salary;

--25. 
SELECT DISTINCT c.FirstName + ' ' + c.LastName AS CustomerName, 
       o.OrderID
FROM Orders o
INNER JOIN Customers c ON o.CustomerID = c.CustomerID
LEFT JOIN Payments p ON o.OrderID = p.OrderID
WHERE p.OrderID IS NULL;
