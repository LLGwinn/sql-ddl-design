DROP DATABASE IF EXISTS  med_ctr_db;

CREATE DATABASE med_ctr_db;

\c med_ctr_db

CREATE TABLE doctors
(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
  license_num TEXT UNIQUE NOT NULL
);

CREATE TABLE patients
(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL
);

CREATE TABLE diseases
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE dr_pt_relationships
(
  id SERIAL PRIMARY KEY,
  dr_id INTEGER REFERENCES doctors ON DELETE CASCADE,
  pt_id INTEGER REFERENCES patients ON DELETE CASCADE
);

CREATE TABLE pt_diagnoses
(
  id SERIAL PRIMARY KEY,
  pt_id INTEGER REFERENCES patients ON DELETE CASCADE,
  disease_id INTEGER REFERENCES diseases ON DELETE CASCADE
);

CREATE TABLE dr_specialties
(
  id SERIAL PRIMARY KEY,
  dr_id INTEGER REFERENCES doctors ON DELETE CASCADE,
  disease_id INTEGER REFERENCES diseases ON DELETE CASCADE
);

INSERT INTO doctors
  (first_name, last_name, license_num)
VALUES
  ('Poppy', 'Pomfrey', 'MD12345'),
  ('Rutherford', 'Poke', '67890');

INSERT INTO patients
  (first_name, last_name)
VALUES
  ('Hermione', 'Granger'),
  ('Ron', 'Weasley');

INSERT INTO diseases
  (name)
VALUES
  ('Dragon Pox'),
  ('Spattergroit');

INSERT INTO dr_pt_relationships
  (dr_id, pt_id)
VALUES
  (1, 1),
  (1, 2),
  (2, 1);

INSERT INTO pt_diagnoses
  (pt_id, disease_id)
VALUES
  (1, 1),
  (2, 1),
  (2, 2);

INSERT INTO dr_specialties
  (dr_id, disease_id)
VALUES
  (1, 1),
  (1, 2),
  (2, 2);