<%@ Page Title="Password Recovery" Language="C#" MasterPageFile="~/Frontend.Master" AutoEventWireup="true" CodeBehind="PasswordRecovery.aspx.cs" Inherits="Skills4Hire.PasswordRecovery" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FrontendContent" runat="server">
    <div class="body-content">
        <div class="container centralise">
            <h2><%: Title %></h2>
            <asp:PasswordRecovery ID="PasswordRecovery1" runat="server" CssClass="form-control">
                <MailDefinition BodyFileName="~/App_Data/PasswordRecovery.txt" From="noreply@skills4hire.com.ng" Priority="High" Subject="Skills4Hire Password Recovery">
                </MailDefinition>
            </asp:PasswordRecovery>
        </div>
    </div>
</asp:Content>
