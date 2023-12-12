CREATE OR REPLACE FUNCTION fnc_persons_female()
RETURNS TABLE (id INT, name VARCHAR, age INT, gender VARCHAR, address VARCHAR) AS
$BODY$
    SELECT id, name, age, gender, address
    FROM person
    WHERE gender = 'female';
$BODY$ LANGUAGE SQL;


CREATE OR REPLACE FUNCTION fnc_persons_male()
RETURNS TABLE (id INT, name VARCHAR, age INT, gender VARCHAR, address VARCHAR) AS
$BODY$
    SELECT id, name, age, gender, address
    FROM person
    WHERE gender = 'male';
$BODY$ LANGUAGE SQL;




