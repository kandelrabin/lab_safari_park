DROP TABLE IF EXISTS assignments;
DROP TABLE IF EXISTS animals;
DROP TABLE IF EXISTS staff;
DROP TABLE IF EXISTS enclosures;

CREATE TABLE staff(
    id SERIAL PRIMARY KEY,
    name VARCHAR(225),
    employee_number INT
);

CREATE TABLE enclosures(
    id SERIAL PRIMARY KEY,
    name VARCHAR(225),
    capacity INT,
    closed_for_maintenance BOOLEAN
);

CREATE TABLE animals(
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    type VARCHAR(255),
    age INT,
    enclosure_id INTEGER REFERENCES enclosures(id)
);

CREATE TABLE assignments(
    id SERIAL PRIMARY KEY,
    day VARCHAR(255),
    employee_id INTEGER REFERENCES staff(id),
    enclosure_id INTEGER REFERENCES enclosures(id)
);

INSERT INTO staff (name, employee_number) VALUES ('Sunny', 0121);
INSERT INTO staff (name, employee_number) VALUES ('Zuhair', 0161);
INSERT INTO staff (name, employee_number) VALUES ('Rabin', 0200);

INSERT INTO enclosures (name, capacity, closed_for_maintenance) VALUES ('Lion Enclosure', 2, FALSE);
INSERT INTO enclosures (name, capacity, closed_for_maintenance) VALUES ('Penguin Enclosure', 3, TRUE);
INSERT INTO enclosures (name, capacity, closed_for_maintenance) VALUES ('Zebra Enclosure', 1, FALSE);

INSERT INTO animals (name, type, age, enclosure_id) VALUES ('Alex', 'Lion', 23, 1);
INSERT INTO animals (name, type, age, enclosure_id) VALUES ('Simba', 'Lion', 15, 1);
INSERT INTO animals (name, type, age, enclosure_id) VALUES ('Skipper', 'Penguin', 16, 2);
INSERT INTO animals (name, type, age, enclosure_id) VALUES ('Rico', 'Penguin', 14, 2);
INSERT INTO animals (name, type, age, enclosure_id) VALUES ('Marty', 'Zebra', 42,3);
INSERT INTO animals (name, type, age, enclosure_id) VALUES ('Brian', 'Zebra', 42,3);




INSERT INTO assignments (day, employee_id, enclosure_id) VALUES ('Monday', 2, 2);
INSERT INTO assignments (day, employee_id, enclosure_id) VALUES ('Monday', 1, 1);
INSERT INTO assignments (day, employee_id, enclosure_id) VALUES ('Monday', 3, 3);
INSERT INTO assignments (day, employee_id, enclosure_id) VALUES ('Tuesday', 2, 1);

