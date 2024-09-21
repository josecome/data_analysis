-- By Jose Come 08Set2024

--List of Statements
-- 1 - CREATE TABLE
-- 2 - INSERT|UPDATE|DELETE
-- 3 - JOIN
-- 4 - Removing Duplicates
-- 5 - Aggregate Functions
-- 6 - Subquery

--Creating database if doesn't exist and use it
CREATE DATABASE IF NOT EXISTS exercises;
USE exercises;

-- ---------------------1 - CREATE TABLE---------------------------------------------
-- Drop tables if exist
DROP TABLE IF EXISTS persons;
DROP TABLE IF EXISTS persons_2;
DROP TABLE IF EXISTS persons_3;
DROP TABLE IF EXISTS Address_fk;
DROP TABLE IF EXISTS persons_pk_1;
DROP TABLE IF EXISTS persons_pk_2;
DROP TABLE IF EXISTS persons_pk_3;
DROP TABLE IF EXISTS persons_u;

-- Creating tables
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

-- Inserting Records
INSERT INTO Persons (PersonID, FirstName, LastName) VALUES (1, 'Jose', 'Come');
INSERT INTO Persons_2 (PersonID, FirstName, LastName) VALUES (1, 'Jose', 'Come');
INSERT INTO Persons_3 (PersonID, FirstName, LastName) VALUES (1, 'Jose', 'Come');
INSERT INTO Persons_pk_1 (FirstName, LastName) VALUES ('Jose', 'Come');
INSERT INTO Persons_pk_2 (FirstName, LastName) VALUES ('Jose', 'Come');
INSERT INTO Persons_pk_3 (FirstName, LastName) VALUES ('Jose', 'Come');
INSERT INTO Address_fk (address, PersonID) VALUES ('Address 1234', 1);
INSERT INTO Persons_u (Phone, FirstName, LastName) VALUES (1234, 'Jose', 'Come');

-- ---------------------2 - INSERT/UPDATE/DELETE---------------------------------------------
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
-- ---------------------------------------3 - JOIN----------------------------------------------------------
-- creating tables
CREATE TABLE table_1 (
    id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    column_1 int(4)
);
CREATE TABLE table_2 (
    id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    column_2 int(2)
);

INSERT INTO table_1 (column_1) VALUES (20);
INSERT INTO table_1 (column_1) VALUES (30);
INSERT INTO table_1 (column_1) VALUES (40);
INSERT INTO table_1 (column_1) VALUES (50);

INSERT INTO table_2 (column_2) VALUES (25);
INSERT INTO table_2 (column_2) VALUES (35);
INSERT INTO table_2 (column_2) VALUES (45);
INSERT INTO table_2 (column_2) VALUES (55);

DELETE FROM table_1 WHERE id = 3;
DELETE FROM table_2 WHERE id = 4;

SELECT * FROM table_1;
SELECT * FROM table_2;
-- Running join
-- INNER JOIN
SELECT * FROM table_1 INNER JOIN table_2 USING (id);
SELECT * FROM table_1 INNER JOIN table_2 ON table_1.id = table_2.id;

-- LEFT JOIN
SELECT * FROM table_1 LEFT JOIN table_2 USING (id);
SELECT * FROM table_1 LEFT JOIN table_2 ON table_1.id = table_2.id;

-- RIGHT JOIN
SELECT * FROM table_1 RIGHT JOIN table_2 USING (id);
SELECT * FROM table_1 RIGHT JOIN table_2 ON table_1.id = table_2.id;

-- SELF JOIN
SELECT * FROM table_1 t1, table_1 t2 WHERE t1.id = t2.id;

-- UNION
SELECT * FROM table_1  UNION SELECT * FROM table_2;

-- UNION ALL
SELECT * FROM table_1  UNION ALL SELECT * FROM table_2;

-- IN SEMIJOIN
SELECT * FROM table_2 WHERE id IN (SELECT id FROM table_1);

-- EXISTS SEMIJOIN
SELECT * FROM table_1 WHERE EXISTS (SELECT id FROM table_2 WHERE table_1.id = table_2.id);
-- ------------------------4 - Removing Duplicates----------------------------------------------------
-- Creating tables
DROP TABLE IF EXISTS table_with_duplicates;
DROP TABLE IF EXISTS table_with_duplicates_2;
CREATE TABLE table_with_duplicates (id int(1), column_1 tinyint(1), duplicated int(1));
INSERT INTO table_with_duplicates (id, column_1, duplicated) VALUES('1', 0, '1');
INSERT INTO table_with_duplicates (id, column_1, duplicated) VALUES('2', 0, '2');
INSERT INTO table_with_duplicates (id, column_1, duplicated) VALUES('3', 1, '2');
INSERT INTO table_with_duplicates (id, column_1, duplicated) VALUES('4', 1, '1');
INSERT INTO table_with_duplicates (id, column_1, duplicated) VALUES('5', 0, '5');
INSERT INTO table_with_duplicates (id, column_1, duplicated) VALUES('6', 0, '6');
INSERT INTO table_with_duplicates (id, column_1, duplicated) VALUES('7', 1, '5');
INSERT INTO table_with_duplicates (id, column_1, duplicated) VALUES('8', 0, '3');
INSERT INTO table_with_duplicates (id, column_1, duplicated) VALUES('9', 1, '3');
INSERT INTO table_with_duplicates (id, column_1, duplicated) VALUES('10', 'G2', '6');
CREATE TABLE table_with_duplicates_2 (id int(1), column_1 char(2), duplicated int(1));
INSERT INTO table_with_duplicates_2 (id, column_1, duplicated) VALUES('1', 0, '1');
INSERT INTO table_with_duplicates_2 (id, column_1, duplicated) VALUES('2', 0, '2');
INSERT INTO table_with_duplicates_2 (id, column_1, duplicated) VALUES('3', 1, '2');
INSERT INTO table_with_duplicates_2 (id, column_1, duplicated) VALUES('4', 1, '1');
INSERT INTO table_with_duplicates_2 (id, column_1, duplicated) VALUES('5', 0, '5');
INSERT INTO table_with_duplicates_2 (id, column_1, duplicated) VALUES('6', 0, '6');
INSERT INTO table_with_duplicates_2 (id, column_1, duplicated) VALUES('7', 1, '5');
INSERT INTO table_with_duplicates_2 (id, column_1, duplicated) VALUES('8', 0, '3');
INSERT INTO table_with_duplicates_2 (id, column_1, duplicated) VALUES('9', 1, '3');
INSERT INTO table_with_duplicates_2 (id, column_1, duplicated) VALUES('10', 1, '6');
SELECT * FROM table_with_duplicates;
SELECT * FROM table_with_duplicates_2;

-- Removing duplicates
DELETE t1 FROM table_with_duplicates t1 INNER JOIN table_with_duplicates t2 
WHERE t1.duplicated = t2.duplicated AND t1.id > t2.id;
DELETE t1 FROM table_with_duplicates_2 t1 INNER JOIN table_with_duplicates_2 t2 
WHERE t1.duplicated = t2.duplicated AND t1.id < t2.id;

-- Displaying records
SELECT * FROM table_with_duplicates ORDER BY id;
SELECT * FROM table_with_duplicates_2 ORDER BY id;

-- ------------------------5 - Aggregate Functions----------------------------------------------------
-- Creating tables
CREATE TABLE fruits (
    id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    Name varchar(20),
    Quantity int(2)
);

-- Inserting data
INSERT INTO fruits (Name, Quantity) VALUES ('Banana', 10);
INSERT INTO fruits (Name, Quantity) VALUES ('Banana', 20);
INSERT INTO fruits (Name, Quantity) VALUES ('Orange', 30);
INSERT INTO fruits (Name, Quantity) VALUES ('Orange', 40);
INSERT INTO fruits (Name, Quantity) VALUES ('Apple', 50);
INSERT INTO fruits (Name, Quantity) VALUES ('Apple', 60);

-- Retrieving all data
SELECT * FROM fruits;

-- Retrieving aggregated data
SELECT name, SUM(Quantity) FROM fruits GROUP BY name;
SELECT name, SUM(Quantity) , AVG(Quantity) FROM fruits GROUP BY name;
SELECT Name, SUM(Quantity) AS Total_Quantity FROM fruits GROUP BY name; 
SELECT Name, SUM(Quantity) AS Total_Quantity FROM fruits GROUP BY name ORDER BY name ASC;
SELECT Name, SUM(Quantity) AS Total_Quantity FROM fruits GROUP BY name ORDER BY name DESC;
SELECT Name, COUNT(Quantity) FROM fruits GROUP BY name HAVING COUNT(*) > 1;

-- ------------------------6 - Subquery ----------------------------------------------------
-- Creating tables
CREATE TABLE fruit_code (
    Id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    Name varchar(20)
);
CREATE TABLE fruits (
    id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    Quantity int(2),
    Fruit_id int,
    FOREIGN KEY (Fruit_id) REFERENCES fruit_code(Id)    
);

-- Inserting data
INSERT INTO fruit_code (Name) VALUES ('Banana'); 
INSERT INTO fruit_code (Name) VALUES ('Orange');
INSERT INTO fruit_code (Name) VALUES ('Apple');
INSERT INTO fruits (Quantity, Fruit_id) VALUES (10, 1);
INSERT INTO fruits (Quantity, Fruit_id) VALUES (20, 1);
INSERT INTO fruits (Quantity, Fruit_id) VALUES (30, 2);
INSERT INTO fruits (Quantity, Fruit_id) VALUES (40, 2);
INSERT INTO fruits (Quantity, Fruit_id) VALUES (50, 3);
INSERT INTO fruits (Quantity, Fruit_id) VALUES (60, 3);

-- Selecting data
SELECT * FROM fruit_code;
SELECT * FROM fruits;

-- Statements wit Subquery
SELECT * FROM fruits WHERE Fruit_id = (SELECT id FROM fruit_code WHERE name = 'Banana'); 
UPDATE fruits SET Fruit_id = 1 WHERE Fruit_id = (SELECT id FROM fruit_code WHERE name = 'Orange');
SELECT * FROM fruits;
DELETE FROM fruits WHERE Fruit_id = (SELECT id FROM fruit_code WHERE name = 'Apple');
SELECT * FROM fruits;




