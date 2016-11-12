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
    public partial class ManageAccount : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnDelMembership_Click(object sender, EventArgs e)
        {
            lblUserFeed.Text = "";
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
                        if (jobPosts.Any())
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
                        var ind = from i in myObjects.indprofiles
                                  where i.UserName == userName
                                  select i;
                        if (ind.Any())
                        {
                            foreach (var itm in ind)
                            {
                                //remove indProfile
                                myObjects.indprofiles.Remove(itm);                                
                            }
                            myObjects.SaveChanges();
                            
                        }

                        //else
                        //{
                        //    lblUserFeed.Text = "User Name not found";
                        //}
                    }

                    //Delete Account
                    //Delete user
                    Membership.DeleteUser(userName);
                    lblUserFeed.Text = "User Account deleted!";
                }
            }
        }

        
    }
}