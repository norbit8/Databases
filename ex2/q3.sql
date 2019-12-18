SELECT DISTINCT pid,pname 
FROM Visit NATURAL JOIN Doctor NATURAL JOIN Patient 
WHERE specialty='orthopedist' 
INTERSECT
SELECT DISTINCT pid,pname 
FROM Visit NATURAL JOIN Doctor NATURAL JOIN Patient 
WHERE specialty='pediatrician'
ORDER BY pid,pname ASC;