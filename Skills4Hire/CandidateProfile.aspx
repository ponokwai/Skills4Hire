<%@ Page Language="C#" MasterPageFile="~/Frontend.Master" AutoEventWireup="true" CodeBehind="CandidateProfile.aspx.cs" Inherits="Skills4Hire.CandidateProfile1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FrontendContent" runat="server">
    <div class="body-content">
        <div class="container">

            <asp:FormView ID="FormView1" runat="server" DataKeyNames="idIndProfile" DataSourceID="EntityDataSource1" ItemType="Skills4Hire.indprofile">                                
                <ItemTemplate>
                    <div class="fview-detail">
                        <h2><%: Title %></h2>
                        <div class="row">
                            <div class="col-sm-3">Full Name:</div>
                            <div class="col-sm-9"><asp:Label ID="FullNameLabel" runat="server" Text='<%# Item.FullName %>' /></div>
                        </div>

                        <div class="row">
                            <div class="col-sm-3">Gender:</div>
                            <div class="col-sm-9"><asp:Label ID="GenderIdLabel" runat="server" Text='<%# Item.gender.Type %>' /></div>
                        </div>

                        <div class="row">
                            <div class="col-sm-3">Contact Number:</div>
                            <div class="col-sm-9"><asp:Label ID="ContactNoLabel" runat="server" Text='<%# Item.ContactNo %>' /></div>
                        </div>

                        <div class="row">
                            <div class="col-sm-3">Email:</div>
                            <div class="col-sm-9"><asp:Label ID="EmailAddrLabel" runat="server" Text='<%# Item.EmailAddr %>' /></div>
                        </div>

                        <div class="row">
                            <div class="col-sm-3">State of Residence:</div>
                            <div class="col-sm-9"><asp:Label ID="StateIdLabel" runat="server" Text='<%# Item.stateofresidence.StateName %>' /></div>
                        </div>

                        <div class="row">
                            <div class="col-sm-3">Local Govt. of Residence:</div>
                            <div class="col-sm-9"><asp:Label ID="LocalGovtIdLabel" runat="server" Text='<%# Item.localgovtofresidence.LGName %>' /></div>
                        </div>

                        <div class="row">
                            <div class="col-sm-3">City/Town/Village:</div>
                            <div class="col-sm-9"><asp:Label ID="TownLabel" runat="server" Text='<%# Item.Town %>' /></div>
                        </div>

                        <div class="row">
                            <div class="col-sm-3">Profession:</div>
                            <div class="col-sm-9"><asp:Label ID="SkillsIdLabel" runat="server" Text='<%# Item.skill.SkillType %>' /></div>
                        </div>  

                        <div class="row">
                            <div class="col-sm-3">Professional Specialisation:</div>
                            <div class="col-sm-9"><asp:Label ID="SkillsSpecificLabel" runat="server" Text='<%# Item.SkillsSpecific.ToString().Replace(Environment.NewLine, "<br />") %>' /></div>
                        </div><hr /> 

                        <div class="row">
                            <div class="col-sm-3">Work Experience:</div>
                            <div class="col-sm-9"><asp:Label ID="JobExperienceLabel" runat="server" Text='<%# Item.JobExperience.ToString().Replace(Environment.NewLine, "<br />") %>' /></div>
                        </div><hr />

                        <div class="row">
                            <div class="col-sm-3">Qualification(s):</div>
                            <div class="col-sm-9"><asp:Label ID="QualificationLabel" runat="server" Text='<%# Item.Qualification.ToString().Replace(Environment.NewLine, "<br />") %>' /></div>
                        </div><hr />

                        <div class="row">
                            <div class="col-sm-3">Note:</div>
                            <div class="col-sm-9"><asp:Label ID="NoteLabel" runat="server" Text='<%# Item.Note.ToString().Replace(Environment.NewLine, "<br />") %>' /></div>
                        </div><hr />                                                                                               
                    </div>
                </ItemTemplate>
            </asp:FormView>
            <asp:EntityDataSource ID="EntityDataSource1" runat="server" ConnectionString="name=skillsforhireEntities" DefaultContainerName="skillsforhireEntities" EnableFlattening="False" EntitySetName="indprofiles" Where="" AutoGenerateWhereClause="True" Include="gender, stateofresidence, localgovtofresidence, skill">
                <WhereParameters>
                    <asp:QueryStringParameter Name="idIndProfile" QueryStringField="CandId" Type="Int32" />
                </WhereParameters>
            </asp:EntityDataSource>

            <div class="flag-link">
                <asp:UpdatePanel ID="UpdatePnl" runat="server">
                    <ContentTemplate>
                        <asp:Button ID="btnReportLink" runat="server" CssClass="btn btn-link" Text="Report This Profile" OnClick="btnReportLink_Click" />
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
