SQL VIEWS
=========================================================*/

CREATE VIEW vw_active_customers AS
SELECT *
FROM telecom_sim
WHERE Status='Active';

CREATE VIEW vw_deactivated_customers AS
SELECT *
FROM telecom_sim
WHERE Status='Deactivated';

CREATE VIEW vw_plan_summary AS
SELECT
Plan_Type,
COUNT(*) AS Total_Customers,
AVG(Recharge_Amount) AS Average_Recharge,
AVG(Monthly_Data_Usage_GB) AS Average_Data_Usage
FROM telecom_sim
GROUP BY Plan_Type;

CREATE VIEW vw_status_summary AS
SELECT
Status,
COUNT(*) AS Total_Customers,
AVG(Age) AS Average_Age,
SUM(Recharge_Amount) AS Total_Recharge
FROM telecom_sim
GROUP BY Status;