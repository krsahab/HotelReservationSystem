<%@ Page Title="" Language="C#" MasterPageFile="~/Home/Home.Master" AutoEventWireup="true"  MaintainScrollPositionOnPostback="true" CodeBehind="ErrorPage.aspx.cs" Inherits="HotelReservationSystem.Web.Home.ErrorPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HomeMaster" runat="server">
    <div class="container-fluid" style="display: inline-table; min-height: 60vh;">
        <div class="text-center text-white" style="display: table-cell; vertical-align: middle;">
            <asp:Image CssClass="img-fluid mx-auto d-block" ID="ErrorImage" runat="server" AlternateText="Error" ImageAlign="Top" ImageUrl="~/Image/error.png" Height="150px" Width="150px" />
            <h1><b>Oops! Error Occured</b></h1>
            <h2>Click Below to go to Home Page</h2>
            <asp:Button CssClass="btn-primary btn" ID="HomePageButton" runat="server" Text="Home" OnClick="HomePageButton_Click" />
        </div>
    </div>
</asp:Content>
