using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace HotelReservationSystem.Web.Customer
{
    public partial class Customer : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                UserLabel.Text = Session["userId"].ToString();
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
                Response.Redirect("..\\Home\\Home.aspx");
            }
            catch (Exception ex)
            {
                Utility.ExceptionUtility.ExceptionLog(ex);
                throw;
            }
        }
    }
}