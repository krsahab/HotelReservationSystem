using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HotelReservationSystem.BOM
{
    public class Transaction
    {
        public int TXNID { get; set; }
        public string ID { get; set; }
        public string BookingID { get; set; }
        public string CustomerID { get; set; }
        public int Amount { get; set; }
        public long CardNo { get; set; }
        public DateTime DateTimeOfTXN { get; set; }
        public string TXNStatus { get; set; }
    }
}
