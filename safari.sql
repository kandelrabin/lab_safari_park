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

INSERT INTO staff (name, employee_number) VALUES ('Sunny', 0121);
INSERT INTO staff (name, employee_number) VALUES ('Zuhair', 0161);
INSERT INTO staff (name, employee_number) VALUES ('Rabin', 0200);

INSERT INTO enclosure (name, capacity, closed_for_maintenance) VALUES ('Lion Enclosure', 2, FALSE);
INSERT INTO enclosure (name, capacity, closed_for_maintenance) VALUES ('Penguin Enclosure', 3, TRUE);
INSERT INTO enclosure (name, capacity, closed_for_maintenance) VALUES ('Zebra Enclosure', 1, FALSE);

INSERT INTO animal (name, type, age, enclosure_id) VALUES ('Alex', 'Lion', 23, 1);
INSERT INTO animal (name, type, age, enclosure_id) VALUES ('Simba', 'Lion', 15, 1);
INSERT INTO animal (name, type, age, enclosure_id) VALUES ('Skipper', 'Penguin', 16, 2);
INSERT INTO animal (name, type, age, enclosure_id) VALUES ('Rico', 'Penguin', 14, 2);
INSERT INTO animal (name, type, age, enclosure_id) VALUES ('Marty', 'Zebra', 42,3);
INSERT INTO animal (name, type, age, enclosure_id) VALUES ('Brian', 'Zebra', 42,3);




INSERT INTO assignment (day, employee_id, enclosure_id) VALUES ('Monday', 2, 2);
INSERT INTO assignment (day, employee_id, enclosure_id) VALUES ('Monday', 1, 1);
INSERT INTO assignment (day, employee_id, enclosure_id) VALUES ('Monday', 3, 3);

