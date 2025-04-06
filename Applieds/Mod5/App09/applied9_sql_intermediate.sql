/*
Database Teaching Team
applied9_sql_intermediate.sql

student id:34273654
student name: Nazmul    
last modified date: 04.04.2025
*/

--1

SELECT MAX(enrolmark) AS max_mark
  FROM uni.enrolment
 WHERE upper(unitcode) = 'FIT9136'
   AND ofsemester = 2
   AND to_char(
    ofyear,
    'YYYY'
) = '2019';

--2 Find the average mark for FIT2094 in semester 2, 2020. Show the average mark with two decimal places. Name the output column as average_mark.

SELECT AVG(enrolmark) AS average_mark
  FROM uni.enrolmark
 WHERE upper(unit_code) = upper('IT2094')
   AND ofsemester = 2
   AND year = 2020
 ORDER BY unitcode;

--3

SELECT
    to_char(AVG(enrolmark), '990.00') AS average_mark
FROM
    uni.enrolment
WHERE
    upper(unitcode) = 'FIT2094'
    AND ofsemester = 2
    AND to_char(ofyear, 'YYYY') = '2020';

--4
-- a. 
SELECT
    COUNT(stuid) AS student_count
FROM
    uni.enrolment
WHERE
    upper(unitcode) = 'FIT1045'
    AND to_char(ofyear, 'YYYY') = '2019';


-- b. Repeat students are only counted once across 2019

SELECT
    COUNT(DISTINCT stuid) AS student_count
FROM
    uni.enrolment
WHERE
    upper(unitcode) = 'FIT1045'
    AND to_char(ofyear, 'YYYY') = '2019';

--5

SELECT
    COUNT(prerequnitcode) AS no_prereqs
FROM
    uni.prereq
WHERE
    upper(unitcode) = 'FIT5145';


--6
SELECT
    unitcode,
    ofsemester,
    COUNT(stuid)                AS total_enrolment
FROM
    uni.enrolment
WHERE
    to_char(ofyear, 'YYYY') = '2019'
GROUP BY
    unitcode,
    ofsemester
ORDER BY
    total_enrolment, unitcode, ofsemester;

--7
SELECT
    unitcode,
    COUNT(prerequnitcode) AS no_prereqs
FROM
    uni.prereq
GROUP BY
    unitcode
ORDER BY
    unitcode;


--8

SELECT
    unitcode,
    COUNT(stuid) AS total_no_students
FROM
    uni.enrolment
WHERE
    ofsemester = 2
    AND to_char(ofyear, 'yyyy') = '2020'
    AND upper(enrolgrade) = 'WH'
GROUP BY
    unitcode
ORDER BY
    total_no_students DESC, unitcode;

--9

SELECT
    prerequnitcode AS unitcode,
    u.unitname,
    COUNT(u.unitcode) AS no_times_used
FROM
    uni.prereq   p
    JOIN uni.unit     u ON u.unitcode = p.prerequnitcode
GROUP BY
    prerequnitcode,
    u.unitname
ORDER BY
    unitcode;

--10


SELECT
    unitcode,
    unitname
FROM
         uni.enrolment
    NATURAL JOIN uni.unit
WHERE
        ofsemester = 2
    AND to_char(ofyear, 'yyyy') = '2021'
    AND upper(enrolgrade) = 'DEF'
GROUP BY
    unitcode,
    unitname
HAVING
    COUNT(*) >= 2
ORDER BY
    unitcode;

--11
SELECT
    s.stuid,
    stufname
    || ' '
    || stulname AS fullname,
    to_char(studob, 'dd/mm/yyyy') AS date_of_birth
FROM
         uni.student s
    JOIN uni.enrolment e ON s.stuid = e.stuid
WHERE
        upper(e.unitcode) = 'FIT9132'
    AND studob = (
        SELECT
            MIN(studob)
        FROM
                 uni.student s
            JOIN uni.enrolment e ON s.stuid = e.stuid
        WHERE
            upper(e.unitcode) = 'FIT9132'
    )
ORDER BY
    s.stuid;


--12

SELECT
    unitcode,
    ofsemester,
    COUNT(stuid) AS student_count
FROM
    uni.enrolment
WHERE
    to_char(ofyear, 'YYYY') = '2019'
GROUP BY
    unitcode,
    ofsemester
HAVING
    COUNT(stuid) = (
        SELECT
            MAX(COUNT(stuid))
        FROM
            uni.enrolment
        WHERE
            to_char(ofyear, 'YYYY') = '2019'
        GROUP BY
            unitcode,
            ofsemester
    )
ORDER BY
    ofsemester,
    unitcode;

--13
SELECT
    stufname || ' ' || stulname as student_name,
    enrolmark
FROM
    uni.student     s
    JOIN uni.enrolment   e ON s.stuid = e.stuid
WHERE
    upper(unitcode) = 'FIT3157'
    AND ofsemester = 1
    AND to_char(ofyear, 'YYYY') = '2020'
    AND enrolmark > (
        SELECT
            AVG(enrolmark)
        FROM
            uni.enrolment
        WHERE
            upper(unitcode) = 'FIT3157'
            AND ofsemester = 1
            AND to_char(ofyear, 'YYYY') = '2020'
    )
ORDER BY
    enrolmark DESC, student_name;


-- number of courses taken by each customer
SELECT cust_id,
       COUNT(*) AS no_courses_taken
  FROM drone.cust_train
 GROUP BY cust_id
 ORDER BY cust_id;


-- average number of courses taken by each customer
SELECT AVG(COUNT(*)) AS average_no_courses_taken
  FROM drone.cust_train
 GROUP BY cust_id;

 -- grouping by cust_id and train_code
 -- cust_id 5 and 9 appeared multiple times
 -- some of the train_code appeared multiple times 
SELECT cust_id,
       train_code,
       COUNT(train_code) AS no_of_courses_taken
  FROM drone.cust_train
 GROUP BY cust_id,
          train_code
 ORDER BY cust_id,
          train_code;


-- column alias gets actioned after the group by process
-- grouping cust_id by year and licence start year
-- showing cust_id with number of courses they've taken for a particular year
SELECT cust_id,
       to_char(
           ct_date_start,
           'yyyy'
       ) AS licence_start_year,
       COUNT(train_code) AS no_of_courses_taken
  FROM drone.cust_train
 GROUP BY cust_id,
          to_char(
              ct_date_start,
              'yyyy'
          )
 ORDER BY cust_id,
          licence_start_year;

-- same as above but this time showing how many courses were taken by a particular customer in a particular year
SELECT cust_id,
       train_code,
       COUNT(train_code) AS no_of_courses_taken
  FROM drone.cust_train
 GROUP BY cust_id,
          train_code
HAVING COUNT(train_code) > 1
 ORDER BY cust_id,
          train_code;


-- which of our drone has average flight time that is greater than 50 mins
SELECT dt_code,
       AVG(drone_flight_time) AS average_drone_flight
  FROM drone.drone
 GROUP BY dt_code
HAVING AVG(drone_flight_time) > 50
 ORDER BY dt_code;
 
-- difference between where and having
SELECT dt_code,
       AVG(drone_flight_time) AS average_drone_flight
  FROM drone.drone
 WHERE to_char(
    drone_pur_date,
    'yyyy'
) = '2021'
 GROUP BY dt_code
HAVING AVG(drone_flight_time) > 50
 ORDER BY average_drone_flight DESC;
 
-- Attributes that are used in the SELECT, HAVING and ORDER BY must be included in the GROUP BY clause (reverse is not necessary).
SELECT cust_id,
       train_code,
       COUNT(*) AS no_of_courses_taken
  FROM drone.cust_train
 GROUP BY cust_id,
          train_code
 ORDER BY cust_id;

 -- Query within a query.
 --"Find all drones which flight time is higher than the average flight time of all drones"
SELECT *
  FROM drone.drone
 WHERE drone_flight_time > (
    SELECT AVG(drone_flight_time)
      FROM drone.drone
)
 ORDER BY drone_id;

 -- creating a view dronetypeprice

CREATE VIEW dronetypeprice AS
    SELECT drone_id,
           dt_code,
           dt_model,
           drone_pur_price
      FROM drone.drone_type
    NATURAL JOIN drone.drone;

SELECT *
  FROM dronetypeprice
 WHERE drone_pur_price IN (
    SELECT MAX(drone_pur_price)
      FROM dronetypeprice
     GROUP BY dt_code
)
 ORDER BY drone_id;


-- where the drone_pur_price is greater than any (the minimum)
SELECT *
  FROM dronetypeprice
 WHERE drone_pur_price > ANY (
    SELECT MIN(drone_pur_price)
      FROM dronetypeprice
     GROUP BY dt_code
)
 ORDER BY drone_id;

-- greater than all of the values
SELECT *
  FROM dronetypeprice
 WHERE drone_pur_price > ALL (
    SELECT MIN(drone_pur_price)
      FROM dronetypeprice
     GROUP BY dt_code
)
 ORDER BY drone_id;


/*
 Write the SQL Query to find the details of all drones which have a purchase price less than the average purchase price for all drones 
manufactured by DJI Da-Jiang Innovations. 
– Begin by your listing the steps which need to be taken– After this code the SQL step by step. 
▪ Your output must show the drone id, the type code, the purchase price, the year purchased and the manufacturers name. 
▪ Order the output by drone id.
*/

SELECT drone_id,
       dt_code,
       drone_pur_price,
       to_char(
           drone_pur_date,
           'yyyy'
       ) AS yearpurchased,
       manuf_name
  FROM drone.drone
NATURAL JOIN drone.drone_type
NATURAL JOIN drone.manufacturer
 WHERE drone_pur_price < (
    SELECT AVG(drone_pur_price)
      FROM drone.drone
    NATURAL JOIN drone.drone_type
    NATURAL JOIN drone.manufacturer
     WHERE upper(manuf_name) = 'DJI DA-JIANG INNOVATIONS'
)
 ORDER BY drone_id;