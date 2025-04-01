/*****PLEASE ENTER YOUR DETAILS BELOW*****/
-- ITO4132
-- T2-ma-insert.sql

-- Student ID: 34273654
-- Student Name: Nazmul Hasan

/* Comments for your marker:

-- Monash Automotive (MA) Data Insert Script
Author: Nazmul Hasan
License: Copyright Nazmul Hasan, unless otherwise stated. All Rights Reserved.
COPYRIGHT WARNING
Warning
This material is protected by copyright. NOT FOR RESALE.
Do not remove this notice. 

*/

-- Please ensure EACH insert statement you add is formatted
-- and includes a semicolon

-- INSERTING into SERVICE

INSERT INTO service VALUES (101, '08:30', '16:00', 350.00, 256.74, 'Standard 80,000 km service', 'CASH', 'ABC123', 1000, 80000, TO_DATE('08/02/2023', 'DD/MM/YYYY'), '15:30');
INSERT INTO service VALUES (102, '09:15', '17:00', 420.00, 315.20, 'Brake system check', 'CARD', 'DEF456', 1001, 75000, TO_DATE('15/02/2023', 'DD/MM/YYYY'), '16:45');
INSERT INTO service VALUES (103, '10:00', '15:00', 275.00, 189.50, 'Oil change and filter replacement', 'EFT', 'GHI789', 1002, 60000, TO_DATE('22/02/2023', 'DD/MM/YYYY'), '14:30');
INSERT INTO service VALUES (104, '13:30', '17:30', 380.00, 420.75, 'Transmission service', 'CASH', 'JKL012', 1003, 90000, TO_DATE('01/03/2023', 'DD/MM/YYYY'), '18:15');
INSERT INTO service VALUES (105, '08:45', '16:30', 320.00, 275.30, 'Coolant system flush', 'CARD', 'MNO345', 1004, 85000, TO_DATE('08/03/2023', 'DD/MM/YYYY'), '16:00');
INSERT INTO service VALUES (106, '11:00', '18:00', 450.00, 520.40, 'Engine tune-up', 'EFT', 'ABC123', 1000, 82000, TO_DATE('15/03/2023', 'DD/MM/YYYY'), '17:30');
INSERT INTO service VALUES (107, '14:00', '17:00', 290.00, 195.25, 'Wheel alignment', 'CASH', 'PQR678', 1005, 70000, TO_DATE('22/03/2023', 'DD/MM/YYYY'), '16:45');
INSERT INTO service VALUES (108, '09:30', '14:00', 360.00, 310.80, 'Suspension check', 'CARD', 'STU901', 1006, 78000, TO_DATE('29/03/2023', 'DD/MM/YYYY'), '14:30');
INSERT INTO service VALUES (109, '10:45', '16:00', 400.00, 350.60, 'Electrical system diagnostic', 'EFT', 'DEF456', 1001, 77000, TO_DATE('05/04/2023', 'DD/MM/YYYY'), '16:45');
INSERT INTO service VALUES (110, '08:00', '12:00', 280.00, 230.90, 'Air conditioning service', 'CASH', 'VWX234', 1007, 65000, TO_DATE('12/04/2023', 'DD/MM/YYYY'), '11:30');


-- INSERTING into SERVICE_JOB

INSERT INTO service_job VALUES (101, 1, 'Standard service', 2.5);
INSERT INTO service_job VALUES (102, 1, 'Brake inspection', 1.5);
INSERT INTO service_job VALUES (102, 2, 'Brake pad replacement', 2.0);
INSERT INTO service_job VALUES (103, 1, 'Oil change', 1.0);
INSERT INTO service_job VALUES (104, 1, 'Transmission fluid change', 1.5);
INSERT INTO service_job VALUES (104, 2, 'Transmission filter replacement', 1.0);
INSERT INTO service_job VALUES (104, 3, 'Transmission diagnostic', 1.5);
INSERT INTO service_job VALUES (105, 1, 'Coolant system service', 2.0);
INSERT INTO service_job VALUES (106, 1, 'Spark plug replacement', 1.5);
INSERT INTO service_job VALUES (106, 2, 'Engine diagnostic', 2.5);
INSERT INTO service_job VALUES (107, 1, 'Wheel alignment', 1.0);
INSERT INTO service_job VALUES (108, 1, 'Suspension inspection', 2.0);
INSERT INTO service_job VALUES (109, 1, 'Battery check', 0.5);
INSERT INTO service_job VALUES (109, 2, 'Alternator test', 1.5);
INSERT INTO service_job VALUES (110, 1, 'AC refrigerant recharge', 1.5);


--  INSERTING into PART_CHARGE

INSERT INTO part_charge VALUES (1, 101, 1, 'FOA1MC', 1, 15.58);
INSERT INTO part_charge VALUES (2, 101, 1, 'FOAX200', 2, 51.78);
INSERT INTO part_charge VALUES (3, 102, 2, 'FRB184', 1, 89.95);
INSERT INTO part_charge VALUES (4, 103, 1, 'OIL5LT', 1, 45.00);
INSERT INTO part_charge VALUES (5, 104, 1, 'TRF5LT', 1, 65.00);
INSERT INTO part_charge VALUES (6, 104, 2, 'TRFLTR', 1, 32.50);
INSERT INTO part_charge VALUES (7, 105, 1, 'COOL5L', 1, 38.00);
INSERT INTO part_charge VALUES (8, 106, 1, 'SPKPLG', 4, 120.00);
INSERT INTO part_charge VALUES (9, 109, 2, 'ALTTST', 1, 85.00);
INSERT INTO part_charge VALUES (10, 110, 1, 'AC134A', 1, 95.00);



