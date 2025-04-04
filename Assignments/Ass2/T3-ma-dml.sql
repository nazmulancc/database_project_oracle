/*****PLEASE ENTER YOUR DETAILS BELOW*****/
-- ITO4132
--T3-ma-dml.sql

-- Student ID: 34273654
-- Student Name: Nazmul Hasan

/* Comments for your marker:

-- Monash Automotive (MA) Data Insert Script
student id:34273654
student name: Nazmul Hasan 
last modified date: 03.04.2025

*/


-- Please ensure EACH SQL statement you add is formatted
-- and includes a semicolon

/* (a) */

DROP SEQUENCE service_seq;
DROP SEQUENCE part_charge_seq;

CREATE SEQUENCE service_seq START WITH 1000 INCREMENT BY 10;
CREATE SEQUENCE part_charge_seq START WITH 1000 INCREMENT BY 10;

COMMIT;

/* (b) */


UPDATE vehicle
SET 
    veh_rego = 'GDD132'
WHERE cust_no = (
    SELECT 
        cust_no
    FROM 
        customer
    WHERE 
        upper(cust_phone) = upper('6715573197')
);

COMMIT;


SELECT veh_rego
FROM vehicle
WHERE cust_no = (
    SELECT cust_no 
    FROM customer 
    WHERE cust_phone = '6715573197'
);

SELECT * from VEHICLE;

/* (c) */


INSERT INTO service (
    serv_no, 
    serv_date,
    serv_drop_off, 
    serv_req_pickup, 
    serv_kms, 
    serv_instructions, 
    pay_mode_code, 
    veh_vin, 
    cust_no
) VALUES (
    service_seq.NEXTVAL,
    TO_DATE('21-MAR-2024', 'DD-MON-YYYY'),
    TO_DATE('21-MAR-2024 08:30', 'DD-MON-YYYY HH24:MI'),
    TO_DATE('21-MAR-2024 12:00', 'DD-MON-YYYY HH24:MI'),
    12000,
    'Rear seat belts are not properly retracting',
    'S',
    (SELECT veh_vin 
     FROM vehicle 
     WHERE cust_no = 1030 
     AND UPPER(veh_make) = 'MAZDA' 
     AND UPPER(veh_model) = 'CX-5'),
    1030
);

-- Add the service job for this service
INSERT INTO service_job (
    serv_no,
    sj_job_no,
    sj_task_description
) VALUES (
    service_seq.CURRVAL,
    1,
    'Rear seat belts are not properly retracting'
);

COMMIT;


SELECT * from service;



/* (d) */




SELECT
    *
FROM
    service;
/* (e) */




