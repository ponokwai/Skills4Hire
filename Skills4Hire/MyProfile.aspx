<%@ Page Title="My Profile" Language="C#" MasterPageFile="~/Frontend.Master" AutoEventWireup="true" CodeBehind="MyProfile.aspx.cs" Inherits="Skills4Hire.CandidateProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FrontendContent" runat="server">
    <div class="body-content">
        <div class="container">
            <div class="canProfile">
                <h2><%: Title %></h2><hr />
                <div class="pull-right fadeInLeft animated">
                    <p class="pull-right text-warning">Your Gold Membership Expires: <asp:Literal ID="ltlGoldMembership" runat="server"></asp:Literal> &nbsp; <a runat="server" href="~/RenewSubscription.aspx">Renew</a> or <a runat="server" href="~/Donate.aspx">Donate <i class="fa fa-child"></i> </a></p>
                </div>
                <br />
                
                <div class="form-group">
                    Full Name:
                    <asp:TextBox ID="tbxFullName" runat="server" CssClass="form-control" MaxLength="150"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tbxFullName" CssClass="FormError" ErrorMessage="*Enter your full name" Display="Dynamic" SetFocusOnError="True"></asp:RequiredFieldValidator>
                </div>

                <div class="form-group">
                    Gender: 
                    <asp:DropDownList ID="ddlGender" runat="server" CssClass="form-control" DataSourceID="EntityDataSource1" DataTextField="Type" DataValueField="idGender"></asp:DropDownList>
                    <asp:EntityDataSource ID="EntityDataSource1" runat="server" ConnectionString="name=skillsforhireEntities" DefaultContainerName="skillsforhireEntities" EnableFlattening="False" EntitySetName="genders" OrderBy="it.[Type]">
                    </asp:EntityDataSource>
                </div>

                <span class="glyphicon glyphicon-info-sign"></span>FOR JOB SEEKERS: <em>Information provided below should be concise and accurate as it will advertise your capability and experience to people hiring. </em>
                <br />
                <!--Collapse CI-->
                <h4>Contact Details </h4>
                <div class="form-group">
                    Contact Number:
                    <asp:TextBox ID="tbxContactNumb" runat="server" CssClass="form-control" MaxLength="45" TextMode="Phone"></asp:TextBox>
                </div>

                <div class="form-group">
                    Email:
                    <asp:TextBox ID="tbxEmail" runat="server" CssClass="form-control" TextMode="Email"></asp:TextBox>
                </div>

                <!---->
                <div class="form-group">
                    <!--STATE OF RESIDENCE-->
                    State of Residence: <a class="pop-help" tabindex="0" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="State You Reside" data-content="Select the name of the State where you live e.g. Lagos"><span class="glyphicon glyphicon-question-sign"></span></a>
                    <asp:DropDownList ID="ddlState" runat="server" AutoPostBack="True" CssClass="form-control" DataSourceID="EntityDataSource2" DataTextField="StateName" DataValueField="idStateOfResidence" OnSelectedIndexChanged="ddlState_SelectedIndexChanged"></asp:DropDownList>
                    <asp:EntityDataSource ID="EntityDataSource2" runat="server" ConnectionString="name=skillsforhireEntities" DefaultContainerName="skillsforhireEntities" EnableFlattening="False" EntitySetName="stateofresidences" OrderBy="it.[StateName]">
                    </asp:EntityDataSource>
                </div>
                <div class="form-group">
                    Local Government of Residence:<a class="pop-help" tabindex="0" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="LGA You Reside" data-content="Select the name of the Local Government Area where you live e.g. Ikorodu"><span class="glyphicon glyphicon-question-sign"></span></a>
                    <asp:DropDownList ID="ddlLocalGovt" runat="server" CssClass="form-control" DataSourceID="EntityDataSource3" DataTextField="LGName" DataValueField="idLocalGovtOfResidence"></asp:DropDownList>
                    <asp:EntityDataSource ID="EntityDataSource3" runat="server" AutoGenerateWhereClause="True" ConnectionString="name=skillsforhireEntities" DefaultContainerName="skillsforhireEntities" EnableFlattening="False" EntitySetName="localgovtofresidences" Where="" EntityTypeFilter="" Select="" OrderBy="it.[LGName]">
                        <WhereParameters>
                            <asp:ControlParameter ControlID="ddlState" Name="StateId" PropertyName="SelectedValue" Type="Int32" />
                        </WhereParameters>
                    </asp:EntityDataSource>
                </div>
                <!--                           -->
                <div class="form-group">
                    City/Town/Village You Reside:<a class="pop-help" tabindex="0" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="City/Town/Village You Reside" data-content="Write the name of the City/Town/Village where you live e.g. Akure"><span class="glyphicon glyphicon-question-sign"></span></a>
                    <asp:TextBox ID="tbxTown" runat="server" CssClass="form-control"></asp:TextBox>
                </div>

                <!--Collapse Skills-->
                <%--<a class="btn btn-link" role="button" data-toggle="collapse" href="#collapseSkills" aria-expanded="false" aria-controls="collapseSkills">Update Your Skills</a>

                <div class="collapse" id="collapseSkills">--%>
                    <div class="well input-well">
                        <h4>Your Skills</h4>

                        <div class="form-group">
                            Profession: <a class="pop-help" tabindex="0" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="Your Profession" data-content="Select what you do as an occupation, trade, craft or activity e.g. Engineer or Hairdresser "><span class="glyphicon glyphicon-question-sign"></span></a>
                            <asp:DropDownList ID="ddlProfession" runat="server" CssClass="form-control" DataSourceID="EntityDataSource4" DataTextField="SkillType" DataValueField="idSkill"></asp:DropDownList>
                            <asp:EntityDataSource ID="EntityDataSource4" runat="server" ConnectionString="name=skillsforhireEntities" DefaultContainerName="skillsforhireEntities" EnableFlattening="False" EntitySetName="skills" OrderBy="it.[SkillType]">
                            </asp:EntityDataSource>
                        </div>
                        <div class="form-group">
                            Professional Speciality: <a class="pop-help" tabindex="0" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="Professional Speciality" data-content="Write the specific area(s) that you specialise e.g. an engineer may specialise in civil engineering"><span class="glyphicon glyphicon-question-sign"></span></a>
                            <asp:TextBox ID="tbxSpeciality" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            Highlight Work Experience: <a class="pop-help" tabindex="0" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="Highlight Work Experience" data-content="Write a concise summary of your work experience e.g. 1998-2003: I worked as a marketing executive at UBA"><span class="glyphicon glyphicon-question-sign"></span></a>
                            <asp:TextBox ID="tbxExperience" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            Qualifications: <a class="pop-help" tabindex="0" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="Qualifications" data-content="List relevant professional or vocational qualifications you have e.g. SSCE, BSc, Diploma, Cerificates"><span class="glyphicon glyphicon-question-sign"></span></a>
                            <asp:TextBox ID="tbxQualification" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            Note:<a class="pop-help" tabindex="0" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="Note" data-content="Write relevant information you want potential hirer to know e.g. working hours, upcoming vacation"><span class="glyphicon glyphicon-question-sign"></span></a>
                            <asp:TextBox ID="tbxNote" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                        </div>
                    </div>
                
                <%--</div>--%>
                <br />
                <!--Advanced-->
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <asp:Button ID="btnAdvanced" CssClass="btn btn-link" runat="server" Text="Advanced" OnClick="btnAdvanced_Click" />
                        <asp:Panel ID="pnlAdvanced" runat="server" Visible="false">
                            <div class="well input-well">
                                <div class="form-group">
                                    Publish My Profile:<a class="pop-help" tabindex="0" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="Advertise My Profile" data-content="ON - your profile will appear in search result. OFF - your profile will not appear in search result"><span class="glyphicon glyphicon-question-sign"></span></a>
                                    <br />
                                    <!--Checkbox stays here-->
                                    <asp:CheckBox ID="cbxPublish" runat="server" />
                                    
                                    <br />
                                    <asp:Button ID="btnChangePassword" CssClass="btn btn-link" runat="server" Text="Change Password" OnClick="btnChangePassword_Click" />
                                    <asp:Panel ID="pnlChangePassword" runat="server" Visible="false">
                                        <div>
                                        <asp:ChangePassword ID="ChangePassword1" runat="server" ContinueDestinationPageUrl="~/Default.aspx" CancelDestinationPageUrl="~/MyProfile.aspx">
                                            <ChangePasswordTemplate>
                                                <div class="form-horizontal">
                                                    <div class="form-group">
                                                        <br />
                                                        <p class="small">Change Your Password</p>
                                                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="FormError" ValidationGroup="ChangePassword1" />
                                                    </div>
                                                    <div class="form-group">
                                                        <asp:Label ID="CurrentPasswordLabel" runat="server" AssociatedControlID="CurrentPassword">Password:</asp:Label>
                                                        <asp:RequiredFieldValidator ID="CurrentPasswordRequired" runat="server" ControlToValidate="CurrentPassword" ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="ChangePassword1" CssClass="FormError">*</asp:RequiredFieldValidator>
                                                        <asp:TextBox ID="CurrentPassword" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
                                                    </div>
                                                    <div class="form-group">
                                                        <asp:Label ID="NewPasswordLabel" runat="server" AssociatedControlID="NewPassword">New Password:</asp:Label>
                                                        <asp:RequiredFieldValidator ID="NewPasswordRequired" runat="server" ControlToValidate="NewPassword" ErrorMessage="New Password is required." ToolTip="New Password is required." ValidationGroup="ChangePassword1" CssClass="FormError">*</asp:RequiredFieldValidator>
                                                        <asp:TextBox ID="NewPassword" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
                                                    </div>
                                                    <div class="form-group">
                                                        <asp:Label ID="ConfirmNewPasswordLabel" runat="server" AssociatedControlID="ConfirmNewPassword">Confirm New Password:</asp:Label>
                                                        <asp:RequiredFieldValidator ID="ConfirmNewPasswordRequired" runat="server" ControlToValidate="ConfirmNewPassword" ErrorMessage="Confirm New Password is required." ToolTip="Confirm New Password is required." ValidationGroup="ChangePassword1" CssClass="FormError">*</asp:RequiredFieldValidator>
                                                        <asp:CompareValidator ID="NewPasswordCompare" runat="server" ControlToCompare="NewPassword" ControlToValidate="ConfirmNewPassword" Display="Dynamic" ErrorMessage="The Confirm New Password must match the New Password entry." ValidationGroup="ChangePassword1" CssClass="FormError"></asp:CompareValidator>
                                                        <asp:TextBox ID="ConfirmNewPassword" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
                                                    </div>
                                                    <div class="form-group">
                                                        <p class="small FormError">
                                                            <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                                        </p>
                                                    </div>
                                                    <div class="btn-group">
                                                        <asp:Button ID="ChangePasswordPushButton" runat="server" CommandName="ChangePassword" Text="Change Password" ValidationGroup="ChangePassword1" CssClass="btn btn-default" />
                                                        <asp:Button ID="CancelPushButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-default" />
                                                    </div>
                                                </div>
                                            </ChangePasswordTemplate>
                                        </asp:ChangePassword>
                                    </div>
                                    </asp:Panel>
                                    <br />

                                    <asp:Button ID="btnAccDelRequest" runat="server" Text="Request Account Delete" CssClass="btn btn-link" OnClick="btnAccDelRequest_Click" />
                                    <asp:Panel ID="pnlAccDel" runat="server" Visible="False">
                                        Please provide reason why you are leaving:
                                    <asp:TextBox ID="tbxAccDelReason" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                                        <asp:Button ID="btnAccDelConfirmation" runat="server" Text="Submit" CssClass="btn btn-danger" OnClick="btnAccDelConfirmation_Click" />
                                    </asp:Panel>

                                </div>
                            </div>
                        </asp:Panel>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
                    <ProgressTemplate>
                        <div class="PleaseWait">Please wait...</div>
                    </ProgressTemplate>
                </asp:UpdateProgress>
                <br />
                <div>
                </div>
                <div class="form-group">
                    <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btn btn-default" OnClick="btnCancel_Click" data-toggle="tooltip" data-placement="top" title="Tooltip on top" />
                    <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn btn-default" OnClick="btnSave_Click" />
                </div>

            </div>
        </div>
    </div>
</asp:Content>

