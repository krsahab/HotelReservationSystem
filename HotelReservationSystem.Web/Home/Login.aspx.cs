using HotelReservationSystem.BusinessLogic;
using System;
using System.Web.Security;
using System.Web.UI;

namespace HotelReservationSystem.Web.Home
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString.Count >= 1)
            {
                if (Request.QueryString["ReturnUrl"].ToString().Contains(Utility.HRSConstants.ADMIN))
                {
                    RegisterButton.Visible = false;
                }
            }
        }

        protected void LoginButton_Click(object sender, EventArgs e)
        {
            try
            {
                HRSCustomersBLL customerBLLObject = new HRSCustomersBLL();
                string userId = UserIDTextbox.Text;
                string password = PasswordTextbox.Text;
                bool isAuthenticated = customerBLLObject.VerifyUser(userId, password);
                if (isAuthenticated)
                {
                    if (Request.QueryString.Count >= 1)
                    {
                        if (Request.QueryString["ReturnUrl"].ToString().Contains(Utility.HRSConstants.ADMIN))
                        {
                            if (userId.EndsWith(Utility.HRSConstants.ADMINENDSTRING))
                            {
                                FormsAuthentication.RedirectFromLoginPage(UserIDTextbox.Text, true);
                                Session["userId"] = userId;
                            }
                            else
                            {
                                System.Text.StringBuilder sb = new System.Text.StringBuilder();
                                sb.Append(@"<script type='text/javascript'>");
                                sb.Append("$(function () {");
                                sb.Append(" $('#Result').modal('show');});");
                                sb.Append("</script>");
                                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "ModelScript", sb.ToString(), false);
                                ErrorMessageLabel.Text = "Unathourised User";
                            }
                        }
                        else
                        {
                            FormsAuthentication.RedirectFromLoginPage(UserIDTextbox.Text, true);
                            Session["userId"] = userId;
                        }
                    }
                    else
                    {
                        FormsAuthentication.RedirectFromLoginPage(UserIDTextbox.Text, true);
                        Session["userId"] = userId;
                    }
                }
                else
                {
                    System.Text.StringBuilder sb = new System.Text.StringBuilder();
                    sb.Append(@"<script type='text/javascript'>");
                    sb.Append("$(function () {");
                    sb.Append(" $('#Result').modal('show');});");
                    sb.Append("</script>");
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "ModelScript", sb.ToString(), false);
                    ErrorMessageLabel.Text = "Invalid UserID or Password";
                }
            }
            catch (Exception ex)
            {
                Utility.ExceptionUtility.ExceptionLog(ex);
                throw;
            }
        }

        protected void RegisterButton_Click(object sender, EventArgs e)
        {
            try
            {
                Response.Redirect("Register.aspx");
            }
            catch (Exception ex)
            {
                Utility.ExceptionUtility.ExceptionLog(ex);
                throw;
            }
        }
    }
}