### 1 ###
# load process in one unique step (not recommended)
LOAD CSV WITH HEADERS FROM 'file:///dataset250k.csv' AS line 
	MERGE(:student {sID: line.studentID, firstName: line.firstName, lastName: line.lastName, dob: line.dateOfBirth, genre: line.genre, country: line.country, town: line.town, email: line.email})
		 -[:is_enrolled]->
		 (:course {cID: line.courseID, discipline: line.discipline, courseName: line.courseName, courseYear: line.courseYear, syllabus: line.syllabus})
	MERGE(:student {sID: line.studentID, firstName: line.firstName, lastName: line.lastName, dob: line.dateOfBirth, genre: line.genre, country: line.country, town: line.town, email: line.email})
		 -[:studies] ->
		 (:material {mID: line.materialID, unit: line.unit, mType: line.materialType, mName: coalesce(line.materialName, 'empty'), dimension: line.dimension, accessDate: line.accessDate})
	MERGE(:course {cID: line.courseID, discipline: line.discipline, courseName: line.courseName, courseYear: line.courseYear, syllabus: line.syllabus})
		 -[:uses]->
		 (:material {mID: line.materialID, unit: line.unit, mType: line.materialType, mName: coalesce(line.materialName, 'empty'), dimension: line.dimension, accessDate: line.accessDate});


### 2 ###
# load nodes and relationships in separate steps
# nodes
LOAD CSV WITH HEADERS FROM 'file:///dataset250k.csv' AS line 
	MERGE(:student {studentID: line.studentID, firstName: line.firstName, lastName: line.lastName, dob: line.dateOfBirth, genre: line.genre, country: line.country, town: line.town, email: line.email});

LOAD CSV WITH HEADERS FROM 'file:///dataset250k.csv' AS line
	MERGE(:course {courseID: line.courseID, discipline: line.discipline, courseName: line.courseName, courseYear: line.courseYear, syllabus: line.syllabus});

LOAD CSV WITH HEADERS FROM 'file:///dataset250k.csv' AS line
 	MERGE(:material {materialID: line.materialID, unit: line.unit, mType: line.materialType, mName: line.name, dimension: line.dimension});

# relationships
LOAD CSV WITH HEADERS FROM 'file:///dataset250k.csv' AS line
	MATCH(s:student {studentID: line.studentID, firstName: line.firstName, lastName: line.lastName, dob: line.dateOfBirth, genre: line.genre, country: line.country, town: line.town, email: line.email})
 	MATCH(c:course {courseID: line.courseID, discipline: line.discipline, courseName: line.courseName, courseYear: line.courseYear, syllabus: line.syllabus})
 	MERGE (s) -[:is_enrolled]-> (c);

LOAD CSV WITH HEADERS FROM 'file:///dataset250k.csv' AS line
	MATCH(s:student {studentID: line.studentID, firstName: line.firstName, lastName: line.lastName, dob: line.dateOfBirth, genre: line.genre, country: line.country, town: line.town, email: line.email})
 	MATCH(m:material {materialID: line.materialID, unit: line.unit, mType: line.materialType, mName: line.name, dimension: line.dimension})
 	MERGE (s) -[:studies {accessDate: line.accessDate}] -> (m);
 	
LOAD CSV WITH HEADERS FROM 'file:///dataset250k.csv' AS line
	MATCH(c:course {courseID: line.courseID, discipline: line.discipline, courseName: line.courseName, courseYear: line.courseYear, syllabus: line.syllabus})
 	MATCH(m:material {materialID: line.materialID, unit: line.unit, mType: line.materialType, mName: line.name, dimension: line.dimension})
 	MERGE (c) -[:uses] -> (m);


### 3 ###
# use CALL ... IN TRANSACTIONS clause to load huge amounts of nodes and / or relationships without memory overhead
# nodes
LOAD CSV WITH HEADERS FROM 'file:///dataset250k.csv' AS line
	CALL {
		WITH line
			MERGE(:student {studentID: line.studentID, firstName: line.firstName, lastName: line.lastName, dob: line.dateOfBirth, genre: line.genre, country: line.country, town: line.town, email: line.email})
		}
		IN TRANSACTIONS OF 500 ROWS;

LOAD CSV WITH HEADERS FROM 'file:///dataset250k.csv' AS line
	CALL {
		WITH line
			MERGE(:course {courseID: line.courseID, discipline: line.discipline, courseName: line.courseName, courseYear: line.courseYear, syllabus: line.syllabus})
		}
		IN TRANSACTIONS OF 500 ROWS;

LOAD CSV WITH HEADERS FROM 'file:///dataset250k.csv' AS line
	CALL {
		WITH line
			MERGE(:material {materialID: line.materialID, unit: line.unit, mType: line.materialType, mName: line.name, dimension: line.dimension})
		}
		IN TRANSACTIONS OF 500 ROWS;

# load relationships
LOAD CSV WITH HEADERS FROM 'file:///dataset250k.csv' AS line
	CALL {
		WITH line
			MATCH(s:student {studentID: line.studentID, firstName: line.firstName, lastName: line.lastName, dob: line.dateOfBirth, genre: line.genre, country: line.country, town: line.town, email: line.email})
			MATCH(c:course {courseID: line.courseID, discipline: line.discipline, courseName: line.courseName, courseYear: line.courseYear, syllabus: line.syllabus})
			MERGE (s) -[:is_enrolled]-> (c)
		}
		IN TRANSACTIONS OF %00 ROWS;

LOAD CSV WITH HEADERS FROM 'file:///dataset250k.csv' AS line
	CALL {
		WITH line
			MATCH(s:student {studentID: line.studentID, firstName: line.firstName, lastName: line.lastName, dob: line.dateOfBirth, genre: line.genre, country: line.country, town: line.town, email: line.email})
			MATCH(m:material {materialID: line.materialID, unit: line.unit, mType: line.materialType, mName: line.name, dimension: line.dimension})
			MERGE (s) -[:studies {accessDate: line.accessDate}] -> (m)
		}
		IN TRANSACTIONS OF 500 ROWS;
 	
LOAD CSV WITH HEADERS FROM 'file:///dataset250k.csv' AS line
	CALL {
		WITH line
			MATCH(c:course {courseID: line.courseID, discipline: line.discipline, courseName: line.courseName, courseYear: line.courseYear, syllabus: line.syllabus})
			MATCH(m:material {materialID: line.materialID, unit: line.unit, mType: line.materialType, mName: line.name, dimension: line.dimension})
			MERGE (c) -[:uses] -> (m)
		}
		IN TRANSACTIONS OF 500 ROWS;
