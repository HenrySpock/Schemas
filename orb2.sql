DROP DATABASE IF EXISTS orb2db;
CREATE DATABASE orb2db;
\c orb2db

CREATE TABLE "planets" (
  "id" SERIAL PRIMARY KEY,
  "name" text,
  "orbital_period_in_years" float,
  "orbit_foci_id" int,
  "galaxy_id" int,
  "moons_id" int
);

CREATE TABLE "orbit_foci" (
  "id" SERIAL PRIMARY KEY,
  "name" text
);

CREATE TABLE "galaxy" (
  "id" SERIAL PRIMARY KEY,
  "name" text
);

CREATE TABLE "moons" (
  "id" SERIAL PRIMARY KEY,
  "name_s" text[]
);

ALTER TABLE "planets" ADD FOREIGN KEY ("orbit_foci_id") REFERENCES "orbit_foci" ("id");

ALTER TABLE "planets" ADD FOREIGN KEY ("galaxy_id") REFERENCES "galaxy" ("id");

ALTER TABLE "planets" ADD FOREIGN KEY ("moons_id") REFERENCES "moons" ("id");

INSERT INTO moons (name_s) VALUES ('{"The Moon"}');
INSERT INTO moons (name_s) VALUES ('{"Phobos", "Deimos"}');
INSERT INTO moons (name_s) VALUES ('{}');
INSERT INTO moons (name_s) VALUES ('{"Naiad", "Thalassa", "Despina", "Galatea", "Larissa", "S/2004 N 1", "Proteus", "Triton", "Nereid", "Halimede", "Sao", "Laomedeia", "Psamathe", "Neso"}');
INSERT INTO moons (name_s) VALUES ('{}');
INSERT INTO moons (name_s) VALUES ('{}');

INSERT INTO galaxy (name) VALUES ('Milky Way'); 

INSERT INTO orbit_foci (name) VALUES ('The Sun');
INSERT INTO orbit_foci (name) VALUES ('Proxima Centauri');
INSERT INTO orbit_foci (name) VALUES ('Gliese 876');

INSERT INTO planets (name, orbital_period_in_years, orbit_foci_id, galaxy_id, moons_id) VALUES ('Earth', 1.00, 1, 1, 1);
INSERT INTO planets (name, orbital_period_in_years, orbit_foci_id, galaxy_id, moons_id) VALUES ('Mars', 1.88, 1, 1, 2);
INSERT INTO planets (name, orbital_period_in_years, orbit_foci_id, galaxy_id, moons_id) VALUES ('Venus', 0.62, 1, 1, 3);
INSERT INTO planets (name, orbital_period_in_years, orbit_foci_id, galaxy_id, moons_id) VALUES ('Neptune', 164.8, 1, 1, 4);
INSERT INTO planets (name, orbital_period_in_years, orbit_foci_id, galaxy_id, moons_id) VALUES ('Proxima Centauri b', 0.03, 2, 1, 5);
INSERT INTO planets (name, orbital_period_in_years, orbit_foci_id, galaxy_id, moons_id) VALUES ('Gliese 876 b', 0.23, 3, 1, 6);