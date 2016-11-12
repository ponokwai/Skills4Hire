<%@ Page Title="Manage Profession List" Language="C#" MasterPageFile="~/Management/Management.Master" AutoEventWireup="true" CodeBehind="ManageProfession.aspx.cs" Inherits="Skills4Hire.Management.ManageProfession" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BackendContent" runat="server">
    <div class="body-content container">
        <h2><%: Title %></h2>
        <div class="row">
            <asp:ListView ID="ListView1" ViewStateMode="Disabled" runat="server" DataKeyNames="idSkill" DataSourceID="EntityDataSource1" InsertItemPosition="FirstItem" ItemType="Skills4Hire.skill">
                
                <EditItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Button ID="UpdateButton" ButtonCssClass="btn btn-link" runat="server" CommandName="Update" Text="Update" />
                            <asp:Button ID="CancelButton" ButtonCssClass="btn btn-link" runat="server" CommandName="Cancel" Text="Cancel" />
                        </td>
                        <td>
                            <asp:Label ID="idSkillLabel1" runat="server" Text='<%# Eval("idSkill") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="SkillTypeTextBox" runat="server" Text='<%# Bind("SkillType") %>' />
                        </td>
                    </tr>
                </EditItemTemplate>
                <EmptyDataTemplate>
                    <table runat="server" style="">
                        <tr>
                            <td>No data was returned.</td>
                        </tr>
                    </table>
                </EmptyDataTemplate>
                <InsertItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Button ID="InsertButton" ButtonCssClass="btn btn-link" runat="server" CommandName="Insert" Text="Insert" />
                            <asp:Button ID="CancelButton" ButtonCssClass="btn btn-link" runat="server" CommandName="Cancel" Text="Clear" />
                        </td>
                        <td>
                            <%--<asp:TextBox ID="idSkillTextBox" runat="server" Text='<%# Bind("idSkill") %>' />--%>
                        </td>
                        <td>
                            <asp:TextBox ID="SkillTypeTextBox" runat="server" Text='<%# Bind("SkillType") %>' />
                        </td>
                    </tr>
                </InsertItemTemplate>
                <ItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                            <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                        </td>
                        <td>
                            <asp:Label ID="idSkillLabel" runat="server" Text='<%# Eval("idSkill") %>' />
                        </td>
                        <td>
                            <asp:Label ID="SkillTypeLabel" runat="server" Text='<%# Eval("SkillType") %>' />
                        </td>
                    </tr>
                </ItemTemplate>
                <LayoutTemplate>
                    <table runat="server">
                        <tr runat="server">
                            <td runat="server">
                                <table id="itemPlaceholderContainer" runat="server" border="0" style="" class="table table-responsive">
                                    <tr runat="server" style="">
                                        <th runat="server"></th>
                                        <th runat="server">idSkill</th>
                                        <th runat="server">SkillType</th>
                                    </tr>
                                    <tr id="itemPlaceholder" runat="server">
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr runat="server">
                            <td runat="server" style="text-align:center">
                                <asp:DataPager ID="DataPager1" runat="server">
                                    <Fields>
                                        <asp:NextPreviousPagerField ButtonType="Button" ButtonCssClass="btn btn-default" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                        <asp:NumericPagerField />
                                        <asp:NextPreviousPagerField ButtonType="Button" ButtonCssClass="btn btn-default" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                    </Fields>
                                </asp:DataPager>
                            </td>
                        </tr>
                    </table>
                </LayoutTemplate>
                
            </asp:ListView>
            <asp:EntityDataSource ID="EntityDataSource1" runat="server" ConnectionString="name=skillsforhireEntities" DefaultContainerName="skillsforhireEntities" EnableDelete="True" EnableFlattening="False" EnableInsert="True" EnableUpdate="True" EntitySetName="skills" EntityTypeFilter="" OrderBy="it.[SkillType]" Select="">
            </asp:EntityDataSource>
        </div>
    </div>
</asp:Content>
