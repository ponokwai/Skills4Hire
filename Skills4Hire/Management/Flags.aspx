<%@ Page Title="Flags: Jobs and Profiles" Language="C#" MasterPageFile="~/Management/Management.Master" AutoEventWireup="true" CodeBehind="Flags.aspx.cs" Inherits="Skills4Hire.Management.Flags" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BackendContent" runat="server">
    <div class="body-content">
        <div class="container">
            <h2>Job Post Flags</h2>
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="EntityDataSource1">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" />
                    <asp:HyperLinkField DataNavigateUrlFields="PostURL" DataTextField="PostURL" HeaderText="View Post" SortExpression="PostURL" />
                    <asp:BoundField DataField="FlagReason" HeaderText="Flag Reason" SortExpression="FlagReason" />
                    <asp:BoundField DataField="ReportedBy" HeaderText="Reported By" SortExpression="ReportedBy" />
                    <asp:BoundField DataField="DateTimeReported" HeaderText="Date-Time Reported" SortExpression="DateTimeReported" />
                </Columns>
            </asp:GridView>
            <asp:EntityDataSource ID="EntityDataSource1" runat="server" ConnectionString="name=skillsforhireEntities" DefaultContainerName="skillsforhireEntities" EnableDelete="True" EnableFlattening="False" EntitySetName="jobpostflags" OrderBy="it.[DateTimeReported]" EntityTypeFilter="" Select="">
            </asp:EntityDataSource>
        </div>
        <div class="container">
            <h2>Users Profile Flags</h2>
            <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="EntityDataSource2">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" />
                    <asp:HyperLinkField DataNavigateUrlFields="ProfileUrl" DataTextField="ProfileUrl" HeaderText="View Profile" Text="View" SortExpression="ProfileUrl" />
                    <asp:BoundField DataField="FlagReason" HeaderText="Flag Reason" SortExpression="FlagReason" />
                    <asp:BoundField DataField="ReportedBy" HeaderText="Reported By" SortExpression="ReportedBy" />
                    <asp:BoundField DataField="DateTimeReported" HeaderText="Date-Time Reported" SortExpression="DateTimeReported" />
                </Columns>
            </asp:GridView>
            <asp:EntityDataSource ID="EntityDataSource2" runat="server" ConnectionString="name=skillsforhireEntities" DefaultContainerName="skillsforhireEntities" EnableDelete="True" EnableFlattening="False" EntitySetName="profileflags" Where="" EntityTypeFilter="" Select="">
            </asp:EntityDataSource>
        </div>
    </div>
</asp:Content>
