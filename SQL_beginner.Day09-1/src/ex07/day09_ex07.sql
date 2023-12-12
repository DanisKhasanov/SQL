CREATE OR REPLACE FUNCTION func_minimum(VARIADIC ARR NUMERIC[])
    RETURNS NUMERIC AS
$BODY$
DECLARE
    min_value numeric;
BEGIN
    SELECT MIN(value)
    INTO min_value
    FROM unnest(ARR) AS value;
    RETURN min_value;
END;
$BODY$ LANGUAGE plpgsql;

