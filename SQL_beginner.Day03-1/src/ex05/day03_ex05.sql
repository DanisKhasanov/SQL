SELECT pz.name AS pizzeria_name
FROM person_visits
         INNER JOIN person p ON person_visits.person_id = p.id
         INNER JOIN pizzeria pz ON person_visits.pizzeria_id = pz.id
WHERE p.name = 'Andrey'
EXCEPT
SELECT pz.name
FROM person_order
         INNER JOIN person p ON person_order.person_id = p.id
         INNER JOIN menu m on person_order.menu_id = m.id
         INNER JOIN pizzeria pz ON pz.id = m.pizzeria_id
WHERE p.name = 'Andrey'
ORDER BY pizzeria_name