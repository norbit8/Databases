DELETE FROM Patient 
WHERE pid not in (SELECT pid FROM Visit); 
DROP VIEW IF EXISTS AvarageBmi4Doctor;