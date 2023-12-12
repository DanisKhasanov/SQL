(SELECT name, count(*) AS count, 'order' AS action_type
 FROM person_order
          INNER JOIN menu m on person_order.menu_id = m.id
          INNER JOIN pizzeria p on m.pizzeria_id = p.id
 GROUP BY name
 ORDER BY count DESC
 LIMIT 3)
UNION
(SELECT name, count(*) AS count, 'visit' AS action_type
 FROM person_visits
          INNER JOIN pizzeria p2 on p2.id = person_visits.pizzeria_id
 GROUP BY name
 ORDER BY count DESC
 LIMIT 3
)
ORDER BY action_type, count DESC;

