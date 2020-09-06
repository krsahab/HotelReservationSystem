using HotelReservationSystem.BOM;
using HotelReservationSystem.DataAccess;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using Utility;

namespace HotelReservationSystem.BusinessLogic
{
    public class HRSBookingsBLL
    {
        HRSBookingsDAL HRSBookingDALObject = new HRSBookingsDAL();
        public string AddUpdateBooking(Booking booking, bool isUpdate)
        {
            try
            {
                HRSBookingsBLL bookingBLLObject = new HRSBookingsBLL();
                HRSHotelsBLL hotelBLLObject = new HRSHotelsBLL();
                int noOfRoomsAvailable = 0;
                if ((booking.DepartureDate - booking.ArrivalDate).TotalDays > 7)
                    return "Difference between arrival and departure date must be maximum 7";
                int totalPersonPerRoom = (booking.NoOfChildren + booking.NoOfAdults) / booking.TotalRooms;
                var bookingRD = bookingBLLObject.GetBookingsByHotelID(booking.HotelID);
                var hotel = hotelBLLObject.GetHotelDetailsByID(booking.HotelID);
                if (booking.RoomType == HRSConstants.AC)
                    noOfRoomsAvailable = hotel.NoOfACRooms;
                else
                    noOfRoomsAvailable = hotel.NoOfNACRooms;
                foreach (var bookings in bookingRD)
                    if (bookings.ArrivalDate <= booking.DepartureDate && booking.ArrivalDate <= bookings.DepartureDate)
                        if (bookings.RoomType == booking.RoomType)
                            noOfRoomsAvailable -= bookings.TotalRooms;
                if (totalPersonPerRoom <= 4)
                {
                    if (noOfRoomsAvailable >= booking.TotalRooms)
                    {
                        if (isUpdate)
                        {
                            int result = bookingBLLObject.UpdateBookingDetails(booking);
                            if (result >= 1)
                                return "Successfully Saved";
                            else
                                return "Error Occured";
                        }
                        else
                        {
                            string bookingID = bookingBLLObject.AddBookingDetails(booking);
                            if (!string.IsNullOrEmpty(bookingID))
                                return bookingID;
                            else
                                return "Error Occured";
                        }
                    }
                    else
                        return "Sorry! Required rooms are not available for you inputs.\nModify your inputs or search hotel before booking.";
                }
                else
                    return "Total person per room must not exceed 4";
            }
            catch (Exception ex)
            {
                ExceptionUtility.ExceptionLog(ex);
                throw;
            }
        }
        public string AddBookingDetails(Booking booking)
        {
            try
            {
                SqlDataReader result = HRSBookingDALObject.AddBookingDetails(booking);
                string bookingId = string.Empty;
                if (result.HasRows)
                {
                    result.Read();
                    bookingId = result["BookingID"].ToString();
                    HRSCustomersBLL customerBLLObject = new HRSCustomersBLL();
                    var customer = customerBLLObject.GetCustomerDetailsById(booking.CustomerID);
                    SendEmail.SendEmail.BookHotel(booking.CustomerID, customer.EmailAddress, bookingId);
                }
                return bookingId;
            }
            catch (Exception ex)
            {
                ExceptionUtility.ExceptionLog(ex);
                throw;
            }
        }
        public int UpdateBookingDetails(Booking booking)
        {
            try
            {
                return HRSBookingDALObject.UpdateBookingDetails(booking);
            }
            catch (Exception ex)
            {
                ExceptionUtility.ExceptionLog(ex);
                throw;
            }
        }
        public int DeleteBookingDetails(string bookingID, string customerID)
        {
            try
            {
                int result = HRSBookingDALObject.DeleteBookingDetails(bookingID);
                if (result >= 1)
                {
                    HRSCustomersBLL customerBLLObject = new HRSCustomersBLL();
                    var customer = customerBLLObject.GetCustomerDetailsById(customerID);
                    SendEmail.SendEmail.CancelReservation(customerID, customer.EmailAddress, bookingID);
                }
                return result;
            }
            catch (Exception ex)
            {
                ExceptionUtility.ExceptionLog(ex);
                throw;
            }
        }
        public List<Booking> GetBookingsByHotelID(string hotelID)
        {
            try
            {
                SqlDataReader bookingRD = HRSBookingDALObject.GetBookingsByHotelID(hotelID);
                List<Booking> bookings = new List<Booking>();
                while (bookingRD.Read())
                {
                    Booking booking = new Booking();
                    booking.BookingID = bookingRD["BookingID"].ToString();
                    booking.ArrivalDate = DateTime.Parse(bookingRD["ArrivalDate"].ToString());
                    booking.DepartureDate = DateTime.Parse(bookingRD["DepartureDate"].ToString());
                    booking.RoomType = bookingRD["RoomType"].ToString();
                    booking.TotalRooms = Convert.ToInt32(bookingRD["TotalRooms"].ToString());
                    bookings.Add(booking);
                }
                return bookings;
            }
            catch (Exception ex)
            {
                ExceptionUtility.ExceptionLog(ex);
                throw;
            }
        }
        public List<string> GetBookingID(string customerID)
        {
            try
            {
                SqlDataReader rd = HRSBookingDALObject.GetBookingID(customerID);
                List<string> bookings = new List<string>();
                while (rd.Read())
                    bookings.Add(rd["BookingID"].ToString());
                return bookings;
            }
            catch (Exception ex)
            {
                ExceptionUtility.ExceptionLog(ex);
                throw;
            }
        }
        public List<string> GetBookingIDForTXN(string customerID)
        {
            try
            {
                SqlDataReader rd = HRSBookingDALObject.GetBookingIDForTXN(customerID);
                List<string> bookings = new List<string>();
                while (rd.Read())
                    bookings.Add(rd["BookingID"].ToString());
                return bookings;
            }
            catch (Exception ex)
            {
                ExceptionUtility.ExceptionLog(ex);
                throw;
            }
        }
        public Booking GetBookingDetails(string bookingID)
        {
            try
            {
                SqlDataReader rd = HRSBookingDALObject.GetBookingDetails(bookingID);
                Booking booking = new Booking();
                while (rd.Read())
                {
                    booking.HotelID = rd["HotelID"].ToString();
                    booking.BookingDate = DateTime.Parse(rd["BookingDate"].ToString());
                    booking.ArrivalDate = DateTime.Parse(rd["ArrivalDate"].ToString());
                    booking.DepartureDate = DateTime.Parse(rd["DepartureDate"].ToString());
                    booking.NoOfAdults = Convert.ToInt32(rd["NoOfAdults"].ToString());
                    booking.NoOfChildren = Convert.ToInt32(rd["NoOfChildren"].ToString());
                    booking.NoOfNights = Convert.ToInt32(rd["NoOfNights"].ToString());
                    booking.RoomType = rd["RoomType"].ToString();
                    booking.TotalRooms = Convert.ToInt32(rd["TotalRooms"].ToString());
                }
                return booking;
            }
            catch (Exception ex)
            {
                ExceptionUtility.ExceptionLog(ex);
                throw;
            }
        }
    }
}
