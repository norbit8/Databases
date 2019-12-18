SELECT DISTINCT did, max(fee), min(fee), avg(fee)
FROM Visit NATURAL RIGHT JOIN Doctor
GROUP BY did
ORDER BY did ASC;
