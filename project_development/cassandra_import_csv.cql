script to create Cassandra keyspace and table

CREATE KEYSPACE dbB_CASSANDRA_test
	WITH REPLICATION = {'class' : 'SimpleStrategy', 'replication_factor' : 3};

CREATE TABLE datasetSmall(
	courseID INT,
	discipline VARCHAR,
	courseName VARCHAR,
	courseYear INT,
	syllabus VARCHAR,
	studentID INT,
	firstName VARCHAR,
	lastName VARCHAR,
	dateOfBirth VARCHAR,
	genre VARCHAR,
	country VARCHAR,
	town VARCHAR,
	email VARCHAR,
	materialID INT,
	unit VARCHAR,
	materialType VARCHAR,
	name VARCHAR,
	dimension INT,
	accessDate VARCHAR,
	PRIMARY KEY()
	);

COPY datasetsmall(ID, courseID, discipline, courseName, courseYear, 
		syllabus, studentID, firstName, lastName, dateOfBirth, genre, 
		country, town, email, materialID, unit, materialType, name, 
		dimension, accessDate) 
	FROM 'datasetSmall.csv' 
	WITH HEADER = true
	AND DELIMITER = ',';
