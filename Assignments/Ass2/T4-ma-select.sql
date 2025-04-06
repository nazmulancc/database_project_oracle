/*****PLEASE ENTER YOUR DETAILS BELOW*****/
-- ITO4132
--T4-ma-select.sql

-- Student ID: 34273654
--Student Name: Nazmul Hasan
--last modified date: 04.04.2025


/* Comments for your marker:
 

*/

/* (a) */
-- PLEASE PLACE REQUIRED SQL SELECT STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer

SELECT s.serv_no AS "Service Number",
       s.veh_vin AS "Vehicle VIN",
       v.veh_rego AS "Registration",
       v.veh_make AS "Make",
       sj.sj_job_no AS "Job Number",
       sj.sj_task_description AS "Job Description"
  FROM service s
  JOIN vehicle v
ON s.veh_vin = v.veh_vin
  JOIN service_job sj
ON s.serv_no = sj.serv_no
 WHERE s.serv_ready_pickup IS NOT NULL
 ORDER BY s.serv_no DESC,
          sj.sj_job_no;


/* (b) */
-- PLEASE PLACE REQUIRED SQL SELECT STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer




/* (c) */
-- PLEASE PLACE REQUIRED SQL SELECT STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer




/* (d) */
-- PLEASE PLACE REQUIRED SQL SELECT STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer




/* (e) */
-- PLEASE PLACE REQUIRED SQL SELECT STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer




/* (f) */
-- PLEASE PLACE REQUIRED SQL SELECT STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer