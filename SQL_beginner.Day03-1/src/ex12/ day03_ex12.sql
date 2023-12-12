INSERT INTO person_order (id, person_id, menu_id, order_date)
SELECT x + (SELECT MAX(id)
            FROM person_order)            AS id,
       id                                 AS person_id,
       (SELECT id
        FROM menu
        WHERE pizza_name = 'greek pizza') AS menu_id,
       '2022-02-25'                       AS order_date
FROM person
         INNER JOIN GENERATE_SERIES(1, (SELECT COUNT(*) FROM person)) AS x ON x = person.id;


select count(*)=9 as check
from person_order
where order_date='2022-02-25' and menu_id = (select id from menu where pizza_name =
'greek pizza')