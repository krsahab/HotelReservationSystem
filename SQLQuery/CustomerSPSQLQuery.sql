USE HotalReservationSystemDB
GO

CREATE PROCEDURE USP_InsertCustomerDetails
(
 @CustomerName varchar(50),
 @AccountPassword varchar(50),
 @DateOfBirth Date,
 @ContactNumber varchar(24),
 @EmailAddress varchar(50),
 @CustomerCountry varchar(30),
 @CustomerState varchar(30),
 @CustomerCity varchar(30),
 @CustomerPinCode varchar(30),
 @Age INT,
 @CustomerType VARCHAR(20)
)
AS
BEGIN
DECLARE @MyTableVar TABLE  
(  
    CustomerId VARCHAR(5)
)
INSERT INTO Customers(CustomerName, AccountPassword, DateOfBirth, ContactNumber, EmailAddress, CustomerCountry, CustomerState, CustomerCity, CustomerPinCode, Age, CustomerType)
OUTPUT INSERTED.CustomerId INTO @MyTableVar
VALUES
(
@CustomerName,
@AccountPassword,
@DateOfBirth,
@ContactNumber,
@EmailAddress,
@CustomerCountry,
@CustomerState,
@CustomerCity,
@CustomerPinCode,
@Age,
@CustomerType
)
SELECT * FROM @MyTableVar
END
GO

CREATE PROCEDURE USP_GetCustomerDetailsByIdAndPassword
(
	@CustomerId varchar(50),
	@AccountPassword varchar(50)
)
AS
BEGIN
SET NOCOUNT ON;
SELECT 
CustomerName
FROM Customers
WHERE  CustomerId=@CustomerId
AND AccountPassword=@AccountPassword
END
GO

CREATE PROCEDURE USP_GetCustomerDetailsById
(
	@CustomerId varchar(50)
)
AS
BEGIN
SET NOCOUNT ON;
SELECT 
 CustomerId,
 CustomerName,
 DateOfBirth,
 ContactNumber,
 EmailAddress,
 CustomerCountry,
 CustomerState,
 CustomerCity,
 CustomerPinCode 
FROM Customers
WHERE  CustomerId=@CustomerId
END
GO


CREATE PROCEDURE USP_GetCustomerDetailsByContactAndEmail
(
	@Contact varchar(24),
	@Email varchar(50)
)
AS
BEGIN
SET NOCOUNT ON;
SELECT 
CustomerId
FROM Customers
WHERE  ContactNumber=@Contact
OR EmailAddress=@Email
END
GO

CREATE PROCEDURE USP_GetCountry
AS
BEGIN
SET NOCOUNT ON;
SELECT 
 CountryId,
 CountryName
FROM CountryDetails
END
GO

CREATE PROCEDURE USP_GetState
(
	@CountryId int
)
AS
BEGIN
SET NOCOUNT ON;
SELECT 
StateId,
StateName
FROM StateDetails 
WHERE CountryId=@CountryId
END
GO

CREATE PROCEDURE USP_GetCity
(
	@StateId int
)
AS
BEGIN
SET NOCOUNT ON;
SELECT 
CityId,
CityName
FROM CityDetails 
WHERE StateId = @StateId
END
GO



