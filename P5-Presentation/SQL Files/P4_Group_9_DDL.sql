/* Database and Object creation*/
--Checking if Database already exists
IF EXISTS (SELECT name FROM sys.databases WHERE name = N'GOLDS_GYM')
    DROP DATABASE GOLDS_GYM

--Creating Database
CREATE DATABASE GOLDS_GYM;
GO
USE GOLDS_GYM;

--Department Table
GO
CREATE TABLE DEPARTMENT 
(
    Dept_ID INT NOT NULL,
    Dept_Name VARCHAR(30),
    Dept_PhoneNumber VARCHAR(20),
    Dept_Type VARCHAR(20)
    CONSTRAINT Department_PK PRIMARY KEY (Dept_ID)
);

--Product Table
CREATE TABLE PRODUCT
(
    Product_ID INT NOT NULL,
    Product_Name VARCHAR(50),
    Product_Price SMALLINT,
    Product_Description VARCHAR(100),
    Product_Type VARCHAR(15), 
    CONSTRAINT Product_Type_CHK CHECK (Product_Type IN ('Supplement', 'Meal')),
    CONSTRAINT Product_PK PRIMARY KEY (Product_ID)
);

--Supplements Table
CREATE TABLE SUPPLEMENTS
(
    Supplement_ID INT NOT NULL,
    Supplement_Type VARCHAR(20),
    CONSTRAINT Supplement_Type_CHK CHECK (Supplement_Type IN 
        ('Protein', 'Weight Gainer', 'Creatine', 'Pre-Workout', 'Glutamine')),
    CONSTRAINT Supplement_PK PRIMARY KEY (Supplement_ID),
    CONSTRAINT Supplement_FK FOREIGN KEY (Supplement_ID)
        REFERENCES PRODUCT(Product_ID)
);

--Meals Table
CREATE TABLE MEALS
(
    Meal_ID INT NOT NULL,
    Cuisine VARCHAR(20),
    Calories SMALLINT,
    Dietary_Retriction VARCHAR(15),
    CONSTRAINT Dietary_Retriction_CHK CHECK (Dietary_Retriction IN 
        ('Protein Rich', 'Vegetarian', 'Vegan', 'Gluten-free', 'Lactose-free', 'Low Calorie', 'Keto')),
    CONSTRAINT Meal_PK PRIMARY KEY (Meal_ID),
    CONSTRAINT Meal_FK FOREIGN KEY (Meal_ID)
        REFERENCES PRODUCT(Product_ID)
);

--Supplier Table
CREATE TABLE SUPPLIER(
    Supplier_ID INT NOT NULL,
    Supplier_Name VARCHAR(30),
    Supplier_Contact_Number VARCHAR(20),
    Supplier_City VARCHAR(85),
    Supplier_State VARCHAR(15),
    Supplier_Street VARCHAR(35),
    CONSTRAINT SUPPLIER_PK PRIMARY KEY (Supplier_ID)
);

--Location Table
CREATE TABLE LOCATION
(
  Location_ID INT NOT NULL,
  [State] VARCHAR(15),
  City VARCHAR(85),
  Area VARCHAR(20),
  Street VARCHAR(35),
  Zip_Code INT,
  Building_Size VARCHAR(20)
  CONSTRAINT Location_PK PRIMARY KEY (Location_ID)
);

--Manufacturer Table
CREATE TABLE MANUFACTURER
(
   Manu_ID INT NOT NULL,
   Manu_Name VARCHAR(30),
   Manu_PhoneNumber VARCHAR(20),
   Manu_Email Varchar(30)
   CONSTRAINT Manufacturer_PK PRIMARY KEY (Manu_ID)
);

--Employee Table
CREATE TABLE EMPLOYEE
(
    E_ID INT NOT NULL,
    E_Name VARCHAR(100),
    E_SSN INT,
    E_DOB DATE,
    E_PhoneNumber VARCHAR(20),
    E_Email VARCHAR(50),
    E_Salary INT,
    E_Street VARCHAR(30),
    E_City VARCHAR(85),
    E_State VARCHAR(15),
    E_Hired_Date DATE DEFAULT(getdate()),
    E_Type VARCHAR(20), 
    Location_ID INT NOT NULL,
    Dept_ID INT NOT NULL,
    ManagerID INT,
    CONSTRAINT E_PK PRIMARY KEY (E_ID),
    CONSTRAINT E_FK1 FOREIGN KEY (Location_ID)
        REFERENCES [LOCATION](Location_ID),
    CONSTRAINT E_FK2 FOREIGN KEY (Dept_ID)
        REFERENCES DEPARTMENT(Dept_ID),
    CONSTRAINT E_RFK FOREIGN KEY (ManagerID)
        REFERENCES EMPLOYEE(E_ID)
);

--Staff Table
CREATE TABLE STAFF
(
    Staff_ID INT NOT NULL,
    Staff_Type VARCHAR(20),
    CONSTRAINT Staff_PK PRIMARY KEY (Staff_ID),
    CONSTRAINT Staff_FK FOREIGN KEY (Staff_ID)
        REFERENCES EMPLOYEE(E_ID)
);

--Trainer Table
CREATE TABLE TRAINER
(
    PT_ID INT NOT NULL,
    Speciality VARCHAR(20),
    PT_Fee SMALLINT,
    CONSTRAINT Trainer_PK PRIMARY KEY (PT_ID),
    CONSTRAINT Trainer_FK FOREIGN KEY (PT_ID)
        REFERENCES EMPLOYEE(E_ID)  
);

--Nutritionist Table
CREATE TABLE NUTRITIONIST
(
    N_ID INT NOT NULL,
    Certification_Level VARCHAR(20),
    CONSTRAINT Nutritionist_PK PRIMARY KEY (N_ID),
    CONSTRAINT Nutritionist_FK FOREIGN KEY (N_ID)
        REFERENCES EMPLOYEE(E_ID)
); 

--Customer Table
CREATE TABLE CUSTOMER
(
    Cust_ID INT NOT NULL,
    Cust_Name VARCHAR(100),
    Cust_Passport_No VARCHAR(10),
    Cust_DOB DATE,
    Cust_PhoneNumber VARCHAR(20),
    Cust_Email VARCHAR(50),
    Cust_Street VARCHAR(30),
    Cust_City VARCHAR(85),
    Cust_State VARCHAR(15),
    PT_ID INT,
    CONSTRAINT Customer_PK PRIMARY KEY (Cust_ID),
    CONSTRAINT Customer_FK FOREIGN KEY (PT_ID)
        REFERENCES TRAINER(PT_ID) 
);

--Subscription Table
CREATE TABLE SUBSCRIPTION
(
    Subscription_ID INT NOT NULL,
    Subscription_Type VARCHAR(10),
    CONSTRAINT Subscription_Type_CHK CHECK (Subscription_Type IN 
        ('Silver', 'Gold', 'Platinum')),
    Subscription_Start_Date DATE DEFAULT(getdate()),
    Subscription_End_Date DATE DEFAULT(NULL),
    Charges SMALLINT,
    Cust_ID INT NOT NULL,
    Location_ID INT NOT NULL,
    CONSTRAINT Subscription_PK PRIMARY KEY (Subscription_ID),
    CONSTRAINT Subscription_FK1 FOREIGN KEY (Cust_ID)
        REFERENCES CUSTOMER(Cust_ID),
    CONSTRAINT Subscription_FK2 FOREIGN KEY (Location_ID)
        REFERENCES [LOCATION](Location_ID)
);

--Recommends Table
CREATE TABLE RECOMMENDS
(
    Product_ID INT NOT NULL,
    Cust_ID INT NOT NULL,
    N_ID INT NOT NULL,
    Rec_Date DATE,
    Rec_Quantity SMALLINT,
    Rec_Reason VARCHAR(200),
    CONSTRAINT Recommends_PK PRIMARY KEY (Product_ID, Cust_ID, N_ID, Rec_Date),
    CONSTRAINT Recommends_FK1 FOREIGN KEY (Product_ID)
        REFERENCES PRODUCT(Product_ID),
    CONSTRAINT Recommends_FK2 FOREIGN KEY (Cust_ID)
        REFERENCES CUSTOMER(Cust_ID),
    CONSTRAINT Recommends_FK3 FOREIGN KEY (N_ID)
        REFERENCES NUTRITIONIST(N_ID)
);

--Order Table
CREATE TABLE [ORDER]
(
    Order_ID INT NOT NULL,
    Order_Date DATE,
    Order_Quantity SMALLINT,
    Cust_ID INT NOT NULL,
    Location_ID INT NOT NULL,
    Supplier_ID INT NOT NULL,
    Product_ID INT NOT NULL,
    CONSTRAINT Order_PK PRIMARY KEY (Order_ID),
    CONSTRAINT Order_FK1 FOREIGN KEY (Cust_ID)
        REFERENCES CUSTOMER(Cust_ID),
    CONSTRAINT Order_FK2 FOREIGN KEY (Location_ID)
        REFERENCES [LOCATION](Location_ID),
    CONSTRAINT Order_FK3 FOREIGN KEY (Supplier_ID)
        REFERENCES SUPPLIER(Supplier_ID),
    CONSTRAINT Order_FK4 FOREIGN KEY (Product_ID)
        REFERENCES PRODUCT(Product_ID)
);

--Utilities Table
CREATE TABLE UTILITIES
(
    Utility_ID INT NOT NULL,
    Utility_Name VARCHAR(100),
    Utility_Type VARCHAR(15),
    CONSTRAINT Utility_Type_CHK CHECK (Utility_Type IN 
        ('Locker', 'Weights', 'Machines', 'Other')),
    Utility_Price SMALLINT,
    Cust_ID INT,
    CONSTRAINT Utility_PK PRIMARY KEY (Utility_ID),
    CONSTRAINT Utility_FK FOREIGN KEY (Cust_ID)
        REFERENCES CUSTOMER(Cust_ID)
);

--Locker Table
CREATE TABLE LOCKER
(
    Locker_ID INT NOT NULL,
    Locker_Availability VARCHAR(3),
    CONSTRAINT Locker_Availability_CHK CHECK (Locker_Availability IN 
        ('Yes', 'No')),
    Locker_Size VARCHAR(6),
    CONSTRAINT Locker_Size_CHK CHECK (Locker_Size IN 
        ('Small', 'Medium', 'Large')),
    Locker_Location VARCHAR(50),
    CONSTRAINT Locker_PK PRIMARY KEY (Locker_ID),
    CONSTRAINT Locker_FK FOREIGN KEY (Locker_ID)
        REFERENCES UTILITIES(Utility_ID)
);

--Weights Table
CREATE TABLE [WEIGHTS]
(
    Weight_ID INT NOT NULL,
    Weight_Type VARCHAR(20),
    Weight_Size SMALLINT,
    CONSTRAINT Weight_PK PRIMARY KEY (Weight_ID),
    CONSTRAINT Weight_FK FOREIGN KEY (Weight_ID)
        REFERENCES UTILITIES(Utility_ID)
);

--Machines Table
CREATE TABLE MACHINES
(
    Machine_ID INT NOT NULL,
    Machine_Type VARCHAR(50),
    Body_Group VARCHAR(20),
    CONSTRAINT Machine_PK PRIMARY KEY (Machine_ID),
    CONSTRAINT Machine_FK FOREIGN KEY (Machine_ID)
        REFERENCES UTILITIES(Utility_ID)
);

--Purchases Table
CREATE TABLE PURCHASES
(
    Pur_Invoice_No INT NOT NULL,
    Pur_Date DATE,
    Pur_Quantity SMALLINT,
    Utility_ID INT NOT NULL,
    Manu_ID INT NOT NULL,
    Location_ID INT NOT NULL,
    CONSTRAINT Pur_PK PRIMARY KEY (Pur_Invoice_No),
    CONSTRAINT Pur_FK1 FOREIGN KEY (Utility_ID)
        REFERENCES UTILITIES(Utility_ID),
    CONSTRAINT Pur_FK2 FOREIGN KEY (Manu_ID)
        REFERENCES MANUFACTURER(Manu_ID),
    CONSTRAINT Pur_FK3 FOREIGN KEY (Location_ID)
        REFERENCES [LOCATION](Location_ID)
);

/* Stored Procedures */
--List of customer for each Subscription type
GO
CREATE PROCEDURE GetCustomersBySubscription_Type
  @SubscriptionType VARCHAR(10),
  @NumCustomers INT OUTPUT
AS
BEGIN
  SELECT c.Cust_Name, c.Cust_Email, s.Subscription_Type, s.Subscription_Start_Date, s.Charges
  FROM CUSTOMER c
  INNER JOIN SUBSCRIPTION s ON c.Cust_ID = s.Cust_ID
  WHERE s.Subscription_Type = @SubscriptionType;

  SET @NumCustomers = @@ROWCOUNT
END

--Revenue for each based on Subscription
GO
CREATE PROCEDURE Revenue
   @LocationID INT,
   @TotalRevenue INT OUTPUT
AS
BEGIN
  SELECT l.[State], l.City, SUM(s.Charges) AS Total_Revenue_for_Location
  FROM SUBSCRIPTION s
  INNER JOIN [LOCATION] l ON l.Location_ID = s.Location_ID
  WHERE s.Location_ID = @LocationID
  GROUP BY l.[State], l.City

  SET @TotalRevenue = (SELECT SUM(Charges)
    FROM SUBSCRIPTION)
END

--Order Count
GO
CREATE PROCEDURE GetOrderCountByProduct_ID
  @Product_ID INT,
  @TotalOrderCount INT OUTPUT
AS
BEGIN
  SELECT COUNT(Product_ID) AS Count_of_Product
  FROM [ORDER]
  WHERE Product_ID = @Product_ID

  SET @TotalOrderCount = (SELECT COUNT(*)
    FROM [ORDER])
END

--Change assigned Trainer
GO
CREATE PROCEDURE ChangeCustPT
    @Cust_ID INT,
    @PT_ID INT,
    @LastPTChange INT OUTPUT
AS
BEGIN
    UPDATE CUSTOMER SET PT_ID = @PT_ID
    WHERE Cust_ID = @Cust_ID

    SET @LastPTChange = @PT_ID
END

--Most recently added Product by Type
GO
CREATE PROCEDURE RecentProduct
    @Product_Type VARCHAR(15),
    @RecentProduct INT OUTPUT
AS
DECLARE @MaxProductID INT
BEGIN 
    SELECT @MaxProductID = MAX(Product_ID)
    FROM PRODUCT 
    WHERE Product_Type = @Product_Type

    SELECT Product_Name, Product_ID, Product_Price
    FROM PRODUCT
    WHERE Product_ID = @MaxProductID

    SET @RecentProduct = @MaxProductID
END 

/* Views */
--Active Customers
GO
CREATE VIEW Active_Customers
AS
SELECT Cust_ID, Cust_Name
FROM CUSTOMER
WHERE Cust_ID IN (SELECT Cust_ID FROM SUBSCRIPTION WHERE Subscription_End_Date IS NULL OR Subscription_End_Date > getdate());

--Top 5 Most Expensive Products
GO
CREATE VIEW Top_5_MostExpensive_Products
AS
SELECT TOP 5 Product_Name, Product_Price
FROM PRODUCT
WHERE Product_Price IS NOT NULL
ORDER BY Product_Price DESC;

--All Managers
GO
CREATE VIEW ALL_Managers
AS
SELECT e.E_ID ,e.E_Name 
FROM EMPLOYEE e JOIN STAFF s ON e.E_ID = s.Staff_ID 
WHERE e.E_ID IN 
(SELECT s.Staff_ID 
FROM STAFF s 
WHERE s.Staff_Type LIKE '%Manager%');

/* Trigger */
GO
CREATE TABLE SUBSCRIPTION_AUDIT
(
    [Subscription_AuditID] INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    [Subscription_ID] INT NOT NULL,
    [Subscription_Type] VARCHAR(10),
    [Subscription_Start_Date] DATE,
    [Subscription_End_Date] DATE,
    [Charges] SMALLINT,
    [Cust_ID] INT NOT NULL,
    [Location_ID] INT NOT NULL,
    [Action] CHAR(1),
    [ActionDate] DATETIME
)

GO
CREATE TRIGGER SubscriptionHistory on dbo.SUBSCRIPTION
FOR UPDATE
AS
BEGIN

INSERT INTO [dbo].SUBSCRIPTION_AUDIT
    ([Subscription_ID]
    ,[Subscription_Type]
    ,[Subscription_Start_Date]
    ,[Subscription_End_Date]
    ,[Charges]
    ,[Cust_ID]
    ,[Location_ID]
    ,[Action]
    ,[ActionDate])
SELECT [Subscription_ID]
    ,[Subscription_Type]
    ,[Subscription_Start_Date]
    ,[Subscription_End_Date]
    ,[Charges]
    ,[Cust_ID]
    ,[Location_ID]
    ,'U' AS [Action]
    ,GETDATE() AS [ActionDate]
FROM deleted

END 


/* UDF */
--Customer age
GO
CREATE FUNCTION dbo.GetAge
(
    @Cust_ID INT
)
RETURNS INT
AS
BEGIN
    DECLARE @Age INT
    SELECT @Age = DATEDIFF(YEAR, Cust_DOB, GETDATE())
    FROM CUSTOMER WHERE Cust_ID = @Cust_ID
    RETURN @Age
END

--Salary difference from average 
GO
CREATE FUNCTION dbo.SalaryDifFromAvg
(
    @E_ID INT
)
RETURNS INT
AS
BEGIN
    DECLARE @Avg INT
    SELECT @Avg = AVG(E_Salary)
    FROM EMPLOYEE

    DECLARE @AvgDif INT
    SELECT @AvgDif = E_Salary - @Avg
    FROM EMPLOYEE WHERE E_ID = @E_ID
    RETURN @AvgDif
END

--Combine Employee address
GO
CREATE FUNCTION dbo.CombineAdd 
(
    @Cust_ID INT
)
RETURNS VARCHAR(150)
AS
BEGIN
    DECLARE @CombinedAddress VARCHAR(150)
    SELECT @CombinedAddress = Cust_Street + ', ' + Cust_City + ', ' + Cust_State
    FROM CUSTOMER
    WHERE Cust_ID = @Cust_ID
    RETURN @CombinedAddress
END

--Percentage of total purchase
GO
CREATE FUNCTION dbo.PerOfTotal
(
    @Pur_Invoice_No INT
)
RETURNS DECIMAL(5,2)
AS
BEGIN
    DECLARE @Total DECIMAL(5,2)
    SELECT @Total = SUM(Pur_Quantity)
    FROM PURCHASES

    DECLARE @PercentTotal DECIMAL(5,2)
    SELECT @PercentTotal = (Pur_Quantity/@Total)*100
    FROM PURCHASES
    WHERE Pur_Invoice_No = @Pur_Invoice_No
    RETURN @PercentTotal
END


/* Data Encryption */
--Addition of column
GO
ALTER TABLE EMPLOYEE ADD [SSN_enc] VARBINARY(400)

--Create master key 
GO
CREATE MASTER KEY
ENCRYPTION BY PASSWORD = 'damg_09#';

--Create Certificate 
GO
CREATE CERTIFICATE EmpSsn  
   WITH SUBJECT = 'Employee Social Security Number';  

--Create Symmetric key 
GO
CREATE SYMMETRIC KEY EmpPass_Em 
    WITH ALGORITHM = AES_256  
    ENCRYPTION BY CERTIFICATE EmpSsn;  


/* Indexes */
CREATE INDEX customers_name_IDX ON CUSTOMER (Cust_Name);
CREATE INDEX employee_name_IDX ON EMPLOYEE (E_Name);
CREATE INDEX product_name_IDX ON PRODUCT (Product_Name);