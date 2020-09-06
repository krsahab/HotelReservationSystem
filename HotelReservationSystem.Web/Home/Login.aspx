<%@ Page Title="" Language="C#" MasterPageFile="~/Home/Home.Master" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="HotelReservationSystem.Web.Home.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HomeMaster" runat="server">
    <nav class="navbar navbar-dark navbar-expand-lg sticky-top" style="margin-bottom: 10px; background-color: darkcyan">
        <a class="navbar-brand flex-grow-1" href="Home.aspx"><i class="fas fa-home"></i>&nbspHome</a>
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
                <%--<nav class="navbar navbar-dark bg-dark">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link active" href="AuthenticateUser.aspx">Login</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="Register.aspx">Register</a>
                        </li>
                    </ul>
                </nav>--%>
            </div>
            <div class="col-lg-8">
                <div class="container">
                    <div class="card shadow p-4 mb-4" style="background-color: rgb(96, 195, 195)">
                        <div class="card-body text-center">
                            <div class="form-group row">
                                <label for="UserIDTextbox" class="col-sm-4 col-form-label"><b>User ID:</b></label>
                                <div class="col-sm-5">
                                    <asp:TextBox CssClass="form-control" ID="UserIDTextbox" placeholder="Enter User ID" runat="server" MaxLength="5"></asp:TextBox>
                                </div>
                                <div class="col-sm-3">
                                    <asp:RequiredFieldValidator ID="UserIDRequiredFieldValidator" runat="server" ErrorMessage="Enter UserID" ControlToValidate="UserIDTextbox" ForeColor="Red" ValidationGroup="Login"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="PasswordTextbox" class="col-sm-4 col-form-label"><b>Password:</b></label>
                                <div class="col-sm-5">
                                    <asp:TextBox CssClass="form-control" type="password" ID="PasswordTextbox" placeholder="Enter Password" runat="server" MaxLength="25"></asp:TextBox>
                                </div>
                                <div class="col-sm-3">
                                    <asp:RequiredFieldValidator ID="PasswordRequiredFieldValidator" runat="server" ErrorMessage="Enter Password" ControlToValidate="PasswordTextbox" ForeColor="Red" ValidationGroup="Login"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="text-center">
                                <asp:Button CssClass="btn-success btn" ID="LoginButton" runat="server" Text="Login" OnClick="LoginButton_Click" ValidationGroup="Login" />
                                <asp:Button CssClass="btn-success btn" ID="RegisterButton" runat="server" Text="Register" OnClick="RegisterButton_Click" />
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
