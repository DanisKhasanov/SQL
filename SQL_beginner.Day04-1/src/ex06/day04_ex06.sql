CREATE MATERIALIZED VIEW mv_dmitriy_visits_and_eats AS
SELECT pizzeria.name AS pizzeria_name
FROM menu
         INNER JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
         INNER JOIN person_visits ON person_visits.pizzeria_id = pizzeria.id
         INNER JOIN person on person_visits.person_id = person.id
WHERE visit_date IN ('2022-01-08')
  and person.name IN ('Dmitriy')
  and price < 800;

SELECT *
FROM mv_dmitriy_visits_and_eats;



