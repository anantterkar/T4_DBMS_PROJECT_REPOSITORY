USE T4_Car_Insurance_DB;

-- 1

-- Retrieve Customer and Vehicle details who has been involved in an incident and claim status
-- is pending

SELECT T4_Customer.*,T4_Vehicle.* 
FROM T4_Customer
INNER JOIN T4_Vehicle
ON T4_Customer.CUST_ID = T4_Vehicle.Cust_id
WHERE T4_Customer.CUST_ID IN
(SELECT CUST_ID FROM t4_claim
WHERE INCIDENT_ID IS NOT NULL
AND CLAIM_STATUS LIKE "PENDING");        -- Input DATA capitalization unknown

-- NOTE: This returns ALL the vehicles the customer owns irrespective of which of his/her
-- vehicle was involved in the incident.
-- To get the specific vehicle/s,the claim_settlement table must be used

SELECT T4_Customer.*,T4_Vehicle.* 
FROM T4_Customer
INNER JOIN T4_Vehicle
ON T4_Customer.CUST_ID = T4_Vehicle.Cust_id
INNER JOIN T4_Claim_Settlement
ON T4_Claim_Settlement.CUST_ID = T4_Customer.CUST_ID
INNER JOIN T4_Claim
ON T4_Claim.CLAIM_ID = T4_Claim_Settlement.CLAIM_ID
WHERE T4_Claim.INCIDENT_ID IS NOT NULL
AND T4_Claim.CLAIM_STATUS LIKE "PENDING";

-- 2

-- Retrieve customer details who has premium payment amount greater than the sum of all
-- the customerIds in the database

-- ASSUMPTION MADE[SUBJECTED TO CHANGE] - SUM of the LITERAL customer IDs is considered
-- and the IDs are +ve Integers

SELECT T4_Customer.*
FROM T4_Customer
RIGHT JOIN T4_Premium_Payment
ON T4_Customer.CUST_ID = T4_Premium_Payment.CUST_ID  
WHERE PREMIUM_PAYMENT_AMOUNT > (SELECT SUM(CAST(CUST_ID AS UNSIGNED)) FROM T4_Customer);

-- 3

-- Retrieve Company details whose number of products is greater than departments, where
-- the departments are located in more than one location

-- Address IS assumed to be the column storing LOCATION

SELECT T4_Insurance_Company.*
FROM T4_Insurance_Company
INNER JOIN T4_Product
ON T4_Insurance_Company.Company_name = T4_Product.Company_name
INNER JOIN T4_Department
ON T4_Insurance_Company.Company_name = T4_Department.Company_name
INNER JOIN T4_Office
ON T4_Insurance_Company.Company_name = T4_Office.Company_name
GROUP BY T4_Product.Company_name, T4_Department.Company_name
HAVING COUNT(T4_Product.Company_name) > COUNT(T4_Department.Company_name)
AND COUNT(DISTINCT(T4_Office.Address)) > 1;

-- 4

-- Select Customers who have more than one Vehicle, where the premium for one of the
-- Vehicles is not paid and it is involved in accident

-- i.e the same vehicle MUST have both unpaid premium and an incident record
-- there is no boolean confirming premium payment so it is verified using only the date

SELECT T4_Customer.*
FROM T4_Customer
INNER JOIN T4_Premium_Payment
ON T4_Premium_Payment.CUST_ID = T4_Customer.CUST_ID
INNER JOIN T4_Vehicle
ON T4_Customer.CUST_ID = T4_Vehicle.Cust_id
INNER JOIN T4_Claim_Settlement
ON T4_Claim_Settlement.VEHICLE_ID = T4_Vehicle.Vehicle_id
INNER JOIN T4_Claim
ON T4_Claim.CLAIM_ID = T4_Claim_Settlement.CLAIM_ID
INNER JOIN T4_Incident
ON T4_Incident.INCIDENT_ID = t4_claim.INCIDENT_ID
WHERE T4_Premium_Payment.RECEIPT_ID IS NULL   -- i.e. Payment is not done hence recipt not generated
AND T4_Incident.INCIDENT_TYPE LIKE "ACCIDENT"
GROUP BY T4_Vehicle.Cust_id
HAVING COUNT(T4_Vehicle.Cust_id) > 1;

-- THE WHERE STATEMENT CAN BE REPLACED TO SEARCH USING DATE IF NEEDED

-- 5
-- Select all vehicles which have premium more than its vehicle number
-- Premium Payments are linked on the Customer and not vehicles???????
-- Diskushun Riqvirud

SELECT T4_Vehicle.*
FROM T4_Vehicle
INNER JOIN T4_Customer
ON T4_Customer.CUST_ID = T4_Vehicle.Cust_id
INNER JOIN T4_Premium_Payment
ON T4_Premium_Payment.CUST_ID = T4_Customer.CUST_ID
WHERE CAST(T4_Vehicle.Vehicle_number AS UNSIGNED) < T4_Premium_Payment.PREMIUM_PAYMENT_AMOUNT;

-- 6
-- Retrieve Customer details whose Claim Amount is less than Coverage Amount and Claim
-- Amount is greater than Sum of (CLAIM_SETTLEMENT_ID, VEHICLE_ID, CLAIM_ID, CUST_ID)

SELECT T4_Customer.*
FROM T4_Customer
INNER JOIN T4_Vehicle
ON T4_Vehicle.Cust_id = T4_Customer.CUST_ID
INNER JOIN T4_Claim
ON T4_Claim.CLAIM_ID = T4_Customer.CUST_ID
INNER JOIN T4_Insurance_policy
ON T4_Insurance_policy.Cust_id = T4_Customer.CUST_ID
INNER JOIN T4_Insurance_Policy_Coverage
ON T4_Insurance_Policy_Coverage.AGREEMENT_ID = T4_Insurance_policy.Agreement_id
INNER JOIN T4_Coverage
ON T4_Coverage.COVERAGE_ID = T4_Insurance_Policy_Coverage.COVERAGE_ID
INNER JOIN T4_Claim_Settlement
ON T4_Claim_Settlement.CLAIM_ID = T4_Claim.CLAIM_ID
WHERE T4_Claim.CLAIM_AMOUNT < T4_Coverage.COVERAGE_AMOUNT
AND T4_Coverage.COVERAGE_AMOUNT > ( CAST(T4_Claim_Settlement.CLAIM_SETTLEMENT_ID AS UNSIGNED) + 
                                    CAST(T4_Vehicle.VEHICLE_ID AS UNSIGNED) +
                                    CAST(T4_Claim.CLAIM_ID AS UNSIGNED) +
                                    CAST(T4_Customer.CUST_ID AS UNSIGNED));

------------------------------------------------------------------------------------------------
---Validity Test remainig, to be done after complete addition of DATA---------------------------