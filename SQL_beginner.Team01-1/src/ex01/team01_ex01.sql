insert into currency
values (100, 'EUR', 0.85, '2022-01-01 13:29');
insert into currency
values (100, 'EUR', 0.79, '2022-01-08 13:29');


WITH sorted_currency_t1 AS (SELECT name, updated, rate_to_usd
                         FROM currency
                         ORDER BY name, updated DESC),
     sorted_currency_t2 AS (SELECT name, updated, rate_to_usd
                         FROM currency
                         ORDER BY name, updated)
SELECT COALESCE(u.name, 'not defined')                    AS name,
       COALESCE(lastname, 'not defined')                  AS lastname,
       c.name AS currency_name,
        COALESCE((SELECT rate_to_usd::numeric
                  FROM sorted_currency_t1
                 WHERE sorted_currency_t1.updated < b.updated AND sorted_currency_t1.name = c.name
                 LIMIT 1) * b.money:: numeric, (SELECT rate_to_usd::numeric
                                      FROM sorted_currency_t2
                                     WHERE sorted_currency_t2.updated > b.updated AND sorted_currency_t2.name = c.name
                                       LIMIT 1) * b.money::numeric) AS currency_in_usd
FROM balance b
         JOIN (SELECT id, name FROM currency GROUP BY id, name) c ON b.currency_id = c.id
         LEFT JOIN "user" u ON b.user_id = u.id
ORDER BY 1 DESC, 2, 3;
