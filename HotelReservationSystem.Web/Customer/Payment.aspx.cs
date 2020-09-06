using HotelReservationSystem.BOM;
using HotelReservationSystem.BusinessLogic;
using System;
using System.Collections.Generic;
using System.Web.UI;
using Utility;

namespace HotelReservationSystem.Web.Customer
{
    public partial class Payment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                ExpiryDateTextBox.Attributes["min"] = DateTime.Now.ToString("yyyy-MM-dd");
                HRSBookingsBLL bookingBLLObject = new HRSBookingsBLL();
                string customerID = Session["userId"].ToString();
                List<string> booking = bookingBLLObject.GetBookingIDForTXN(customerID);
                BookingIDDropDownList.DataSource = booking;
                BookingIDDropDownList.DataBind();
                BookingIDDropDownList.SelectedValue = Request.QueryString["field"];
                hidden.Visible = false;
            }
            catch (Exception ex)
            {
                ExceptionUtility.ExceptionLog(ex);
                throw;
            }
        }

        protected void SubmitButton_Click(object sender, EventArgs e)
        {
            try
            {
                Transaction transaction = new Transaction();
                HRSPaymentsBLL paymentBLLObject = new HRSPaymentsBLL();
                transaction.CustomerID = Session["userId"].ToString();
                transaction.BookingID = BookingIDDropDownList.SelectedItem.ToString();
                transaction.Amount = Convert.ToInt32(AmountTextBox.Text.ToString());
                transaction.CardNo = Convert.ToInt64(CreditCardNoTextBox.Text.ToString());
                transaction.DateTimeOfTXN = DateTime.Now;
                transaction.TXNStatus = HRSConstants.SUCCESS;
                var transactionID = paymentBLLObject.AddTransactionDetails(transaction);
                if (!string.IsNullOrEmpty(transactionID))
                {
                    string display = "Payment Successfully Done." + "\n" + "Transaction ID: " + transactionID;
                    ErrorMessageLabel.Text = display;
                }
                else
                    ErrorMessageLabel.Text = HRSConstants.FAILED;
                System.Text.StringBuilder sb = new System.Text.StringBuilder();
                sb.Append(@"<script type='text/javascript'>");
                sb.Append("$(function () {");
                sb.Append(" $('#Result').modal('show');});");
                sb.Append("</script>");
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "ModelScript", sb.ToString(), false);
            }
            catch (Exception ex)
            {
                ExceptionUtility.ExceptionLog(ex);
                throw;
            }
        }

        protected void BookingIDButton_Click(object sender, EventArgs e)
        {
            try
            {
                int noOfAdults = 0, noOfChildren = 0, noOfnights = 0, rateAdult = 0, rateChild = 0;
                double bill = 0;
                string hotelID = string.Empty;
                string roomType = string.Empty;
                HRSBookingsBLL bookingBLLObject = new HRSBookingsBLL();
                string bookingID = BookingIDDropDownList.SelectedItem.Text;
                var booking = bookingBLLObject.GetBookingDetails(bookingID);
                if (booking != null)
                {
                    hotelID = booking.HotelID;
                    noOfAdults = booking.NoOfAdults;
                    noOfChildren = booking.NoOfChildren;
                    noOfnights = booking.NoOfNights;
                    roomType = booking.RoomType;
                }
                HRSHotelsBLL hotelBLLObject = new HRSHotelsBLL();
                var hotel = hotelBLLObject.GetHotelDetailsByID(hotelID);
                if (roomType == HRSConstants.AC)
                {
                    rateAdult = hotel.RateAdultACRoom;
                    rateChild = hotel.RateChildACRoom;
                }
                else
                {
                    rateAdult = hotel.RateAdultNACRoom;
                    rateChild = hotel.RateChildNACRoom;
                }
                bill = (noOfAdults * rateAdult + noOfChildren * rateChild) * noOfnights;
                if (noOfnights > 5)
                {
                    bill = bill - bill * 0.025;
                }
                AmountTextBox.Text = bill.ToString();
                hidden.Visible = true;
            }
            catch (Exception ex)
            {
                ExceptionUtility.ExceptionLog(ex);
                throw;
            }
        }

        protected void CloseButton_Click(object sender, EventArgs e)
        {
            Response.Redirect(Request.RawUrl);
        }
    }
}