using HotelReservationSystem.BOM;
using HotelReservationSystem.BusinessLogic;
using System;
using System.Web.UI;

namespace HotelReservationSystem.Web.Home
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
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
                DateOfBirthTextbox.Attributes["max"] = DateTime.Now.ToString("yyyy-MM-dd");
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
                Customers customer = new Customers();
                customer.CustomerName = CustomerNameTextbox.Text;
                customer.AccountPassword = PasswordTextBox.Text;
                customer.DateOfBirth = DateTime.Parse(DateOfBirthTextbox.Text);
                customer.ContactNumber = ContactNumberTextBox.Text;
                customer.EmailAddress = EmailAddressTextBox.Text;
                customer.CustomerCountry = CountryDropDownList.SelectedItem.Text;
                customer.CustomerState = StateDropDownList.SelectedItem.Text;
                customer.CustomerCity = CityDropDownList.SelectedItem.Text;
                customer.CustomerPinCode = PinCodeTextBox.Text;
                DateTime zeroTime = new DateTime(1, 1, 1);
                TimeSpan span = DateTime.Now - DateTime.Parse(DateOfBirthTextbox.Text);
                customer.Age = (zeroTime + span).Year - 1;
                if (customer.Age > 50)
                {
                    customer.CustomerType = Utility.HRSConstants.SENIORCITIZEN;
                }
                else
                {
                    customer.CustomerType = Utility.HRSConstants.NORMALCITIZEN;
                }
                var existingCustomer = customerBLLObject.GetCustomerDetailsByContactAndEmail(customer.ContactNumber, customer.EmailAddress);
                {
                    if (!string.IsNullOrEmpty(existingCustomer))
                        ErrorMessageLabel.Text = "User with same Contact or Email already exists";
                    else
                    {
                        string customerID = customerBLLObject.InsertCustomerDetails(customer);
                        if (!string.IsNullOrEmpty(customerID))
                            ErrorMessageLabel.Text = "Registration Successful. \n Your UserID is: " + customerID;
                        else
                        {
                            ErrorMessageLabel.Text = "Registration failed";
                        }
                    }
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
            }
            catch (Exception ex)
            {
                Utility.ExceptionUtility.ExceptionLog(ex);
                throw;
            }
        }
    }
}