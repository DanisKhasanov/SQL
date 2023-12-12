SELECT name
FROM person
WHERE person.gender = 'female'
  AND person.id IN (
    SELECT person_id
    FROM person_order po
             INNER JOIN menu ON menu.id = po.menu_id
    WHERE pizza_name IN ('pepperoni pizza', 'cheese pizza')
    GROUP BY po.person_id
    HAVING count(DISTINCT menu.pizza_name) = 2
)
ORDER BY name;

