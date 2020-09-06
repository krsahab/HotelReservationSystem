using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HotelReservationSystem.BOM
{
    public class Hotel
    {
        public string HotelID { get; set; }
        public string HotelName { get; set; }
        public string Country { get; set; }
        public string City { get; set; }
        public string HotelDescription { get; set; }
        public int NoOfACRooms { get; set; }
        public int NoOfNACRooms { get; set; }
        public int RateAdultACRoom { get; set; }
        public int RateAdultNACRoom { get; set; }
        public int RateChildACRoom { get; set; }
        public int RateChildNACRoom { get; set; }
    }
}
