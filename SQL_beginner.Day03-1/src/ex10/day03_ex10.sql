INSERT INTO person_order (id, person_id, menu_id, order_date)
VALUES ((SELECT MAX(id) + 1
         FROM person_order),
        (SELECT id
         FROM person
         WHERE name = 'Denis'),
        (SELECT id
         FROM menu
         WHERE pizza_name = 'sicilian pizza'), '2022-02-24')

INSERT INTO person_order (id, person_id, menu_id, order_date)
VALUES ((SELECT MAX(id) + 1
         FROM person_order),
        (SELECT id
         FROM person
         WHERE name = 'Irina'),
        (SELECT id
         FROM menu
         WHERE pizza_name = 'sicilian pizza'), '2022-02-24')


select count(*) = 2 as check
from person_visits
where visit_date = '2022-02-24'
  and person_id in (6, 4)
  and pizzeria_id = 2;