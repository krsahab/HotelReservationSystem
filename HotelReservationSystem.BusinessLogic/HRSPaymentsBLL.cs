using HotelReservationSystem.BOM;
using HotelReservationSystem.DataAccess;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;

namespace HotelReservationSystem.BusinessLogic
{
    public class HRSPaymentsBLL
    {
        HRSPaymentsDAL HRSPaymentDALObject = new HRSPaymentsDAL();
        public string AddTransactionDetails(Transaction transaction)
        {
            try
            {
                HRSCustomersBLL customerBLLObject = new HRSCustomersBLL();
                var customer = customerBLLObject.GetCustomerDetailsById(transaction.CustomerID);
                DateTime zeroTime = new DateTime(1, 1, 1);
                TimeSpan span = DateTime.Now - customer.DateOfBirth;
                int years = (zeroTime + span).Year - 1;
                if (years > 50)
                    transaction.Amount = (int)(transaction.Amount - transaction.Amount * 0.05);
                SqlDataReader reader = HRSPaymentDALObject.AddTransactionDetails(transaction);
                string transactionID = string.Empty;
                while (reader.Read())
                {
                    transactionID = reader["TXNID"].ToString();
                    SendEmail.SendEmail.PaymentConfirmation(transaction.CustomerID, customer.EmailAddress, transaction.BookingID, transaction.Amount.ToString(), transactionID);
                }
                return transactionID;
            }
            catch (Exception ex)
            {
                Utility.ExceptionUtility.ExceptionLog(ex);
                throw;
            }
        }
        public List<Transaction> GetTransactionDetailsByBookindID(string bookingID)
        {
            try
            {
                SqlDataReader reader = HRSPaymentDALObject.GetTransactionDetailsByBookindID(bookingID);
                List<Transaction> transactions = new List<Transaction>();
                while (reader.Read())
                {
                    Transaction transaction = new Transaction();
                    transaction.TXNID = Convert.ToInt32(reader["TXNID"].ToString());
                    transaction.ID = reader["ID"].ToString();
                    transaction.BookingID = bookingID;
                    transaction.CustomerID = reader["CustomerID"].ToString();
                    transaction.Amount = Convert.ToInt32(reader["Amount"].ToString());
                    transaction.CardNo = Convert.ToInt64(reader["CardNo"].ToString());
                    transaction.DateTimeOfTXN = DateTime.Parse(reader["DateTimeOfTXN"].ToString());
                    transaction.TXNStatus = reader["TXNStatus"].ToString();
                    transactions.Add(transaction);
                }
                return transactions;
            }
            catch (Exception ex)
            {
                Utility.ExceptionUtility.ExceptionLog(ex);
                throw;
            }
        }
        public List<string> GetTXNBookindID(string customerID)
        {
            try
            {
                SqlDataReader reader = HRSPaymentDALObject.GetTXNBookindID(customerID);
                List<string> bookings = new List<string>();
                while (reader.Read())
                    bookings.Add(reader["BookingID"].ToString());
                return bookings;
            }
            catch (Exception ex)
            {
                Utility.ExceptionUtility.ExceptionLog(ex);
                throw;
            }
        }
    }
}
