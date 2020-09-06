using HotelReservationSystem.BusinessLogic;
using System;

namespace HotelReservationSystem.Web.Customer
{
    public partial class Transactions : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    HRSPaymentsBLL paymentBLLObject = new HRSPaymentsBLL();
                    string customerID = Session["userId"].ToString();
                    var bookings = paymentBLLObject.GetTXNBookindID(customerID);
                    BookingIDDropDownList.DataSource = bookings;
                    BookingIDDropDownList.DataBind();
                }
                hidden2.Visible = false;
            }
            catch (Exception ex)
            {
                Utility.ExceptionUtility.ExceptionLog(ex);
                throw;
            }
        }

        protected void ViewButton_Click(object sender, EventArgs e)
        {
            try
            {
                HRSPaymentsBLL paymentBLLObject = new HRSPaymentsBLL();
                string bookingID = BookingIDDropDownList.SelectedItem.Text;
                var transaction = paymentBLLObject.GetTransactionDetailsByBookindID(bookingID);
                TXNGridView.DataSource = transaction;
                TXNGridView.DataBind();
                hidden2.Visible = true;
            }
            catch (Exception ex)
            {
                Utility.ExceptionUtility.ExceptionLog(ex);
                throw;
            }
        }
    }
}