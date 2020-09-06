﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Customer/Customer.Master" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeBehind="ReserveHotel.aspx.cs" Inherits="HotelReservationSystem.Web.Customer.ReserveHotel" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CustomerAsideLeft" runat="server">
    <nav class="navbar navbar-dark bg-dark">
        <ul class="navbar-nav">
            <li class="nav-item">
                <a class="nav-link" href="../Home/SearchHotel.aspx"><i class="fas fa-search"></i>&nbspSearch Hotel</a>
            </li>
            <li class="nav-item">
                <a class="nav-link active" href="ReserveHotel.aspx"><i class="fas fa-hotel"></i>&nbspReserve Hotel</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="EditReservation.aspx"><i class="fas fa-edit"></i>&nbspEdit Reservation</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="CancelReservation.aspx"><i class="far fa-times-circle"></i>&nbspCancel Reservation</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="Payment.aspx"><i class="fas fa-shopping-cart"></i>&nbspPayment</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="Transactions.aspx"><i class="fas fa-history"></i>&nbspTransactions</a>
            </li>
        </ul>
    </nav>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="CustomerCenter" runat="server">
    <div class="container">
        <div class="card shadow p-4 mb-4" style="background-color: rgb(154, 232, 232)">
            <div class="card-header text-center" style="background-color: rgb(36, 131, 199)"><b>Enter Booking Details</b></div>
            <div class="card-body">
                <div class="form-group row">
                    <label class="control-label col-sm-5 text-lg-right" for="HotelIDDropDownList"><b>Hotel Name:</b></label>
                    <div class="col-sm-4">
                        <asp:DropDownList CssClass="form-control" ID="HotelIDDropDownList" runat="server" AutoPostBack="True"></asp:DropDownList>
                    </div>
                    <div class="col-sm-3">
                        <asp:RequiredFieldValidator ID="HotelNameRequiredFieldValidator" runat="server" ErrorMessage="Select Hotel" ControlToValidate="HotelIDDropDownList" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="form-group row">
                    <label class="control-label col-sm-5 text-lg-right" for="BookingDateTextbox"><b>Booking Date:</b></label>
                    <div class="col-sm-4">
                        <asp:TextBox CssClass="form-control" placeholder="mm/dd/yyyy" ID="BookingDateTextbox" runat="server" Enabled="False"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group row">
                    <label class="control-label col-sm-5 text-lg-right" for="ArrivalDateTextBox"><b>Arrival Date:</b></label>
                    <div class="col-sm-4">
                        <asp:TextBox CssClass="form-control" placeholder="mm/dd/yyyy" ID="ArrivalDateTextBox" runat="server" TextMode="Date" AutoPostBack="True" OnTextChanged="Page_Load" MaxLength="10"></asp:TextBox>
                    </div>
                    <div class="col-sm-3">
                        <asp:RequiredFieldValidator ID="ArrivalDateRequiredFieldValidator" runat="server" ErrorMessage="Select Arrival Date" ControlToValidate="ArrivalDateTextBox" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="form-group row">
                    <label class="control-label col-sm-5 text-lg-right" for="DepartureDateTextbox"><b>Departure Date:</b></label>
                    <div class="col-sm-4">
                        <asp:TextBox CssClass="form-control" placeholder="mm/dd/yyyy" ID="DepartureDateTextbox" runat="server" TextMode="Date" AutoPostBack="True" OnTextChanged="Page_Load" MaxLength="10"></asp:TextBox>
                    </div>
                    <div class="col-sm-3">
                        <asp:RequiredFieldValidator ID="DepartureDateRequiredFieldValidator" runat="server" ErrorMessage="Select Departure Date" ControlToValidate="DepartureDateTextbox" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="DepartureDateCompareValidator" runat="server" ErrorMessage="Invalid Input" ControlToCompare="ArrivalDateTextBox" ControlToValidate="DepartureDateTextbox" ForeColor="Red" Operator="GreaterThan"></asp:CompareValidator>
                    </div>
                </div>
                <div class="form-group row">
                    <label class="control-label col-sm-5 text-lg-right" for="NoOfAdultTextBox"><b>Number of Adults:</b></label>
                    <div class="col-sm-4">
                        <asp:TextBox CssClass="form-control" placeholder="Enter No. of Adults" ID="NoOfAdultTextBox" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-sm-3">
                        <asp:RequiredFieldValidator ID="NoAdultsRequiredFieldValidator" runat="server" ErrorMessage="Enter No" ControlToValidate="NoOfAdultTextBox" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="NoOfAdultsRegexValidator" runat="server" ErrorMessage="Enter Valid No" ControlToValidate="NoOfAdultTextBox" ForeColor="Red" ValidationExpression="\d{0,3}"></asp:RegularExpressionValidator>
                    </div>
                </div>
                <div class="form-group row">
                    <label class="control-label col-sm-5 text-lg-right" for="NoOfChildrenTextBox"><b>Number of Children:</b></label>
                    <div class="col-sm-4">
                        <asp:TextBox CssClass="form-control" placeholder="Enter No. Children" ID="NoOfChildrenTextBox" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-sm-3">
                        <asp:RequiredFieldValidator ID="NoChildrenRequiredFieldValidator" runat="server" ErrorMessage="Enter No" ControlToValidate="NoOfChildrenTextBox" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="NoOfChildRegexValidator" runat="server" ErrorMessage="Enter Valid No" ControlToValidate="NoOfChildrenTextBox" ForeColor="Red" ValidationExpression="\d{0,3}"></asp:RegularExpressionValidator>
                    </div>
                </div>
                <div class="form-group row">
                    <label class="control-label col-sm-5 text-lg-right" for="NoOfNightsTextBox"><b>Number of Nights:</b></label>
                    <div class="col-sm-4">
                        <asp:TextBox CssClass="form-control" placeholder="Enter No. Of Nights" ID="NoOfNightsTextBox" runat="server" Enabled="False"></asp:TextBox>
                    </div>
                    <div class="col-sm-3">
                        <asp:RequiredFieldValidator ID="NoNightsRequiredFieldValidator" runat="server" ErrorMessage="Enter No" ControlToValidate="NoOfNightsTextBox" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="NoOfNightsRegexValidator" runat="server" ErrorMessage="Enter Valid No" ControlToValidate="NoOfNightsTextBox" ForeColor="Red" ValidationExpression="\d{0,3}"></asp:RegularExpressionValidator>
                    </div>
                </div>
                <div class="form-group row">
                    <label class="control-label col-sm-5 text-lg-right" for="TotalRoomTextBox"><b>Total Rooms:</b></label>
                    <div class="col-sm-4">
                        <asp:TextBox CssClass="form-control" placeholder="Enter Total Rooms" ID="TotalRoomTextBox" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-sm-3">
                        <asp:RequiredFieldValidator ID="TotalRoomsRequiredFieldValidator" runat="server" ErrorMessage="Enter No" ControlToValidate="TotalRoomTextBox" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="TotalRoomsRegexValidator" runat="server" ErrorMessage="Enter Valid No" ControlToValidate="TotalRoomTextBox" ForeColor="Red" ValidationExpression="\d{0,3}"></asp:RegularExpressionValidator>
                    </div>
                </div>
                <div class="form-group row">
                    <label class="control-label col-sm-5 text-lg-right" for="RoomTypeDropDownList"><b>Room Type:</b></label>
                    <div class="col-sm-4">
                        <asp:DropDownList CssClass="form-control" ID="RoomTypeDropDownList" runat="server">
                            <asp:ListItem>AC</asp:ListItem>
                            <asp:ListItem>Non AC</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="col-sm-3">
                        <asp:RequiredFieldValidator ID="RoomTypeRequiredFieldValidator" runat="server" ErrorMessage="Select an Item" ControlToValidate="RoomTypeDropDownList" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="text-center">
                    <asp:Button CssClass="btn btn-success" ID="BookNowButton" runat="server" Text="Book Now" OnClick="BookNowButton_Click"/>
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
                        <asp:Label ID="ReseltLabel" runat="server" Text="Label" ForeColor="#339933"></asp:Label>
                    </div>
                    <div id="PaymentButton" visible="false" runat="server" class="modal-footer justify-content-center" style="background-color: lightcyan;">
                        <asp:Button CssClass="btn-primary btn" ID="ProceedToPaymentButton" runat="server" OnClick="ProceedToPaymentButton_Click" Text="Proceed To Payment" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="CustomerAsideRight" runat="server">
</asp:Content>
