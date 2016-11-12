<%@ Page Title="Create New or Edit Job Advert" Language="C#" MasterPageFile="~/Frontend.Master" AutoEventWireup="true" CodeBehind="PostAJob.aspx.cs" Inherits="Skills4Hire.PostAJob" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FrontendContent" runat="server">
    <div class="body-content">

        <div class="container">
            <!--client validation script-->
            <script type="text/javascript">
                function jdlength(source, args) {
                    var jd = document.getElementById('<%= tbxJobDescription.ClientID %>');
                            if (jd.value.length < 50) {
                                args.IsValid = false
                            }
                            else {
                                args.IsValid = true;
                            }
                        }
            </script>
            <script type="text/javascript">
                <!--client validation script-->
                function contactNumEmail(source, args) {
                    var txtNumb = document.getElementById('<%= tbxContactNumb.ClientID %>');
                    var txtEmail = document.getElementById('<%= tbxEmail.ClientID %>');
                    if (txtNumb.value != "" || txtEmail.value != "")
                    {
                        args.IsValid = true
                    }
                    else
                    {
                        args.IsValid = false;
                    }
                }
            </script>
            <div class="jobPost">
                <h2>
                    <asp:Literal ID="ltlNew" Text="Create New Job Advert" runat="server"></asp:Literal><asp:Literal ID="ltlEdit" runat="server"></asp:Literal></h2>
                <p>Use this form to advertise freelance job you wish to hire someone to do e.g. hire a plumber or an engineer. When posted, job seekers will contact you to make a quote.</p>
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="FormError" />
                <br />

                <div class="form-group">
                    What is the job appropriate status:
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="ddlJobStatus" CssClass="FormError" Display="Dynamic" ErrorMessage="Select appropriate job status" InitialValue="3" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                    &nbsp;<a class="pop-help" tabindex="0" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="Job Appropriate Status" data-content="Select if you are ready to hire someone now or if you are planning and budgeting"><span class="glyphicon glyphicon-question-sign"></span></a>
                    &nbsp;<asp:DropDownList ID="ddlJobStatus" runat="server" CssClass="form-control" DataSourceID="EntityDataSource1" DataTextField="ToStart" DataValueField="idJobStatus"></asp:DropDownList>
                    <asp:EntityDataSource ID="EntityDataSource1" runat="server" ConnectionString="name=skillsforhireEntities" DefaultContainerName="skillsforhireEntities" EnableFlattening="False" EntitySetName="jobstatus" OrderBy="it.[ToStart]">
                    </asp:EntityDataSource>
                </div>

                <div class="form-group">
                    When does the job start:<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="ddlStartTime" CssClass="FormError" Display="Dynamic" ErrorMessage="Select when the job will start" InitialValue="1" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                    &nbsp;<a class="pop-help" tabindex="0" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="Job Start Time" data-content="Select when you plan to start the job"><span class="glyphicon glyphicon-question-sign"></span></a>
                    <asp:DropDownList ID="ddlStartTime" runat="server" CssClass="form-control" DataSourceID="EntityDataSource2" DataTextField="JobStartTime" DataValueField="idStartTime">
                    </asp:DropDownList>
                    <asp:EntityDataSource ID="EntityDataSource2" runat="server" ConnectionString="name=skillsforhireEntities" DefaultContainerName="skillsforhireEntities" EnableFlattening="False" EntitySetName="starttimes">
                    </asp:EntityDataSource>
                </div>


                <div class="form-group">
                    What state is the job located:<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddlJobLocState" CssClass="FormError" Display="Dynamic" ErrorMessage="Select state and local government that the job is located" InitialValue="38" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                    &nbsp;<a class="pop-help" tabindex="0" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="State that the job is located" data-content="Select the state where the job will be done e.g. Lagos"><span class="glyphicon glyphicon-question-sign"></span></a>
                    &nbsp;<asp:DropDownList ID="ddlJobLocState" runat="server" CssClass="form-control" AutoPostBack="True" DataSourceID="EntityDataSource3" DataTextField="StateName" DataValueField="idStateOfResidence">
                    </asp:DropDownList>
                    <asp:EntityDataSource ID="EntityDataSource3" runat="server" ConnectionString="name=skillsforhireEntities" DefaultContainerName="skillsforhireEntities" EnableFlattening="False" EntitySetName="stateofresidences" OrderBy="it.[StateName]">
                    </asp:EntityDataSource>
                </div>


                <div class="form-group">
                    What local government is the job located:
                            &nbsp;<a class="pop-help" tabindex="0" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="LG that the job is located" data-content="Select the name of the local government where the job will be done e.g. Badagry"><span class="glyphicon glyphicon-question-sign"></span></a>
                    <asp:DropDownList ID="ddlJobLocLG" runat="server" CssClass="form-control" DataSourceID="EntityDataSource4" DataTextField="LGName" DataValueField="idLocalGovtOfResidence">
                    </asp:DropDownList>
                    <asp:EntityDataSource ID="EntityDataSource4" runat="server" AutoGenerateWhereClause="True" ConnectionString="name=skillsforhireEntities" DefaultContainerName="skillsforhireEntities" EnableFlattening="False" EntitySetName="localgovtofresidences" Where="" OrderBy="it.[LGName]">
                        <WhereParameters>
                            <asp:ControlParameter ControlID="ddlJobLocState" Name="StateId" PropertyName="SelectedValue" Type="Int32" />
                        </WhereParameters>
                    </asp:EntityDataSource>
                </div>


                <div class="form-group">
                    What city/town/village is the job located:<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="tbxJobLocTown" CssClass="FormError" Display="Dynamic" ErrorMessage="Enter city/town/village job is located" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                    <a class="pop-help" tabindex="0" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="City/Town/Village that the job is located" data-content="Enter the name of the City/Town/Village where the job will be done e.g. Benin City"><span class="glyphicon glyphicon-question-sign"></span></a>
                    &nbsp;<asp:TextBox ID="tbxJobLocTown" runat="server" CssClass="form-control"></asp:TextBox>
                </div>


                <div class="form-group">
                    What professional do you require:<asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="ddlSkill" CssClass="FormError" Display="Dynamic" ErrorMessage="Select the profession you wish to hire" InitialValue="78" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                    &nbsp;<a class="pop-help" tabindex="0" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="Professional you require" data-content="Select the professional or tradesman you need for the job e.g. teacher"><span class="glyphicon glyphicon-question-sign"></span></a>
                    &nbsp;<asp:DropDownList ID="ddlSkill" runat="server" CssClass="form-control" DataSourceID="EntityDataSource5" DataTextField="SkillType" DataValueField="idSkill">
                    </asp:DropDownList>
                    <asp:EntityDataSource ID="EntityDataSource5" runat="server" ConnectionString="name=skillsforhireEntities" DefaultContainerName="skillsforhireEntities" EnableFlattening="False" EntitySetName="skills" OrderBy="it.[SkillType]">
                    </asp:EntityDataSource>
                </div>


                <div class="form-group">
                    What specialisation should the person have:
                            <a class="pop-help" tabindex="0" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="Specialisation" data-content="Enter the specialisation you want the professional or tradesman to have e.g. biology teacher"><span class="glyphicon glyphicon-question-sign"></span></a>
                    <asp:TextBox ID="tbxSkillSpecific" runat="server" CssClass="form-control"></asp:TextBox>
                </div>


                <div class="form-group">
                    What is the job title:<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="tbxJobTitle" CssClass="FormError" Display="Dynamic" ErrorMessage="Enter job title" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                    &nbsp;<a class="pop-help" tabindex="0" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="Job Title" data-content="Enter a job title e.g. diesel generator mechanic for hire"><span class="glyphicon glyphicon-question-sign"></span></a>
                    &nbsp;<asp:TextBox ID="tbxJobTitle" runat="server" CssClass="form-control"></asp:TextBox>
                </div>


                <div class="form-group">
                    Describe the job:<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="tbxJobDescription" CssClass="FormError" Display="Dynamic" ErrorMessage="Enter job description" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                    <asp:CustomValidator ID="CustomValidator1" runat="server" ClientValidationFunction="jdlength" ControlToValidate="tbxJobDescription" CssClass="FormError" Display="Dynamic" ErrorMessage="Enter minimum of 50 characters" OnServerValidate="CustomValidator1_ServerValidate" SetFocusOnError="True">*</asp:CustomValidator>
                    &nbsp;<a class="pop-help" tabindex="0" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="Job Description" data-content="Enter concise information about the job, working condition, job duration etc"><span class="glyphicon glyphicon-question-sign"></span></a>
                    &nbsp;<asp:TextBox ID="tbxJobDescription" placeholder="Minimum of 50 characters" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                </div>


                <div class="form-group">
                    What is your budget:<asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="ddlBudget" CssClass="FormError" Display="Dynamic" ErrorMessage="Select the job budget" InitialValue="1" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                    <a class="pop-help" tabindex="0" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="Your Budget" data-content="Select a realistic budget range you have to execute the job"><span class="glyphicon glyphicon-question-sign"></span></a>
                    &nbsp;<asp:DropDownList ID="ddlBudget" runat="server" CssClass="form-control" DataSourceID="EntityDataSource6" DataTextField="EstBudget" DataValueField="idBudget">
                    </asp:DropDownList>
                    <asp:EntityDataSource ID="EntityDataSource6" runat="server" ConnectionString="name=skillsforhireEntities" DefaultContainerName="skillsforhireEntities" EnableFlattening="False" EntitySetName="budgets">
                    </asp:EntityDataSource>
                </div>
                <div class="form-group">
                    How long should this job be advertised:<asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="ddlAdvertDuration" CssClass="FormError" Display="Dynamic" ErrorMessage="Select how long this job should be advertised" InitialValue="0" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                    &nbsp;<a class="pop-help" tabindex="0" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="Job Advert Duration" data-content="Select for how long you want the job advertised. Note: from your profile you can change this in the future"><span class="glyphicon glyphicon-question-sign"></span></a>
                    <asp:DropDownList ID="ddlAdvertDuration" runat="server" CssClass="form-control">
                        <asp:ListItem Value="0">-- Select Duration --</asp:ListItem>
                        <asp:ListItem Value="1">1 Day</asp:ListItem>
                        <asp:ListItem Value="2">2 Days</asp:ListItem>
                        <asp:ListItem Value="3">3 Days</asp:ListItem>
                        <asp:ListItem Value="4">4 Days</asp:ListItem>
                        <asp:ListItem Value="5">5 Days</asp:ListItem>
                        <asp:ListItem Value="6">6 Days</asp:ListItem>
                        <asp:ListItem Value="7">1 Week</asp:ListItem>
                        <asp:ListItem Value="2">2 Weeks</asp:ListItem>
                        <asp:ListItem Value="3">3 Weeks</asp:ListItem>
                        <asp:ListItem Value="4">4 Weeks</asp:ListItem>
                    </asp:DropDownList>
                </div>

                <div class="content-heading">
                    <h4>We need correct contact details so our professionals can contact you to make a quote - please answer their calls or emails</h4>
                </div>

                <div class="form-group">
                    Full Name:<asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="tbxFullName" CssClass="FormError" Display="Dynamic" ErrorMessage="Enter your name" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                    &nbsp;<asp:TextBox ID="tbxFullName" runat="server" CssClass="form-control"></asp:TextBox>
                </div>


                <div class="form-group">
                    Contact Number:<asp:CustomValidator ID="CustomValidator2" runat="server" ErrorMessage="Enter contact number or email address" ClientValidationFunction="contactNumEmail" CssClass="FormError" Display="Dynamic" OnServerValidate="CustomValidator2_ServerValidate">*</asp:CustomValidator>
                    &nbsp;<asp:TextBox ID="tbxContactNumb" runat="server" CssClass="form-control" TextMode="Phone"></asp:TextBox>
                </div>


                <div class="form-group">
                    Email Address:
                    &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="tbxEmail" CssClass="FormError" Display="Dynamic" ErrorMessage="Enter a valid email address" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator>
                    <asp:TextBox ID="tbxEmail" runat="server" CssClass="form-control" TextMode="Email"></asp:TextBox>
                </div>


                <div class="form-group">
                    Publish job advert:<a class="pop-help" tabindex="0" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="Publish Job Advert" data-content="Checked = Publish job advert; Unchecked = Unpublish job advert"><span class="glyphicon glyphicon-question-sign"></span></a>
                    <br />
                    <asp:CheckBox ID="cbxPublicise" runat="server" Checked="true" /><br />
                    <br />
                </div>

                <div class="btn-group">
                    <a class="btn btn-default" href='javascript:history.go(-1)'>Cancel</a>
                    <asp:Button ID="btnPost" runat="server" Text="Submit" CssClass="btn btn-default" OnClick="btnPost_Click" />
                </div>

            </div>
        </div><br />

        <asp:UpdateProgress ID="UpdateProgress1" runat="server">
            <ProgressTemplate>
                please wait...
            </ProgressTemplate>
        </asp:UpdateProgress>
    </div>

</asp:Content>
