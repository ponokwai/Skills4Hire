<%@ Page Title="User Accounts" Language="C#" MasterPageFile="~/Management/Management.Master" AutoEventWireup="true" CodeBehind="UserAccounts.aspx.cs" Inherits="Skills4Hire.Management.UserAccounts" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BackendContent" runat="server">
    <div class="body-content">
        <div class="container">
            <a class="btn btn-link" role="button" data-toggle="collapse" href="#collapseAllUsers" aria-expanded="false" aria-controls="collapseSkills">All User Accounts</a>

            <div class="collapse" id="collapseAllUsers">
                <div>
                    <asp:GridView ID="GridView1" ViewStateMode="Disabled" runat="server" DataKeyNames="UserName" CellPadding="4" ForeColor="#333333" GridLines="None">
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        <EditRowStyle BackColor="#999999" />
                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#E9E7E2" />
                        <SortedAscendingHeaderStyle BackColor="#506C8C" />
                        <SortedDescendingCellStyle BackColor="#FFFDF8" />
                        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                    </asp:GridView>
                </div>
            </div>
            <br />
            <div class="form-group">
                User Name: 
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tbxUserName" CssClass="FormError" Display="Dynamic" ErrorMessage="Enter User Name"></asp:RequiredFieldValidator>
                &nbsp;<asp:Label ID="lblUserFeed" CssClass="lblFeedBack" runat="server"></asp:Label>
                <asp:TextBox ID="tbxUserName" placeholder="UserName" runat="server" CssClass="form-control"></asp:TextBox>
                <br />
                <div class="btn-group">
                    <asp:Button ID="btnDelMembership" runat="server" Text="Delete User" CssClass="btn btn-danger" OnClick="btnDelMembership_Click" />
                    <asp:Button ID="btnIsUserLocked" runat="server" CssClass="btn btn-default" OnClick="btnIsUserLocked_Click" Text="Is User Locked?" />
                    <asp:Button ID="btnUnlock" runat="server" Text="Unlock User" CssClass="btn btn-success" OnClick="btnUnlock_Click" />
                </div>
            </div>

            

            <br />

        </div>
    </div>
</asp:Content>
