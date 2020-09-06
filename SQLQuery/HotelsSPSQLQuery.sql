USE HotalReservationSystemDB

CREATE PROCEDURE USP_SearchHotels
(
	@RoomType VARCHAR(10),
	@TotalRooms INT,
	@City VARCHAR(30)
)
AS
BEGIN
SET NOCOUNT ON;
SELECT 
HotelID,
HotelName,
Country,
City,
HotelDescription,
NoOfACRooms,
NoOfNACRooms,
RateAdultACRoom,
RateChildACRoom,
RateAdultNACRoom,
RateChildNACRoom
FROM Hotels
WHERE City=@City AND (CASE @RoomType
                         WHEN 'AC' THEN NoOfACRooms
                         WHEN 'Non AC' THEN NoOfNACRooms
                     END) >= @TotalRooms
END
GO

CREATE PROCEDURE USP_GetHotelsID
AS
BEGIN
SELECT HotelID, HotelName FROM Hotels
END
GO

CREATE PROCEDURE USP_UpdateHotelDetailsByID
(
	@HotelID VARCHAR(20),
	@HotelName VARCHAR(50),
	@HotelDescription VARCHAR(100),
	@NoOfACRooms INT,
	@NoOfNACRooms INT,
	@RateAdultACRoom INT,
	@RateChildACRoom INT,
	@RateAdultNACRoom INT,
	@RateChildNACRoom INT
)
AS
BEGIN
UPDATE Hotels
SET
HotelName = @HotelName,
HotelDescription = @HotelDescription, 
NoOfACRooms = @NoOfACRooms,
NoOfNACRooms = @NoOfNACRooms, 
RateAdultACRoom = @RateAdultACRoom, 
RateChildACRoom = @RateChildACRoom, 
RateAdultNACRoom = @RateAdultNACRoom, 
RateChildNACRoom = @RateChildNACRoom
WHERE HotelID = @HotelID
END
GO

CREATE PROCEDURE USP_AddHotelDetails
(
	@HotelName VARCHAR(50),
	@Country VARCHAR(30),
	@City VARCHAR(30),
	@HotelDescription VARCHAR(100),
	@NoOfACRooms INT,
	@NoOfNACRooms INT,
	@RateAdultACRoom INT,
	@RateChildACRoom INT,
	@RateAdultNACRoom INT,
	@RateChildNACRoom INT
)
AS
BEGIN
DECLARE @MyTableVar TABLE  
(  
    HotelID VARCHAR(7)
)
INSERT INTO Hotels
(HotelName,Country, City, HotelDescription, NoOfACRooms, NoOfNACRooms, RateAdultACRoom, RateChildACRoom, RateAdultNACRoom, RateChildNACRoom)
OUTPUT INSERTED.HotelID INTO @MyTableVar
VALUES(@HotelName, @Country, @City, @HotelDescription, @NoOfACRooms, @NoOfNACRooms, @RateAdultACRoom, @RateChildACRoom, @RateAdultNACRoom, @RateChildNACRoom)
SELECT * FROM @MyTableVar
END
GO

CREATE PROCEDURE USP_DeleteHotelDetailsByID
(
 @HotelID VARCHAR(20)
)
AS
BEGIN
DELETE FROM Hotels
WHERE HotelID = @HotelID
END
GO

CREATE PROCEDURE USP_GetHotelDetailsByID
(
	@HotelID VARCHAR(20)
)
AS
BEGIN
SET NOCOUNT ON;
SELECT HotelName,Country, City, HotelDescription, NoOfACRooms, NoOfNACRooms, RateAdultACRoom, RateChildACRoom, RateAdultNACRoom, RateChildNACRoom
FROM Hotels
WHERE HotelID = @HotelID
END
GO