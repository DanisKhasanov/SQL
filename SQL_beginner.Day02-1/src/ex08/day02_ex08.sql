SELECT name
FROM person
         INNER JOIN person_order po on person.id = po.person_id
         INNER JOIN menu ON menu.id = po.menu_id
WHERE gender = 'male'
  and address IN ('Moscow', 'Samara')
  and pizza_name IN ('pepperoni pizza', 'mushroom pizza')
ORDER BY name DESC;