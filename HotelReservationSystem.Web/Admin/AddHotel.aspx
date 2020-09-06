<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeBehind="AddHotel.aspx.cs" Inherits="HotelReservationSystem.Web.Admin.AddHotel" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="AdminAsideLeft" runat="server">
    <nav class="navbar navbar-dark bg-dark">
        <ul class="navbar-nav">
            <li class="nav-item">
                <a class="nav-link active" href="AddHotel.aspx"><i class="fas fa-hotel"></i>&nbspAdd Hotel</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="EditHotel.aspx"><i class="fas fa-edit"></i>&nbspEdit Hotel</a>
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
            <div class="card-header text-center" style="background-color: rgb(36, 131, 199)"><b>Enter Details</b></div>
            <div class="card-body">
                <div>
                    <div class="form-group row">
                        <label class="control-label col-sm-5 text-lg-right" for="HotelNameTextbox"><b>Hotel Name:</b></label>
                        <div class="col-sm-4">
                            <asp:TextBox CssClass="form-control" placeholder="Enter Hotel Name" ID="HotelNameTextbox" runat="server" ToolTip="Hotel name must be alphabet and should not exceed 20 characters. It should not contain any special symbols or special characters." MaxLength="20"></asp:TextBox>
                        </div>
                        <div class="col-sm-3">
                            <asp:RegularExpressionValidator ID="HotelNameRegxValidator" runat="server" ErrorMessage="Invalid Input" ControlToValidate="HotelNameTextbox" ValidationExpression="[A-Z a-z]{1,20}" ForeColor="Red"></asp:RegularExpressionValidator>
                            <asp:RequiredFieldValidator ID="HotelNameRequiredFieldValidator" runat="server" ErrorMessage="Required" ControlToValidate="HotelNameTextbox" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="control-label col-sm-5 text-lg-right" for="CountryDropDownList"><b>Country:</b></label>
                        <div class="col-sm-4">
                            <asp:DropDownList CssClass="form-control" ID="CountryDropDownList" runat="server" AutoPostBack="True" OnSelectedIndexChanged="CountryDropDownList_SelectedIndexChanged"></asp:DropDownList>
                        </div>
                        <div class="col-sm-3">
                            <asp:RequiredFieldValidator ID="CountryRequiredFieldValidator" runat="server" ErrorMessage="Required" ControlToValidate="CountryDropDownList" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="control-label col-sm-5 text-lg-right" for="StateDropDownList"><b>State:</b></label>
                        <div class="col-sm-4">
                            <asp:DropDownList CssClass="form-control" ID="StateDropDownList" runat="server" AutoPostBack="True" OnSelectedIndexChanged="StateDropDownList_SelectedIndexChanged"></asp:DropDownList>
                        </div>
                        <div class="col-sm-3">
                            <asp:RequiredFieldValidator ID="StateRequiredFieldValidator" runat="server" ErrorMessage="Required" ControlToValidate="StateDropDownList" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="control-label col-sm-5 text-lg-right" for="CityDropDownList"><b>City:</b></label>
                        <div class="col-sm-4">
                            <asp:DropDownList CssClass="form-control" ID="CityDropDownList" runat="server"></asp:DropDownList>
                        </div>
                        <div class="col-sm-3">
                            <asp:RequiredFieldValidator ID="CityRequiredFieldValidator" runat="server" ErrorMessage="Required" ControlToValidate="CityDropDownList" ForeColor="Red"></asp:RequiredFieldValidator>
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
                        <asp:Button CssClass="btn btn-success" ID="SubmitButton" runat="server" Text="Submit" OnClick="SubmitButton_Click"/>
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
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="AdminAsideRight" runat="server">
</asp:Content>
