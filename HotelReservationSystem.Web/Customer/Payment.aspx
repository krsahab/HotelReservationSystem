<%@ Page Title="" Language="C#" MasterPageFile="~/Customer/Customer.Master" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeBehind="Payment.aspx.cs" Inherits="HotelReservationSystem.Web.Customer.Payment" %>

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
                <a class="nav-link active" href="Payment.aspx"><i class="fas fa-shopping-cart"></i>&nbspPayment</a>
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
            <div class="card-header text-center" style="background-color: rgb(36, 131, 199)"><b>Enter Details</b></div>
            <div class="card-body">
                <div>
                    <div class="form-group row ">
                        <label class="control-label col-sm-5 text-lg-right" for="BookingIDDropDownList"><b>Select Booking ID:</b></label>
                        <div class="col-sm-3">
                            <asp:DropDownList CssClass="form-control" ID="BookingIDDropDownList" runat="server" ValidationGroup="booking"></asp:DropDownList>
                        </div>
                        <div class="col-sm-2 text-center">
                            <asp:Button CssClass="btn btn-primary" ID="BookingIDButton" runat="server" Text="Search" OnClick="BookingIDButton_Click" ValidationGroup="booking" />
                        </div>
                        <div class="col-sm-2">
                            <asp:RequiredFieldValidator ID="BookingIDRequiredFieldValidator" runat="server" ErrorMessage="Select an Item" ControlToValidate="BookingIDDropDownList" ForeColor="Red" ValidationGroup="booking"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div id="hidden" runat="server">
                        <div class="form-group row">
                            <label class="control-label col-sm-5 text-lg-right" for="AmountTextBox"><b>Amount:</b></label>
                            <div class="col-sm-4">
                                <asp:TextBox CssClass="form-control" ID="AmountTextBox" runat="server" Enabled="False"></asp:TextBox>
                            </div>
                            <div class="col-sm-3">
                                <asp:RequiredFieldValidator ID="AmountRequiredFieldValidator" runat="server" ErrorMessage="Enter Amount" ControlToValidate="AmountTextBox" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="control-label col-sm-5 text-lg-right" for="BankNameTextbox"><b>Bank Name:</b></label>
                            <div class="col-sm-4">
                                <asp:TextBox CssClass="form-control" placeholder="Ener Bank Name" ID="BankNameTextbox" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-sm-3">
                                <asp:RequiredFieldValidator ID="BankRequiredFieldValidator" runat="server" ErrorMessage="Enter Bank Name" ControlToValidate="BankNameTextbox" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="control-label col-sm-5 text-lg-right" for="CreditCardNoTextBox"><b>Card Number:</b></label>
                            <div class="col-sm-4">
                                <asp:TextBox CssClass="form-control" placeholder="Enter Card No." ID="CreditCardNoTextBox" runat="server" MaxLength="16"></asp:TextBox>
                            </div>
                            <div class="col-sm-3">
                                <asp:RequiredFieldValidator ID="CreditCardRequiredFieldValidator" runat="server" ErrorMessage="Enter Card No." ControlToValidate="CreditCardNoTextBox" ForeColor="Red"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="CreditCardRegxValidator" runat="server" ErrorMessage="Enter Valid No." ControlToValidate="CreditCardNoTextBox" ForeColor="Red" ValidationExpression="\d{16}"></asp:RegularExpressionValidator>
                            </div>
                        </div>
                        <div class="form-group row ">
                            <label class="control-label col-sm-5 text-lg-right" for="CardTypeDropDownList"><b>Card Type:</b></label>
                            <div class="col-sm-4">
                                <asp:DropDownList CssClass="form-control" ID="CardTypeDropDownList" runat="server">
                                    <asp:ListItem>Credit Card</asp:ListItem>
                                    <asp:ListItem>Debit Card</asp:ListItem>
                                    <asp:ListItem></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="col-sm-3">
                                <asp:RequiredFieldValidator ID="CardTypeRequiredFieldValidator" runat="server" ErrorMessage="Select an Item" ControlToValidate="CardTypeDropDownList" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="form-group row ">
                            <label class="control-label col-sm-5 text-lg-right" for="NameOnCardTextbox"><b>Name On Card:</b></label>
                            <div class="col-sm-4">
                                <asp:TextBox CssClass="form-control" placeholder="Enter Name On Card" ID="NameOnCardTextbox" runat="server" MaxLength="30"></asp:TextBox>
                            </div>
                            <div class="col-sm-3">
                                <asp:RequiredFieldValidator ID="NameOnCardRequiredFieldValidator" runat="server" ErrorMessage="Enter Name" ControlToValidate="NameOnCardTextbox" ForeColor="Red"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="NameOnCardRegularExpressionValidator" runat="server" ErrorMessage="Enter Valid Name" ControlToValidate="NameOnCardTextbox" ForeColor="Red" ValidationExpression="[A-Z a-z \s]{1,30}"></asp:RegularExpressionValidator>
                            </div>
                        </div>
                        <div class="form-group row ">
                            <label class="control-label col-sm-5 text-lg-right" for="ExpiryDateTextBox"><b>Expiry Date:</b></label>
                            <div class="col-sm-4">
                                <asp:TextBox CssClass="form-control" ID="ExpiryDateTextBox" runat="server" TextMode="Date" MaxLength="10"></asp:TextBox>
                            </div>
                            <div class="col-sm-3">
                                <asp:RequiredFieldValidator ID="EXPDateRequiredFieldValidator" runat="server" ErrorMessage="Select Date" ControlToValidate="ExpiryDateTextBox" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="form-group row ">
                            <label class="control-label col-sm-5 text-lg-right" for="CVVNoTextBox"><b>CVV Number:</b></label>
                            <div class="col-sm-4">
                                <asp:TextBox CssClass="form-control" placeholder="***" ID="CVVNoTextBox" runat="server" TextMode="Password" MaxLength="3"></asp:TextBox>
                            </div>
                            <div class="col-sm-3">
                                <asp:RequiredFieldValidator ID="CVVRequiredFieldValidator" runat="server" ErrorMessage="Enter CVV" ControlToValidate="CVVNoTextBox" ForeColor="Red"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="CVVRegexValidator" runat="server" ErrorMessage="Enter Valid No." ControlToValidate="CVVNoTextBox" ForeColor="Red" ValidationExpression="[0-9]{3}"></asp:RegularExpressionValidator>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="control-label col-sm-5 text-lg-right" for="AccNoTextbox"><b>Account Number:</b></label>
                            <div class="col-sm-4">
                                <asp:TextBox CssClass="form-control" placeholder="Enter Account Number" ID="AccNoTextbox" runat="server" MaxLength="10"></asp:TextBox>
                            </div>
                            <div class="col-sm-3">
                                <asp:RequiredFieldValidator ID="AccNoRequiredFieldValidator" runat="server" ErrorMessage="Enter Account No" ControlToValidate="AccNoTextbox" ForeColor="Red"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="AccNoRegxValidator" runat="server" ErrorMessage="Enter Valid No" ControlToValidate="AccNoTextbox" ForeColor="Red" ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="control-label col-sm-5 text-lg-right" for="PinNoTextBox"><b>Pin Number:</b></label>
                            <div class="col-sm-4">
                                <asp:TextBox CssClass="form-control" placeholder="****" ID="PinNoTextBox" runat="server" TextMode="Password" MaxLength="4"></asp:TextBox>
                            </div>
                            <div class="col-sm-3">
                                <asp:RequiredFieldValidator ID="PinNoRequiredFieldValidator" runat="server" ErrorMessage="Enter PIN No" ControlToValidate="PinNoTextBox" ForeColor="Red"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="PinNoRegxValidator" runat="server" ErrorMessage="Enter Valid No" ControlToValidate="PinNoTextBox" ForeColor="Red" ValidationExpression="((\d{4})|(\d{6}))"></asp:RegularExpressionValidator>
                            </div>
                        </div>
                        <div class="text-center">
                            <asp:Button CssClass="btn btn-success" ID="SubmitButton" runat="server" Text="Submit" OnClick="SubmitButton_Click" />
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
                        <asp:Label ID="ErrorMessageLabel" runat="server"></asp:Label>
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
