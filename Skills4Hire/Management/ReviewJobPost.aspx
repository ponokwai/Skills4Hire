<%@ Page Title="Review Job Post" Language="C#" MasterPageFile="~/Management/Management.Master" AutoEventWireup="true" CodeBehind="ReviewJobPost.aspx.cs" Inherits="Skills4Hire.Management.ReviewJobPost" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BackendContent" runat="server">
    <h2><%: Title %></h2>

    <div class="body-content">
        <div class="container">
            <asp:FormView ID="FormView1" runat="server" DataKeyNames="idJobProfile" DataSourceID="EntityDataSource1" ItemType="Skills4Hire.jobprofile">
                <ItemTemplate>
                    <div class="fview-detail">
                        <h2>
                            <asp:Label ID="JobTitleLabel" runat="server" Text='<%# Item.JobTitle %>' /></h2>
                        <div class="row">
                            <div class="col-sm-3">Job Id:</div>
                            <div class="col-sm-9">
                                <asp:Label ID="idJobProfileLabel" runat="server" Text='<%# Item.idJobProfile.ToString() %>' /></div>
                        </div>

                        <div class="row">
                            <div class="col-sm-3">Job Status:</div>
                            <div class="col-sm-9">
                                <asp:Label ID="JobStatusIdLabel" runat="server" Text='<%# Item.jobstatu.ToStart %>' /></div>
                        </div>

                        <div class="row">
                            <div class="col-sm-3">Start Time:</div>
                            <div class="col-sm-9">
                                <asp:Label ID="StartTimeIdLabel" runat="server" Text='<%# Item.starttime.JobStartTime %>' /></div>
                        </div>

                        <div class="row">
                            <div class="col-sm-3">State:</div>
                            <div class="col-sm-9">
                                <asp:Label ID="JobLocationStateIdLabel" runat="server" Text='<%# Item.stateofresidence.StateName %>' /></div>
                        </div>

                        <div class="row">
                            <div class="col-sm-3">Local Govt:</div>
                            <div class="col-sm-9">
                                <asp:Label ID="JobLocationLGIdLabel" runat="server" Text='<%# Item.localgovtofresidence.LGName %>' /></div>
                        </div>

                        <div class="row">
                            <div class="col-sm-3">City/Town/Village:</div>
                            <div class="col-sm-9">
                                <asp:Label ID="JobLocationTownLabel" runat="server" Text='<%# Item.JobLocationTown %>' /></div>
                        </div>

                        <div class="row">
                            <div class="col-sm-3">Job Description:</div>
                            <div class="col-sm-9">
                                <asp:Label ID="JobDescriptionLabel" runat="server" Text='<%# Item.JobDescription.ToString().Replace(Environment.NewLine, "<br />") %>' /></div>
                        </div>

                        <div class="row">
                            <div class="col-sm-3">Profession:</div>
                            <div class="col-sm-9">
                                <asp:Label ID="SkillIdLabel" runat="server" Text='<%# Item.skill.SkillType %>' /></div>
                        </div>

                        <div class="row">
                            <div class="col-sm-3">Specialisation:</div>
                            <div class="col-sm-9">
                                <asp:Label ID="SpecificSkillLabel" runat="server" Text='<%# Item.SpecificSkill %>' /></div>
                        </div>

                        <div class="row">
                            <div class="col-sm-3">Budget:</div>
                            <div class="col-sm-9">
                                <asp:Label ID="BudgetIdLabel" runat="server" Text='<%# Item.budget.EstBudget %>' /></div>
                        </div>

                        <div class="row">
                            <div class="col-sm-3">Contact Full Name:</div>
                            <div class="col-sm-9">
                                <asp:Label ID="ContactFullNameLabel" runat="server" Text='<%# Item.ContactFullName %>' /></div>
                        </div>

                        <div class="row">
                            <div class="col-sm-3">Contact Number:</div>
                            <div class="col-sm-9">
                                <asp:Label ID="ContactNumberLabel" runat="server" Text='<%# Item.ContactNumber %>' /></div>
                        </div>

                        <div class="row">
                            <div class="col-sm-3">Contact Email:</div>
                            <div class="col-sm-9">
                                <asp:Label ID="ContactEmailLabel" runat="server" Text='<%# Item.ContactEmail %>' /></div>
                        </div>

                        <div class="row">
                            <div class="col-sm-3">Expiry Date:</div>
                            <div class="col-sm-9">
                                <asp:Label ID="ExpiryDateLabel" runat="server" Text='<%# Item.ExpiryDate %>' /></div>
                        </div>

                        <div class="row">
                            <div class="col-sm-3">Created By:</div>
                            <div class="col-sm-9">
                                <asp:Label ID="CreatedByLabel" runat="server" Text='<%# Item.CreatedBy %>' /></div>
                        </div>

                        <div class="row">
                            <div class="col-sm-3">Date Created:</div>
                            <div class="col-sm-9">
                                <asp:Label ID="DateCreatedLabel" runat="server" Text='<%# Item.DateCreated %>' /></div>
                        </div>

                        <div class="row">
                            <div class="col-sm-3">Modified By:</div>
                            <div class="col-sm-9">
                                <asp:Label ID="LastModifiedByLabel" runat="server" Text='<%# Item.LastModifiedBy %>' /></div>
                        </div>

                        <div class="row">
                            <div class="col-sm-3">Date Modified:</div>
                            <div class="col-sm-9">
                                <asp:Label ID="LastModifiedLabel" runat="server" Text='<%# Item.LastModified %>' /></div>
                        </div>

                        <div class="row">
                            <div class="col-sm-3">Publish:</div>
                            <div class="col-sm-9">
                                <asp:CheckBox ID="PubliciseCheckBox" runat="server" Checked='<%# Item.Publicise %>' Enabled="false" /></div>
                        </div><br />
                        <div class="col-sm-offset-2 btn-group">
                            <a class="btn btn-primary" href='javascript:history.go(-1)'> Go Back</a> &nbsp;
                            <asp:HyperLink ID="hlkEdit" NavigateUrl='<%#"~/Management/EditJobPost.aspx?JobId=" + Item.idJobProfile.ToString() %>' CssClass="btn btn-success" runat="server">Edit</asp:HyperLink>
                            <asp:Button ID="btnDelete" runat="server" Text="Delete" CssClass="btn btn-danger" OnClick="btnDelete_Click" />
                
                        </div>
                    </div>
                </ItemTemplate>
            </asp:FormView>
            <asp:EntityDataSource ID="EntityDataSource1" runat="server" AutoGenerateWhereClause="True" ConnectionString="name=skillsforhireEntities" DefaultContainerName="skillsforhireEntities" EnableDelete="True" EnableFlattening="False" EnableUpdate="True" EntitySetName="jobprofiles" Include="budget, starttime, jobstatu, skill, stateofresidence, localgovtofresidence" Where="">
                <WhereParameters>
                    <asp:QueryStringParameter Name="idJobProfile" QueryStringField="JobId" Type="Int32" />
                </WhereParameters>
            </asp:EntityDataSource>

        </div>
    </div>
</asp:Content>
