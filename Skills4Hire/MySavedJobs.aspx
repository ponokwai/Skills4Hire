<%@ Page Title="My Saved Jobs" Language="C#" MasterPageFile="~/Frontend.Master" AutoEventWireup="true" CodeBehind="MySavedJobs.aspx.cs" Inherits="Skills4Hire.MySavedJobs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FrontendContent" runat="server">
    <div class="body-content">
        <div class="container">
            <h2><%: Title %></h2>
            <div style="overflow: auto">
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Id" DataSourceID="EntityDataSource1" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:CommandField ShowDeleteButton="True" />
                        <asp:HyperLinkField DataNavigateUrlFields="sJobId" DataNavigateUrlFormatString="JobDetail.aspx?JobId={0}" DataTextField="sJobTitle" HeaderText="Job Title" SortExpression="sJobTitle" />
                        <asp:BoundField DataField="DateSaved" DataFormatString="{0:d}" HeaderText="Date Saved" SortExpression="DateSaved" />
                    </Columns>
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
                <asp:EntityDataSource ID="EntityDataSource1" runat="server" AutoGenerateWhereClause="True" ConnectionString="name=skillsforhireEntities" DefaultContainerName="skillsforhireEntities" EnableDelete="True" EnableFlattening="False" EntitySetName="mysavedjobs" OrderBy="it.[DateSaved] DESC" Where="">
                </asp:EntityDataSource>
            </div>
        </div>
    </div>
</asp:Content>
