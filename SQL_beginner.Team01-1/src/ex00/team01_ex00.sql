WITH group_currency AS (
    SELECT currency.id,name, rate_to_usd, updated
    FROM (
         SELECT id, MAX(updated)
         FROM currency
         GROUP BY id
         ) AS gc
             INNER JOIN currency ON currency.id = gc.id AND currency.updated = gc.max
), group_balance AS (
        SELECT user_id,type,SUM(money) AS volume, currency_id
        FROM balance
        GROUP BY user_id, type, currency_id
    )

SELECT COALESCE(u.name, 'not defined')   AS name,
       COALESCE(lastname, 'not defined') AS lastname,
       type,
       group_balance.volume,
       COALESCE(group_currency.name, 'not defined') AS currency_name,
       COALESCE(group_currency.rate_to_usd, '1') AS last_rate_to_usd,
       SUM(group_balance.volume) *  COALESCE(group_currency.rate_to_usd, '1') AS total_volume_in_usd
FROM group_balance
         LEFT JOIN "user" u ON u.id = group_balance.user_id
         LEFT JOIN group_currency ON group_balance.currency_id = group_currency.id
GROUP BY u.name, u.lastname, type, group_balance.volume, group_currency.name, group_currency.rate_to_usd
ORDER BY name DESC, lastname, type;


