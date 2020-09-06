using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HotelReservationSystem.BOM
{
    public class Customers
    {
        public string CustomerId { get; set; }
        public string CustomerName { get; set; }
        public string AccountPassword { get; set; }
        public DateTime DateOfBirth { get; set; }
        public string ContactNumber { get; set; }
        public string EmailAddress { get; set; }
        public string CustomerCountry { get; set; }
        public string CustomerCity { get; set; }
        public string CustomerState { get; set; }
        public string CustomerPinCode { get; set; }
        public int Age { get; set; }
        public string CustomerType { get; set; }
    }
}
