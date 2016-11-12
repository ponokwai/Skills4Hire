<%@ Page Title="Tuesday Guardian Newspaper Jobs" Language="C#" MasterPageFile="~/Frontend.Master" AutoEventWireup="true" CodeBehind="GuardianJobs.aspx.cs" Inherits="Skills4Hire.GuardianJobs" MetaDescription="Tuesday Nigeria Guardian newspaper jobs publication"
    MetaKeywords="tuesday, nigeria, guardian, newspaper, job,publication" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FrontendContent" runat="server">
    <div class="body-content">
        <div class="container">
        <h2><%: Title %></h2>
        <p>The listed jobs are copied from Tuesday Nigeria Guardian newspaper. You can share the job link with people that might be interested and have the required skill.</p>
        <div>
            <div>
                <%-- Search --%>
                <input id="tbxSearch" type="text" placeholder="Type to search" class="form-control" />
            </div>
            <div style="overflow:auto">
                <asp:ListView ID="ListView1" ViewStateMode="Disabled" runat="server" DataKeyNames="Id" DataSourceID="EntityDataSource1" ItemType="Skills4Hire.guardianjob" ClientIDMode="Static">
                    <EmptyDataTemplate>
                        <table runat="server" style="">
                            <tr>
                                <td>No data was returned.</td>
                            </tr>
                        </table>
                    </EmptyDataTemplate>

                    <ItemTemplate>
                        <tr style="">

                            <td>
                                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "~/GuardianJobDetails.aspx?JobId=" + Item.Id %>'>
                                    <asp:Label ID="JobTitleLabel" runat="server" Text='<%# Eval("JobTitle") %>' />
                                </asp:HyperLink></td>
                            <td>
                                <asp:Label ID="PublicationDateLabel" runat="server" Text='<%# Eval("PublicationDate", "{0:dd/M/yyyy}") %>' />
                            </td>

                        </tr>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <table runat="server">
                            <tr runat="server">
                                <td runat="server">
                                    <table id="itemPlaceholderContainer" border="0" style="" class="table table-responsive paginated">
                                        <thead>
                                            <tr runat="server" style="">

                                                <th runat="server">Job Title</th>
                                                <th runat="server">Publication Date</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr id="itemPlaceholder" runat="server">
                                            </tr>
                                        </tbody>
                                    </table>
                                </td>
                            </tr>
                            <%--<tr runat="server">
                            <td runat="server" style="text-align: center">
                                <asp:DataPager ID="DataPager1" runat="server">
                                    <Fields>
                                        <asp:NextPreviousPagerField ButtonType="Button" ButtonCssClass="btn btn-link" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                        <asp:NumericPagerField />
                                        <asp:NextPreviousPagerField ButtonType="Button" ButtonCssClass="btn btn-link" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                    </Fields>
                                </asp:DataPager>
                            </td>
                        </tr>--%>
                        </table>
                    </LayoutTemplate>

                </asp:ListView>
                <asp:EntityDataSource ID="EntityDataSource1" runat="server" ConnectionString="name=skillsforhireEntities" DefaultContainerName="skillsforhireEntities" EnableFlattening="False" EntitySetName="guardianjobs" OrderBy="it.[PublicationDate] DESC, it.[JobTitle]" Where="it.[Publish] == true"></asp:EntityDataSource>
            </div>

        </div>
    </div>
    </div>

    <%--<script type="text/javascript">
        $(function () {
            $("#<%= ListView1.ClientID %>").bootstrapSwitch();
        })
    </script>--%>
</asp:Content>
