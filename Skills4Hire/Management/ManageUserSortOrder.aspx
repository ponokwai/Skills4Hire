<%@ Page Title="User Sort Order Manager" Language="C#" MasterPageFile="~/Management/Management.Master" AutoEventWireup="true" CodeBehind="ManageUserSortOrder.aspx.cs" Inherits="Skills4Hire.Management.ManageUserSortOrder" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BackendContent" runat="server">
    <div class="body-content">
        <div class="container">
            <h2><%: Title %></h2>
            <div class="row">
                <div class="form-inline">
                    Enter UserName:
                <asp:TextBox ID="tbxSearch" CssClass="form-control" placeholder="Search" runat="server"></asp:TextBox>
                    <asp:Button ID="btnSearch" runat="server" CssClass="btn btn-default" Text="Search" OnClick="btnSearch_Click" />
                </div>
                <br />

                <asp:GridView ID="GridView1" ViewStateMode="Disabled" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="idIndProfile" DataSourceID="EntityDataSource1" ItemType="Skills4Hire.indprofile">
                    <Columns>
                        <asp:CommandField ShowEditButton="True" ShowSelectButton="True" />
                        <asp:BoundField DataField="idIndProfile" HeaderText="Id" SortExpression="idIndProfile" ReadOnly="True" />
                        <asp:BoundField DataField="UserName" HeaderText="UserName" SortExpression="UserName" />
                        <asp:BoundField DataField="FullName" HeaderText="Full Name" SortExpression="FullName" />
                        <asp:TemplateField HeaderText="ProfessionId" SortExpression="SkillsId">
                            <%--<EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# BindItem.skill.SkillType %>'></asp:TextBox>
                            </EditItemTemplate>--%>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Item.SkillsId %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="SortOrder" HeaderText="SortOrder" SortExpression="SortOrder" />
                        <asp:CheckBoxField DataField="Publish" HeaderText="Publish" SortExpression="Publish" />
                        <asp:CheckBoxField DataField="IsGoldMember" HeaderText="IsGoldMember" SortExpression="IsGoldMember" />
                        <asp:BoundField DataField="GoldSubExpire" HeaderText="GoldSubExpire" SortExpression="GoldSubExpire" />
                    </Columns>
                </asp:GridView>
                <asp:EntityDataSource ID="EntityDataSource1" runat="server" Include="skill" ConnectionString="name=skillsforhireEntities" DefaultContainerName="skillsforhireEntities" EnableFlattening="False" EnableInsert="True" EnableUpdate="True" EntitySetName="indprofiles" AutoGenerateWhereClause="True" EntityTypeFilter="" Select="" Where="">
                </asp:EntityDataSource>
            </div>
            <hr />
            <div class="row">
                <h4 class="text-center">Downgrade/Upgrade all members from sort order 3 to 4 (and vis-a-vis) with no "professional selection" </h4>
                <b>No. of Downgrades:</b><b class="text-danger"><asp:Literal ID="ltlDowngrades" runat="server"></asp:Literal></b><br />
                <b>No. of Upgrades:</b><b class="text-success"><asp:Literal ID="ltlUpgrades" runat="server"></asp:Literal></b><br />
                <div class="btn-group">
                    <asp:Button ID="btnDowngrade" CssClass="btn btn-danger" runat="server" Text="Downgrade" OnClick="btnDowngrade_Click" />
                    <asp:Button ID="btnUpgrade" CssClass="btn btn-success" runat="server" Text="Upgrade" OnClick="btnUpgrade_Click" />
                </div>
            </div>
            <hr />
            <div class="row">
                <a class="btn btn-default" role="button" data-toggle="collapse" href="#collapseExample" aria-expanded="false" aria-controls="collapseExample">Publish/Unpublish Profiles</a>

                <div class="collapse" id="collapseExample">
                    <div class="well">
                        <div style="background-color: #cfcbcb">
                            <h4 class="text-center">Publish/Unpublish all accounts with no "valid professional selection" </h4>
                            <p class="text-danger">CAUTION: Publishing this way also affects users that delibrately unpublished their profiles</p>
                            <b>No. to Unpublish:</b><b class="text-danger"><asp:Literal ID="ltlUnpublish" runat="server"></asp:Literal></b><br />
                            <b>No. to Publish:</b><b class="text-success"><asp:Literal ID="ltlPublish" runat="server"></asp:Literal></b><br />
                            <div class="btn-group">
                                <asp:Button ID="btnUnpublish" CssClass="btn btn-danger" runat="server" Text="Unpublish" OnClick="btnUnpublish_Click" />
                                <asp:Button ID="btnPublish" CssClass="btn btn-success" runat="server" Text="Publish" OnClick="btnPublish_Click" />
                            </div>
                        </div>

                    </div>
                </div>
            </div>

        </div>
    </div>
</asp:Content>
