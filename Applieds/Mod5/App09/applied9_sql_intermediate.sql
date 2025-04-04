/*
Database Teaching Team
applied9_sql_intermediate.sql

student id:34273654
student name: Nazmul    
last modified date: 04.04.2025
*/

--1

SELECT
    MAX(enrolmark) AS max_mark
FROM
    uni.enrolment
WHERE
        upper(unitcode) = 'FIT9136'
    AND ofsemester = 2
    AND to_char(ofyear, 'YYYY') = '2019';

--2



--3



--4
-- a. 



-- b. Repeat students are only counted once across 2019



--5




--6



--7



--8



--9



--10




--11



--12



--13


-- number of courses taken by each customer
 SELECT cust_id, COUNT(*) AS no_courses_taken
 FROM drone.cust_train
 GROUP BY cust_id
 ORDER BY cust_id;


-- average number of courses taken by each customer
SELECT AVG(COUNT(*)) 
AS average_no_courses_taken
 FROM drone.cust_train
 GROUP BY cust_id;

 -- grouping by cust_id and train_code
 -- cust_id 5 and 9 appeared multiple times
 -- some of the train_code appeared multiple times 
 SELECT cust_id, train_code, count(train_code) 
    as no_of_courses_taken
 FROM drone.cust_train
 GROUP BY cust_id, train_code
 ORDER BY cust_id, train_code;


-- column alias gets actioned after the group by process
-- grouping cust_id by year and licence start year
-- showing cust_id with number of courses they've taken for a particular year
 SELECT cust_id, 
to_char(ct_date_start, 'yyyy') as licence_start_year, 
count(train_code) as no_of_courses_taken
 FROM drone.cust_train
 GROUP BY cust_id, to_char(ct_date_start, 'yyyy')
 ORDER BY cust_id, licence_start_year;

-- same as above but this time showing how many courses were taken by a particular customer in a particular year
SELECT cust_id, train_code, count(train_code) 
    as no_of_courses_taken
 FROM drone.cust_train
 GROUP BY cust_id, train_code
 HAVING count(train_code) > 1
 ORDER BY cust_id, train_code;


-- which of our drone has average flight time that is greater than 50 mins
SELECT dt_code, AVG(drone_flight_time) as average_drone_flight
 FROM drone.drone
 GROUP BY dt_code
 HAVING AVG(drone_flight_time)>50
 ORDER BY dt_code;
 
-- difference between where and having
SELECT 
        dt_code,
        AVG(drone_flight_time) AS average_drone_flight
    FROM
        drone.drone
    WHERE
      to_char(drone_pur_date, 'yyyy') = '2021'
    GROUP BY
        dt_code
    HAVING
       AVG(drone_flight_time) > 50
    ORDER BY
      average_drone_flight desc;
 
-- Attributes that are used in the SELECT, HAVING and ORDER BY must be included in the GROUP BY clause (reverse is not necessary).
SELECT cust_id, train_code, count(*) as no_of_courses_taken
 FROM drone.cust_train
 GROUP BY cust_id, TRAIN_CODE
 ORDER BY cust_id;

 -- Query within a query.
 --"Find all drones which flight time is higher than the average flight time of all drones"
 SELECT *
 FROM drone.drone
 WHERE drone_flight_time > 
    (
        SELECT AVG(drone_flight_time)
        FROM drone.drone
    )
 ORDER BY drone_id;

 -- creating a view dronetypeprice

  CREATE VIEW dronetypeprice as 
SELECT drone_id, dt_code, dt_model, 
drone_pur_price
 FROM drone.drone_type NATURAL JOIN drone.drone;

 SELECT
        *
    FROM
        dronetypeprice
    WHERE drone_pur_price IN (SELECT MAX(drone_pur_price)
                              FROM dronetypeprice
                              GROUP BY dt_code)
    order by drone_id;


-- where the drone_pur_price is greater than any (the minimum)
SELECT *
    FROM dronetypeprice
    WHERE drone_pur_price > 
           ANY (SELECT MIN(drone_pur_price)
                FROM dronetypeprice
                GROUP BY dt_code)
    ORDER BY drone_id;

-- greater than all of the values
SELECT *
    FROM dronetypeprice
    WHERE drone_pur_price > 
           ALL (SELECT MIN(drone_pur_price)
                FROM dronetypeprice
                GROUP BY dt_code)
    ORDER BY drone_id;


/*
 Write the SQL Query to find the details of all drones which have a purchase price less than the average purchase price for all drones 
manufactured by DJI Da-Jiang Innovations. 
– Begin by your listing the steps which need to be taken– After this code the SQL step by step. 
▪ Your output must show the drone id, the type code, the purchase price, the year purchased and the manufacturers name. 
▪ Order the output by drone id.
*/

SELECT
    drone_id,
    dt_code,
    drone_pur_price,
    to_char(drone_pur_date,'yyyy') as yearpurchased,
    manuf_name
 FROM
         drone.drone
    NATURAL JOIN drone.drone_type
    NATURAL JOIN drone.manufacturer
 WHERE
    drone_pur_price < (
        SELECT
            AVG(drone_pur_price)
        FROM
                 drone.drone
            NATURAL JOIN drone.drone_type
            NATURAL JOIN drone.manufacturer
        WHERE
            upper(manuf_name) = 'DJI DA-JIANG INNOVATIONS'
    )
 ORDER BY
    drone_id;
