DROP DATABASE IF EXISTS  soccer_db;

CREATE DATABASE soccer_db;

\c soccer_db

CREATE TABLE teams
(
  id SERIAL PRIMARY KEY,
  team TEXT UNIQUE NOT NULL
);

CREATE TABLE players
(
  id SERIAL PRIMARY KEY,
  player TEXT NOT NULL
);

CREATE TABLE referees
(
  id SERIAL PRIMARY KEY,
  referee TEXT NOT NULL
);

CREATE TABLE seasons
(
  id SERIAL PRIMARY KEY,
  season TEXT,
  season_start DATE NOT NULL,
  season_end DATE NOT NULL
);

CREATE TABLE matches
(
  id SERIAL PRIMARY KEY,
  team1 INTEGER NOT NULL REFERENCES teams,
  team2 INTEGER NOT NULL REFERENCES teams,
  season INTEGER REFERENCES seasons
);

CREATE TABLE goals
(
  id SERIAL PRIMARY KEY,
  player INTEGER NOT NULL REFERENCES players,
  match INTEGER NOT NULL REFERENCES matches,
  goal_time INTEGER NOT NULL
);

CREATE TABLE player_teams
(
  id SERIAL PRIMARY KEY,
  player INTEGER NOT NULL REFERENCES players,
  team INTEGER REFERENCES teams
);

CREATE TABLE standings
(
  id SERIAL PRIMARY KEY,
  team INTEGER NOT NULL REFERENCES teams,
  standing INTEGER NOT NULL
);

INSERT INTO teams
(team)
VALUES
('Hufflepuff'),
('Ravenclaw'),
('Gryffindor'),
('Slytherin');

INSERT INTO players
(player)
VALUES
('Potter'),
('Weasley'),
('Wood');

INSERT INTO referees 
(referee)
VALUES
('McGonagall'),
('Snape'),
('Hootch');

INSERT INTO seasons
(season, season_start, season_end)
VALUES
('summer', '2021-07-01', '2021-09-30'),
('winter', '2021-10-01', '2022-01-31');

INSERT INTO matches
(team1, team2, season)
VALUES
(3, 4, 1),
(1, 2, 2),
(1, 3, 2);

INSERT INTO goals
(player, match, goal_time)
VALUES
(1, 1, 12),
(1, 1, 18),
(2, 2, 8);

INSERT INTO player_teams
(player, team)
VALUES
(1, 3),
(2, 3),
(3, 1);

INSERT INTO standings
(team, standing)
VALUES
(3, 1),
(4, 2),
(1, 3);
