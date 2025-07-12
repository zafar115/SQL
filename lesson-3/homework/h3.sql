--Lesson 3: Importing and Exporting Data

--Easy-Level Tasks (10)

--1. BULK INSERT bu — tashqi fayldan (masalan, .txt yoki .csv) katta hajmdagi ma’lumotlarni SQL Server jadvaliga tezda yuklash uchun ishlatiladigan buyruq.

--2. SQL Server’ga import qilish mumkin bo‘lgan 4 fayl formati:

--.csv (Comma Separated Values)

--.txt (Matnli fayl)

--.xls yoki .xlsx (Excel fayllari)

--.xml (XML fayl).

--3. 
Create table Products 
	(ProductID Int Primary key,
	ProductName varchar(50),
	Price Decimal(10,2)
	);

--4. 
Insert into Products values (1, 'Laptop', 800);
Insert into Products values  (2, 'Pen', 2);
Insert into Products values (3, 'Book', 10);

--5. NULL – bu ustun qiymati belgilanmaganligini bildiradi.
--NOT NULL – bu ustun har doim qiymatga ega bo‘lishi kerakligini bildiradi (bo‘sh qolmaydi).

--6. 
Alter table Products
ADD Constraint UQ_ProductName UNIQUE(ProductName);

--7.
-- Bu so‘rov Products jadvalidan barcha yozuvlarni oladi
SELECT * FROM Products;

--8. 
Alter table Products
ADD CategoryID Int;

--9.
Create table Categories
	(CategoryID Int Primary key,
	CategoryName varchar(50) unique);

--10. IDENTITY ustuni har bir yangi yozuv qo‘shilganda avtomatik tarzda raqamni oshirib boradi. Masalan, ID ustun avtomatik 1, 2, 3... bo‘ladi.

--Medium-Level Tasks (10)

--11. 
BULK INSERT Products
FROM 'C:\Users\User\Downloads\Telegram Desktop\test.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);

--12.
ALTER TABLE Products
ADD CONSTRAINT FK_Category
FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID);

--13. PRIMARY KEY – yagona va NULL bo‘lishi mumkin emas.
--UNIQUE KEY – yagona bo‘ladi, lekin NULL bo‘lishi mumkin.

--14. 
ALTER TABLE Products
ADD CONSTRAINT CHK_Price CHECK (Price > 0);

--15. 
ALTER TABLE Products
ADD Stock INT NOT NULL DEFAULT 0;

--16. 
SELECT ProductID, ProductName, ISNULL(Price, 0) AS Price
FROM Products;

--17. FOREIGN KEY bir jadvaldagi ustun qiymatini boshqa jadvaldagi asosiy kalit (PRIMARY KEY) bilan bog‘laydi. Bu ma’lumotlar yaxlitligini ta’minlaydi.

--Hard-Level Tasks (10)

--18. 
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FullName VARCHAR(50),
    Age INT CHECK (Age >= 18)
	);

--19.
CREATE TABLE AutoIDs (
    ID INT IDENTITY(100,10),
    Name VARCHAR(50)
	);

--20. 
CREATE TABLE OrderDetails (
    OrderID INT,
    ProductID INT,
    Quantity INT,
    PRIMARY KEY (OrderID, ProductID)
	);

--21. ISNULL(expr, value) – agar expr NULL bo‘lsa, valueni qaytaradi (faqat 2 ta parametr).
--COALESCE(expr1, expr2, ..., exprN) – chapdan o‘ngga birinchi NULL bo‘lmagan qiymatni qaytaradi (ko‘p parametr qabul qiladi).

--22. 
CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    FullName VARCHAR(100),
    Email VARCHAR(100) UNIQUE
);

--23.
ALTER TABLE Products
ADD CONSTRAINT FK_CategoryID
FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
ON DELETE CASCADE
ON UPDATE CASCADE;
