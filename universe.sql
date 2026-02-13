CREATE database universe;

CREATE TABLE galaxy (
    galaxy_id SERIAL PRIMARY KEY,
    name VARCHAR(50) UNIQUE NOT NULL,
    description TEXT,
    galaxy_types VARCHAR(30),
    distance_from_earth NUMERIC,
    has_life BOOLEAN NOT NULL
);

CREATE TABLE star (
    star_id SERIAL PRIMARY KEY,
    name VARCHAR(50) UNIQUE NOT NULL,
    galaxy_id INT NOT NULL REFERENCES galaxy(galaxy_id),
    age_in_millions_of_years INT,
    is_spherical BOOLEAN DEFAULT TRUE,
    mass NUMERIC
);

CREATE TABLE planet (
    planet_id SERIAL PRIMARY KEY,
    name VARCHAR(50) UNIQUE NOT NULL,
    star_id INT NOT NULL REFERENCES star(star_id),
    radius_in_km NUMERIC,
    has_rings BOOLEAN DEFAULT FALSE,
    number_of_moons INT
);

CREATE TABLE moon (
    moon_id SERIAL PRIMARY KEY,
    name VARCHAR(50) UNIQUE NOT NULL,
    planet_id INT NOT NULL REFERENCES planet(planet_id),
    radius_in_km NUMERIC,
    has_atmosphere BOOLEAN DEFAULT FALSE
);

CREATE TABLE constellation (
    constellation_id SERIAL PRIMARY KEY,
    name VARCHAR(50) UNIQUE NOT NULL,
    meaning TEXT NOT NULL,
    number_of_stars INT
);

INSERT INTO galaxy (name, description, galaxy_types, distance_from_earth, has_life) VALUES
('Milky Way', 'Our home galaxy', 'Spiral', 0, TRUE),
('Andromeda', 'Nearest spiral galaxy', 'Spiral', 2537000, FALSE),
('Sombrero Galaxy', 'Unusual galaxy with a bright nucleus', 'Elliptical', 29000000, FALSE);

INSERT INTO star (name, galaxy_id, age_in_millions_of_years, is_spherical, mass) VALUES
('Sun', 1, 4600, TRUE, 1.0),
('Proxima Centauri', 1, 4500, TRUE, 0.123),
('Sirius', 1, 242, TRUE, 2.02);

INSERT INTO planet (name, star_id, radius_in_km, has_rings, number_of_moons) VALUES
('Earth', 1, 6371, FALSE, 1),
('Mars', 1, 3389.5, FALSE, 2),
('Jupiter', 1, 69911, TRUE, 79);

INSERT INTO moon (name, planet_id, radius_in_km, has_atmosphere) VALUES
('Moon', 1, 1737.1, FALSE), ('Phobos', 2, 11.267, FALSE),
('Deimos', 2, 6.2, FALSE), ('Europa', 3, 1560.8, FALSE),
('Ganymede', 3, 2634.1, FALSE), ('Titan', 3, 2575.5, TRUE),
('Callisto', 3, 2410.3, FALSE), ('Io', 3, 1821.6, FALSE),
('Rhea', 3, 763.8, FALSE),  ('Tethys', 3, 531.1, FALSE),
('Dione', 3, 561.4, FALSE), ('Enceladus', 3, 252.1, FALSE),
('Mimas', 3, 198.2, FALSE), ('Hyperion', 3, 135, FALSE),
('Iapetus', 3, 734.5, FALSE), ('Phoebe', 3, 106.5, FALSE),
('Janus', 3, 89.5, FALSE), ('Epimetheus', 3, 58, FALSE),
('Helene', 3, 21.6, FALSE), ('Telesto', 3, 12.4, FALSE),
('Calypso', 3, 10.5, FALSE), ('Atlas', 3, 15.1, FALSE),
('Prometheus', 3, 43, FALSE), ('Pandora', 3, 40.7, FALSE);

INSERT INTO constellation (name, meaning, number_of_stars) VALUES
('Orion', 'The Hunter', 81),
('Ursa Major', 'The Great Bear', 93),
('Cassiopeia', 'The Seated Queen', 53);

