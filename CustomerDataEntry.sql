USE T4_Car_Insurance_DB;

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


-- LOOK AT THE QUERY STATEMENTS BEFORE DECIDING THE VALUES A,B,C
-- ENSURE THAT USER WITH ID 100008 and 9 have NOT paid their premium policy
-- VEHICLE NUMBER TO BE INSERTED AFTER STUDYING QUERY 5
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

INSERT INTO T4_Application VALUES
('300001', '100001', '200001', 'Pending', 'Third-Party Liability Only Cover'),
('300002', '100002', '200002', 'Pending', 'Collision Damage or Own Damage (OD) Cover'),
('300003', '100003', '200003', 'Pending', 'Personal Accident Cover:'),
('300004', '100004', '200004', 'Resolved', 'Personal Accident Cover:'),
('300005', '100005', '200005', 'Pending', 'Comprehensive Car Insurance'),
('300006', '100006', '200006', 'Resolved', 'Zero Depreciation Insurance:'),
('300007', '100007', '200007', 'Resolved', 'Comprehensive Car Insurance'),
('300008', '100008', '200008', 'Pending', 'Comprehensive Car Insurance'),
('300009', '100008', '200009', 'Resolved', 'Zero Depreciation Insurance:'),
('300010', '100009', '200010', 'Resolved', 'Third-Party Liability Only Cover'),
('300011', '100009', '200011', 'Pending', 'Collision Damage or Own Damage (OD) Cover'),
('300012', '100009', '200012', 'Resolved', 'Comprehensive Car Insurance'),
('300013', '100010', '200013', 'Resolved', 'Zero Depreciation Insurance:'),
('300014', '100011', '200014', 'Resolved', 'Third-Party Liability Only Cover'),
('300015', '100012', '200015', 'Pending', 'Personal Accident Cover:'),
('300016', '100013', '200016', 'Resolved', 'Collision Damage or Own Damage (OD) Cover');


-- Department Name = Departmentid
-- Policy Number Values from 101 onwards
-- Description to be added
INSERT INTO T4_Insurance_policy VALUES
('400001', '300001', '100001', NULL, '101', '2010-01-01', '2011-01-01', NULL),
('400002', '300002', '100002', NULL, '102', '2009-02-01', '2010-02-01', NULL),
('400003', '300003', '100003', NULL, '103', '2015-03-01', '2016-03-01', NULL),
('400004', '300004', '100004', NULL, '104', '2013-04-01', '2014-04-01', NULL),
('400005', '300005', '100005', NULL, '105', '2018-05-01', '2019-05-01', NULL),
('400006', '300006', '100006', NULL, '106', '2019-06-01', '2020-06-01', NULL),
('400007', '300007', '100007', NULL, '107', '2011-07-01', '2012-07-01', NULL),
('400008', '300008', '100008', NULL, '108', '2018-08-01', '2019-08-01', NULL),
('400009', '300009', '100008', NULL, '109', '2017-09-01', '2018-09-01', NULL),
('400010', '300010', '100009', NULL, '110', '2016-10-01', '2017-10-01', NULL),
('400011', '300011', '100009', NULL, '111', '2014-11-01', '2015-11-01', NULL),
('400012', '300012', '100009', NULL, '112', '2012-12-01', '2013-12-01', NULL),
('400013', '300013', '100010', NULL, '113', '2020-01-01', '2021-01-01', NULL),
('400014', '300014', '100011', NULL, '114', '2019-02-01', '2020-02-01', NULL),
('400015', '300015', '100012', NULL, '115', '2008-03-01', '2009-03-01', NULL),
('400001', '300016', '100013', NULL, '116', '2016-04-01', '2017-04-01', NULL);
