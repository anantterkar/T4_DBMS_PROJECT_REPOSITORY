CREATE DATABASE IF NOT EXISTS T4_Car_Insurance_DB;

USE T4_Car_Insurance_DB;

-- INSERTED
CREATE TABLE IF NOT EXISTS T4_Customer 
(
	CUST_ID VARCHAR(20) PRIMARY KEY,
    CUST_FNAME VARCHAR(10) NOT NULL,
    CUST_LNAME VARCHAR(10) NOT NULL,
    CUST_DOB DATE NOT NULL,
    CUST_GENDER VARCHAR(2) CHECK (CUST_GENDER IN ('M', 'F')),
    CUST_ADDRESS VARCHAR(20) NOT NULL,
    CUST_MOB_NUMBER INT NOT NULL,
    CUST_EMAIL VARCHAR(20) UNIQUE NOT NULL,
    CUST_PASSPORT_NUMBER VARCHAR(20) UNIQUE NOT NULL,
    CUST_MARITAL_STATUS VARCHAR(8) NOT NULL CHECK (CUST_MARITAL_STATUS IN ('Married', 'Single')),
    CUST_PPS_NUMBER INT UNIQUE NOT NULL
);

-- INSERTED
CREATE TABLE IF NOT EXISTS T4_Application
(
	APPLICATION_ID VARCHAR(20) PRIMARY KEY,
    CUST_ID VARCHAR(20),
    VEHICLE_ID VARCHAR(20) NOT NULL, -- ADD THE FOREIGN KEY FOR THIS LATER ----------
    APPLICATION_STATUS VARCHAR(8) NOT NULL CHECK (APPLICATION_STATUS IN ('Pending', 'Rejected', 'Accepted')),
    COVERAGE VARCHAR(50) NOT NULL,
    FOREIGN KEY (CUST_ID) REFERENCES T4_Customer(CUST_ID)
);

-- INSERTED
CREATE TABLE IF NOT EXISTS T4_Quote
(
	QUOTE_ID VARCHAR(20) PRIMARY KEY,
    APPLICATION_ID VARCHAR(20) NOT NULL,
    CUST_ID VARCHAR(20),
    ISSUE_DATE DATE NOT NULL,
    VALID_FROM_DATE DATE NOT NULL,
    VALID_TILL_DATE DATE NOT NULL,
    DESCRIPTION VARCHAR(100) NOT NULL,
    PRODUCT_ID VARCHAR(20) NOT NULL, -- ADD FOREGN KEY FOR THIS LATER ----------
    COVERAGE_LEVEL VARCHAR(20) NOT NULL,
    FOREIGN KEY (CUST_ID) REFERENCES T4_Customer(CUST_ID),
    FOREIGN KEY (APPLICATION_ID) REFERENCES T4_Application(APPLICATION_ID)
);

-- INSERTED
CREATE TABLE IF NOT EXISTS T4_Premium_Payment
(
	PREMIUM_PAYMENT_ID VARCHAR(20) PRIMARY KEY,
    CUST_ID VARCHAR(20) NOT NULL,
    POLICY_NUMBER VARCHAR(20) NOT NULL,  
    PREMIUM_PAYMENT_SCHEDULE DATE NOT NULL,
    PREMIUM_PAYMENT_AMOUNT INT NOT NULL,
    RECEIPT_ID VARCHAR(20) NOT NULL, -- foreign key to receipt, add later ---------
    
    FOREIGN KEY (CUST_ID) REFERENCES T4_Customer(CUST_ID)
);

-- INSERTED
CREATE TABLE IF NOT EXISTS T4_Claim
(
	CLAIM_ID VARCHAR(20) PRIMARY KEY,
    CUST_ID VARCHAR(20) NOT NULL,
    AGREEMENT_ID VARCHAR(20)NOT NULL, -- ADD THE FOREGN KEY FOR THIS LATER ------------
    CLAIM_AMOUNT INT NOT NULL,
    INCIDENT_ID VARCHAR(20) NOT NULL, -- ADD THE FOREIGN KEY FOR THIS LATER -------------
    DAMAGE_TYPE VARCHAR(50) NOT NULL,
    DATE_OF_CLAIM DATE NOT NULL,
    CLAIM_STATUS VARCHAR(10) NOT NULL,
    
    FOREIGN KEY (CUST_ID) REFERENCES T4_Customer(CUST_ID)
);

-- INSERTED
CREATE TABLE IF NOT EXISTS T4_Claim_Settlement
(
	CLAIM_SETTLEMENT_ID VARCHAR(20) PRIMARY KEY,
    CLAIM_ID VARCHAR(20) NOT NULL,
    CUST_ID VARCHAR(20) NOT NULL,
    VEHICLE_ID VARCHAR(20) NOT NULL, -- ADD FOREIGN KEY FOR THIS LATER ----------
    DATE_SETTLED DATE NOT NULL,
    AMOUNT_PAID INT NOT NULL,
    COVERAGE_ID VARCHAR(20) NOT NULL,
    
    FOREIGN KEY (CUST_ID) REFERENCES T4_Customer(CUST_ID),
    FOREIGN KEY (CLAIM_ID) REFERENCES T4_Claim(CLAIM_ID)
);

-- INSERTED
CREATE TABLE IF NOT EXISTS T4_Coverage
(
    COVERAGE_ID VARCHAR(20) PRIMARY KEY,
    COVERAGE_AMOUNT INT NOT NULL,
    COVERAGE_TYPE VARCHAR(10) NOT NULL,
    COVERAGE_LEVEL VARCHAR(15) NOT NULL CHECK (COVERAGE_LEVEL IN ('HIGH', 'MEDIUM', 'LOW')),
    PRODUCT_ID VARCHAR(20) NOT NULL, -- ADD FOREIGN KEY FOR THIS LATER --------
    COVERAGE_DESCRIPTION VARCHAR(100) NOT NULL,
    COVERAGE_TERMS VARCHAR(50) NOT NULL,
    COMPANY_NAME VARCHAR(20) NOT NULL
);

-- INSERTED
CREATE TABLE IF NOT EXISTS T4_Insurance_policy (
    Agreement_id VARCHAR(20) PRIMARY KEY,
    Application_id VARCHAR(20) NOT NULL, -- ADDING FOREIGN KEY -------
    Cust_id VARCHAR(20) NOT NULL, -- ADDING FOREIGN KEY --------
    Department_name VARCHAR(20) NOT NULL, -- ADDING FOREIGN KEY --------
    Policy_number VARCHAR(20) NOT NULL,
    Start_date DATE NOT NULL,
    Expiry_date DATE NOT NULL,
    Term_condition_description VARCHAR(100) NOT NULL
);

-- INSERTED
CREATE TABLE IF NOT EXISTS T4_Vehicle (
    Vehicle_id VARCHAR(20) PRIMARY KEY,
    Cust_id VARCHAR(20) NOT NULL, -- FOREIGN KEY ------
    Policy_id VARCHAR(20) NOT NULL,
    Dependent_nok_id VARCHAR(20), -- FOREIGN KEY , HAD TO CREATE NEXT OF KIN TABLE -------
    Vehicle_registration_number VARCHAR(20),   -- UNIQUE NOT NULL
    Vehicle_value INT NOT NULL,
    Vehicle_type VARCHAR(20) NOT NULL,
    Vehicle_size INT NOT NULL,
    Vehicle_number_of_seat INT NOT NULL,
    Vehicle_manufacturer VARCHAR(20) NOT NULL,
    Vehicle_engine_number INT UNIQUE NOT NULL,
    Vehicle_chasis_number INT UNIQUE NOT NULL,
    Vehicle_number VARCHAR(20),
    Vehicle_model_number VARCHAR(20) UNIQUE NOT NULL
);

-- INSERTED
CREATE TABLE IF NOT EXISTS T4_Department (
    Department_name VARCHAR(20) PRIMARY KEY,
    Company_name VARCHAR(20) NOT NULL, -- FOREIGN KEY ------
    Office VARCHAR(20) NOT NULL,
    Contact_information VARCHAR(20) UNIQUE NOT NULL,
    Department_staff VARCHAR(50) NOT NULL,
    Department_leader VARCHAR(20) NOT NULL
);

-- INSERTED
CREATE TABLE IF NOT EXISTS T4_Office (
    Office_name VARCHAR(20) PRIMARY KEY,
	Office_leader VARCHAR(20) NOT NULL,
	Contact_information VARCHAR(20) UNIQUE NOT NULL,
	Address VARCHAR(20) NOT NULL,
	Admin_cost INT NOT NULL,
	Staff VARCHAR(50) NOT NULL,
    Department_name VARCHAR(20) NOT NULL, -- FOREIGN KEY ------
    Company_name VARCHAR(20) NOT NULL -- FOREIGN KEY ------
);

-- INSERTED
CREATE TABLE IF NOT EXISTS T4_Vehicle_service (
    Vehicle_service VARCHAR(20) PRIMARY KEY,
    Vehicle_id VARCHAR(20) NOT NULL, -- FOREIGN KEY ----
    Cust_id VARCHAR(20) NOT NULL, -- FOREIGN KEY ----
    Department_name CHAR(20) NOT NULL, -- FOREIGN KEY -----
    Vehicle_service_address VARCHAR(20) NOT NULL,
    Vehicle_service_contact VARCHAR(20) UNIQUE NOT NULL,
    Vehicle_service_incharge CHAR(20) NOT NULL,
    Vehicle_service_type VARCHAR(20) NOT NULL
);

-- INSERTED
CREATE TABLE IF NOT EXISTS T4_Product (
    Product_number VARCHAR(20) PRIMARY KEY,
    Product_price INT NOT NULL,
    Product_type CHAR(15) NOT NULL,
    Company_name VARCHAR(20) NOT NULL -- FOREIGN KEY -----  
);

-- INSERTED
CREATE TABLE IF NOT EXISTS T4_Insurance_company (
    Company_name VARCHAR(20) PRIMARY KEY,
    Company_address VARCHAR(100) NOT NULL,
    Company_contact_number INT UNIQUE NOT NULL,
    Company_fax INT UNIQUE NOT NULL,
    Company_email VARCHAR(50) UNIQUE NOT NULL,
    Company_website VARCHAR(50) NOT NULL,
    Company_location VARCHAR(50) NOT NULL,
    Company_department_name VARCHAR(50) NOT NULL,
    Company_office_name VARCHAR(50) NOT NULL
);

-- INSERTED
CREATE TABLE IF NOT EXISTS T4_Receipt
(
	RECEIPT_ID VARCHAR(20) PRIMARY KEY,
    PREMIUM_PAYMENT_ID VARCHAR(20),  -- NOT NULL
    CUST_ID VARCHAR(20) NOT NULL,
    COST INT NOT NULL,
    TIME DATE NOT NULL,
    
    FOREIGN KEY (CUST_ID) REFERENCES T4_Customer(CUST_ID),
    FOREIGN KEY (PREMIUM_PAYMENT_ID) REFERENCES T4_Premium_Payment(PREMIUM_PAYMENT_ID)
);

CREATE TABLE IF NOT EXISTS T4_Insurance_Policy_Coverage
(
	AGREEMENT_ID VARCHAR(20),
    COVERAGE_ID VARCHAR(20),
    
    PRIMARY KEY (AGREEMENT_ID, COVERAGE_ID),
    FOREIGN KEY (COVERAGE_ID) REFERENCES T4_Coverage(COVERAGE_ID)
);

-- INCIDENT
CREATE TABLE IF NOT EXISTS T4_Incident
(
	INCIDENT_ID VARCHAR(20) PRIMARY KEY,
    INCIDENT_TYPE VARCHAR(30) NOT NULL,
    INCIDENT_DATE DATE NOT NULL,
	DESCRIPTION VARCHAR(100) NOT NULL
);

-- INSERTED
CREATE TABLE IF NOT EXISTS T4_Incident_Report
(
	INCIDENT_REPORT_ID VARCHAR(20) PRIMARY KEY,
    INCIDENT_ID VARCHAR(20) NOT NULL, 
    CUST_ID VARCHAR(20) NOT NULL,
    INCIDENT_INSPECTOR VARCHAR(20) NOT NULL,
    INCIDENT_COST INT NOT NULL,
    INCIDENT_TYPE VARCHAR(10) NOT NULL,
    INCIDENT_REPORT_DESCRIPTION VARCHAR(100) NOT NULL,
    
    FOREIGN KEY (INCIDENT_ID) REFERENCES T4_Incident(INCIDENT_ID),
    FOREIGN KEY (CUST_ID) REFERENCES T4_Customer(CUST_ID)
);

-- INSERTED
CREATE TABLE IF NOT EXISTS T4_NOK
(
	NOK_ID VARCHAR(20) PRIMARY KEY,
    AGREEMENT_ID VARCHAR(20) NOT NULL,
    CUST_ID VARCHAR(20) NOT NULL,
    NOK_NAME VARCHAR(20) NOT NULL,
    NOK_ADDRESS VARCHAR(20) NOT NULL,
    NOK_PHONE_NUMBER INT NOT NULL,
    NOK_MARITAL_STATUS VARCHAR(8) NOT NULL CHECK (NOK_MARITAL_STATUS IN ('Married', 'Single')),
    NOK_GENDER VARCHAR(2) NOT NULL CHECK (NOK_GENDER IN ('M', 'F')),
    
    FOREIGN KEY (CUST_ID) REFERENCES T4_Customer(CUST_ID),
    FOREIGN KEY (AGREEMENT_ID) REFERENCES T4_Insurance_Policy(AGREEMENT_ID)
);

ALTER TABLE T4_Application
ADD FOREIGN KEY (VEHICLE_ID) REFERENCES T4_Vehicle(VEHICLE_ID);

ALTER TABLE T4_Quote
ADD FOREIGN KEY (PRODUCT_ID) REFERENCES T4_Product(Product_Number);

-- Removed foreign key Reciept ID from Premium Payments
-- ALTER TABLE T4_Premium_Payment
-- ADD FOREIGN KEY (RECEIPT_ID) REFERENCES T4_Receipt(RECEIPT_ID);

ALTER TABLE T4_Claim
ADD FOREIGN KEY (AGREEMENT_ID) REFERENCES T4_Insurance_Policy(AGREEMENT_ID); 

ALTER TABLE T4_Claim
ADD FOREIGN KEY (INCIDENT_ID) REFERENCES T4_Incident(INCIDENT_ID);

ALTER TABLE T4_CLaim_Settlement
ADD FOREIGN KEY (VEHICLE_ID) REFERENCES T4_Vehicle(VEHICLE_ID);

ALTER TABLE T4_Insurance_Policy
ADD FOREIGN KEY (CUST_ID) REFERENCES T4_Customer(CUST_ID);

ALTER TABLE T4_Insurance_Policy
ADD FOREIGN KEY (DEPARTMENT_NAME) REFERENCES T4_Department(DEPARTMENT_NAME);

ALTER TABLE T4_Insurance_Policy_Coverage
ADD FOREIGN KEY (AGREEMENT_ID) REFERENCES T4_Insurance_Policy(AGREEMENT_ID);

ALTER TABLE T4_Vehicle
ADD FOREIGN KEY (CUST_ID) REFERENCES T4_Customer(CUST_ID);

ALTER TABLE T4_Vehicle
ADD FOREIGN KEY (DEPENDENT_NOK_ID) REFERENCES T4_NOK(NOK_ID);

ALTER TABLE T4_Department
ADD FOREIGN KEY (COMPANY_NAME) REFERENCES T4_Insurance_Company(COMPANY_NAME);

ALTER TABLE T4_Office
ADD FOREIGN KEY (DEPARTMENT_NAME) REFERENCES T4_Department(DEPARTMENT_NAME);

ALTER TABLE T4_Office
ADD FOREIGN KEY (COMPANY_NAME) REFERENCES T4_Insurance_Company(COMPANY_NAME);

ALTER TABLE T4_Vehicle_Service
ADD FOREIGN KEY (CUST_ID) REFERENCES T4_Customer(CUST_ID);

ALTER TABLE T4_Vehicle_Service
ADD FOREIGN KEY (DEPARTMENT_NAME) REFERENCES T4_Department(DEPARTMENT_NAME);

ALTER TABLE T4_Vehicle_Service
ADD FOREIGN KEY (VEHICLE_ID) REFERENCES T4_Vehicle(VEHICLE_ID);

ALTER TABLE T4_Product
ADD FOREIGN KEY (COMPANY_NAME) REFERENCES T4_Insurance_Company(COMPANY_NAME);

ALTER TABLE T4_Coverage
ADD FOREIGN KEY (COMPANY_NAME) REFERENCES T4_Insurance_Company(COMPANY_NAME);


-- DROP DATABASE T4_Car_Insurance_DB;
INSERT INTO T4_Customer VALUES
('100001', 'John', 'Cusack', '1990-01-01', 'M', 'Maharashtra, India', 943204482, 'johnc@gmail.com', 'A00001', 'Married', 10001),
('100002', 'Octavia', 'Blake', '1991-01-02', 'F', 'Orissa, India', 981584022, 'octaviab@gmail.com', 'B00002', 'Single', 10002),
('100003', 'Rohit', 'Sharma', '1991-01-03', 'M', 'Delhi, India', 902343177, 'rohits@gmail.com', 'C00003', 'Married', 10003),
('100004', 'Raveena', 'Tripathi', '1992-02-04', 'F', 'Rajasthan, India', 911837829, 'raveenat@gmail.com', 'D00004', 'Single', 10004),
('100005', 'Katie', 'Holmes', '1993-02-05', 'F', 'Punjab, India', 923782310, 'katieh@gmail.com', 'E00005', 'Single', 10005),
('100006', 'Prateek', 'Kuhad', '1990-03-06', 'M', 'Gujurat, India', 923478231, 'prateekk@gmail.com', 'F00006', 'Married', 10006),
('100007', 'Sahej', 'Singh', '1989-04-07', 'M', 'Karnataka, India', 771892451, 'sahejs@gmail.com', 'G00007', 'Married', 10007),
('100008', 'Amit', 'Jain', '1990-06-08', 'M', 'Maharashtra, India', 845192345, 'amitj@gmail.com', 'H00008', 'Single', 10008),
('100009', 'Anant', 'Agarwal', '1988-07-09', 'M', 'Gujurat, India', 892345271, 'ananta@gmail.com', 'I00009', 'Married', 10009),
('100010', 'Udit', 'Terkar', '1991-08-10', 'M', 'Rajasthan, India', 923517812, 'uditt@gmail.com', 'J00010', 'Married', 10010),
('100011', 'Shrishti', 'Bhimani', '1992-04-11', 'F', 'Delhi, India', 923512812, 'shrishtib@gmail.com', 'K00011', 'Single', 10011),
('100012', 'Lando', 'Norris', '1987-09-12', 'M', 'Maharashtra, India', 928395232, 'landon@gmail.com', 'L00012', 'Married', 10012),
('100013', 'Frank', 'Ocean', '1993-01-13', 'M', 'Orissa, India', 919092332, 'franko@gmail.com', 'M00013', 'Single', 10013),
('100014', 'Lewis', 'Hamilton', '1995-01-14', 'M', 'Karnataka, India', 812934128, 'lewish@gmail.com', 'N00014', 'Single', 10014),
('100015', 'Max', 'Verstappen', '1987-03-15', 'M', 'Gujurat, India', 819234682, 'maxv@gmail.com', 'O00015', 'Single', 10015);

INSERT INTO T4_Insurance_company VALUES
('Aegon Insurance','Ameerpet, Hyderabad, Telangana 500038',8854364,78542563,'AegonVehicle@help.com','AegonVehicle.com','Hyderabad','AegonVehicleoffice','AegonVehicleoffice'),
('Aviva Insurance', 'DLF Phase V, Sector 43, Gurgaon – 122003.',85840500,56801620,'aiaamaxVehicle@help.com','aviamaxVehicle.com','Gurgaon','aviamaxVehicleoffice','aviamaxVehicleoffice'),
('Bajaj Insurance', 'Andhra Pradesh Telangana',97695832,50356789,'customercare@bajajallianz.co.in','https://www.bajajallianzVehicle.com','Pune',' Bajaj Allianz Vehicle Insurance Co',' Bajaj Allianz Vehicle Insurance Co'),
('Bharti Insurance','Parinee Crescenzo, G Block, Bandra',99555754,99658932,'BhartiVehicle@help.com', 'BhartiVehicle.com', 'Mumbai', 'BhartiVehicleoffice', 'BhartiVehicleoffice'),
('Birla Insurance', 'Elphinstone Road, Mumbai',97699157,50336700,'care.Vehicleinsurance@adityabirlacapital.com', 'https://Vehicleinsurance.adityabirlacapital.com', 'Mumbai ', 'Birla Sun Vehicle Insurance ', 'Birla Sun Vehicle Insurance '),
('Canara Bank','Ameerpet, Hyderabad, Telangana 500038',85462548,87452563,'CanaraVehicle@help.com','CanaraVehicle.com','Hyderabad','CanaraVehicleoffice','CanaraVehicleoffice'),
('DLF Insurance', 'Sion Trombay Road,',98542527,85452315,'DLFVehicle@help.com','DLFVehicle.com','Sion','DLFVehicleoffice','DLFVehicleoffice'),
('Exide Insurance','Millers Road, Bangalore- 560 001, India.',97695414,50336715,'ExideVehicleInsurance@gmail.com','https://www.exideVehicle.in/','Mumbai','exidVehicleoffice','exideVehicle'),
('Future Insurance','Begumpet, Hyderabad, Telangana 500016',88740012,88749582,'FutureVehicle@help.com','FutureVehicle.com','Hyderabad','FutureVehicleoffice','FutureVehicleoffice'),
('HDFC Insurance','N.M. Joshi Marg, Mahalaxmi, Mumbai',97699177,88742069,'buyonline@hdfcVehicle.in','https://www.hdfcVehicle.com/','Mumbai','hdfcVehicle','hdfcVehicle'),
('ICICI Insurance','Prabhadevi, Mumbai ',97699766,50356751,'icicipruVehicle@gmail.com','https://www.icicipruVehicle.com/','Mumbai',' ICICI PruVehicle',' ICICI PruVehicle'),
('IDBI Insurance','Hyderabad, Telangana 500029',56858562,89870120,'IDBIFederalVehicle@help.com','IDBIFederalVehicle.com','Hyderabad','IDBI FederalVehicleoffice','IDBIFederalVehicleoffice'),
('Kotak Insurance','Bandra (E), Mumbai - 400 051',46598165,46598642,'KotakVehicleInsurance@help.com','KotakVehicleInsurance.com','Mumbai','kotakVehicleoffice','kotakVehicleoffice'),
('Max Insurance','Gurugram (Haryana) - 122002',97695577,50256720,'maxVehicle@help.com','maxVehicle.com','Gurugram','maxVehicleoffice','maxVehicleoffice');

INSERT INTO T4_Department VALUES
('Sales Dept','Aegon Insurance', 'Bhatt Limited', '9587462587', 'Jagdish Mehta, Jasmeet Jagan, Sunil Sujeet','Udit'),
('R&D Dept','Aviva Insurance', 'Reddy Co', '9752145698', 'Jasmeet Bundir, Kathar Prasan, Sudeep Jain','Prateek'),
('Accounts Dept','Bajaj Insurance', 'Ali inc', '9658742165', 'Rajnit Subhash, Anant Dave, Rakesh Mishra','Anant'),
('HR Dept','Bharti Insurance', 'Sharma and Sons', '7896584256', 'Pranav','Amit'),
('Admin Dept','Birla Insurance', 'Pathak Limited', '8457963215', 'Pramitiru, Astansha','Rohit'),
('Maintainence Dept','Canara Bank', 'Rai Co', '8699547125', 'Jamith Rao, Sadhak Pandya','Rahul'),
('Production Dept','DLF Insurance', 'Raj and sons', '9987458216', 'Kushi Mehta','Pratham'),
('Finance Dept','Exide Insurance', 'Bandhu Limited', '9876586215', 'Intis Khan, Hasib Bisah','Kapil'),
('Operations Dept','Future Insurance', 'Preeti LLC', '7856548236', 'Jussain Boult','Modi'),
('Purchase Dept','HDFC Insurance', 'Kamal Inc', '9987458625', 'Kashmir Khan','Pramod'),
('Project Dept','ICICI Insurance', 'Singh Limited', '7854956523', 'Indira Ihdnag,Hasik Nujag','Ram');

INSERT INTO T4_Office VALUES 
('Bhatt Limited', 'Vishesh Bhatt', '1212121212', 'Lucknow', 1200000,"", 'Sales Dept', 'Kotak Insurance'),
('Reddy Co', 'Srinivas Reddy', '2323232323', 'Bangalore', 1300000,"", 'R&D Dept', 'Kotak Insurance'),
('Ali inc', 'Lucky Ali', '5858585858', 'Bangalore', 1400000,"", 'Accounts Dept', 'ICICI Insurance'),
('Sharma and Sons', 'Shubham Sharma', '3131311333', 'Jabalpur', 1500000,"", 'HR Dept', 'Aegon Insurance'),
('Pathak Limited', 'Deeksha Pathak', '4747474747', 'Mumbai', 1600000,"", 'Admin Dept', 'Bajaj Insurance'),
('Rai Co', 'Balwant Rai', '3245678541', 'Mumbai', 1700000,"", 'Maintainence Dept', 'Canara Bank'),
('Raj and sons', 'Krishna Raj', '8769543211', 'Pune', 1800000,"", 'Production Dept', 'Birla Insurance'),
('Bandhu Limited', 'Rama Bandhu', '2341675897', 'Hyderbad', 1900000,"", 'Finance Dept', 'Birla Insurance'),
('Preeti LLC', 'Preeti Rai', '9876987652', 'Hyderbad', 1100000,"", 'Operations Dept','Canara Bank'),
('Kamal Inc', 'Kamal Kaushik', '4356273891', 'Delhi',1000000,"", 'Purchase Dept', 'Canara Bank'),
('Singh Limited', 'Rai Singh', '678781155', 'Pune', 1250000,"", 'Project Dept','ICICI Insurance'),
('Dhvani LLC', 'Dhvani Krishna', '98483356733', 'Lucknow', 1340000,"", 'Sales Dept', 'HDFC Insurance'),
('Davar Co', 'Shaimak Davar', '8900678456', 'Chennai', 1780000,"", 'R&D Dept', 'Bajaj Insurance'),
('Bista Inc', 'Jay Bista', '5678904357', 'Bangalore', 1560000,"", 'Accounts Dept','ICICI Insurance'),
('Nikita and Sons', 'Nikita Rai', '9090887766', 'Bangalore', 1650000,"", 'Maintainence Dept', 'Future Insurance');

INSERT INTO T4_Insurance_policy VALUES
('400001', '300001', '100001', 'Sales Dept', '101', '2010-01-01', '2011-01-01', 'Coverage against fire'),
('400002', '300002', '100002', 'R&D Dept', '102', '2009-02-01', '2010-02-01', 'Coverage against theft'),
('400003', '300003', '100003', 'Accounts Dept', '103', '2015-03-01', '2016-03-01', 'Coverage against accident'),
('400004', '300004', '100004', 'Sales Dept', '104', '2013-04-01', '2014-04-01', 'Coverage against third party property damage'),
('400005', '300005', '100005', 'Operations Dept', '103', '2018-05-01', '2019-05-01', 'Coverage against natural calamities'),
('400006', '300006', '100006', 'Accounts Dept', '106', '2019-06-01', '2020-06-01', 'Coverage against legal liability'),
('400007', '300007', '100007', 'R&D Dept', '107', '2011-07-01', '2012-07-01', 'Coverage against third party property damage'),
('400008', '300008', '100008', 'Maintainence Dept', '104', '2018-08-01', '2019-08-01', 'Liability Coverage'),
('400009', '300009', '100008', 'Operations Dept', '105', '2017-09-01', '2018-09-01', 'Coverage against accident,theft,fire,natural calamities'),
('400010', '300010', '100009', 'Purchase Dept', '109', '2016-10-01', '2017-10-01', 'Coverage against accident'),
('400011', '300011', '100009', 'Production Dept', '108', '2014-11-01', '2015-11-01', 'Coverage accident,fire,natural calamities'),
('400012', '300012', '100009', 'R&D Dept', '102', '2012-12-01', '2013-12-01', 'Coverage against self-ignition'),
('400013', '300013', '100010', 'Sales Dept', '103', '2020-01-01', '2021-01-01', 'Coverage against a legal liability for the damage you may cause'),
('400014', '300014', '100011', 'Finance Dept', '104', '2019-02-01', '2020-02-01', 'Liability Coverage'),
('400015', '300015', '100012', 'Maintainence Dept', '105', '2008-03-01', '2009-03-01', 'Coverage against theft'),
('400016', '300016', '100013', 'Finance Dept', '106', '2016-04-01', '2017-04-01', 'Coverage against loss of or damage to your vehicle');

INSERT INTO T4_NOK VALUES
('150001', '400001', '100001', 'Abhigyan','Hyderabad',95412125, 'Single', 'M'),
('150002', '400002', '100002', 'Nishita','Bangalore',98774354, 'Married', 'F'),
('150003', '400003', '100003', 'Udita','Pune',82741254, 'Single', 'F'),
('150004', '400004', '100004', 'Krishna','Mumbai',84252322, 'Married', 'M'),
('150005', '400005', '100005', 'Abhishek','Kolkata',75465455, 'Single', 'M'),
('150006', '400006', '100006', 'Harshit','Pune',87412525, 'Married', 'M'),
('150007', '400007', '100007', 'Aisha','Vadodara',82963214, 'Single', 'F'),
('150008', '400008', '100008', 'Divya','Bangalore',56321452, 'Married', 'F'),
('150009', '400009', '100009', 'Kritika','New Delhi',785125412, 'Single', 'F'),
('150010', '400010', '100010', 'Shubham','Hyderabad',79632145, 'Married', 'M'),
('150011', '400011', '100011', 'Maurya','Mumbai',60415463, 'Single', 'M'),
('150012', '400012', '100012', 'Michael','Bangalore',6380855, 'Married', 'M'),
('150013', '400013', '100013', 'Jagrut','Pune',75070811, 'Single', 'M'),
('150014', '400014', '100014', 'Rhea','Chennai',80077969, 'Married', 'F'),
('150015', '400015', '100015', 'Shivangi','Chennai',98451065, 'Single', 'F');

INSERT INTO T4_Vehicle VALUES
('200001','100001','205834',150001, 235479,1400000  ,'SUV'      ,60 ,6,'Morris Garages',239034,392618, "AP15AV8598",'2LX1876789'),
('200002','100002','243542',150002, 724589,1000000  ,'Sedan'    ,40 ,4,'Hyundai'    ,942618,563810,"DD22VD8649",'1MR5534254'),
('200003','100003','546535',150003, 328795,2500000  ,'MUV'      ,80 ,5,'Toyota'     ,234693,234934,"HP65GD9846",'2RX3754563'),
('200004','100004','029348',150004, 345787,24000000 ,'Coupe'    ,100,4,'Mercedes'   ,543223,641542,"MZ63TE7147",'1LX4345654'),
('200005','100005','234899',150005, 493578,900000   ,'Sedan'    ,50 ,4,'Volkswagen' ,673432,213479,"NL12HD7524",'4LT3765655'),
('200006','100006','546089',150006, 345789,1100000  ,'Sedan'    ,40 ,4,'Toyota'     ,234523,923843,"SK84VC8365",'1YC4958364'),
('200007','100007','198754',150007, 234789,3000000  ,'MUV'      ,70 ,5,'Ford'       ,764535,435923,"UP34CX9564",'2OQ1324355'),
('200008','100008','872394',150008, 987345,92000000 ,'Sports'   ,90 ,2,'McLaren'    ,174027,472104,"WB25ZT1648",'4KF2569853'),
('200009','100008','234039',150009, 324087,600000   ,'Sedan'    ,30 ,4,'Maruti'     ,382621,402817,"OR62YE8343",'2XU3989543'),
('200010','100009','656734',150010, 234780,530000   ,'Sedan'    ,75 ,4,'Ford'       ,945732,934582,"MP34KG4764",'1IE4234464'),
('200011','100009','763554',150011, 784556,2000000  ,'Hatchback',80 ,6,'Lamborghini',734235,432584,"LD56OP7464",'4FI2754645'),
('200012','100009','946834',150012, 653489,3000000  ,'Coupe'    ,130,2,'Porsche'    ,482618,492164,"UP11BE6743",'3IF3234532'),
('200013','100010','093234',150013, 589023,700000   ,'Sedan'    ,80 ,4,'Skoda'      ,293472,346732,"DL19PX2537",'1AS1243676'),
('200014','100011','734534',150014, 234809,400000   ,'Sedan'    ,40 ,4,'Mustang'    ,490234,736242,"TS82PS9372",'2LF4345234'),
('200015','100012','324945',150015, 243078,1200000  ,'Hatchback',43 ,5,'Hyundai'    ,234643,264343,"AP12AN4398",'4PC2375563');

INSERT INTO T4_Application VALUES
('300001', '100001', '200001', 'Pending', 'Third-Party Liability Only Cover'),
('300002', '100002', '200002', 'Rejected', 'Collision Damage or Own Damage (OD) Cover'),
('300003', '100003', '200003', 'Pending', 'Personal Accident Cover:'),
('300004', '100004', '200004', 'Accepted', 'Personal Accident Cover:'),
('300005', '100005', '200005', 'Pending', 'Comprehensive Car Insurance'),
('300006', '100006', '200006', 'Accepted', 'Zero Depreciation Insurance:'),
('300007', '100007', '200007', 'Accepted', 'Comprehensive Car Insurance'),
('300008', '100008', '200008', 'Pending', 'Comprehensive Car Insurance'),
('300009', '100008', '200009', 'Accepted', 'Zero Depreciation Insurance:'),
('300010', '100009', '200010', 'Accepted', 'Third-Party Liability Only Cover'),
('300011', '100009', '200011', 'Pending', 'Collision Damage or Own Damage (OD) Cover'),
('300012', '100009', '200012', 'Rejected', 'Comprehensive Car Insurance'),
('300013', '100010', '200013', 'Accepted', 'Zero Depreciation Insurance:'),
('300014', '100011', '200014', 'Rejected', 'Third-Party Liability Only Cover'),
('300015', '100012', '200015', 'Accepted', 'Personal Accident Cover:');



INSERT INTO T4_Product values
('900001', '40000','Bike Insurance','Birla Insurance' ),
('900002', '120000','Car Insurance', 'Kotak Insurance'),
('900003', '20000','Two Wheeler','Kotak Insurance' ),
('900004', '80000','Car-Economy','Birla Insurance' ),
('900005', '90000','Two Wheeler', 'Kotak Insurance'),
('900006', '200000','Car-Luxury', 'Kotak Insurance'),
('900007', '4000','Two Wheeler', 'Birla Insurance'),
('900008', '1000','Two Wheeler','Canara Bank' ),
('900009', '10000','Car-Topup', 'Aegon Insurance'),
('900010', '40000','two wheeler', 'Kotak Insurance'),
('900011', '40000','Two Wheeler','Birla Insurance' ),
('900012', '40000','Two Wheeler', 'DLF Insurance'),
('900013', '40000','Car-Economy','IDBI Insurance' ),
('900014', '40000','Car/Bike', 'Birla Insurance'),
('900015', '40000','Two Wheeler', 'Canara Bank');

INSERT INTO T4_Quote VALUES
('160001', '300001', '100001', '2020-01-02', '2020-01-02', '2025-01-02', 'MG Hector', '900001', 'COVERAGE-LEVEL'),
('160002', '300002', '100002', '2016-03-04', '2016-03-04', '2021-03-04', 'Hyundai Tucson', '900002', 'COVERAGE-LEVEL'),
('160003', '300003', '100003', '2017-04-08', '2017-04-08', '2022-04-08', 'Toyota Camry', '900003', 'COVERAGE-LEVEL'),
('160004', '300004', '100004', '2018-05-16', '2018-05-16', '2023-05-16', 'Mercedes Benz', '900004', 'COVERAGE-LEVEL'),
('160005', '300005', '100005', '2019-06-03', '2019-06-03', '2024-06-03', 'Volkswagon Vento', '900005', 'COVERAGE-LEVEL'),
('160006', '300006', '100006', '2021-07-09', '2021-07-09', '2026-07-09', 'Toyota Camry', '900006', 'COVERAGE-LEVEL'),
('160007', '300007', '100007', '2015-08-27', '2015-08-27', '2020-08-27', 'Ford Fiesta', '900007', 'COVERAGE-LEVEL'),
('160008', '300008', '100008', '2014-09-05', '2014-09-05', '2019-09-05', 'Mclaren GT', '900008', 'COVERAGE-LEVEL'),
('160009', '300009', '100008', '2013-10-10', '2013-10-10', '2018-10-10', 'Maruti Suzuki', '900009', 'COVERAGE-LEVEL'),
('160010', '300010', '100009', '2012-11-15', '2012-11-15', '2017-11-15', 'Ford Endevour', '900010', 'COVERAGE-LEVEL'),
('160011', '300011', '100009', '2011-12-11', '2011-12-11', '2016-12-11', 'Lamborghini Aventador', '900011', 'COVERAGE-LEVEL'),
('160012', '300012', '100009', '2010-01-21', '2010-01-21', '2015-01-21', 'Porsche Carrera', '900012', 'COVERAGE-LEVEL');

INSERT INTO T4_Vehicle_service VALUES
('Engine Change', '200001', '100001', 'Sales dept', 'Pune', '92385102345', 'Poonam', 'AA'),
('Body Paint', '200002','100002', 'R&D Dept', 'Mumbai', '92839529346', 'Shilpa', 'BB'),
('AC Work', '200003', '100003', 'Accounts Dept', 'Kolkata', '9042368263', 'Preeti', 'CC'),
('Chassis Replace', '200004', '100004', 'HR Dept', 'Delhi', '9206234819', 'Pooja', 'DD'),
('Steering Change', '200005', '100005', 'Admin Dept', 'Tripura', '9105273912', 'Anant', 'EE'),
('Rotate tires', '200006', '100006', 'Maintainence Dept', 'Orissa', '9205617289', 'Udit', 'FF'),
('Oil filter', '200007', '100007', 'Production Dept', 'Himachal', '9081267673', 'Prateek', 'GG'),
('Fuel Filter', '200008', '100008', 'Finance Dept', 'Kashmir', '8234510238', 'Pratham', 'HH'),
('Battery Check', '200009', '100008', 'Operations Dept', 'Kolkata', '8293562396', 'Rohit', 'II'),
('Water Filter', '200010', '100009', 'Purchase Dept', 'Gujurat', '72306283956', 'Rahul', 'JJ'),
('Headlights', '200011', '100009', 'Project Dept', 'Rajasthan', '7829357283', 'Tommy', 'KK'),
('Taillights', '200012', '100009', 'Admin Dept', 'Jaipur', '7788912351', 'Sakura', 'LL'),
('Clean', '200013', '100010', 'Maintainence Dept', 'Raipur', '9023231235', 'Rohan', 'MM'),
('Engine check', '200014', '100011', 'R&D Dept', 'Dhaka', '9023189122', 'Rooma', 'NN'),
('Accelerator', '200015', '100012', 'Finance Dept', 'Shimla', '7781923512', 'Connor', 'OO');

INSERT INTO T4_Coverage VALUES 
('800001', 410000, 'Liability', 'HIGH', '900001', 'When accident takes place before your fault', '1 Year', 'Birla Insurance'),
('800002', 520000, 'Collision', 'HIGH', '900002', 'Bear your car repair expenses after the accident', '8 Months', 'ICICI Insurance'),
('800003', 630000, 'Injury', 'LOW', '900003',  'Personal injury protection will cover all the costs', '8 Months', 'Birla Insurance'),
('800004', 400000, 'Liability', 'LOW', '900004', 'When accident takes place before your fault', '2 Years', 'Canara Bank'),
('800005', 150000, 'Collision', 'LOW', '900005', 'Includes risk factors with your vehicle, driver, passengers', '8 Months', 'DLF Insurance'),
('800006', 160000, 'Injury', 'HIGH', '900006', 'Personal injury protection will cover all the costs associated with the accident', '13 Months', 'Max Insurance'),
('800007', 170000, 'Liability', 'MEDIUM', '900007', 'When accident takes place before your fault', '18 Months', 'Birla Insurance'),
('800008', 180000, 'Collision', 'MEDIUM', '900008', 'Bear your car repair expenses after the accident', '15 Months', 'Exide Insurance'),
('800009', 190000, 'Injury', 'LOW', '900009', 'Personal injury protection will cover all the costs associated with the accident', '5 Months', 'Birla Insurance'),
('800010', 199000, 'Injury', 'LOW', '900010', 'Include risk factors with your vehicle, driver, passengers', '8 Months', 'Exide Insurance'),
('800011', 123000, 'Liability', 'MEDIUM', '900011', 'When accident takes place before your fault', '1 Year', 'Kotak Insurance'),
('800012', 156000, 'Collision', 'MEDIUM', '900012', 'Bear your car repair expenses after the accident', '1 Months', 'Kotak Insurance'),
('800013', 543000, 'Liability', 'HIGH', '900013', 'When accident takes place before your fault', '3 Years', 'Bharti Insurance'),
('800014', 687000, 'Liability', 'MEDIUM', '900014', 'When accident takes place before your fault', '1 Year', 'Aviva Insurance'),
('800015', 653000, 'Liability', 'MEDIUM', '900015', 'When accident takes place before your fault', '18 Months', 'Aegon Insurance');

INSERT INTO T4_Premium_Payment VALUES 
('700001' ,'100001', 23235345 ,   '2013-12-23' , 400000 , '140001'),
('700002' ,'100002', 34423423 ,   '2019-11-20' , 32000 ,  '140002'),
('700003' ,'100003', 342355325 ,  '2013-02-25' , 520000 , '140003'  ),
('700004' ,'100004', 4542334 ,    '2019-05-15' , 400000 , '140004'  ),
('700005' ,'100005', 3434235 ,    '2013-04-13' , 52000 ,  '140005'  ),
('700006' ,'100006', 86575745 ,   '2019-04-21' , 400000 , '140006'  ),
('700007' ,'100007', 74576547 ,   '2013-09-11' , 3800000 , '140007'  ),
('700008' ,'100008', 3432443535 , '2019-09-24' , 400000 ,  '140008'  ),
('700009' ,'100009', 34234234434 ,'2013-08-12' , 360000 ,  '140009'  ),
('700010' ,'100010', 534324 ,     '2019-01-23' , 2800000 , '140010'  ),
('700011' ,'100011', 342343434 ,  '2013-11-17' , 220000 ,  '140011'  ),
('700012' ,'100012', 87686867 ,   '2019-12-14' , 380000 ,   '140012'  ),
('700013' ,'100013', 767455436 ,  '2013-10-06' , 280000 ,  '140013'  ),
('700014' ,'100014', 6547554 ,    '2019-10-09' , 4000000 ,  '140014'),
('700015' ,'100015', 84567546 ,   '2013-05-02' , 3500000 , '140015');


INSERT INTO T4_Receipt VALUES
('140001', 700002, '100001', 450, '2020-02-20'),
('140002', 700013, '100002', 250, '2020-02-21'),
('140003', 700010, '100003', 350, '2020-02-22'),
('140004', 700012, '100004', 550, '2020-02-23'),
('140005', 700008, '100005', 650, '2020-02-24'),
('140006', 700005, '100006', 750, '2020-02-25'),
('140007', 700003, '100007', 150, '2020-02-26'),
('140008', 700004, '100008', 250, '2020-02-27'),
('140009', 700015, '100009', 220, '2020-01-11'),
('140010', 700007, '100010', 330, '2020-01-12'),
('140011', 700006, '100011', 500, '2020-01-14'),
('140012', 700009, '100012', 780, '2020-01-13'),
('140013', 700014, '100013', 230, '2020-01-15'),
('140014', 700011, '100014', 320, '2020-01-16'),
('140015', 700001, '100015', 480, '2020-01-17');


INSERT INTO T4_Incident VALUES
('500001','Fire','2011-10-03','Sparks from tear in the electric wiring systems are not covered in insurance'),
('500002','Theft','2003-10-07','Insurers will pay an amount equal to declared value of insured bike in case of theft.'),
('500003','Collision Coverage','2004-08-23','100% of the sum insured is offered on the accidental death of the insured person.'),
('500004','Lightning','2006-08-15','Under The policy of Standard Fire you can claim the Damage coverages'),
('500005','Faulty ignition','2006-11-14','Third-party car insurance cover will pay for any fiscal liability'),
('500006','External explosion','2008-05-23','Most homeinsurance covers you for damage caused by fire'),
('500007','Burglary','2009-10-15', 'Insurers will pay an amount equal to declared value of insured bike in case of theft.'),
('500008','Wildfire','2012-03-02', 'Insurance contract safeguards damage caused by accidental fire, lightning, explosion/implosion'),
('500009','Mechanical breakdown','2014-01-07','Equipment breakdown coverage.'),
('500010','Drunk Driving victim','2014-01-20','Driving under the influence of alcohol or drugs is illegal obviously'),
('500011','Natural disaster','2014-11-21','A comprehensive car insurance policy provides coverage against damages'),
('500012','Auto liability coverage','2015-04-09','Liability insurance is a part of the general insurance system of risk financing'),
('500013','Floods Damage','2015-11-17', 'Add on cover called Engine Protection to cover the losses to engine due to flood water.'),
('500014','Comprehensive Insurance','2016-04-04','provides the minimal required coverage of losses related to a third-party.'),
('500015','Aggravated damage','2017-07-28','Aggravated damages are the special on a defendant by a court');

INSERT INTO T4_Incident_Report  VALUES
('600001','500001','100001','Anand',25000,'Fire','Shortcircuit in console'),                            
('600002','500002','100002','Satish',400000,'Theft','Stolen'),
('600003','500003','100003','Zaid',18000,'Collision','Bumper damaged in collision'),
('600004','500004','100004','Reha',35000,'Lightning','Car hit by lightning'),
('600005','500005','100005','Ayush',21000,'Ignition','The car has a malfunctioning ignition'),
('600006','500006','100006','Srishti',80000,'Explosion','Vehicle caught fire and exploded '),
('600007','500007','100007','Shikha',100000,'Burglary','Parts stolen'),
('600008','500008','100008','Ajith',500000,'Wildfire','Vehicle damaged in wildfire'),
('600009','500009','100009','Mayank',55000,'Breakdown','Axle broke down'),
('600010','500010','100010','Hitesh',89000,'Floods','Drunk driver crashed and caused damage'),
('600011','500011','100011','Kamal',2500000,'Disaster','Damaged in a cyclone'),
('600012','500012','100012','Jagandeep',250000,'Liability','Vehicle caused damage to other vehicles'),
('600013','500013','100013','Shanu',1500000,'Floods','Submerged car does not start'),
('600014','500014','100014','Ajmal',250000,'Lightning','Insurance plan that covers the insured person against both'),
('600015','500015','100015','Sundar',17000,'Damage','Vehicle damaged by jilted lover');

-- T4_Claim
INSERT INTO T4_Claim VALUES
('110001', '100001', '400001', 50000, '500001', 'Vehicle Disfigurement', '2020-10-01', 'Approved'),
('110002', '100002', '400002', 20000, '500002', 'Pedestrian Injury', '2020-09-10', 'Rejected'),
('110003', '100003', '400003', 350000, '500003','Accident', '2020-11-01', 'Pending'),
('110004', '100004', '400004', 70000, '500004', 'Windshield damage', '2020-06-30', 'Approved'),
('110005', '100005', '400005', 350000, '500005','Chassis Disfigured', '2020-12-25', 'Rejected'),
('110006', '100006', '400006', 60000, '500006', 'Engine Overload', '2021-10-10', 'Pending'),
('110007', '100007', '400007', 450000, '500007','Windows Shattered', '2019-05-15', 'Rejected'),
('110008', '100008', '400008', 50000, '500008', 'Windshield damage', '2020-03-03', 'Approved'),
('110009', '100009', '400009', 30000, '500009', 'Vandalism', '2020-07-18', 'Approved'),
('110010', '100010', '400010', 750000, '500010','Transmission Broken', '2021-09-11', 'Pending'),
('110011', '100011', '400011', 10000, '500011', 'Animal collisions', '2020-11-01', 'Approved'),
('110012', '100012', '400012', 250000, '500012','Tyre Burst', '2020-02-20', 'Pending'),
('110013', '100013', '400013', 22000, '500013', 'Skull Fracture', '2020-05-24', 'Rejected'),
('110014', '100014', '400014', 880000, '500014','Loss of Life', '2020-07-14', 'Approved'),
('110015', '100015', '400015', 22000, '500015', 'Animal collisions', '2020-11-04', 'Rejected');
-- ('110016', '100001', '400016', 22000, '500012', 'Accident', '2020-01-22', 'Pending');

-- T4_Claim_Settlement
INSERT INTO T4_Claim_Settlement VALUES
('120001', '110001', '100001', '200001', '2020-10-20', 50000, '800001'),
('120002', '110002', '100002', '200002', '2020-10-10', 20000, '800002'),
('120003', '110003', '100003', '200003', '2020-12-01', 350000, '800003'),
('120004', '110004', '100004', '200004', '2020-08-30', 70000, '800004'),
('120005', '110005', '100005', '200005', '2021-02-25', 350000, '800005'),
('120006', '110006', '100006', '200006', '2021-12-10', 60000, '800006'),
('120007', '110007', '100007', '200007', '2019-05-25', 450000, '800007'),
('120008', '110008', '100008', '200008', '2020-03-20', 50000, '800008'),
('120009', '110009', '100009', '200009', '2020-09-22', 30000, '800009'),
('120010', '110010', '100010', '200010', '2021-10-21', 750000, '800010'),
('120011', '110011', '100011', '200011', '2020-12-28', 10000, '800011'),
('120012', '110012', '100012', '200012', '2020-04-20', 250000, '800012'),
('120013', '110013', '100013', '200013', '2020-06-24', 850000, '800013'), -- !!!!
('120014', '110014', '100014', '200014', '2020-09-14', 22000, '800014'),
('120015', '110015', '100015', '200015', '2020-11-24', 20000, '800015'); -- !!!!

INSERT INTO T4_INSURANCE_POLICY_COVERAGE VALUES
('400001','800001'),
('400002','800002'),
('400003','800003'),
('400004','800004'),
('400005','800005'), 
('400006','800006'),
('400007','800007'),
('400008','800008'),
('400009','800009'),
('400010','800010'), 
('400011','800011'),
('400012','800012'),
('400013','800013'),
('400014','800014'),
('400015','800015');


-- TO RUN THE UPDATES, INCLUDE THE SAFE MODE CHANGES TO CHANGE ALL ROWS TOO
-- CAN ADD MORE UPDATES FEASIBLY

-- END EXECUTION HERE TO RETURN TO SAFE MODE -- PLEASE DO NOT IGNORE THIS LINE

-- TO RUN THE UPDATES, INCLUDE THE SAFE MODE CHANGES TO CHANGE ALL ROWS TOO
-- CAN ADD MORE UPDATES FEASIBLY
-- SET SQL_SAFE_UPDATES = 0;


-- SET SQL_SAFE_UPDATES = 1;
-- END EXECUTION HERE TO RETURN TO SAFE MODE -- PLEASE DO NOT IGNORE THIS LINE


-- 2
SET @cust_id_sum = (SELECT SUM(CAST(CUST_ID AS UNSIGNED)) FROM T4_Customer);

SELECT *
FROM T4_Customer
JOIN T4_Premium_Payment
ON T4_Customer.CUST_ID = T4_Premium_Payment.Cust_ID
HAVING PREMIUM_PAYMENT_AMOUNT > @cust_id_sum;
