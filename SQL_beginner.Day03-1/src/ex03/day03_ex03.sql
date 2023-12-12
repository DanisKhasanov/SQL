(SELECT pz.name AS pizzeria_name
 FROM person p
          INNER JOIN person_visits pv on p.id = pv.person_id
          INNER JOIN pizzeria pz on pz.id = pv.pizzeria_id
 WHERE gender = 'female'
 EXCEPT ALL
 SELECT pz.name
 FROM person p
          INNER JOIN person_visits pv on p.id = pv.person_id
          INNER JOIN pizzeria pz on pz.id = pv.pizzeria_id
 WHERE gender = 'male'
)
UNION ALL
(
    SELECT pz.name
    FROM person p
             INNER JOIN person_visits pv on p.id = pv.person_id
             INNER JOIN pizzeria pz on pz.id = pv.pizzeria_id
    WHERE gender = 'male'
    EXCEPT ALL
    SELECT pz.name

    FROM person p
             INNER JOIN person_visits pv on p.id = pv.person_id
             INNER JOIN pizzeria pz on pz.id = pv.pizzeria_id
    WHERE gender = 'female'
)
ORDER BY pizzeria_name;

