using HotelReservationSystem.BOM;
using HotelReservationSystem.BusinessLogic;
using System;
using System.Web.Security;
using System.Web.UI;

namespace HotelReservationSystem.Web.Admin
{
    public partial class DeleteHotel : System.Web.UI.Page
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
                    var HotelIds = hotelsBLLObject.GetHotelsID();
                    HotelIDDropDownList.DataSource = HotelIds;
                    HotelIDDropDownList.DataTextField = "Value";
                    HotelIDDropDownList.DataValueField = "Key";
                    HotelIDDropDownList.DataBind();
                }
                hidden.Visible = false;
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
                    HotelNameLabel.Text = hotel.HotelName;
                    CityLabel.Text = hotel.City;
                    HotelDescriptionLabel.Text = hotel.HotelDescription;
                    NoOfACRoomsLabel.Text = hotel.NoOfACRooms.ToString();
                    NoOfNACRoomsLabel.Text = hotel.NoOfNACRooms.ToString();
                    RateAdultTextBox.Text = hotel.RateAdultACRoom.ToString();
                    RateChildTextBox.Text = hotel.RateChildACRoom.ToString();
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

        protected void DeleteButton_Click(object sender, EventArgs e)
        {
            try
            {
                HRSHotelsBLL hotelsBLLObject = new HRSHotelsBLL();
                string hotelID = HotelIDDropDownList.SelectedItem.Value;
                int result = hotelsBLLObject.DeleteHotelDetails(hotelID);
                if (result > 0)
                    ErrorMessageLabel.Text = "Data Deleted Successfully";
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

        protected void CloseButton_Click(object sender, EventArgs e)
        {
            Response.Redirect(Request.RawUrl);
        }
    }
}