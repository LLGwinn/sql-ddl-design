-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space

-- CREATE TABLE planets
-- (
--   id SERIAL PRIMARY KEY,
--   name TEXT NOT NULL,
--   orbital_period_in_years FLOAT NOT NULL,
--   orbits_around TEXT NOT NULL,
--   galaxy TEXT NOT NULL,
--   moons TEXT[]
-- );

-- INSERT INTO planets
--   (name, orbital_period_in_years, orbits_around, galaxy, moons)
-- VALUES
--   ('Earth', 1.00, 'The Sun', 'Milky Way', '{"The Moon"}'),
--   ('Mars', 1.88, 'The Sun', 'Milky Way', '{"Phobos", "Deimos"}'),
--   ('Venus', 0.62, 'The Sun', 'Milky Way', '{}'),
--   ('Neptune', 164.8, 'The Sun', 'Milky Way', '{"Naiad", "Thalassa", "Despina", "Galatea", "Larissa", "S/2004 N 1", "Proteus", "Triton", "Nereid", "Halimede", "Sao", "Laomedeia", "Psamathe", "Neso"}'),
--   ('Proxima Centauri b', 0.03, 'Proxima Centauri', 'Milky Way', '{}'),
--   ('Gliese 876 b', 0.23, 'Gliese 876', 'Milky Way', '{}');

CREATE TABLE orbit_stars
(
  id SERIAL PRIMARY KEY,
  star_name TEXT UNIQUE NOT NULL
);

CREATE TABLE galaxies
(
  id SERIAL PRIMARY KEY,
  galaxy TEXT UNIQUE NOT NULL
);

CREATE TABLE planets
(
  id SERIAL PRIMARY KEY,
  planet_name TEXT NOT NULL,
  orbital_period_in_years FLOAT NOT NULL,
  moons TEXT[]
);

CREATE TABLE planet_galaxies
(
  id SERIAL PRIMARY KEY,
  planet_id INTEGER NOT NULL REFERENCES planets,
  galaxy_id INTEGER NOT NULL REFERENCES galaxies
);

CREATE TABLE planet_orbits
(
  id SERIAL PRIMARY KEY,
  planet_id INTEGER NOT NULL REFERENCES planets,
  orbit_star_id INTEGER NOT NULL REFERENCES orbit_stars
);

INSERT INTO orbit_stars
(star_name)
VALUES
('The Sun'),
('Proxima Centauri'),
('Gliese 876');

INSERT INTO galaxies
(galaxy)
VALUES
('Milky Way'),
('Other Galaxy');

INSERT INTO planets
  (planet_name, orbital_period_in_years, moons)
VALUES
  ('Earth', 1.00, '{"The Moon"}'),
  ('Mars', 1.88, '{"Phobos", "Deimos"}'),
  ('Venus', 0.62, '{}'),
  ('Neptune', 164.8, '{"Naiad", "Thalassa", "Despina", "Galatea", "Larissa", "S/2004 N 1", "Proteus", "Triton", "Nereid", "Halimede", "Sao", "Laomedeia", "Psamathe", "Neso"}'),
  ('Proxima Centauri b', 0.03, '{}'),
  ('Gliese 876 b', 0.23, '{}');

INSERT INTO planet_galaxies
(planet_id, galaxy_id)
VALUES 
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1);

INSERT INTO planet_orbits
(planet_id, orbit_star_id)
VALUES 
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 2),
(6, 3);