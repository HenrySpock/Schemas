-- from the terminal run:
-- psql < music.sql

DROP DATABASE IF EXISTS mu2db;
CREATE DATABASE mu2db;
\c mu2db

CREATE TABLE "songs" (
  "id" SERIAL PRIMARY KEY,
  "title" text,
  "duration_in_seconds" int,
  "release_date" date,
  "artists_id" int,
  "album_id" int,
  "producers_id" int
);

CREATE TABLE "artists" (
  "id" SERIAL PRIMARY KEY,
  "name_s" text[]
);

CREATE TABLE "album" (
  "id" SERIAL PRIMARY KEY,
  "title" text
);

CREATE TABLE "producers" (
  "id" SERIAL PRIMARY KEY,
  "name_s" text[]
);

ALTER TABLE "songs" ADD FOREIGN KEY ("artists_id") REFERENCES "artists" ("id");

ALTER TABLE "songs" ADD FOREIGN KEY ("album_id") REFERENCES "album" ("id");

ALTER TABLE "songs" ADD FOREIGN KEY ("producers_id") REFERENCES "producers" ("id");

INSERT INTO producers (name_s) VALUES ('{"Dust Brothers", "Stephen Lironi"}');
INSERT INTO producers (name_s) VALUES ('{"Roy Thomas Baker"}');
INSERT INTO producers (name_s) VALUES ('{"Walter Afanasieff"}');
INSERT INTO producers (name_s) VALUES ('{"Benjamin Rice"}');
INSERT INTO producers (name_s) VALUES ('{"Rick Parashar"}');
INSERT INTO producers (name_s) VALUES ('{"Al Shux"}');
INSERT INTO producers (name_s) VALUES ('{"Max Martin", "Cirkut"}');
INSERT INTO producers (name_s) VALUES ('{"Shellback", "Benny Blanco"}');
INSERT INTO producers (name_s) VALUES ('{"The Matrix"}');
INSERT INTO producers (name_s) VALUES ('{"Darkchild"}');

INSERT INTO album (title) VALUES ('Middle of Nowhere');
INSERT INTO album (title) VALUES ('A Night at the Opera');
INSERT INTO album (title) VALUES ('Daydream');
INSERT INTO album (title) VALUES ('A Star Is Born');
INSERT INTO album (title) VALUES ('Silver Side Up');
INSERT INTO album (title) VALUES ('The Blueprint 3');
INSERT INTO album (title) VALUES ('Prism');
INSERT INTO album (title) VALUES ('Hands All Over');
INSERT INTO album (title) VALUES ('Let Go');
INSERT INTO album (title) VALUES ('The Writing''s on the Wall');

INSERT INTO artists (name_s) VALUES ('{"Hanson"}');
INSERT INTO artists (name_s) VALUES ('{"Queen"}');
INSERT INTO artists (name_s) VALUES ('{"Mariah Cary", "Boyz II Men"}');
INSERT INTO artists (name_s) VALUES ('{"Lady Gaga", "Bradley Cooper"}');
INSERT INTO artists (name_s) VALUES ('{"Nickelback"}');
INSERT INTO artists (name_s) VALUES ('{"Jay Z", "Alicia Keys"}');
INSERT INTO artists (name_s) VALUES ('{"Katy Perry", "Juicy J"}');
INSERT INTO artists (name_s) VALUES ('{"Maroon 5", "Christina Aguilera"}');
INSERT INTO artists (name_s) VALUES ('{"Avril Lavigne"}');
INSERT INTO artists (name_s) VALUES ('{"Destiny''s Child"}');

INSERT INTO songs (title, duration_in_seconds, release_date, artists_id, album_id, producers_id) VALUES ('MMMBop', 238, '04-15-1997', 1, 1, 1);
INSERT INTO songs (title, duration_in_seconds, release_date, artists_id, album_id, producers_id) VALUES ('Bohemian Rhapsody', 355, '10-31-1975', 2, 2, 2);
INSERT INTO songs (title, duration_in_seconds, release_date, artists_id, album_id, producers_id) VALUES ('One Sweet Day', 282, '11-14-1995', 3, 3, 3);
INSERT INTO songs (title, duration_in_seconds, release_date, artists_id, album_id, producers_id) VALUES ('Shallow', 216, '09-27-2018', 4, 4, 4);
INSERT INTO songs (title, duration_in_seconds, release_date, artists_id, album_id, producers_id) VALUES ('How You Remind Me', 223, '08-21-2001', 5, 5, 5);
INSERT INTO songs (title, duration_in_seconds, release_date, artists_id, album_id, producers_id) VALUES ('New York State of Mind', 276, '10-20-2009', 6, 6, 6);
INSERT INTO songs (title, duration_in_seconds, release_date, artists_id, album_id, producers_id) VALUES ('Dark Horse', 215, '12-17-2013', 7, 7, 7);
INSERT INTO songs (title, duration_in_seconds, release_date, artists_id, album_id, producers_id) VALUES ('Moves Like Jagger', 201, '06-21-2011', 8, 8, 8);
INSERT INTO songs (title, duration_in_seconds, release_date, artists_id, album_id, producers_id) VALUES ('Complicated', 244, '05-14-2002', 9, 9, 9);
INSERT INTO songs (title, duration_in_seconds, release_date, artists_id, album_id, producers_id) VALUES ('Say My Name', 240, '11-07-1999', 10, 10, 10);