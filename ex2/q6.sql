SELECT DISTINCT did
FROM Patient NATURAL JOIN (select DISTINCT pid,did from Visit) V
WHERE bmi>30
GROUP BY did
HAVING count(*)=3
ORDER BY did ASC;
