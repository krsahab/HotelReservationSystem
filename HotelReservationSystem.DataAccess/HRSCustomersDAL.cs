using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using Microsoft.ApplicationBlocks.Data;
using HotelReservationSystem.BOM;

namespace HotelReservationSystem.DataAccess
{
    public class HRSCustomersDAL
    {
        DataBaseHelper dataBaseHelperObject = new DataBaseHelper();
        public SqlDataReader InsertCustomerDetails(Customers customer)
        {
            try
            {
                SqlParameter[] parameters = {
                                            new SqlParameter("@CustomerName",customer.CustomerName),
                                            new SqlParameter("@AccountPassword",customer.AccountPassword),
                                            new SqlParameter("@DateOfBirth",customer.DateOfBirth),
                                            new SqlParameter("@ContactNumber",customer.ContactNumber),
                                            new SqlParameter("@EmailAddress",customer.EmailAddress),
                                            new SqlParameter("@CustomerCountry",customer.CustomerCountry),
                                            new SqlParameter("@CustomerState",customer.CustomerState),
                                            new SqlParameter("@CustomerCity",customer.CustomerCity),
                                            new SqlParameter("@CustomerPinCode",customer.CustomerPinCode),
                                            new SqlParameter("@Age",customer.Age),
                                            new SqlParameter("@CustomerType",customer.CustomerType)
                                        };
                dataBaseHelperObject.parameters = parameters;
                dataBaseHelperObject.storedProcedureName = "USP_InsertCustomerDetails";
                return dataBaseHelperObject.RunExecuteReader(parameters);
            }
            catch (Exception ex)
            {
                Utility.ExceptionUtility.ExceptionLog(ex);
                throw;
            }
        }

        public SqlDataReader GetCountry()
        {
            try
            {
                SqlParameter[] parameters = null;
                dataBaseHelperObject.storedProcedureName = "USP_GetCountry";
                return dataBaseHelperObject.RunExecuteReader(parameters);
            }
            catch (Exception ex)
            {
                Utility.ExceptionUtility.ExceptionLog(ex);
                throw;
            }
        }

        public SqlDataReader GetState(int countryId)
        {
            try
            {
                SqlParameter[] parameters = {
                                            
                                            new SqlParameter("@CountryId",countryId)
                                        };
                dataBaseHelperObject.parameters = parameters;
                dataBaseHelperObject.storedProcedureName = "USP_GetState";
                return dataBaseHelperObject.RunExecuteReader(parameters);
            }
            catch (Exception ex)
            {
                Utility.ExceptionUtility.ExceptionLog(ex);
                throw;
            }
        }

        public SqlDataReader GetCity(int stateId)
        {
            try
            {
                SqlParameter[] parameters = {
                                            
                                            new SqlParameter("@StateId",stateId)
                                        };
                dataBaseHelperObject.parameters = parameters;
                dataBaseHelperObject.storedProcedureName = "USP_GetCity";
                return dataBaseHelperObject.RunExecuteReader(parameters);
            }
            catch (Exception ex)
            {
                Utility.ExceptionUtility.ExceptionLog(ex);
                throw;
            }
        }

        public SqlDataReader GetCustomerDetailsByIdAndPassword(string customerId, string password)
        {
            try
            {
                SqlParameter[] parameters = {
                                            new SqlParameter("@CustomerId",customerId),
                                            new SqlParameter("@AccountPassword",password)
                                        };
                dataBaseHelperObject.parameters = parameters;
                dataBaseHelperObject.storedProcedureName = "USP_GetCustomerDetailsByIdAndPassword";
                return dataBaseHelperObject.RunExecuteReader(parameters);
            }
            catch (Exception ex)
            {
                Utility.ExceptionUtility.ExceptionLog(ex);
                throw;
            }
        }

        public SqlDataReader GetCustomerDetailsById(string customerId)
        {
            try
            {
                SqlParameter[] parameters = {
                                            new SqlParameter("@CustomerId",customerId)
                                        };
                dataBaseHelperObject.parameters = parameters;
                dataBaseHelperObject.storedProcedureName = "USP_GetCustomerDetailsById";
                return dataBaseHelperObject.RunExecuteReader(parameters);
            }
            catch (Exception ex)
            {
                Utility.ExceptionUtility.ExceptionLog(ex);
                throw;
            }
        }
        public SqlDataReader GetCustomerDetailsByContactAndEmail(string contact, string email)
        {
            try
            {
                SqlParameter[] parameters = {
                                            new SqlParameter("@Contact",contact),
                                            new SqlParameter("@Email",email)
                                        };
                dataBaseHelperObject.parameters = parameters;
                dataBaseHelperObject.storedProcedureName = "USP_GetCustomerDetailsByContactAndEmail";
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
