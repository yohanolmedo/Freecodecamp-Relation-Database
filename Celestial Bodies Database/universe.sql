DROP DATABASE universe;

CREATE DATABASE universe;

\c universe;

CREATE TABLE galaxy (
  galaxy_id SERIAL PRIMARY KEY 
);

CREATE TABLE star (
  star_id SERIAL PRIMARY KEY
);

CREATE TABLE planet (
  planet_id SERIAL PRIMARY KEY
);

CREATE TABLE moon (
  moon_id SERIAL PRIMARY KEY
);

CREATE TABLE star_system (
  star_system_id SERIAL PRIMARY KEY
);

-- For the 'galaxy' table
ALTER TABLE galaxy
ADD COLUMN name varchar(50) NOT NULL UNIQUE,
ADD COLUMN number_of_stars INT NOT NULL,
ADD COLUMN age INT,
ADD COLUMN size numeric,
ADD COLUMN luminosity numeric;

-- For the 'star' table
ALTER TABLE star
ADD COLUMN name varchar(50) NOT NULL UNIQUE,
ADD COLUMN distance numeric NOT NULL,
ADD COLUMN temperature numeric,
ADD COLUMN mass numeric,
ADD COLUMN brightness numeric,
ADD COLUMN galaxy_id INT REFERENCES galaxy(galaxy_id);
;

-- For the 'planet' table
ALTER TABLE planet
ADD COLUMN name varchar(50) NOT NULL UNIQUE,
ADD COLUMN description TEXT NOT NULL,
ADD COLUMN diameter numeric,
ADD COLUMN distance_from_star numeric,
ADD COLUMN habitable BOOLEAN,
ADD COLUMN orbital_period numeric,
ADD COLUMN star_id INT REFERENCES star(star_id);

-- For the 'moon' table
ALTER TABLE moon
ADD COLUMN name varchar(50) NOT NULL UNIQUE,
ADD COLUMN habitable BOOLEAN NOT NULL,
ADD COLUMN surface_area numeric,
ADD COLUMN temperature numeric,
ADD COLUMN atmospheric_pressure numeric,
ADD COLUMN planet_id INT REFERENCES planet(planet_id);

-- For the 'star_system' table
ALTER TABLE star_system
ADD COLUMN name varchar(50) UNIQUE,
ADD COLUMN age numeric NOT NULL,
ADD COLUMN location varchar(100) NOT NULL,
ADD COLUMN size numeric;


-- Insert data 

-- Insert data into the 'galaxy' table
INSERT INTO galaxy (name, number_of_stars, age, size, luminosity)
VALUES ('Milky Way', 200, 13.2, 100000, 50000),
       ('Andromeda', 400, 12.8, 120000, 60000),
       ('Whirlpool', 100, 11.5, 80000, 40000),
       ('Sombrero Galaxy', 1000, 11.7, 90000, 45000),
       ('Pinwheel Galaxy', 2000, 10.5, 110000, 55000),
       ('Black Eye Galaxy', 800, 12.3, 75000, 38000),
       ('Cigar Galaxy', 600, 13.6, 65000, 32000);;

-- Insert data into the 'star' table
INSERT INTO star (name, distance, temperature, mass, brightness, galaxy_id)
VALUES ('Sun', 1.0, 5778, 1.989, 1.0, 1),
       ('Sirius', 8.6, 9940, 2.02, 25.4, 1),
       ('Alpha Centauri', 4.37, 5790, 1.105, 1.519, 2),
       ('Proxima Centauri', 4.24, 3042, 0.123, 0.001, 2),
       ('Betelgeuse', 643, 3611, 18, 12600, 2),
       ('Vega', 25.05, 9602, 2.135, 58.7, 1),
       ('Antares', 550, 3580, 15, 5500, 1);;

-- Insert data into the 'planet' table
INSERT INTO planet (name, description, diameter, distance_from_star, habitable, orbital_period, star_id)
VALUES
  ('Mercury', 'The smallest planet in our solar system.', 4879, 57.91, FALSE, 88, 1),
  ('Venus', 'Known for its thick atmosphere and extreme temperatures.', 12104, 108.2, FALSE, 225, 1),
  ('Earth', 'Our home planet, the only known planet with life.', 12742, 149.6, TRUE, 365.25, 1),
  ('Mars', 'The Red Planet.', 6779, 227.9, FALSE, 687, 1),
  ('Jupiter', 'The largest planet in our solar system.', 139820, 778.5, FALSE, 4331, 2),
  ('Saturn', 'Known for its rings.', 116460, 1433.5, FALSE, 10747, 2),
  ('Uranus', 'The coldest planet in our solar system.', 50724, 2872.5, FALSE, 30589, 2),
  ('Neptune', 'The farthest planet from the Sun.', 49244, 4495.1, FALSE, 59800, 2),
  ('Pluto', 'A dwarf planet at the edge of our solar system.', 2370, 5906.4, FALSE, 90560, NULL),
  -- Add more rows for additional planets
  ('Planet A', 'Description of Planet A.', 5000, 100, TRUE, 200, 1),
  ('Planet B', 'Description of Planet B.', 6000, 200, TRUE, 300, 2),
  ('Planet C', 'Description of Planet C.', 7000, 300, TRUE, 400, 2),
  ('Planet D', 'Description of Planet D.', 8000, 400, TRUE, 500, 2);


-- Insert data into the 'moon' table
INSERT INTO moon (name, habitable, surface_area, temperature, atmospheric_pressure, planet_id)
VALUES
  ('Moon', FALSE, 3.793e7, -233, 0.0000003, 3),
  ('Phobos', FALSE, 5.8e3, -40, 0.0000013, 4),
  ('Deimos', FALSE, 1.48e3, -40, 0.0000003, 4),
  ('Io', FALSE, 4.01e7, -163, 0.00003, 5),
  ('Europa', FALSE, 3.14e7, -170, 0.00001, 5),
  ('Ganymede', FALSE, 8.04e7, -163, 0.00001, 5),
  ('Callisto', FALSE, 7.85e7, -153, 0.0000001, 5),
  ('Titan', FALSE, 8.38e7, -179, 1.467, 6),
  ('Enceladus', FALSE, 7.65e5, -201, 0.0000001, 6),
  ('Miranda', FALSE, 6.4e5, -187, 0.00000001, 7),
  -- Add more rows for additional moons
  ('Moon A', FALSE, 1e6, -100, 0.000001, 3),
  ('Moon B', FALSE, 2e6, -110, 0.000002, 3),
  ('Moon C', FALSE, 3e6, -120, 0.000003, 3),
  ('Moon D', FALSE, 4e6, -130, 0.000004, 3),
  ('Moon E', FALSE, 5e6, -140, 0.000005, 3),
  ('Moon F', FALSE, 6e6, -150, 0.000006, 3),
  ('Moon G', FALSE, 7e6, -160, 0.000007, 3),
  ('Moon H', FALSE, 8e6, -170, 0.000008, 3),
  ('Moon I', FALSE, 9e6, -180, 0.000009, 3),
  ('Moon J', FALSE, 10e6, -190, 0.00001, 3);

-- Insert data into the 'star_system' table
INSERT INTO star_system (name, age, location, size)
VALUES
    ('Alpha Centauri', 4.5, 'Centaurus', 120),
    ('Orion', 8.2, 'Orion Arm', 200),
    ('Pleiades', 10.1, 'Taurus', 80);

SELECT * FROM star;
SELECT * FROM galaxy;