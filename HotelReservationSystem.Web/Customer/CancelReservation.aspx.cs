using HotelReservationSystem.BOM;
using HotelReservationSystem.BusinessLogic;
using System;
using System.Web.UI;

namespace HotelReservationSystem.Web.Customer
{
    public partial class CancelReservation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    HRSBookingsBLL bookingBLLObject = new HRSBookingsBLL();
                    string customerID = Session["userId"].ToString();
                    var bookings = bookingBLLObject.GetBookingID(customerID);
                    BookingIDDropDownList.DataSource = bookings;
                    BookingIDDropDownList.DataBind();
                }
                hidden.Visible = false;
            }
            catch (Exception ex)
            {
                Utility.ExceptionUtility.ExceptionLog(ex);
                throw;
            }
        }

        protected void BookingIDButton_Click(object sender, EventArgs e)
        {
            try
            {
                HRSBookingsBLL bookingBLLObject = new HRSBookingsBLL();
                string bookingID = BookingIDDropDownList.SelectedItem.Text;
                Booking booking = bookingBLLObject.GetBookingDetails(bookingID);
                if (booking != null)
                {
                    HotelNameLabel.Text = booking.HotelID;
                    BookingDateLabel.Text = booking.BookingDate.ToString();
                    ArrivalDateLabel.Text = booking.ArrivalDate.ToString();
                    DepartureDateLabel.Text = booking.DepartureDate.ToString();
                    NoOfAdultLabel.Text = booking.NoOfAdults.ToString();
                    NoOfChildrenLabel.Text = booking.NoOfChildren.ToString();
                    NoOfNightsLabel.Text = booking.NoOfNights.ToString();
                }
                hidden.Visible = true;
            }
            catch (Exception ex)
            {
                Utility.ExceptionUtility.ExceptionLog(ex);
                throw;
            }
        }

        protected void CalcelButton_Click(object sender, EventArgs e)
        {
            try
            {
                HRSBookingsBLL bookingBLLObject = new HRSBookingsBLL();
                string bookingID = BookingIDDropDownList.SelectedItem.Text;
                string customerID = Session["userId"].ToString();
                DateTime bookingDate = DateTime.Parse(BookingDateLabel.Text);
                if ((DateTime.Now - bookingDate).TotalDays <= 3)
                {
                    int result = bookingBLLObject.DeleteBookingDetails(bookingID, customerID);
                    if (result >= 1)
                        ReseltLabel.Text = "Successfully Cancelled";
                    else
                        ReseltLabel.Text = "Error Occured";
                }
                else
                    ReseltLabel.Text = "Cancellation Not Allowed";
                System.Text.StringBuilder sb = new System.Text.StringBuilder();
                sb.Append(@"<script type='text/javascript'>");
                sb.Append("$(function () {");
                sb.Append(" $('#Result').modal('show');});");
                sb.Append("</script>");
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "ModelScript", sb.ToString(), false);
            }
            catch (Exception ex)
            {
                Utility.ExceptionUtility.ExceptionLog(ex);
                throw;
            }
        }

        protected void CloseButton_Click(object sender, EventArgs e)
        {
            Response.Redirect(Request.RawUrl);
        }
    }
}