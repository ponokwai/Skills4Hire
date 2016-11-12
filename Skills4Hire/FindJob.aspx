<%@ Page Title="Freelance Jobs" Language="C#" MasterPageFile="~/Frontend.Master" AutoEventWireup="true" CodeBehind="FindJob.aspx.cs" Inherits="Skills4Hire.test2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FrontendContent" runat="server">
    <div class="body-content">
        <div class="container">
            <h4 class="text-center"><%: Title %></h4>
            <p>Jobs listed here are work orders advertised by Skills4Hire.com.ng members wanting to hire for a specific job/task. Please share the job link with people that might be interested and have the required skill.</p>

            <div>
                <%-- JS Filter --%>
                <input id="tbxSearch" type="text" placeholder="Type to search" class="form-control" />

                <%-- Advanced filter --%>
                <a class="btn btn-link" role="button" data-toggle="collapse" href="#collapseAdvFilter" aria-expanded="false" aria-controls="collapseAdvFilter">Advanced Filter <span class="glyphicon glyphicon-search"></span></a>
                <div class="collapse" id="collapseAdvFilter">
                    <div class="content-filter well">
                        <div>
                            <asp:CheckBox ID="cbxFilter" Checked="true" Visible="false" runat="server" />
                        </div>
                        <p>Filter Result</p>
                        <div class="row">
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <ContentTemplate>
                                    <div class="col-sm-4">
                                        Select Profession:
                                <asp:DropDownList ID="ddlFilterProfession" ViewStateMode="Disabled" runat="server" CssClass="form-control" DataSourceID="EntityDataSource4" DataTextField="SkillType" DataValueField="idSkill"></asp:DropDownList>
                                        <asp:EntityDataSource ID="EntityDataSource4" runat="server" ConnectionString="name=skillsforhireEntities" DefaultContainerName="skillsforhireEntities" EnableFlattening="False" EntitySetName="skills" OrderBy="it.[SkillType]">
                                        </asp:EntityDataSource>
                                    </div>
                                    <div class="col-sm-4">
                                        Select State:
                                <asp:DropDownList ID="ddlFilterStates" ViewStateMode="Disabled" CssClass="form-control" runat="server" AutoPostBack="True" DataSourceID="EntityDataSource2" DataTextField="StateName" DataValueField="idStateOfResidence"></asp:DropDownList>
                                        <asp:EntityDataSource ID="EntityDataSource2" runat="server" ConnectionString="name=skillsforhireEntities" DefaultContainerName="skillsforhireEntities" EnableFlattening="False" EntitySetName="stateofresidences" OrderBy="it.StateName">
                                        </asp:EntityDataSource>
                                    </div>
                                    <div class="col-sm-4">
                                        Select Local Govt.:
                                <asp:DropDownList ID="ddlFilterLG" ViewStateMode="Disabled" runat="server" CssClass="form-control" DataSourceID="EntityDataSource3" DataTextField="LGName" DataValueField="idLocalGovtOfResidence">
                                </asp:DropDownList>
                                        <asp:EntityDataSource ID="EntityDataSource3" runat="server" AutoGenerateWhereClause="True" ConnectionString="name=skillsforhireEntities" DefaultContainerName="skillsforhireEntities" EnableFlattening="False" EntitySetName="localgovtofresidences" Where="" OrderBy="it.[LGName]">
                                            <WhereParameters>
                                                <asp:ControlParameter ControlID="ddlFilterStates" Name="StateId" PropertyName="SelectedValue" Type="Int32" />
                                            </WhereParameters>
                                        </asp:EntityDataSource>
                                    </div>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                            <div class="col-sm-12">
                                <asp:Button ID="btnClearFilter" CssClass="btn btn-default" runat="server" Text="Clear" OnClick="btnClearFilter_Click" />
                                <asp:Button ID="btnFilter" CssClass="btn btn-success" runat="server" Text="filter" OnClick="btnFilter_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <div class="container" style="overflow:auto">
            <div>
                <asp:ListView ID="ListView1" ViewStateMode="Disabled" runat="server" DataKeyNames="idJobProfile" DataSourceID="EntityDataSource1" ItemType="Skills4Hire.jobprofile">
                    <EmptyDataTemplate>
                        <table runat="server" style="">
                            <tr>
                                <td>No job was found. Try expanding your search or check
                                    <asp:HyperLink ID="HyperLink1" NavigateUrl="~/GuardianJobs.aspx" runat="server">Guardian newspaper jobs</asp:HyperLink>.</td>
                            </tr>
                        </table>
                    </EmptyDataTemplate>

                    <ItemTemplate>
                        <tr style="">
                            <td>
                                <asp:HyperLink ID="hlkJobTitle" runat="server" NavigateUrl='<%# "~/JobDetail.aspx?JobId=" + Item.idJobProfile %>'>
                                    <asp:Label ID="JobTitleLabel" runat="server" Text='<%# Item.JobTitle %>' />
                                </asp:HyperLink></td>
                            <td>
                                <asp:Label ID="JobLocationStateIdLabel" runat="server" Text='<%# Item.stateofresidence.StateName %>' />
                            </td>
                            <td>
                                <asp:Label ID="JobLocationLGIdLabel" runat="server" Text='<%# Item.localgovtofresidence.LGName %>' />
                            </td>
                            <td>
                                <asp:Label ID="JobLocationTownLabel" runat="server" Text='<%# Item.JobLocationTown %>' />
                            </td>
                            <td>
                                <asp:Label ID="DateCreatedLabel" runat="server" Text='<%# Item.DateCreated %>' />
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
                                                <th runat="server">State</th>
                                                <th runat="server">Local Govt.</th>
                                                <th runat="server">Place</th>
                                                <th runat="server">Date Created</th>
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
                                            <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                            <asp:NumericPagerField />
                                            <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                        </Fields>
                                    </asp:DataPager>
                                </td>
                            </tr>--%>
                        </table>
                    </LayoutTemplate>

                </asp:ListView>
                <asp:EntityDataSource ID="EntityDataSource1" runat="server" ConnectionString="name=skillsforhireEntities" DefaultContainerName="skillsforhireEntities" EnableFlattening="False" EntitySetName="jobprofiles" Include="stateofresidence, localgovtofresidence" OrderBy="it.DateCreated DESC" Where="" AutoGenerateWhereClause="True" EntityTypeFilter="" Select="">
                    <WhereParameters>
                        <asp:ControlParameter ControlID="cbxFilter" Name="Publicise" PropertyName="Checked" Type="Boolean" />
                    </WhereParameters>
                </asp:EntityDataSource>
            </div>
        </div>
    </div>

</asp:Content>
