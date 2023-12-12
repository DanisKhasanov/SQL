(SELECT pz.name AS pizzeria_name
 FROM person
          INNER JOIN person_order po on person.id = po.person_id
          INNER JOIN menu m on m.id = po.menu_id
          INNER JOIN pizzeria pz on pz.id = m.pizzeria_id
 WHERE gender = 'female'
 EXCEPT
 SELECT pz.name
 FROM person
          INNER JOIN person_order po on person.id = po.person_id
          INNER JOIN menu m on m.id = po.menu_id
          INNER JOIN pizzeria pz on pz.id = m.pizzeria_id
 WHERE gender = 'male')
UNION
(SELECT pz.name
 FROM person
          INNER JOIN person_order po on person.id = po.person_id
          INNER JOIN menu m on m.id = po.menu_id
          INNER JOIN pizzeria pz on pz.id = m.pizzeria_id
 WHERE gender = 'male'
 EXCEPT
 SELECT pz.name
 FROM person
          INNER JOIN person_order po on person.id = po.person_id
          INNER JOIN menu m on m.id = po.menu_id
          INNER JOIN pizzeria pz on pz.id = m.pizzeria_id
 WHERE gender = 'female'
)
ORDER BY pizzeria_name;


)