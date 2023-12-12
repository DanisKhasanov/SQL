SELECT action_date, person.name AS person_name
FROM (
         SELECT order_date AS action_date, person_id
         FROM person_order
         INTERSECT ALL
         SELECT visit_date, person_id
         FROM person_visits) AS name_person
         INNER JOIN person ON name_person.person_id = person.id
ORDER BY action_date, person_name DESC;

