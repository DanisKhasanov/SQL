WITH dates AS (
    SELECT '2022-01-01'::date + n AS visit_date
    FROM generate_series(1, 9, 1) AS n
)

SELECT d.visit_date AS missing_date
FROM dates d
         LEFT JOIN (
    SELECT DISTINCT pv.visit_date
    FROM person_visits pv
    WHERE pv.person_id IN (1, 2)
) pv ON d.visit_date = pv.visit_date
WHERE pv.visit_date IS NULL
ORDER BY d.visit_date;
