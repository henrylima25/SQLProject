-- Henrique Lima, Fall 2019

-- describe.sql Version 1

-- The file will describe all tables of the scheme

-- Based on Physical Schema Version:2

-- Change Summary: Version 1

-------------------------------------------------------------------------------------------------------------------------------
\o 'D:/X/spoolDescribe.txt'

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
\d Assistant

--Groomer
\d Groomer

--Customer
\d Customer

--Pet
\d Pet

--Visit
\d Visit

--Visit_NameOfProcedures
\d Visit_NameOfProcedures

--Visit_CostOfProcedures
\d Visit_CostOfProcedures


COMMIT;


\qecho ' '
\qecho ----------------------------
\qecho 'End of script'

-- Turn off spooling
\o