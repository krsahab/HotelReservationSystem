using HotelReservationSystem.BOM;
using HotelReservationSystem.BusinessLogic;
using System;
using System.Web.UI;

namespace HotelReservationSystem.Web.Customer
{
    public partial class ReserveHotel : System.Web.UI.Page
    {
        public static string resultBookingID;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    HRSHotelsBLL hotelsBLLObject = new HRSHotelsBLL();
                    var hotelIds = hotelsBLLObject.GetHotelsID();
                    HotelIDDropDownList.DataSource = hotelIds;
                    HotelIDDropDownList.DataTextField = "Value";
                    HotelIDDropDownList.DataValueField = "Key";
                    HotelIDDropDownList.DataBind();
                    BookingDateTextbox.Text = DateTime.Now.ToString("MM/dd/yyyy");
                    NoOfNightsTextBox.Text = string.Empty;
                    HotelIDDropDownList.SelectedValue = Request.QueryString["field"];
                }
                if (IsPostBack)
                {
                    if (ArrivalDateTextBox.Text != "" && DepartureDateTextbox.Text != "")
                    {
                        DateTime arrivalDate = DateTime.Parse(ArrivalDateTextBox.Text.ToString());
                        DateTime departureDate = DateTime.Parse(DepartureDateTextbox.Text.ToString());
                        int noOfNights = (int)(departureDate - arrivalDate).TotalDays;
                        NoOfNightsTextBox.Text = noOfNights.ToString();
                    }
                }
                ArrivalDateTextBox.Attributes["min"] = DateTime.Now.ToString("yyyy-MM-dd");
                DepartureDateTextbox.Attributes["min"] = DateTime.Now.ToString("yyyy-MM-dd");
            }
            catch (Exception ex)
            {
                Utility.ExceptionUtility.ExceptionLog(ex);
                throw;
            }
        }

        protected void BookNowButton_Click(object sender, EventArgs e)
        {
            try
            {
                Booking booking = new Booking();
                HRSBookingsBLL bookingBLLObject = new HRSBookingsBLL();
                booking.BookingDate = DateTime.Now;
                booking.HotelID = HotelIDDropDownList.SelectedItem.Value;
                booking.CustomerID = Session["userId"].ToString();
                booking.ArrivalDate = DateTime.Parse(ArrivalDateTextBox.Text.ToString());
                booking.DepartureDate = DateTime.Parse(DepartureDateTextbox.Text.ToString());
                booking.NoOfAdults = Convert.ToInt32(NoOfAdultTextBox.Text.ToString());
                booking.NoOfChildren = Convert.ToInt32(NoOfChildrenTextBox.Text.ToString());
                booking.NoOfNights = (int)(booking.DepartureDate - booking.ArrivalDate).TotalDays;
                booking.TotalRooms = Convert.ToInt32(TotalRoomTextBox.Text.ToString());
                booking.RoomType = RoomTypeDropDownList.SelectedItem.Text;
                string result = bookingBLLObject.AddUpdateBooking(booking, false);
                if (result.Trim().Split().Length == 1)
                {
                    ReseltLabel.Text = "Hotel Reserved Successfully, Note your booking id: " + result;
                    resultBookingID = result;
                    PaymentButton.Visible = true;
                }
                else
                    ReseltLabel.Text = result;

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

        protected void ProceedToPaymentButton_Click(object sender, EventArgs e)
        {
            try
            {
                Response.Redirect("Payment.aspx?field=" + resultBookingID);
            }
            catch (Exception ex)
            {
                Utility.ExceptionUtility.ExceptionLog(ex);
                throw;
            }
        }
    }
}