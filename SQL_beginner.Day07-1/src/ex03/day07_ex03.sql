SELECT tabl2.name, COALESCE(tabl1.count, 0) + COALESCE(tabl2.count, 0) AS total_count
FROM (SELECT name, count(*) AS count
      FROM person_order
               INNER JOIN menu m on person_order.menu_id = m.id
               INNER JOIN pizzeria p on m.pizzeria_id = p.id
      GROUP BY name
      ORDER BY count DESC
     ) AS tabl1
         FULL JOIN
     (SELECT name, count(*) AS count
      FROM person_visits
               INNER JOIN pizzeria p2 on p2.id = person_visits.pizzeria_id
      GROUP BY name
      ORDER BY count DESC
     ) AS tabl2 ON tabl1.name = tabl2.name
ORDER BY total_count DESC, tabl2.name ASC;


