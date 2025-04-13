/*****PLEASE ENTER YOUR DETAILS BELOW*****/
-- ITO4132
--T4-ma-select.sql

-- Student ID: 34273654
--Student Name: Nazmul Hasan
--last modified date: 06.04.2025


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

SELECT p.part_code AS "PART_CODE",
       initcap(lower(p.part_description)) AS "PART_DESCRIPTION",
       v.vendor_id
       || ' - '
       || initcap(v.vendor_name) AS "VENDOR",
       p.part_stock AS "PART_STOCK",
       to_char(
           p.part_unit_cost * p.part_stock,
           'FM$999,999.00'
       ) AS "STOCK_VALUE"
  FROM part p
  JOIN vendor v
ON p.vendor_id = v.vendor_id
 ORDER BY p.part_code;


/* (c) */
-- PLEASE PLACE REQUIRED SQL SELECT STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer

SELECT p.part_code AS "PART_CODE",
       p.part_description AS "PART_DESCRIPTION",
       v.vendor_name AS "VENDOR_NAME",
       CASE
           WHEN COUNT(pc.part_charge_no) > 0 THEN
               'Used in at least one service'
           ELSE
               'Not used in any service'
       END AS "PARTUSAGE"
  FROM part p
  JOIN vendor v
ON p.vendor_id = v.vendor_id
  LEFT JOIN part_charge pc
ON p.part_code = pc.part_code
 GROUP BY p.part_code,
          p.part_description,
          v.vendor_name
 ORDER BY p.part_code;

/* (d) */
-- PLEASE PLACE REQUIRED SQL SELECT STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer

SELECT p.part_code AS "PART_CODE",
       p.part_description AS "PART_DESCRIPTION",
       nvl(
           sum(pc.pc_quantity),
           0
       ) AS "QUANTITY_USED",
       nvl(
           sum(pc.pc_linecost),
           0
       ) AS "TOTAL_CHARGES"
  FROM part p
  LEFT JOIN part_charge pc
ON p.part_code = pc.part_code
 GROUP BY p.part_code,
          p.part_description
 ORDER BY SUM(pc.pc_quantity) DESC NULLS LAST;


/* (e) */
-- PLEASE PLACE REQUIRED SQL SELECT STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer

SELECT s.cust_no AS "CUST_NO",
       c.cust_name AS "CUSTOMER NAME",
       s.serv_no AS "SERV_NO",
       to_char(
           s.serv_req_pickup,
           'HH:MI am'
       ) AS "REQUIRED PICKUP TIME",
       to_char(
           s.serv_ready_pickup,
           'HH:MI am'
       ) AS "READY FOR PICKUP TIME",
       floor((s.serv_ready_pickup - s.serv_req_pickup) * 24)
       || ' hr '
       || MOD(
           floor((s.serv_ready_pickup - s.serv_req_pickup) * 1440),
           60
       )
       || ' mins' AS "LATE DELIVERY"
  FROM service s
  JOIN customer c
ON s.cust_no = c.cust_no
 WHERE s.serv_ready_pickup > s.serv_req_pickup
 ORDER BY ( s.serv_ready_pickup - s.serv_req_pickup ) DESC;


/* (f) */
-- PLEASE PLACE REQUIRED SQL SELECT STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer

SELECT c.cust_no AS "CUST_NO",
       c.cust_name AS "CUST_NAME",
       '$'
       || to_char(
           sum(s.serv_parts_cost),
           '9990.99'
       ) AS "TOTAL_PART_PAYMENT"
  FROM customer c
  JOIN service s
ON c.cust_no = s.cust_no
 WHERE s.serv_ready_pickup IS NOT NULL
 GROUP BY c.cust_no,
          c.cust_name
HAVING SUM(s.serv_parts_cost) > (
    SELECT AVG(serv_parts_cost)
      FROM service
     WHERE serv_ready_pickup IS NOT NULL
)
 ORDER BY SUM(s.serv_parts_cost) DESC,
          c.cust_name;