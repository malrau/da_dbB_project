-- 540438 - Maurizio La Rosa --
===============================

<p>
This repository hosts the project for the exam of the course Database - Module B from the Data Analysis degree of the University of Messina. The project consists in building a dataset simulating data from an online learning platform allowing students to access course materials, take quizzes and submit assignments. The dataset should contain simulated information on the above listed kinds of actions performed by hypothetical students.

The simulated data should be contained in 4 csv files of increasing size (250k, 500k, 750k and 1m records), and imported into 5 different DBMS, i.e.: MySQL, MongoDB, Cassandra, Redis and Neo4j).
For each of the dataset equivalent (in the desired output) queries must be performed in order to register each DBMS response time with each dataset size. Results must be plotted and a report must be created, presenting the obtained results.

I plan to manage the DBMS by using the Python programming language.
</p>

<br>

Database schema hypothesis
--------------------------

In order to simplify the construction of the simulated data, I built a conceptual schema of the database. The schema is reproduced below and incorporates 5 entities and 4 relationships:

![Conceptual schema](https://github.com/malrau/da_dbB_project/blob/main/schema/e-r_final.png)

<p>
The aim is to simulate data that reproduce the schema. The data are created programmatically, either by using the <i>faker</i> Python module either by exploiting the <i>random</i> Python module. Data are stored into dictionaries of lists. Each dictionary represents a table (entity or relationship), where the key is a table attribute name and each list of values is the actual instance for each attribute.

The above concept is somewhat a simplification of the way I consider the full actual schema of this kind of database (learning platform). The two relationships: <i>grading</i> and <i>learning</i> link three entities each (<i>student</i>, <i>course</i> and <i>assessment</i> the first one, <i>student</i>, <i>course</i> and <i>learning material</i> the second one). It would probably be better if they were replaced by two distinct relationships: instead of only <i>grading</i> we could have one relationship linking <i>course</i> and <i>assessment</i> and another one linking <i>student</i> and <i>assessment</i>. This way we could have a full representation of each course and its assessment. 
</p>


<p>
<h4>course - final assessment</h4>
The way the concept is expressed at the moment, assessment is present in the <i>grading</i> relationship only if a student has actually undergone assessment in a given date, and there is no other relationship involving course and assessment.  So, if a student enrolled in a course has not undergone the course final assessment, the assessment data cannot be linked to the course data. Notice that the full assessment data is present in the assesssment table, but the can be linked to a course only through a relationship, but the only one is <i>grading</i> which stores data only for actual assessments undergone by students, not potential assessments.
</p>


<p>
<h4>course - learning material</h4>
The same reasoning applies to the <i>learning</i> relationship. It stores connection of courses and learning materials only if students have actually accessed the learning material. Though the full learning material data are stored in the <i>learning material</i> table, they cannot be linked to courses unless they are accessed by students and then stored in the <i>learning</i> table.
</p>


<br>

Full database schema
--------------------

The full schema could be represented as follows:

![Full conceptual schema](https://github.com/malrau/da_dbB_project/blob/main/schema/e-r_full[not_used].png)

Here there are eleven constructs instead of nine (5 entities and 6 relationships).


<p>
<h4>course - learning material</h4>
<i>course</i> is linked to <i>learning material</i> through a specific relationship (<i>using</i>), while <i>student</i> is linked to <i>learning material</i> through the <i>learning</i> relationship. While the <i>using</i> relationship between <i>course</i> and <i>learning material</i> stores the full set of links between a course and the learning material used within the course, the <i>learning</i> relationship stores only learning material that students have accessed to. Also, while in the <i>using</i> relationship learning materials are uniquely identified, in the <i>learning</i> relationship they might appear  more than once because students can access multiple times the same learning material or, better, more students can access the same learning material.
</p>


<p>
<h4>course - final assessment</h4>
The same is true for the new relationship between <i>course</i> and <i>final assessment</i>, <i>assessing procedure</i>. It stores the full set of links between a course and its final assessment, while the <i>grading</i> relationship only stores assessments actually undergone by students. Again, while the <i>assessing procedure</i> uniquely identifies final assessments (one assessment per course, each course has a different assessment), in the <i>grading</i> relationship the same assessment might appear multiple times: different students enrolled to the same course might have taken the assessment or the same student might undergo the course assessment multiple times if she hasn't succeded the first time.
</p>

<p>
Anyway, for the purpose of the project it is not necessary, in my view, to build the full schema. The first schema hypothesis can be seen as a simplification of the full schema allowing to perform queries complex enough for the project assignment demands. The range of queries is more limited than that of the full schema: the full schema would allow recovering all data connected to each course of the platform (assignments and learning materials), but, all in all, it is more interesting to know which material has been accessed by a student, or if a student has performed the final assignment of a course, and these kinds of queries (involving three entities) are possible with this schema.
</p>


<br>

Final dataset (csv file)
------------------------

The final output of the database building procedure (stored in the FakeDB folder), according to the project guidelines, must be a csv file of 1 million records to be imported into each of the indicated DBMSs. I don't need to import every entity or relationship in my relational schema, it is sufficient to import a unique csv file storing enoug information. I can use the <i>learning</i> relationship in my relational schema to gather information on students, on courses and on the learning materials. These information (attributes) can all be stored into a csv file which will have a number of records equivalent to those in the <i>learning</i> table (more then 1 million) and as many columns (attributes) as those present in the <i>student</i> table, in the <i>course</i> table and in the <i>learning_material</i> table (plus the unique attribute in the <i>learning</i> table). After importing the csv into the datasets, I can run queries based on the attributes of the entities involved (students' gender or nationality, courses' discipline, types of learning materials accessed, etc.).