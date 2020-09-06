<%@ Page Title="" Language="C#" MasterPageFile="~/Home/Home.Master" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="HotelReservationSystem.Web.Home.Home1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HomeMaster" runat="server">
    <nav class="navbar navbar-dark navbar-expand-lg sticky-top" style="margin-bottom: 10px; background-color: darkcyan">
        <a class="navbar-brand" href="Home.aspx"><i class="fas fa-home"></i>&nbspHome</a>
        <a class="navbar-brand" href="../Admin/AddHotel.aspx"><i class="fas fa-user-tie"></i>&nbspAdmin</a>
        <a class="navbar-brand flex-grow-1" href="../Home/Login.aspx"><i class="fas fa-users"></i>&nbspUser</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse justify-content-end" id="collapsibleNavbar">
            <ul class="navbar-nav">
                <li class="nav-item active"><a class="nav-link" href="SearchHotel.aspx"><i class="fas fa-search"></i>&nbspSearch Hotel</a></li>
                <li class="nav-item active"><a class="nav-link" href="#" data-toggle="modal" data-target="#AboutUs"><i class="fas fa-info-circle"></i>&nbspAbout Us</a></li>
                <li class="nav-item active"><a class="nav-link" href="#" data-toggle="modal" data-target="#Contact"><i class="fas fa-address-book"></i>&nbspContact Us</a></li>
            </ul>
        </div>
    </nav>
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-2">
            </div>
            <div class="col-lg-8">
                <div class="container">
                    <div class="card shadow p-4 mb-4" style="background-color: aquamarine">
                        <div class="card-body text-center">
                            <h2><b>Welcome</b></h2>
                            <h4>Hotel Reservation System</h4>
                            <div class="row">
                                <div class="col">
                                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#Login">Login</button>
                                </div>
                                <div class="col">
                                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#Register">Register</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="container">
                    <div class="modal fade" id="Login">
                        <div class="modal-dialog modal-dialog-centered">
                            <div class="modal-content">
                                <div class="modal-header" style="background-color: rgb(62, 153, 176)">
                                    <h4 class="modal-title" style="text-align: center;"><b>Login</b></h4>
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                </div>
                                <div class="modal-body" style="background-color: lightcyan;">
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text bg-info"><i class="fa-user fas"></i></span>
                                        </div>
                                        <asp:TextBox CssClass="form-control" ID="UserIDTextbox" placeholder="Enter User ID" runat="server" MaxLength="5"></asp:TextBox>
                                    </div>
                                    <asp:RequiredFieldValidator ID="UserIDRequiredFieldValidator" runat="server" ErrorMessage="Enter UserID" ControlToValidate="UserIDTextbox" ForeColor="Red" ValidationGroup="Login"></asp:RequiredFieldValidator>
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text bg-info"><i class="fa-passport fas"></i></span>
                                        </div>
                                        <asp:TextBox CssClass="form-control" ID="LoginPasswordTextbox" placeholder="Enter Password" runat="server" TextMode="Password" MaxLength="25"></asp:TextBox>
                                    </div>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter Password" ControlToValidate="LoginPasswordTextbox" ForeColor="Red" ValidationGroup="Login"></asp:RequiredFieldValidator>
                                </div>
                                <div class="modal-footer justify-content-center" style="background-color: lightcyan;">
                                    <asp:Button CssClass="btn-success btn" ID="LoginButton" runat="server" Text="Login" OnClick="LoginButton_Click" ValidationGroup="Login" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="container">
                    <div class="modal fade" id="Register">
                        <div class="modal-dialog modal-dialog-centered modal-lg">
                            <div class="modal-content">
                                <div class="modal-header" style="background-color: rgb(62, 153, 176)">
                                    <h4 class="modal-title"><b>Register</b></h4>
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                </div>
                                <div class="modal-body" style="background-color: lightcyan;">
                                    <div class="form-group row">
                                        <label class="control-label col-sm-5 text-lg-right" for="CustomerNameTextbox"><b>Name:</b></label>
                                        <div class="col-sm-4">
                                            <asp:TextBox CssClass="form-control" placeholder="Ener Your Name" ID="CustomerNameTextbox" runat="server"></asp:TextBox>
                                        </div>
                                        <div class="col-sm-3">
                                            <asp:RegularExpressionValidator ID="NameRegexValidator" runat="server" ErrorMessage="Enter Valid Name" ControlToValidate="CustomerNameTextbox" ForeColor="Red" ValidationExpression="[a-z A-Z\s]+"></asp:RegularExpressionValidator>
                                            <asp:RequiredFieldValidator ID="NameRequiredFieldValidator" runat="server" ErrorMessage="Enter Your Name" ControlToValidate="CustomerNameTextbox" ForeColor="Red"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="control-label col-sm-5 text-lg-right" for="PasswordTextBox"><b>Password:</b></label>
                                        <div class="col-sm-4">
                                            <asp:TextBox CssClass="form-control" placeholder="Enter Password" ID="PasswordTextBox" type="password" runat="server" ToolTip="Password must contain at least one special character, one letter, one number and 8 to 25 character long" MaxLength="25"></asp:TextBox>
                                        </div>
                                        <div class="col-sm-3">
                                            <asp:RegularExpressionValidator ID="PasswordRegexValidator" runat="server" ErrorMessage="Follow Password Policy" ControlToValidate="PasswordTextBox" ForeColor="Red" ValidationExpression="(?=.*[A-Za-z])(?=.*\d)(?=.*[\W_])[A-Za-z\d\W_]{8,25}"></asp:RegularExpressionValidator>
                                            <asp:RequiredFieldValidator ID="PasswordRequiredFieldValidator" runat="server" ErrorMessage="Enter Password" ControlToValidate="PasswordTextBox" ForeColor="Red"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                    <div class="form-group row ">
                                        <label class="control-label col-sm-5 text-lg-right" for="ConfirmPassword"><b>Confirm Password:</b></label>
                                        <div class="col-sm-4">
                                            <asp:TextBox CssClass="form-control" placeholder="Confirm Password" type="passowrd" ID="ConfirmPassword" runat="server" TextMode="Password" MaxLength="25"></asp:TextBox>
                                        </div>
                                        <div class="col-sm-3">
                                            <asp:CompareValidator ID="ConfirmPasswordCompareValidator" runat="server" ErrorMessage="Password Mismatch" ControlToCompare="PasswordTextBox" ControlToValidate="ConfirmPassword" ForeColor="Red"></asp:CompareValidator>
                                            <asp:RequiredFieldValidator ID="ConfirmPasswordRequiredFieldValidator" runat="server" ErrorMessage="Enter Password" ControlToValidate="PasswordTextBox" ForeColor="Red"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                    <div class="form-group row ">
                                        <label class="control-label col-sm-5 text-lg-right" for="DateOfBirthTextbox"><b>Date Of Birth:</b></label>
                                        <div class="col-sm-4">
                                            <asp:TextBox CssClass="form-control" placeholder="mm/dd/yyyy" ID="DateOfBirthTextbox" runat="server" TextMode="Date" MaxLength="10"></asp:TextBox>
                                        </div>
                                        <div class="col-sm-3">
                                            <asp:RequiredFieldValidator ID="DOBRequiredFieldValidator" runat="server" ErrorMessage="Enter Date Of Birth" ControlToValidate="DateOfBirthTextbox" ForeColor="Red"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                    <div class="form-group row ">
                                        <label class="control-label col-sm-5 text-lg-right" for="ContactNumberTextBox"><b>Contact Number:</b></label>
                                        <div class="col-sm-4">
                                            <asp:TextBox CssClass="form-control" ID="ContactNumberTextBox" runat="server" TextMode="Phone" MaxLength="13">+91</asp:TextBox>
                                        </div>
                                        <div class="col-sm-3">
                                            <asp:RequiredFieldValidator ID="ContactRequiredFieldValidator" runat="server" ErrorMessage="Enter Contact No" ControlToValidate="ContactNumberTextBox" ForeColor="Red"></asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="ContactNumberRegularExpressionValidator" runat="server" ErrorMessage="Enter Valid Contact" ControlToValidate="ContactNumberTextBox" ForeColor="Red" ValidationExpression="^(\+[9]{1}[1]{1})[789]{1}[0-9]{9}$"></asp:RegularExpressionValidator>
                                        </div>
                                    </div>
                                    <div class="form-group row ">
                                        <label class="control-label col-sm-5 text-lg-right" for="EmailAddressTextBox"><b>Email Address:</b></label>
                                        <div class="col-sm-4">
                                            <asp:TextBox CssClass="form-control" placeholder="someone@example.com" ID="EmailAddressTextBox" runat="server" TextMode="Email"></asp:TextBox>
                                        </div>
                                        <div class="col-sm-3">
                                            <asp:RequiredFieldValidator ID="EmailRequiredFieldValidator" runat="server" ErrorMessage="Enter Email" ControlToValidate="EmailAddressTextBox" ForeColor="Red"></asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="EmailRegularExpressionValidator" runat="server" ErrorMessage="Enter Valid Email" ControlToValidate="EmailAddressTextBox" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="control-label col-sm-5 text-lg-right" for="CountryDropDownList"><b>Country:</b></label>
                                        <div class="col-sm-4">
                                            <asp:DropDownList CssClass="form-control" ID="CountryDropDownList" runat="server" OnSelectedIndexChanged="CountryDropDownList_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>
                                        </div>
                                        <div class="col-sm-3">
                                            <asp:RequiredFieldValidator ID="CountryRequiredFieldValidator" runat="server" ErrorMessage="Select Country" ControlToValidate="CountryDropDownList" ForeColor="Red"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="control-label col-sm-5 text-lg-right" for="StateDropDownList"><b>State:</b></label>
                                        <div class="col-sm-4">
                                            <asp:DropDownList CssClass="form-control" ID="StateDropDownList" runat="server" OnSelectedIndexChanged="StateDropDownList_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>
                                        </div>
                                        <div class="col-sm-3">
                                            <asp:RequiredFieldValidator ID="StateRequiredFieldValidator" runat="server" ErrorMessage="Select State" ControlToValidate="StateDropDownList" ForeColor="Red"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="control-label col-sm-5 text-lg-right" for="CityDropDownList"><b>City:</b></label>
                                        <div class="col-sm-4">
                                            <asp:DropDownList CssClass="form-control" ID="CityDropDownList" runat="server"></asp:DropDownList>
                                        </div>
                                        <div class="col-sm-3">
                                            <asp:RequiredFieldValidator ID="CityRequiredFieldValidator" runat="server" ErrorMessage="Select City" ControlToValidate="CityDropDownList" ForeColor="Red"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="control-label col-sm-5 text-lg-right" for="PinCodeDropDownList"><b>Pin Code:</b></label>
                                        <div class="col-sm-4">
                                            <asp:TextBox CssClass="form-control" placeholder="Enter PIN Code" ID="PinCodeTextBox" runat="server" MaxLength="6"></asp:TextBox>
                                        </div>
                                        <div class="col-sm-3">
                                            <asp:RequiredFieldValidator ID="PinCodeRequiredFieldValidator" runat="server" ErrorMessage="Enter Pin Code" ControlToValidate="PinCodeTextBox" ForeColor="Red"></asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="PinCodeRegexValidator" runat="server" ErrorMessage="Enter Pin Code" ControlToValidate="PinCodeTextBox" ForeColor="Red" ValidationExpression="\d{6}"></asp:RegularExpressionValidator>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer justify-content-center" style="background-color: lightcyan;">
                                    <asp:Button CssClass="btn btn-success" ID="SubmitButton" runat="server" Text="Submit" OnClick="SubmitButton_Click" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="container">
                    <div class="modal fade" id="Result">
                        <div class="modal-dialog modal-sm">
                            <div class="modal-content">
                                <div class="modal-header bg-info">
                                    <h4 class="modal-title" style="text-align: center;">Message</h4>
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                </div>
                                <div class="modal-body" style="background-color: lightcyan;">
                                    <asp:Label ID="ErrorMessageLabel" runat="server"></asp:Label>
                                </div>
                                <div class="modal-footer" style="background-color: lightcyan;">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-2">
            </div>
        </div>
    </div>
</asp:Content>
