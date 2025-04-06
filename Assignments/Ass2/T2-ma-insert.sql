/*****PLEASE ENTER YOUR DETAILS BELOW*****/
-- ITO4132
-- T2-ma-insert.sql

-- Student ID: 34273654
-- Student Name: Nazmul Hasan
-- last modified: 04.05.2025

/* Comments for your marker:


*/

-- Please ensure EACH insert statement you add is formatted
-- and includes a semicolon

-- INSERTING into SERVICE

-- Service 101 Standard 80,000 km service
INSERT INTO service VALUES ( 101,
                             TO_DATE('08/02/2023','DD/MM/YYYY'),
                             TO_DATE('08/02/2023 08:30','dd/mm/yyyy hh24:mi'),
                             TO_DATE('08/02/2023 16:00','dd/mm/yyyy hh24:mi'),
                             TO_DATE('08/02/2023 15:00','dd/mm/yyyy hh24:mi'),
                             80000,
                             350.00,
                             256.74,
                             'Standard 80,000 km service',
                             'S',
                             'WBAWR33598P984354',
                             1000 );

-- Service 102 (Brake system check)
INSERT INTO service VALUES ( 102,
                             TO_DATE('15/02/2023','DD/MM/YYYY'),
                             TO_DATE('15/02/2023 09:15','DD/MM/YYYY HH24:MI'),
                             TO_DATE('15/02/2023 17:00','DD/MM/YYYY HH24:MI'),
                             NULL,
                             75000,
                             420.00,
                             315.20,
                             'Brake system check',
                             'C',
                             'WAUVFAFH4AN857561',
                             1010 );


-- Service 103 (Oil change)
INSERT INTO service VALUES ( 103,
                             TO_DATE('22/02/2023','DD/MM/YYYY'),
                             TO_DATE('22/02/2023 10:00','DD/MM/YYYY HH24:MI'),
                             TO_DATE('22/02/2023 15:00','DD/MM/YYYY HH24:MI'),
                             NULL,
                             60000,
                             275.00,
                             189.50,
                             'Oil change and filter replacement',
                             'E',
                             'WAUGFAFC8FN843179',
                             1020 );

-- Service 104 (Transmission service)
INSERT INTO service VALUES ( 104,
                             TO_DATE('01/03/2023','DD/MM/YYYY'),
                             TO_DATE('01/03/2023 13:30','DD/MM/YYYY HH24:MI'),
                             TO_DATE('01/03/2023 17:30','DD/MM/YYYY HH24:MI'),
                             TO_DATE('01/03/2023 18:15','DD/MM/YYYY HH24:MI'),
                             90000,
                             380.00,
                             420.75,
                             'Transmission service',
                             'S',
                             'JN1CV6EK6FM569421',
                             1030 );

-- Service 105 (Coolant system flush)
INSERT INTO service VALUES ( 105,
                             TO_DATE('08/03/2023','DD/MM/YYYY'),
                             TO_DATE('08/03/2023 08:45','DD/MM/YYYY HH24:MI'),
                             TO_DATE('08/03/2023 16:30','DD/MM/YYYY HH24:MI'),
                             TO_DATE('08/03/2023 16:00','DD/MM/YYYY HH24:MI'),
                             85000,
                             320.00,
                             275.30,
                             'Coolant system flush',
                             'C',
                             '5XXGM4A74DG668202',
                             1040 );

-- Service 106 (Engine tune-up)
INSERT INTO service VALUES ( 106,
                             TO_DATE('15/03/2023','DD/MM/YYYY'),
                             TO_DATE('15/03/2023 11:00','DD/MM/YYYY HH24:MI'),
                             TO_DATE('15/03/2023 18:00','DD/MM/YYYY HH24:MI'),
                             TO_DATE('15/03/2023 17:30','DD/MM/YYYY HH24:MI'),
                             82000,
                             450.00,
                             520.40,
                             'Engine tune-up',
                             'E',
                             'WBAWR33598P984354',
                             1000 );

-- Service 107 (Wheel alignment)
INSERT INTO service VALUES ( 107,
                             TO_DATE('22/03/2023','DD/MM/YYYY'),
                             TO_DATE('22/03/2023 14:00','DD/MM/YYYY HH24:MI'),
                             TO_DATE('22/03/2023 17:00','DD/MM/YYYY HH24:MI'),
                             TO_DATE('22/03/2023 16:45','DD/MM/YYYY HH24:MI'),
                             70000,
                             290.00,
                             195.25,
                             'Wheel alignment',
                             'S',
                             '4T1BK3DB4CU320186',
                             1050 );

-- Service 108 (Suspension check)
INSERT INTO service VALUES ( 108,
                             TO_DATE('29/03/2023','DD/MM/YYYY'),
                             TO_DATE('29/03/2023 09:30','DD/MM/YYYY HH24:MI'),
                             TO_DATE('29/03/2023 14:00','DD/MM/YYYY HH24:MI'),
                             TO_DATE('29/03/2023 14:30','DD/MM/YYYY HH24:MI'),
                             78000,
                             360.00,
                             310.80,
                             'Suspension check',
                             'C',
                             '19UYA42792A297253',
                             1060 );

-- Service 109 (Electrical system diagnostic)
INSERT INTO service VALUES ( 109,
                             TO_DATE('05/04/2023','DD/MM/YYYY'),
                             TO_DATE('05/04/2023 10:45','DD/MM/YYYY HH24:MI'),
                             TO_DATE('05/04/2023 16:00','DD/MM/YYYY HH24:MI'),
                             TO_DATE('05/04/2023 16:45','DD/MM/YYYY HH24:MI'),
                             77000,
                             400.00,
                             350.60,
                             'Electrical system diagnostic',
                             'E',
                             'WAUVFAFH4AN857561',
                             1010 );



-- Service 110 (Air conditioning service)
INSERT INTO service VALUES ( 110,
                             TO_DATE('12/04/2023','DD/MM/YYYY'),
                             TO_DATE('12/04/2023 08:00','DD/MM/YYYY HH24:MI'),
                             TO_DATE('12/04/2023 12:00','DD/MM/YYYY HH24:MI'),
                             TO_DATE('12/04/2023 11:30','DD/MM/YYYY HH24:MI'),
                             65000,
                             280.00,
                             230.90,
                             'Air conditioning service',
                             'S',
                             '19XFB2E59DE245929',
                             1070 );


-- 2 service that were ready after the requested pickup day/time
-- For service 102 (Brake system check)
UPDATE service
   SET
    serv_ready_pickup = TO_DATE(to_char(
        serv_req_pickup,
        'DD/MM/YYYY'
    )
                                || ' 17:15',
        'DD/MM/YYYY HH24:MI')
 WHERE serv_no = 102;

-- For service 103 (Oil change)
UPDATE service
   SET
    serv_ready_pickup = TO_DATE(to_char(
        serv_req_pickup,
        'DD/MM/YYYY'
    )
                                || ' 15:30',
        'DD/MM/YYYY HH24:MI')
 WHERE serv_no = 103;

-- view times as oracle doesn't show time by default
SELECT serv_no,
       to_char(
           serv_drop_off,
           'DD/MM/YYYY HH24:MI'
       ) AS drop_off_time,
       to_char(
           serv_req_pickup,
           'DD/MM/YYYY HH24:MI'
       ) AS serv_req_pickup_time,
       to_char(
           serv_ready_pickup,
           'DD/MM/YYYY HH24:MI'
       ) AS serv_ready_pickup_time
  FROM service
 ORDER BY serv_no;


-- INSERTING into SERVICE_JOB

-- Service 101 (1 job)
INSERT INTO service_job VALUES ( 101,
                                 1,
                                 'Standard service' );
-- Service 102 (2 jobs)
INSERT INTO service_job VALUES ( 102,
                                 1,
                                 'Brake inspection' );
INSERT INTO service_job VALUES ( 102,
                                 2,
                                 'Brake pad replacement' );
-- Service 103 (1 job)
INSERT INTO service_job VALUES ( 103,
                                 1,
                                 'Oil change' );
-- Service 104 (3 jobs)
INSERT INTO service_job VALUES ( 104,
                                 1,
                                 'Transmission fluid change' );
INSERT INTO service_job VALUES ( 104,
                                 2,
                                 'Transmission filter replacement' );
INSERT INTO service_job VALUES ( 104,
                                 3,
                                 'Transmission diagnostic' );

-- Service 105 (1 job)
INSERT INTO service_job VALUES ( 105,
                                 1,
                                 'Coolant system service' );

-- Service 106 (2 jobs)
INSERT INTO service_job VALUES ( 106,
                                 1,
                                 'Spark plug replacement' );
INSERT INTO service_job VALUES ( 106,
                                 2,
                                 'Engine diagnostic' );
-- Service 107 (1 job)
INSERT INTO service_job VALUES ( 107,
                                 1,
                                 'Wheel alignment' );
  
-- Service 108 (1 job)
INSERT INTO service_job VALUES ( 108,
                                 1,
                                 'Suspension inspection' );
  
-- Service 109 (2 jobs)
INSERT INTO service_job VALUES ( 109,
                                 1,
                                 'Battery check' );
INSERT INTO service_job VALUES ( 109,
                                 2,
                                 'Alternator test' );
  
-- Service 110 (1 job)
INSERT INTO service_job VALUES ( 110,
                                 1,
                                 'AC refrigerant recharge' );


--  INSERTING into PART_CHARGE

  -- Service 101
INSERT INTO part_charge VALUES ( 1,
                                 1,
                                 15.58,
                                 101,
                                 1,
                                 'WR2419' );

INSERT INTO part_charge VALUES ( 2,
                                 2,
                                 51.78,
                                 101,
                                 1,
                                 '341490' );
  -- Service 102
INSERT INTO part_charge VALUES ( 3,
                                 1,
                                 89.95,
                                 102,
                                 2,
                                 'DB1849' );
  
  -- Service 103
INSERT INTO part_charge VALUES ( 4,
                                 1,
                                 45.00,
                                 103,
                                 1,
                                 '341490' );
  
  -- Service 104
INSERT INTO part_charge VALUES ( 5,
                                 1,
                                 65.00,
                                 104,
                                 1,
                                 'ONE2-5' );
INSERT INTO part_charge VALUES ( 6,
                                 1,
                                 32.50,
                                 104,
                                 2,
                                 'R2132P' );
  
  -- Service 105
INSERT INTO part_charge VALUES ( 7,
                                 1,
                                 38.00,
                                 105,
                                 1,
                                 'ONE2-5' );

  -- Service 106
INSERT INTO part_charge VALUES ( 8,
                                 4,
                                 120.00,
                                 106,
                                 1,
                                 'FR8HDC' );
  
  -- Service 109
INSERT INTO part_charge VALUES ( 9,
                                 1,
                                 85.00,
                                 109,
                                 2,
                                 'TIM333' );
  
  -- Service 110
INSERT INTO part_charge VALUES ( 10,
                                 1,
                                 95.00,
                                 110,
                                 1,
                                 'TIM333' );

COMMIT;