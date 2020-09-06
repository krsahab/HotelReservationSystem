using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Threading.Tasks;
using HotelReservationSystem.BOM;

namespace HotelReservationSystem.DataAccess
{
    public class HRSHotelsDAL
    {
        DataBaseHelper dataBaseHelperObject = new DataBaseHelper();
        public SqlDataReader AddHotelDetails(Hotel hotel)
        {
            try
            {
                SqlParameter[] parameters = {   new SqlParameter("@HotelName",hotel.HotelName),
                                            new SqlParameter("@Country",hotel.Country),
                                            new SqlParameter("@City",hotel.City),
                                            new SqlParameter("@HotelDescription",hotel.HotelDescription),
                                            new SqlParameter("@NoOfACRooms",hotel.NoOfACRooms),
                                            new SqlParameter("@NoOfNACRooms",hotel.NoOfNACRooms),
                                            new SqlParameter("@RateAdultACRoom",hotel.RateAdultACRoom),
                                            new SqlParameter("@RateChildACRoom",hotel.RateChildACRoom),
                                            new SqlParameter("@RateAdultNACRoom",hotel.RateAdultNACRoom),
                                            new SqlParameter("@RateChildNACRoom",hotel.RateChildNACRoom)};
                dataBaseHelperObject.parameters = parameters;
                dataBaseHelperObject.storedProcedureName = "USP_AddHotelDetails";
                return dataBaseHelperObject.RunExecuteReader(parameters);
            }
            catch (Exception ex)
            {
                Utility.ExceptionUtility.ExceptionLog(ex);
                throw;
            }
        }
        public int UpdateHotelDetails(Hotel hotel)
        {
            try
            {
                SqlParameter[] parameters = { new SqlParameter("@HotelID",hotel.HotelID),
                                            new SqlParameter("@HotelName",hotel.HotelName),
                                            new SqlParameter("@HotelDescription",hotel.HotelDescription),
                                            new SqlParameter("@NoOfACRooms",hotel.NoOfACRooms),
                                            new SqlParameter("@NoOfNACRooms",hotel.NoOfNACRooms),
                                            new SqlParameter("@RateAdultACRoom",hotel.RateAdultACRoom),
                                            new SqlParameter("@RateChildACRoom",hotel.RateChildACRoom),
                                            new SqlParameter("@RateAdultNACRoom",hotel.RateAdultNACRoom),
                                            new SqlParameter("@RateChildNACRoom",hotel.RateChildNACRoom)};
                dataBaseHelperObject.parameters = parameters;
                dataBaseHelperObject.storedProcedureName = "USP_UpdateHotelDetailsByID";
                return dataBaseHelperObject.RunExecuteNonquery();
            }
            catch (Exception ex)
            {
                Utility.ExceptionUtility.ExceptionLog(ex);
                throw;
            }
        }
        public int DeleteHotelDetails(string hotelID)
        {
            try
            {
                SqlParameter[] parameters = { new SqlParameter("@HotelID", hotelID) };
                dataBaseHelperObject.parameters = parameters;
                dataBaseHelperObject.storedProcedureName = "USP_DeleteHotelDetailsByID";
                return dataBaseHelperObject.RunExecuteNonquery();
            }
            catch (Exception ex)
            {
                Utility.ExceptionUtility.ExceptionLog(ex);
                throw;
            }
        }
        public SqlDataReader GetHotelsID()
        {
            try
            {
                dataBaseHelperObject.storedProcedureName = "USP_GetHotelsID";
                SqlParameter[] parameters = null;
                dataBaseHelperObject.parameters = parameters;
                return dataBaseHelperObject.RunExecuteReader(parameters);
            }
            catch (Exception ex)
            {
                Utility.ExceptionUtility.ExceptionLog(ex);
                throw;
            }
        }
        public SqlDataReader GetHotelDetailsByID(string hotelID)
        {
            try
            {
                dataBaseHelperObject.storedProcedureName = "USP_GetHotelDetailsByID";
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
        public SqlDataReader SearchHotels(int roomNo, string city, string roomType)
        {
            try
            {
                SqlParameter[] parameters = {
                                            new SqlParameter("@RoomType",roomType),
                                            new SqlParameter("@TotalRooms",roomNo),
                                            new SqlParameter("@City",city)
                                        };
                dataBaseHelperObject.parameters = parameters;
                dataBaseHelperObject.storedProcedureName = "USP_SearchHotels";
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
