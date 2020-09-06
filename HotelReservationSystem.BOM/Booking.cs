using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HotelReservationSystem.BOM
{
    public class Booking
    {
        public string BookingID { get; set; }
        public string HotelID { get; set; }
        public string CustomerID { get; set; }
        public DateTime BookingDate { get; set; }
        public DateTime ArrivalDate { get; set; }
        public DateTime DepartureDate { get; set; }
        public int NoOfAdults { get; set; }
        public int NoOfChildren { get; set; }
        public int NoOfNights { get; set; }
        public int TotalRooms { get; set; }
        public string RoomType { get; set; }
    }
}
