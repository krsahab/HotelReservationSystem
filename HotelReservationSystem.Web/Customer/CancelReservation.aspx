<%@ Page Title="" Language="C#" MasterPageFile="~/Customer/Customer.Master" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeBehind="CancelReservation.aspx.cs" Inherits="HotelReservationSystem.Web.Customer.CancelReservation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CustomerAsideLeft" runat="server">
    <nav class="navbar navbar-dark bg-dark">
        <ul class="navbar-nav">
            <li class="nav-item">
                <a class="nav-link" href="../Home/SearchHotel.aspx"><i class="fas fa-search"></i>&nbspSearch Hotel</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="ReserveHotel.aspx"><i class="fas fa-hotel"></i>&nbspReserve Hotel</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="EditReservation.aspx"><i class="fas fa-edit"></i>&nbspEdit Reservation</a>
            </li>
            <li class="nav-item">
                <a class="nav-link active" href="CancelReservation.aspx"><i class="far fa-times-circle"></i>&nbspCancel Reservation</a>
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
            <div class="card-header text-center" style="background-color: rgb(36, 131, 199)"><b>Cancel Reservation</b></div>
            <div class="card-body">
                <div class="form-group row">
                    <label class="control-label col-sm-5 text-lg-right" for="BookingIDDropDownList"><b>Booking ID:</b></label>
                    <div class="col-sm-3">
                        <asp:DropDownList CssClass="form-control" ID="BookingIDDropDownList" runat="server"></asp:DropDownList>
                    </div>
                    <div class="col-sm-2 text-center">
                        <asp:Button CssClass="btn btn-primary" ID="BookingIDButton" runat="server" Text="Search" OnClick="BookingIDButton_Click" />
                    </div>
                    <div class="col-sm-2">
                        <asp:RequiredFieldValidator ID="BooingIDRequiredFieldValidator" runat="server" ErrorMessage="Select an Item" ControlToValidate="BookingIDDropDownList" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div id="hidden" runat="server">
                    <div class="form-group row">
                        <label class="control-label col-sm-5 text-lg-right" for="HotelNameLabel"><b>Hotel Name:</b></label>
                        <asp:Label CssClass="col-sm-4" ID="HotelNameLabel" runat="server" Text="Label"></asp:Label>
                    </div>
                    <div class="form-group row">
                        <label class="control-label col-sm-5 text-lg-right" for="BookingDateLabel"><b>Booking Date:</b></label>
                        <asp:Label CssClass="col-sm-4" ID="BookingDateLabel" runat="server" Text="Label"></asp:Label>
                    </div>
                    <div class="form-group row">
                        <label class="control-label col-sm-5 text-lg-right" for="ArrivalDateLabel"><b>Arrival Date:</b></label>
                        <asp:Label CssClass="col-sm-4" ID="ArrivalDateLabel" runat="server" Text="Label"></asp:Label>
                    </div>
                    <div class="form-group row">
                        <label class="control-label col-sm-5 text-lg-right" for="DepartureDateLabel"><b>Departure Date:</b></label>
                        <asp:Label CssClass="col-sm-4" ID="DepartureDateLabel" runat="server" Text="Label"></asp:Label>
                    </div>
                    <div class="form-group row">
                        <label class="control-label col-sm-5 text-lg-right" for="NoOfAdultLabel"><b>Number of Adults:</b></label>
                        <asp:Label CssClass="col-sm-4" ID="NoOfAdultLabel" runat="server" Text="Label"></asp:Label>
                    </div>
                    <div class="form-group row">
                        <label class="control-label col-sm-5 text-lg-right" for="NoOfChildrenLabel"><b>Number of Children:</b></label>
                        <asp:Label CssClass="col-sm-4" ID="NoOfChildrenLabel" runat="server" Text="Label"></asp:Label>
                    </div>
                    <div class="form-group row">
                        <label class="control-label col-sm-5 text-lg-right" for="NoOfNightsLabel"><b>Number of Nights:</b></label>
                        <asp:Label CssClass="col-sm-4" ID="NoOfNightsLabel" runat="server" Text="Label"></asp:Label>
                    </div>
                    <div class="text-center">
                        <asp:Button CssClass="btn btn-danger" ID="CalcelButton" runat="server" Text="Cancel" OnClick="CalcelButton_Click" />
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
                        <asp:Label ID="ReseltLabel" runat="server" ForeColor="#009900"></asp:Label>
                    </div>
                    <div class="modal-footer" style="background-color: lightcyan;">
                        <asp:Button CssClass="btn btn-secondary" OnClick="CloseButton_Click" ID="CloseButton" runat="server" Text="Close" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="CustomerAsideRight" runat="server">
</asp:Content>
