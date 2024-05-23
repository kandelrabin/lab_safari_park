DROP TABLE IF EXISTS staff;

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



