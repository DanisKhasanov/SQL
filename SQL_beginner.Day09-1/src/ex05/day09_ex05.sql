DROP FUNCTION fnc_persons_female();
DROP FUNCTION fnc_persons_male();


CREATE OR REPLACE FUNCTION fnc_persons (pgender varchar DEFAULT 'female')
RETURNS TABLE (id INT, name VARCHAR, age INT, gender VARCHAR, address VARCHAR) AS
$BODY$
    SELECT id, name, age, gender, address
    FROM person
    WHERE gender = pgender;
$BODY$ LANGUAGE SQL;

