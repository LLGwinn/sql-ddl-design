-- from the terminal run:
-- psql < music.sql

DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music

CREATE TABLE artists
(
  id SERIAL PRIMARY KEY,
  artist TEXT[] NOT NULL
);

CREATE TABLE albums
(
  id SERIAL PRIMARY KEY,
  album TEXT NOT NULL
);

CREATE TABLE producers
(
  id SERIAL PRIMARY KEY,
  producer TEXT[] NOT NULL
);

CREATE TABLE songs
(
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  duration_in_seconds INTEGER NOT NULL,
  release_date DATE NOT NULL
);

CREATE TABLE album_songs
(
  id SERIAL PRIMARY KEY,
  album_id INTEGER NOT NULL REFERENCES albums,
  song_id INTEGER NOT NULL REFERENCES songs
);

CREATE TABLE song_artists
(
  id SERIAL PRIMARY KEY,
  song_id INTEGER NOT NULL REFERENCES songs,
  artist_id INTEGER NOT NULL REFERENCES artists
);

CREATE TABLE song_producers
(
  id SERIAL PRIMARY KEY,
  song_id INTEGER NOT NULL REFERENCES songs,
  producer_id INTEGER NOT NULL REFERENCES producers
);

INSERT INTO artists
(artist)
VALUES
('{"Hanson"}'),
('{"Queen"}'),
('{"Mariah Cary", "Boyz II Men"}'),
('{"Lady Gaga", "Bradley Cooper"}'),
('{"Nickelback"}'),
('{"Jay Z", "Alicia Keys"}'),
('{"Katy Perry", "Juicy J"}'),
('{"Maroon 5", "Christina Aguilera"}'),
('{"Avril Lavigne"}'),
('{"Destiny''s Child"}');

INSERT INTO albums
(album)
VALUES
('Middle of Nowhere'),
('A Night at the Opera'),
('Daydream'),
('A Star Is Born'),
('Silver Side Up'),
('The Blueprint 3'),
('Prism'),
('Hands All Over'),
('Let Go'),
('The Writing''s on the Wall');

INSERT INTO producers
(producer)
VALUES
('{"Dust Brothers", "Stephen Lironi"}'),
('{"Roy Thomas Baker"}'),
('{"Walter Afanasieff"}'),
('{"Benjamin Rice"}'),
('{"Rick Parashar"}'),
('{"Al Shux"}'),
('{"Max Martin", "Cirkut"}'),
('{"Shellback", "Benny Blanco"}'),
('{"The Matrix"}'),
('{"Darkchild"}');

INSERT INTO songs
(title, duration_in_seconds, release_date)
VALUES
('MMMBop', 238, '04-15-1997'),
('Bohemian Rhapsody', 355, '10-31-1975'),
('One Sweet Day', 282, '11-14-1995'),
('Shallow', 216, '09-27-2018'),
('How You Remind Me', 223, '08-21-2001'),
('New York State of Mind', 276, '10-20-2009'),
('Dark Horse', 215, '12-17-2013'),
('Moves Like Jagger', 201, '06-21-2011'),
('Complicated', 244, '05-14-2002'),
('Say My Name', 240, '11-07-1999');

INSERT INTO album_songs
(album_id, song_id)
VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);

INSERT INTO song_artists
(song_id, artist_id)
VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);

INSERT INTO song_producers
(song_id, producer_id)
VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);