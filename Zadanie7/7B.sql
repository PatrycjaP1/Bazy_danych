USE AdventureWorks2019;


--1
CREATE SCHEMA ciag;
GO
CREATE FUNCTION ciag.Fibonacci(@n INT)
RETURNS INT
AS
BEGIN 
	DECLARE @result INT;

	IF @n <= 0
		SET @result = 0;
	ELSE IF  @n = 1
		SET  @result = 1;
	ELSE
	BEGIN 
		DECLARE @fib1 INT = 0;
		DECLARE @fib2 INT = 1;
		DECLARE @i INT =2;

		WHILE @i <= @n
		BEGIN 
			SET @result = @fib1 + @fib2;
			SET @fib1 = @fib2;
			SET @fib2 = @result;
			SET @i = @i +1;
		END
	END
	RETURN @result;
END
GO

CREATE PROCEDURE ciag.CalculateFibonacci(@n INT)
AS
BEGIN 
	DECLARE @i INT =0;
	DECLARE @fibonacciNumber INT;

	WHILE @i <= @n
	BEGIN
		SET  @fibonacciNumber = ciag.Fibonacci(@i);
		PRINT 'Liczba ciagu Fibonacciego na pozycji'  + CAST(@i AS VARCHAR(30)) + 'to'  + CAST(@fibonacciNumber AS VARCHAR(30))
		SET @i = @i +1;
	END
END
GO

EXEC ciag.CalculateFibonacci @n = 10;



--2
CREATE OR ALTER TRIGGER Uppercase 
ON Person.Person FOR UPDATE AS
BEGIN
	UPDATE Person.Person SET LastName = UPPER(LastName);
END



--3

CREATE TRIGGER taxRateMonitoring
ON Sales.SalesTaxRate
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
	DECLARE @newTax FLOAT;
	DECLARE @oldTax FLOAT;
	
	SELECT @newTax = TaxRate FROM INSERTED;
	SELECT @oldTax =TaxRate FROM DELETED;

	IF (@newTax > 1.3 * @oldTax OR @newTax < 0.7 * @oldTax)
	PRINT 'zmiana o wiecej niz 30%'
END;


UPDATE Sales.SalesTaxRate 
SET TaxRate = 1 
WHERE SalesTaxRateID = 1;

SELECT * FROM Sales.SalesTaxRate WHERE SalesTaxRateID=1;