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





/* (d) */




/* (e) */




