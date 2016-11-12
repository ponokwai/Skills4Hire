<%@ Page Title="Guardian Job Details" Language="C#" MasterPageFile="~/Frontend.Master" AutoEventWireup="true" CodeBehind="GuardianJobDetails.aspx.cs" Inherits="Skills4Hire.GuardianJobDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FrontendContent" runat="server">
    <div class="body-content">
        <div class="container">
            <h2><%: Title %></h2>
            <div>
                <asp:FormView ID="FormView1" runat="server" DataKeyNames="Id" DataSourceID="EntityDataSource1" ItemType="Skills4Hire.guardianjob" OnDataBound="FormView1_DataBound">
                    <ItemTemplate>
                        <b>Job Title:</b>
                        <asp:Label ID="JobTitleLabel" runat="server" Text='<%# Bind("JobTitle") %>' />
                        <br />
                        <hr />
                        <b>Job Description:</b><br />
                        <asp:Label ID="JobDescriptionLabel" runat="server" Text='<%# Item.JobDescription.ToString().Replace(Environment.NewLine, "<br />") %>' />
                        <br />
                        <hr />
                        <b>Experience:</b><br />
                        <asp:Label ID="ExperienceLabel" runat="server" Text='<%# Item.Experience.ToString().Replace(Environment.NewLine, "<br />") %>' />
                        <br />
                        <hr />
                        <b>Qualification:</b><br />
                        <asp:Label ID="QualificationLabel" runat="server" Text='<%# Item.Qualification.ToString().Replace(Environment.NewLine, "<br />") %>' />
                        <br />
                        <hr />
                        <b>How To Apply:</b><br />
                        <asp:Label ID="HowToApplyLabel" runat="server" Text='<%# Item.HowToApply.ToString().Replace(Environment.NewLine, "<br />") %>' />
                        <br />
                        <hr />
                        <b>Publication Date:</b>
                        <asp:Label ID="PublicationDateLabel" runat="server" Text='<%# Bind("PublicationDate", "{0:dd/M/yyyy}") %>' />
                        <br />
                        <hr />
                        <b>Expiry Date:</b>
                        <asp:Label ID="ExpiryDateLabel" runat="server" Text='<%# Bind("ExpiryDate", "{0:dd/M/yyyy}") %>' />
                        <br />


                    </ItemTemplate>
                </asp:FormView>
                <asp:EntityDataSource ID="EntityDataSource1" runat="server" ConnectionString="name=skillsforhireEntities" DefaultContainerName="skillsforhireEntities" EnableFlattening="False" EntitySetName="guardianjobs" AutoGenerateWhereClause="True" EntityTypeFilter="" Select="" Where="">
                    <WhereParameters>
                        <asp:QueryStringParameter Name="Id" QueryStringField="JobId" Type="Int32" />
                    </WhereParameters>
                </asp:EntityDataSource>
            </div><hr />
            <p class="smallfont"><span class="glyphicon glyphicon-warning-sign text-danger"> </span> This job post is copied from the Nigeria Guardian newspaper. As with any job, please always apply due diligence in dealing with the other party.</P>
        </div>
    </div>
</asp:Content>
