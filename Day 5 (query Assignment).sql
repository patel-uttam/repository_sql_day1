USE [Day5 (SSMS)]
GO

-- table job

CREATE TABLE Business_Job
(
JobId int PRIMARY KEY,
JobTitle varchar(25) NOT NULL
);
GO

-- table employee
CREATE TABLE Business_employees
(
Employee_Id int PRIMARY KEY IDENTITY(1,1),
FirstName varchar(10) NOT NULL,
LastName varchar(10) NOT NULL,
Email varchar(25) NOT NULL,
PhoneNumber bigint NOT NULL,
Hire_Date DATE NOT NULL,
Job_Id int NOT NULL DEFAULT 4,
Salary int NOT NULL DEFAULT 8000,
);
GO


--inventory
CREATE TABLE inventory
(
	ProductId int PRIMARY KEY IDENTITY(1,1),
	ProductName varchar(25) Not Null UNIQUE,
	ProductPrice int Not Null CONSTRAINT notnull CHECK (ProductPrice != 0),
	productCount int Null DEFAULT 100
);
GO

-- table sale
CREATE TABLE sale
(
	TransectionId int PRIMARY KEY IDENTITY(1,1),
	SallerId int Not Null ,
	Buyer varchar(25) Not Null ,
	ProductId int Not NULL,
	CONSTRAINT FK_product FOREIGN KEY (ProductId) REFERENCES inventory(ProductId),
	CONSTRAINT FK_Seller FOREIGN KEY (SallerId) REFERENCES Business_employees(Employee_Id)
);

INSERT into Business_Job VALUES(1,'Manager');
INSERT into Business_Job VALUES(3,'Worker');
INSERT into Business_Job VALUES(4,'Salesperson');
GO

SELECT * FROM Business_Job
GO
 
INSERT into Business_employees(
FirstName,
LastName,
Email,
PhoneNumber,
Hire_Date)
VALUES('Harsh','Patel','abc@xyz.com',8425632541,'2020-06-25');
GO

ALTER TABLE Business_employees DROP COLUMN Salary 
Go

SELECT * FROM Business_employees
GO

INSERT into inventory(ProductName,ProductPrice,ProductCount) VALUES ('Shirt',1550,50);
INSERT into inventory(ProductName,ProductPrice,ProductCount) VALUES ('Jeans',2000,100);
INSERT into inventory(ProductName,ProductPrice,ProductCount) VALUES ('T-shirts',999,50);
INSERT into inventory(ProductName,ProductPrice,ProductCount) VALUES ('Shoes',850,30);
INSERT into inventory(ProductName,ProductPrice,ProductCount) VALUES ('Belts',350,25);
GO


SELECT * FROM inventory
GO

SELECT * FROM Business_employees
GO


-------------------------------------------------------------------------------------------------------------------------------

/* use this combine use callerId and ProductId same for three */

-------------------------------------------------------------------
INSERT into sale(SallerId,Buyer,ProductId) VALUES(1,'kathan',10);
UPDATE inventory SET productCount=productCount-1 WHERE ProductId = 10
UPDATE Business_employees SET Commission = Commission + ((SELECT ProductPrice FROM inventory WHERE ProductId = 10)/100) WHERE Employee_Id = 2;
GO
-------------------------------------------------------------------

SELECT * FROM sale
SELECT * FROM inventory
SELECT * FROM Business_employees
GO

sp_help Business_Employees


