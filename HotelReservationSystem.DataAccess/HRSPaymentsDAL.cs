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
    public class HRSPaymentsDAL
    {
        DataBaseHelper dataBaseHelperObject = new DataBaseHelper();
        public SqlDataReader AddTransactionDetails(Transaction transaction)
        {
            try
            {
                SqlParameter[] parameters = {   new SqlParameter("@BookingID",transaction.BookingID),
                                            new SqlParameter("@CustomerID",transaction.CustomerID),
                                            new SqlParameter("@Amount",transaction.Amount),
                                            new SqlParameter("@CardNo",transaction.CardNo),
                                            new SqlParameter("@DateTimeOfTXN",transaction.DateTimeOfTXN),
                                            new SqlParameter("@TXNStatus",transaction.TXNStatus)};
                dataBaseHelperObject.parameters = parameters;
                dataBaseHelperObject.storedProcedureName = "USP_AddTransactionDetails";
                return dataBaseHelperObject.RunExecuteReader(parameters);
            }
            catch (Exception ex)
            {
                Utility.ExceptionUtility.ExceptionLog(ex);
                throw;
            }
        }
        public SqlDataReader GetTransactionDetailsByBookindID(string bookingID)
        {
            try
            {
                dataBaseHelperObject.storedProcedureName = "USP_GetTransactionDetailsByBookindID";
                SqlParameter[] parameters = { new SqlParameter("@BookindID", bookingID) };
                dataBaseHelperObject.parameters = parameters;
                return dataBaseHelperObject.RunExecuteReader(parameters);
            }
            catch (Exception ex)
            {
                Utility.ExceptionUtility.ExceptionLog(ex);
                throw;
            }
        }
        public SqlDataReader GetTXNBookindID(string customerID)
        {
            try
            {
                dataBaseHelperObject.storedProcedureName = "USP_GetTXNBookingID";
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
    }
}
