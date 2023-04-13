USE GOLDS_GYM;

--Department Table
INSERT INTO DEPARTMENT (Dept_ID, Dept_Name, Dept_PhoneNumber, Dept_Type) 
VALUES 
(4001, 'Marketing', '555-1234', 'Sales'),
(4002, 'Engineering', '555-2345', 'Technical'),
(4003, 'Human Resources', '555-3456', 'Administrative'),
(4004, 'Finance', '555-4567', 'Administrative'),
(4005, 'Fitness', '555-5678', 'Technical'),
(4006, 'Research and Development', '555-6789', 'Technical'),
(4007, 'Customer Support', '555-7890', 'Technical'),
(4008, 'Sales', '555-8901', 'Sales'),
(4009, 'Legal', '555-9012', 'Administrative'),
(4010, 'Operations', '555-0123', 'Technical');

--Product Table
INSERT INTO PRODUCT (Product_ID, Product_Name, Product_Price, Product_Description, Product_Type)
VALUES
(3001, 'Whey Protein', 35, 'Pure whey protein powder with no added sugar or flavors', 'Supplement'),
(3002, 'GNC Pro Performance Weight Gainer', 40, 'High-quality protein in a wellness formula designed to digest and release amino acids', 'Supplement'),
(3003, 'Thorn Creatine', 25, '100% pure creatine monohydrate powder for enhanced athletic performance', 'Supplement'),
(3004, 'MuscleBlaze Pre-Workout', 50, 'Enhance workout performance & focus-preventing early fatigue and reducing protein breakdown', 'Supplement'),
(3005, 'Pre-Blue Sky', 30, 'Pre-workout powder with caffeine and beta-alanine for energy and endurance', 'Supplement'),
(3006, 'Chicken Curry with Rice', 45, 'Spicy chicken dish with curry sauce, usually served with rice', 'Meal'),
(3007, 'Alfredo Pasta', 50, 'Creamy, dreamy pan sauce made from butter and Parmigiano-Reggiano cheese', 'Meal'),
(3008, 'Burrito Bowl', 60, 'Mexican-inspired dish with rice, beans, meat, veggies, and toppings', 'Meal'),
(3009, 'Sushi', 20, 'Raw fish and rice wrapped in seaweed.', 'Meal'),
(3010, 'Banana-Chia Milkshake', 40, 'Creamy, nutritious, sweet, and refreshing milkshake with chia & banana', 'Meal'),
(3011, 'Pad Thai', 40, 'Stir-fried rice noodles with eggs, peanuts, tofu, and vegetables in a sweet and savory sauce.', 'Meal'),
(3012, 'Falafel Wrap', 40, 'Warm pita filled with crispy falafel, fresh veggies, and flavorful sauces', 'Meal');

--Supplements Table
INSERT INTO SUPPLEMENTS (Supplement_ID, Supplement_Type)
VALUES
(3001, 'Protein'),
(3002, 'Weight Gainer'),
(3003, 'Creatine'),
(3004, 'Pre-Workout'),
(3005, 'Glutamine');

--Meals Table
INSERT INTO MEALS (Meal_ID, Cuisine, Calories, Dietary_Retriction)
VALUES
(3006, 'Indian', 600, 'Protein Rich'),
(3007, 'Italian', 500, 'Vegetarian'),
(3008, 'Mexican', 400, 'Vegetarian'),
(3009, 'Japanese', 350, 'Gluten-free'),
(3010, 'American', 200, 'Low Calorie'),
(3011, 'Thai', 550, 'Vegan'),
(3012, 'Lebanese', 450, 'Vegan');

--Supplier Table
INSERT INTO SUPPLIER (Supplier_ID, Supplier_Name, Supplier_Contact_Number, Supplier_City, Supplier_State, Supplier_Street) 
VALUES 
(2001, 'ABC Suppliers', '9876543210', 'Los Angeles', 'California', 'XYZ Street'),
(2002, 'PQR Traders', '8765432109', 'Houston', 'Texas', 'ABC Road'),
(2003, 'XYZ Enterprises', '7654321098', 'Miami', 'Florida', 'PQR Avenue'),
(2004, 'LMN Corp', '6543210987', 'Chicago', 'Illinois', 'DEF Lane'),
(2005, 'RST Inc', '5432109876', 'New York City', 'New York', 'GHI Street'),
(2006, 'UVW Industries', '4321098765', 'New York City', 'New York', 'JKL Road'),
(2007, 'QRS Enterprises', '3210987654', 'Chicago', 'Illinois', 'MNO Street'),
(2008, 'LMN Traders', '2109876543', 'Los Angeles', 'California', 'STU Lane');

--Location Table
INSERT INTO [LOCATION] (Location_ID, [State], City, Area, Street, Zip_Code, Building_Size) 
VALUES
(1001, 'California', 'Los Angeles', 'Hollywood', 'Sunset Blvd', 90028, '10000 sq ft'),
(1002, 'New York', 'New York City', 'Manhattan', '5th Avenue', 10001, '8000 sq ft'),
(1003, 'Texas', 'Houston', 'Downtown', 'Main St', 77002, '5000 sq ft'),
(1004, 'Florida', 'Miami', 'South Beach', 'Collins Ave', 33139, '12000 sq ft'),
(1005, 'Illinois', 'Chicago', 'The Loop', 'Wacker Dr', 60606, '7500 sq ft');

--Manufacturer Table
INSERT INTO MANUFACTURER (Manu_ID, Manu_Name, Manu_PhoneNumber, Manu_Email) 
VALUES 
(9001, 'Life Fitness', '123-456-7890', 'info@lf.com'),
(9002, 'Precor', '555-555-5555', 'info@precor.com'),
(9003, 'Technogym', '999-999-9999', 'info@technogym.com'),
(9004, 'Cybex', '888-888-8888', 'info@cybex.com'),
(9005, 'Hammer Strength', '777-777-7777', 'info@hs.com'),
(9006, 'Matrix Fitness', '555-123-4567', 'info@mf.com'),
(9007, 'Star Trac', '800-624-9896', 'info@trac.com'),
(9008, 'Hoist Fitness', '800-474-6836', 'info@hf.com'),
(9009, 'Body-Solid', '888-678-3688', 'info@bsolid.com'),
(9010, 'ProForm', '888-678-3688', 'info@proform.com');

--Employee Table
INSERT INTO EMPLOYEE (E_ID, E_Name, E_SSN, E_DOB, E_PhoneNumber, E_Email, E_Salary, E_Street, E_City, E_State, E_Type, Location_ID, Dept_ID, ManagerID) 
VALUES 
(5001, 'John Doe', 123456789, '1990-01-01', '123-456-7890', 'johndoe@email.com', 50000, 'Sunset Blvd', 'Los Angeles', 'CA', 'Staff', 1001, 4010, NULL),
(5002, 'Jane Smith', 987654321, '1995-02-14', '987-654-3210', 'janesmith@email.com', 60000, 'Collins Ave', 'Miami', 'FL', 'Staff', 1004, 4010, NULL),
(5003, 'Michael Johnson', 456123789, '1985-05-10', '456-123-7890', 'alexjohnson@email.com', 45000, '5th Avenue', 'New York City', 'NY', 'Staff', 1002, 4003, 5001),
(5004, 'Mitchell Marsh', 789654123, '1993-09-22', '789-654-1230', 'lisamartinez@email.com', 55000, 'Wacker Dr', 'Chicago', 'IL', 'Staff', 1005, 4002, NULL),
(5005, 'David Brown', 852369741, '1992-03-05', '852-369-7410', 'davidbrown@email.com', 50000, 'Collins Ave', 'Miami', 'FL', 'Staff', 1004, 4003, 5002),
(5006, 'Emily Garcia', 369852147, '1998-11-30', '369-852-1470', 'emilygarcia@email.com', 45000, 'Sunset Blvd', 'Los Angeles', 'CA', 'Trainer', 1001, 4005, 5001),
(5007, 'John Done', 123456789, '1990-01-01', '123-456-7890', 'johndoe@email.com', 50000, 'Main St', 'Houston', 'TX', 'Trainer', 1003, 4005, 5002),
(5008, 'Steve Smith', 987654321, '1995-02-14', '987-654-3210', 'janesmith@email.com', 60000, 'Wacker Dr', 'Chicago', 'IL', 'Trainer', 1005, 4005, 5001),
(5009, 'Alex Carrey', 456123789, '1985-05-10', '456-123-7890', 'alexjohnson@email.com', 45000, '5th Avenue', 'New York City', 'NY', 'Trainer', 1002, 4005, 5002),
(5010, 'Lisa Mary', 789654123, '1993-09-22', '789-654-1230', 'lisamartinez@email.com', 55000, '5th Avenue', 'New York City', 'NY', 'Trainer', 1002, 4005, 5001),
(5011, 'Steve Bucker', 986654321, '1995-02-28', '987-654-3310', 'stevebucker@email.com', 60000, 'Sunset Blvd', 'Los Angeles', 'CA', 'Trainer', 1001, 4005, 5002),
(5012, 'Alex James', 456143789, '1985-05-13', '456-123-7190', 'alexjames@email.com', 40000, '5th Avenue', 'New York City', 'NY', 'Nutritionist', 1002, 4005, 5002),
(5013, 'Lisa Martin', 789624123, '1993-09-25', '789-654-2230', 'lisamartin@email.com', 50000, 'Sunset Blvd', 'Los Angeles', 'CA', 'Nutritionist', 1001, 4005, 5001);

--Staff Table
INSERT INTO STAFF (Staff_ID, Staff_Type)
VALUES 
(5001, 'Manager'),
(5002, 'Manager'),
(5003, 'Assistant Manager'),
(5004, 'Manager'),
(5005, 'Associate');

--Trainer Table
INSERT INTO TRAINER (PT_ID, Speciality, PT_Fee)
VALUES 
(5006, 'Cardio', 80),
(5007, 'Kickboxing', 180),
(5008, 'Pilates', 120),
(5009, 'Weight Lifting', 200),
(5010, 'Yoga', 50),
(5011, 'Zumba', 110);

--Nutritionist Table
INSERT INTO NUTRITIONIST(N_ID, Certification_Level) 
VALUES
(5012, 'Registered Dietitian'),
(5013, 'Sports Nutritionist');

--Customer Table
INSERT INTO CUSTOMER (Cust_ID, Cust_Name, Cust_Passport_No, Cust_DOB, Cust_PhoneNumber, Cust_Email, Cust_Street, Cust_City, Cust_State, PT_ID) 
VALUES 
(6001, 'Tom Cruise', 'A1234567', '1990-01-01', '+1-123-456-7890', 'tomc@email.com', '123 Sunset Blvd', 'New York', 'NY', 5009),
(6002, 'Brian Lara', 'B9876543', '1995-02-14', '+1-555-555-5555', 'brianl@email.com', '456 Sunset Blvd', 'Los Angeles', 'CA', 5006),
(6003, 'Morne Morkel', 'C2468135', '1987-05-20', '+1-555-123-4567', 'mornem@email.com', '789 5th Avenue', 'Chicago', 'IL', 5008),
(6004, 'Aiden Markram', 'D3692581', '1992-11-30', '+1-555-789-1234', 'aidenm@email.com', '123 5th Avenue', 'San Francisco', 'CA', NULL),
(6005, 'Quinton Dekock', 'E1593574', '1998-07-18', '+1-123-555-7890', 'quintond@email.com', '456 Main St', 'Houston', 'TX', 5007),
(6006, 'Ben Stokes', 'F7539512', '1989-04-06', '+1-555-555-1234', 'bens@email.com', '789 Main St', 'New York', 'NY', 5009),
(6007, 'Jos Buttler', 'G8529631', '1997-10-15', '+1-555-123-4567', 'joeb@email.com', '123 Main St', 'Los Angeles', 'CA', 5011),
(6008, 'Virat Kohli', 'A1234567', '1990-01-01', '+1-123-456-7890', 'viratk@email.com', '123 Main St', 'New York', 'NY', 5010),
(6009, 'Nathan Lyon', 'B9876543', '1995-02-14', '+1-555-555-5555', 'nathanl@email.com', '456 Collins Ave', 'Los Angeles', 'CA', 5011),
(6010, 'Mitchell Marsh', 'C2468135', '1987-05-20', '+1-555-123-4567', 'mitchellm@email.com', '789 Collins Ave', 'Chicago', 'IL', 5008),
(6011, 'Shaun Marsh', 'D3692581', '1992-11-30', '+1-555-789-1234', 'shaumm@email.com', '123 Wacker Dr', 'San Francisco', 'CA', NULL),
(6012, 'David Warner', 'E1593574', '1998-07-18', '+1-123-555-7890', 'davidw@email.com', '456 Wacker Dr', 'Houston', 'TX', 5007),
(6013, 'Eoin Morgan', 'F7539512', '1989-04-06', '+1-555-555-1234', 'eoinnm@email.com', '789 Wacker Dr', 'New York', 'NY', NULL),
(6014, 'Ricky Ponting', 'G8529631', '1997-10-15', '+1-555-123-4567', 'rickyp@email.com', '123 Wacker Dr', 'Los Angeles', 'CA', NULL),
(6015, 'Steve Smith', 'A1234567', '1990-01-01', '+1-123-456-7890', 'steves@email.com', '123 Sunset Blvd', 'New York', 'NY', NULL);

--Subscription Table
INSERT INTO SUBSCRIPTION (Subscription_ID, Subscription_Type, Subscription_Start_Date, Charges, Cust_ID, Location_ID)
VALUES 
(8001, 'Silver', '2022-01-01', 1000, 6001, 1001),
(8002, 'Gold', '2022-02-15', 2000, 6002, 1002),
(8003, 'Platinum', '2022-03-01', 3000, 6003, 1003),
(8004, 'Gold', '2022-04-10', 2000, 6004, 1004),
(8005, 'Silver', '2022-05-20', 1000, 6005, 1005),
(8006, 'Platinum', '2022-06-05', 3000, 6006, 1004),
(8007, 'Gold', '2022-07-15', 2000, 6007, 1003),
(8008, 'Platinum', '2022-06-05', 3000, 6008, 1002),
(8009, 'Silver', '2022-07-15', 2000, 6009, 1001),
(8010, 'Platinum', '2022-06-05', 3000, 6010, 1005);

--Recommends Table
INSERT INTO RECOMMENDS (Product_ID, Cust_ID, N_ID, Rec_Date, Rec_Quantity, Rec_Reason) 
VALUES 
(3001, 6001, 5012, '2023-04-07', 3, 'High protein requirement'),
(3002, 6002, 5013, '2023-04-06', 2, 'Healthy Weight gain'),
(3003, 6003, 5012, '2023-04-05', 1, 'Athletic performance'),
(3004, 6004, 5013, '2023-04-04', 4, 'Energy boost'),
(3005, 6005, 5013, '2023-04-03', 2, 'Energy boost'),
(3006, 6006, 5012, '2023-04-02', 3, 'High protein diet'),
(3007, 6007, 5012, '2023-04-01', 1, 'Vegetarian diet'),
(3008, 6008, 5012, '2023-04-03', 2, 'Vegetarian diet'),
(3009, 6009, 5013, '2023-04-02', 3, 'Gluten-free diet'),
(3010, 6010, 5013, '2023-04-01', 1, 'Weight loss program');

--Order Table
INSERT INTO [ORDER] (Order_ID, Order_Date, Order_Quantity, Cust_ID, Location_ID, Supplier_ID, Product_ID) 
VALUES 
(10001, '2023-04-01', 5, 6001, 1001, 2001, 3001),
(10002, '2023-04-02', 7, 6002, 1002, 2002, 3009),
(10003, '2023-04-03', 1, 6003, 1003, 2003, 3003),
(10004, '2023-04-04', 5, 6004, 1004, 2004, 3007),
(10005, '2023-04-05', 2, 6005, 1005, 2005, 3005),
(10006, '2023-04-06', 2, 6006, 1001, 2006, 3002),
(10007, '2023-04-07', 3, 6007, 1002, 2007, 3007),
(10008, '2023-04-08', 5, 6008, 1003, 2008, 3002),
(10009, '2023-04-09', 4, 6009, 1004, 2001, 3009),
(10010, '2023-04-10', 4, 6010, 1005, 2002, 3001);

--Utilities Table
INSERT INTO UTILITIES (Utility_ID, Utility_Name, Utility_Type, Utility_Price, Cust_ID) 
VALUES 
(7001, 'Locker 1', 'Locker', 50, 6001),
(7002, 'Weights 1', 'Weights', 20, 6002),
(7003, 'Machine 1', 'Machines', 100, 6003),
(7004, 'Locker 2', 'Locker', 75, 6004),
(7005, 'Weights 2', 'Weights', 30, 6005),
(7006, 'Locker 1', 'Locker', 50, 6006),
(7007, 'Weights 1', 'Weights', 20, 6007),
(7008, 'Machine 1', 'Machines', 100, 6008),
(7009, 'Locker 2', 'Locker', 75, 6009),
(7010, 'Weights 2', 'Weights', 30, 6010),
(7011, 'Locker 1', 'Locker', 50, 6011),
(7012, 'Weights 1', 'Weights', 20, 6012),
(7013, 'Machine 1', 'Machines', 100, 6013),
(7014, 'Locker 2', 'Locker', 75, 6014),
(7015, 'Weights 2', 'Weights', 30, 6015);

--Locker Table
INSERT INTO LOCKER (Locker_ID, Locker_Availability, Locker_Size, Locker_Location)
VALUES 
(7004, 'Yes', 'Small', 'Main Lobby'),
(7006, 'No', 'Medium', 'Second Floor'),
(7009, 'Yes', 'Large', 'Basement'),
(7011, 'No', 'Small', 'Third Floor'),
(7014, 'Yes', 'Medium', 'First Floor');

--Weights Table
INSERT INTO WEIGHTS (Weight_ID, Weight_Type, Weight_Size) 
VALUES 
(7002, 'Small', 1),
(7005, 'Large', 3),
(7007, 'Medium', 2),
(7010, 'Extra Large', 5),
(7012, 'Small', 2),
(7015, 'Small', 2);

--Machines Table
INSERT INTO MACHINES (Machine_ID, Machine_Type, Body_Group) 
VALUES 
(7003, 'Seated Chest Press', 'Chest'),
(7008, 'Preacher Curl', 'Bicep'),
(7013, 'Leg Press', 'Leg');

--Purchases Table
INSERT INTO PURCHASES (Pur_Invoice_No, Pur_Date, Pur_Quantity, Utility_ID, Manu_ID, Location_ID) 
VALUES 
(9001, '2023-04-01', 10, 7001, 9001, 1001),
(9002, '2023-04-02', 5, 7002, 9002, 1002),
(9003, '2023-04-03', 8, 7003, 9003, 1003),
(9004, '2023-04-04', 15, 7004, 9004, 1004),
(9005, '2023-04-05', 20, 7005, 9005, 1005),
(9006, '2023-04-06', 12, 7006, 9006, 1001),
(9007, '2023-04-07', 7, 7007, 9007, 1002),
(9008, '2023-04-08', 9, 7008, 9008, 1003),
(9009, '2023-04-09', 18, 7009, 9009, 1004),
(9010, '2023-04-10', 6, 7010, 9010, 1005);
