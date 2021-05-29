-- Henrique Lima, Fall 2019

-- reportsETC.sql Version 1

-- This file will test userEdits.sql

-- Based on Physical Schema Version:2

-- Change Summary: Version 1

-------------------------------------------------------------------------------------------------------------------------------
\o 'D:/X/spoolReportsEtc.txt'

-- Output script execution data
\qecho -n 'Script run on '
\qecho -n `date /t`
\qecho -n 'at '
\qecho `time /t`
\qecho -n 'Script run by ' :USER ' on server ' :HOST ' with db ' :DBNAME
\qecho ' '
\qecho


BEGIN TRANSACTION;

\qecho -- Display Assistants that worked with Groomers
SELECT AssistID, GroomID
FROM Visit
WHERE AssistID > 0
GROUP BY AssistID, GroomID
ORDER BY AssistID, GroomID;

\qecho -- Display Customers that have had their service recorded
SELECT Name, DateOfService
FROM Customer
Where DateOfService IS NOT NULL
GROUP BY Name, DateOfService;


COMMIT;


\qecho ' '
\qecho ----------------------------
\qecho 'End of script'

-- Turn off spooling
\o
