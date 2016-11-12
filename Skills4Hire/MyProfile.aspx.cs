using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.IO;
using Skills4Hire.App_Code;

namespace Skills4Hire
{
    public partial class CandidateProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                //Load candidate profile information
                string userName = User.Identity.Name;
                using (skillsforhireEntities myEntities = new skillsforhireEntities())
                {
                    var pullProfile = (from p in myEntities.indprofiles
                                       where p.UserName == userName
                                       select p).Single();
                    //Gold Membership
                    ltlGoldMembership.Text = pullProfile.GoldSubExpire.ToString();

                    //full name
                    tbxFullName.Text = pullProfile.FullName;
                    //gender
                    ddlGender.DataBind();
                    ListItem myddlGender = ddlGender.Items.FindByValue(pullProfile.GenderId.ToString());
                    if (myddlGender != null)
                    {
                        myddlGender.Selected = true;
                    }
                    //Contact Number
                    tbxContactNumb.Text = pullProfile.ContactNo;
                    //email
                    tbxEmail.Text = pullProfile.EmailAddr;

                    //state
                    ddlState.DataBind();
                    ListItem myddlState = ddlState.Items.FindByValue(pullProfile.StateId.ToString());
                    if (myddlState != null)
                    {
                        myddlState.Selected = true;
                    }

                    //local govt
                    ddlLocalGovt.DataBind();
                    ListItem myddlLocalGovt = ddlLocalGovt.Items.FindByValue(pullProfile.LocalGovtId.ToString());
                    if (myddlLocalGovt != null)
                    {
                        myddlLocalGovt.Selected = true;
                    }

                    //town
                    tbxTown.Text = pullProfile.Town;
                    //Profession
                    ddlProfession.DataBind();
                    ListItem myddlProfession = ddlProfession.Items.FindByValue(pullProfile.SkillsId.ToString());
                    if (myddlProfession != null)
                    {
                        myddlProfession.Selected = true;
                    }
                    //Professional speciality
                    tbxSpeciality.Text = pullProfile.SkillsSpecific;
                    //job experience
                    tbxExperience.Text = pullProfile.JobExperience;
                    //qualifications
                    tbxQualification.Text = pullProfile.Qualification;
                    //note
                    tbxNote.Text = pullProfile.Note;
                    //publish
                    cbxPublish.Checked = Convert.ToBoolean(pullProfile.Publish);
                }
            }
            
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            //go to homepage
            Response.Redirect("~/");
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            //Get user information
            string userAccName = User.Identity.Name.ToString();
            MembershipUser user = Membership.GetUser(userAccName);

            if (Page.IsValid)
            {
                using (skillsforhireEntities myEntities = new skillsforhireEntities())
                {
                    var proUpdate = (from pu in myEntities.indprofiles
                                     where pu.UserName == User.Identity.Name
                                     select pu).Single();

                    //Save to database: update or create new item
                    //Full Name
                    proUpdate.FullName = tbxFullName.Text;
                    //Gender
                    proUpdate.GenderId = Convert.ToInt32(ddlGender.SelectedValue);
                    //Contact Number
                    proUpdate.ContactNo = tbxContactNumb.Text;
                    //Email
                    if (!string.IsNullOrEmpty(tbxEmail.Text))
                    {
                        proUpdate.EmailAddr = tbxEmail.Text;
                    }
                    else
                    {
                        proUpdate.EmailAddr = user.Email;
                    }
                    //State
                    proUpdate.StateId = Convert.ToInt32(ddlState.SelectedValue);
                    //Local Govt
                    proUpdate.LocalGovtId = Convert.ToInt32(ddlLocalGovt.SelectedValue);
                    //Town
                    proUpdate.Town = tbxTown.Text;
                    //Profession
                    proUpdate.SkillsId = Convert.ToInt32(ddlProfession.SelectedValue);
                    //Profession Speciality
                    proUpdate.SkillsSpecific = tbxSpeciality.Text;
                    //Job Experience
                    proUpdate.JobExperience = tbxExperience.Text;
                    //Qualification
                    proUpdate.Qualification = tbxQualification.Text;
                    //Note 
                    proUpdate.Note = tbxNote.Text;
                    //Publish
                    proUpdate.Publish = Convert.ToBoolean(cbxPublish.Checked);
                    //Last Modified Date
                    proUpdate.LastModified = DateTime.Now;

                    myEntities.SaveChanges(); //save to database
                    Response.Redirect("~/");

                }
            }
            
        }

        protected void ddlState_SelectedIndexChanged(object sender, EventArgs e)
        {
            //publish profile
            cbxPublish.Checked = true;
        }

        protected void btnAccDelRequest_Click(object sender, EventArgs e)
        {
            //make button invisible and panel visible
            pnlAccDel.Visible = true;
            btnAccDelRequest.Visible = false;
        }

        protected void btnAccDelConfirmation_Click(object sender, EventArgs e)
        {
            string userAccName = User.Identity.Name.ToString();
            MembershipUser user = Membership.GetUser(userAccName);
            //clean-up profile
            using (skillsforhireEntities myObjects = new skillsforhireEntities())
            {
                var ind = (from i in myObjects.indprofiles
                           where i.UserName == userAccName
                           select i).Single();
                if (ind != null)
                {
                    myObjects.indprofiles.Remove(ind);
                }
                myObjects.SaveChanges();
            }
            //clean-up posted jobs
            using (skillsforhireEntities myEntities = new skillsforhireEntities())
            {
                var jobPosts = from p in myEntities.jobprofiles
                               where p.CreatedBy == userAccName
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
            //update deletedMembership table
            using (skillsforhireEntities myContext = new skillsforhireEntities())
            {
                
                deletedmembership delMemb = new deletedmembership();
                delMemb.userName = user.UserName;
                delMemb.email = user.Email;
                delMemb.leavingReason = tbxAccDelReason.Text;
                delMemb.Date = DateTime.Now;
                //Save to database
                myContext.deletedmemberships.Add(delMemb);
                myContext.SaveChanges();
            }
            //send confirmation email
            string fileName = Server.MapPath("~/App_Data/AccountDeleteConfirmation.txt");
            string mailBody = File.ReadAllText(fileName);

            mailBody = mailBody.Replace("##UserName##", user.UserName);

            MailMessage myMessage = new MailMessage();
            myMessage.Subject = "Your www.skills4hire.com.ng Account is Deleted";
            myMessage.Body = mailBody;

            myMessage.From = new MailAddress(AppConfiguration.FromAccAddress, "Accounts");
            myMessage.To.Add(new MailAddress(user.Email));

            SmtpClient mySmtpClient = new SmtpClient();
            mySmtpClient.Send(myMessage);

            //Delete account
            Membership.DeleteUser(userAccName);
            //programatically logout acccount and redirect to homepage
            FormsAuthentication.SignOut();
            Response.Redirect("~/");
            
        }

        protected void btnAdvanced_Click(object sender, EventArgs e)
        {
            pnlAdvanced.Visible = true;
        }

        protected void btnChangePassword_Click(object sender, EventArgs e)
        {
            pnlChangePassword.Visible = true;
        }

    }
}