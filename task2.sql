DROP TABLE #TEMP

CREATE TABLE #TEMP
(
NAME NVARCHAR(20),
DURATION INT 
)

INSERT INTO #TEMP (NAME,DURATION) SELECT p.name, SUM(C.DURATION) as duration from phones p inner join calls c on p.phone_number = c.caller 
or p.phone_number = c.callee group by p.phone_number,p.name 

SELECT Name FROM #TEMP WHERE DURATION >= 10


