USE GOLDS_GYM;

--Testing 
/*Tables*/
--Department Table
SELECT * FROM DEPARTMENT;

--Product Table
SELECT * FROM PRODUCT;

--Supplements Table
SELECT * FROM SUPPLEMENTS;

--Meals Table
SELECT * FROM MEALS;

--Supplier Table
SELECT * FROM SUPPLIER;

--Location Table
SELECT * FROM [LOCATION];

--Manufacturer Table
SELECT * FROM MANUFACTURER;

--Employee Table
SELECT * FROM EMPLOYEE;

--Staff Table
SELECT * FROM STAFF;

--Trainer Table
SELECT * FROM TRAINER;

--Nutritionist Table
SELECT * FROM NUTRITIONIST;

--Customer Table
SELECT * FROM CUSTOMER;

--Subscription Table
SELECT * FROM SUBSCRIPTION;

--Recommends Table
SELECT * FROM RECOMMENDS;

--Order Table
SELECT * FROM [ORDER];

--Utilities Table
SELECT * FROM UTILITIES;

--Locker Table
SELECT * FROM LOCKER;

--Weights Table
SELECT * FROM WEIGHTS;

--Machines Table
SELECT * FROM MACHINES;

--Purchases Table
SELECT * FROM PURCHASES;

/* Stored Procedures */
--List of customer for each Subscription type
DECLARE @Num_Customers INT;
EXEC GetCustomersBySubscription_Type 'Silver', @Num_Customers OUTPUT
SELECT @Num_Customers AS No_of_Customers_by_Subscription; --Test Execution

--Revenue for each based on Subscription
DECLARE @Revenue INT
EXEC Revenue @LocationID = 1001, @TotalRevenue = @Revenue OUTPUT
SELECT @Revenue AS TotalRevenue; --Test Execution

--Order Count
DECLARE @Count INT
EXEC GetOrderCountByProduct_ID @Product_ID = 3001, @TotalOrderCount = @Count OUTPUT
SELECT @Count AS OrderCount; --Test Execution

--Change assigned Trainer
SELECT Cust_ID, Cust_Name, PT_ID
FROM CUSTOMER
WHERE Cust_ID = 6015;

DECLARE @PTChange INT 
EXEC ChangeCustPT @Cust_ID = 6015, @PT_ID = 5006, @LastPTChange = @PTChange OUTPUT
SELECT @PTChange AS Last_Trainer_Changed; --Test Execution

SELECT Cust_ID, Cust_Name, PT_ID
FROM CUSTOMER
WHERE Cust_ID = 6015;

--Most recently added Product by Type
DECLARE @RecentProc INT
EXEC RecentProduct @Product_Type = 'Supplement', @RecentProduct = @RecentProc OUTPUT
SELECT @RecentProc AS Last_Product_Added; --Test Execution

/* Views */
--Active Customers
SELECT * FROM Active_Customers;

--Top 5 Most Expensive Products
SELECT * FROM Top_5_MostExpensive_Products;

--All Managers
SELECT * FROM ALL_Managers;

/* Trigger */
UPDATE SUBSCRIPTION SET [Subscription_End_Date] = GETDATE() WHERE [Subscription_ID] = '8001';

SELECT * FROM SUBSCRIPTION_AUDIT;
SELECT * FROM Active_Customers;

/* UDF */
--Customer age
SELECT Cust_ID, Cust_Name, dbo.GetAge(Cust_ID) AS Customer_Age
FROM CUSTOMER;

--Salary difference from average 
SELECT E_ID, E_Name, E_Salary, dbo.SalaryDifFromAvg(E_ID) AS Salary_Dif_From_Avg
FROM EMPLOYEE;

--Combine Employee address
SELECT Cust_ID, Cust_Name, dbo.CombineAdd(Cust_ID) AS Full_Address
FROM CUSTOMER;

--Percentage of total purchase
SELECT Pur_Invoice_No, Pur_Quantity, dbo.PerOfTotal(Pur_Invoice_No) AS Percentage_Of_Total
FROM PURCHASES;

/* Data Encryption */
--VIEW master key 
SELECT name KeyName,
  symmetric_key_id KeyID,
  key_length KeyLength,
  algorithm_desc KeyAlgorithm
FROM sys.symmetric_keys;

--Open Key 
OPEN SYMMETRIC KEY EmpPass_Em   
   DECRYPTION BY CERTIFICATE EmpSsn;
   
--Update encrypted Row
UPDATE dbo.employee SET SSN_enc = EncryptByKey(Key_GUID('EmpPass_Em'), CONVERT(VARBINARY,EMPLOYEE.E_SSN))
SELECT E_ID, E_Name, SSN_enc
FROM EMPLOYEE;

--Update existed E_SSN column with encrypted value and Drop encrypted column
ALTER TABLE EMPLOYEE
DROP COLUMN E_SSN;

--Open Key 
OPEN SYMMETRIC KEY EmpPass_Em   
   DECRYPTION BY CERTIFICATE EmpSsn;

--View Decrypted Row  
SELECT E_ID, E_Name, 
    CONVERT(INT, DecryptByKey([SSN_enc]))   
    AS 'Decrypted SSN'  
    FROM dbo.Employee;
