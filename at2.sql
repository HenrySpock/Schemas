DROP DATABASE IF EXISTS airtrafficdb;
CREATE DATABASE airtrafficdb;
\c airtrafficdb

CREATE TABLE "tickets" (
  "id" SERIAL PRIMARY KEY,
  "passenger_id" int,
  "flight_id" int
);

CREATE TABLE "passenger" (
  "id" SERIAL PRIMARY KEY,
  "last_name" text,
  "first_name" text
);

CREATE TABLE "flight" (
  "id" SERIAL PRIMARY KEY,
  "flight_num" text,
  "airline_id" int,
  "route_id" int,
  "seat" text,
  "departure" timestamp,
  "arrival" timestamp
);

CREATE TABLE "airline" (
  "id" SERIAL PRIMARY KEY,
  "name" text
);

CREATE TABLE "route" (
  "id" SERIAL PRIMARY KEY,
  "fr_airport_id" int,
  "to_airport_id" int
);

CREATE TABLE "airport" (
  "id" SERIAL PRIMARY KEY,
  "country" text,
  "city" text,
  "name" text,
  "iata" text
);

ALTER TABLE "tickets" ADD FOREIGN KEY ("passenger_id") REFERENCES "passenger" ("id");

ALTER TABLE "tickets" ADD FOREIGN KEY ("flight_id") REFERENCES "flight" ("id");

ALTER TABLE "flight" ADD FOREIGN KEY ("airline_id") REFERENCES "airline" ("id");

ALTER TABLE "flight" ADD FOREIGN KEY ("route_id") REFERENCES "route" ("id");

ALTER TABLE "route" ADD FOREIGN KEY ("fr_airport_id") REFERENCES "airport" ("id");

ALTER TABLE "route" ADD FOREIGN KEY ("to_airport_id") REFERENCES "airport" ("id");

INSERT INTO airport (country, city, name, iata) VALUES ('United States', 'Washington DC', 'Dulles International Airport', 'IAD');
INSERT INTO airport (country, city, name, iata) VALUES ('United States', 'Seattle', 'Seattle-Tacoma International Airport', 'SEA');
INSERT INTO airport (country, city, name, iata) VALUES ('United States', 'Los Angeles', 'Los Angeles International Airport', 'LAX' );
INSERT INTO airport (country, city, name, iata) VALUES ('United States', 'Las Vegas', 'Las Vegas Airport', 'LAS');
INSERT INTO airport (country, city, name, iata) VALUES ('United States', 'New York', 'John F. Kennedy International Airport', 'JFK');
INSERT INTO airport (country, city, name, iata) VALUES ('United States', 'Charlotte', 'Charlotte Douglas International Airport', 'CLT');
INSERT INTO airport (country, city, name, iata) VALUES ('United States', 'Cedar Rapids', 'Eastern Iowa Airport', 'CID');
INSERT INTO airport (country, city, name, iata) VALUES ('United States', 'Chicago', 'Chicago OHare International Airport', 'ORD');
INSERT INTO airport (country, city, name, iata) VALUES ('United States', 'New Orleans', 'Louis Armstrong new Orleans International Airport', 'MSY');
INSERT INTO airport (country, city, name, iata) VALUES ('Japan', 'Tokyo', 'Haneda International Airport', 'HND');
INSERT INTO airport (country, city, name, iata) VALUES ('United Kingdom', 'London', 'Heathrow Airport', 'LHR');
INSERT INTO airport (country, city, name, iata) VALUES ('Mexico', 'Mexico City', 'Mexico City International Airport', 'MEX');
INSERT INTO airport (country, city, name, iata) VALUES ('France', 'Paris', 'Paris Charles de Gaulle Airport', 'CDG');
INSERT INTO airport (country, city, name, iata) VALUES ('Morocco', 'Casablanca', 'Mohammed V International Airport', 'CMN');
INSERT INTO airport (country, city, name, iata) VALUES ('United Arab Emirates', 'Dubai', 'Dubai Internatinonal Airport', 'DXB');
INSERT INTO airport (country, city, name, iata) VALUES ('China', 'Beijing', 'Beijing Capital International Airport', 'PEK');
INSERT INTO airport (country, city, name, iata) VALUES ('Brazil', 'Sao Paolo', 'Sao Paulo Guarulhos International Airport', 'GRU');
INSERT INTO airport (country, city, name, iata) VALUES ('Chile', 'Santiago', 'Arturo Merino Benitez International Airport', 'SCL');  

INSERT INTO route (fr_airport_id, to_airport_id) VALUES (1, 2);
INSERT INTO route (fr_airport_id, to_airport_id) VALUES (10, 11);
INSERT INTO route (fr_airport_id, to_airport_id) VALUES (3, 4);
INSERT INTO route (fr_airport_id, to_airport_id) VALUES (2, 12);
INSERT INTO route (fr_airport_id, to_airport_id) VALUES (13, 14);
INSERT INTO route (fr_airport_id, to_airport_id) VALUES (15, 16);
INSERT INTO route (fr_airport_id, to_airport_id) VALUES (5, 6);
INSERT INTO route (fr_airport_id, to_airport_id) VALUES (7, 8);
INSERT INTO route (fr_airport_id, to_airport_id) VALUES (6, 9);
INSERT INTO route (fr_airport_id, to_airport_id) VALUES (17, 18);

INSERT INTO airline (name) VALUES ('United');
INSERT INTO airline (name) VALUES ('British Airways');
INSERT INTO airline (name) VALUES ('Delta');
INSERT INTO airline (name) VALUES ('TUI Fly Belgium');
INSERT INTO airline (name) VALUES ('Air China');
INSERT INTO airline (name) VALUES ('American Airlines');
INSERT INTO airline (name) VALUES ('Avianca Brasil');

INSERT INTO flight (flight_num, airline_id, route_id, seat, departure, arrival) VALUES (0001, 1, 1, '33B', '2018-04-08 09:00:00', '2018-04-08 12:00:00');
INSERT INTO flight (flight_num, airline_id, route_id, seat, departure, arrival) VALUES (0002, 2, 2, '8A', '2018-12-19 12:45:00', '2018-12-19 16:15:00');
INSERT INTO flight (flight_num, airline_id, route_id, seat, departure, arrival) VALUES (0003, 3, 3, '12F', '2018-01-02 07:00:00', '2018-01-02 08:03:00');
INSERT INTO flight (flight_num, airline_id, route_id, seat, departure, arrival) VALUES (0004, 3, 4, '20A', '2018-04-15 16:50:00', '2018-04-15 21:00:00');
INSERT INTO flight (flight_num, airline_id, route_id, seat, departure, arrival) VALUES (0005, 4, 5, '23D', '2018-08-01 18:30:00', '2018-08-01 21:50:00');
INSERT INTO flight (flight_num, airline_id, route_id, seat, departure, arrival) VALUES (0006, 5, 6, '18C', '2018-10-31 01:15:00', '2018-10-31 12:55:00');
INSERT INTO flight (flight_num, airline_id, route_id, seat, departure, arrival) VALUES (0007, 1, 7, '9E', '2019-02-06 06:00:00', '2019-02-06 07:47:00');
INSERT INTO flight (flight_num, airline_id, route_id, seat, departure, arrival) VALUES (0008, 6, 8, '1A', '2018-12-22 14:42:00', '2018-12-22 15:56:00');
INSERT INTO flight (flight_num, airline_id, route_id, seat, departure, arrival) VALUES (0009, 6, 9, '32B', '2019-02-06 16:28:00', '2019-02-06 19:18:00');
INSERT INTO flight (flight_num, airline_id, route_id, seat, departure, arrival) VALUES (0010, 7, 10, '10D', '2019-01-20 19:30:00', '2019-01-20 22:45:00');

INSERT INTO passenger (last_name, first_name) VALUES ('Finch', 'Jennifer');
INSERT INTO passenger (last_name, first_name) VALUES ('Gathercoal', 'Thadeus');
INSERT INTO passenger (last_name, first_name) VALUES ('Pauley', 'Sonja');
INSERT INTO passenger (last_name, first_name) VALUES ('Finch', 'Jennifer');
INSERT INTO passenger (last_name, first_name) VALUES ('Skeleton', 'Waneta');
INSERT INTO passenger (last_name, first_name) VALUES ('Gathercoal', 'Thadeus');
INSERT INTO passenger (last_name, first_name) VALUES ('Wycliff', 'Berkie');
INSERT INTO passenger (last_name, first_name) VALUES ('Leathes', 'Alvin');
INSERT INTO passenger (last_name, first_name) VALUES ('Wycliff', 'Berkie');
INSERT INTO passenger (last_name, first_name) VALUES ('Squibbes', 'Cory');

INSERT INTO tickets (passenger_id, flight_id) VALUES (1, 1);
INSERT INTO tickets (passenger_id, flight_id) VALUES (2, 2);
INSERT INTO tickets (passenger_id, flight_id) VALUES (3, 3);
INSERT INTO tickets (passenger_id, flight_id) VALUES (4, 4);
INSERT INTO tickets (passenger_id, flight_id) VALUES (5, 5);
INSERT INTO tickets (passenger_id, flight_id) VALUES (6, 6);
INSERT INTO tickets (passenger_id, flight_id) VALUES (7, 7);
INSERT INTO tickets (passenger_id, flight_id) VALUES (8, 8);
INSERT INTO tickets (passenger_id, flight_id) VALUES (9, 9);
INSERT INTO tickets (passenger_id, flight_id) VALUES (10, 10);