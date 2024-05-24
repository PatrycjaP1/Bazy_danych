--1
USE AdventureWorks2019;
SELECT * FROM Person.Person;

SELECT * FROM HumanResources.EmployeePayHistory;

WITH EmployeeInfo (BusinessEntityID, FirstName, LastName, PayRate) AS
(
    SELECT p.BusinessEntityID, p.FirstName, p.LastName, e.Rate
    FROM Person.Person p
     INNER JOIN HumanResources.EmployeePayHistory e
    ON p.BusinessEntityID = e.BusinessEntityID
)

SELECT * INTO TempEmployeeInfo FROM EmployeeInfo;
SELECT * FROM TempEmployeeInfo;



--2
USE AdventureWorksLT2019;

WITH CustomerRevenue (CompanyContact, Revenue) AS
(
    SELECT 
        c.CompanyName AS CompanyContact, 
        soh.TotalDue AS Revenue 
    FROM SalesLT.Customer c
    INNER JOIN SalesLT.SalesOrderHeader soh
    ON c.CustomerID = soh.CustomerID
)

SELECT * FROM CustomerRevenue 
ORDER BY CompanyContact ASC;


--3
WITH wart (Category, SalesValue)AS

(SELECT c.Name, UnitPrice

FROM SalesLT.Product p

INNER JOIN SalesLT.ProductCategory c

ON p.ProductCategoryID=c.ProductCategoryID

INNER JOIN SalesLT.SalesOrderDetail o

ON p.ProductID=o.ProductID

)SELECT Category, SUM(SalesValue) AS SalesValue FROM wart

GROUP BY Category