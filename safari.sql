DROP TABLE IF EXISTS assignment;
DROP TABLE IF EXISTS animal;
DROP TABLE IF EXISTS staff;
DROP TABLE IF EXISTS enclosure;



CREATE TABLE staff(
    id SERIAL PRIMARY KEY,
    name VARCHAR(225),
    employee_number INT
);


CREATE TABLE enclosure(
    id SERIAL PRIMARY KEY,
    name VARCHAR(225),
    capacity INT,
    closed_for_maintenance BOOLEAN
);


CREATE TABLE animal(
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    type VARCHAR(255),
    age INT,
    enclosure_id INTEGER REFERENCES enclosure(id)
);

CREATE TABLE assignment(
    id SERIAL PRIMARY KEY,
    day VARCHAR(255),
    employee_id INTEGER REFERENCES staff(id),
    enclosure_id INTEGER REFERENCES enclosure(id)
);



