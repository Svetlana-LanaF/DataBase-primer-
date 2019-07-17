USE [NORTHWND]
GO

SELECT [EmployeeID]
  FROM [dbo].[Employees]
  Where PostalCode Like '98%';
GO