/*
Database Teaching Team
applied8_sql_basic.sql

student id:34273654
student name: Nazmul Hasan   
last modified date: 02.04.2025

*/

/* Part A - Retrieving data from a single table */

-- A1 List all units and their details. Order the output by unit code.

SELECT * FROM uni.STUDENT;
desc uni.unit;



-- A2  List the full student details for those students who live in Caulfield. Order the output by student id


-- A3 List the full student details for those students who have a surname starting with the letter M. 
--In the display, rename the columns stufname and stulname to firstname and lastname. Order the output by student id.


-- A4 List the student's id, surname, first name and address for those students who have a surname starting with the letter S and first name which contains the letter i. Order the output by student id.
SELECT STUID, STULNAME, STUFNAME, STUADDRESS FROM uni.STUDENT
where upper(STULNAME) like upper('S%') AND (lower(STUFNAME) like lower('%i%')) order by STUID;

-- A5 The first three letters represent the faculty abbreviation, eg. FIT for the Faculty of Information Technology.
--The first digit of the number following the letter represents the year level. For example, FIT2094 is a unit code from the Faculty of IT (FIT) and the number 2 refers to a second year unit.
--List the unit details for all first-year units in the Faculty of Information Technology. Order the output by unit code.


-- A6 List the unit code and semester of all units that are offered in 2021. Order the output by unit code, and within a given unit code order by semester. 
--To complete this question, you need to use the Oracle function to_char to convert the data type for the year component of the offering date into text. 
--For example, to_char(ofyear,'yyyy') - here we are only using the year part of the date.


-- A7  List the year and unit code for all units that were offered in either semester 2 of 2019 or semester 2 of 2020. 
--Order the output by year and then by unit code. To display the offering year correctly in Oracle, you need to use the to_char function. For example, to_char(ofyear,'yyyy').


-- A8 List the student id, unit code and mark for those students who have failed any unit in semester 2 of 2021. Order the output by student id then order by unit code.


-- A9 List the student id for all students who have no mark and no grade in FIT3176 in semester 1 of 2020. Order the output by student id.



/* Part B - Retrieving data from multiple tables */

--  List all the unit codes, semesters and name of chief examiners (ie. the staff who is responsible for the unit) 
--for all the units that are offered in 2021. Order the output by semester then by unit code.

SELECT
    unitcode,
    ofsemester,
    stafffname ||' '|| stafflname as stafffname
FROM
    uni.offering o
    JOIN uni.staff s ON o.staffid = s.staffid
WHERE
    to_char(
        ofyear, 'yyyy'
    ) = '2021'
ORDER BY
    ofsemester,
    unitcode;

-- B2 List all unit codes, unit names and their year and semester of offering. Order the output by unit code then by offering year and then semester.


-- B3 List the student id, student name (firstname and surname) as one attribute and the unit name of all enrolments for semester 1 of 2021. 
--Order the output by unit name, within a given unit name, order by student id.


-- B4  List the id and full name of all students who have marks in the range of 80 to 100 in FIT9132 semester 2 of 2019. 
--Order the output by full name. If there are more than one student with the same name, order them based on their id.


-- B5 List the unit code, semester, class type (lecture or tutorial), day, time and duration (in minutes) for all units taught by Windham Ellard in 2021. 
-- Sort the list according to the unit code, within a given unit code, order by offering semester.


-- B6 Create a study statement for Brier Kilgour. A study statement contains unit code, unit name, semester and year the study was attempted, the mark and grade. 
--If the mark and/or grade is unknown, show the mark and/or grade as ‘N/A’. Sort the list by year, then by semester and unit code.


-- B7 List the unit code, unit name and the unit code and unit name of the prerequisite units for all units in the database which have prerequisites. 
--Order the output by unit code and prerequisite unit code.


-- B8 List the unit code and unit name of the prerequisite units of the Introduction to data science unit. Order the output by prerequisite unit code.


-- B9 Find all students (list their id, firstname and surname) who have received an HD for FIT2094 in semester 2 of 2021. Sort the list by student id.


-- B10 List the student's full name, unit code for those students who have no mark in any unit in semester 1 of 2021. Sort the list by student full name.
