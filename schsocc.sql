DROP DATABASE IF EXISTS leaguedb;
CREATE DATABASE leaguedb;
\c leaguedb

CREATE TABLE "team" (
  "id" SERIAL PRIMARY KEY,
  "name" text,
  "city" text,
  "rank_id" int
);

CREATE TABLE "player" (
  "id" SERIAL PRIMARY KEY,
  "name" text,
  "team_id" int
);

CREATE TABLE "refs" (
  "id" SERIAL PRIMARY KEY,
  "name" text
);

CREATE TABLE "matches" (
  "id" SERIAL PRIMARY KEY,
  "city" text,
  "home_t_id" int,
  "away_t_id" int,
  "season_id" int,
  "head_ref_id" int,
  "ass_ref1_id" int,
  "ass_ref2_id" int,
  "fourth_id" int,
  "var_id" int
);

CREATE TABLE "goal" (
  "id" SERIAL PRIMARY KEY, 
  "match_id" int,
  "player_id" int
);

CREATE TABLE "season" (
  "id" SERIAL PRIMARY KEY,
  "start_date" date,
  "end_date" date
);

CREATE TABLE "outcome" (
  "id" SERIAL PRIMARY KEY,
  "match_id" int,
  "team_id" int,
  "wld" text
);

ALTER TABLE "player" ADD FOREIGN KEY ("team_id") REFERENCES "team" ("id");

ALTER TABLE "matches" ADD FOREIGN KEY ("home_t_id") REFERENCES "team" ("id");

ALTER TABLE "matches" ADD FOREIGN KEY ("away_t_id") REFERENCES "team" ("id");
 
ALTER TABLE "season" ADD FOREIGN KEY ("id") REFERENCES "matches" ("id");

ALTER TABLE "goal" ADD FOREIGN KEY ("match_id") REFERENCES "matches" ("id");

ALTER TABLE "goal" ADD FOREIGN KEY ("player_id") REFERENCES "player" ("id");



INSERT INTO team (name, city, rank_id) VALUES ('Johnnies No Hands', 'Manchester', '1');
INSERT INTO team (name, city, rank_id) VALUES ('The Yanks', 'Berwick-upon-Tweed', '2');
INSERT INTO team (name, city, rank_id) VALUES ('The Wet Chips', 'London', '3');
INSERT INTO player (name, team_id) VALUES ('Norman Conquest', '1');
INSERT INTO player (name, team_id) VALUES ('Peter Pander', '2');
INSERT INTO player (name, team_id) VALUES ('David Goodwillie', '3');
INSERT INTO matches (city, home_t_id, away_t_id, season_id, head_ref_id, ass_ref1_id, ass_ref2_id, fourth_id, var_id) VALUES ('Manchester', 1, 2, 3, 1, 2, 3, 4, 5);
INSERT INTO matches (city, home_t_id, away_t_id, season_id, head_ref_id, ass_ref1_id, ass_ref2_id, fourth_id, var_id) VALUES ('Manchester', 1, 3, 3, 1, 2, 3, 4, 5);
INSERT INTO matches (city, home_t_id, away_t_id, season_id, head_ref_id, ass_ref1_id, ass_ref2_id, fourth_id, var_id) VALUES ('Berwick_upon_Tweed', 2, 1, 3, 6, 7, 8, 9, 10);
INSERT INTO matches (city, home_t_id, away_t_id, season_id, head_ref_id, ass_ref1_id, ass_ref2_id, fourth_id, var_id) VALUES ('Berwick_upon_Tweed', 2, 3, 3, 6, 7, 8, 9, 10);
INSERT INTO matches (city, home_t_id, away_t_id, season_id, head_ref_id, ass_ref1_id, ass_ref2_id, fourth_id, var_id) VALUES ('London', 3, 1, 3, 11, 12, 13, 14, 15);
INSERT INTO matches (city, home_t_id, away_t_id, season_id, head_ref_id, ass_ref1_id, ass_ref2_id, fourth_id, var_id) VALUES ('London', 3, 2, 3, 11, 12, 13, 14, 15);
INSERT INTO season (start_date, end_date) VALUES ('2020-04-29', '2020-06-17');
INSERT INTO season (start_date, end_date) VALUES ('2021-04-29', '2021-06-17');
INSERT INTO season (start_date, end_date) VALUES ('2022-04-29', '2022-06-17');
INSERT INTO goal (match_id, player_id) VALUES (1, 1);
INSERT INTO goal (match_id, player_id) VALUES (2, 1);
INSERT INTO goal (match_id, player_id) VALUES (3, 1);
INSERT INTO goal (match_id, player_id) VALUES (5, 1);
INSERT INTO goal (match_id, player_id) VALUES (1, 2);
INSERT INTO goal (match_id, player_id) VALUES (3, 2);
INSERT INTO goal (match_id, player_id) VALUES (4, 2);
INSERT INTO goal (match_id, player_id) VALUES (6, 2);
INSERT INTO goal (match_id, player_id) VALUES (2, 3);
INSERT INTO goal (match_id, player_id) VALUES (4, 3);
INSERT INTO goal (match_id, player_id) VALUES (5, 3);
INSERT INTO goal (match_id, player_id) VALUES (6, 3);
INSERT INTO refs (name) VALUES ('This Guy');
INSERT INTO refs (name) VALUES ('That Guy');
INSERT INTO refs (name) VALUES ('No That Other Guy');
INSERT INTO refs (name) VALUES ('Yeah Him');
INSERT INTO refs (name) VALUES ('Derek');
INSERT INTO refs (name) VALUES ('Son of This Guy');
INSERT INTO refs (name) VALUES ('Son of That Guy');
INSERT INTO refs (name) VALUES ('Son of No That Other Guy');
INSERT INTO refs (name) VALUES ('Son of Yeah Him');
INSERT INTO refs (name) VALUES ('Son of Derek');
INSERT INTO refs (name) VALUES ('Return of This Guy');
INSERT INTO refs (name) VALUES ('Return of That Guy');
INSERT INTO refs (name) VALUES ('Return of No That Other Guy');
INSERT INTO refs (name) VALUES ('Return of Yeah Him');
INSERT INTO refs (name) VALUES ('Return of Derek');
INSERT INTO outcome (match_id, team_id, wld) VALUES (1, 1, 'w');
INSERT INTO outcome (match_id, team_id, wld) VALUES (1, 2, 'l');
INSERT INTO outcome (match_id, team_id, wld) VALUES (2, 1, 'w');
INSERT INTO outcome (match_id, team_id, wld) VALUES (2, 3, 'l');
INSERT INTO outcome (match_id, team_id, wld) VALUES (3, 2, 'l');
INSERT INTO outcome (match_id, team_id, wld) VALUES (3, 1, 'w');
INSERT INTO outcome (match_id, team_id, wld) VALUES (4, 2, 'l');
INSERT INTO outcome (match_id, team_id, wld) VALUES (4, 3, 'w');
INSERT INTO outcome (match_id, team_id, wld) VALUES (5, 3, 'w');
INSERT INTO outcome (match_id, team_id, wld) VALUES (5, 1, 'l');
INSERT INTO outcome (match_id, team_id, wld) VALUES (6, 3, 'l');
INSERT INTO outcome (match_id, team_id, wld) VALUES (6, 2, 'w');

ALTER TABLE "matches" ADD FOREIGN KEY ("head_ref_id") REFERENCES "refs" ("id"); 
ALTER TABLE "matches" ADD FOREIGN KEY ("ass_ref1_id") REFERENCES "refs" ("id"); 
ALTER TABLE "matches" ADD FOREIGN KEY ("ass_ref2_id") REFERENCES "refs" ("id"); 
ALTER TABLE "matches" ADD FOREIGN KEY ("fourth_id") REFERENCES "refs" ("id"); 
ALTER TABLE "matches" ADD FOREIGN KEY ("var_id") REFERENCES "refs" ("id"); 
 