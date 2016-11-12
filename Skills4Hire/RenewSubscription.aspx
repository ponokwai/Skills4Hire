<%@ Page Title="Renew Subscription" Language="C#" MasterPageFile="~/Frontend.Master" AutoEventWireup="true" CodeBehind="RenewSubscription.aspx.cs" Inherits="Skills4Hire.RenewSubscription" %>
<%@ OutputCache Duration="10800" VaryByParam="None" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FrontendContent" runat="server">
    <div class="body-content">
        <div class="container">
            <h2><%: Title %></h2>
            <hr />
            <div class="row">
                <div class="col-md-6 col-donate wow glideLeft">
                    <i class="fa fa-dollar icon-donate"></i>
                </div>
                <div class="col-md-6 wow glideRight">
                    <asp:UpdatePanel ID="uplRenewSub" runat="server">
                        <ContentTemplate>
                            <p class="lead text-success">Hello
                                <asp:LoginName ID="LoginName2" runat="server" />
                            </p>
                            <p>Thank you for the decision to renew your annual Gold Membership subscription.</p>
                            <p>Your payment will be very helpful in maintaining our website and improving the service that we offer.&nbsp; </p>
                            <p>Our intention is to create a FREE people-to-people job listing web application for Nigerians. However, we lack the resource to achieve this goal now.</p>
                            <p>We currently only accept bank transfer/payment option. Click on the button below and we will automatically email you our bank account details.</p>
                            <p class="lead">Annual Gold Membership Subscription Amount is =N=300 Only</p>
                            <asp:Button ID="btnPaymentDetailRequest" runat="server" Text="Email Me Bank Detail" CssClass="btn btn-success" OnClick="btnPaymentDetailRequest_Click" />
                            <asp:Label ID="lblFeedback" runat="server"></asp:Label>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <asp:UpdateProgress ID="UpdateProgress1" AssociatedUpdatePanelID="uplRenewSub" runat="server">
                        <ProgressTemplate>
                            <div class="PleaseWait">Please Wait...</div>
                        </ProgressTemplate>
                    </asp:UpdateProgress>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
