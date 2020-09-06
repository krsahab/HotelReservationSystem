using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using Microsoft.ApplicationBlocks.Data;
using System.Threading.Tasks;

namespace HotelReservationSystem.DataAccess
{
    class DataBaseHelper : DataAccessBase
    {
        public SqlParameter[] parameters { get; set; }
        public string storedProcedureName { get; set; }
        public int RunExecuteNonquery()
        {
            try
            {
                return SqlHelper.ExecuteNonQuery(ConnectionString,
                        CommandType.StoredProcedure,
                        storedProcedureName,
                        parameters);
            }
            catch (Exception ex)
            {
                Utility.ExceptionUtility.ExceptionLog(ex);
                throw;
            }
        }
        public SqlDataReader RunExecuteReader(SqlParameter[] parameters)
        {
            try
            {
                return SqlHelper.ExecuteReader(ConnectionString,
                        CommandType.StoredProcedure,
                        storedProcedureName,
                        parameters);
            }
            catch (Exception ex)
            {
                Utility.ExceptionUtility.ExceptionLog(ex);
                throw;
            }
        }
    }
}
