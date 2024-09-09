--By Jose Come 08Set2024

--Creating database if doesn't exist and use it
CREATE DATABASE IF NOT EXISTS exercises;
USE exercises;

-----------------------CREATE TAB;E---------------------------------------------
--Drop tables if exist
DROP TABLE IF EXISTS persons;
DROP TABLE IF EXISTS persons_2;
DROP TABLE IF EXISTS persons_3;
DROP TABLE IF EXISTS Address_fk;
DROP TABLE IF EXISTS persons_pk_1;
DROP TABLE IF EXISTS persons_pk_2;
DROP TABLE IF EXISTS persons_pk_3;
DROP TABLE IF EXISTS persons_u;

--Creating tables
CREATE TABLE Persons (
    PersonID int,
    FirstName varchar(255),
    LastName varchar(255)
);
CREATE TABLE Persons_2 AS 
    SELECT PersonID, FirstName, LastName FROM Persons
;
CREATE TABLE Persons_3 AS 
    SELECT PersonID, FirstName, LastName  FROM Persons 
    WHERE PersonID < 4
;
CREATE TABLE Persons_pk_1 (
    PersonID int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    FirstName varchar(255),
    LastName varchar(255)
);
CREATE TABLE Persons_pk_2 (
    PersonID int NOT NULL AUTO_INCREMENT,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    PRIMARY KEY (PersonID)
);
CREATE TABLE Persons_pk_3 (
    PersonID int NOT NULL AUTO_INCREMENT,
    FirstName varchar(255),
    LastName varchar(255),
    CONSTRAINT PK_Person PRIMARY KEY (PersonID, LastName)
);
CREATE TABLE Address_fk (
    AddressID int NOT NULL AUTO_INCREMENT,
    address varchar(255),
    PersonID int,
    PRIMARY KEY (AddressID),
    FOREIGN KEY (PersonID) REFERENCES Persons_pk_1(PersonID)
);
CREATE TABLE Persons_u (
    PersonID int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    Phone int(11) unique,
    FirstName varchar(255),
    LastName varchar(255)
);

--Inserting Records
INSERT INTO Persons (PersonID, FirstName, LastName) VALUES (1, 'Jose', 'Come');
INSERT INTO Persons_2 (PersonID, FirstName, LastName) VALUES (1, 'Jose', 'Come');
INSERT INTO Persons_3 (PersonID, FirstName, LastName) VALUES (1, 'Jose', 'Come');
INSERT INTO Persons_pk_1 (FirstName, LastName) VALUES ('Jose', 'Come');
INSERT INTO Persons_pk_2 (FirstName, LastName) VALUES ('Jose', 'Come');
INSERT INTO Persons_pk_3 (FirstName, LastName) VALUES ('Jose', 'Come');
INSERT INTO Address_fk (address, PersonID) VALUES ('Address 1234', 1);
INSERT INTO Persons_u (Phone, FirstName, LastName) VALUES (1234, 'Jose', 'Come');

-----------------------INSERT/UPDATE/DELETE---------------------------------------------
CREATE TABLE preferred_colors (
    ColorID int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    ColorName varchar(20) UNIQUE
);
INSERT INTO preferred_colors (ColorName) VALUES ('Blue');
INSERT INTO preferred_colors (ColorName) VALUES ('Green');
INSERT INTO preferred_colors (ColorName) VALUES ('Yellow');
INSERT INTO preferred_colors (ColorName) VALUES ('Grey');
ALTER TABLE persons_pk_1 ADD column ColorID int NULL;

INSERT INTO Persons (PersonID, FirstName, LastName) VALUES (1, 'Jose', 'Come');
INSERT INTO Persons_pk_1 (FirstName, LastName) VALUES ('Jose', 'Come');
INSERT INTO Persons_2 SELECT * FROM Persons;
INSERT INTO Persons_2 SELECT * FROM Persons WHERE FirstName = 'Jose';
INSERT INTO Persons_pk_1 (FirstName, LastName,ColorID) VALUES ('Jose', 'Come',(SELECT ColorID From preferred_colors c WHERE c.ColorName='Blue'));
UPDATE Persons SET FirstName='Come', LastName='Come';
UPDATE Persons SET FirstName='Jose', LastName= 'Come' WHERE PersonID=1;
DELETE FROM Persons;
DELETE FROM Persons_2 WHERE PersonID=1;
DELETE FROM Persons WHERE PersonID=1 AND LastName='Come';

