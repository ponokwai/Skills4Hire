<%@ Page Title="All Jobs" Language="C#" MasterPageFile="~/Management/Management.Master" AutoEventWireup="true" CodeBehind="AllJobs.aspx.cs" Inherits="Skills4Hire.FindJob" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BackendContent" runat="server">
    <div class="body-content">
        <div class="container">
            <h4>Filter Result</h4>
            <div class="content-filter well">
                <div class="row">
                    <div class="col-sm-4">
                        Profession:
                        <asp:DropDownList ID="ddlProfFilter" runat="server" CssClass="form-control" DataSourceID="EntityDataSource2" DataTextField="SkillType" DataValueField="idSkill"></asp:DropDownList>
                        <asp:EntityDataSource ID="EntityDataSource2" runat="server" ConnectionString="name=skillsforhireEntities" DefaultContainerName="skillsforhireEntities" EnableFlattening="False" EntitySetName="skills" OrderBy="it.[SkillType]">
                        </asp:EntityDataSource>
                    </div>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <div class="col-sm-4">
                                State:
                                <asp:DropDownList ID="ddlStateFilter" runat="server" CssClass="form-control" AutoPostBack="True" DataSourceID="EntityDataSource3" DataTextField="StateName" DataValueField="idStateOfResidence"></asp:DropDownList>
                                <asp:EntityDataSource ID="EntityDataSource3" runat="server" ConnectionString="name=skillsforhireEntities" DefaultContainerName="skillsforhireEntities" EnableFlattening="False" EntitySetName="stateofresidences" OrderBy="it.[StateName]">
                                </asp:EntityDataSource>
                            </div>
                            <div class="col-sm-4">
                                Local Government:
                                <asp:ListBox ID="lbxLGFilter" runat="server" CssClass="form-control" DataSourceID="EntityDataSource4" DataTextField="LGName" DataValueField="idLocalGovtOfResidence"></asp:ListBox>
                                <asp:EntityDataSource ID="EntityDataSource4" runat="server" AutoGenerateWhereClause="True" ConnectionString="name=skillsforhireEntities" DefaultContainerName="skillsforhireEntities" EnableFlattening="False" EntitySetName="localgovtofresidences" OrderBy="it.[LGName]" Where="">
                                    <WhereParameters>
                                        <asp:ControlParameter ControlID="ddlStateFilter" Name="StateId" PropertyName="SelectedValue" Type="Int32" />
                                    </WhereParameters>
                                </asp:EntityDataSource>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>


                </div>
                <br />
                <div class="row">
                    <div class="col-sm-4">
                        <asp:CheckBox ID="cbxPublicised" CssClass="checkbox-inline" runat="server" Text="Publicised Jobs" />
                    </div>
                    <div class="col-sm-4">
                        <asp:CheckBox ID="cbxExpired" CssClass="checkbox-inline" runat="server" Text="Expired Posts" />
                    </div>
                </div>
                <div class="row">
                    <asp:Button ID="btnClearFilter" runat="server" Text="Clear" CssClass="btn btn-default" OnClick="btnClearFilter_Click" />&nbsp;
                    <asp:Button ID="btnFilter" runat="server" Text="Filter" CssClass="btn btn-default" OnClick="btnFilter_Click" />
                </div>
            </div>
        </div>
        <div class="container">
            <h2><%: Title %></h2>
            <asp:GridView ID="GridView1" ViewStateMode="Disabled" runat="server" AutoGenerateColumns="False" DataKeyNames="idJobProfile" DataSourceID="EntityDataSource1" AllowPaging="True" AllowSorting="True" ItemType="Skills4Hire.jobprofile" CssClass="mgt-table table table-responsive" GridLines="None" CellPadding="4" ForeColor="#333333">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>

                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:CheckBox ID="cbxSelect" runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="idJobProfile" HeaderText="Job Id" ReadOnly="True" SortExpression="idJobProfile" />
                    <asp:HyperLinkField DataNavigateUrlFields="idJobProfile" DataNavigateUrlFormatString="ReviewJobPost.aspx?JobId={0}" DataTextField="JobTitle" HeaderText="Job Title" SortExpression="JobTitle" />
                    <asp:TemplateField HeaderText="Job Status" SortExpression="JobStatusId">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Item.jobstatu.ToStart %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Start Time" SortExpression="StartTimeId">
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Item.starttime.JobStartTime %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="State" SortExpression="JobLocationStateId">
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Item.stateofresidence.StateName %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Local Govt." SortExpression="JobLocationLGId">
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Item.localgovtofresidence.LGName %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="JobLocationTown" HeaderText="Place" SortExpression="JobLocationTown" />
                    <asp:TemplateField HeaderText="Profession" SortExpression="SkillId">
                        <ItemTemplate>
                            <asp:Label ID="Label5" runat="server" Text='<%# Item.skill.SkillType %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="SpecificSkill" HeaderText="Specialisation" SortExpression="SpecificSkill" />
                    <asp:TemplateField HeaderText="Budget" SortExpression="BudgetId">
                        <ItemTemplate>
                            <asp:Label ID="Label6" runat="server" Text='<%# Item.budget.EstBudget %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="ContactFullName" HeaderText="Contact Name" SortExpression="ContactFullName" />
                    <asp:BoundField DataField="ContactNumber" HeaderText="Contact No." SortExpression="ContactNumber" />
                    <asp:BoundField DataField="ContactEmail" HeaderText="Contact Email" SortExpression="ContactEmail" />
                    <asp:BoundField DataField="ExpiryDate" HeaderText="Expiry Date" SortExpression="ExpiryDate" DataFormatString="{0:d}" />
                    <asp:BoundField DataField="CreatedBy" HeaderText="Created By" SortExpression="CreatedBy" />
                    <asp:BoundField DataField="DateCreated" HeaderText="DateTime Created" SortExpression="DateCreated" />
                    <asp:BoundField DataField="LastModified" HeaderText="DateTime Modified" SortExpression="LastModified" />
                    <asp:BoundField DataField="LastModifiedBy" HeaderText="Modified By" SortExpression="LastModifiedBy" />
                    <asp:CheckBoxField DataField="Publicise" HeaderText="Published" SortExpression="Publicise" />
                </Columns>
                <EditRowStyle BackColor="#999999" />
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
            </asp:GridView>
            <asp:EntityDataSource ID="EntityDataSource1" runat="server" ConnectionString="name=skillsforhireEntities" DefaultContainerName="skillsforhireEntities" EnableDelete="True" EnableFlattening="False" EntitySetName="jobprofiles" Include="budget, starttime, jobstatu, skill, stateofresidence, localgovtofresidence" AutoGenerateWhereClause="True" EntityTypeFilter="" Select="" Where="">
            </asp:EntityDataSource>
            <asp:Button ID="btnDeleteMultipleRows" runat="server" Text="Delete Row(s)" CssClass="btn btn-default" OnClick="btnDeleteMultipleRows_Click" />
            &nbsp;
        </div>
        <div class="container">
            <h3 class="text-center">Quick Data Clean-up</h3>
            <div class="row">
                <div class="col-md-6">
                    There are
                    <asp:Literal ID="ltlExpired" runat="server"></asp:Literal>
                    &nbsp;publicised expired posts<br />
                    <br />
                    Unpublish expired posts:<br />
                    &nbsp;<asp:Button ID="btnUnpublishExpired" runat="server" Text="Unpublish" CssClass="btn btn-default" OnClick="btnUnpublishExpired_Click" />
                </div>
                <div class="col-md-6">
                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                        <ContentTemplate>
                            Delete posts that expired beyond:
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddlDeleteBeyond" CssClass="FormError" Display="Dynamic" ErrorMessage="Select delete duration" InitialValue="-- Select Duration --"></asp:RequiredFieldValidator>
                            <asp:DropDownList ID="ddlDeleteBeyond" runat="server" AutoPostBack="True" CssClass="form-control" OnTextChanged="ddlDeleteBeyond_TextChanged">
                                <asp:ListItem Value="-- Select Duration --">-- Select Duration --</asp:ListItem>
                                <asp:ListItem Value="-30">1 Month</asp:ListItem>
                                <asp:ListItem Value="-14">2 Weeks</asp:ListItem>
                                <asp:ListItem Value="-7">1 Week</asp:ListItem>
                            </asp:DropDownList>
                            <asp:Literal ID="ltlDeleteBeyond" runat="server" Text="0"></asp:Literal>
                            &nbsp;posts will be deleted<br />
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <asp:Button ID="btnDelExpired" runat="server" CssClass="btn btn-default" OnClick="btnDelExpired_Click" Text="Delete Expired Posts" />

                </div>
            </div>
        </div>
    </div>
</asp:Content>
