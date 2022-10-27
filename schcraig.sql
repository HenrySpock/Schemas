DROP DATABASE IF EXISTS crlistdb;
CREATE DATABASE crlistdb;
\c crlistdb

CREATE TABLE "region" (
  "id" SERIAL PRIMARY KEY,
  "region" text
);

CREATE TABLE "users" (
  "id" SERIAL PRIMARY KEY,
  "username" text,
  "password" varchar,
  "pref_region" text
);

CREATE TABLE "categories" (
  "id" SERIAL PRIMARY KEY,
  "cat_name" text
);

CREATE TABLE "posting" (
  "id" SERIAL PRIMARY KEY,
  "title" text,
  "description" text,
  "user_id" int,
  "region_id" int,
  "location" text,
  "cat_id" int
);

ALTER TABLE "posting" ADD FOREIGN KEY ("region_id") REFERENCES "region" ("id");

ALTER TABLE "posting" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "posting" ADD FOREIGN KEY ("cat_id") REFERENCES "categories" ("id");

INSERT INTO region (region) VALUES ('Houston, TX');
INSERT INTO region (region) VALUES ('Austin, TX');
INSERT INTO region (region) VALUES ('Dallas, TX');
INSERT INTO users (username, password, pref_region) VALUES ('Tom', 'mot1', 'Houston, TX');
INSERT INTO users (username, password, pref_region) VALUES ('Dick', 'kcid1', 'Austin, TX');
INSERT INTO users (username, password, pref_region) VALUES ('Harry', 'yrrah1', 'Dallas, TX'); 
INSERT INTO users (username) VALUES ('Tom');
INSERT INTO categories (cat_name) VALUES ('automotive');
INSERT INTO categories (cat_name) VALUES ('furniture');
INSERT INTO categories (cat_name) VALUES ('baby');
INSERT INTO posting (title, description, user_id, region_id, location, cat_id) VALUES ('A new car', 'A car that is not yet old', 1, 1, 'Montrose', 1);
INSERT INTO posting (title, description, user_id, region_id, location, cat_id) VALUES ('A table', 'No this is not a chair', 2, 2, 'Tarrytown', 2);
INSERT INTO posting (title, description, user_id, region_id, location, cat_id) VALUES ('PJs', 'Not intended for adult use', 3, 3, 'Lakewood', 3);

-- Queries:
-- crlistdb=# select * from region;
--  id |   region
-- ----+-------------
--   1 | Houston, TX
--   2 | Austin, TX
--   3 | Dallas, TX
-- (3 rows)

-- crlistdb=# select * from users;
--  id | username | password | pref_region
-- ----+----------+----------+-------------
--   1 | Tom      | mot1     | Houston, TX
--   2 | Dick     | kcid1    | Austin, TX
--   3 | Harry    | yrrah1   | Dallas, TX
--   4 | Tom      |          |
-- (4 rows)

-- crlistdb=# select * from categories;
--  id |  cat_name
-- ----+------------
--   1 | automotive
--   2 | furniture
--   3 | baby
-- (3 rows)

-- crlistdb=# select * from posting;
--  id |   title   |        description         | user_id | region_id | location  | cat_id
-- ----+-----------+----------------------------+---------+-----------+-----------+--------
--   1 | A new car | A car that is not yet old  |       1 |         1 | Montrose  |      1
--   2 | A table   | No this is not a chair     |       2 |         2 | Tarrytown |      2
--   3 | PJs       | Not intended for adult use |       3 |         3 | Lakewood  |      3
-- (3 rows)
 
-- crlistdb=# SELECT distinct posting.title as post, users.username as user FROM posting JOIN users on posting.user_id = users.id;
--    post    | user
-- -----------+-------
--  A new car | Tom
--  PJs       | Harry
--  A table   | Dick
-- (3 rows)