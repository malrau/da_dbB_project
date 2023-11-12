-- database creation and use
DROP DATABASE IF EXISTS dbB_MYSQL_test;

CREATE DATABASE dbB_MYSQL_test;

USE dbB_MYSQL_test;

-- table creation to define the logical schema for the 250k, 500k, 750k 
-- and 1m records file: each csv file must match this schema

-- 250k records
CREATE TABLE smallDB(
	courseID INT,
	discipline VARCHAR(25),
	courseName VARCHAR(110),
	courseYear INT,
	syllabus VARCHAR(130),
	studentID INT,
	firstName VARCHAR(20),
	lastName VARCHAR(25),
	dateOfBirth VARCHAR(10),
	genre VARCHAR(10),
	country VARCHAR(60),
	town VARCHAR(30),
	email VARCHAR(40),
	materialID INT,
	unit VARCHAR(10),
	materialType VARCHAR(15),
	materialName VARCHAR(120),
	dimension INT,
	accessDate VARCHAR(10),
	recordID INT PRIMARY KEY
	);

LOAD DATA
LOCAL INFILE 'dataset250k.csv'
INTO TABLE smallDB
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


-- 500k records
CREATE TABLE mediumDB(
	courseID INT,
	discipline VARCHAR(25),
	courseName VARCHAR(110),
	courseYear INT,
	syllabus VARCHAR(130),
	studentID INT,
	firstName VARCHAR(20),
	lastName VARCHAR(25),
	dateOfBirth VARCHAR(10),
	genre VARCHAR(10),
	country VARCHAR(60),
	town VARCHAR(30),
	email VARCHAR(40),
	materialID INT,
	unit VARCHAR(10),
	materialType VARCHAR(15),
	materialName VARCHAR(120),
	dimension INT,
	accessDate VARCHAR(10),
	recordID INT PRIMARY KEY
	);

LOAD DATA
LOCAL INFILE 'dataset500k.csv'
INTO TABLE mediumDB
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


-- 750k records
CREATE TABLE largeDB(
	courseID INT,
	discipline VARCHAR(25),
	courseName VARCHAR(110),
	courseYear INT,
	syllabus VARCHAR(130),
	studentID INT,
	firstName VARCHAR(20),
	lastName VARCHAR(25),
	dateOfBirth VARCHAR(10),
	genre VARCHAR(10),
	country VARCHAR(60),
	town VARCHAR(30),
	email VARCHAR(40),
	materialID INT,
	unit VARCHAR(10),
	materialType VARCHAR(15),
	materialName VARCHAR(120),
	dimension INT,
	accessDate VARCHAR(10),
	recordID INT PRIMARY KEY
	);

LOAD DATA
LOCAL INFILE 'dataset750k.csv'
INTO TABLE largeDB
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


-- 1m records
CREATE TABLE humongousDB(
	courseID INT,
	discipline VARCHAR(25),
	courseName VARCHAR(110),
	courseYear INT,
	syllabus VARCHAR(130),
	studentID INT,
	firstName VARCHAR(20),
	lastName VARCHAR(25),
	dateOfBirth VARCHAR(10),
	genre VARCHAR(10),
	country VARCHAR(60),
	town VARCHAR(30),
	email VARCHAR(40),
	materialID INT,
	unit VARCHAR(10),
	materialType VARCHAR(15),
	materialName VARCHAR(120),
	dimension INT,
	accessDate VARCHAR(10),
	recordID INT PRIMARY KEY
	);

LOAD DATA
LOCAL INFILE 'dataset1m.csv'
INTO TABLE humongousDB
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
