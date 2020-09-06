<%@ Page Title="" Language="C#" MasterPageFile="~/Home/Home.Master" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeBehind="SearchHotel.aspx.cs" Inherits="HotelReservationSystem.Web.Home.SearchHotel" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HomeMaster" runat="server">
    <nav class="navbar navbar-dark navbar-expand-lg sticky-top" style="margin-bottom: 10px; background-color: darkcyan">
        <asp:LinkButton CssClass="navbar-brand flex-grow-1" ID="HomeLinkButton" runat="server" OnClick="HomeLinkButton_Click" ValidationGroup="Home"><i class="fas fa-home"></i>&nbspHome</asp:LinkButton>
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
                <div id="hidden" runat="server">
                    <nav class="navbar navbar-dark bg-dark">
                        <ul class="navbar-nav">
                            <li class="nav-item">
                                <a class="nav-link active" href="../Home/SearchHotel.aspx"><i class="fas fa-search"></i>&nbspSearch Hotel</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="../Customer/ReserveHotel.aspx"><i class="fas fa-hotel"></i>&nbspReserve Hotel</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="../Customer/EditReservation.aspx"><i class="fas fa-edit"></i>&nbspEdit Reservation</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="../Customer/CancelReservation.aspx"><i class="far fa-times-circle"></i>&nbspCancel Reservation</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="../Customer/Payment.aspx"><i class="fas fa-shopping-cart"></i>&nbspPayment</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="../Customer/Transactions.aspx"><i class="fas fa-history"></i>&nbspTransactions</a>
                            </li>
                            <li class="nav-item">
                                <asp:LinkButton CssClass="nav-link" ID="LogoutButton" runat="server" OnClick="LogoutButton_Click" ValidationGroup="Logout"><i class="fas fa-sign-out-alt"></i>&nbspLogout</asp:LinkButton>
                            </li>
                        </ul>
                    </nav>
                </div>
            </div>
            <div class="col-lg-8">
                <div class="container-fluid text-white" style="min-height: 50vh;">
                    <div class="card bg-info shadow p-4 mb-4">
                        <div class="card-body">
                            <div class="text-center" style="font-family: 'Times New Roman'; font-size: xx-large; margin-bottom: 10px;"><b>Search Hotel</b></div>
                            <div class="form-row">
                                <div class="form-group col-sm-4">
                                    <label class="control-label text-lg-center" for="CountryDropDownList"><b>Country:</b></label>
                                    <asp:DropDownList CssClass="form-control" ID="CountryDropDownList" runat="server" OnSelectedIndexChanged="CountryDropDownList_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="CountryRequiredFieldValidator" runat="server" ErrorMessage="Select Country" ControlToValidate="CountryDropDownList" ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>
                                <div class="form-group col-sm-4">
                                    <label class="control-label text-lg-center" for="StateDropDownList"><b>State:</b></label>
                                    <asp:DropDownList CssClass="form-control" ID="StateDropDownList" runat="server" OnSelectedIndexChanged="StateDropDownList_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="StateRequiredFieldValidator" runat="server" ErrorMessage="Select State" ControlToValidate="StateDropDownList" ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>
                                <div class="form-group col-sm-4">
                                    <label class="control-label text-lg-center" for="CityDropDownList"><b>City:</b></label>
                                    <asp:DropDownList CssClass="form-control" ID="CityDropDownList" runat="server"></asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="CityRequiredFieldValidator" runat="server" ErrorMessage="Select City" ControlToValidate="CityDropDownList" ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col">
                                    <label class="control-label" for="CheckInTextBox"><b>Check In:</b></label>
                                    <asp:TextBox CssClass="form-control" ID="CheckInTextBox" placeholder="Check In" runat="server" TextMode="Date" MaxLength="10"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="CheckINRequiredFieldValidator" runat="server" ErrorMessage="Enter Check In Date" ControlToValidate="CheckInTextBox" ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>
                                <div class="form-group col">
                                    <label class="control-label" for="CheckOutTextBox"><b>Check Out:</b></label>
                                    <asp:TextBox CssClass="form-control" ID="CheckOutTextBox" placeholder="Check Out" runat="server" TextMode="Date" MaxLength="10"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="CheckOutRequiredFieldValidator" runat="server" ErrorMessage="Enter Check Out Date" ControlToValidate="CheckOutTextBox" ForeColor="Red"></asp:RequiredFieldValidator>
                                    <asp:CompareValidator ID="CheckoutCompareValidator" runat="server" ErrorMessage="Invalid Input" ControlToCompare="CheckInTextBox" ControlToValidate="CheckOutTextBox" ForeColor="Red" Operator="GreaterThan" Type="Date"></asp:CompareValidator>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col">
                                    <label class="control-label" for="NoOfRooms"><b>Rooms:</b></label>
                                    <asp:TextBox CssClass="form-control" ID="NoOfRooms" placeholder="No. Of Rooms" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RoomsRequiredFieldValidator" runat="server" ErrorMessage="Enter No Of Rooms" ControlToValidate="NoOfRooms" ForeColor="Red"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RoomsRegexValidator" runat="server" ErrorMessage="Invalid Input" ControlToValidate="NoOfRooms" ForeColor="Red" ValidationExpression="\d{1,2}"></asp:RegularExpressionValidator>
                                </div>
                                <div class="form-group col">
                                    <label class="control-label" for="NoOfRooms"><b>Room Type:</b></label>
                                    <asp:DropDownList CssClass="form-control" ID="RoomTypeDropDownList" runat="server">
                                        <asp:ListItem>AC</asp:ListItem>
                                        <asp:ListItem>Non AC</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RoomTypeRequiredFieldValidator" runat="server" ErrorMessage="Select Room Type" ControlToValidate="RoomTypeDropDownList" ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>
                                <div class="form-group col">
                                    <label class="control-label" for="NoOfAdults"><b>Adults:</b></label>
                                    <asp:TextBox CssClass="form-control" ID="NoOfAdults" placeholder="No. Of Adults" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="AdultsRequiredFieldValidator" runat="server" ErrorMessage="Enter No of Adults" ControlToValidate="NoOfAdults" ForeColor="Red"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="AdultsRegexValidator" runat="server" ErrorMessage="Invalid Input" ControlToValidate="NoOfAdults" ForeColor="Red" ValidationExpression="\d{1,2}"></asp:RegularExpressionValidator>
                                </div>
                            </div>
                            <div class="text-center">
                                <asp:Button CssClass="btn-secondary btn" ID="SearchHotelButton" runat="server" Text="Search" OnClick="SearchHotelButton_Click" />
                            </div>
                        </div>
                    </div>
                </div>
                <div class="container">
                    <div class="modal fade" id="Result" role="dialog">
                        <div class="modal-dialog modal-dialog-centered modal-lg">
                            <div class="modal-content">
                                <div class="modal-header bg-info">
                                    <h4 class="modal-title" style="text-align: center;">Result</h4>
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                </div>
                                <div class="modal-body" style="background-color: lightcyan;">
                                    <div id="HiddenTable" class="table-responsive" runat="server" style="background-color: lightcyan;">
                                        <asp:GridView CssClass="table table-bordered" ID="SearchHotelResult" runat="server" HorizontalAlign="Center" OnRowCommand="SearchHotelResult_RowCommand">
                                            <Columns>
                                                <asp:ButtonField ControlStyle-CssClass="btn-primary btn" CommandName="SelectHotel" Text="Select" />
                                            </Columns>
                                        </asp:GridView>
                                    </div>
                                    <div id="HiddenLabel" runat="server" class="text-center">
                                        <asp:Label ID="ErrorLabel" runat="server"></asp:Label>
                                    </div>
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
