<%@ Page Title="Page Not Found" Language="C#" MasterPageFile="~/Frontend.Master" AutoEventWireup="true" CodeBehind="Error404.aspx.cs" Inherits="Skills4Hire.Errors.Error404" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FrontendContent" runat="server">
    <div class="body-content">
        <div class="container">
            <h1><%: Title %></h1>
            <hr />
            <p>The page you requested cannot be found. Please check <a runat="server" href="~/">Homepage</a> or choose a different page from the Menu.</p>
            <br />
            <p>Regards</p>
            <p class="text-uppercase">Skills4Hire.com.ng Team</p>
        </div>
    </div>
</asp:Content>
