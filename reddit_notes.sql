-- CREATE TABLE posts (
--     title TEXT,
--     username TEXT,
--     link TEXT
-- )

-- Default value for unspecified field is "NULL."

DROP DATABASE reddit_db;
CREATE DATABASE reddit_db;
\c reddit_db

CREATE TABLE users (
-- id SERIAL UNIQUE NOT NULL, is the same as
id SERIAL PRIMARY KEY,
username VARCHAR(15) UNIQUE NOT NULL,
password VARCHAR(20) NOT NULL
);

CREATE TABLE comments
(
id SERIAL PRIMARY KEY,
user_id INTEGER REFERENCES users ON DELETE CASCADE,
comment_text TEXT NOT NULL
);

-- Note that the table 'subreddits' references the table 'users' - 
-- 'users' must be created first or 'subreddits' can't be created.
CREATE TABLE subreddits (
-- id SERIAL UNIQUE NOT NULL, is the same as
id SERIAL PRIMARY KEY,
-- Foreign Key:
-- user_id INTEGER NOT NULL REFERENCES users,
-- We have to remove the 'NOT NULL' to test cascading behavior.
user_id INTEGER REFERENCES users ON DELETE SET NULL,
-- You could make this explicit:
-- user_id INTEGER REFERENCES users(id),
-- But the default is in fact the id columns.
name VARCHAR(15) NOT NULL,
description TEXT,
subscribers INTEGER CHECK (subscribers > 0) DEFAULT 1,
is_private BOOLEAN DEFAULT false
);

INSERT INTO users (username, password)
VALUES 
('graylady', 'askldjas'),
('stevie-chicks', 'asdkljasl');

INSERT INTO subreddits(name, user_id)
VALUES 
('chickens', 2),
('waterlovers', 1);