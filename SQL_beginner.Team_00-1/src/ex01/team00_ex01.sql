CREATE TABLE nodes
(
    point1 VARCHAR,
    point2 VARCHAR,
    cost   INT
);

INSERT INTO nodes (point1, point2, cost)
VALUES ('a', 'b', 10),
       ('b', 'a', 10),
       ('a', 'c', 15),
       ('c', 'a', 15),
       ('a', 'd', 20),
       ('d', 'a', 20),
       ('b', 'c', 35),
       ('c', 'b', 35),
       ('b', 'd', 25),
       ('d', 'b', 25),
       ('c', 'd', 30),
       ('d', 'c', 30);

--
WITH RECURSIVE
    travel_path AS (
        SELECT point1, point2, cost, ARRAY [point1, point2] AS path, 1 AS level
        FROM nodes
        WHERE point1 = 'a'

        UNION ALL

        SELECT n.point1,
               n.point2,
               n.cost + tr.cost,
               ARRAY_APPEND(path, n.point2),
               tr.level + 1 AS level
        FROM nodes AS n
                 INNER JOIN travel_path AS tr ON tr.point2 = n.point1
        WHERE NOT n.point2 = ANY (path)
    ),
    full_path AS (
        SELECT tr.cost + n.cost                                     AS total_cost,
               '{' ||
               array_to_string(array_append(path, 'a'), ',') || '}' AS tour
        FROM travel_path AS tr
                 INNER JOIN nodes AS n ON tr.point2 = n.point2 AND n.point1 = 'a'
        WHERE level = 3
    )

SELECT total_cost, tour
FROM full_path
WHERE total_cost = (SELECT MIN(total_cost) FROM full_path)
   OR total_cost = (SELECT MAX(total_cost) FROM full_path)
ORDER BY total_cost, tour;

















