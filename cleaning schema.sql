USE telecom_project;
CREATE TABLE plan_lookup
(
Plan_Type VARCHAR(30) PRIMARY KEY,
Plan_Category VARCHAR(30)
);

INSERT INTO plan_lookup
VALUES
('Basic','Low Value'),
('Standard','Medium Value'),
('Premium','High Value');

CREATE TABLE gender_lookup
(
Gender VARCHAR(10) PRIMARY KEY,
Gender_Name VARCHAR(20)
);

INSERT INTO gender_lookup
VALUES
('M','Male'),
('F','Female');

SELECT
t.Customer_ID,
t.Plan_Type,
p.Plan_Category
FROM telecom_sim t
JOIN plan_lookup p
ON t.Plan_Type=p.Plan_Type;

SELECT
t.Customer_ID,
g.Gender_Name,
t.Age
FROM telecom_sim t
JOIN gender_lookup g
ON t.Gender=g.Gender;

SELECT
Gender,
COUNT(*) AS Total_Customers,
AVG(Age) AS Average_Age,
SUM(Recharge_Amount) AS Total_Recharge,
AVG(Recharge_Amount) AS Average_Recharge,
SUM(Monthly_Data_Usage_GB) AS Total_Data_Usage,
AVG(Monthly_Data_Usage_GB) AS Average_Data_Usage
FROM telecom_sim
GROUP BY Gender;

SELECT
Plan_Type,
COUNT(*) AS Total_Customers,
AVG(Age) AS Average_Age,
SUM(Recharge_Amount) AS Total_Recharge,
AVG(Recharge_Amount) AS Average_Recharge,
SUM(Monthly_Data_Usage_GB) AS Total_Data_Usage,
AVG(Monthly_Data_Usage_GB) AS Average_Data_Usage
FROM telecom_sim
GROUP BY Plan_Type;

SELECT
Status,
COUNT(*) AS Total_Customers,
AVG(Age) AS Average_Age,
SUM(Recharge_Amount) AS Total_Recharge,
AVG(Recharge_Amount) AS Average_Recharge,
SUM(Monthly_Data_Usage_GB) AS Total_Data_Usage,
AVG(Monthly_Data_Usage_GB) AS Average_Data_Usage
FROM telecom_sim
GROUP BY Status;

