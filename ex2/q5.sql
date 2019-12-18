Select distinct DC.dname
From Doctor DC
Where DC.specialty = 'pediatrician' and not exists 
                  (Select * 
                  From Patient PA
                  Where PA.bmi > 30 and
				  PA.gender='M' and
				  PA.pid not in (Select VI.pid
                                From Visit VI
                                Where DC.did = VI.did))
order by DC.dname ASC;