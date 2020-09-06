using HotelReservationSystem.BOM;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HotelReservationSystem.DataAccess
{
    public class HRSBookingsDAL
    {
        DataBaseHelper dataBaseHelperObject = new DataBaseHelper();
        public SqlDataReader AddBookingDetails(Booking booking)
        {
            try
            {
                SqlParameter[] parameters = {   new SqlParameter("@HotelID",booking.HotelID),
                                            new SqlParameter("@CustomerID",booking.CustomerID),
                                            new SqlParameter("@BookingDate",booking.BookingDate),
                                            new SqlParameter("@ArrivalDate",booking.ArrivalDate),
                                            new SqlParameter("@DepartureDate",booking.DepartureDate),
                                            new SqlParameter("@NoOfAdults",booking.NoOfAdults),
                                            new SqlParameter("@NoOfChildren",booking.NoOfChildren),
                                            new SqlParameter("@NoOfNights",booking.NoOfNights),
                                            new SqlParameter("@TotalRooms",booking.TotalRooms),
                                            new SqlParameter("@RoomType",booking.RoomType)};
                dataBaseHelperObject.parameters = parameters;
                dataBaseHelperObject.storedProcedureName = "USP_AddBookingDetails";
                return dataBaseHelperObject.RunExecuteReader(parameters);
            }
            catch (Exception ex)
            {
                Utility.ExceptionUtility.ExceptionLog(ex);
                throw;
            }
        }
        public int UpdateBookingDetails(Booking booking)
        {
            try
            {
                SqlParameter[] parameters = { new SqlParameter("@BookingID",booking.BookingID),
                                            new SqlParameter("@BookingDate",booking.BookingDate),
                                            new SqlParameter("@ArrivalDate",booking.ArrivalDate),
                                            new SqlParameter("@DepartureDate",booking.DepartureDate),
                                            new SqlParameter("@NoOfAdults",booking.NoOfAdults),
                                            new SqlParameter("@NoOfChildren",booking.NoOfChildren),
                                            new SqlParameter("@NoOfNights",booking.NoOfNights)};
                dataBaseHelperObject.parameters = parameters;
                dataBaseHelperObject.storedProcedureName = "USP_UpdateBookingDetailsByID";
                return dataBaseHelperObject.RunExecuteNonquery();
            }
            catch (Exception ex)
            {
                Utility.ExceptionUtility.ExceptionLog(ex);
                throw;
            }
        }
        public int DeleteBookingDetails(string bookingID)
        {
            try
            {
                SqlParameter[] parameters = { new SqlParameter("@BookingID", bookingID) };
                dataBaseHelperObject.parameters = parameters;
                dataBaseHelperObject.storedProcedureName = "USP_DeleteBookingDetailsByID";
                return dataBaseHelperObject.RunExecuteNonquery();
            }
            catch (Exception ex)
            {
                Utility.ExceptionUtility.ExceptionLog(ex);
                throw;
            }
        }
        public SqlDataReader GetBookingID(string customerID)
        {
            try
            {
                dataBaseHelperObject.storedProcedureName = "USP_GetBookingsByCustomerID";
                SqlParameter[] parameters = { new SqlParameter("@CustomerID", customerID) };
                dataBaseHelperObject.parameters = parameters;
                return dataBaseHelperObject.RunExecuteReader(parameters);
            }
            catch (Exception ex)
            {
                Utility.ExceptionUtility.ExceptionLog(ex);
                throw;
            }
        }
        public SqlDataReader GetBookingIDForTXN(string customerID)
        {
            try
            {
                dataBaseHelperObject.storedProcedureName = "USP_GetBookingsByCustomerIDForTXN";
                SqlParameter[] parameters = { new SqlParameter("@CustomerID", customerID) };
                dataBaseHelperObject.parameters = parameters;
                return dataBaseHelperObject.RunExecuteReader(parameters);
            }
            catch (Exception ex)
            {
                Utility.ExceptionUtility.ExceptionLog(ex);
                throw;
            }
        }
        public SqlDataReader GetBookingsByHotelID(string hotelID)
        {
            try
            {
                dataBaseHelperObject.storedProcedureName = "USP_GetBookingsByHotelID";
                SqlParameter[] parameters = { new SqlParameter("@HotelID", hotelID) };
                dataBaseHelperObject.parameters = parameters;
                return dataBaseHelperObject.RunExecuteReader(parameters);
            }
            catch (Exception ex)
            {
                Utility.ExceptionUtility.ExceptionLog(ex);
                throw;
            }
        }
        public SqlDataReader GetBookingDetails(string bookingID)
        {
            try
            {
                dataBaseHelperObject.storedProcedureName = "USP_GetBookingDetailsByID";
                SqlParameter[] parameters = { new SqlParameter("@BookingID", bookingID) };
                dataBaseHelperObject.parameters = parameters;
                return dataBaseHelperObject.RunExecuteReader(parameters);
            }
            catch (Exception ex)
            {
                Utility.ExceptionUtility.ExceptionLog(ex);
                throw;
            }
        }
    }
}
