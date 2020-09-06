using HotelReservationSystem.BusinessLogic;
using System;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HotelReservationSystem.Web.Home
{
    public partial class SearchHotel : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["userId"] == null)
                {
                    hidden.Visible = false;
                }
                if (!IsPostBack)
                {
                    HRSCustomersBLL customerBLLObject = new HRSCustomersBLL();
                    var countries = customerBLLObject.GetCountry();
                    CountryDropDownList.DataSource = countries;
                    CountryDropDownList.DataTextField = "Value";
                    CountryDropDownList.DataValueField = "Key";
                    CountryDropDownList.DataBind();
                }
                CheckInTextBox.Attributes["min"] = DateTime.Now.ToString("yyyy-MM-dd");
                CheckOutTextBox.Attributes["min"] = DateTime.Now.ToString("yyyy-MM-dd");
                HiddenLabel.Visible = false;
                HiddenTable.Visible = false;
            }
            catch (Exception ex)
            {
                Utility.ExceptionUtility.ExceptionLog(ex);
                throw;
            }
        }

        protected void SearchHotelButton_Click(object sender, EventArgs e)
        {
            try
            {
                int roomNo = int.Parse(NoOfRooms.Text);
                HRSHotelsBLL hotelBLLObject = new HRSHotelsBLL();
                HRSBookingsBLL bookingBLLObject = new HRSBookingsBLL();
                string roomType = RoomTypeDropDownList.SelectedItem.Text;
                var hotels = hotelBLLObject.SearchHotels(roomNo, CityDropDownList.SelectedItem.Text, roomType);
                foreach (var hotel in hotels)
                {
                    var bookingRD = bookingBLLObject.GetBookingsByHotelID(hotel.HotelID);
                    foreach (var booking in bookingRD)
                    {
                        DateTime queryArrivalDate = DateTime.Parse(CheckInTextBox.Text);
                        DateTime queryDepartureDate = DateTime.Parse(CheckOutTextBox.Text);
                        if (booking.ArrivalDate <= queryDepartureDate && queryArrivalDate <= booking.DepartureDate)
                        {
                            if (booking.RoomType == Utility.HRSConstants.AC)
                                hotel.NoOfACRooms -= booking.TotalRooms;
                            else
                                hotel.NoOfNACRooms -= booking.TotalRooms;
                        }
                    }
                    if (roomType == Utility.HRSConstants.AC)
                    {
                        if (hotel.NoOfACRooms < roomNo)
                            hotels.Remove(hotel);
                    }
                    else
                    {
                        if (hotel.NoOfNACRooms < roomNo)
                            hotels.Remove(hotel);
                    }
                }
                if (hotels.Count >= 1)
                {
                    SearchHotelResult.DataSource = hotels;
                    SearchHotelResult.DataBind();
                    HiddenTable.Visible = true;
                    HiddenLabel.Visible = false;
                }
                else
                {
                    ErrorLabel.Text = "Search Found No Relevant Results";
                    HiddenTable.Visible = false;
                    HiddenLabel.Visible = true;
                }
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

        protected void CountryDropDownList_SelectedIndexChanged(object sender, System.EventArgs e)
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
                Utility.ExceptionUtility.ExceptionLog(ex);
                throw;
            }
        }

        protected void StateDropDownList_SelectedIndexChanged(object sender, System.EventArgs e)
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
                Utility.ExceptionUtility.ExceptionLog(ex);
                throw;
            }
        }

        protected void SearchHotelResult_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                if (e.CommandName == "SelectHotel")
                {
                    int index = Convert.ToInt32(e.CommandArgument.ToString());
                    string hotelID = SearchHotelResult.Rows[index].Cells[1].Text;
                    Response.Redirect("../Customer/ReserveHotel.aspx?field=" + hotelID);
                }
            }
            catch (Exception ex)
            {
                Utility.ExceptionUtility.ExceptionLog(ex);
                throw;
            }
        }

        protected void LogoutButton_Click(object sender, EventArgs e)
        {
            try
            {
                FormsAuthentication.SignOut();
                Session.Clear();
                Response.Redirect("Home.aspx");
            }
            catch (Exception ex)
            {
                Utility.ExceptionUtility.ExceptionLog(ex);
                throw;
            }
        }

        protected void HomeLinkButton_Click(object sender, EventArgs e)
        {
            try
            {
                if (Session["userId"] != null)
                {
                    Response.Redirect("SearchHotel.aspx");
                }
                else
                {
                    Response.Redirect("Home.aspx");
                }
            }
            catch (Exception ex)
            {
                Utility.ExceptionUtility.ExceptionLog(ex);
                throw;
            }
        }
    }
}