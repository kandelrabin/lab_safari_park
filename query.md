
The names of the animals in a given enclosure
````sql
SELECT animals.name 
FROM animals
INNER JOIN enclosures 
ON animals.enclosure_id = enclosures.id
WHERE enclosures.name = 'Lion Enclosure';

````

The names of the staffs working in a given enclosure
````sql
SELECT staffs.name FROM staffs
INNER JOIN assignments
ON staffs.id = assignments.employee_id
INNER JOIN enclosures
ON assignments.enclosure_id = enclosures.id
WHERE enclosures.name = 'Zebra Enclosure';

````

The names of staffs working in enclosures which are closed for maintenance
````sql
SELECT staffs.name FROM staffs
INNER JOIN assignments
ON staffs.id = assignments.employee_id
INNER JOIN enclosures
ON assignments.enclosure_id = enclosures.id
WHERE enclosures.closed_for_maintenance = TRUE;

````

The name of the enclosure where the oldest animals live. If there are two animals who are the same age choose the first one alphabetically.
````sql
SELECT enclosures.name, animals.name FROM enclosures
INNER JOIN animals
ON enclosures.id = animals.enclosure_id
WHERE animals.age = (SELECT MAX(age) FROM animals)
ORDER BY animals.name LIMIT 1;

````


The number of different animal types a given keeper has been assigned to work with.

````sql
SELECT COUNT (DISTINCT animals.type), staffs.name
FROM animals
INNER JOIN enclosures ON animals.enclosure_id = enclosures.id
INNER JOIN assignments ON enclosures.id = assignments.enclosure_id
INNER JOIN staffs ON assignments.employee_id = staffs.id
WHERE staffs.name = 'Zuhair'
GROUP BY staffs.name;
 
````

The number of different keepers who have been assigned to work in a given enclosure

````sql
SELECT COUNT(DISTINCT staffs.name), enclosures.name FROM staffs
INNER JOIN assignments
ON staffs.id = assignments.employee_id
INNER JOIN enclosures
ON enclosures.id  = assignments.enclosure_id
WHERE enclosures.name = 'Lion Enclosure'
GROUP BY enclosures.name;

````

The names of the other animals sharing an enclosure with a given animal (eg. find the names of all the animals sharing the big cat field with Tony)

````sql
WITH alex_table AS (SELECT animals.enclosure_id FROM animals
	INNER JOIN enclosures
	ON animals.enclosure_id = enclosures.id
	WHERE animals.name = 'Alex')

SELECT animals.name FROM animals
INNER JOIN alex_table
ON animals.enclosure_id = alex_table.enclosure_id;

````