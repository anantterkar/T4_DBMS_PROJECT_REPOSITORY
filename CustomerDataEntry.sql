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


-- T4_Incident
INSERT INTO T4_Incident
('130001', 'Fire', '2020-01-02', 'Sparks from tear in the electric wiring systems are not covered in insurance'),
('130002', 'Theft', '2020-01-02', 'Insurers will pay an amount equal to declared value of insured bike in case of theft.'),
('130003', 'Collision Coverage', '2020-01-02', '100% of the sum insured is offered on the accidental death of the insured person.'),
('130004', 'Lightning', '2020-01-02', 'Under The policy of Standard Fire and Special Perils Policy Coverage you can claim the Damage coverages'),
('130005', 'Faulty ignition', '2020-01-02', 'Third-party car insurance cover will pay for any fiscal liability'),
('130006', 'External explosion', '2020-01-02', 'Most home and contents insurance covers you for damage caused by fire, including bushfire'),
('130007', 'Burglary', '2020-01-02', 'Insurers will pay an amount equal to declared value of insured bike in case of theft.'),
('130008', 'Wildfire', '2020-01-02', 'Insurance contract safeguards the insured against unforeseen contingency caused by accidental fire, lightning, explosion/implosion, destruction or damage caused by aerial devices, man made perils'),
('130009', 'Mechanical breakdown', '2020-01-02', 'Equipment breakdown coverage.'),
('130010', 'Drunk Driving victim', '2020-01-02', 'Driving under the influence of alcohol or drugs is illegal obviously'),
('130011', 'Natural disaster', '2020-01-02', 'A comprehensive car insurance policy provides coverage against damages or losses caused due to almost all natural disasters'),
('130012', 'Auto liability coverage', '2020-01-02', 'Liability insurance is a part of the general insurance system of risk financing'),
('130013', 'Floods Damage', '2020-01-02', 'Add on cover called Engine Protection to cover the losses to engine due to flood water.'),
('130014', 'Comprehensive Insurance', '2020-01-02', 'provides the minimal required coverage of losses related to a third-party.'),
('130015', 'Aggravated damage', '2020-01-02', 'Aggravated damages are the special and highly exceptional damages awarded on a defendant by a court');


-- T4_Receipt
INSERT INTO T4_Receipt
('140001', 'PREMIUM_PAYMENT_ID', '100001', 450, '2020-02-20'),
('140002', 'PREMIUM_PAYMENT_ID', '100002', 250, '2020-02-21'),
('140003', 'PREMIUM_PAYMENT_ID', '100003', 350, '2020-02-22'),
('140004', 'PREMIUM_PAYMENT_ID', '100004', 550, '2020-02-23'),
('140005', 'PREMIUM_PAYMENT_ID', '100005', 650, '2020-02-24'),
('140006', 'PREMIUM_PAYMENT_ID', '100006', 750, '2020-02-25'),
('140007', 'PREMIUM_PAYMENT_ID', '100007', 150, '2020-02-26'),
('140008', 'PREMIUM_PAYMENT_ID', '100008', 250, '2020-02-27'),
('140009', 'PREMIUM_PAYMENT_ID', '100009', 220, '2020-01-11'),
('140010', 'PREMIUM_PAYMENT_ID', '100010', 330, '2020-01-12'),
('140011', 'PREMIUM_PAYMENT_ID', '100011', 500, '2020-01-14'),
('140012', 'PREMIUM_PAYMENT_ID', '100012', 780, '2020-01-13'),
('140013', 'PREMIUM_PAYMENT_ID', '100013', 230, '2020-01-15'),
('140014', 'PREMIUM_PAYMENT_ID', '100014', 320, '2020-01-16'),
('140015', 'PREMIUM_PAYMENT_ID', '100015', 480, '2020-01-17');

-- T4_NOK
INSERT INTO T4_NOK
('150001', '400001', '100001', 'Abhigyan','Hyderabad','9541284125', 'Single', 'Male'),
('150002', '400002', '100002', 'Nishita','Bangalore','9871284354', 'Married', 'Female'),
('150003', '400003', '100003', 'Udita','Pune','8274141254', 'Single', 'Female'),
('150004', '400004', '100004', 'Krishna','Mumbai','8423652322', 'Married', 'Male'),
('150005', '400005', '100005', 'Abhishek','Kolkata','7541265455', 'Single', 'Male'),
('150006', '400006', '100006', 'Harshit','Pune','8741236525', 'Married', 'Male'),
('150007', '400007', '100007', 'Aisha','Vadodara','8296321466', 'Single', 'Female'),
('150008', '400008', '100008', 'Divya','Bangalore','9563214552', 'Married', 'Female'),
('150009', '400009', '100009', 'Kritika','New Delhi','7851254125', 'Single', 'Female'),
('150010', '400010', '100010', 'Shubham','Hyderabad','7963214502', 'Married', 'Male'),
('150011', '400011', '100011', 'Maurya','Mumbai','8604154632', 'Single', 'Male'),
('150012', '400012', '100012', 'Michael','Bangalore','6387908561', 'Married', 'Male'),
('150013', '400013', '100013', 'Jagrut','Pune','7507081126', 'Single', 'Male'),
('150014', '400014', '100014', 'Rhea','Chennai','8007796961', 'Married', 'Female'),
('150015', '400015', '100015', 'Shivangi','Chennai','9845106575', 'Single', 'Female');

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

INSERT INTO T4_Insurance_company VALUES
('Aegon Vehicle Insurance Company Limited','206 & 207, 2nd Floor, Aditya Trade Center, 7-1-618, Ameerpet, Hyderabad, Telangana 500038',8854364,78542563,'AegonVehicle@help.com','AegonVehicle.com','Hyderabad','AegonVehicleoffice','AegonVehicleoffice'),
('Aviva Vehicle Insurance Company Limited', 'Towers, Sector Road, Opposite Golf Course, DLF Phase V, Sector 43, Gurgaon – 122003.',85840500,56801620,'aiaamaxVehicle@help.com','aviamaxVehicle.com','Gurgaon','aviamaxVehicleoffice','aviamaxVehicleoffice'),
('Bajaj Allianz Vehicle Insurance Company Limited', 'Hno 6-130, 1st Floor Above ING Vysya Bank Market Road Adilabad Mancherial Andhra Pradesh Telangana',97695832,50356789,'customercare@bajajallianz.co.in','https://www.bajajallianzVehicle.com','Pune',' Bajaj Allianz Vehicle Insurance Co',' Bajaj Allianz Vehicle Insurance Co'),
('Bharti AXA Vehicle Insurance Company Limited','130, Unit No. 1904, 19th Floor, Parinee Crescenzo, G Block, Bandra',99555754,99658932,'BhartiVehicle@help.com', 'BhartiVehicle.com', 'Mumbai', 'BhartiVehicleoffice', 'BhartiVehicleoffice'),
('Birla Sun Vehicle Insurance Company Limited', 'One World Center, Tower 1, 16th Floor, Jupiter Mill Compound, 841, Senapati Bapat Marg, Elphinstone Road, Mumbai',97699157,50336700,'care.Vehicleinsurance@adityabirlacapital.com', 'https://Vehicleinsurance.adityabirlacapital.com', 'Mumbai ', 'Birla Sun Vehicle Insurance ', 'Birla Sun Vehicle Insurance '),
('Canara HSBC Oriental Bank of Commerce LIC Limited','206 & 207, 2nd Floor, Aditya Trade Center, 7-1-618, Ameerpet, Hyderabad, Telangana 500038',85462548,87452563,'CanaraVehicle@help.com','CanaraVehicle.com','Hyderabad','CanaraVehicleoffice','CanaraVehicleoffice'),
('DLF Pramerica Vehicle Insurance Company Limited', 'Office No.501- 520, on 5th floor, Bezzola Complex C.H.S. Ltd., S. No. 237, C.S. No. 353, 352/2, 353/3, 353/4, Sion Trombay Road,',98542527,85452315,'DLFVehicle@help.com','DLFVehicle.com','Sion','DLFVehicleoffice','DLFVehicleoffice'),
('Exide Vehicle Insurance Company Limited','Registered Office: 3rd Floor, JP Techno Park, No. 3/1, Millers Road, Bangalore- 560 001, India.',97695414,50336715,'ExideVehicleInsurance@gmail.com','https://www.exideVehicle.in/','Mumbai','exidVehicleoffice','exideVehicle'),
('Future Generali India Vehicle Insurance Company Limited','1st Floor, 7-1-21A, Raj Bhavan Rd, opp. Vehiclestyle Building, beside Vinn Hospital APDL Estates, Begumpet, Hyderabad, Telangana 500016',88740012,88749582,'FutureVehicle@help.com','FutureVehicle.com','Hyderabad','FutureVehicleoffice','FutureVehicleoffice'),
('HDFC Vehicle Insurance Company Limited','Lodha Excelus, 13th Floor, Apollo Mills Compound, N.M. Joshi Marg, Mahalaxmi, Mumbai',97699177,NULL,'buyonline@hdfcVehicle.in','https://www.hdfcVehicle.com/','Mumbai','hdfcVehicle','hdfcVehicle'),
('ICICI Prudential Vehicle Insurance Company Limited','1089 Appasaheb Marathe Marg, Prabhadevi, Mumbai ',97699766,50356751,'icicipruVehicle@gmail.com','https://www.icicipruVehicle.com/','Mumbai',' ICICI PruVehicle',' ICICI PruVehicle'),
('IDBI Federal Vehicle Insurance Company Limited','3-5-922 Sri Sai Balaji Residency, Near Narayanaguda Flyover, Hyderabad, Telangana 500029',56858562,89870120,'IDBIFederalVehicle@help.com','IDBIFederalVehicle.com','Hyderabad','IDBI FederalVehicleoffice','IDBIFederalVehicleoffice'),
('Kotak Vehicle Insurance Company Limited','Kotak Mahindra Vehicle Insurance Company Limited, Regd. Office: 2nd Floor, Plot # C- 12, G- Block, BKC, Bandra (E), Mumbai - 400 051',46598165,46598642,'KotakVehicleInsurance@help.com','KotakVehicleInsurance.com','Mumbai','kotakVehicleoffice','kotakVehicleoffice'),
('Max Vehicle Insurance Company Limited','Max Vehicle Insurance Co. Ltd., 3rd, 11th and 12th Floor, DLF Square Building, Jacaranda Marg, DLF City Phase II, Gurugram (Haryana) - 122002',97695577,50256720,'maxVehicle@help.com','maxVehicle.com','Gurugram','maxVehicleoffice','maxVehicleoffice');

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
('Body Paint', '200010', '100009', 'Purchase Dept', 'Gujurat', '72306283956', 'Rahul', 'JJ'),
('Engine Change', '200011', '100009', 'Project Dept', 'Rajasthan', '7829357283', 'Tommy', 'KK'),
('Engine Change', '200012', '100009', 'Admin Dept', 'Jaipur', '7788912351', 'Sakura', 'LL'),
('Rotate tires', '200013', '100010', 'Maintainence Dept', 'Raipur', '9023231235', 'Rohan', 'MM'),
('Battery Check', '200014', '100011', 'R&D Dept', 'Dhaka', '9023189122', 'Rooma', 'NN'),
('AC Work', '200015', '100012', 'Finance Dept', 'Shimla', '7781923512', 'Connor', 'OO');
