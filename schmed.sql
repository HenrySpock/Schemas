DROP DATABASE IF EXISTS meddb;
CREATE DATABASE meddb;
\c meddb

CREATE TABLE "doctors" (
  "id" SERIAL PRIMARY KEY,
  "name" text,
  "department" text
);

CREATE TABLE "patients" (
  "id" SERIAL PRIMARY KEY,
  "name" text,
  "birthday" date,
  "insurance" text
);

CREATE TABLE "diseases" (
  "id" SERIAL PRIMARY KEY,
  "name" text,
  "description" text
);

CREATE TABLE "diagnoses" (
  "id" SERIAL PRIMARY KEY,
  "visit_id" int,
  "disease_id" int,
  "comments" text
);

CREATE TABLE "visits" (
  "id" SERIAL PRIMARY KEY,
  "datetime" date,
  "patient_id" int,
  "doctor_id" int,
  "diagnoses_id" int
);
 
ALTER TABLE "visits" ADD FOREIGN KEY ("doctor_id") REFERENCES "doctors" ("id");

ALTER TABLE "diagnoses" ADD FOREIGN KEY ("disease_id") REFERENCES "diseases" ("id");

ALTER TABLE "visits" ADD FOREIGN KEY ("patient_id") REFERENCES "patients" ("id");

ALTER TABLE "visits" ADD FOREIGN KEY ("diagnoses_id") REFERENCES "diagnoses" ("id");

INSERT INTO doctors (name, department) VALUES ('John Johnson', 'radiology');
INSERT INTO doctors (name, department) VALUES ('Amy Amyson', 'er');
INSERT INTO doctors (name, department) VALUES ('Bono Bo', 'sicu');
INSERT INTO patients (name, birthday, insurance) VALUES ('Son Sonjohn', '1970-07-07', 'The Blue One'); 
INSERT INTO patients (name, birthday, insurance) VALUES ('Monami Sonai', '1981-03-18', 'The Green One'); 
INSERT INTO patients (name, birthday, insurance) VALUES ('Harold Faltermeyer', '1965-10-26', 'The Purple One'); 
INSERT INTO diseases (name, description) VALUES ('The Pox', 'A pox like experience.');
INSERT INTO diseases (name, description) VALUES ('Epoxy', 'A sticky situation.');
INSERT INTO diseases (name, description) VALUES ('Pocky', 'You will feel crumby.');
INSERT INTO diagnoses (visit_id, disease_id, comments) VALUES (1, 1, 'Looks poxy.');
INSERT INTO diagnoses (visit_id, disease_id, comments) VALUES (2, 2, 'Kinda stuck.');
INSERT INTO diagnoses (visit_id, disease_id, comments) VALUES (3, 3, 'Crumbs in bed.'); 
INSERT INTO visits (datetime, patient_id, doctor_id, diagnoses_id) VALUES ('2022-01-02', 1, 1, 1);
INSERT INTO visits (datetime, patient_id, doctor_id, diagnoses_id) VALUES ('2022-02-03', 2, 2, 2);
INSERT INTO visits (datetime, patient_id, doctor_id, diagnoses_id) VALUES ('2022-03-04', 3, 3, 3);
INSERT INTO visits (datetime, patient_id, doctor_id, diagnoses_id) VALUES ('2022-04-05', 1, 2, 2);
INSERT INTO visits (datetime, patient_id, doctor_id, diagnoses_id) VALUES ('2022-05-06', 1, 3, 3); 

-- Queries:
-- A lot of these were just for my benefit, but the main ones that I needed to be sure I understood are these first few:

-- medschema_db=# SELECT distinct doctors.name as dr, patients.name as pa FROM visits JOIN doctors on visits.doctor_id = doctors.id JOIN patients ON visits.patient_id = patients.id;
--       dr      |         pa
-- ----------------------------------------
--  Amy Amyson   | Monami Sonai
--  Bono Bo      | Harold Faltermeyer
--  Amy Amyson   | Son Sonjohn
--  John Johnson | Son Sonjohn
--  Bono Bo      | Son Sonjohn
-- (5 rows)

-- The same above with table aliases:
-- medschema_db=# SELECT d.name as dr, p.name as pa FROM visits v JOIN doctors d ON v.doctor_id = d.id JOIN patients p ON v.patient_id = p.id;
--       dr      |         pa
-- --------------+--------------------
--  John Johnson | Son Sonjohn
--  Amy Amyson   | Monami Sonai
--  Bono Bo      | Harold Faltermeyer
--  Amy Amyson   | Son Sonjohn
--  Bono Bo      | Son Sonjohn
-- (5 rows)

-- And this was an exercise in learning how to reach table data separated via an intermediary table:

-- medschema_db=# select visits.diagnoses_id, diagnoses.disease_id, diseases.name FROM visits JOIN diagnoses ON diagnoses.id = visits.diagnoses_id JOIN diseases ON diseases.id = diagnoses.disease_id where visits.id=4;
--  diagnoses_id | disease_id |  name
-- --------------+------------+---------
--             1 |          1 | The Pox
-- (1 row)

-- And getting just the disease name for the related visit (with an intermediary diagnoses table):
-- medschema_db=# select visits.diagnoses_id, diseases.name FROM visits JOIN diagnoses ON diagnoses.id = visits.diagnoses_i
-- d JOIN diseases ON diseases.id = diagnoses.disease_id where visits.id=5;
--  diagnoses_id | name
-- --------------+-------
--             2 | Epoxy
-- (1 row)

------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
-- The rest of these are simply walking through the SQL videos to test queries:

-- medschema_db=# \dt
--          List of relations
--  Schema |   Name    | Type  | Owner
-- --------+-----------+-------+-------
--  public | diagnoses | table | kodai
--  public | diseases  | table | kodai
--  public | doctors   | table | kodai
--  public | patients  | table | kodai
--  public | visits    | table | kodai

-- medschema_db=# SELECT * FROM doctors;
--  id |     name     | department
-- ----+--------------+------------
--   1 | John Johnson | radiology
--   2 | Amy Amyson   | er
--   3 | Bono Bo      | sicu

--   medschema_db=# SELECT * FROM patients;
--  id |        name        |  birthday  |   insurance
-- ----+--------------------+------------+----------------
--   1 | Son Sonjohn        | 1970-07-07 | The Blue One
--   2 | Monami Sonai       | 1981-03-18 | The Green One
--   3 | Harold Faltermeyer | 1965-10-26 | The Purple One
-- (3 rows)

-- medschema_db=# SELECT * FROM diseases;
--  id |  name   |      description
-- ----+---------+------------------------
--   1 | The Pox | A pox like experience.
--   2 | Epoxy   | A sticky situation.
--   3 | Pocky   | You will feel crumby.
-- (3 rows)

-- medschema_db=# SELECT * FROM diagnoses;
--  id | visit_id | disease_id |    comments
-- ----+----------+------------+----------------
--   1 |        1 |          1 | Looks poxy.
--   2 |        2 |          2 | Kinda stuck.
--   3 |        3 |          3 | Crumbs in bed.
-- (3 rows)

-- medschema_db=# SELECT * FROM visits;
--  id |  datetime  | patient_id | doctor_id | diagnoses_id
-- ----+------------+------------+-----------+--------------
--   1 | 2022-01-02 |          1 |         1 |            1
--   2 | 2022-02-03 |          2 |         2 |            2
--   3 | 2022-03-04 |          3 |         3 |            3
--   4 | 2022-04-05 |          1 |         2 |            1
--   5 | 2022-05-06 |          1 |         3 |            2
-- (5 rows)

-- medschema_db=# SELECT patients.name, visits.datetime FROM patients JOIN visits ON patients.id = patient_id;
--         name        |  datetime
-- --------------------+------------
--  Son Sonjohn        | 2022-01-02
--  Monami Sonai       | 2022-02-03
--  Harold Faltermeyer | 2022-03-04
--  Son Sonjohn        | 2022-04-05
--  Son Sonjohn        | 2022-05-06
-- (5 rows)

-- medschema_db=# SELECT doctors.name, visits.datetime FROM doctors JOIN visits ON doctors.id = doctor_id;
--      name     |  datetime
-- --------------+------------
--  John Johnson | 2022-01-02
--  Amy Amyson   | 2022-02-03
--  Bono Bo      | 2022-03-04
--  Amy Amyson   | 2022-04-05
--  Bono Bo      | 2022-05-06
-- (5 rows)

-- medschema_db=# SELECT datetime FROM visits WHERE patient_id = 1 OR doctor_id = 2;
--   datetime
-- ------------
--  2022-01-02
--  2022-02-03
--  2022-04-05
--  2022-05-06
-- (4 rows)

-- medschema_db=# SELECT datetime FROM visits WHERE patient_id = 1 AND doctor_id = 2;
--   datetime
-- ------------
--  2022-04-05
-- (1 row)

-- medschema_db=# SELECT datetime  FROM visits WHERE doctor_id IN (1, 2);
--   datetime
-- ------------
--  2022-01-02
--  2022-02-03
--  2022-04-05
-- (3 rows)

-- medschema_db=# SELECT COUNT(*) FROM visits;
--  count
-- -------
--      5
-- (1 row)

-- SELECT COUNT(doctor_id) FROM visits WHERE doctor_id = 1;

-- medschema_db=# SELECT COUNT(doctor_id) FROM visits WHERE doctor_id = 1;
--  count
-- -------
--      1
-- (1 row)

-- medschema_db=# SELECT COUNT(doctor_id) FROM visits WHERE doctor_id = 2;
--  count
-- -------
--      2
-- (1 row)

-- medschema_db=# SELECT COUNT(doctor_id) AS visits_per_doctor FROM visits GROUP BY patient_id;
--  visits_per_doctor
-- -------------------
--                  1
--                  1
--                  3
-- (3 rows)

-- medschema_db=# SELECT doctor_id, COUNT(doctor_id) AS visits_per_doctor FROM visits GROUP BY doctor_id;
--  doctor_id | visits_per_doctor
-- -----------+-------------------
--          3 |                 2
--          2 |                 2
--          1 |                 1
-- (3 rows)

-- When you have a COUNT(), the GROUP BY has to reference the initial selection.

-- medschema_db=# SELECT doctor_id, count(*) from visits group by doctor_id having count(*) >= 2;
--  doctor_id | count
-- -----------+-------
--          3 |     2
--          2 |     2
-- (2 rows)

-- medschema_db=# SELECT datetime from visits order by datetime asc;
--   datetime
-- ------------
--  2022-01-02
--  2022-02-03
--  2022-03-04
--  2022-04-05
--  2022-05-06
-- (5 rows)

-- medschema_db=# SELECT datetime from visits order by datetime asc limit 3;
--   datetime
-- ------------
--  2022-01-02
--  2022-02-03
--  2022-03-04
-- (3 rows)

-- medschema_db=# SELECT datetime from visits order by datetime asc offset 2;
--   datetime
-- ------------
--  2022-03-04
--  2022-04-05
--  2022-05-06
-- (3 rows)

-- medschema_db=# SELECT * FROM doctors WHERE id NOT IN (1);
--  id |    name    | department
-- ----+------------+------------
--   2 | Amy Amyson | er
--   3 | Bono Bo    | sicu
-- (2 rows)

-- medschema_db=# SELECT * FROM doctors WHERE name LIKE ('%son%');
--  id |     name     | department
-- ----+--------------+------------
--   1 | John Johnson | radiology
--   2 | Amy Amyson   | er
-- (2 rows)

-- medschema_db=# SELECT * FROM doctors WHERE name ILIKE ('amy%');
--  id |    name    | department
-- ----+------------+------------
--   2 | Amy Amyson | er
-- (1 row)

-- Aliases: no capitalization and periods won't work:

-- medschema_db=# SELECT name AS Dr FROM doctors;
--       dr
-- --------------
--  John Johnson
--  Amy Amyson
--  Bono Bo
-- (3 rows)

-- medschema_db=# SELECT distinct doctor_id, doctors.name
-- medschema_db-# FROM visits
-- medschema_db-# JOIN doctors
-- medschema_db-# ON doctors.id = visits.doctor_id;
--  doctor_id |     name
-- -----------+--------------
--          2 | Amy Amyson
--          3 | Bono Bo
--          1 | John Johnson
-- (3 rows)

-- IS THE SAME AS

-- medschema_db=# SELECT distinct doctor_id, doctors.name
-- FROM visits
-- JOIN doctors
-- ON visits.doctor_id = doctors.id;
--  doctor_id |     name
-- -----------+--------------
--          2 | Amy Amyson
--          3 | Bono Bo
--          1 | John Johnson
-- (3 rows)

-- Because the equality condition doesn't care which is on which side, so long as it's specific.

-- medschema_db=# SELECT * FROM visits JOIN doctors ON visits.doctor_id = doctors.id;
--  id |  datetime  | patient_id | doctor_id | diagnoses_id | id |     name     | department
-- ----+------------+------------+-----------+--------------+----+--------------+------------
--   1 | 2022-01-02 |          1 |         1 |            1 |  1 | John Johnson | radiology
--   2 | 2022-02-03 |          2 |         2 |            2 |  2 | Amy Amyson   | er
--   3 | 2022-03-04 |          3 |         3 |            3 |  3 | Bono Bo      | sicu
--   4 | 2022-04-05 |          1 |         2 |            1 |  2 | Amy Amyson   | er
--   5 | 2022-05-06 |          1 |         3 |            2 |  3 | Bono Bo      | sicu
-- (5 rows)

-- medschema_db=# SELECT name, COUNT(*) FROM visits JOIN doctors ON visits.doctor_id = doctors.id GROUP BY doctors.id;
--      name     | count
-- --------------+-------
--  Amy Amyson   |     2
--  Bono Bo      |     2
--  John Johnson |     1
-- (3 rows)

--  medschema_db=# SELECT name, COUNT(*) FROM visits JOIN patients ON visits.patient_id = patients.id GROUP BY patients.id;
--         name        | count
-- --------------------+-------
--  Monami Sonai       |     1
--  Harold Faltermeyer |     1
--  Son Sonjohn        |     3
-- (3 rows)