<%@ Page Title="Management Home" Language="C#" MasterPageFile="~/Management/Management.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Skills4Hire.Management.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BackendContent" runat="server">
    <div class="body-content">
        <div class="container">

            <h2>SKILLS FOR HIRE - SITE ADMIN</h2>
            <p>
                This is the backend site designed for website administrators. If you are here in error, please exit now.
            </p>
            <p>
                In this backend, website administrators will we able to:
            </p>
            <ul>
                <li>view and edit all job adverts/posting</li>
                <li>view&nbsp; and edit all members profile</li>
                <li>manage membership authorisation and authetication</li>
            </ul>
            <p>
                It is important that administrators act responsibly with members information at all time, as mis-management or abuse may lead to criminal prosecution.
            </p>

        </div>
        <div class="container">
            <h2>Current Membership Stat</h2>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <table class="table table-responsive">
                        <tr>
                            <td>Total Users Online:</td>
                            <td>
                                <asp:Literal ID="ltlOnline" runat="server"></asp:Literal></td>
                        </tr>
                        <tr>
                            <td>Total Site Members:</td>
                            <td>
                                <asp:Literal ID="ltlTotal" runat="server"></asp:Literal></td>
                        </tr>
                    </table>
                </ContentTemplate>
            </asp:UpdatePanel>
            <asp:UpdateProgress ID="UpdateProgress1" runat="server">
                <ProgressTemplate>
                    <div class="PleaseWait">Please Wait...</div>
                </ProgressTemplate>
            </asp:UpdateProgress>
        </div>
    </div>
</asp:Content>
