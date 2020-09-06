using HotelReservationSystem.BOM;
using HotelReservationSystem.BusinessLogic;
using System;
using System.Web.Security;
using System.Web.UI;

namespace HotelReservationSystem.Web.Home
{
    public partial class Home1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                DateOfBirthTextbox.Attributes["max"] = DateTime.Now.ToString("yyyy-MM-dd");
                if (Session["userId"] != null)
                {
                    if (Session["userId"].ToString().EndsWith(Utility.HRSConstants.ADMINENDSTRING))
                    {
                        Response.Redirect("../Admin/AddHotel.aspx");
                    }
                    else
                        Response.Redirect("SearchHotel.aspx");
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
                else
                {
                    PasswordTextBox.Attributes.Add("value", PasswordTextBox.Text);
                    ConfirmPassword.Attributes.Add("value", ConfirmPassword.Text);
                }
            }
            catch (Exception ex)
            {
                Utility.ExceptionUtility.ExceptionLog(ex);
                throw;
            }
        }

        protected void SubmitButton_Click(object sender, EventArgs e)
        {
            try
            {
                HRSCustomersBLL customerBLLObject = new HRSCustomersBLL();
                Customers customers = new Customers();
                customers.CustomerName = CustomerNameTextbox.Text;
                customers.AccountPassword = PasswordTextBox.Text;
                customers.DateOfBirth = DateTime.Parse(DateOfBirthTextbox.Text);
                customers.ContactNumber = ContactNumberTextBox.Text;
                customers.EmailAddress = EmailAddressTextBox.Text;
                customers.CustomerCountry = CountryDropDownList.SelectedItem.Text;
                customers.CustomerState = StateDropDownList.SelectedItem.Text;
                customers.CustomerCity = CityDropDownList.SelectedItem.Text;
                customers.CustomerPinCode = PinCodeTextBox.Text;
                DateTime zeroTime = new DateTime(1, 1, 1);
                TimeSpan span = DateTime.Now - DateTime.Parse(DateOfBirthTextbox.Text);
                customers.Age = (zeroTime + span).Year - 1;
                if (customers.Age > 50)
                    customers.CustomerType = Utility.HRSConstants.SENIORCITIZEN;
                else
                    customers.CustomerType = Utility.HRSConstants.NORMALCITIZEN;
                var customer = customerBLLObject.GetCustomerDetailsByContactAndEmail(customers.ContactNumber, customers.EmailAddress);
                if (!string.IsNullOrEmpty(customer))
                    ErrorMessageLabel.Text = "User with same Contact or Email already exists";
                else
                {
                    string customerID = customerBLLObject.InsertCustomerDetails(customers);
                    if (!string.IsNullOrEmpty(customerID))
                        ErrorMessageLabel.Text = "Registration Successful. \n Your UserID is: " + customerID;
                    else
                        ErrorMessageLabel.Text = "Registration failed";
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

        protected void LoginButton_Click(object sender, EventArgs e)
        {
            try
            {
                HRSCustomersBLL CustomerBLLObject = new HRSCustomersBLL();
                string userId = UserIDTextbox.Text;
                string password = LoginPasswordTextbox.Text;
                bool isAuthenticated = CustomerBLLObject.VerifyUser(userId, password);
                if (isAuthenticated)
                {
                    FormsAuthentication.RedirectFromLoginPage(UserIDTextbox.Text, true);
                    Session["userId"] = userId;
                    Response.Redirect("SearchHotel.aspx");
                }
                else
                {
                    ErrorMessageLabel.Text = "Invalid Username or Password";
                    System.Text.StringBuilder sb = new System.Text.StringBuilder();
                    sb.Append(@"<script type='text/javascript'>");
                    sb.Append("$(function () {");
                    sb.Append(" $('#Result').modal('show');});");
                    sb.Append("</script>");
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "ModelScript", sb.ToString(), false);
                }
            }
            catch (Exception ex)
            {
                Utility.ExceptionUtility.ExceptionLog(ex);
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

                System.Text.StringBuilder sb = new System.Text.StringBuilder();
                sb.Append(@"<script type='text/javascript'>");
                sb.Append("$(function () {");
                sb.Append(" $('#Register').modal('show');});");
                sb.Append("</script>");
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "ModelScript", sb.ToString(), false);
                StateDropDownList.Focus();
            }
            catch (Exception ex)
            {
                Utility.ExceptionUtility.ExceptionLog(ex);
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

                System.Text.StringBuilder sb = new System.Text.StringBuilder();
                sb.Append(@"<script type='text/javascript'>");
                sb.Append("$(function () {");
                sb.Append(" $('#Register').modal('show');});");
                sb.Append("</script>");
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "ModelScript", sb.ToString(), false);
                CityDropDownList.Focus();
            }
            catch (Exception ex)
            {
                Utility.ExceptionUtility.ExceptionLog(ex);
                throw;
            }
        }
    }
}