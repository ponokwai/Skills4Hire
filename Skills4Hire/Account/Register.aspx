<%@ Page Title="Create New Account" Language="C#" MasterPageFile="~/Frontend.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Skills4Hire.Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FrontendContent" runat="server">
    <div class="body-content">
        <div class="container">
            <div class="row">
                <div class="col-md-4">
                    <asp:CreateUserWizard ID="CreateUserWizard1" runat="server" ContinueDestinationPageUrl="~/MyProfile.aspx" OnCreatedUser="CreateUserWizard1_CreatedUser">
                        <MailDefinition BodyFileName="~/App_Data/SignUpConfirmation.txt" Subject="Your New Account at www.skills4hire.com.ng" From="noreply@skills4hire.com.ng">
                        </MailDefinition>
                        <WizardSteps>
                            <asp:CreateUserWizardStep runat="server">
                                <ContentTemplate>
                                    <div class="form-horizontal">
                                        <div class="form-group">
                                            <h2>Sign Up for Your New Account</h2>
                                            <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="FormError" ValidationGroup="CreateUserWizard1" />
                                        </div>
                                        
                                        <div class="form-group">
                                            <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">User Name:</asp:Label>
                                            <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" ErrorMessage="User Name is required." ToolTip="User Name is required." ValidationGroup="CreateUserWizard1" CssClass="FormError">*</asp:RequiredFieldValidator>
                                            <asp:TextBox ID="UserName" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Password:</asp:Label>
                                            <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="CreateUserWizard1" CssClass="FormError">*</asp:RequiredFieldValidator>
                                            <asp:TextBox ID="Password" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <asp:Label ID="ConfirmPasswordLabel" runat="server" AssociatedControlID="ConfirmPassword">Confirm Password:</asp:Label>
                                            <asp:RequiredFieldValidator ID="ConfirmPasswordRequired" runat="server" ControlToValidate="ConfirmPassword" ErrorMessage="Confirm Password is required." ToolTip="Confirm Password is required." ValidationGroup="CreateUserWizard1" CssClass="FormError">*</asp:RequiredFieldValidator>
                                            <asp:TextBox ID="ConfirmPassword" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <asp:Label ID="EmailLabel" runat="server" AssociatedControlID="Email">E-mail:</asp:Label>
                                            <asp:RequiredFieldValidator ID="EmailRequired" runat="server" ControlToValidate="Email" ErrorMessage="E-mail is required." ToolTip="E-mail is required." ValidationGroup="CreateUserWizard1" CssClass="FormError">*</asp:RequiredFieldValidator>
                                            <asp:TextBox ID="Email" runat="server" CssClass="form-control" TextMode="Email"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <asp:CompareValidator ID="PasswordCompare" runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword" Display="Dynamic" ErrorMessage="The Password and Confirmation Password must match." ValidationGroup="CreateUserWizard1" CssClass="FormError"></asp:CompareValidator>
                                            <p class="small FormError">
                                                <asp:Literal ID="ErrorMessage" runat="server" EnableViewState="False"></asp:Literal>
                                            </p>
                                        </div>
                                    </div>

                                </ContentTemplate>
                            </asp:CreateUserWizardStep>
                            <asp:CompleteWizardStep runat="server">
                                <ContentTemplate>
                                    <table class="table table-responsive">
                                        <tr>
                                            <td>Complete</td>
                                        </tr>
                                        <tr>
                                            <td>Your account has been successfully created.
                                                <br />
                                                Click Continue to complete your profile.</td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Button ID="ContinueButton" CssClass="btn btn-default" runat="server" CausesValidation="False" CommandName="Continue" Text="Continue" ValidationGroup="CreateUserWizard1" />
                                            </td>
                                        </tr>
                                    </table>
                                </ContentTemplate>
                            </asp:CompleteWizardStep>
                        </WizardSteps>
                    </asp:CreateUserWizard>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
