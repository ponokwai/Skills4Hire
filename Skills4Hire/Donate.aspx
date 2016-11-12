<%@ Page Title="Make Goodwill Donation" Language="C#" MasterPageFile="~/Frontend.Master" AutoEventWireup="true" CodeBehind="Donate.aspx.cs" Inherits="Skills4Hire.Donate" %>
<%@ OutputCache Duration="10800" VaryByParam="None" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FrontendContent" runat="server">
    <div class="body-content">
        <div class="container">
            <h2><%: Title %></h2>
            <hr />
            <div class="row">
                <a href="Donate.aspx">Donate.aspx</a>
                <div class="col-md-6 col-donate wow glideLeft">
                    <i class="fa fa-child icon-donate"></i>
                </div>
                <div class="col-md-6 wow glideRight">
                    <asp:UpdatePanel ID="uplDonate" runat="server">
                        <ContentTemplate>
                            <p class="lead text-success">
                                Thank you
                        <asp:LoginName ID="LoginName2" runat="server" />
                                &nbsp;for using our website and choosing to make a donation.
                            </p>
                            <p>Our intention is to create a FREE people-to-people job listing web application for Nigerians. However, we lack the resource to achieve this goal at the moment and will depend on goodwill donation from users.</p>
                            <p>Your willingness to make a donation that will help us maintain this website and improve services delights us.</p>
                            <p>We are commitment to annually publishing an account of all donations received.</p>
                            <p>Currently, we only accept bank payment option. Click on the button below and we will automatically email you our bank account details.</p>
                            <asp:Button ID="btnPaymentDetailRequest" runat="server" Text="Email Me Bank Details" CssClass="btn btn-success" OnClick="btnPaymentDetailRequest_Click" />
                            <asp:Label ID="lblFeedback" runat="server"></asp:Label>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <asp:UpdateProgress ID="UpdateProgress1" AssociatedUpdatePanelID="uplDonate" runat="server">
                        <ProgressTemplate>
                            <div class="PleaseWait">Please Wait...</div>
                        </ProgressTemplate>
                    </asp:UpdateProgress>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
