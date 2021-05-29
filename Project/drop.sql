-- Henrique Lima, Fall 2019

-- drop.sql Version 1

-- The file will drop all tables of the schema

-- Based on Physical Schema Version:2

-- Change Summary: Version 1

---------------------------------------------------------------------------------------
\o 'D:/X/spoolDrop.txt'

-- Output script execution data
\qecho -n 'Script run on '
\qecho -n `date /t`
\qecho -n 'at '
\qecho `time /t`
\qecho -n 'Script run by ' :USER ' on server ' :HOST ' with db ' :DBNAME
\qecho ' '
\qecho


BEGIN TRANSACTION;


\qecho Dropping Visit_CostOfProcedures
\qecho ---------------------------- 
DROP TABLE IF EXISTS Visit_CostOfProcedures; 
  

\qecho ' ' 
\qecho Dropping Visit_NameOfProcedures
\qecho ---------------------------- 
DROP TABLE IF EXISTS Visit_NameOfProcedures; 


\qecho ' ' 
\qecho Dropping Visit
\qecho ---------------------------- 
DROP TABLE IF EXISTS Visit; 


\qecho ' ' 
\qecho Dropping Pet 
\qecho ---------------------------- 
DROP TABLE IF EXISTS Pet; 


\qecho ' ' 
\qecho Dropping Customer 
\qecho ---------------------------- 
DROP TABLE IF EXISTS Customer; 


\qecho ' ' 
\qecho Dropping Groomer; 
\qecho ---------------------------- 
DROP TABLE IF EXISTS Groomer; 


\qecho ' ' 
\qecho Dropping Assistant
\qecho ---------------------------- 
DROP TABLE IF EXISTS Assistant;


COMMIT;


\qecho ' '
\qecho ----------------------------
\qecho End of script

-- Turn off spooling
\o