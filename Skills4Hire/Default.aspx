<%@ Page Title="Home" Language="C#" MasterPageFile="~/Frontend.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Skills4Hire.oldDefault" MetaDescription="We enable people to post freelance jobs and find jobs. We also publish Tuesday Nigeria Guardian newspaper job adverts"
    MetaKeywords="people, to, people, joblisting, freelance, hiring, skilled, unskilled, get, jobs, employment, money, paid, career, guardian, newspaper, job, advert, nigeria" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FrontendContent" runat="server">
    <div class="default-body-content">
        <!--<div class="container-fluid frontend-Banner">-->
        <!--Carousel-->
        <div id="owl-demo" class="owl-carousel owl-theme">

            <div class="frontend-Banner item">
                <div class="container">
                    <div class="banner-icon">
                        <span class="glyphicon glyphicon-briefcase brand-icon"></span>
                        <br />
                        <span class="brand-website">skills4hire.com.ng</span>
                    </div>
                    <br />
                    <div class="banner-text">
                        <p>We are a people-2-people job listing website</p>
                        <a role="button" runat="server" href="~/Account/Login.aspx" class="btn btn-default">JOIN NOW!</a>
                    </div>
                </div>
            </div>
            <div class="frontend-Banner item">
                <div class="container">
                    <div class="banner-icon">
                        <span class="glyphicon glyphicon-briefcase brand-icon"></span>
                        <br />
                        <span class="brand-website">skills4hire.com.ng</span>
                    </div>
                    <br />
                    <div class="banner-text">
                        <p>You want to be contacted for jobs?</p>
                        <a role="button" runat="server" href="~/MyProfile.aspx" class="btn btn-default">CREATE A PROFILE!</a>
                    </div>
                </div>
            </div>
            <div class="frontend-Banner item">
                <div class="container">
                    <div class="banner-icon">
                        <span class="glyphicon glyphicon-briefcase brand-icon"></span>
                        <br />
                        <span class="brand-website">skills4hire.com.ng</span>
                    </div>
                    <br />
                    <div class="banner-text">
                        <p>You need people to do a job?</p>
                        <a role="button" runat="server" href="~/PostAJob.aspx" class="btn btn-default">POST IT!</a>
                    </div>
                </div>
            </div>
            <div class="frontend-Banner item">
                <div class="container">
                    <div class="banner-icon">
                        <span class="glyphicon glyphicon-briefcase brand-icon"></span>
                        <br />
                        <span class="brand-website">skills4hire.com.ng</span>
                    </div>
                    <br />
                    <div class="banner-text">
                        <p>Are you interested in Guardian newspaper jobs?</p>
                        <a role="button" runat="server" href="~/GuardianJobs.aspx" class="btn btn-default">VIEW IT!</a>
                    </div>
                </div>
            </div>
        </div>
        <br />
        <!-- /.carousel -->
        <!--</div>-->

        <!--SERVICES ZONE-->
        <div class="container">
            <div class="row features-row">
                <div class="col-md-3 col-sm-6 service-feature wow glideLeft">
                    <a runat="server" href="~/PostAJob.aspx" class="service-link">
                        <span class="fa fa-stack fa-4x">
                            <i class="fa fa-circle fa-stack-2x text-primary"></i>
                            <i class="fa fa-paper-plane-o fa-stack-1x fa-inverse"></i>
                        </span>
                        <h4 class="service-heading">POST NEW JOB</h4>
                        <p class="service-text">Post jobs you wish to hire people to do</p>
                    </a>
                </div>

                <div class="col-md-3 col-sm-6 service-feature wow glideLeft">
                    <a runat="server" href="~/FindPeople.aspx" class="service-link">
                        <span class="fa fa-stack fa-4x">
                            <i class="fa fa-circle fa-stack-2x text-primary"></i>
                            <i class="fa fa-users fa-stack-1x fa-inverse"></i>
                        </span>
                        <h4 class="service-heading">FIND PEOPLE</h4>
                        <p class="service-text">Filter through our database to find people with the right skills to hire</p>
                    </a>
                </div>

                <div class="col-md-3 col-sm-6 service-feature wow glideRight">
                    <a runat="server" href="~/FindJob.aspx" class="service-link">
                        <span class="fa fa-stack fa-4x">
                            <i class="fa fa-circle fa-stack-2x text-primary"></i>
                            <i class="fa fa-tasks fa-stack-1x fa-inverse"></i>
                        </span>
                        <h4 class="service-heading">FREELANCE JOBS</h4>
                        <p class="service-text">Find freelance jobs around you that are posted by website members</p>
                    </a>
                </div>

                <div class="col-md-3 col-sm-6 service-feature wow glideRight">
                    <a runat="server" href="~/GuardianJobs.aspx" class="service-link">
                        <span class="fa fa-stack fa-4x">
                            <i class="fa fa-circle fa-stack-2x text-primary"></i>
                            <i class="fa fa-newspaper-o fa-stack-1x fa-inverse"></i>
                        </span>
                        <h4 class="service-heading">GUARDIAN NEWSPAPER JOBS</h4>
                        <p class="service-text">Find jobs advertised in Tuesday Nigeria Guardian Newspaper</p>
                    </a>
                </div>
            </div>
        </div>
        <br />
        <!--/ SERVICES ZONE-->
    </div>

</asp:Content>
