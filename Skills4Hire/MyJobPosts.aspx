<%@ Page Title="My Job Posts" Language="C#" MasterPageFile="~/Frontend.Master" AutoEventWireup="true" CodeBehind="MyJobPosts.aspx.cs" Inherits="Skills4Hire.MyJobPosts" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FrontendContent" runat="server">
    <div class="body-content">
        <div class="container">
            <h2><%: Title %></h2>
            <div style="overflow:auto">
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="idJobProfile" DataSourceID="EntityDataSource1" ItemType="Skills4Hire.jobprofile">
                    <Columns>
                        <asp:CommandField ShowDeleteButton="True" />
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("IdJobProfile", "~/PostAJob.aspx?JobId={0}") %>' Text="Edit"></asp:HyperLink>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl='<%# Eval("idJobProfile", "~/JobDetail.aspx?JobId={0}") %>' Text="View"></asp:HyperLink>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="JobTitle" HeaderText="Job Title" SortExpression="JobTitle" />
                        <asp:TemplateField HeaderText="Job Status" SortExpression="JobStatusId">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Item.jobstatu.ToStart %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Profession" SortExpression="SkillId">
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Item.skill.SkillType %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="DateCreated" HeaderText="Date Created" SortExpression="DateCreated" />
                        <asp:BoundField DataField="ExpiryDate" HeaderText="Expiry Date" SortExpression="ExpiryDate" />
                    </Columns>
                </asp:GridView>
                <asp:EntityDataSource ID="EntityDataSource1" runat="server" AutoGenerateWhereClause="True" ConnectionString="name=skillsforhireEntities" DefaultContainerName="skillsforhireEntities" EnableDelete="True" EnableFlattening="False" EntitySetName="jobprofiles" Include="skill, jobstatu" Where="">
                </asp:EntityDataSource>
            </div>
        </div>
        <br />
        <div class="container">
            <asp:Button ID="btnPostNewJob" CssClass="btn btn-success btn-lg" runat="server" Text="Post A New Job" OnClick="btnPostNewJob_Click" />
        </div>
    </div>
</asp:Content>
