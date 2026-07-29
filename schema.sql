CREATE DATABASE Telecom_project;
SHOW DATABASES;
USE telecom_project;
SELECT DATABASE();
CREATE TABLE telecom_sim (
    Customer_ID INT,
    SIM_Number VARCHAR(50),
    Mobile_Number VARCHAR(20),
    Gender VARCHAR(10),
    Age INT,
    Plan_Type VARCHAR(20),
    Activation_Date DATE,
    Status VARCHAR(20),
    Deactivation_Date DATE,
    Deactivation_Reason VARCHAR(100),
    Recharge_Amount DECIMAL(10,2),
    Monthly_Data_Usage_GB DECIMAL(10,2),
    Voice_Minutes INT,
    SMS_Count INT,
    Customer_Tenure_Days INT
);
SHOW DATABASES;

USE telecom_project;
SELECT DATABASE();

SELECT COUNT(*) FROM telecom_sim;
TRUNCATE TABLE telecom_sim;
SELECT COUNT(*) FROM telecom_sim;
LOAD DATA LOCAL INFILE 'C:/Users/swathi/Downloads/Telecom_SIM_Activation_Deactivation_100000.csv'
INTO TABLE telecom_sim
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;
SELECT COUNT(*) AS Total_Rows
FROM telecom_sim;
SELECT
SUM(Customer_ID IS NULL) AS Customer_ID_Nulls,
SUM(SIM_Number IS NULL) AS SIM_Number_Nulls,
SUM(Age IS NULL) AS Age_Nulls,
SUM(Status IS NULL) AS Status_Nulls
FROM telecom_sim;

SELECT Customer_ID, SIM_Number, COUNT(*) AS Duplicate_Count
FROM telecom_sim
GROUP BY Customer_ID, SIM_Number
HAVING COUNT(*) > 1;

ALTER TABLE telecom_sim
ADD PRIMARY KEY (Customer_ID, SIM_Number);

DESCRIBE telecom_sim;
SHOW CREATE TABLE telecom_sim;

SELECT *
FROM telecom_sim
WHERE Age < 18
   OR Age > 100;
   
   SELECT DISTINCT Status
FROM telecom_sim;

SELECT DISTINCT Plan_Type
FROM telecom_sim;

SELECT COUNT(*) AS Total_Rows
FROM telecom_sim;

