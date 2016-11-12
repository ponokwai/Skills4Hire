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
    public partial class UserAccounts : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            GridView1.DataSource = Membership.GetAllUsers();
            GridView1.DataBind();
        }

        protected void btnDelMembership_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                if (Membership.GetUser(tbxUserName.Text) != null)
                {
                    string userName = tbxUserName.Text;
                    //Delete Job Postings
                    using (skillsforhireEntities myEntities = new skillsforhireEntities())
                    {
                        var jobPosts = from p in myEntities.jobprofiles
                                       where p.CreatedBy == userName
                                       select p;
                        if (jobPosts != null)
                        {
                            foreach (var jPost in jobPosts)
                            {
                                myEntities.jobprofiles.Remove(jPost);
                            }
                            myEntities.SaveChanges();
                        }
                    }

                    //Delete Profile
                    using (skillsforhireEntities myObjects = new skillsforhireEntities())
                    {
                        var ind = (from i in myObjects.indprofiles
                                   where i.UserName == userName
                                   select i).SingleOrDefault();
                        if (ind != null)
                        {
                            //send confirmation email
                            string fileName = Server.MapPath("~/App_Data/AccountDeleteConfirmation.txt");
                            string mailBody = File.ReadAllText(fileName);

                            mailBody = mailBody.Replace("##UserName##", ind.UserName);

                            MailMessage myMessage = new MailMessage();
                            myMessage.Subject = "Your www.skills4hire.com.ng Account is Deleted";
                            myMessage.Body = mailBody;

                            myMessage.From = new MailAddress(AppConfiguration.FromAccAddress, "Accounts");
                            myMessage.To.Add(new MailAddress(ind.EmailAddr));

                            SmtpClient mySmtpClient = new SmtpClient();
                            mySmtpClient.Send(myMessage);

                            //Remove user profile
                            myObjects.indprofiles.Remove(ind);                           
                        }
                        myObjects.SaveChanges();

                    }

                    //Delete user
                    Membership.DeleteUser(userName);
                    lblUserFeed.Text = "User Account deleted!";
                }
                else
                {
                    lblUserFeed.Text = "User Name not found";
                }
            }
        }

        protected void btnIsUserLocked_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                MembershipUser user = Membership.GetUser(tbxUserName.Text);
                if (user != null)
                {
                    lblUserFeed.Text = "Locked out value: " + user.IsLockedOut.ToString();
                }
                else
                {
                    lblUserFeed.Text = "User account was not found";
                }
            }
        }

        protected void btnUnlock_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                MembershipUser user = Membership.GetUser(tbxUserName.Text);
                if (user != null)
                {
                    user.UnlockUser();
                    lblUserFeed.Text = "User account is now unlocked";
                }
                else
                {
                    lblUserFeed.Text = "User account was not found";
                }
                
            }
        }

        
    }
}