CREATE VIEW v_price_with_discount AS
SELECT name, pizza_name, price, round(price - price * 0.1) AS discount_price
FROM person_order
         INNER JOIN person p on p.id = person_order.person_id
         INNER JOIN menu m on m.id = person_order.menu_id
ORDER BY name, pizza_name;