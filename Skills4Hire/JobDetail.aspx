<%@ Page Language="C#" MasterPageFile="~/Frontend.Master" AutoEventWireup="true" CodeBehind="JobDetail.aspx.cs" Inherits="Skills4Hire.JobDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FrontendContent" runat="server">
    <div class="body-content">
        <div class="container">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <div class="form-inline pull-right">
                        <asp:CheckBox ID="cbxSave" runat="server" Text="Save Job" AutoPostBack="True" OnCheckedChanged="cbxSave_CheckedChanged" />
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
            <asp:FormView ID="FormView1" runat="server" DataKeyNames="idJobProfile" DataSourceID="EntityDataSource1" ItemType="Skills4Hire.jobprofile" OnDataBound="FormView1_DataBound">
                <ItemTemplate>
                    <div class="fview-detail">
                        <h2>
                            <asp:Label ID="JobTitleLabel" runat="server" Text='<%# Item.JobTitle %>' /></h2>
                        <div class="row">
                            <div class="col-sm-3">Job Status:</div>
                            <div class="col-sm-9">
                                <asp:Label ID="JobStatusIdLabel" runat="server" Text='<%# Item.jobstatu.ToStart %>' />
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-sm-3">Start Time:</div>
                            <div class="col-sm-9">
                                <asp:Label ID="StartTimeIdLabel" runat="server" Text='<%# Item.starttime.JobStartTime %>' />
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-sm-3">State:</div>
                            <div class="col-sm-9">
                                <asp:Label ID="JobLocationStateIdLabel" runat="server" Text='<%# Item.stateofresidence.StateName %>' />
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-sm-3">Local Government:</div>
                            <div class="col-sm-9">
                                <asp:Label ID="JobLocationLGIdLabel" runat="server" Text='<%# Item.localgovtofresidence.LGName %>' />
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-sm-3">City/Town/Village:</div>
                            <div class="col-sm-9">
                                <asp:Label ID="JobLocationTownLabel" runat="server" Text='<%# Item.JobLocationTown %>' />
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-sm-3">Job Description:</div>
                            <div class="col-sm-9">
                                <asp:Label ID="JobDescriptionLabel" runat="server" Text='<%# Item.JobDescription.ToString().Replace(Environment.NewLine, "<br />") %>' />
                            </div>
                        </div>


                        <div class="row">
                            <div class="col-sm-3">Profession:</div>
                            <div class="col-sm-9">
                                <asp:Label ID="SkillIdLabel" runat="server" Text='<%# Item.skill.SkillType %>' />
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-sm-3">Specialisation:</div>
                            <div class="col-sm-9">
                                <asp:Label ID="SpecificSkillLabel" runat="server" Text='<%# Item.SpecificSkill %>' />
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-sm-3">Job Budget:</div>
                            <div class="col-sm-9">
                                <asp:Label ID="BudgetIdLabel" runat="server" Text='<%# Item.budget.EstBudget %>' />
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-sm-3">Date-Time Created:</div>
                            <div class="col-sm-9">
                                <asp:Label ID="DateCreatedLabel" runat="server" Text='<%# Item.DateCreated %>' />
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-sm-3">Expiry Date:</div>
                            <div class="col-sm-9">
                                <asp:Label ID="ExpiryDateLabel" runat="server" Text='<%# Item.ExpiryDate %>' />
                            </div>
                        </div>
                        <h3>Job Contact</h3>
                        <div class="well">

                            <div class="row">
                                <div class="col-sm-3">Contact Person:</div>
                                <div class="col-sm-9">
                                    <asp:Label ID="ContactFullNameLabel" runat="server" Text='<%# Item.ContactFullName %>' />
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-sm-3">Contact Number:</div>
                                <div class="col-sm-9">
                                    <asp:Label ID="ContactNumberLabel" runat="server" Text='<%# Item.ContactNumber %>' />
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-sm-3">Contact Email:</div>
                                <div class="col-sm-9">
                                    <asp:Label ID="ContactEmailLabel" runat="server" Text='<%# Item.ContactEmail %>' />
                                </div>
                            </div>
                        </div>

                    </div>
                </ItemTemplate>
            </asp:FormView>
            <asp:EntityDataSource ID="EntityDataSource1" runat="server" AutoGenerateWhereClause="True" ConnectionString="name=skillsforhireEntities" DefaultContainerName="skillsforhireEntities" EnableFlattening="False" EntitySetName="jobprofiles" EntityTypeFilter="" Select="" Where="" Include="localgovtofresidence, stateofresidence, skill, budget, starttime, jobstatu">
                <WhereParameters>
                    <asp:QueryStringParameter Name="idJobProfile" QueryStringField="JobId" Type="Int32" />
                </WhereParameters>
            </asp:EntityDataSource>
            <p class="smallfont"><span class="glyphicon glyphicon-warning-sign text-danger"> </span> As with any job, please always apply due diligence in dealing with the other party. Click on the link below to report this job post if you have any reason to be suspicious.</P> 
            <div class="flag-link">
                <asp:UpdatePanel ID="UpdatePnl" runat="server">
                    <ContentTemplate>
                        <asp:Button ID="btnReportLink" runat="server" CssClass="btn btn-link" Text="Report Job Post" OnClick="btnReportLink_Click" />
                        <asp:Panel ID="pnlReport" runat="server" Visible="false">
                            <div class="form-horizontal">
                                Provide Report Reason:<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tbxFlagReason" CssClass="FormError" Display="Dynamic" ErrorMessage="Provide report reason"></asp:RequiredFieldValidator>
                                &nbsp;<asp:TextBox ID="tbxFlagReason" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                                <asp:Button ID="btnSendFeedback" runat="server" Text="Send" CssClass="btn btn-default" OnClick="btnSendFeedback_Click" />
                            </div>
                        </asp:Panel>

                        <asp:Label ID="lblReportFeedback" runat="server" Visible="false"></asp:Label>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePnl">
                    <ProgressTemplate>
                        <div class="PleaseWait">Please Wait...</div>
                    </ProgressTemplate>
                </asp:UpdateProgress>
            </div>
        </div>
    </div>
</asp:Content>
