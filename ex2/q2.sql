SELECT DISTINCT pname 
FROM Visit NATURAL JOIN Doctor NATURAL JOIN Patient 
WHERE dname='Avi Cohen' AND fee=0 ORDER BY pname ASC;