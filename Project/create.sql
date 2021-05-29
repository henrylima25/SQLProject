-- Henrique Lima, Fall 2019

-- create.sql Version 2

-- The file will create all tables of the schema

-- Based on Physical Schema Version:2

-- Change Summary: Version 2
--	Added checks to HoursWorked
--	Added State to Customer

-------------------------------------------------------------------------------------------------------------------------------
\o 'D:/X/spoolCreate.txt'

-- Output script execution data
\qecho -n 'Script run on '
\qecho -n `date /t`
\qecho -n 'at '
\qecho `time /t`
\qecho -n 'Script run by ' :USER ' on server ' :HOST ' with db ' :DBNAME
\qecho ' '
\qecho 


BEGIN TRANSACTION;


\qecho Creating Assistant table
\qecho ----------------------------
CREATE TABLE IF NOT EXISTS Assistant
(
  AssistID INTEGER NOT NULL PRIMARY KEY,
  Name VARCHAR(1000) NOT NULL CHECK(CHAR_LENGTH(TRIM(Name)) > 0),
  HoursWorked INTEGER NOT NULL CHECK(HoursWorked BETWEEN 0 AND 24)
);

\qecho ' '
\qecho Creating Groomer table
\qecho ----------------------------
CREATE TABLE IF NOT EXISTS Groomer
(
  GroomID INTEGER NOT NULL PRIMARY KEY,
  Name VARCHAR(1000) NOT NULL CHECK(CHAR_LENGTH(TRIM(Name)) > 0),
  HoursWorked INTEGER NOT NULL CHECK(HoursWorked BETWEEN 0 AND 24)
);

\qecho ' '
\qecho Creating Customer table
\qecho ----------------------------
CREATE TABLE IF NOT EXISTS Customer
(
  ID INTEGER NOT NULL PRIMARY KEY,
  Name VARCHAR(1000) UNIQUE NOT NULL CHECK(CHAR_LENGTH(TRIM(Name)) > 0),
  Street VARCHAR(1000) NOT NULL CHECK(CHAR_LENGTH(TRIM(Street)) > 0),
  City VARCHAR(1000) NOT NULL CHECK(CHAR_LENGTH(TRIM(City)) > 0),
  Zip VARCHAR(10) NOT NULL CHECK(CHAR_LENGTH(TRIM(Zip)) > 0),
  State VARCHAR(1000) NOT NULL CHECK(CHAR_LENGTH(TRIM(State)) > 0),
  DateOfService DATE
);

\qecho ' '
\qecho Creating Pet table
\qecho ----------------------------
CREATE TABLE IF NOT EXISTS Pet
(
  AniID INTEGER NOT NULL PRIMARY KEY,
  AnimalName VARCHAR(1000) NOT NULL CHECK(CHAR_LENGTH(TRIM(AnimalName)) > 0),
  RabiesDone BOOLEAN NOT NULL
);

\qecho ' '
\qecho Creating Visit table
\qecho ----------------------------
CREATE TABLE IF NOT EXISTS Visit
(
  GroomID INTEGER NOT NULL,
  AssistID INTEGER,
  StartOfAppointment TIMESTAMP NOT NULL,
  EndOfAppointment TIMESTAMP NOT NULL CHECK(EndOfAppointment > StartOfAppointment),
  Total INTEGER NOT NULL,
  CONSTRAINT visit_pk PRIMARY KEY(GroomID),
  CONSTRAINT visit_groom_fk FOREIGN KEY(GroomID) REFERENCES Groomer(GroomID),
  CONSTRAINT visit_assist_fk FOREIGN KEY(AssistID) REFERENCES Assistant(AssistID)
);

\qecho ' '
\qecho Creating Visit_NameOfProcedures table
\qecho ----------------------------
CREATE TABLE IF NOT EXISTS Visit_NameOfProcedures
(
  GroomID INTEGER NOT NULL,
  NameOfProcedure VARCHAR(100) NOT NULL CHECK(CHAR_LENGTH(TRIM(NameOfProcedure)) > 0),
  CONSTRAINT visitName_pk PRIMARY KEY(GroomID, NameOfProcedure),
  CONSTRAINT visitName_groom_fk FOREIGN KEY(GroomID) REFERENCES Groomer(GroomID)
);

\qecho ' '
\qecho Creating Visit_CostOfProcedures table
\qecho ----------------------------
CREATE TABLE IF NOT EXISTS Visit_CostOfProcedures
(
  GroomID INTEGER NOT NULL,
  CostOfProcedure VARCHAR(100) NOT NULL CHECK(CHAR_LENGTH(TRIM(CostOfProcedure)) > 0),
  CONSTRAINT visitCost_pk PRIMARY KEY(GroomID, CostOfProcedure),
  CONSTRAINT visitCost_groom_fk FOREIGN KEY(GroomID) REFERENCES Groomer(GroomID)
);


COMMIT;


\qecho ' '
\qecho ----------------------------
\qecho End of script

-- Turn off spooling
\o