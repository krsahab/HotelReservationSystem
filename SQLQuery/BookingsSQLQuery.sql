USE HotalReservationSystemDB
GO

CREATE TABLE Bookings
(
	ID INT IDENTITY(1,1),
	BookingID as (CAST((substring(CustomerID,1,1)+substring(HotelID,1,1)+CAST(DAY(ArrivalDate) AS VARCHAR(2))+CAST(DAY(DepartureDate) AS VARCHAR(2))+RIGHT('000'+CAST(ID AS VARCHAR(3)),3))AS VARCHAR(20))) PERSISTED,
	HotelID VARCHAR(7) NOT NULL,
	CustomerID VARCHAR(5) NOT NULL,
	BookingDate DATE NOT NULL,
	ArrivalDate DATE NOT NULL,
	DepartureDate DATE NOT NULL,
	NoOfAdults INT NOT NULL,
	NoOfChildren INT NOT NULL,
	NoOfNights INT NOT NULL,
	TotalRooms INT NOT NULL,
	RoomType VARCHAR(10) NOT NULL,
	CONSTRAINT PK_Bookings_BookingID PRIMARY KEY (BookingID),
)
GO