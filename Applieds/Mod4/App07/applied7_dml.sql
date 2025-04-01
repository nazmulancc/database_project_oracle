/*
Databases Applied 7
applied7_dml.sql

student id: 
student name:
last modified date:

*/


DROP TABLE enrolment CASCADE CONSTRAINTS PURGE;

DROP TABLE student CASCADE CONSTRAINTS PURGE;

DROP TABLE unit CASCADE CONSTRAINTS PURGE;

-- Create Tables
-- Here using both table and column constraints
--

CREATE TABLE student (
    stu_nbr     NUMBER(8) NOT NULL,
    stu_lname   VARCHAR2(50) NOT NULL,
    stu_fname   VARCHAR2(50) NOT NULL,
    stu_dob     DATE NOT NULL
);

COMMENT ON COLUMN student.stu_nbr IS
    'Student number';

COMMENT ON COLUMN student.stu_lname IS
    'Student last name';

COMMENT ON COLUMN student.stu_fname IS
    'Student first name';

COMMENT ON COLUMN student.stu_dob IS
    'Student date of birth';

/* Add STUDENT constraints here */
ALTER TABLE student ADD CONSTRAINT student_pk PRIMARY KEY (stu_nbr);
ALTER TABLE student ADD CONSTRAINT chk_student_nbr CHECK (stu_nbr > 10000000 );


/* Add UNIT data types here */
CREATE TABLE unit (
    unit_code   CHAR(7) NOT NULL,
    unit_name   VARCHAR2(50) NOT NULL
);

COMMENT ON COLUMN unit.unit_code IS
    'Unit code';

COMMENT ON COLUMN unit.unit_name IS
    'Unit name';

/* Add UNIT constraints here */
ALTER TABLE unit ADD CONSTRAINT unit_pk PRIMARY KEY (unit_code);
ALTER TABLE unit ADD CONSTRAINT uq_unit_name UNIQUE (unit_name);

/* Add ENROLMENT attributes and data types here */
CREATE TABLE enrolment (
    stu_nbr         NUMBER(8) NOT NULL,
    unit_code       CHAR(7) NOT NULL,
    enrol_year      NUMBER(7) NOT NULL,
    enrol_semester  CHAR(1) NOT NULL,
    enrol_mark      NUMBER(3),
    enrol_grade     CHAR(2)
);

COMMENT ON COLUMN enrolment.stu_nbr IS
    'Student number';

COMMENT ON COLUMN enrolment.unit_code IS
    'Unit code';

COMMENT ON COLUMN enrolment.enrol_year IS
    'Enrolment year';

COMMENT ON COLUMN enrolment.enrol_semester IS
    'Enrolment semester';

COMMENT ON COLUMN enrolment.enrol_mark IS
    'Enrolment mark (real)';

COMMENT ON COLUMN enrolment.enrol_grade IS
    'Enrolment grade (letter)';

/* Add ENROLMENT constraints here */
ALTER TABLE enrolment ADD CONSTRAINT enrolment_pk PRIMARY KEY ( stu_nbr,
                                                                unit_code,
                                                                enrol_year,
                                                                enrol_semester);

ALTER TABLE enrolment ADD CONSTRAINT student_enrolment_fk FOREIGN KEY ( stu_nbr) REFERENCES student (stu_nbr); 
ALTER TABLE enrolment ADD CONSTRAINT unit_enrolment_fk FOREIGN KEY ( unit_code) REFERENCES unit (unit_code);       

ALTER TABLE enrolment ADD CONSTRAINT chk_enrol_semester CHECK (enrol_semester IN ('1', '2', '3'));


---==INSERT==--
/*1. Write SQL INSERT statements to add the data into the specified tables */
-- Insert STUDENT records
INSERT INTO student (stu_nbr, stu_lname, stu_fname, stu_dob) VALUES (11111111, 'Bloggs', 'Fred', TO_DATE('01-Jan-2003', 'DD-Mon-YYYY'));
INSERT INTO student (stu_nbr, stu_lname, stu_fname, stu_dob) VALUES (11111112, 'Nice', 'Nick', TO_DATE('10-Oct-2004', 'DD-Mon-YYYY'));
INSERT INTO student (stu_nbr, stu_lname, stu_fname, stu_dob) VALUES (11111113, 'Wheat', 'Wendy', TO_DATE('05-May-2005', 'DD-Mon-YYYY'));
INSERT INTO student (stu_nbr, stu_lname, stu_fname, stu_dob) VALUES (11111114, 'Sheen', 'Cindy', TO_DATE('25-Dec-2004', 'DD-Mon-YYYY'));

-- Insert UNIT records
INSERT INTO unit (unit_code, unit_name) VALUES ('FIT9999', 'FIT Last Unit');
INSERT INTO unit (unit_code, unit_name) VALUES ('FIT9132', 'Introduction to Databases');
INSERT INTO unit (unit_code, unit_name) VALUES ('FIT9161', 'Project');
INSERT INTO unit (unit_code, unit_name) VALUES ('FIT5111', 'Student');

-- Insert ENROLMENT records

INSERT INTO enrolment (stu_nbr, unit_code, enrol_year, enrol_semester, enrol_mark, enrol_grade) VALUES (11111111, 'FIT9132', 2022, 1, 35, 'N');
INSERT INTO enrolment (stu_nbr, unit_code, enrol_year, enrol_semester, enrol_mark, enrol_grade) VALUES (11111111, 'FIT9161', 2022, 1, 61, 'C');
INSERT INTO enrolment (stu_nbr, unit_code, enrol_year, enrol_semester, enrol_mark, enrol_grade) VALUES (11111111, 'FIT9132', 2022, 2, 42, 'N');
INSERT INTO enrolment (stu_nbr, unit_code, enrol_year, enrol_semester, enrol_mark, enrol_grade) VALUES (11111111, 'FIT5111', 2022, 2, 76, 'D');
INSERT INTO enrolment (stu_nbr, unit_code, enrol_year, enrol_semester) VALUES (11111111, 'FIT9132', 2023, 1);
INSERT INTO enrolment (stu_nbr, unit_code, enrol_year, enrol_semester, enrol_mark, enrol_grade) VALUES (11111112, 'FIT9132', 2022, 2, 83, 'HD');
INSERT INTO enrolment (stu_nbr, unit_code, enrol_year, enrol_semester, enrol_mark, enrol_grade) VALUES (11111112, 'FIT9161', 2022, 2, 79, 'D');
INSERT INTO enrolment (stu_nbr, unit_code, enrol_year, enrol_semester) VALUES (11111113, 'FIT9132', 2023, 1);
INSERT INTO enrolment (stu_nbr, unit_code, enrol_year, enrol_semester) VALUES (11111113, 'FIT5111', 2023, 1);
INSERT INTO enrolment (stu_nbr, unit_code, enrol_year, enrol_semester) VALUES (11111114, 'FIT9132', 2023, 1);
INSERT INTO enrolment (stu_nbr, unit_code, enrol_year, enrol_semester) VALUES (11111114, 'FIT5111', 2023, 1);

COMMIT;


SELECT
    *
FROM
    student;

SELECT
    *
FROM
    unit;

SELECT
    *
FROM
    enrolment;

---==INSERT using SEQUENCEs ==--
/*1. Create a sequence for the STUDENT table called STUDENT_SEQ */

/*2. Add a new student (MICKEY MOUSE) and an enrolment for this student as listed below, 
treat all the data that you add as a single transaction. */


---==Advanced INSERT==--
/*1. A new student has started a course. Subsequently this new student needs to enrol into 
Introduction to databases. Enter the new student's details, then insert his/her enrollment 
to the database using the sequence in combination with a SELECT statement. You can 
make up details of the new student and when they will attempt Introduction to databases 
and you may assume there is only one student with such a name in the system.

You must not do a manual lookup to find the unit code of the Introduction to Databases 
and the student number.
 */

---=Creating a table and inserting data as a single SQL statement==--
/*1. Create a table called FIT5111_STUDENT. The table should contain all enrolments for the 
unit FIT5111 */

/*2. Check the table exists */


/*3. List the contents of the table */

---==8.2.5 UPDATE==--
/*1. Update the unit name of FIT9999 from 'FIT Last Unit' to 'place holder unit'.*/


/*2. Enter the mark and grade for the student with the student number of 11111113 
for Introduction to Databases that the student enrolled in semester 1 of 2023. 
The mark is 75 and the grade is D.*/


/*3. The university introduced a new grade classification scale. 
The new classification are:
0 - 44 is N
45 - 54 is P1
55 - 64 is P2
65 - 74 is C
75 - 84 is D
85 - 100 is HD
Change the database to reflect the new grade classification scale.
*/


/*4. Due to the new regulation, the Faculty of IT decided to change 'Project' unit code 
from FIT9161 into FIT5161. Change the database to reflect this situation.
Note: you need to disable the FK constraint before you do the modification 
then enable the FK to have it active again.
*/



--==DELETE==--
/*1. A student with student number 11111114 has taken intermission in semester 1 2023, 
hence all the enrolment of this student for semester 1 2023 should be removed. 
Change the database to reflect this situation.*/


/*2. The faculty decided to remove all Student's Life unit's enrolments. 
Change the database to reflect this situation.
Note: unit names are unique in the database.*/


/*3. Assume that Wendy Wheat (student number 11111113) has withdrawn from the university. 
Remove her details from the database.*/


