CREATE FUNCTION fnc_person_visits_and_eats_on_date(pperson varchar DEFAULT 'Dmitriy',
                                                   pprice numeric DEFAULT 500,
                                                   pdate date DEFAULT '2022-01-08')

RETURNS TABLE(pizzeria_name varchar) AS $BODY$
BEGIN
    RETURN QUERY
        SELECT p.name as pizzeria_name
        FROM menu
                 INNER JOIN pizzeria p on p.id = menu.pizzeria_id
                 INNER JOIN  person_visits pv on menu.pizzeria_id = pv.pizzeria_id
                 INNER JOIN  person p2 on p2.id = pv.person_id
        WHERE price < pprice
          AND p2.name = pperson
          AND visit_date = pdate;
END;
$BODY$ LANGUAGE PLPGSQL;
