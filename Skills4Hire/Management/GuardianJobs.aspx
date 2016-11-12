<%@ Page Title="Manage Guardian Jobs" Language="C#" MasterPageFile="~/Management/Management.Master" AutoEventWireup="true" CodeBehind="GuardianJobs.aspx.cs" Inherits="Skills4Hire.Management.GuardianJobs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BackendContent" runat="server">
    <div class="body-content">
        <h2><%: Title %></h2>
        <div class="container">
            <div class="row">
                <asp:ListView ID="ListView1" ViewStateMode="Disabled" runat="server" DataKeyNames="Id" DataSourceID="EntityDataSource1" GroupItemCount="3" InsertItemPosition="FirstItem" ItemType="Skills4Hire.guardianjob">

                    <EditItemTemplate>
                        <td runat="server" style="">
                            <b>Job Title:</b>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="JobTitleTextBox" ErrorMessage="Enter job title" SetFocusOnError="true" CssClass="FormError" Display="Dynamic" ValidationGroup="EditJob"></asp:RequiredFieldValidator>
                            <asp:TextBox ID="JobTitleTextBox" CssClass="form-control" runat="server" Text='<%# Bind("JobTitle") %>' />
                            <br />
                            <b>Job Description:</b>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="JobDescriptionTextBox" ErrorMessage="Enter job description" SetFocusOnError="true" CssClass="FormError" Display="Dynamic" ValidationGroup="EditJob"></asp:RequiredFieldValidator>
                            <asp:TextBox ID="JobDescriptionTextBox" CssClass="form-control" TextMode="MultiLine" runat="server" Text='<%# Bind("JobDescription") %>' />
                            <br />
                            <b>Experience:</b>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="ExperienceTextBox" ErrorMessage="Enter experience required" SetFocusOnError="true" CssClass="FormError" Display="Dynamic" ValidationGroup="EditJob"></asp:RequiredFieldValidator>
                            <asp:TextBox ID="ExperienceTextBox" TextMode="MultiLine" CssClass="form-control" runat="server" Text='<%# Bind("Experience") %>' />
                            <br />
                            <b>Qualification:</b>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="QualificationTextBox" ErrorMessage="Enter required qualification" SetFocusOnError="true" CssClass="FormError" Display="Dynamic" ValidationGroup="EditJob"></asp:RequiredFieldValidator>
                            <asp:TextBox ID="QualificationTextBox" TextMode="MultiLine" CssClass="form-control" runat="server" Text='<%# Bind("Qualification") %>' />
                            <br />
                            <b>How to Apply:</b>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="HowToApplyTextBox" ErrorMessage="Enter how to apply information" SetFocusOnError="true" CssClass="FormError" Display="Dynamic" ValidationGroup="EditJob"></asp:RequiredFieldValidator>
                            <asp:TextBox ID="HowToApplyTextBox" TextMode="MultiLine" CssClass="form-control" runat="server" Text='<%# Bind("HowToApply") %>' />
                            <br />
                            <b>Publication Date:</b>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="PublicationDateTextBox" ErrorMessage="Enter publication date" SetFocusOnError="true" CssClass="FormError" Display="Dynamic" ValidationGroup="EditJob"></asp:RequiredFieldValidator>
                            <asp:TextBox ID="PublicationDateTextBox" CssClass="form-control" runat="server" Text='<%# Bind("PublicationDate") %>' AutoPostBack="False" />
                            <br />
                            <b>Expiry Date:</b>
                            <asp:TextBox ID="ExpiryDateTextBox" CssClass="form-control" runat="server" Text='<%# Bind("ExpiryDate") %>' />
                            <br />
                            <asp:CheckBox ID="PublishCheckBox" runat="server" Checked='<%# Bind("Publish") %>' Text="Publish" />
                            <br />
                            <div class="btn-group">
                                <asp:Button ID="UpdateButton" CssClass="btn btn-link" runat="server" ValidationGroup="EditJob" CommandName="Update" Text="Update" />
                                <asp:Button ID="CancelButton" CssClass="btn btn-link" runat="server" CommandName="Cancel" Text="Cancel" />
                            </div>

                        </td>
                    </EditItemTemplate>
                    <EmptyDataTemplate>
                        <table runat="server" style="">
                            <tr>
                                <td>No data was returned.</td>
                            </tr>
                        </table>
                    </EmptyDataTemplate>
                    <EmptyItemTemplate>
                        <td runat="server" />
                    </EmptyItemTemplate>
                    <GroupTemplate>
                        <tr id="itemPlaceholderContainer" runat="server">
                            <td id="itemPlaceholder" runat="server"></td>
                        </tr>
                    </GroupTemplate>
                    <InsertItemTemplate>
                        <td runat="server" style="">
                            <b>Job Title:</b>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="JobTitleTextBox" ErrorMessage="Enter job title" SetFocusOnError="true" CssClass="FormError" Display="Dynamic" ValidationGroup="InsertJob"></asp:RequiredFieldValidator>
                            <asp:TextBox ID="JobTitleTextBox" CssClass="form-control" runat="server" Text='<%# Bind("JobTitle") %>' />
                            <br />
                            <b>Job Description:</b>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="JobDescriptionTextBox" ErrorMessage="Enter job description" SetFocusOnError="true" CssClass="FormError" Display="Dynamic" ValidationGroup="InsertJob"></asp:RequiredFieldValidator>
                            <asp:TextBox ID="JobDescriptionTextBox" CssClass="form-control" TextMode="MultiLine" runat="server" Text='<%# Bind("JobDescription") %>' />
                            <br />
                            <b>Experience:</b>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="ExperienceTextBox" ErrorMessage="Enter experience required" SetFocusOnError="true" CssClass="FormError" Display="Dynamic" ValidationGroup="InsertJob"></asp:RequiredFieldValidator>
                            <asp:TextBox ID="ExperienceTextBox" CssClass="form-control" TextMode="MultiLine" runat="server" Text='<%# Bind("Experience") %>' />
                            <br />
                            <b>Qualification:</b>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="QualificationTextBox" ErrorMessage="Enter required qualification" SetFocusOnError="true" CssClass="FormError" Display="Dynamic" ValidationGroup="InsertJob"></asp:RequiredFieldValidator>
                            <asp:TextBox ID="QualificationTextBox" CssClass="form-control" TextMode="MultiLine" runat="server" Text='<%# Bind("Qualification") %>' />
                            <br />
                            <b>How to Apply:</b>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="HowToApplyTextBox" ErrorMessage="Enter how to apply information" SetFocusOnError="true" CssClass="FormError" Display="Dynamic" ValidationGroup="InsertJob"></asp:RequiredFieldValidator>
                            <asp:TextBox ID="HowToApplyTextBox" CssClass="form-control" TextMode="MultiLine" runat="server" Text='<%# Bind("HowToApply") %>' />
                            <br />
                            <b>Publication Date:</b>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="PublicationDateTextBox" ErrorMessage="Enter Publication Date" SetFocusOnError="true" CssClass="FormError" Display="Dynamic" ValidationGroup="InsertJob"></asp:RequiredFieldValidator>
                            <asp:TextBox ID="PublicationDateTextBox" CssClass="form-control" TextMode="Date" runat="server" Text='<%# Bind("PublicationDate") %>' />
                            <br />
                            <b>Expiry Date:</b>
                            <asp:TextBox ID="ExpiryDateTextBox" CssClass="form-control" TextMode="Date" runat="server" Text='<%# Bind("ExpiryDate") %>' />
                            <br />
                            <asp:CheckBox ID="PublishCheckBox" runat="server" Checked='<%# Bind("Publish") %>' Text="Publish" />
                            <br />
                            <div class="btn-group">
                                <asp:Button ID="InsertButton" CssClass="btn btn-success" ValidationGroup="InsertJob" runat="server" CommandName="Insert" Text="Insert" />
                                <asp:Button ID="CancelButton" CssClass="btn btn-default" runat="server" CommandName="Cancel" Text="Clear" />
                            </div>
                        </td>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <td runat="server" style="">
                            <b>Job Title:</b><br />
                            <asp:Label ID="JobTitleLabel" runat="server" Text='<%# Eval("JobTitle") %>' />
                            <br />
                            <b>Job Description:</b><br />
                            <asp:Label ID="JobDescriptionLabel" runat="server" Text='<%# Item.JobDescription.ToString().Replace(Environment.NewLine, "<br />") %>' />
                            <br />
                            <b>Experience:</b><br />
                            <asp:Label ID="ExperienceLabel" runat="server" Text='<%# Item.Experience.ToString().Replace(Environment.NewLine, "<br />") %>' />
                            <br />
                            <b>Qualification:</b><br />
                            <asp:Label ID="QualificationLabel" runat="server" Text='<%# Item.Qualification.ToString().Replace(Environment.NewLine, "<br />") %>' />
                            <br />
                            <b>How to Apply:</b><br />
                            <asp:Label ID="HowToApplyLabel" runat="server" Text='<%# Item.HowToApply.ToString().Replace(Environment.NewLine, "<br />") %>' />
                            <br />
                            <b>Publication Date:</b>
                            <asp:Label ID="PublicationDateLabel" runat="server" Text='<%# Eval("PublicationDate") %>' />
                            <br />
                            <b>Expiry Date:</b>
                            <asp:Label ID="ExpiryDateLabel" runat="server" Text='<%# Eval("ExpiryDate") %>' />
                            <br />
                            <asp:CheckBox ID="PublishCheckBox" runat="server" Checked='<%# Eval("Publish") %>' Enabled="false" Text="Publish" />
                            <br />
                            <b>Edited By:</b>
                            <asp:Label ID="EditedByLabel" runat="server" Text='<%# Eval("EditedBy") %>' />
                            <br />
                            <b>Date-Time Edited:</b>
                            <asp:Label ID="DateTimeEditedLabel" runat="server" Text='<%# Eval("DateTimeEdited") %>' />
                            <br />
                            <div class="btn-group">
                                <asp:Button ID="DeleteButton" CssClass="btn btn-danger" runat="server" CommandName="Delete" Text="Delete" />
                                <asp:Button ID="EditButton" CssClass="btn btn-default" runat="server" CommandName="Edit" Text="Edit" />
                            </div><br />
                        </td>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <table runat="server">
                            <tr runat="server">
                                <td runat="server">
                                    <table id="groupPlaceholderContainer" runat="server" border="0" style="">
                                        <tr id="groupPlaceholder" runat="server">
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr runat="server">
                                <td runat="server" style="text-align: center">
                                    <asp:DataPager ID="DataPager1" runat="server" PageSize="12">
                                        <Fields>
                                            <asp:NextPreviousPagerField ButtonType="Button" ButtonCssClass="btn btn-link" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                            <asp:NumericPagerField />
                                            <asp:NextPreviousPagerField ButtonType="Button" ButtonCssClass="btn btn-link" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                        </Fields>
                                    </asp:DataPager>
                                </td>
                            </tr>
                        </table>
                    </LayoutTemplate>

                </asp:ListView>
                <asp:EntityDataSource ID="EntityDataSource1" runat="server" ConnectionString="name=skillsforhireEntities" DefaultContainerName="skillsforhireEntities" EnableDelete="True" EnableFlattening="False" EnableInsert="True" EnableUpdate="True" EntitySetName="guardianjobs" EntityTypeFilter="" OrderBy="it.[Id] DESC" Select="" OnInserting="EntityDataSource1_Inserting" OnUpdating="EntityDataSource1_Updating">
                </asp:EntityDataSource>
            </div>

            

        </div>
    </div>
</asp:Content>
