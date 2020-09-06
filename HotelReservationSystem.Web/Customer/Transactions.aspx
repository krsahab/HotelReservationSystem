<%@ Page Title="" Language="C#" MasterPageFile="~/Customer/Customer.Master" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeBehind="Transactions.aspx.cs" Inherits="HotelReservationSystem.Web.Customer.Transactions" %>

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
                <a class="nav-link" href="CancelReservation.aspx"><i class="far fa-times-circle"></i>&nbspCancel Reservation</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="Payment.aspx"><i class="fas fa-shopping-cart"></i>&nbspPayment</a>
            </li>
            <li class="nav-item">
                <a class="nav-link active" href="Transactions.aspx"><i class="fas fa-history"></i>&nbspTransactions</a>
            </li>
        </ul>
    </nav>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="CustomerCenter" runat="server">
    <div class="container">
        <div class="card shadow p-4 mb-4" style="background-color: rgb(154, 232, 232)">
            <div class="card-header text-center" style="background-color: rgb(36, 131, 199)"><b>Transactions Details</b></div>
            <div class="card-body">
                <div class="form-group row">
                    <label for="BookingIDDropDownList" class="col-sm-5 control-label text-right"><b>Select Booking ID:</b></label>
                    <div class="col-sm-3">
                        <asp:DropDownList CssClass="form-control" ID="BookingIDDropDownList" runat="server" ValidationGroup="txn"></asp:DropDownList>
                    </div>
                    <div class="col-sm-2 text-center">
                        <asp:Button CssClass="btn-primary btn" ID="ViewButton" runat="server" Text="View" OnClick="ViewButton_Click" ValidationGroup="txn" />
                    </div>
                    <div class="col-sm-2">
                        <asp:RequiredFieldValidator ID="BookingIDRequiredFieldValidator" runat="server" ErrorMessage="Select An Item" ControlToValidate="BookingIDDropDownList" ForeColor="Red" ValidationGroup="txn"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div id="hidden2" runat="server" class="table-responsive">
                    <asp:GridView CssClass="table table-bordered table-hover" ID="TXNGridView" runat="server" HorizontalAlign="Center" BorderStyle="Solid" BorderColor="Black">
                    </asp:GridView>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="CustomerAsideRight" runat="server">
</asp:Content>
