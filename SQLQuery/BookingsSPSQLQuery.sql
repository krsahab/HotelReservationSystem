-- ================================================
--- =============================================
-- Author:		<Kumar Sahab>
-- Create date: <07/07/2018,>
-- Description:	<Hotel Reservation System>
-- =============================================

USE HotalReservationSystemDB

CREATE PROCEDURE USP_AddBookingDetails
(
	@HotelID VARCHAR(7),
	@CustomerID VARCHAR(5),
	@BookingDate DATE,
	@ArrivalDate DATE,
	@DepartureDate DATE,
	@NoOfAdults INT,
	@NoOfChildren INT,
	@NoOfNights INT,
	@TotalRooms INT,
	@RoomType VARCHAR(10)
)
AS
BEGIN
DECLARE @MyTableVar TABLE  
(  
    BookingID VARCHAR(20)
)
INSERT INTO Bookings(HotelID, CustomerID, BookingDate, ArrivalDate, DepartureDate, NoOfAdults, NoOfChildren, NoOfNights, TotalRooms, RoomType)
OUTPUT INSERTED.BookingID INTO @MyTableVar
VALUES
(
	@HotelID,
	@CustomerID,
	@BookingDate,
	@ArrivalDate,
	@DepartureDate,
	@NoOfAdults,
	@NoOfChildren,
	@NoOfNights,
	@TotalRooms,
	@RoomType
)
SELECT * FROM @MyTableVar
END
GO

CREATE OR ALTER PROCEDURE USP_DeleteBookingDetailsByID
(
	@BookingID VARCHAR(20)
)
AS
BEGIN
DELETE FROM Bookings
WHERE BookingID = @BookingID
END
GO

CREATE OR ALTER PROCEDURE USP_UpdateBookingDetailsByID
(
	@BookingID VARCHAR(20),
	@BookingDate DATE,
	@ArrivalDate DATE,
	@DepartureDate DATE,
	@NoOfAdults INT,
	@NoOfChildren INT,
	@NoOfNights INT
)
AS
BEGIN
UPDATE Bookings
SET 
BookingDate = @BookingDate,
ArrivalDate = @ArrivalDate,
DepartureDate = @DepartureDate,
NoOfAdults = @NoOfAdults,
NoOfChildren = @NoOfChildren,
NoOfNights = @NoOfNights
WHERE BookingID = @BookingID
END
GO

CREATE OR ALTER PROCEDURE USP_GetBookingsByCustomerID
(
	@CustomerID VARCHAR(5)
)
AS
BEGIN
SET NOCOUNT ON;
SELECT BookingID FROM Bookings WHERE CustomerID = @CustomerID
END
GO

CREATE OR ALTER PROCEDURE USP_GetBookingsByCustomerIDForTXN
(
	@CustomerID VARCHAR(5)
)
AS
BEGIN
SET NOCOUNT ON;
SELECT BookingID FROM Bookings WHERE CustomerID = @CustomerID AND BookingID NOT IN (SELECT BookingID FROM Transactions)
END
GO

CREATE OR ALTER PROCEDURE USP_GetBookingDetailsByID
(
	@BookingID VARCHAR(20)
)
AS
BEGIN
SET NOCOUNT ON;
SELECT
HotelID,
BookingDate,
ArrivalDate,
DepartureDate,
NoOfAdults,
NoOfChildren,
NoOfNights,
RoomType,
TotalRooms
FROM Bookings
WHERE BookingID = @BookingID
END
GO

CREATE OR ALTER PROCEDURE USP_GetBookingsByHotelID
(
	@HotelID VARCHAR(7)
)
AS
BEGIN
SET NOCOUNT ON;
SELECT 
BookingID,
ArrivalDate,
DepartureDate,
RoomType,
TotalRooms
FROM Bookings 
WHERE HotelID = @HotelID
END
GO