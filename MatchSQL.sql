SELECT [EmployeeId]
      ,[FirstName]
      ,[LastName]
      ,[DateOfBirth]
      ,[SSN]
  FROM [dbo].[Employee] table1
  where exists (select FirstName, Description
              from [dbo].[Resource] table2
              where table1.FirstName = table2.FirstName
                and table1.LastName = table2.LastName
              group by FirstName, LastName
              having count(EmployeeId) > 1)
GO