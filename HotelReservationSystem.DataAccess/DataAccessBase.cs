using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Configuration;

namespace HotelReservationSystem.DataAccess
{
    public class DataAccessBase
    {
        protected string ConnectionString
        {
            get
            {
                try
                {
                    return ConfigurationManager.ConnectionStrings["HotelReservationSystemConnection"].ToString();

                }
                catch (Exception ex)
                {
                    Utility.ExceptionUtility.ExceptionLog(ex);
                    throw;
                }
            }
        }
    }
}
