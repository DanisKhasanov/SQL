SELECT name || ' (age:' || age::VARCHAR || ',gender:''' || gender || ''',address:''' || address ||
       ''')' AS person_information
FROM person
ORDER BY person_information ASC;
