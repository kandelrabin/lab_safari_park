
The names of the animals in a given enclosure
`````sql
SELECT animal.name 
FROM animal
INNER JOIN enclosure 
ON animal.enclosure_id = enclosure.id
WHERE enclosure.name = 'Lion Enclosure'
;
```````

The names of the staff working in a given enclosure
````sql
SELECT staff.name FROM staff
INNER JOIN assignment
ON staff.id = assignment.employee_id
INNER JOIN enclosure
ON assignment.enclosure_id = enclosure.id
WHERE enclosure.name = 'Zebra Enclosure';
````


