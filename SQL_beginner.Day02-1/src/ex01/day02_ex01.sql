SELECT n::date AS missing_date
FROM (SELECT *
      FROM person_visits pv
      WHERE person_id IN (1, 2)) AS pi
         RIGHT JOIN
     generate_series('2022-01-01', '2022-01-10', interval '1 day') AS n ON pi.visit_date = n
WHERE pi.id IS NULL
ORDER BY 1;