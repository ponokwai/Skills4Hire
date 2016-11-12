using System;
using System.Collections.Generic;
using System.IO;
using System.Net.Mail;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Skills4Hire.App_Code;

namespace Skills4Hire.Management
{
    public partial class UserSubscriptions : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            clrLabel(); //clear labels
            countAffectedMembers();
        }

        protected void btnUpdateAllUsers_Click(object sender, EventArgs e)
        {
            clrLabel(); //clear labels
            lblAllUsersFeedback.Text = "";
            if (ddlAllUsers.SelectedValue != "0" && ddlExpiryRange.SelectedValue != "-- Select Expiry Duration --")
            {
                //Months to be given
                int myMonths = Convert.ToInt32(ddlAllUsers.SelectedValue);
                DateTime addMonths = DateTime.Now.AddMonths(myMonths);

                //Filter people to give addional membership
                int timeRangeVal = Convert.ToInt32(ddlExpiryRange.SelectedValue);
                DateTime timeMark = DateTime.Now.AddMonths(timeRangeVal);

                using (skillsforhireEntities myEntities = new skillsforhireEntities())
                {
                    var AllUsers = from u in myEntities.indprofiles
                                   where u.GoldSubExpire < timeMark
                                   select u;
                    foreach (var itm in AllUsers)
                    {
                        //Extend Gold membership
                        itm.GoldSubExpire = addMonths;

                        //Send email notification of renewed Gold membership
                        
                        string fileName = Server.MapPath("~/App_Data/ExtendGoldMembership.txt");
                        string mailBody = File.ReadAllText(fileName);

                        mailBody = mailBody.Replace("##Time##", myMonths.ToString());

                        MailMessage myMailMessage = new MailMessage();
                        myMailMessage.Body = mailBody;
                        myMailMessage.Subject = "We have Extended Your Gold Membership Subscription";
                        myMailMessage.To.Add(new MailAddress(itm.EmailAddr));
                        myMailMessage.From = new MailAddress(AppConfiguration.FromAccAddress, AppConfiguration.FromName);

                        SmtpClient mySmtpClient = new SmtpClient();
                        mySmtpClient.Send(myMailMessage);
                        
                    }
                    myEntities.SaveChanges();
                    lblAllUsersFeedback.Text = "Completed";
                }
            }
            else
            {
                lblAllUsersFeedback.Text = "Select Months to Give and Expiry Time Range";
            }
        }

        protected void btnFind_Click(object sender, EventArgs e)
        {
            clrLabel(); //clear labels
            
            if (!string.IsNullOrEmpty(tbxUserName.Text))
            {
                using (skillsforhireEntities myEntities = new skillsforhireEntities())
                {
                    var findUser = (from k in myEntities.indprofiles
                                    where k.UserName == tbxUserName.Text
                                    select k.GoldSubExpire).Single();
                    if (findUser.Value != null)
                    {
                        lblGoldExpiryInfo.Text = findUser.ToString();
                    }
                    else
                    {
                        lblGoldExpiryInfo.Text = "No information found";
                    }
                }
            }
            else
            {
                lblGoldExpiryInfo.Text = "Enter a valid User Name";
            }
                
        }

        protected void btnUpdateAUser_Click(object sender, EventArgs e)
        {
            clrLabel(); //clear labels
            try
            {
                if (!string.IsNullOrEmpty(tbxUserName.Text) && !string.IsNullOrEmpty(tbxNewExpDate.Text))
                {
                    DateTime nwexpDate = Convert.ToDateTime(tbxNewExpDate.Text);
                    string uName = tbxUserName.Text;

                    using (skillsforhireEntities myEntities = new skillsforhireEntities())
                    {
                        var fdUser = (from k in myEntities.indprofiles
                                      where k.UserName == uName
                                      select k).Single();
                        if (fdUser != null)
                        {
                            fdUser.GoldSubExpire = nwexpDate;
                            myEntities.SaveChanges();
                            lblGoldUpdateInfo.Text = "Update was successful";
                        }
                        else
                        {
                            lblGoldUpdateInfo.Text = "No user information was found";
                        }
                    }
                }
                else
                {
                    lblGoldUpdateInfo.Text = "User Name and New Expiry Date fields cannot be left empty";
                }
            }
            catch
            {
                lblGoldUpdateInfo.Text = "An error has occured. Please confirm the values entered";
            }
        }

        //Clear all label text
        protected void clrLabel()
        {
            lblGoldUpdateInfo.Text = "";
            lblGoldExpiryInfo.Text = "";
            lblAllUsersFeedback.Text = "";
        }

        protected void countAffectedMembers()
        {
            if (ddlExpiryRange.SelectedValue != "-- Select Expiry Duration --")
            {
                int timeRangeVal = Convert.ToInt32(ddlExpiryRange.SelectedValue);
                DateTime timeMark = DateTime.Now.AddMonths(timeRangeVal);

                using (skillsforhireEntities myEntities = new skillsforhireEntities())
                {
                    var AllUsers = (from u in myEntities.indprofiles
                                    where u.GoldSubExpire < timeMark
                                    select u).Count();
                    lblAllUsersFeedback.Text = AllUsers.ToString() + " affected";
                }
            }
            
        }
    }
}