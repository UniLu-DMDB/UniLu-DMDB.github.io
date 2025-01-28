CREATE TABLE Students (
	studentID INT CHECK (studentID > 0) PRIMARY KEY,
	fname VARCHAR(100) NOT NULL,
	lname VARCHAR(100) NOT NULL,
	lives_in VARCHAR(100),
	matric_year SMALLINT check (matric_year > 1900)
);

INSERT INTO Students VALUES (1, 'Jessica', 'Bezos', 'USA', 1982);
INSERT INTO Students VALUES (2, 'Bill', 'Doors', 'USA', 1973);
INSERT INTO Students VALUES (3, 'Elona', 'Musk', 'Space', NULL);
INSERT INTO Students VALUES (4, 'Tim', 'Baker', 'USA', 1982);
INSERT INTO Students VALUES (5, 'Mark', 'Sugarhill', 'Metaverse', 2002);
INSERT INTO Students VALUES (6, 'Mark', 'Diverseen', NULL, 1993);


CREATE TABLE Diplomas (
	diplomaID INT PRIMARY KEY,
	studentID INT REFERENCES Students,
	diploma VARCHAR(100) NOT NULL,
	university VARCHAR(100) NOT NULL,
	issue_date SMALLINT NOT NULL
);

INSERT INTO Diplomas VALUES (1, 1, 'Bachelor of Science', 'Princeton', 1986);
INSERT INTO Diplomas VALUES (2, 2, 'Honorary Doctorate', 'KTH', 2002);
INSERT INTO Diplomas VALUES (3, 2, 'Honorary Doctorate', 'Cambridge', 2009);
INSERT INTO Diplomas VALUES (4, 4, 'MBA', 'Duke', 1988);
INSERT INTO Diplomas VALUES (5, 5, 'Honorary Doctorate', 'Harvard', 2017);
INSERT INTO Diplomas VALUES (6, NULL, 'Funny Award', 'My University', 2023);