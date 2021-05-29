-- Henrique Lima, Fall 2019

-- userEdits.sql Version 1

-- The file will create all information needed for the tables for the purpose of testing.

-- Based on Physical Schema Version:2

-- Change Summary: Version 1

-------------------------------------------------------------------------------------------------------------------------------
\o 'D:/X/spoolUserEdits.txt'

-- Output script execution data
\qecho -n 'Script run on '
\qecho -n `date /t`
\qecho -n 'at '
\qecho `time /t`
\qecho -n 'Script run by ' :USER ' on server ' :HOST ' with db ' :DBNAME
\qecho ' '
\qecho


BEGIN TRANSACTION;


-- Clear old data from tables for testing
DELETE FROM Assistant;
DELETE FROM Groomer;
DELETE FROM Customer;
DELETE FROM Pet;
DELETE FROM Visit;
DELETE FROM Visit_NameOfProcedures;
DELETE FROM Visit_CostOfProcedures;

--Populate it with information
--Assistant
INSERT INTO Assistant(AssistID, Name, HoursWorked)
VALUES
    (1415236, 'Hudson Marx', 8),
    (1411245, 'Alex Corn', 8),
    (1414587, 'Kevin Sheif', 8),
    (1418521, 'Monica Yu', 8),
    (1418523, 'Steven Ray', 8),
    (1414268, 'Nuhemas Gonzales', 8),
    (1417139, 'Seth Smith', 8),
    (1411132, 'Kennedy Lambartey', 8),
    (1412045, 'Rachel Wong', 8),
    (1410012, 'Ryan Davidson', 8)
;

--Groomer
INSERT INTO Groomer(GroomID, Name, HoursWorked)
VALUES
    (4071592, 'Komal Barber', 8),
    (4071463, 'Elvis Hirst', 8),
    (4078077, 'Klara Rhodes', 8),
    (4070102, 'Tabitha Hagan', 8),
    (4073248, 'Winifred Mcghee', 8),
    (4072224, 'Keanu Hall', 8),
    (4071884, 'Inaya Scott', 8),
    (4071234, 'Shirlet Hartley', 8),
    (4074321, 'Arooj Mccoy', 8),
    (4077041, 'Yolanda Quintana', 8)
;

--Customer
INSERT INTO Customer(ID, Name, Street, City, Zip, State, DateOfService)
VALUES
    (2001254, 'Harry Fuentes', '6 Maes Morfa Ave', 'Danbury', 06810, 'CT', NULL),
    (2001472, 'Arjan Escobar', '12 Maes Morfa Ave', 'Danbury', 06810, 'CT', NULL),
    (2001423, 'Jaskaran Brookes', '6 Marina Rd', 'Danbury', 06810, 'CT', NULL),
    (2001542, 'Rogan Mcbride', '4 Meadow Lea Dr', 'Danbury', 06810, 'CT', NULL),
    (2002014, 'Azeem Maguire', '56-2 Moor Lane Rd', 'Danbury', 06810, 'CT', NULL),
    (2009741, 'Jayden Warren', '1 Malaslea Ave', 'Danbury', 06810, 'CT', '2017-01-13'),
    (2010024, 'Mabel Bolton', '4 Maes Morfa Ave', 'Danbury', 06810, 'CT', '2017-01-19'),
    (2000415, 'Clarissa Blackwell', '2 Maes Morfa Rd', 'Danbury', 06810, 'CT', '2017-03-21'),
    (2042015, 'Rojin Bentley', '3 Marina Dr', 'Danbury', 06810, 'CT', '2017-05-02'),
    (2004455, 'Emer Knott', '6 First St', 'Danbury', 06810, 'CT', NULL)
;

--Pet
INSERT INTO Pet(AniID, AnimalName, RabiesDone)
VALUES
    (9101592, 'Mr.Socks', TRUE),
    (9101463, 'Mr.Water', TRUE),
    (9108077, 'Miss Mittens', TRUE),
    (9100102, 'Wasabi', TRUE),
    (9103248, 'Decim', TRUE),
    (9102224, 'Mr.Pants', TRUE),
    (9101884, 'Mrs.Pants', TRUE),
    (9101234, 'Yellow', TRUE),
    (9104321, 'Anthem', TRUE),
    (9107041, 'Hopper', TRUE)
;

--Visit
INSERT INTO Visit(GroomID, AssistID, StartOfAppointment, EndOfAppointment, Total)
VALUES
    (4071592, NULL, '2017-01-21 09:30:00', '2017-01-21 12:30:00', 300),
    (4071463, NULL, '2017-05-12 09:30:00', '2017-05-12 12:30:00', 300),
    (4078077, NULL, '2017-05-02 15:00:00', '2017-05-02 18:00:00', 300),
    (4070102, NULL, '2017-05-02 09:30:00', '2017-05-02 12:30:00', 550),
    (4073248, 1418523, '2017-03-21 09:30:00', '2017-03-21 12:30:00', 300),
    (4072224, NULL, '2017-01-19 09:30:00', '2017-01-19 12:30:00', 300),
    (4071884, 1410012, '2017-01-13 15:00:00', '2017-01-13 18:00:00', 300),
    (4071234, NULL, '2017-01-13 09:30:00', '2017-01-13 12:30:00', 550),
    (4074321, 1412045, '2017-01-11 09:30:00', '2017-01-11 12:30:00', 550),
    (4077041, 1415236, '2017-01-10 09:30:00', '2017-01-10 12:30:00', 550)
;


--Visit_NameOfProcedures
INSERT INTO Visit_NameOfProcedures(GroomID, NameOfProcedure)
VALUES
    (4071592, 'Cut, Bathe'),
    (4071463, 'Cut, Bathe'),
    (4078077, 'Cut, Bathe'),
    (4070102, 'Cut, Bathe, Vacinate'),
    (4073248, 'Cut, Bathe'),
    (4072224, 'Cut, Bathe'),
    (4071884, 'Cut, Bathe'),
    (4071234, 'Cut, Bathe, Vacinate'),
    (4074321, 'Cut, Bathe, Vacinate'),
    (4077041, 'Cut, Bathe, Vacinate')
;

--Visit_CostOfProcedures
INSERT INTO Visit_CostOfProcedures(GroomID, CostOfProcedure)
VALUES
    (4071592, '250'),
    (4071463, '250'),
    (4078077, '250'),
    (4070102, '500'),
    (4073248, '250'),
    (4072224, '250'),
    (4071884, '250'),
    (4071234, '500'),
    (4074321, '500'),
    (4077041, '500')
;


--User Edits
--Due to a loss of ID and improper punching, an Assistant needs a brand new ID card and an update on their hours.

-- Registrar updates employee id
UPDATE Assistant
SET AssistID = 1420010
WHERE AssistID = 1411245;

-- Registrar updates employee hours
UPDATE Assistant
SET HoursWorked = 7
WHERE AssistID = 1420010;


COMMIT;

\qecho ' '
\qecho ----------------------------
\qecho 'End of script'

-- Turn off spooling
\o