using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using HotelReservationSystem.DataAccess;
using HotelReservationSystem.BOM;
using SendEmail;

namespace HotelReservationSystem.BusinessLogic
{
    public class HRSCustomersBLL
    {
        HRSCustomersDAL customerDALObject = new HRSCustomersDAL();
        public string InsertCustomerDetails(Customers customer)
        {
            try
            {
                SqlDataReader result = customerDALObject.InsertCustomerDetails(customer);
                string customerId = string.Empty;
                if (result.HasRows)
                {
                    result.Read();
                    customerId = result["CustomerId"].ToString();
                    SendEmail.SendEmail.Registration(customer.CustomerName, customer.EmailAddress, result["CustomerId"].ToString());
                }
                return customerId;
            }
            catch (Exception ex)
            {
                Utility.ExceptionUtility.ExceptionLog(ex);
                throw;
            }
        }
        public List<KeyValuePair<string,string>> GetCountry()
        {
            try
            {
                SqlDataReader rd = customerDALObject.GetCountry();
                List<KeyValuePair<string, string>> countries = new List<KeyValuePair<string, string>>();
                while(rd.Read())
                    countries.Add(new KeyValuePair<string,string>(rd["CountryId"].ToString(),rd["CountryName"].ToString()));
                return countries;
            }
            catch (Exception ex)
            {
                Utility.ExceptionUtility.ExceptionLog(ex);
                throw;
            }
        }
        public List<KeyValuePair<string, string>> GetState(int countryId)
        {
            try
            {
                SqlDataReader rd = customerDALObject.GetState(countryId);
                List<KeyValuePair<string, string>> states = new List<KeyValuePair<string, string>>();
                while (rd.Read())
                    states.Add(new KeyValuePair<string, string>(rd["StateId"].ToString(), rd["StateName"].ToString()));
                return states;
            }
            catch (Exception ex)
            {
                Utility.ExceptionUtility.ExceptionLog(ex);
                throw;
            }
        }
        public List<KeyValuePair<string, string>> GetCity(int stateId)
        {
            try
            {
                SqlDataReader rd = customerDALObject.GetCity(stateId);
                List<KeyValuePair<string, string>> cities = new List<KeyValuePair<string, string>>();
                while (rd.Read())
                    cities.Add(new KeyValuePair<string, string>(rd["CityId"].ToString(), rd["CityName"].ToString()));
                return cities;
            }
            catch (Exception ex)
            {
                Utility.ExceptionUtility.ExceptionLog(ex);
                throw;
            }
        }
        public bool VerifyUser(string customerId, string password)
        {
            try
            {
                var reader = customerDALObject.GetCustomerDetailsByIdAndPassword(customerId, password);
                if (reader.HasRows)
                    return true;
                return false;
            }
            catch (Exception ex)
            {
                Utility.ExceptionUtility.ExceptionLog(ex);
                throw;
            }
        }
        public Customers GetCustomerDetailsById(string customerId)
        {
            try
            {
                SqlDataReader reader = customerDALObject.GetCustomerDetailsById(customerId);
                Customers customers = new Customers();
                while(reader.Read())
                {
                    customers.CustomerId = reader["CustomerId"].ToString();
                    customers.CustomerName = reader["CustomerName"].ToString();
                    customers.DateOfBirth = DateTime.Parse(reader["DateOfBirth"].ToString());
                    customers.ContactNumber = reader["ContactNumber"].ToString();
                    customers.EmailAddress = reader["EmailAddress"].ToString();
                    customers.CustomerCountry = reader["CustomerCountry"].ToString();
                    customers.CustomerState = reader["CustomerState"].ToString();
                    customers.CustomerCity = reader["CustomerCity"].ToString();
                    customers.CustomerPinCode = reader["CustomerPinCode"].ToString();
                }
                return customers;
            }
            catch (Exception ex)
            {
                Utility.ExceptionUtility.ExceptionLog(ex);
                throw;
            }
        }
        public string GetCustomerDetailsByContactAndEmail(string Contact, string Email)
        {
            try
            {
                SqlDataReader reader = customerDALObject.GetCustomerDetailsByContactAndEmail(Contact, Email);
                string customerID = string.Empty;
                while(reader.Read())
                    customerID = reader["CustomerId"].ToString();
                return customerID;
            }
            catch (Exception ex)
            {
                Utility.ExceptionUtility.ExceptionLog(ex);
                throw;
            }
        }
    }
}
