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
AND CLAIM_STATUS LIKE "PENDING");

SELECT C.*, V.*, CL.INCIDENT_ID, CL.CLAIM_STATUS
FROM T4_Customer C, T4_Vehicle V, T4_Claim CL
WHERE CL.CUST_ID = C.CUST_ID AND
	  V.CUST_ID = C.CUST_ID AND
      CL.INCIDENT_ID IS NOT NULL AND
      CL.CLAIM_STATUS LIKE "PENDING";

-- NOTE: This returns ALL the vehicles the customer owns irrespective of which of his/her
-- vehicle was involved in the incident.
-- To get the specific vehicle/s,the claim_settlement table must be used

-- 2

-- Retrieve customer details who has premium payment amount greater than the sum of all
-- the customerIds in the database

SELECT T4_Customer.*
FROM T4_Customer
RIGHT JOIN T4_Premium_Payment
ON T4_Customer.CUST_ID = T4_Premium_Payment.CUST_ID  
WHERE PREMIUM_PAYMENT_AMOUNT > (SELECT SUM(CAST(CUST_ID AS UNSIGNED)) FROM T4_Customer);

-- This method requries the subquery to be (unnecessarily) run for every iteration

-- Faster Method----[Storing the Sum Value in a Variable to avoid re-running the subquery]

DELIMITER $$
CREATE FUNCTION premium_over_cust_id_summation()
RETURNS INTEGER
DETERMINISTIC

BEGIN
    DECLARE cust_id_summation INTEGER;
    SET cust_id_summation =
    (SELECT SUM(CAST(CUST_ID AS UNSIGNED)) FROM T4_Customer);

    RETURN cust_id_summation;
END; $$

SET @cust_id_sum :=  premium_over_cust_id_summation();

SELECT T4_Customer.*
FROM T4_Customer
RIGHT JOIN T4_Premium_Payment
ON T4_Customer.CUST_ID = T4_Premium_Payment.CUST_ID  
WHERE PREMIUM_PAYMENT_AMOUNT > @cust_id_sum;

-- 3 ---------------------------------------------------------------------------

-- Retrieve Company details whose number of products is greater than departments,
-- where the departments are located in more than one location

DELIMITER $$
CREATE FUNCTION product_count(comp_name VARCHAR(20))
RETURNS INTEGER
DETERMINISTIC

BEGIN
    DECLARE prod_count INTEGER;
    SET prod_count = 
    (SELECT COUNT(Product_number) FROM T4_Product
     WHERE Company_name = comp_name);

    RETURN prod_count;
END; $$

DELIMITER $$
CREATE FUNCTION department_count(comp_name VARCHAR(20))
RETURNS INTEGER
DETERMINISTIC

BEGIN
    DECLARE dept_count INTEGER;
    SET dept_count = 
    (SELECT COUNT(Department_name) FROM t4_department
     WHERE Company_name = comp_name);

    RETURN dept_count;
END; $$

DELIMITER $$
CREATE FUNCTION department_location_count(comp_name VARCHAR(20))
RETURNS INTEGER
DETERMINISTIC

BEGIN
    DECLARE loc_count INTEGER;
    SET loc_count = 
    (SELECT COUNT(DISTINCT(Address)) FROM t4_office
     WHERE Company_name = comp_name);

    RETURN loc_count;
END; $$

SELECT T4_Insurance_Company.*
FROM T4_Insurance_Company
WHERE product_count(Company_name) > department_count(Company_name)
AND department_location_count(Company_name) > 1;


-- 4 ----------------------------------------------------------------------

-- Select Customers who have more than one Vehicle, 
-- where the premium for one of the
-- Vehicles is not paid and it is involved in accident

-- i.e the same vehicle MUST have both unpaid premium and an incident recor
-- there is no boolean confirming premium payment so it is verified using recipt id

SELECT C.*
FROM T4_CUSTOMER C, T4_PREMIUM_PAYMENT PP, T4_INCIDENT_REPORT IR, T4_INCIDENT I
WHERE PP.CUST_ID = IR.CUST_ID AND
	  IR.CUST_ID = C.CUST_ID AND
      I.INCIDENT_ID = IR.INCIDENT_ID AND
      PP.RECEIPT_ID IS NULL AND
      I.INCIDENT_TYPE LIKE "Accident" AND
      C.CUST_ID IN 
	  (SELECT C.Cust_ID FROM T4_Vehicle 
	  GROUP BY T4_Vehicle.Cust_ID
	  HAVING COUNT(Cust_ID) > 1);



SELECT *
FROM T4_Customer
INNER JOIN T4_Premium_Payment
ON T4_Premium_Payment.CUST_ID = T4_Customer.CUST_ID
INNER JOIN T4_incident_report
ON T4_incident_report.CUST_ID = T4_Customer.CUST_ID
INNER JOIN T4_incident
ON T4_incident.INCIDENT_ID = T4_incident_report.INCIDENT_ID
WHERE T4_Premium_Payment.RECEIPT_ID IS NULL
AND T4_Incident.INCIDENT_TYPE LIKE "Accident"
AND T4_Customer.CUST_ID IN 
(SELECT Cust_ID FROM T4_Vehicle 
GROUP BY T4_Vehicle.Cust_ID
HAVING COUNT(Cust_ID) > 1);

-- THE WHERE STATEMENT CAN BE REPLACED TO SEARCH USING DATE IF NEEDED

-- 5
-- Select all vehicles which have premium more than its vehicle number
-- Premium Payments are linked on the Customer and not vehicles
---------------------------------------------------------------------------------
DELIMITER $$
CREATE FUNCTION vehicle_number_convert(vehicle_num VARCHAR(20))
RETURNS INTEGER
DETERMINISTIC

BEGIN
    DECLARE abs_inst INTEGER; 
    SET abs_inst = 
    CAST(CONCAT(SUBSTR(vehicle_num,3,2),SUBSTR(vehicle_num,7,4)) AS UNSIGNED);
    RETURN abs_inst;
END; $$
----------------------------------------------------------------------------------
SELECT T4_Vehicle.*
FROM T4_Vehicle
INNER JOIN T4_Customer
ON T4_Customer.CUST_ID = T4_Vehicle.Cust_id
INNER JOIN T4_Premium_Payment
ON T4_Premium_Payment.CUST_ID = T4_Customer.CUST_ID
WHERE vehicle_number_convert(T4_Vehicle.Vehicle_number) < T4_Premium_Payment.PREMIUM_PAYMENT_AMOUNT;

SELECT V.*
FROM T4_Vehicle V, T4_Customer C, T4_Premium_Payment PP
WHERE C.Cust_ID = V.Cust_ID AND
      PP.Cust_ID = C.Cust_ID AND
      vehicle_number_convert(V.Vehicle_number) < PP.PREMIUM_PAYMENT_AMOUNT;

-- In Case Vehicle Number is an INTEGER value

-- SELECT T4_Vehicle.*
-- FROM T4_Vehicle
-- INNER JOIN T4_Customer
-- ON T4_Customer.CUST_ID = T4_Vehicle.Cust_id
-- INNER JOIN T4_Premium_Payment
-- ON T4_Premium_Payment.CUST_ID = T4_Customer.CUST_ID
-- WHERE CAST(T4_Vehicle.Vehicle_number AS UNSIGNED) < T4_Premium_Payment.PREMIUM_PAYMENT_AMOUNT;
-----------------------------------------------------------------------------------

-- 6
-- Retrieve Customer details whose Claim Amount is less than Coverage Amount and Claim
-- Amount is greater than Sum of (CLAIM_SETTLEMENT_ID, VEHICLE_ID, CLAIM_ID, CUST_ID)

SELECT T4_Customer.*
FROM T4_Customer
INNER JOIN T4_Vehicle
ON T4_Vehicle.Cust_id = T4_Customer.CUST_ID
INNER JOIN T4_Claim
ON T4_Claim.CUST_ID = T4_Customer.CUST_ID
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

SELECT C.*
FROM T4_Customer C, T4_Vehicle V, T4_Claim CL, T4_Insurance_policy IP, T4_Insurance_Policy_Coverage IPC, T4_Coverage CV, T4_Claim_Settlement CLAIM_SETTLEMENT_ID
WHERE V.Cust_id = C.CUST_ID AND
      CL.CUST_ID = C.CUST_ID AND
      IP.Cust_id = C.CUST_ID AND
      IPC.AGREEMENT_ID = IP.Agreement_id AND
      CV.COVERAGE_ID = IPC.COVERAGE_ID AND
      CS.CLAIM_ID = CL.CLAIM_ID AND
      CL.CLAIM_AMOUNT < CV.COVERAGE_AMOUNT AND
      CV.COVERAGE_AMOUNT > ( CAST(CS.CLAIM_SETTLEMENT_ID AS UNSIGNED) + 
                                    CAST(V.VEHICLE_ID AS UNSIGNED) +
                                    CAST(CL.CLAIM_ID AS UNSIGNED) +
                                    CAST(C.CUST_ID AS UNSIGNED));



------------------------------------------------------------------------------------------------
