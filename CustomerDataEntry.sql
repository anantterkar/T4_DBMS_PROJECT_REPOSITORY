USE T4_Car_Insurance_DB;

-- DROP DATABASE T4_Car_Insurance_DB;

-- Customer ID values from 100001 - 100015
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


-- LOOK AT THE QUERY STATEMENTS BEFORE DECIDING THE VALUES A,B,C
-- ENSURE THAT USER WITH ID 100008 and 9 have NOT paid their premium policy
-- VEHICLE NUMBER TO BE INSERTED AFTER STUDYING QUERY 5
-- Vehicle id from 200001 - 200016
INSERT INTO T4_Vehicle VALUES
('200001','100001','205834',A,B,1400000  ,'SUV'      ,60 ,6,'Morris Garages',239034,392618,C,'2LX1876789'),
('200002','100002','243542',A,B,1000000  ,'Sedan'    ,40 ,4,'Hyundai'    ,942618,563810,C,'1MR5534254'),
('200003','100003','546535',A,B,2500000  ,'MUV'      ,80 ,5,'Toyota'     ,234523,234934,C,'2RX3754563'),
('200004','100004','029348',A,B,24000000 ,'Coupe'    ,100,4,'Mercedes'   ,543223,641542,C,'1LX4345654'),
('200005','100005','234899',A,B,900000   ,'Sedan'    ,50 ,4,'Volkswagen' ,673432,213479,C,'4LT3765655'),
('200006','100006','546089',A,B,1100000  ,'Sedan'    ,40 ,4,'Toyota'     ,234523,923843,C,'1YC4958364'),
('200007','100007','198754',A,B,3000000  ,'MUV'      ,70 ,5,'Ford'       ,764535,435923,C,'2OQ1324355'),
('200008','100008','872394',A,B,92000000 ,'Sports'   ,90 ,2,'McLaren'    ,174027,472104,C,'4KF2569853'),
('200009','100008','234039',A,B,600000   ,'Sedan'    ,30 ,4,'Maruti'     ,382621,402817,C,'2XU3989543'),
('200010','100009','656734',A,B,530000   ,'Sedan'    ,75 ,4,'Ford'       ,945732,934582,C,'1IE4234464'),
('200011','100009','763554',A,B,2000000  ,'Hatchback',80 ,6,'Lamborghini',734235,432584,C,'4FI2754645'),
('200012','100009','946834',A,B,3000000  ,'Coupe'    ,130,2,'Porsche'    ,482618,492164,C,'3IF3234532'),
('200013','100010','093234',A,B,700000   ,'Sedan'    ,80 ,4,'Skoda'      ,293472,346732,C,'1AS1243676'),
('200014','100011','734534',A,B,400000   ,'Sedan'    ,40 ,4,'Mustang'    ,490234,736242,C,'2LF4345234'),
('200015','100012','324945',A,B,1200000  ,'Hatchback',43 ,5,'Hyundai'    ,234643,264343,C,'4PC2375563'),
('200016','100013','435035',A,B,5000000  ,'Sports'   ,140,2,'Mercedes'   ,023432,123041,C,'1QU3342342');

-- Application id Values from 300001 - 300016
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
('300015', '100012', '200015', 'Accepted', 'Personal Accident Cover:'),
('300016', '100013', '200016', 'Accepted', 'Collision Damage or Own Damage (OD) Cover');


-- Department Name = Departmentid From 201 - 204
-- Policy Number Values from 101 - 109
-- Description to be added
INSERT INTO T4_Insurance_policy VALUES
('400001', '300001', '100001', 'Sales Dept', '101', '2010-01-01', '2011-01-01', 'Coverage against loss of or damage to your vehicle caused by accident also for the legal liability for the damage you may cause to a third party property - while using your vehicle'),
('400002', '300002', '100002', 'R&D Dept', '102', '2009-02-01', '2010-02-01', 'Coverage against loss of or damage to your vehicle caused by accident,theft,fire,explosion,self-ignition,riots,strikes or acts of terrorism,natural calamities'),
('400003', '300003', '100003', 'Accounts Dept', '103', '2015-03-01', '2016-03-01', 'Coverage against loss of or damage to your vehicle caused by accident,theft,fire,natural calamities'),
('400004', '300004', '100004', 'Sales Dept', '104', '2013-04-01', '2014-04-01', 'Coverage against loss of or damage to your vehicle caused by accident also for the legal liability for the damage you may cause to a third party property - while using your vehicle'),
('400005', '300005', '100005', 'Operations Dept', '103', '2018-05-01', '2019-05-01', 'Coverage against loss of or damage to your vehicle caused by accident'),
('400006', '300006', '100006', 'Accounts Dept', '106', '2019-06-01', '2020-06-01', 'Coverage against loss of or damage to your vehicle caused by natural calamities'),
('400007', '300007', '100007', 'R&D Dept', '107', '2011-07-01', '2012-07-01', 'Coverage against loss of or damage to your vehicle caused by accident also for the legal liability for the damage you may cause to a third party property - while using your vehicle'),
('400008', '300008', '100008', 'Maintainence Dept', '104', '2018-08-01', '2019-08-01', 'Liability Coverage'),
('400009', '300009', '100008', 'Operations Dept', '105', '2017-09-01', '2018-09-01', 'Coverage against loss of or damage to your vehicle caused by accident,theft,fire,natural calamities'),
('400010', '300010', '100009', 'Purchase Dept', '109', '2016-10-01', '2017-10-01', 'Coverage against loss of or damage to your vehicle caused by accident,theft,fire,explosion,self-ignition,riots,strikes or acts of terrorism,natural calamities'),
('400011', '300011', '100009', 'Production Dept', '108', '2014-11-01', '2015-11-01', 'Coverage against loss of or damage to your vehicle caused by accident,theft,fire,natural calamities'),
('400012', '300012', '100009', 'R&D Dept', '102', '2012-12-01', '2013-12-01', 'Coverage against loss of or damage to your vehicle caused by accident'),
('400013', '300013', '100010', 'Sales Dept', '103', '2020-01-01', '2021-01-01', 'Coverage against loss of or damage to your vehicle caused by accident also for the legal liability for the damage you may cause to a third party property - while using your vehicle'),
('400014', '300014', '100011', 'Finance Dept ', '104', '2019-02-01', '2020-02-01', 'Liability Coverage'),
('400015', '300015', '100012', 'Maintainence Dept', '105', '2008-03-01', '2009-03-01', 'Coverage against loss of or damage to your vehicle caused by accident,theft,fire,natural calamities'),
('400001', '300016', '100013', 'Finance Dept ', '106', '2016-04-01', '2017-04-01', 'Coverage against loss of or damage to your vehicle caused by accident,theft,fire,explosion,self-ignition,riots,strikes or acts of terrorism,natural calamities');


-- Not done yet
INSERT INTO T4_Department VALUES
('Sales Dept',NULL, NULL, '9587462587', '','Udit'),
('R&D Dept',NULL, NULL, '9752145698', '','Prateek'),
('Accounts Dept',NULL, NULL, '9658742165', '','Anant'),
('HR Dept',NULL, NULL, '7896584256', '','Amit'),
('Admin Dept',NULL, NULL, '8457963215', '','Rohit'),
('Maintainence Dept',NULL, NULL, '8699547125', '','Rahul'),
('Production Dept',NULL, NULL, '9987458216', '','Pratham'),
('Finance Dept ',NULL, NULL, '9876586215', '','Kapil'),
('Operations Dept',NULL, NULL, '7856548236', '','Modi'),
('Purchase Dept',NULL, NULL, '9987458625', '','Pramod'),
('Project Dept',NULL, NULL, '7854956523', '','Ram');


-- T4_Claim
INSERT INTO T4_Claim VALUES
('110001', '100001', '400001', 50000, 'INCIDENT_ID', 'Vandalism', '2020-10-01', 'Approved'),
('110002', '100002', '400002', 20000, 'INCIDENT_ID', 'Animal collisions', '2020-09-10', 'Rejected'),
('110003', '100003', '400003', 350000, 'INCIDENT_ID', 'Accident', '2020-11-01', 'Pending'),
('110004', '100004', '400004', 70000, 'INCIDENT_ID', 'Windshield damage', '2020-06-30', 'Approved'),
('110005', '100005', '400005', 350000, 'INCIDENT_ID', 'Accident', '2020-12-25', 'Rejected'),
('110006', '100006', '400006', 60000, 'INCIDENT_ID', 'Animal collisions', '2021-10-10', 'Pending'),
('110007', '100007', '400007', 450000, 'INCIDENT_ID', 'Accident', '2019-05-15', 'Rejected'),
('110008', '100008', '400008', 50000, 'INCIDENT_ID', 'Windshield damage', '2020-03-03', 'Approved'),
('110009', '100009', '400009', 30000, 'INCIDENT_ID', 'Vandalism', '2020-07-18', 'Approved'),
('110010', '100010', '400010', 750000, 'INCIDENT_ID', 'Accident', '2021-09-11', 'Pending'),
('110011', '100011', '400011', 10000, 'INCIDENT_ID', 'Animal collisions', '2020-11-01', 'Approved'),
('110012', '100012', '400012', 250000, 'INCIDENT_ID', 'Accident', '2020-02-20', 'Pending'),
('110013', '100013', '400013', 22000, 'INCIDENT_ID', 'Vandalism', '2020-05-24', 'Rejected'),
('110014', '100014', '400014', 880000, 'INCIDENT_ID', 'Accident', '2020-07-14', 'Approved'),
('110015', '100015', '400015', 22000, 'INCIDENT_ID', 'Animal collisions', '2020-11-04', 'Rejected'),
('110016', '100001', '400016', 22000, 'INCIDENT_ID', 'Accident', '2020-01-22', 'Pending');

-- T4_Claim_Settlement
INSERT INTO T4_Claim_Settlement
('120001', '110001', '100001', '200001', '2020-10-20', 50000, 'COVERAGE_ID'),
('120002', '110002', '100002', '200002', '2020-10-10', 20000, 'COVERAGE_ID'),
('120003', '110003', '100003', '200003', '2020-12-01', 350000, 'COVERAGE_ID'),
('120004', '110004', '100004', '200004', '2020-08-30', 70000, 'COVERAGE_ID'),
('120005', '110005', '100005', '200005', '2021-02-25', 350000, 'COVERAGE_ID'),
('120006', '110006', '100006', '200006', '2021-12-10', 60000, 'COVERAGE_ID'),
('120007', '110007', '100007', '200007', '2019-05-25', 450000, 'COVERAGE_ID'),
('120008', '110008', '100008', '200008', '2020-03-20', 50000, 'COVERAGE_ID'),
('120009', '110009', '100009', '200009', '2020-09-22', 30000, 'COVERAGE_ID'),
('120010', '110010', '100010', '200010', '2021-10-21', 750000, 'COVERAGE_ID'),
('120011', '110011', '100011', '200011', '2020-12-28', 10000, 'COVERAGE_ID'),
('120012', '110012', '100012', '200012', '2020-04-20', 250000, 'COVERAGE_ID'),
('120013', '110013', '100013', '200013', '2020-06-24', 850000, 'COVERAGE_ID'), --!!!!
('120014', '110014', '100014', '200014', '2020-09-14', 22000, 'COVERAGE_ID'),
('120015', '110015', '100015', '200015', '2020-11-24', 20000, 'COVERAGE_ID'); --!!!!


INSERT INTO T4_Vehicle_Service
()


-- Product ID Not Added
-- Coverage Level Not Added
INSERT INTO T4_Quote VALUES
('160001', '300001', '100001', '2020-01-02', '2020-01-02', '2025-01-02', 'MG Hector', 'PRODUCT-ID', 'COVERAGE-LEVEL'),
('160002', '300002', '100002', '2016-03-04', '2016-03-04', '2021-03-04', 'Hyundai Tucson', 'PRODUCT-ID', 'COVERAGE-LEVEL'),
('160003', '300003', '100003', '2017-04-08', '2017-04-08', '2022-04-08', 'Toyota Camry', 'PRODUCT-ID', 'COVERAGE-LEVEL'),
('160004', '300004', '100004', '2018-05-16', '2018-05-16', '2023-05-16', 'Mercedes Benz', 'PRODUCT-ID', 'COVERAGE-LEVEL'),
('160005', '300005', '100005', '2019-06-03', '2019-06-03', '2024-06-03', 'Volkswagon Vento', 'PRODUCT-ID', 'COVERAGE-LEVEL'),
('160006', '300006', '100006', '2021-07-09', '2021-07-09', '2026-07-09', 'Toyota Camry', 'PRODUCT-ID', 'COVERAGE-LEVEL'),
('160007', '300007', '100007', '2015-08-27', '2015-08-27', '2020-08-27', 'Ford Fiesta', 'PRODUCT-ID', 'COVERAGE-LEVEL'),
('160008', '300008', '100008', '2014-09-05', '2014-09-05', '2019-09-05', 'Mclaren GT', 'PRODUCT-ID', 'COVERAGE-LEVEL'),
('160009', '300009', '100008', '2013-10-10', '2013-10-10', '2018-10-10', 'Maruti Suzuki', 'PRODUCT-ID', 'COVERAGE-LEVEL'),
('160010', '300010', '100009', '2012-11-15', '2012-11-15', '2017-11-15', 'Ford Endevour', 'PRODUCT-ID', 'COVERAGE-LEVEL'),
('160011', '300011', '100009', '2011-12-11', '2011-12-11', '2016-12-11', 'Lamborghini Aventador', 'PRODUCT-ID', 'COVERAGE-LEVEL'),
('160012', '300012', '100009', '2010-01-21', '2010-01-21', '2015-01-21', 'Porsche Carrera', 'PRODUCT-ID', 'COVERAGE-LEVEL');

