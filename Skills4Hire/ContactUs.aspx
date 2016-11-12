<%@ Page Title="Contact Us" Language="C#" MasterPageFile="~/Frontend.Master" AutoEventWireup="true" CodeBehind="ContactUs.aspx.cs" Inherits="Skills4Hire.ContactUs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FrontendContent" runat="server">
    <div class="body-content">
        <div class="container">
        <div class="row">
            <div class="col-xs-12 text-center">
                <h2><%: Title %></h2>
            </div>
        </div>
        <br />

        <div class="row">
            <div class="col-md-4 wow glideLeft">
                <address>
                    MAIN OFFICE:
                    <br />
                    1 Izobo 2 Street<br />
                    Effurun<br />
                    Delta State<br />
                    Nigeria
                </address>


                <address>
                    <strong>Email:</strong> <br />
                    <a href="mailto:info@skills4hire.com.ng">info@skills4hire.com.ng</a>
                    <br />
                </address>
            </div>
            <div class="col-md-8 wow glideRight">
                <!-- Client Validation js -->
                <script type="text/javascript">
                    function validatePhoneAndEmail(source, args) {
                        var phoneNumber = document.getElementById('<%= txtYourNumber.ClientID %>');
                        var emailAddress = document.getElementById('<%= txtYourEmail.ClientID %>');
                        if (phoneNumber.value != '' || emailAddress.value != '') {
                            args.IsValid = true;
                        }
                        else {
                            args.IsValid = false;
                        }
                    }
                </script>

                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="FormError" HeaderText="Please correct the following errors:" />
                        <asp:Panel ID="ContactFormPanel" runat="server">
                            Name: 
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtYourName" CssClass="FormError" ErrorMessage="Enter your name" Display="Dynamic">*</asp:RequiredFieldValidator>
                            <asp:TextBox ID="txtYourName" runat="server" CssClass="form-control"></asp:TextBox>
                            Phone Number:
                        <asp:TextBox ID="txtYourNumber" runat="server" CssClass="form-control" TextMode="Phone"></asp:TextBox>
                            Email:
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtYourEmail" CssClass="FormError" ErrorMessage="Enter a valid email address" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic">*</asp:RegularExpressionValidator>
                            <asp:CustomValidator ID="CustomValidator1" runat="server" ClientValidationFunction="validatePhoneAndEmail" CssClass="FormError" Display="Dynamic" ErrorMessage="Enter your phone number or email address" OnServerValidate="CustomValidator1_ServerValidate">*</asp:CustomValidator>
                            <asp:TextBox ID="txtYourEmail" runat="server" CssClass="form-control" TextMode="Email"></asp:TextBox>
                            Comments:
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtYourComments" CssClass="FormError" ErrorMessage="Enter a comment" Display="Dynamic">*</asp:RequiredFieldValidator>
                            <asp:TextBox ID="txtYourComments" runat="server" TextMode="MultiLine" CssClass="form-control" ValidateRequestMode="Enabled"></asp:TextBox><br />
                            <asp:Button ID="Button1" runat="server" Text="Send" CssClass="btn btn-default" OnClick="Button1_Click" />
                        </asp:Panel>
                        <asp:Label ID="iMessage" runat="server" Text="Message Sent" CssClass="success text-center" Visible="false"></asp:Label>

                    </ContentTemplate>
                </asp:UpdatePanel>
                <asp:UpdateProgress ID="UpdateProgress1" runat="server">
                    <ProgressTemplate>
                        <div class="PleaseWait">
                            PleaseWait...
                        </div>
                    </ProgressTemplate>
                </asp:UpdateProgress>
            </div>
        </div>
    </div>
    </div>
</asp:Content>
