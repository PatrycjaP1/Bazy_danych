USE AdventureWorks2019;

--1
BEGIN TRANSACTION;

UPDATE Production.Product
SET ListPrice = ListPrice * 1.10
WHERE ProductID = 680;

COMMIT TRANSACTION;


--2

BEGIN TRANSACTION;

DELETE FROM Production.Product
WHERE ProductID = 707;

ROLLBACK TRANSACTION;

--3

SET IDENTITY_INSERT Production.Product ON;

BEGIN TRANSACTION ;
INSERT INTO Production.Product(ProductID,Name,ProductNumber,MakeFlag,FinishedGoodsFlag,Color,SafetyStockLevel,ReorderPoint,StandardCost,ListPrice,DaysToManufacture,SellStartDate,ModifiedDate)
VALUES(5, 'Helmet', 'YY-5834', 0, 0, NULL, 800, 285, 400, 0.00, 0.00, '2005-08-01 00:00:00.000', '2018-03-01 10:00:50.000');
COMMIT;

SELECT * FROM Production.Product
ORDER BY ProductID;


--4
BEGIN TRANSACTION ;
UPDATE Production.Product
SET StandardCost = StandardCost*1.1

IF (SELECT SUM(StandardCost) FROM Production.Product) <= 50000
	BEGIN
		COMMIT;
		PRINT 'Transakcja zaakceptowana';
	END
	ELSE
	BEGIN
		ROLLBACK;
		PRINT 'Transakcja wycofana';
	END;

SELECT SUM(StandardCost) FROM Production.Product;

--5
BEGIN TRANSACTION;

IF NOT EXISTS (SELECT 1 FROM Production.Product WHERE ProductNumber = 'NP-000')
BEGIN
    INSERT INTO Production.Product(ProductID, Name, ProductNumber, MakeFlag, FinishedGoodsFlag, Color, SafetyStockLevel, ReorderPoint, StandardCost, ListPrice, DaysToManufacture, SellStartDate, ModifiedDate)
    VALUES(10, 'Something', 'NP-000', 1, 1, NULL, 300, 200, 0.00, 0.00, 1, '2014-02-01 00:00:00.000', '2015-07-02 10:00:50.000');
    
    COMMIT TRANSACTION;
END
ELSE
BEGIN
    ROLLBACK TRANSACTION;
END;


--6

BEGIN TRANSACTION;

IF EXISTS (SELECT * FROM Sales.SalesOrderDetail WHERE OrderQty = 0)
BEGIN
    ROLLBACK TRANSACTION;
END
ELSE
BEGIN
    UPDATE Sales.SalesOrderDetail
    SET OrderQty = OrderQty - 1
    WHERE OrderQty = 0;

    COMMIT TRANSACTION;
END;


--7

BEGIN TRANSACTION;

DECLARE @AvgStandardCost DECIMAL(18, 2);
SELECT @AvgStandardCost = AVG(StandardCost)
FROM Production.Product;
DECLARE @CountProductsToDelete INT;

SELECT @CountProductsToDelete = COUNT(*)
FROM Production.Product
WHERE StandardCost > @AvgStandardCost;


IF @CountProductsToDelete <= 10
BEGIN
    DELETE FROM Production.Product
    WHERE StandardCost > @AvgStandardCost;

    COMMIT TRANSACTION;
END
ELSE
BEGIN
    ROLLBACK TRANSACTION;
END;


