USE HotalReservationSystemDB

CREATE PROCEDURE USP_GetTransactionDetailsByBookindID
(
	@BookindID VARCHAR(20)
)
AS
BEGIN
SET NOCOUNT ON;
SELECT
TXNID,
ID,
BookingID,
CustomerID,
Amount,
CardNo,
DateTimeOfTXN,
TXNStatus
FROM Transactions
WHERE BookingID = @BookindID
END
GO

CREATE PROCEDURE USP_GetTXNBookingID
(
	@CustomerID VARCHAR(5)
)
AS
BEGIN
SET NOCOUNT ON;
SELECT distinct BookingID FROM Transactions WHERE CustomerID = @CustomerID
END
GO

CREATE PROCEDURE USP_AddTransactionDetails
(
	@BookingID VARCHAR(20),
	@CustomerID VARCHAR(5),
	@Amount INT,
	@CardNo BIGINT,
	@DateTimeOfTXN DATETIME,
	@TXNStatus VARCHAR(10)
)
AS
BEGIN
DECLARE @MyTableVar TABLE  
(  
    TXNID VARCHAR(30)
)
INSERT INTO Transactions(BookingID,CustomerID,Amount,CardNo,DateTimeOfTXN,TXNStatus)
OUTPUT INSERTED.ID INTO @MyTableVar
VALUES
(
	@BookingID,
	@CustomerID,
	@Amount,
	@CardNo,
	@DateTimeOfTXN,
	@TXNStatus
)
SELECT * FROM @MyTableVar
END
GO