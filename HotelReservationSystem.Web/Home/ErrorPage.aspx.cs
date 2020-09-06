using System;

namespace HotelReservationSystem.Web.Home
{
    public partial class ErrorPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void HomePageButton_Click(object sender, EventArgs e)
        {
            try
            {
                Response.Redirect("Home.aspx");
            }
            catch (Exception ex)
            {
                Utility.ExceptionUtility.ExceptionLog(ex);
                throw;
            }
        }
    }
}