use HotalReservationSystemDB

SET IDENTITY_INSERT Customers OFF

CREATE TABLE Customers
(
 Id int Identity(1,1),
 CustomerId as (LEFT(CustomerName,1)+'@'+RIGHT('000'+CAST(Id as varchar(3)),3)) PERSISTED,
 CustomerName varchar(50) NOT NULL,
 AccountPassword varchar(50) NOT NULL,
 DateOfBirth Date NOT NULL,
 ContactNumber varchar(24) NOT NULL,
 EmailAddress varchar(50) NOT NULL,
 CustomerCountry varchar(30) NOT NULL,
 CustomerState varchar(30) NOT NULL,
 CustomerCity varchar(30) NOT NULL,
 CustomerPinCode varchar(30) NOT NULL,
 Age int NOT NULL,
 CustomerType VARCHAR(20) NOT NULL,
 CONSTRAINT PK_Customers_CustomerId PRIMARY KEY (CustomerId)
)
GO

CREATE TABLE CountryDetails
(
CountryId int,
sortname varchar(3) NOT NULL,
CountryName varchar(150) NOT NULL,
phonecode int NOT NULL,
CONSTRAINT PK_CountryDetails_CountryId PRIMARY KEY (CountryId)
)
GO

CREATE TABLE StateDetails
(
StateId int NOT NULL,
StateName varchar(30) NOT NULL,
CountryId int NOT NULL,
CONSTRAINT PK_StateDetails_StateId PRIMARY KEY (StateId)
)
GO

BULK INSERT CountryDetails
FROM 'C:\Project Area\HotelReservationSystem\countries.csv'
WITH
(
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
)

CREATE TABLE CityDetails
(
CityId int NOT NULL,
CityName varchar(30) NOT NULL,
StateId int NOT NULL,
CONSTRAINT PK_CityDetails_CityId PRIMARY KEY (CityId)
)
GO