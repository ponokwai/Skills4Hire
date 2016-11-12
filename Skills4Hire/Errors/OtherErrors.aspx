<%@ Page Title="An Error has Occured" Language="C#" MasterPageFile="~/Frontend.Master" AutoEventWireup="true" CodeBehind="OtherErrors.aspx.cs" Inherits="Skills4Hire.Errors.OtherErrors" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FrontendContent" runat="server">
    <div class="body-content">
        <div class="container">
            <h1><%: Title %></h1>
            <hr />
            <p>An error has occurred on the page. The error has been logged and will be fixed soon.</p>
            <br />
            <p>Regards</p>
            <p class="text-uppercase">Skills4Hire.com.ng Team</p>
        </div>
    </div>
</asp:Content>
