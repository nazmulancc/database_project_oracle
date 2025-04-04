/*****PLEASE ENTER YOUR DETAILS BELOW*****/
-- ITO4132
--T3-ma-dml.sql

-- Student ID: 34273654
-- Student Name: Nazmul Hasan

/* Comments for your marker:

-- Monash Automotive (MA) Data Manipulation Script
student id:34273654
student name: Nazmul Hasan 
last modified date: 04.04.2025

*/


-- Please ensure EACH SQL statement you add is formatted
-- and includes a semicolon

/* (a) */

DROP SEQUENCE service_seq;
DROP SEQUENCE part_charge_seq;

CREATE SEQUENCE service_seq START WITH 1000 INCREMENT BY 10;
CREATE SEQUENCE part_charge_seq START WITH 1000 INCREMENT BY 10;


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
    TO_DATE('21/03/2024', 'DD/MM/YYYY '),
    TO_DATE('21/03/2024 08:30', 'DD/MM/YYYY HH24:MI'),
    TO_DATE('21/03/2024 12:00', 'DD/MM/YYYY HH24:MI'),
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

/* (d) */

/* Update service job details */
UPDATE service_job
SET sj_task_description = 'Removed material causing jam in belt mechanism'
WHERE serv_no = (
    SELECT MAX(s.serv_no)
    FROM service s
    JOIN vehicle v ON s.veh_vin = v.veh_vin
    WHERE v.cust_no = 1030
    AND UPPER(v.veh_make) = 'MAZDA'
    AND UPPER(v.veh_model) = 'CX-5'
    AND s.serv_date = TO_DATE('21/03/2024', 'DD/MM/YYYY ')
)
AND sj_job_no = 1;

/* Update service details */
UPDATE service
SET serv_ready_pickup = TO_DATE('21/03/2024 09:10', 'DD/MM/YYYY HH24:MI'),
    serv_labour_cost = 0,
    serv_parts_cost = 0
WHERE serv_no = (
    SELECT MAX(s.serv_no)
    FROM service s
    JOIN vehicle v ON s.veh_vin = v.veh_vin
    WHERE v.cust_no = 1030
    AND UPPER(v.veh_make) = 'MAZDA'
    AND UPPER(v.veh_model) = 'CX-5'
    AND s.serv_date = TO_DATE('21-Mar-2024', 'dd-Mon-yyyy')
);

COMMIT;

-- viewing the times of drop off and pick up

SELECT 
    serv_no,
    TO_CHAR(serv_drop_off, 'DD-Mon-YYYY HH24:MI') AS drop_off_time,
    TO_CHAR(serv_req_pickup, 'DD-Mon-YYYY HH24:MI') AS requested_pickup_time,
    TO_CHAR(serv_ready_pickup, 'DD-Mon-YYYY HH24:MI') AS actual_ready_time
FROM service
WHERE veh_vin = (
    SELECT veh_vin 
    FROM vehicle 
    WHERE cust_no = 1030 
    AND UPPER(veh_make) = 'MAZDA' 
    AND UPPER(veh_model) = 'CX-5'
);

/* (e) */

DELETE FROM part
WHERE vendor_id = (
    SELECT vendor_id 
    FROM vendor 
    WHERE vendor_name = 'Australian Automotive Parts'
)
AND part_code NOT IN (
    SELECT part_code 
    FROM part_charge
);

COMMIT;




