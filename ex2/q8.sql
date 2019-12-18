CREATE VIEW AvarageBmi4Doctor AS
SELECT DISTINCT did, avg(bmi) AS bmi_avg
FROM 
(
SELECT DISTINCT did, bmi, pid
FROM Visit NATURAL JOIN Patient
GROUP BY did, bmi, pid
) A
GROUP BY did;

SELECT DISTINCT did 
FROM AvarageBmi4Doctor
WHERE bmi_avg >= ALL (SELECT bmi_avg FROM AvarageBmi4Doctor)
ORDER BY did ASC;