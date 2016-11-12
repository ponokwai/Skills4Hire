<%@ Page Title="Delete Bulk User Account Entries" Language="C#" MasterPageFile="~/Management/Management.Master" AutoEventWireup="true" CodeBehind="ManageAccount.aspx.cs" Inherits="Skills4Hire.Management.ManageAccount" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BackendContent" runat="server">
    <div class="body-content container">
        <h2><%: Title %></h2><hr />
        <div class="row">
            <p>Enter user name and delete until you receive no delete confirmation feedback and confirm <asp:HyperLink ID="HyperLink1" NavigateUrl="~/Management/UserAccounts.aspx" runat="server">User Accounts</asp:HyperLink> page opens without error</p>
            <div class="form-group">
                User Name: 
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tbxUserName" CssClass="FormError" Display="Dynamic" ErrorMessage="Enter User Name"></asp:RequiredFieldValidator>
                &nbsp;<asp:Label ID="lblUserFeed" CssClass="lblFeedBack" runat="server"></asp:Label>
                <asp:TextBox ID="tbxUserName" placeholder="UserName" runat="server" CssClass="form-control"></asp:TextBox>
                <br />
                    <asp:Button ID="btnDelMembership" runat="server" Text="Delete User" CssClass="btn btn-danger" OnClick="btnDelMembership_Click" />
            </div>
        </div>
    </div>
</asp:Content>
