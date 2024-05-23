
The names of the animals in a given enclosure
`````sql
SELECT * 
FROM animal
INNER JOIN enclosure 
ON animal.enclosure_id = enclosure.id
WHERE enclosure.name = 'Lion Enclosure'
;

````




