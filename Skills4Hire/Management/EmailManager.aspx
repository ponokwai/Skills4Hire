<%@ Page Title="E-mail Manager" Language="C#" MasterPageFile="~/Management/Management.Master" AutoEventWireup="true" CodeBehind="EmailManager.aspx.cs" Inherits="Skills4Hire.Management.EmailManager" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BackendContent" runat="server">
    <div class="body-content">
        <div class="container">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <asp:Panel ID="pnlSendMessage" runat="server">

                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="FormError" />
                        <br />
                        To:<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddlToGroup" CssClass="FormError" Display="Dynamic" ErrorMessage="Select a To group" InitialValue="-- Select Group --">*</asp:RequiredFieldValidator>
                        &nbsp;<asp:DropDownList ID="ddlToGroup" runat="server" CssClass="form-control">
                            <asp:ListItem>-- Select Group --</asp:ListItem>
                            <asp:ListItem Value="1">All Users</asp:ListItem>
                            <asp:ListItem Value="2">New Users</asp:ListItem>
                            <asp:ListItem Value="3">Expired Gold Users</asp:ListItem>
                            <asp:ListItem Value="4">NoProfession</asp:ListItem>
                        </asp:DropDownList>
                        Subject:<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="tbxSubject" CssClass="FormError" Display="Dynamic" ErrorMessage="Enter an email subject">*</asp:RequiredFieldValidator>
                        &nbsp;<asp:TextBox ID="tbxSubject" runat="server" CssClass="form-control"></asp:TextBox>
                        Body:<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="tbxBody" CssClass="FormError" Display="Dynamic" ErrorMessage="Enter a body">*</asp:RequiredFieldValidator>
                        &nbsp;<asp:TextBox ID="tbxBody" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox><br />
                        <div class="btn-group">
                            <asp:Button ID="Button1" runat="server" Text="Cancel" CssClass="btn btn-default" />
                            <asp:Button ID="btnSend" runat="server" Text="Send" CssClass="btn btn-success" OnClick="btnSend_Click" />
                        </div>

                    </asp:Panel>
                    <asp:Label ID="lblSendFeedback" runat="server" Visible="false"></asp:Label>
                </ContentTemplate>
            </asp:UpdatePanel>
            <asp:UpdateProgress ID="UpdateProgress1" runat="server">
                <ProgressTemplate>
                    <div class="PleaseWait">Please Wait...</div>
                </ProgressTemplate>
            </asp:UpdateProgress>
        </div>
    </div>
</asp:Content>
