/* *********************************************************************************
 * Name: Jax Johnson
 * Class: CST 235 
 * Date: 2/18/2026
 * I have not received or given help on this assignment: Jax Johnson *
 ************************************************************************************/
 
/*****
 Task 1: Create tables
 Write CREATE TABLE statements based on the given E-R diagram. Make sure to:
 Define appropriate data types and sizes for each attribute.
 Capture as many participation and cardinality constraints as possible using
primary keys, foreign keys, and other SQL constraints.

Place your SQL code outside of any multi-line comments so that it can be executed
directly in MySQL.
*******/ 


DROP DATABASE IF EXISTS Lab3Johnson;
CREATE DATABASE Lab3Johnson;
USE Lab3Johnson; 


CREATE TABLE Employees (
id CHAR(5),
ssn CHAR(11),
phones VARCHAR(20),
salary DECIMAL(8,2) NOT NULL,
fname VARCHAR(30) NOT NULL,
mname VARCHAR(30),
lname VARCHAR(30) NOT NULL, 
PRIMARY KEY (id),
UNIQUE KEY (ssn)
);

CREATE TABLE Models (
mNumber VARCHAR(20),
capacity TINYINT,
horsePwr TINYINT,
mpg TINYINT,
PRIMARY KEY (mNumber)
);

CREATE TABLE DependentsInsurance (
eid CHAR(5),
fname VARCHAR(30),
gender VARCHAR(20),
dob DATE,
relationship VARCHAR(20),
PRIMARY KEY (eid, fname),
FOREIGN KEY (eid) REFERENCES Employees(id)
);

CREATE TABLE CarBelongs (
registrationNo INT,
mNumber VARCHAR(20),
madeYr INT,
priColor VARCHAR(20),
NumDoors TINYINT,
windowPrice DECIMAL(6,2),
PRIMARY KEY (registrationNo),
FOREIGN KEY (mNumber) REFERENCES Models(mNumber)
);

CREATE TABLE Salespersons (
eid CHAR(5),
cashBonus DECIMAL(8,2),
commission DECIMAL(4,2),
ProfitSharing DECIMAL(4,2),
PRIMARY KEY (eid),
FOREIGN KEY (eid) REFERENCES Employees(id)
);

CREATE TABLE Technicians (
eid CHAR(5),
PRIMARY KEY (eid),
FOREIGN KEY (eid) REFERENCES Employees(id)
);

CREATE TABLE Certifies (
eid CHAR(5),
mNumber VARCHAR(20),
expiration DATE,
PRIMARY KEY (eid, mNumber),
FOREIGN KEY (eid) REFERENCES Technicians(eid),
FOREIGN KEY (mNumber) REFERENCES Models(mNumber)
);

CREATE TABLE Addresses (
eid CHAR(5),
address VARCHAR(25),
PRIMARY KEY (eid, address),
FOREIGN KEY (eid) REFERENCES Employees(id)
);



/*****
Task 2: Uncaptured Constraints
Put your response here, explaining any constraints from the E-R diagram (e.g., total
participation, cardinality 1, or other restrictions) that could not be enforced directly in
SQL. Describe why these constraints cannot be captured using standard SQL
statements.

The uncaptured constraints in the table occur at: 
Technicians to Certifies which is total participation, 
Employees to Salespersons and Technicians which is total specialization, 
Disjointedness with Salespersons and Technicians
******/


/*****
Task 3: Add records
Write INSERT INTO statements to add at least two records for each table in your
relational database. Ensure that the data you insert respects all constraints defined in
your CREATE TABLE statements.
*******/ 

INSERT INTO Employees VALUES
('12347', '123-48-765', '773-098-0947', 55000.00, 'Jake', 'E', 'Johnson'),
('12337', '123-48-734', '773-034-2347', 55000.00, 'Jordan', 'E', 'Johnson');

INSERT INTO Models VALUES
('124', 4, 245, 40),
('123', 4, 345, 30);

INSERT INTO DependentsInsurance VALUES
('12347', 'John', 'Male', '2000-07-24', 'Son'),
('12337', 'Jim', 'Male', '2000-09-23', 'Son');

INSERT INTO CarBelongs VALUES
(2, '124', 2025, 'Gray', 4, 25000.00),
(1, '123', 2025, 'Black', 4, 25000.00);

INSERT INTO Salespersons VALUES
('12347', 74000.00, 500.00, 500.00),
('12337', 75000.00, 530.00, 800.00);

INSERT INTO Technicians VALUES
('12347'),
('12337');

INSERT INTO Certifies VALUES
('12347', '124', '2027-06-05'),
('12337', '123', '2027-03-05');

INSERT INTO Addresses VALUES
('12347', '125 N Fullerton Ave, Chicago, IL'),
('12337', '319 W Wendover Ave, Greensboro, NC');
