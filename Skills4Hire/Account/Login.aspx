<%@ Page Title="Login" Language="C#" MasterPageFile="~/Frontend.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Skills4Hire.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FrontendContent" runat="server">
    <div class="body-content">
        <div class="container">
            <div class="row">
                <asp:Login ID="SiteLogin" runat="server" CreateUserText="Create New Account" CreateUserUrl="~/Account/Register.aspx" CssClass="form-control" DestinationPageUrl="~/" OnLoggedIn="SiteLogin_LoggedIn" RememberMeSet="True" TextLayout="TextOnTop" TitleText="Log In to Skills4Hire" PasswordRecoveryText="Forgot Password?" PasswordRecoveryUrl="~/Account/PasswordRecovery.aspx"></asp:Login>
            </div>
        </div>
    </div>
</asp:Content>
