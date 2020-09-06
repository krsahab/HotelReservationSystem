using HotelReservationSystem.BOM;
using HotelReservationSystem.BusinessLogic;
using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HotelReservationSystem.Web.Customer
{
    public partial class EditReservation : System.Web.UI.Page
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
                    hidden.Visible = false;
                }
                if (IsPostBack)
                {
                    if (ArrivalDateTextBox.Text != "" && DepartureDateTextbox.Text != "")
                    {
                        DateTime arrivalDate = new DateTime();
                        DateTime departureDate = new DateTime();
                        DateTime.TryParse(ArrivalDateTextBox.Text.ToString(), out arrivalDate);
                        DateTime.TryParse(DepartureDateTextbox.Text.ToString(), out departureDate);
                        int noOfNights = (int)(departureDate - arrivalDate).TotalDays;
                        NoOfNightsTextBox.Text = noOfNights.ToString();
                    }
                }
            }
            catch (Exception ex)
            {
                Utility.ExceptionUtility.ExceptionLog(ex);
                throw;
            }
        }

        protected void SaveButton_Click(object sender, EventArgs e)
        {
            try
            {
                Booking booking = new Booking();
                HRSBookingsBLL bookingBLLObject = new HRSBookingsBLL();
                booking.BookingDate = DateTime.Now;
                booking.BookingID = BookingIDDropDownList.SelectedItem.Text;
                booking.ArrivalDate = DateTime.Parse(ArrivalDateTextBox.Text.ToString());
                booking.DepartureDate = DateTime.Parse(DepartureDateTextbox.Text.ToString());
                booking.NoOfAdults = Convert.ToInt32(NoOfAdultTextBox.Text.ToString());
                booking.NoOfChildren = Convert.ToInt32(NoOfChildrenTextBox.Text.ToString());
                booking.NoOfNights = Convert.ToInt32(NoOfNightsTextBox.Text.ToString());
                booking.HotelID = HotelIDTextbox.Text;
                booking.RoomType = RoomTypeTextbox.Text;
                booking.TotalRooms = Convert.ToInt32(TotalRoomTextBox.Text);
                string result = bookingBLLObject.AddUpdateBooking(booking,true);
                ResultLabel.Text = result;

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
        protected void BookingSearchButton_Click(object sender, EventArgs e)
        {
            try
            {
                HRSBookingsBLL bookingBLLObject = new HRSBookingsBLL();
                string bookingID = BookingIDDropDownList.SelectedItem.Text;
                Booking booking = bookingBLLObject.GetBookingDetails(bookingID);
                if (booking != null)
                {
                    HotelIDTextbox.Text = booking.HotelID;
                    BookingDateTextbox.Text = booking.BookingDate.ToString();
                    ArrivalDateTextBox.Text = booking.ArrivalDate.ToString();
                    DepartureDateTextbox.Text = booking.DepartureDate.ToString();
                    NoOfAdultTextBox.Text = booking.NoOfAdults.ToString();
                    NoOfChildrenTextBox.Text = booking.NoOfChildren.ToString();
                    NoOfNightsTextBox.Text = booking.NoOfNights.ToString();
                    RoomTypeTextbox.Text = booking.RoomType;
                    TotalRoomTextBox.Text = booking.TotalRooms.ToString();
                }
                hidden.Visible = true;
            }
            catch (Exception ex)
            {
                Utility.ExceptionUtility.ExceptionLog(ex);
                throw;
            }
        }

        protected void ArrivalDateTextBox_TextChanged(object sender, EventArgs e)
        {
            ArrivalDateTextBox.TextMode = TextBoxMode.Date;
        }

        protected void DepartureDateTextbox_TextChanged(object sender, EventArgs e)
        {
            DepartureDateTextbox.TextMode = TextBoxMode.Date;
        }
    }
}