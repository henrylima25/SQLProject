-- Henrique Lima, Fall 2019

-- allData.sql Version 1

-- The file will read all tables or view of all the tables of the schema

-- Based on Physical Schema Version:2

-- Change Summary: Version 1

-------------------------------------------------------------------------------------------------------------------------------
\o 'D:/X/spoolAllData.txt'

-- Output script execution data
\qecho -n 'Script run on '
\qecho -n `date /t`
\qecho -n 'at '
\qecho `time /t`
\qecho -n 'Script run by ' :USER ' on server ' :HOST ' with db ' :DBNAME
\qecho ' '
\qecho


BEGIN TRANSACTION;


--Assistant
\qecho Assistant table 
\qecho ---------------------------- 
\qecho ' '
SELECT AssistID, Name, HoursWorked
FROM Assistant
ORDER BY AssistID;

--Groomer
\qecho Groomer table 
\qecho ---------------------------- 
\qecho ' '
SELECT GroomID, Name, HoursWorked
FROM Groomer
ORDER BY GroomID;

--Customer
\qecho Customer table 
\qecho ---------------------------- 
\qecho ' '
SELECT ID, Name, Street, City, Zip, DateOfService
FROM Customer
ORDER BY ID;

--Pet
\qecho Pet table 
\qecho ---------------------------- 
\qecho ' '
SELECT AniID, AnimalName, RabiesDone
FROM Pet
ORDER BY AniID;

--Visit
\qecho Visit table 
\qecho ---------------------------- 
\qecho ' '
SELECT GroomID, AssistID, StartOfAppointment, EndOfAppointment, Total
FROM Visit
ORDER BY GroomID;

--Visit_NameOfProcedures
\qecho Visit_NameOfProcedures table 
\qecho ---------------------------- 
\qecho ' '
SELECT GroomID, NameOfProcedure
FROM Visit_NameOfProcedures
ORDER BY GroomID;

--Visit_CostOfProcedures
\qecho Visit_CostOfProcedures table 
\qecho ---------------------------- 
\qecho ' '
SELECT GroomID, CostOfProcedure
FROM Visit_CostOfProcedures
ORDER BY GroomID;


COMMIT;


\qecho ' '
\qecho ----------------------------
\qecho 'End of script'

-- Turn off spooling
\o