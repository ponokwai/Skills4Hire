using Skills4Hire.App_Code;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Skills4Hire.Management
{
    public partial class UserRoles : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                //load all roles
                clearAllFeedbackText();
                collAllRoles();
                loadAllRoles();

                cntExpGoldMemb(); //count expired Gold membership
                cntRenewedGoldMemb(); //count expired members to upgrade
            }
        }


        protected void btnAddRole_Click(object sender, EventArgs e)
        {
            createNewRole();
            collAllRoles();
            loadAllRoles();
        }

        protected void btnRemoveRole_Click(object sender, EventArgs e)
        {
            clearAllFeedbackText();
            removeRole();
            collAllRoles();
            loadAllRoles();
        }

        protected void btnFindUsersInRole_Click(object sender, EventArgs e)
        {
            clearAllFeedbackText();
            getUsersInRole();
        }
        protected void btnRemoveUsers_Click(object sender, EventArgs e)
        {
            clearAllFeedbackText();
            removeUsersInRole();
            getUsersInRole();
        }

        protected void btnAddUser_Click(object sender, EventArgs e)
        {
            if (ddlAllRoles.SelectedItem.Text != "Gold")
            {
                clearAllFeedbackText();
                addUserToRole();
                getUsersInRole();
            }
            else
            {
                lblRemoveUsersFeedback.Text = "'Manage user subscription' in User Subscriptions page, then click 'Bulk Config' Upgrade button on this page";
            }
            
        }


        //Methods to execute events above
        //Get all roles
        protected void collAllRoles()
        {
            lbxAllRoles.DataSource = Roles.GetAllRoles();
            lbxAllRoles.DataBind();
        }

        protected void loadAllRoles()
        {
            ddlAllRoles.DataSource = Roles.GetAllRoles();
            ddlAllRoles.DataBind();
        }

        //Create new role
        protected void createNewRole()
        {
            if (!Roles.RoleExists(tbxRole.Text))
            {
                Roles.CreateRole(tbxRole.Text);
                lblCreateRoleFeedback.Text = tbxRole.Text + " was added successfully";
                tbxRole.Text = "";
            }
            else
            {
                lblCreateRoleFeedback.Text = tbxRole.Text + " already exist";
            }
        }

        //Remove role
        protected void removeRole()
        {
            try
            {
                foreach (ListItem li in lbxAllRoles.Items)
                {
                    if (li.Selected == true)
                    {
                        Roles.DeleteRole(li.ToString(), true);
                        lblRemoveRoleFeedback.Text = li.ToString() + " was removed successfully";
                    }
                    else
                    {
                        lblRemoveRoleFeedback.Text = "Select a role";
                    }
                }
            }
            catch
            {
                lblRemoveRoleFeedback.Text = "An error has occured. Ensure no user is assigned to the role";
            }
            
        }

        //UsersInRole
        protected void getUsersInRole()
        {
            lbxUsersInRole.DataSource = Roles.GetUsersInRole(ddlAllRoles.SelectedItem.Text);
            lbxUsersInRole.DataBind();
        }

        protected void removeUsersInRole()
        {
            foreach (ListItem li in lbxUsersInRole.Items)
            {
                if (li.Selected == true)
                {
                    //Update indProfile table
                    string userName = li.Text;
                    using (skillsforhireEntities myEntities = new skillsforhireEntities())
                    {
                        var getUser = (from u in myEntities.indprofiles
                                       where u.UserName == userName
                                       select u).Single();
                        if (getUser != null)
                        {
                            getUser.IsGoldMember = false;
                        }
                        myEntities.SaveChanges();
                    }
                    //Update membership table
                    Roles.RemoveUserFromRole(li.ToString(), ddlAllRoles.SelectedItem.Text);
                    
                    
                }
            }
            
        }

        protected void addUserToRole()
        {
            try
            {
                if (!string.IsNullOrEmpty(tbxUserName.Text))
                {
                    Roles.AddUserToRole(tbxUserName.Text, ddlAllRoles.SelectedItem.Text);
                }
                else
                {
                    lblUsernameFeedback.Text = "Add a User Name";
                }
            }
            catch
            {
                lblUsernameFeedback.Text = "An error has occured. Ensure User Name is valid and case match";
            }
            tbxUserName.Text = "";
        }

        protected void clearAllFeedbackText()
        {
            lblUsernameFeedback.Text = "";
            lblRemoveUsersFeedback.Text = "";
            lblRemoveRoleFeedback.Text = "";
            lblCreateRoleFeedback.Text = "";
        }

        //Count expired Gold membership to downgrade
        protected void cntExpGoldMemb()
        {
            using (skillsforhireEntities myEntities = new skillsforhireEntities())
            {
                var expGold = (from ex in myEntities.indprofiles
                               where (ex.GoldSubExpire < DateTime.Now & ex.IsGoldMember == true)
                               select ex).Count();
                lblMemGoldExpired.Text = expGold.ToString();
            }
        }

        //Count renewed Gold membership to upgrade
        protected void cntRenewedGoldMemb()
        {
            using (skillsforhireEntities myEntities = new skillsforhireEntities())
            {
                var renewGold = (from nw in myEntities.indprofiles
                                 where (nw.GoldSubExpire > DateTime.Now & nw.IsGoldMember == false)
                                 select nw).Count();
                lblMemGoldRenew.Text = renewGold.ToString();
            }
        }

        protected void btnDowngrade_Click(object sender, EventArgs e)
        {
            try
            {
                using (skillsforhireEntities myEntities = new skillsforhireEntities())
                {
                    var expGold = from ex in myEntities.indprofiles
                                  where (ex.GoldSubExpire < DateTime.Now && ex.IsGoldMember == true)
                                  select ex;
                    if (expGold != null)
                    {
                        foreach (var exItm in expGold)
                        {
                            //Uncheck IsGoldMember
                            exItm.IsGoldMember = false;
                            //Remove membership
                            Roles.RemoveUserFromRole(exItm.UserName, "Gold");

                            //Send email advise
                            string fileName = Server.MapPath("~/App_Data/ExpiredGoldMembership.txt");
                            string mailBody = File.ReadAllText(fileName);

                            MailMessage myMessage = new MailMessage();
                            myMessage.Body = mailBody;
                            myMessage.Subject = "We have Extended Your Gold Membership Subscription";
                            myMessage.To.Add(new MailAddress(exItm.EmailAddr));
                            myMessage.From = new MailAddress(AppConfiguration.FromAccAddress, AppConfiguration.FromName);

                            SmtpClient mySmtpClient = new SmtpClient();
                            mySmtpClient.Send(myMessage);

                        }
                        myEntities.SaveChanges();
                    }
                }
                Response.Redirect("~/Management/UserRoles.aspx");
            }
            catch
            {
                lblDowngradeFeedback.Text = "An error has occured. Refresh the page and try again";
            }
        }

        protected void btnUpgrade_Click(object sender, EventArgs e)
        {
            try
            {
                using (skillsforhireEntities myEntities = new skillsforhireEntities())
                {
                    var renewGold = from nw in myEntities.indprofiles
                                    where (nw.GoldSubExpire > DateTime.Now && nw.IsGoldMember == false)
                                    select nw;
                    if (renewGold != null)
                    {
                        foreach (var renewItem in renewGold)
                        {
                            //Check IsGoldMember property
                            renewItem.IsGoldMember = true;
                            //Upgrade to Gold membership
                            Roles.AddUserToRole(renewItem.UserName, "Gold");
                        }
                        myEntities.SaveChanges();
                    }
                }
                Response.Redirect("~/Management/UserRoles.aspx");
            }
            catch
            {
                lblUpgradeFeedback.Text = "An error has occured. Refresh the page and try again";
            }
        }

    }
}