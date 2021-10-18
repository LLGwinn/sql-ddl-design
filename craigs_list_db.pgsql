DROP DATABASE IF EXISTS  craigs_list_db;

CREATE DATABASE craigs_list_db;

\c craigs_list_db

CREATE TABLE regions
(
  id SERIAL PRIMARY KEY,
  region TEXT NOT NULL
);

CREATE TABLE categories
(
  id SERIAL PRIMARY KEY,
  category TEXT NOT NULL
);

CREATE TABLE users
(
  id SERIAL PRIMARY KEY,
  username TEXT UNIQUE NOT NULL,
  password TEXT NOT NULL,
  active BOOLEAN NOT NULL DEFAULT TRUE,
  pref_region INTEGER REFERENCES regions
);

CREATE TABLE posts
(
  id SERIAL PRIMARY KEY,
  user_id INTEGER REFERENCES users,
  title TEXT,
  post_text TEXT NOT NULL,
  location TEXT,
  region INTEGER REFERENCES regions,
  category INTEGER REFERENCES categories
);

INSERT INTO regions
(region)
VALUES
('West'),
('North'),
('South');

INSERT INTO categories
(category)
VALUES
('Spells'),
('Potions'),
('Monsters');

INSERT INTO users 
(username, password, active, pref_region)
VALUES
('hpotter', 'patronus', true, 3),
('hgranger', 'expeliarmus', false, 2);

INSERT INTO posts
(user_id, title, post_text, location, region, category)
VALUES
(1, 'help', 'I am trapped in the closet under the stairs.', 'Miami', 3, 2),
(2, 'update', 'I am at the top of my class.', 'Boston', 2, 1),
(1, 'meeting', 'Just met Hagrid. What a guy!', 'San Francisco', 1, 3);

