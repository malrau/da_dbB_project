# Cassandra [nicely formatted] CQL statements for creating keyspace and sample table

CREATE KEYSPACE dbB_CASSANDRA_test
	WITH REPLICATION = {'class' : 'NetworkTopologyStrategy', 'replication_factor' : 3};

CREATE TABLE smallDB(
	courseID VARCHAR,
	discipline VARCHAR,
	courseName VARCHAR,
	courseYear VARCHAR,
	syllabus VARCHAR,
	studentID VARCHAR,
	firstName VARCHAR,
	lastName VARCHAR,
	dateOfBirth VARCHAR,
	genre VARCHAR,
	country VARCHAR,
	town VARCHAR,
	email VARCHAR,
	materialID VARCHAR,
	unit VARCHAR,
	materialType VARCHAR,
	name VARCHAR,
	dimension VARCHAR,
	accessDate VARCHAR,
	recordID VARCHAR,
	PRIMARY KEY(recordID)
	);


# Cassandra [nicely formatted] CQL statements for importing csv files into predefined tables

COPY smallDB(courseID, discipline, courseName, courseYear, 
		syllabus, studentID, firstName, lastName, dateOfBirth, genre, 
		country, town, email, materialID, unit, materialType, name, 
		dimension, accessDate, recordID) 
	FROM 'dataset250k_Cassandra.csv' 
	WITH HEADER = true
	AND DELIMITER = ',';


# CQL [copy/paste] statements for creating tables and importing csv files

CREATE TABLE smallDB(courseID VARCHAR, discipline VARCHAR, courseName VARCHAR, courseYear VARCHAR, syllabus VARCHAR, studentID VARCHAR, firstName VARCHAR, lastName VARCHAR, dateOfBirth VARCHAR, genre VARCHAR, country VARCHAR, town VARCHAR, email VARCHAR, materialID VARCHAR, unit VARCHAR, materialType VARCHAR, name VARCHAR, dimension VARCHAR, accessDate VARCHAR, recordID VARCHAR, PRIMARY KEY(recordID));
CREATE TABLE mediumDB(courseID VARCHAR, discipline VARCHAR, courseName VARCHAR, courseYear VARCHAR, syllabus VARCHAR, studentID VARCHAR, firstName VARCHAR, lastName VARCHAR, dateOfBirth VARCHAR, genre VARCHAR, country VARCHAR, town VARCHAR, email VARCHAR, materialID VARCHAR, unit VARCHAR, materialType VARCHAR, name VARCHAR, dimension VARCHAR, accessDate VARCHAR, recordID VARCHAR, PRIMARY KEY(recordID));
CREATE TABLE largeDB(courseID VARCHAR, discipline VARCHAR, courseName VARCHAR, courseYear VARCHAR, syllabus VARCHAR, studentID VARCHAR, firstName VARCHAR, lastName VARCHAR, dateOfBirth VARCHAR, genre VARCHAR, country VARCHAR, town VARCHAR, email VARCHAR, materialID VARCHAR, unit VARCHAR, materialType VARCHAR, name VARCHAR, dimension VARCHAR, accessDate VARCHAR, recordID VARCHAR, PRIMARY KEY(recordID));
CREATE TABLE humongousDB(courseID VARCHAR, discipline VARCHAR, courseName VARCHAR, courseYear VARCHAR, syllabus VARCHAR, studentID VARCHAR, firstName VARCHAR, lastName VARCHAR, dateOfBirth VARCHAR, genre VARCHAR, country VARCHAR, town VARCHAR, email VARCHAR, materialID VARCHAR, unit VARCHAR, materialType VARCHAR, name VARCHAR, dimension VARCHAR, accessDate VARCHAR, recordID VARCHAR, PRIMARY KEY(recordID));

COPY smallDB(courseID, discipline, courseName, courseYear, syllabus, studentID, firstName, lastName, dateOfBirth, genre, country, town, email, materialID, unit, materialType, name, dimension, accessDate, recordID) FROM 'dataset250k_Cassandra.csv' WITH HEADER = true AND DELIMITER = ',';
COPY mediumDB(courseID, discipline, courseName, courseYear, syllabus, studentID, firstName, lastName, dateOfBirth, genre, country, town, email, materialID, unit, materialType, name, dimension, accessDate, recordID) FROM 'dataset500k_Cassandra.csv' WITH HEADER = true AND DELIMITER = ',';
COPY largeDB(courseID, discipline, courseName, courseYear, syllabus, studentID, firstName, lastName, dateOfBirth, genre, country, town, email, materialID, unit, materialType, name, dimension, accessDate, recordID) FROM 'dataset750k_Cassandra.csv' WITH HEADER = true AND DELIMITER = ',';
COPY humongousDB(courseID, discipline, courseName, courseYear, syllabus, studentID, firstName, lastName, dateOfBirth, genre, country, town, email, materialID, unit, materialType, name, dimension, accessDate, recordID) FROM 'dataset1m_Cassandra.csv' WITH HEADER = true AND DELIMITER = ',';
