SELECT DISTINCT pid,did
FROM Doctor D, Patient P 
WHERE NOT EXISTS (SELECT pid, did FROM Visit V WHERE D.did = V.did AND P.pid = V.pid)
ORDER BY pid,did ASC;
