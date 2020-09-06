using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Threading.Tasks;
using HotelReservationSystem.DataAccess;
using HotelReservationSystem.BOM;

namespace HotelReservationSystem.BusinessLogic
{
    public class HRSHotelsBLL
    {
        HRSHotelsDAL hotelsDALObject = new HRSHotelsDAL();
        public string AddHotelDetails(Hotel hotel)
        {
            try
            {
                var result =  hotelsDALObject.AddHotelDetails(hotel);
                string HotelID = string.Empty;
                if (result.HasRows)
                {
                    result.Read();
                    HotelID = result["HotelID"].ToString();
                }
                return HotelID;
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
                return hotelsDALObject.UpdateHotelDetails(hotel);
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
                return hotelsDALObject.DeleteHotelDetails(hotelID);
            }
            catch (Exception ex)
            {
                Utility.ExceptionUtility.ExceptionLog(ex);
                throw;
            }
        }
        public List<KeyValuePair<string, string>> GetHotelsID()
        {
            try
            {
                SqlDataReader reader = hotelsDALObject.GetHotelsID();
                List<KeyValuePair<string, string>> hotelIDs = new List<KeyValuePair<string, string>>();
                while(reader.Read())
                    hotelIDs.Add(new KeyValuePair<string, string>(reader["HotelID"].ToString(), reader["HotelName"].ToString()));
                return hotelIDs;
            }
            catch (Exception ex)
            {
                Utility.ExceptionUtility.ExceptionLog(ex);
                throw;
            }
        }
        public Hotel GetHotelDetailsByID(string hotelID)
        {
            try
            {
                SqlDataReader rd = hotelsDALObject.GetHotelDetailsByID(hotelID);
                Hotel hotel = new Hotel();
                hotel.HotelID = hotelID;
                while (rd.Read())
                {
                    hotel.Country = rd["Country"].ToString();
                    hotel.HotelName = rd["HotelName"].ToString();
                    hotel.City = rd["City"].ToString();
                    hotel.HotelDescription = rd["HotelDescription"].ToString();
                    hotel.NoOfACRooms = Convert.ToInt32(rd["NoOfACRooms"].ToString());
                    hotel.NoOfNACRooms = Convert.ToInt32(rd["NoOfNACRooms"].ToString());
                    hotel.RateAdultACRoom = Convert.ToInt32(rd["RateAdultACRoom"].ToString());
                    hotel.RateChildACRoom = Convert.ToInt32(rd["RateChildACRoom"].ToString());
                    hotel.RateChildNACRoom = Convert.ToInt32(rd["RateChildNACRoom"].ToString());
                    hotel.RateAdultNACRoom = Convert.ToInt32(rd["RateAdultNACRoom"].ToString());
                }
                return hotel;

            }
            catch (Exception ex)
            {
                Utility.ExceptionUtility.ExceptionLog(ex);
                throw;
            }
        }
        public List<Hotel> SearchHotels(int roomNo, string city, string roomType)
        {
            try
            {
                SqlDataReader hotelRD = hotelsDALObject.SearchHotels(roomNo, city, roomType);
                List<Hotel> hotelList = new List<Hotel>();
                while (hotelRD.Read())
                {
                    Hotel hotelObject = new Hotel();
                    hotelObject.HotelID = hotelRD["HotelID"].ToString();
                    hotelObject.HotelName = hotelRD["HotelName"].ToString();
                    hotelObject.Country = hotelRD["Country"].ToString();
                    hotelObject.City = hotelRD["City"].ToString();
                    hotelObject.HotelDescription = hotelRD["HotelDescription"].ToString();
                    hotelObject.NoOfACRooms = Convert.ToInt32(hotelRD["NoOfACRooms"].ToString());
                    hotelObject.NoOfNACRooms = Convert.ToInt32(hotelRD["NoOfNACRooms"].ToString());
                    hotelObject.RateAdultACRoom = Convert.ToInt32(hotelRD["RateAdultACRoom"].ToString());
                    hotelObject.RateAdultNACRoom = Convert.ToInt32(hotelRD["RateAdultNACRoom"].ToString());
                    hotelObject.RateChildACRoom = Convert.ToInt32(hotelRD["RateChildACRoom"].ToString());
                    hotelObject.RateChildNACRoom = Convert.ToInt32(hotelRD["RateChildNACRoom"].ToString());
                    hotelList.Add(hotelObject);
                }
                return hotelList;
            }
            catch (Exception ex)
            {
                Utility.ExceptionUtility.ExceptionLog(ex);
                throw;
            }
        }
    }
}
