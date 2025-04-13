/*****PLEASE ENTER YOUR DETAILS BELOW*****/
-- ITO4132
--T6-ma-json.sql


-- Student ID: 34273654
--Student Name: Nazmul Hasan
--last modified date: 13.04.2025

/* Comments for your marker:




*/

-- PLEASE PLACE REQUIRED SQL SELECT STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer
SELECT 
    JSON_OBJECT(
        '_id' VALUE c.cust_no || '_' || v.veh_vin,
        'customer' VALUE JSON_OBJECT(
            'custno' VALUE c.cust_no,
            'name' VALUE c.cust_name,
            'phone' VALUE c.cust_phone
        ),
        'rego_number' VALUE v.veh_rego,
        'make' VALUE v.veh_make,
        'model' VALUE v.veh_model,
        'year' VALUE TO_CHAR(v.veh_year, 'YYYY'),
        'noservices' VALUE COUNT(s.serv_no),
        'booked_services' VALUE JSON_ARRAYAGG(
            JSON_OBJECT(
                'servno' VALUE s.serv_no,
                'servdate' VALUE TO_CHAR(s.serv_date, 'DD-Mon-YYYY'),
                'labourcost' VALUE s.serv_labour_cost,
                'partcost' VALUE s.serv_parts_cost,
                'totalcost' VALUE NVL(s.serv_labour_cost, 0) + NVL(s.serv_parts_cost, 0)
            )
        )
    FORMAT JSON) AS json_output
FROM 
    customer c
JOIN 
    vehicle v ON c.cust_no = v.cust_no
LEFT JOIN 
    service s ON v.veh_vin = s.veh_vin
GROUP BY 
    c.cust_no, c.cust_name, c.cust_phone, 
    v.veh_vin, v.veh_rego, v.veh_make, v.veh_model, v.veh_year;
