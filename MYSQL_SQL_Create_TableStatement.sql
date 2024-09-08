--Drop tables if exist
DROP TABLE IF EXISTS persons;
DROP TABLE IF EXISTS persons_2;
DROP TABLE IF EXISTS persons_3;
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
INSERT INTO Persons_2 (PersonID, FirstName, LastName) VALUES (1, 'Jose', 'Come’);
INSERT INTO Persons_3 (PersonID, FirstName, LastName) VALUES (1, 'Jose', 'Come');
INSERT INTO Persons_pk_1 (FirstName, LastName) VALUES ('Jose', 'Come’);
INSERT INTO Persons_pk_2 (FirstName, LastName) VALUES ('Jose', 'Come’);
INSERT INTO Persons_pk_3 (FirstName, LastName) VALUES ('Jose', 'Come’);
INSERT INTO Address_fk (address, PersonID) VALUES ('Address 1234', 1);
INSERT INTO Persons_u (Phone, FirstName, LastName) VALUES (1234, 'Jose', 'Come');
