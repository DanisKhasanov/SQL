SELECT menu.pizza_name, menu.price, p.name
FROM (
         SELECT id AS menu_id
         FROM menu
         EXCEPT
         SELECT menu_id
         FROM person_order
         ORDER BY menu_id) AS pn
         INNER JOIN menu ON pn.menu_id = menu.id
         INNER JOIN pizzeria p on menu.pizzeria_id = p.id
ORDER BY pizza_name, price;
