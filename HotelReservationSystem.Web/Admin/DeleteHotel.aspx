<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeBehind="DeleteHotel.aspx.cs" Inherits="HotelReservationSystem.Web.Admin.DeleteHotel" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="AdminAsideLeft" runat="server">
    <nav class="navbar navbar-dark bg-dark">
        <ul class="navbar-nav">
            <li class="nav-item">
                <a class="nav-link" href="AddHotel.aspx"><i class="fas fa-hotel"></i>&nbspAdd Hotel</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="EditHotel.aspx"><i class="fas fa-edit"></i>&nbspEdit Hotel</a>
            </li>
            <li class="nav-item">
                <a class="nav-link active" href="DeleteHotel.aspx"><i class="fas fa-trash-alt"></i>&nbspDelete Hotel</a>
            </li>
        </ul>
    </nav>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="AdminCenter" runat="server">
    <div class="container">
        <div class="card shadow p-4 mb-4" style="background-color: rgb(154, 232, 232)">
            <div class="card-header text-center" style="background-color: rgb(36, 131, 199)"><b>Delete Hotel</b></div>
            <div class="card-body">
                <div>
                    <div class="form-group row">
                        <label class="control-label col-sm-5 text-lg-right" for="HotelIDDropDownList"><b>Select Hotel:</b></label>
                        <div class="col-sm-3">
                            <asp:DropDownList CssClass="form-control" ID="HotelIDDropDownList" runat="server"></asp:DropDownList>
                        </div>
                        <div class="col-sm-2 text-center">
                            <asp:Button CssClass="btn-success btn" ID="HotelSearchButton" runat="server" Text="Submit" OnClick="HotelSearchButton_Click" />
                        </div>
                        <div class="col-sm-2">
                            <asp:RequiredFieldValidator ID="HotelIDRequiredFieldValidator" runat="server" ErrorMessage="Select an Item" ControlToValidate="HotelIDDropDownList" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div id="hidden" runat="server">
                        <div class="form-group row">
                            <label class="control-label col-sm-5 text-lg-right" for="HotelIDLabel"><b>Hotel ID:</b></label>
                            <asp:Label CssClass="col-sm-4" ID="HotelIDLabel" runat="server" Text="Hotel ID"></asp:Label>
                        </div>
                        <div class="form-group row">
                            <label class="control-label col-sm-5 text-lg-right" for="CountryLabel"><b>Country:</b></label>
                            <asp:Label CssClass="col-sm-4" ID="CountryLabel" runat="server" Text="Country Name"></asp:Label>
                        </div>
                        <div class="form-group row">
                            <label class="control-label col-sm-5 text-lg-right" for="CityLabel"><b>City:</b></label>
                            <asp:Label CssClass="col-sm-4" ID="CityLabel" runat="server" Text="City Name"></asp:Label>
                        </div>
                        <div class="form-group row">
                            <label class="control-label col-sm-5 text-lg-right" for="TotalRoomLabel"><b>Total Rooms:</b></label>
                            <asp:Label CssClass="col-sm-4" ID="TotalRoomLabel" runat="server" Text="Total Rooms"></asp:Label>
                        </div>
                        <div class="form-group row">
                            <label class="control-label col-sm-5 text-lg-right" for="HotelNameLabel"><b>Hotel Name:</b></label>
                            <asp:Label CssClass="col-sm-4" ID="HotelNameLabel" runat="server" Text="Hotel Name"></asp:Label>
                        </div>
                        <div class="form-group row">
                            <label class="control-label col-sm-5 text-lg-right" for="HotelDescriptionLabel"><b>Hotel Description:</b></label>
                            <asp:Label CssClass="col-sm-4" ID="HotelDescriptionLabel" runat="server" Text="Hotel Description"></asp:Label>
                        </div>
                        <div class="form-group row ">
                            <label class="control-label col-sm-5 text-lg-right" for="NoOfACRoomsLabel"><b>Number of AC Rooms:</b></label>
                            <asp:Label CssClass="col-sm-4" ID="NoOfACRoomsLabel" runat="server" Text="Number of AC Rooms"></asp:Label>
                        </div>
                        <div class="form-group row ">
                            <label class="control-label col-sm-5 text-lg-right" for="NoOfNACRoomsLabel"><b>Number of Non AC Rooms:</b></label>
                            <asp:Label CssClass="col-sm-4" ID="NoOfNACRoomsLabel" runat="server" Text="Number of Non AC Rooms"></asp:Label>
                        </div>
                        <div class="form-group row ">
                            <label class="control-label col-sm-5 text-lg-right" for="RateChildTextBox"><b>Rate for One Night in AC Room for One Children:</b></label>
                            <asp:Label CssClass="col-sm-4" ID="RateChildTextBox" runat="server" Text="Rate Amount"></asp:Label>
                        </div>
                        <div class="form-group row ">
                            <label class="control-label col-sm-5 text-lg-right" for="RateAdultTextBox"><b>Rate for One Night in AC Room for One Adult:</b></label>
                            <asp:Label CssClass="col-sm-4" ID="RateAdultTextBox" runat="server" Text="Rate Amount"></asp:Label>
                        </div>
                        <div class="form-group row ">
                            <label class="control-label col-sm-5 text-lg-right" for="RateChildTextBox"><b>Rate for One Night in Non AC Room for One Children:</b></label>
                            <asp:Label CssClass="col-sm-4" ID="RateNACChildTextBox" runat="server" Text="Rate Amount"></asp:Label>
                        </div>
                        <div class="form-group row ">
                            <label class="control-label col-sm-5 text-lg-right" for="RateAdultTextBox"><b>Rate for One Night in Non AC Room for One Adult:</b></label>
                            <asp:Label CssClass="col-sm-4" ID="RateNACAdultTextBox" runat="server" Text="Rate Amount"></asp:Label>
                        </div>
                        <div class="text-center">
                            <asp:Button CssClass="btn-danger btn" ID="DeleteButton" runat="server" Text="Delete" OnClick="DeleteButton_Click" />
                        </div>
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
                        <asp:Label ID="ErrorMessageLabel" runat="server" ForeColor="Green"></asp:Label>
                    </div>
                    <div class="modal-footer" style="background-color: lightcyan;">
                        <asp:Button CssClass="btn btn-secondary" OnClick="CloseButton_Click" ID="CloseButton" runat="server" Text="Close" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="AdminAsideRight" runat="server">
</asp:Content>
