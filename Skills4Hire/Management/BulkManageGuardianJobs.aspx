<%@ Page Title="Bulk Manage Guardian Jobs" Language="C#" MasterPageFile="~/Management/Management.Master" AutoEventWireup="true" CodeBehind="BulkManageGuardianJobs.aspx.cs" Inherits="Skills4Hire.Management.BulkManageGuardianJobs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BackendContent" runat="server">
    <div class="body-content container">
        <h2 class="text-center"><%: Title %></h2>
        <hr />
        <div class="row">
            <h4>All Jobs</h4>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="EntityDataSource1" AllowPaging="True" AllowSorting="True">
                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:CheckBox ID="cbxSelect" runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" />
                    <asp:BoundField DataField="JobTitle" HeaderText="JobTitle" SortExpression="JobTitle" />
                    <asp:BoundField DataField="PublicationDate" HeaderText="PublicationDate" SortExpression="PublicationDate" />
                    <asp:BoundField DataField="ExpiryDate" HeaderText="ExpiryDate" SortExpression="ExpiryDate" />
                    <asp:CheckBoxField DataField="Publish" HeaderText="Publish" SortExpression="Publish" />
                    <asp:BoundField DataField="EditedBy" HeaderText="EditedBy" SortExpression="EditedBy" />
                    <asp:BoundField DataField="DateTimeEdited" HeaderText="DateTimeEdited" SortExpression="DateTimeEdited" />
                </Columns>
            </asp:GridView>
            <asp:EntityDataSource ID="EntityDataSource1" runat="server" ConnectionString="name=skillsforhireEntities" DefaultContainerName="skillsforhireEntities" EnableFlattening="False" EntitySetName="guardianjobs">
            </asp:EntityDataSource>
            <div class="btn-group">
                <asp:Button ID="btnUnpub" CssClass="btn btn-default" runat="server" Text="Unpublish" OnClick="btnUnpub_Click" />
                <asp:Button ID="btnPublish" CssClass="btn btn-success" runat="server" Text="Publish" OnClick="btnPublish_Click" />
                <asp:Button ID="btnDel" CssClass="btn btn-default" runat="server" Text="Delete" OnClick="btnDel_Click" />
            </div>
        </div>
        <br />
        <hr />
        <div class="row">

            <h3 class="text-center">Quick Data Clean Up</h3>
            <div class="col-sm-6">
                <h6>Unpublish jobs > 2 months</h6>
                <p class="text-success">
                    Count:
                        
                            <asp:Literal ID="Literal1" runat="server"></asp:Literal>
                </p>
                <asp:Button ID="btnUnpublish" CssClass="btn btn-danger btn-lg" runat="server" Text="Unpublish" OnClick="btnUnpublish_Click" />
            </div>
            <div class="col-sm-6">
                <h6>Delete Unpublished Jobs > 3 months</h6>
                <p class="text-success">
                    Count:
                        
                            <asp:Literal ID="Literal2" runat="server"></asp:Literal>
                </p>
                <asp:Button ID="btnDelete" CssClass="btn btn-danger btn-lg" runat="server" Text="Delete" OnClick="btnDelete_Click" />
            </div>

        </div>

    </div>
</asp:Content>
