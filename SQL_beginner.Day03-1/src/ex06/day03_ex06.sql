SELECT m.pizza_name, p.name AS pizzeria_name_1, p2.name AS pizzeria_name_2, m.price
FROM menu m
         INNER JOIN menu m2 ON m.pizza_name = m2.pizza_name
    AND m.price = m2.price
    AND m.pizzeria_id > m2.pizzeria_id
         INNER JOIN pizzeria p on m.pizzeria_id = p.id
         INNER JOIN pizzeria p2 ON m2.pizzeria_id = p2.id
ORDER BY m.pizza_name;