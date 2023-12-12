SELECT p.name,
       m.pizza_name,
       m.price,
       (m.price - (m.price * pd.discount / 100)) AS discont_price,
       pz.name AS pizzeria_name
FROM person_order
         INNER JOIN person p on p.id = person_order.person_id
         INNER JOIN menu m on m.id = person_order.menu_id
         INNER JOIN person_discounts pd on p.id = pd.person_id and pd.pizzeria_id = m.pizzeria_id
         INNER JOIN pizzeria pz on pz.id = m.pizzeria_id
ORDER BY name, pizza_name;