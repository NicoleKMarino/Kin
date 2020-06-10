CREATE TABLE Employee (
  EmployeeId INT NOT NULL,
  FirstName VARCHAR(30) NOT NULL,
  LastName VARCHAR(30) NOT NULL,
  SSN INT NOT NULL,
  DOB VARCHAR(30) NOT NULL,

  PRIMARY KEY (EmployeeId));

INSERT INTO [Employee]
    (EmployeeId, FirstName, LastName, SSN, DOB) 
VALUES 
    (1,'Jane', 'Smith', 123,'1/2/4'),
    (2,'Joe','Smith',123,'3/5/6'),
    (3,'John','Smith',123,'3/5/6'),
    (4,'Jane', 'Smith', 345,'1/5/7'),
    (5,'Joe','John',123,'3/5/6'),
    (6,'Joe','John',123,'3/5/6');

      
SELECT [FirstName]
      ,[LastName]
      ,[DOB]
      ,[SSN]
  FROM Employee table1
  where exists (select FirstName, LastName
              from Employee table2
              where table1.FirstName = table2.FirstName
                and table1.LastName = table2.LastName
              group by FirstName, LastName
              having count(EmployeeId) > 1)
GO