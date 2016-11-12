<%@ Page Title="Manage User Roles" Language="C#" MasterPageFile="~/Management/Management.Master" AutoEventWireup="true" CodeBehind="UserRoles.aspx.cs" Inherits="Skills4Hire.Management.UserRoles" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BackendContent" runat="server">
    <div class="body-content">
        <div class="container">
            <div class="row">
                <div class="col-md-4">
                    <div class="well">
                        <h4>Create/Remove Role</h4>
                        Enter Role:
                    <div class="form-inline">
                        <asp:TextBox ID="tbxRole" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:Button ID="btnAddRole" runat="server" Text="Add Role" CssClass="btn btn-default" OnClick="btnAddRole_Click" />
                    </div>
                        <asp:Label ID="lblCreateRoleFeedback" CssClass="lblFeedBack" runat="server" Text=""></asp:Label>
                        <br />
                        All Roles:
                    <asp:ListBox ID="lbxAllRoles" runat="server" CssClass="form-control" SelectionMode="Multiple"></asp:ListBox>
                        <asp:Button ID="btnRemoveRole" runat="server" Text="Remove Role(s)" CssClass="btn btn-default" OnClick="btnRemoveRole_Click" />
                        <asp:Label ID="lblRemoveRoleFeedback" CssClass="lblFeedBack" runat="server" Text=""></asp:Label>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="well">
                        <h4>Find/Remove Users in Role</h4>
                        User Name:<asp:Label ID="lblUsernameFeedback" runat="server" CssClass="lblFeedBack"></asp:Label>
                        <br />
                        <asp:TextBox ID="tbxUserName" runat="server" CssClass="form-control"></asp:TextBox>
                        <br />
                        Roles:
                    <asp:DropDownList ID="ddlAllRoles" CssClass="form-control" runat="server"></asp:DropDownList>

                        <br />
                        Users In Role:
                    <asp:ListBox ID="lbxUsersInRole" runat="server" CssClass="form-control" SelectionMode="Multiple"></asp:ListBox>
                        <div class="btn-group">
                            <asp:Button ID="btnFindUsersInRole" runat="server" CssClass="btn btn-primary" OnClick="btnFindUsersInRole_Click" Text="Find Users in Role" />
                            <asp:Button ID="btnAddUser" runat="server" CssClass="btn btn-success" Text="Add User to Role" OnClick="btnAddUser_Click" />
                            <asp:Button ID="btnRemoveUsers" runat="server" Text="Remove Users from Role" CssClass="btn btn-danger" OnClick="btnRemoveUsers_Click" />
                        </div>
                        <br />
                        <asp:Label ID="lblRemoveUsersFeedback" runat="server" CssClass="lblFeedBack"></asp:Label>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="well">
                        <h4>Bulk Config</h4>
                        <div>
                            <p>
                                Downgrade
                            <asp:Label ID="lblMemGoldExpired" runat="server" Text="0" CssClass="lblFeedBack"></asp:Label>
                                &nbsp;user(s) with expired Gold membership
                            </p>
                            <asp:Button ID="btnDowngrade" runat="server" Text="Downgrade" CssClass="btn btn-danger" OnClick="btnDowngrade_Click" />

                            <asp:Label ID="lblDowngradeFeedback" runat="server" CssClass="lblFeedBack"></asp:Label>

                        </div>
                        <div>
                            <p>
                                Upgrade
                            <asp:Label ID="lblMemGoldRenew" runat="server" Text="0" CssClass="lblFeedBack"></asp:Label>
                                &nbsp;user(s) with renewed Gold membership
                            </p>
                            <asp:Button ID="btnUpgrade" runat="server" Text="Upgrade" CssClass="btn btn-success" OnClick="btnUpgrade_Click" />
                            <asp:Label ID="lblUpgradeFeedback" runat="server" CssClass="lblFeedBack"></asp:Label>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
