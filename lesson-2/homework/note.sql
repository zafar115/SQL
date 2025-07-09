--Basic-Level Tasks (10)
--1.
CREATE TABLE EMPLOYEES (
	EmpID INT, 
	Name VARCHAR(50),
	Salary DECIMAL(10,2)
	);
--2.
INSERT INTO EMPLOYEES (EmpID, Name, Salary)
VALUES (101, 'Zafar', 10000);

INSERT INTO EMPLOYEES (EmpID, Name, Salary)
VALUES 
	(102, 'Xurshid', 12000),
	(103, 'Davron', 9000),
	(104, 'Abdulla', 10500);
--3.
UPDATE EMPLOYEES
SET Salary = 7000
WHERE EmpID = 101;
--4.
DELETE FROM EMPLOYEES
WHERE EmpID = 102;

--5. DELETE, TRUNCATE, DROP farqlari:

-- DELETE: faqat ma'lumotlarni o‘chiradi, jadval saqlanadi. WHERE bilan ishlaydi.
-- TRUNCATE: barcha yozuvlarni o‘chiradi, lekin strukturani saqlaydi. WHERE ishlamaydi.
-- DROP: butun jadvalni (strukturasi bilan birga) o‘chiradi.

--6.
ALTER TABLE EMPLOYEES
ALTER COLUMN Name VARCHAR(100);

--7.
ALTER TABLE EMPLOYEES
ADD Department VARCHAR(50);

--8.
ALTER TABLE EMPLOYEES
ALTER COLUMN Salary FLOAT;

--9.
CREATE TABLE Departments (
	DepartmentID INT,
	DepartmentName VARCHAR(50)
	);

--10.
TRUNCATE TABLE EMPLOYEES

--Intermediate-Level Tasks (6)

--11. 
INSERT INTO Departments (DepartmentID, DepartmentName)
SELECT 1, 'IT' UNION ALL
SELECT 2, 'FINANCE' UNION ALL
SELECT 3, 'MARKETING' UNION ALL
SELECT 4, 'HR' UNION ALL
SELECT 5, 'LOGISTICS';

--12. 
UPDATE EMPLOYEES
SET Department = 'Management'
WHERE Salary > 5000;

--13. 
DELETE FROM EMPLOYEES;

--14. 
ALTER TABLE EMPLOYEES
DROP COLUMN Department;

--15. 
EXEC SP_RENAME 'EMPLOYEES', 'StaffMembers';

--16.
DROP TABLE Departments;

--Advanced-Level Tasks (9)
--17.
CREATE TABLE Products (
	ProductID INT Primary Key, 
	ProductName VARCHAR(100), 
	Category VARCHAR(50), 
	Price DECIMAL(10,2),
	Description VARCHAR(200)
	);

--18.
ALTER TABLE Products
ADD CONSTRAINT CHK_Price_Positive CHECK (Price > 0);

--19.
ALTER TABLE Products
ADD StockQuantity INT DEFAULT 50;

--20. 
EXEC sp_rename 'Products.Category', 'ProductCategory', 'COLUMN';

--21. 
INSERT INTO Products (ProductID, ProductName, ProductCategory, Price, Description, StockQuantity)
VALUES
(1, 'Notebook', 'Electronics', 800, 'Gaming notebook', 5),
(2, 'Phone', 'Electronics', 700, 'Smartphone', 10),
(3, 'Chair', 'Furniture', 200, 'Office chair', 15),
(4, 'Pen', 'Stationery', 1, 'Blue ink pen', 50),
(5, 'Book', 'Stationery', 3, 'Handbook', 15);

--22. 
SELECT * INTO Products_Backup
FROM Products;

--23. 
EXEC sp_rename 'Products', 'Inventory';

--24. 
ALTER TABLE Inventory
ALTER COLUMN Price FLOAT;

--25.
ALTER TABLE Inventory
ADD ProductCode INT IDENTITY(1000, 5);
