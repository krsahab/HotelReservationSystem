using HotelReservationSystem.BOM;
using HotelReservationSystem.BusinessLogic;
using System;
using System.Web.Security;
using System.Web.UI;

namespace HotelReservationSystem.Web.Admin
{
    public partial class EditHotel : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    if (!Session["userId"].ToString().EndsWith(Utility.HRSConstants.ADMINENDSTRING))
                    {
                        FormsAuthentication.SignOut();
                        Session.Clear();
                    }
                    HRSHotelsBLL hotelsBLLObject = new HRSHotelsBLL();
                    var hotelIds = hotelsBLLObject.GetHotelsID();
                    HotelIDDropDownList.DataSource = hotelIds;
                    HotelIDDropDownList.DataTextField = "Value";
                    HotelIDDropDownList.DataValueField = "Key";
                    HotelIDDropDownList.DataBind();
                    hidden.Visible = false;
                }
            }
            catch (Exception ex)
            {
                Utility.ExceptionUtility.ExceptionLog(ex);
                throw;
            }
        }

        protected void HotelSearchButton_Click(object sender, EventArgs e)
        {
            try
            {
                HRSHotelsBLL hotelsBLLObject = new HRSHotelsBLL();
                string hotelID = HotelIDDropDownList.SelectedItem.Value;
                Hotel hotel = hotelsBLLObject.GetHotelDetailsByID(hotelID);
                HotelIDLabel.Text = hotelID;
                if (hotel != null)
                {
                    CountryLabel.Text = hotel.Country;
                    HotelNameEditTextbox.Text = hotel.HotelName;
                    CityLabel.Text = hotel.City;
                    HotelDescriptionTextBox.Text = hotel.HotelDescription;
                    NoOfACRoomsTextBox.Text = hotel.NoOfACRooms.ToString();
                    NoOfNACRoomsTextBox.Text = hotel.NoOfNACRooms.ToString();
                    RateACAdultTextBox.Text = hotel.RateAdultACRoom.ToString();
                    RateACChildTextBox.Text = hotel.RateChildACRoom.ToString();
                    RateNACChildTextBox.Text = hotel.RateChildNACRoom.ToString();
                    RateNACAdultTextBox.Text = hotel.RateAdultNACRoom.ToString();
                    TotalRoomLabel.Text = (hotel.NoOfACRooms + hotel.NoOfNACRooms).ToString();
                }
                hidden.Visible = true;
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
                HRSHotelsBLL hotelsBLLObject = new HRSHotelsBLL();
                Hotel hotel = new Hotel();
                hotel.HotelID = HotelIDDropDownList.SelectedItem.Value;
                hotel.HotelName = HotelNameEditTextbox.Text;
                hotel.HotelDescription = HotelDescriptionTextBox.Text;
                hotel.NoOfACRooms = Convert.ToInt32(NoOfACRoomsTextBox.Text);
                hotel.NoOfNACRooms = Convert.ToInt32(NoOfNACRoomsTextBox.Text);
                hotel.RateAdultACRoom = Convert.ToInt32(RateACAdultTextBox.Text);
                hotel.RateChildACRoom = Convert.ToInt32(RateACChildTextBox.Text);
                hotel.RateAdultNACRoom = Convert.ToInt32(RateNACAdultTextBox.Text);
                hotel.RateChildNACRoom = Convert.ToInt32(RateNACChildTextBox.Text);
                int result = hotelsBLLObject.UpdateHotelDetails(hotel);
                if (result > 0)
                    ErrorMessageLabel.Text = "Data Updated Successfully";
                else
                    ErrorMessageLabel.Text = "Failed";
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
    }
}