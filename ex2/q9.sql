UPDATE Doctor
SET CLINIC = CASE 
		 WHEN clinic = 1 THEN 2
		 WHEN clinic = 2 THEN 1
END;
