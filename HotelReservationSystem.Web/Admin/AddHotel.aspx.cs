using HotelReservationSystem.BOM;
using HotelReservationSystem.BusinessLogic;
using System;
using System.Web.Security;
using System.Web.UI;
using Utility;

namespace HotelReservationSystem.Web.Admin
{
    public partial class AddHotel : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    if (!Session["userId"].ToString().EndsWith(HRSConstants.ADMINENDSTRING))
                    {
                        FormsAuthentication.SignOut();
                        Session.Clear();
                    }
                    HRSCustomersBLL customerBLLObject = new HRSCustomersBLL();
                    var countries = customerBLLObject.GetCountry();
                    CountryDropDownList.DataSource = countries;
                    CountryDropDownList.DataTextField = "Value";
                    CountryDropDownList.DataValueField = "Key";
                    CountryDropDownList.DataBind();
                }
                catch (Exception ex)
                {
                    ExceptionUtility.ExceptionLog(ex);
                    throw;
                }
            }
        }

        protected void SubmitButton_Click(object sender, EventArgs e)
        {
            try
            {
                HRSHotelsBLL hotelsBLLObject = new HRSHotelsBLL();
                Hotel hotel = new Hotel();
                hotel.HotelName = HotelNameTextbox.Text;
                hotel.Country = CountryDropDownList.SelectedItem.Text;
                hotel.City = CityDropDownList.SelectedItem.Text;
                hotel.HotelDescription = HotelDescriptionTextBox.Text;
                hotel.NoOfACRooms = Convert.ToInt32(NoOfACRoomsTextBox.Text);
                hotel.NoOfNACRooms = Convert.ToInt32(NoOfNACRoomsTextBox.Text);
                hotel.RateAdultACRoom = Convert.ToInt32(RateACAdultTextBox.Text);
                hotel.RateChildACRoom = Convert.ToInt32(RateACChildTextBox.Text);
                hotel.RateAdultNACRoom = Convert.ToInt32(RateNACAdultTextBox.Text);
                hotel.RateChildNACRoom = Convert.ToInt32(RateNACChildTextBox.Text);
                string hotelID = hotelsBLLObject.AddHotelDetails(hotel);
                if (!string.IsNullOrEmpty(hotelID))
                {
                    string display = "Hotel Added Successfully." + "\n" + "Hotel ID: " + hotelID;
                    ErrorMessageLabel.Text = display;
                }
                else
                    ErrorMessageLabel.Text = "failed";
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

        protected void CountryDropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                HRSCustomersBLL customerBLLObject = new HRSCustomersBLL();
                var states = customerBLLObject.GetState(Convert.ToInt32(CountryDropDownList.SelectedItem.Value));
                StateDropDownList.DataSource = states;
                StateDropDownList.DataTextField = "Value";
                StateDropDownList.DataValueField = "Key";
                StateDropDownList.DataBind();
                StateDropDownList.Focus();
            }
            catch (Exception ex)
            {
                ExceptionUtility.ExceptionLog(ex);
                throw;
            }
        }
        protected void StateDropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                HRSCustomersBLL customerBLLObject = new HRSCustomersBLL();
                var cities = customerBLLObject.GetCity(Convert.ToInt32(StateDropDownList.SelectedItem.Value));
                CityDropDownList.DataSource = cities;
                CityDropDownList.DataTextField = "Value";
                CityDropDownList.DataValueField = "Key";
                CityDropDownList.DataBind();
                CityDropDownList.Focus();
            }
            catch (Exception ex)
            {
                ExceptionUtility.ExceptionLog(ex);
                throw;
            }
        }
    }
}