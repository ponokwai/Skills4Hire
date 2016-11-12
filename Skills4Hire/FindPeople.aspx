<%@ Page Title="Find People" Language="C#" MasterPageFile="~/Frontend.Master" AutoEventWireup="true" CodeBehind="FindPeople.aspx.cs" Inherits="Skills4Hire.FindPeople" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FrontendContent" runat="server">
    <div class="body-content">
        <div class="container">
            <h4 class="text-center"><%: Title %></h4>
            <p>
                The people with the following listed profiles can be contacted directly for jobs. Alternatively, you can
                <asp:HyperLink ID="HyperLink3" NavigateUrl="~/PostAJob.aspx" runat="server">Post the Job</asp:HyperLink>
                advert and you will be contacted by interested persons.
            </p>
            <div>
                <%-- JS Filter --%>
                <input id="tbxSearch" type="text" placeholder="Type to search" class="form-control" />

                <%-- Advanced filter --%>
                <a class="btn btn-link" role="button" data-toggle="collapse" href="#collapseAdvFilter" aria-expanded="false" aria-controls="collapseAdvFilter">Advanced Filter <span class="glyphicon glyphicon-search"></span></a>
                <div class="collapse" id="collapseAdvFilter">
                    <div class="content-filter well">
                        <p>Filter Result</p>
                        <div>
                            <asp:CheckBox ID="cbxFilter" Checked="true" Visible="false" runat="server" />
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                Profession:
                    <asp:DropDownList ID="ddlProfessionFilter" ViewStateMode="Disabled" runat="server" CssClass="form-control" DataSourceID="EntityDataSource2" DataTextField="SkillType" DataValueField="idSkill"></asp:DropDownList>
                                <asp:EntityDataSource ID="EntityDataSource2" runat="server" ConnectionString="name=skillsforhireEntities" DefaultContainerName="skillsforhireEntities" EnableFlattening="False" EntitySetName="skills" OrderBy="it.[SkillType]">
                                </asp:EntityDataSource>
                            </div>
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <ContentTemplate>
                                    <div class="col-md-4">
                                        State:
                            <asp:DropDownList ID="ddlStateFilter" ViewStateMode="Disabled" runat="server" CssClass="form-control" AutoPostBack="True" DataSourceID="EntityDataSource3" DataTextField="StateName" DataValueField="idStateOfResidence"></asp:DropDownList>
                                        <asp:EntityDataSource ID="EntityDataSource3" runat="server" ConnectionString="name=skillsforhireEntities" DefaultContainerName="skillsforhireEntities" EnableFlattening="False" EntitySetName="stateofresidences" OrderBy="it.[StateName]">
                                        </asp:EntityDataSource>
                                    </div>
                                    <div class="col-md-4">
                                        Local Government:
                            
                                        <asp:DropDownList ID="ddlLGFilter" ViewStateMode="Disabled" runat="server" CssClass="form-control" DataSourceID="EntityDataSource4" DataTextField="LGName" DataValueField="idLocalGovtOfResidence">
                                        </asp:DropDownList>
                                        <asp:EntityDataSource ID="EntityDataSource4" runat="server" AutoGenerateWhereClause="True" ConnectionString="name=skillsforhireEntities" DefaultContainerName="skillsforhireEntities" EnableFlattening="False" EntitySetName="localgovtofresidences" OrderBy="it.[LGName]" Where="">
                                            <WhereParameters>
                                                <asp:ControlParameter ControlID="ddlStateFilter" Name="StateId" PropertyName="SelectedValue" Type="Int32" />
                                            </WhereParameters>
                                        </asp:EntityDataSource>
                                    </div>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                            <div class="col-md-12">
                                <asp:Button ID="btnClearFilter" runat="server" Text="Clear" CssClass="btn btn-default" OnClick="btnClearFilter_Click" />
                                <asp:Button ID="btnFilter" runat="server" Text="Filter" CssClass="btn btn-success" OnClick="btnFilter_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="container" style="overflow: auto">
            <asp:ListView ID="ListView1" runat="server" DataKeyNames="idIndProfile" DataSourceID="EntityDataSource1" ItemType="Skills4Hire.indprofile" ClientIDMode="Static" ViewStateMode="Disabled">
                <EmptyDataTemplate>
                    <table runat="server" style="">
                        <tr>
                            <td>No person was found. Try expanding your search or
                                <asp:HyperLink ID="HyperLink1" NavigateUrl="~/PostAJob.aspx" runat="server">post the job</asp:HyperLink>.</td>
                        </tr>
                    </table>
                </EmptyDataTemplate>

                <ItemTemplate>
                    <tr style="">
                        <td>
                            <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl='<%# "~/CandidateProfile.aspx?CandId=" + Item.idIndProfile  %>' ToolTip="View profile">
                                <asp:Label ID="FullNameLabel" runat="server" Text='<%# Item.FullName %>' />
                            </asp:HyperLink></td>
                        <td>
                            <asp:Label ID="SkillsIdLabel" runat="server" Text='<%# Item.skill.SkillType %>' />
                        </td>
                        <td>
                            <asp:Label ID="StateIdLabel" runat="server" Text='<%# Item.stateofresidence.StateName %>' />
                        </td>
                        <td>
                            <asp:Label ID="LocalGovtIdLabel" runat="server" Text='<%# Item.localgovtofresidence.LGName %>' />
                        </td>
                        <td>
                            <asp:Label ID="TownLabel" runat="server" Text='<%# Item.Town %>' />
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
                                            <th runat="server">Full Name</th>
                                            <th runat="server">Profession</th>
                                            <th runat="server">State</th>
                                            <th runat="server">Local Govt.</th>
                                            <th runat="server">Place/Town</th>
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
                                        <asp:NextPreviousPagerField ButtonType="Button" ButtonCssClass="btn btn-default" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                        <asp:NumericPagerField />
                                        <asp:NextPreviousPagerField ButtonType="Button" ButtonCssClass="btn btn-default" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                    </Fields>
                                </asp:DataPager>
                            </td>
                        </tr>--%>
                    </table>
                </LayoutTemplate>

            </asp:ListView>
            <asp:EntityDataSource ID="EntityDataSource1" runat="server" ConnectionString="name=skillsforhireEntities" DefaultContainerName="skillsforhireEntities" EnableFlattening="false" EntitySetName="indprofiles" Include="stateofresidence, localgovtofresidence, skill" AutoGenerateWhereClause="True" Where="" OrderBy="it.[SortOrder], it.skill.SkillType">
                <WhereParameters>
                    <asp:ControlParameter ControlID="cbxFilter" Name="Publish" PropertyName="Checked" Type="Boolean" />
                </WhereParameters>
            </asp:EntityDataSource>
        </div>

    </div>
</asp:Content>
