<%@ Page Title="Manage User Subscriptions" Language="C#" MasterPageFile="~/Management/Management.Master" AutoEventWireup="true" CodeBehind="UserSubscriptions.aspx.cs" Inherits="Skills4Hire.Management.UserSubscriptions" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BackendContent" runat="server">
    <div class="body-content">
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <h4>Manage ALL USERS Gold Subscription</h4>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            Months to Give:&nbsp;<asp:DropDownList ID="ddlAllUsers" runat="server" CssClass="form-control">
                                <asp:ListItem>0</asp:ListItem>
                                <asp:ListItem>1</asp:ListItem>
                                <asp:ListItem>2</asp:ListItem>
                                <asp:ListItem>3</asp:ListItem>
                                <asp:ListItem>6</asp:ListItem>
                                <asp:ListItem>9</asp:ListItem>
                                <asp:ListItem>12</asp:ListItem>
                                <asp:ListItem>24</asp:ListItem>
                            </asp:DropDownList>
                            <br />
                            Gold Role Expiry:<br />
                            <asp:DropDownList ID="ddlExpiryRange" runat="server" CssClass="form-control" AutoPostBack="True">
                                <asp:ListItem Value="-- Select Expiry Duration --">-- Select Expiry Duration --</asp:ListItem>
                                <asp:ListItem Value="0">0 Month (All Expired)</asp:ListItem>
                                <asp:ListItem Value="-1">&gt; 1 Month</asp:ListItem>
                                <asp:ListItem Value="-2">&gt; 2 Months</asp:ListItem>
                                <asp:ListItem Value="-3">&gt; 3 Months</asp:ListItem>
                                <asp:ListItem Value="-6">&gt; 6 Months</asp:ListItem>
                            </asp:DropDownList>
                            <br />
                            <asp:Button ID="btnUpdateAllUsers" runat="server" Text="Update" CssClass="btn btn-success" OnClick="btnUpdateAllUsers_Click" />
                            <asp:Label ID="lblAllUsersFeedback" runat="server" CssClass="lblFeedBack"></asp:Label><br />
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
                        <ProgressTemplate>
                            <div class="PleaseWait">Please Wait...</div>
                        </ProgressTemplate>
                    </asp:UpdateProgress>
                </div>
                <div class="col-md-6">
                    <h4>Manage A USER Gold Subscription</h4>
                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                        <ContentTemplate>
                            User Name:
                    
                        <asp:TextBox ID="tbxUserName" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:Button ID="btnFind" runat="server" CssClass="btn btn-default" Text="Find" OnClick="btnFind_Click" />
                            <asp:Label ID="lblGoldExpiryInfo" runat="server" CssClass="lblFeedBack"></asp:Label>
                            <br />
                            <br />
                            New Expiry Date:
                            <br />
                            <asp:TextBox ID="tbxNewExpDate" runat="server" placeholder="DD-MM-YYYY" CssClass="form-control" TextMode="Date"></asp:TextBox>
                            <br />
                            <asp:Button ID="btnUpdateAUser" runat="server" Text="Update" CssClass="btn btn-success" OnClick="btnUpdateAUser_Click" />
                            <asp:Label ID="lblGoldUpdateInfo" runat="server" CssClass="lblFeedBack"></asp:Label>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <asp:UpdateProgress ID="UpdateProgress2" runat="server" AssociatedUpdatePanelID="UpdatePanel2">
                        <ProgressTemplate>
                            <div class="PleaseWait">
                                Please wait...
                            </div>
                        </ProgressTemplate>
                    </asp:UpdateProgress>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
