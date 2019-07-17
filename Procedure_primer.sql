CREATE PROCEDURE [dbo].[sp_Replacement] AS

DECLARE @char CHAR
Declare @index int
Declare @len int
DECLARE @NAM VARCHAR (100)
DECLARE @outstr VARCHAR (100)
Declare @ID int

DECLARE @CURSOR CURSOR

SET @CURSOR  = CURSOR SCROLL
FOR
SELECT  PostalCode,EmployeeID  
  FROM  Employees

OPEN @CURSOR

FETCH NEXT FROM @CURSOR INTO @NAM, @ID

WHILE @@FETCH_STATUS = 0
BEGIN
	Set @index = 1
	Set @len = LEN(@NAM)
	Set @outstr = ''
	WHILE @index<= @len
 BEGIN
    SET @char = SUBSTRING(@NAM, @index, 1)
    IF ISNUMERIC(@char) = 0
    BEGIN
      SET @outstr = @outstr + '1'
    END
    ELSE
    BEGIN
      SET @outstr = @outstr + @char 
	  
    END
    SET @index= @index+ 1
 END
UPDATE Employees SET PostalCode= @outstr Where EmployeeID = @ID
FETCH NEXT FROM @CURSOR INTO @NAM, @ID
END
CLOSE @CURSOR