<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeBehind="EditHotel.aspx.cs" Inherits="HotelReservationSystem.Web.Admin.EditHotel" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="AdminAsideLeft" runat="server">
    <nav class="navbar navbar-dark bg-dark">
        <ul class="navbar-nav">
            <li class="nav-item">
                <a class="nav-link" href="AddHotel.aspx"><i class="fas fa-hotel"></i>&nbspAdd Hotel</a>
            </li>
            <li class="nav-item">
                <a class="nav-link active" href="EditHotel.aspx"><i class="fas fa-edit"></i>&nbspEdit Hotel</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="DeleteHotel.aspx"><i class="fas fa-trash-alt"></i>&nbspDelete Hotel</a>
            </li>
        </ul>
    </nav>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="AdminCenter" runat="server">
    <div class="container">
        <div class="card shadow p-4 mb-4" style="background-color: rgb(154, 232, 232)">
            <div class="card-header text-center" style="background-color: rgb(36, 131, 199)"><b>Edit Hotel</b></div>
            <div class="card-body">
                <div>
                    <div class="form-group row">
                        <label class="control-label col-sm-5 text-lg-right" for="HotelIDDropDownList"><b>Select Hotel:</b></label>
                        <div class="col-sm-3">
                            <asp:DropDownList CssClass="form-control" ID="HotelIDDropDownList" runat="server"></asp:DropDownList>
                        </div>
                        <div class="col-sm-2 text-center">
                            <asp:Button CssClass="btn-success btn" ID="HotelSearchButton" runat="server" Text="Submit" OnClick="HotelSearchButton_Click" ValidationGroup="Search" />
                        </div>
                        <div class="col-sm-2">
                            <asp:RequiredFieldValidator ID="HotelIDRequiredFieldValidator" runat="server" ErrorMessage="Select An Item" ControlToValidate="HotelIDDropDownList" ForeColor="Red" ValidationGroup="Search"></asp:RequiredFieldValidator>
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
                            <label class="control-label col-sm-5 text-lg-right" for="HotelNameEditTextbox"><b>Hotel Name:</b></label>
                            <div class="col-sm-4">
                                <asp:TextBox CssClass="form-control" ID="HotelNameEditTextbox" runat="server" MaxLength="20">Name of The Hotel</asp:TextBox>
                            </div>
                            <div class="col-sm-3">
                                <asp:RegularExpressionValidator ID="HotelNameRegxValidator" runat="server" ErrorMessage="Invalid Input" ControlToValidate="HotelNameEditTextbox" ValidationExpression="[A-Z a-z]{1,20}" ForeColor="Red"></asp:RegularExpressionValidator>
                                <asp:RequiredFieldValidator ID="HotelNameRequiredFieldValidator" runat="server" ErrorMessage="Required" ControlToValidate="HotelNameEditTextbox" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="control-label col-sm-5 text-lg-right" for="HotelDescriptionTextBox"><b>Hotel Description:</b></label>
                            <div class="col-sm-4">
                                <asp:TextBox CssClass="form-control" placeholder="Enter Description here" ID="HotelDescriptionTextBox" runat="server" TextMode="MultiLine" ToolTip="Hotel description must be a maximum of 150 characters." MaxLength="150"></asp:TextBox>
                            </div>
                            <div class="col-sm-3">
                                <asp:RegularExpressionValidator ID="RegexValidator" runat="server" ErrorMessage="Invalid Input" ControlToValidate="HotelDescriptionTextBox" ForeColor="Red" ValidationExpression=".{1,150}"></asp:RegularExpressionValidator>
                                <asp:RequiredFieldValidator ID="HotelDescRequiredFieldValidator" runat="server" ErrorMessage="Required" ControlToValidate="HotelDescriptionTextBox" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="form-group row ">
                            <label class="control-label col-sm-5 text-lg-right" for="NoOfACRoomsTextBox"><b>Number of AC Rooms:</b></label>
                            <div class="col-sm-4">
                                <asp:TextBox CssClass="form-control" placeholder="Enter Number of AC Rooms" ID="NoOfACRoomsTextBox" runat="server" ToolTip="It should be integer and should not be less than 1 and greater than 300"></asp:TextBox>
                            </div>
                            <div class="col-sm-3">
                                <asp:RangeValidator ID="NoOfACRoomsRangeValidator" runat="server" ErrorMessage="Invalid Input" ControlToValidate="NoOfACRoomsTextBox" ForeColor="Red" MaximumValue="300" MinimumValue="1" Type="Integer"></asp:RangeValidator>
                                <asp:RequiredFieldValidator ID="NoOfACRoomRequiredFieldValidator" runat="server" ErrorMessage="Required" ControlToValidate="NoOfACRoomsTextBox" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="form-group row ">
                            <label class="control-label col-sm-5 text-lg-right" for="NoOfNACRoomsTextBox"><b>Number of Non AC Rooms:</b></label>
                            <div class="col-sm-4">
                                <asp:TextBox CssClass="form-control" placeholder="Enter Number of Non AC Rooms" ID="NoOfNACRoomsTextBox" runat="server" ToolTip="It should be integer and should not be less than 1 and greater than 300"></asp:TextBox>
                            </div>
                            <div class="col-sm-3">
                                <asp:RangeValidator ID="NoOfNonACRoomsRangeValidator" runat="server" ErrorMessage="Invalid Input" ControlToValidate="NoOfNACRoomsTextBox" ForeColor="Red" MaximumValue="300" MinimumValue="1" Type="Integer"></asp:RangeValidator>
                                <asp:RequiredFieldValidator ID="NoOfNonACRoomRequiredFieldValidator" runat="server" ErrorMessage="Required" ControlToValidate="NoOfNACRoomsTextBox" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="form-group row ">
                            <label class="control-label col-sm-5 text-lg-right" for="RateACAdultTextBox"><b>Rate Per Night for Adult in AC Room:</b></label>
                            <div class="col-sm-4">
                                <asp:TextBox CssClass="form-control" placeholder="Enter Rate Per Night for Adult in AC Room" ID="RateACAdultTextBox" runat="server" ToolTip="It should be a positive integer ranging between 0 and 4000"></asp:TextBox>
                            </div>
                            <div class="col-sm-3">
                                <asp:RangeValidator ID="RateACAdultRangeValidator" runat="server" ErrorMessage="Invalid Input" ControlToValidate="RateACAdultTextBox" ForeColor="Red" MaximumValue="4000" MinimumValue="0" Type="Integer"></asp:RangeValidator>
                                <asp:RequiredFieldValidator ID="RateAdultACRoomRequiredFieldValidator" runat="server" ErrorMessage="Required" ControlToValidate="RateACAdultTextBox" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="form-group row ">
                            <label class="control-label col-sm-5 text-lg-right" for="RateACChildTextBox"><b>Rate Per Night for Child in AC Room:</b></label>
                            <div class="col-sm-4">
                                <asp:TextBox CssClass="form-control" placeholder="Enter Rate Per Night for Child in AC Room" ID="RateACChildTextBox" runat="server" ToolTip="It should be a positive integer ranging between 0 and 3000"></asp:TextBox>
                            </div>
                            <div class="col-sm-3">
                                <asp:RangeValidator ID="RateChildACRoomValidator" runat="server" ErrorMessage="Invalid Input" ControlToValidate="RateACChildTextBox" ForeColor="Red" MaximumValue="3000" MinimumValue="0" Type="Integer"></asp:RangeValidator>
                                <asp:RequiredFieldValidator ID="RateChildACRoomRequiredFieldValidator" runat="server" ErrorMessage="Required" ControlToValidate="RateACChildTextBox" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="form-group row ">
                            <label class="control-label col-sm-5 text-lg-right" for="RateNACAdultTextBox"><b>Rate Per Night for Adult in Non AC Room:</b></label>
                            <div class="col-sm-4">
                                <asp:TextBox CssClass="form-control" placeholder="Enter Rate Per Night for Adult in Non AC Room" ID="RateNACAdultTextBox" runat="server" ToolTip="It should be a positive integer ranging between 0 and 2500"></asp:TextBox>
                            </div>
                            <div class="col-sm-3">
                                <asp:RangeValidator ID="RateAdultNonACRoomValidator" runat="server" ErrorMessage="Invalid Input" ControlToValidate="RateNACAdultTextBox" ForeColor="Red" MaximumValue="2500" MinimumValue="0" Type="Integer"></asp:RangeValidator>
                                <asp:RequiredFieldValidator ID="RateAdultNonACRoomRequiredFieldValidator" runat="server" ErrorMessage="Required" ControlToValidate="RateNACAdultTextBox" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="form-group row ">
                            <label class="control-label col-sm-5 text-lg-right" for="RateNACChildTextBox"><b>Rate Per Night for Child in Non AC Room:</b></label>
                            <div class="col-sm-4">
                                <asp:TextBox CssClass="form-control" placeholder="Etner Rate Per Night for Child in Non AC Room" ID="RateNACChildTextBox" runat="server" ToolTip="It should be a positive integer ranging between 0 and 2000"></asp:TextBox>
                            </div>
                            <div class="col-sm-3">
                                <asp:RangeValidator ID="RateChildNonACRoomValidator" runat="server" ErrorMessage="Invalid Input" ControlToValidate="RateNACChildTextBox" ForeColor="Red" MaximumValue="2000" MinimumValue="0" Type="Integer"></asp:RangeValidator>
                                <asp:RequiredFieldValidator ID="RateChildNonAcRoomRequiredFieldValidator" runat="server" ErrorMessage="Required" ControlToValidate="RateNACChildTextBox" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="text-center">
                            <asp:Button CssClass="btn btn-success" ID="SaveButton" runat="server" Text="Save" OnClick="SaveButton_Click" />
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
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="AdminAsideRight" runat="server">
</asp:Content>
