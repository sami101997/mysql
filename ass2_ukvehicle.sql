--CREATE SCHEMA accidents;

USE Sami;

/* -------------------------------- */
/* Create Tables */
CREATE TABLE accident(
	accident_index VARCHAR(13),
    accident_severity INT
);

CREATE TABLE vehicles(
	accident_index VARCHAR(13),
    vehicle_type VARCHAR(50)
);

/* First: for vehicle types, create new csv by extracting data from Vehicle Type sheet from Road-Accident-Safety-Data-Guide.xls */
CREATE TABLE vehicle_types(
	vehicle_code INT,
    vehicle_type VARCHAR(100)
);



Select * from accident
select * from vehicle_types
Select * from vehicles
--31943

-- Ques 1 

Select * from accident where accident_index in (
Select accident_index from vehicles where vehicle_type IN (
select Vehicle_code from vehicle_types where vehicle_type like '%Motorcycle%') and accident_severity = 2) 

--Ques 2

select vt.vehicle_type,count(v.accident_index) as Total_Accidents, a.accident_severity from vehicles v inner join vehicle_types vt on v.vehicle_type = vt.vehicle_code
Inner join accident a on v.accident_index = a.accident_index
group by vt.vehicle_type,a.accident_severity order by a.accident_severity asc

--Que 3

select vt.vehicle_type, max(a.accident_severity) from vehicles v inner join vehicle_types vt on v.vehicle_type = vt.vehicle_code
Inner join accident a on v.accident_index = a.accident_index
group by vt.vehicle_type,a.accident_severity -- need to check

--Que 4

WITH AccidentsPerType AS (SELECT vt.vehicle_type,COUNT(v.accident_index) AS Total_Accidents FROM vehicles v
    INNER JOIN vehicle_types vt ON v.vehicle_type = vt.vehicle_code INNER JOIN 
        accident a ON v.accident_index = a.accident_index 
    WHERE vt.vehicle_type LIKE '%Motorcycle%' GROUP BY vt.vehicle_type)

SELECT vehicle_type,AVG(Total_Accidents) AS Average_Accidents FROM AccidentsPerType GROUP BY vehicle_type ORDER BY Average_Accidents ASC;
