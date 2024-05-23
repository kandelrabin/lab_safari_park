
The names of the animals in a given enclosure
````sql
SELECT animal.name 
FROM animal
INNER JOIN enclosure 
ON animal.enclosure_id = enclosure.id
WHERE enclosure.name = 'Lion Enclosure'
;
````

The names of the staff working in a given enclosure
````sql
SELECT staff.name FROM staff
INNER JOIN assignment
ON staff.id = assignment.employee_id
INNER JOIN enclosure
ON assignment.enclosure_id = enclosure.id
WHERE enclosure.name = 'Zebra Enclosure';
````

The names of staff working in enclosures which are closed for maintenance
````sql
SELECT staff.name FROM staff
INNER JOIN assignment
ON staff.id = assignment.employee_id
INNER JOIN enclosure
ON assignment.enclosure_id = enclosure.id
WHERE enclosure.closed_for_maintenance = TRUE;
````

The name of the enclosure where the oldest animal lives. If there are two animals who are the same age choose the first one alphabetically.
````sql
SELECT enclosure.name, animal.name FROM enclosure
INNER JOIN animal
ON enclosure.id = animal.enclosure_id
WHERE animal.age = (SELECT MAX(age) FROM animal)
ORDER BY animal.name LIMIT 1;
````
