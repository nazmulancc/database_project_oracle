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

INSERT INTO service VALUES (101, TO_DATE('08/02/2023', 'DD/MM/YYYY'), TO_DATE('08:30', 'HH24:MI'), TO_DATE('16:00', 'HH24:MI'), NULL, 80000, 350.00, 256.74, 'Standard 80,000 km service', 'S','WBAWR33598P984354', 1000); 
INSERT INTO service VALUES (104, TO_DATE('01/03/2023', 'DD/MM/YYYY'), TO_DATE('13:30', 'HH24:MI'), TO_DATE('17:30', 'HH24:MI'), TO_DATE('18:15', 'HH24:MI'), 90000, 380.00, 420.75, 'Transmission service', 'S', 'JN1CV6EK6FM569421', 1030);
INSERT INTO service VALUES (105, TO_DATE('08/03/2023', 'DD/MM/YYYY'), TO_DATE('08:45', 'HH24:MI'), TO_DATE('16:30', 'HH24:MI'), TO_DATE('16:00', 'HH24:MI'), 85000, 320.00, 275.30, 'Coolant system flush', 'C', '5XXGM4A74DG668202', 1040);
INSERT INTO service VALUES (106, TO_DATE('15/03/2023', 'DD/MM/YYYY'), TO_DATE('11:00', 'HH24:MI'), TO_DATE('18:00', 'HH24:MI'), TO_DATE('17:30', 'HH24:MI'), 82000, 450.00, 520.40, 'Engine tune-up', 'E', 'WBAWR33598P984354', 1000);
INSERT INTO service VALUES (107, TO_DATE('22/03/2023', 'DD/MM/YYYY'), TO_DATE('14:00', 'HH24:MI'), TO_DATE('17:00', 'HH24:MI'), TO_DATE('16:45', 'HH24:MI'), 70000, 290.00, 195.25, 'Wheel alignment', 'S', '4T1BK3DB4CU320186', 1050);
INSERT INTO service VALUES (108, TO_DATE('29/03/2023', 'DD/MM/YYYY'), TO_DATE('09:30', 'HH24:MI'), TO_DATE('14:00', 'HH24:MI'), TO_DATE('14:30', 'HH24:MI'), 78000, 360.00, 310.80, 'Suspension check', 'C', '19UYA42792A297253', 1060);
INSERT INTO service VALUES (109, TO_DATE('05/04/2023', 'DD/MM/YYYY'), TO_DATE('10:45', 'HH24:MI'), TO_DATE('16:00', 'HH24:MI'), TO_DATE('16:45', 'HH24:MI'), 77000, 400.00, 350.60, 'Electrical system diagnostic', 'E', 'WAUVFAFH4AN857561', 1010);
INSERT INTO service VALUES (110, TO_DATE('12/04/2023', 'DD/MM/YYYY'), TO_DATE('08:00', 'HH24:MI'), TO_DATE('12:00', 'HH24:MI'), TO_DATE('11:30', 'HH24:MI'), 65000, 280.00, 230.90, 'Air conditioning service', 'S', '19XFB2E59DE245929', 1070);
INSERT INTO service VALUES (102, TO_DATE('15/02/2023', 'DD/MM/YYYY'), TO_DATE('09:15', 'HH24:MI'), TO_DATE('17:00', 'HH24:MI'), NULL, 75000, 420.00, 315.20, 'Brake system check','C','WAUVFAFH4AN857561', 1010);
INSERT INTO service VALUES (103, TO_DATE('22/02/2023', 'DD/MM/YYYY'), TO_DATE('10:00', 'HH24:MI'), TO_DATE('15:00', 'HH24:MI'), NULL, 60000, 275.00, 189.50, 'Oil change and filter replacement', 'E', 'WAUGFAFC8FN843179', 1020);


-- INSERTING into SERVICE_JOB

-- Service 101 (1 job)
INSERT INTO service_job VALUES (101, 1, 'Standard service');
-- Service 102 (2 jobs)
INSERT INTO service_job VALUES (102, 1, 'Brake inspection');
INSERT INTO service_job VALUES (102, 2, 'Brake pad replacement');
-- Service 103 (1 job)
INSERT INTO service_job VALUES (103, 1, 'Oil change');
-- Service 104 (3 jobs)
INSERT INTO service_job VALUES (104, 1, 'Transmission fluid change');
INSERT INTO service_job VALUES (104, 2, 'Transmission filter replacement');
INSERT INTO service_job VALUES (104, 3, 'Transmission diagnostic');
-- Service 105 (1 job)
INSERT INTO service_job VALUES (105, 1, 'Coolant system service');
-- Service 106 (2 jobs)
INSERT INTO service_job VALUES (106, 1, 'Spark plug replacement');
INSERT INTO service_job VALUES (106, 2, 'Engine diagnostic');
-- Service 107 (1 job)
INSERT INTO service_job VALUES (107, 1, 'Wheel alignment');
  
-- Service 108 (1 job)
INSERT INTO service_job VALUES (108, 1, 'Suspension inspection');
  
-- Service 109 (2 jobs)
INSERT INTO service_job VALUES (109, 1, 'Battery check');
INSERT INTO service_job VALUES (109, 2, 'Alternator test');
  
-- Service 110 (1 job)
INSERT INTO service_job VALUES (110, 1, 'AC refrigerant recharge');


  COMMIT;


--  INSERTING into PART_CHARGE


SELECT
    *
FROM
    service_job;



