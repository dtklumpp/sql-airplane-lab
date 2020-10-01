\c flights

-- CREATE TABLE airlines (
--   id int,
--   name varchar(255) DEFAULT NULL,
--   alias varchar(255) DEFAULT NULL,
--   iata varchar(255) DEFAULT NULL,
--   icao varchar(255) DEFAULT NULL,
--   callsign varchar(255) DEFAULT NULL,
--   country varchar(255) DEFAULT NULL,
--   active varchar(255) DEFAULT NULL
-- );

-- CREATE TABLE airports (
--   id int,
--   name varchar(255) DEFAULT NULL,
--   city varchar(255) DEFAULT NULL,
--   country varchar(255) DEFAULT NULL,
--   iata_faa varchar(255) DEFAULT NULL,
--   icao varchar(255) DEFAULT NULL,
--   latitude varchar(255) DEFAULT NULL,
--   longitude varchar(255) DEFAULT NULL,
--   altitude varchar(255) DEFAULT NULL,
--   utc_offset varchar(255) DEFAULT NULL,
--   dst varchar(255) DEFAULT NULL,
--   tz varchar(255) DEFAULT NULL
-- );

-- CREATE TABLE routes (
--   airline_code varchar(255) DEFAULT NULL,
--   airline_id int DEFAULT NULL,
--   origin_code varchar(255) DEFAULT NULL,
--   origin_id int DEFAULT NULL,
--   dest_code varchar(255) DEFAULT NULL,
--   dest_id int DEFAULT NULL,
--   codeshare varchar(255) DEFAULT NULL,
--   stops int DEFAULT NULL,
--   equipment varchar(255) DEFAULT NULL
-- );



-- COPY routes FROM '/Users/dkf/sei/labs/sql-airplane-lab/routes.csv' DELIMITER ',' CSV;
-- COPY airports FROM '/Users/dkf/sei/labs/sql-airplane-lab/airports.csv' DELIMITER ',' CSV;
-- COPY airlines FROM '/Users/dkf/sei/labs/sql-airplane-lab/airlines.csv' DELIMITER ',' CSV;

-- practice
SELECT name FROM airports WHERE name LIKE '%De Gaulle%';
SELECT name FROM airports WHERE name LIKE '%John F Kennedy%';

-- Select airport code for airports LIKE 'John F Kennedy' or 'De Gaulle'.
SELECT DISTINCT origin_code FROM airports 
JOIN routes
ON airports.id = routes.origin_id
WHERE airports.name LIKE '%John F Kennedy%'
OR airports.name LIKE '%De Gaulle%';

-- Select all the flights originating from 'JFK' AND going to 'CDG'.
SELECT airline_code FROM routes
WHERE origin_code = 'JFK'
AND dest_code = 'CDG';

-- Find out the NUMBER of airports in Canada.
SELECT COUNT(*) FROM airports
WHERE country = 'Canada';

-- Select airport names IN the following countries- Algeria, Ghana, Ethiopia, order by country.
SELECT name, country FROM airports
WHERE country = 'Algeria'
OR country = 'Ghana'
OR country = 'Ethiopia'
ORDER BY country
LIMIT 10;

--Select all the airports that airlines 'Germania' flies from.
SELECT airports.name FROM routes
JOIN airlines
ON routes.airline_id = airlines.id
JOIN airports
ON routes.origin_id = airports.id
WHERE airlines.name = 'Germania'
LIMIT 10;
