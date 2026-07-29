
-- KPI 1 : Total Customers

SELECT COUNT(*) AS Total_Customers
FROM telecom_sim;

----------------------------------------------------------
-- KPI 2 : Active SIMs
----------------------------------------------------------

SELECT COUNT(*) AS Active_SIMs
FROM telecom_sim
WHERE Status='Active';

----------------------------------------------------------
-- KPI 3 : Deactivated SIMs
----------------------------------------------------------

SELECT COUNT(*) AS Deactivated_SIMs
FROM telecom_sim
WHERE Status='Deactivated';

----------------------------------------------------------
-- KPI 4 : Activation Rate (%)
----------------------------------------------------------

SELECT
ROUND(
COUNT(CASE WHEN Status='Active' THEN 1 END)
*100.0/COUNT(*),2)
AS Activation_Rate
FROM telecom_sim;

----------------------------------------------------------
-- KPI 5 : Deactivation Rate (%)
----------------------------------------------------------

SELECT
ROUND(
COUNT(CASE WHEN Status='Deactivated' THEN 1 END)
*100.0/COUNT(*),2)
AS Deactivation_Rate
FROM telecom_sim;

----------------------------------------------------------
-- KPI 6 : Total Recharge Amount
----------------------------------------------------------

SELECT
SUM(Recharge_Amount) AS Total_Recharge
FROM telecom_sim;

----------------------------------------------------------
-- KPI 7 : Average Recharge Amount
----------------------------------------------------------

SELECT
AVG(Recharge_Amount) AS Average_Recharge
FROM telecom_sim;

----------------------------------------------------------
-- KPI 8 : Highest Recharge
----------------------------------------------------------

SELECT
MAX(Recharge_Amount) AS Highest_Recharge
FROM telecom_sim;

----------------------------------------------------------
-- KPI 9 : Lowest Recharge
----------------------------------------------------------

SELECT
MIN(Recharge_Amount) AS Lowest_Recharge
FROM telecom_sim;

----------------------------------------------------------
-- KPI 10 : Average Age
----------------------------------------------------------

SELECT
AVG(Age) AS Average_Age
FROM telecom_sim;

----------------------------------------------------------
-- KPI 11 : Youngest Customer
----------------------------------------------------------

SELECT
MIN(Age) AS Youngest_Customer
FROM telecom_sim;

----------------------------------------------------------
-- KPI 12 : Oldest Customer
----------------------------------------------------------

SELECT
MAX(Age) AS Oldest_Customer
FROM telecom_sim;

----------------------------------------------------------
-- KPI 13 : Total Monthly Data Usage
----------------------------------------------------------

SELECT
SUM(Monthly_Data_Usage_GB) AS Total_Data_Usage
FROM telecom_sim;

----------------------------------------------------------
-- KPI 14 : Average Monthly Data Usage
----------------------------------------------------------

SELECT
AVG(Monthly_Data_Usage_GB) AS Average_Data_Usage
FROM telecom_sim;

----------------------------------------------------------
-- KPI 15 : Customers by Gender
----------------------------------------------------------

SELECT
Gender,
COUNT(*) AS Total_Customers
FROM telecom_sim
GROUP BY Gender;

----------------------------------------------------------
-- KPI 16 : Customers by Plan Type
----------------------------------------------------------

SELECT
Plan_Type,
COUNT(*) AS Total_Customers
FROM telecom_sim
GROUP BY Plan_Type;

----------------------------------------------------------
-- KPI 17 : Customers by Status
----------------------------------------------------------

SELECT
Status,
COUNT(*) AS Total_Customers
FROM telecom_sim
GROUP BY Status;

----------------------------------------------------------
-- KPI 18 : Average Recharge by Gender
----------------------------------------------------------

SELECT
Gender,
AVG(Recharge_Amount) AS Average_Recharge
FROM telecom_sim
GROUP BY Gender;

----------------------------------------------------------
-- KPI 19 : Average Recharge by Plan Type
----------------------------------------------------------

SELECT
Plan_Type,
AVG(Recharge_Amount) AS Average_Recharge
FROM telecom_sim
GROUP BY Plan_Type;

----------------------------------------------------------
-- KPI 20 : Average Data Usage by Plan Type
----------------------------------------------------------

SELECT
Plan_Type,
AVG(Monthly_Data_Usage_GB) AS Average_Data_Usage
FROM telecom_sim
GROUP BY Plan_Type;