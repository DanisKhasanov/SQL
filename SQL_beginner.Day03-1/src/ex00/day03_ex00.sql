SELECT pizza_name, price, p.name, pv.visit_date
FROM menu
         INNER JOIN pizzeria p on p.id = menu.pizzeria_id
         INNER JOIN person_visits pv ON p.id = pv.pizzeria_id
         INNER JOIN person p2 on pv.person_id = p2.id

WHERE p2.name = 'Kate'
  and price BETWEEN 800 and 1000
ORDER BY pizza_name, price, p.name, pv.visit_date;

