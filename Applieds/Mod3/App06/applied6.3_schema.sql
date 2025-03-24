
SET ECHO ON

SPOOL applied63_schema.txt

/*
Databases Applied 6
applied6_schema.sql

student id:34273654
student name: Nazmul    
last modified date: 24.03.2025

*/

-- DDL for Student-Unit-Enrolment model (using ALTER TABLE)
--

--
-- Place DROP commands at head of schema file
--

DROP TABLE enrolment CASCADE CONSTRAINTS PURGE;

DROP TABLE student CASCADE CONSTRAINTS PURGE;

DROP TABLE unit CASCADE CONSTRAINTS PURGE;

DROP TABLE course CASCADE CONSTRAINTS PURGE;

DROP TABLE course_unit CASCADE CONSTRAINTS PURGE;
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


ALTER TABLE unit
ADD (
    credit_points NUMBER(2) DEFAULT 6 NOT NULL,
    CONSTRAINT unit_credit_points_chk CHECK (credit_points IN (3, 6, 12))
);

COMMENT ON COLUMN unit.credit_points IS
    'Unit credit points (must be 3, 6 or 12)';


    -- Create COURSE table
CREATE TABLE course (
    course_code CHAR(5) NOT NULL,
    course_name VARCHAR2(100) NOT NULL,
    course_totalpoints NUMBER(4) NOT NULL,
    CONSTRAINT course_pk PRIMARY KEY (course_code),
    CONSTRAINT course_code_format_chk CHECK (REGEXP_LIKE(course_code, '^[A-Z][0-9]{4}$')),
    CONSTRAINT course_totalpoints_chk CHECK (course_totalpoints > 0)
);

COMMENT ON COLUMN course.course_code IS
    'Course code (format: A9999)';
COMMENT ON COLUMN course.course_name IS
    'Full course name';
COMMENT ON COLUMN course.course_totalpoints IS
    'Total credit points required for course completion';

-- Create junction table for course-unit relationship
CREATE TABLE course_unit (
    course_code CHAR(5) NOT NULL,
    unit_code CHAR(7) NOT NULL,
    CONSTRAINT course_unit_pk PRIMARY KEY (course_code, unit_code),
    CONSTRAINT course_unit_course_fk FOREIGN KEY (course_code)
        REFERENCES course(course_code),
    CONSTRAINT course_unit_unit_fk FOREIGN KEY (unit_code)
        REFERENCES unit(unit_code)
);

COMMENT ON COLUMN course_unit.course_code IS
    'Course code reference';
COMMENT ON COLUMN course_unit.unit_code IS
    'Unit code reference';

SPOOL OFF

SET ECHO OFF
