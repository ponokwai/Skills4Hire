using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Skills4Hire
{
    public partial class PostAJob : System.Web.UI.Page
    {
        int _id = -1; //to distinguish between a new and existing post
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(Request.QueryString.Get("JobId")))
            {
                _id = Convert.ToInt32(Request.QueryString.Get("JobId"));
            }
            if (!Page.IsPostBack && _id > -1)//edit
            {
                ltlNew.Visible = false;
                ltlEdit.Text = "Edit Job Advert";
                using (skillsforhireEntities myEntities = new skillsforhireEntities())
                {
                    var jobAd = (from j in myEntities.jobprofiles
                                 where j.idJobProfile == _id
                                 select j).SingleOrDefault();
                    if (jobAd.CreatedBy == User.Identity.Name)
                    {
                        //Get job status
                        ddlJobStatus.DataBind();
                        ListItem myddlJobStatus = ddlJobStatus.Items.FindByValue(jobAd.JobStatusId.ToString());
                        if (myddlJobStatus != null)
                        {
                            myddlJobStatus.Selected = true;
                        }
                        //Start Time
                        ddlStartTime.DataBind();
                        ListItem myddlStartTime = ddlStartTime.Items.FindByValue(jobAd.StartTimeId.ToString());
                        if (myddlStartTime != null)
                        {
                            myddlStartTime.Selected = true;
                        }
                        //Job loc. state
                        ddlJobLocState.DataBind();
                        ListItem myddlState = ddlJobLocState.Items.FindByValue(jobAd.JobLocationStateId.ToString());
                        if (myddlState != null)
                        {
                            myddlState.Selected = true;
                        }
                        //Job loc. LG
                        ddlJobLocLG.DataBind();
                        ListItem myddlLG = ddlJobLocLG.Items.FindByValue(jobAd.JobLocationLGId.ToString());
                        if (myddlLG != null)
                        {
                            myddlLG.Selected = true;
                        }
                        //Job loc. town
                        tbxJobLocTown.Text = jobAd.JobLocationTown.ToString();
                        //Job title
                        tbxJobTitle.Text = jobAd.JobTitle.ToString();
                        //Job description
                        tbxJobDescription.Text = jobAd.JobDescription;
                        //Profession
                        ddlSkill.DataBind();
                        ListItem myddlSkill = ddlSkill.Items.FindByValue(jobAd.SkillId.ToString());
                        if (myddlSkill != null)
                        {
                            myddlSkill.Selected = true;
                        }
                        //Specialisation
                        tbxSkillSpecific.Text = jobAd.SpecificSkill.ToString();
                        //Budget
                        ddlBudget.DataBind();
                        ListItem myddlBudget = ddlBudget.Items.FindByValue(jobAd.BudgetId.ToString());
                        if (myddlBudget != null)
                        {
                            myddlBudget.Selected = true;
                        }
                        //Full Name
                        tbxFullName.Text = jobAd.ContactFullName;

                        //Contact Number
                        tbxContactNumb.Text = jobAd.ContactNumber;
                        //Email
                        tbxEmail.Text = jobAd.ContactEmail;
                        //Expiry Date
                        
                        //Publicise
                        cbxPublicise.Checked = Convert.ToBoolean(jobAd.Publicise);
                    }

                }
            }
        }

        protected void btnPost_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                using (skillsforhireEntities myEntities = new skillsforhireEntities())
                {
                    jobprofile myJobProfile;
                    if (_id == -1) //Create new profile
                    {
                        myJobProfile = new jobprofile();
                        myJobProfile.CreatedBy = User.Identity.Name;
                        myJobProfile.DateCreated = DateTime.Now;
                        myJobProfile.LastModified = myJobProfile.DateCreated;
                        myJobProfile.LastModifiedBy = User.Identity.Name;
                        myEntities.jobprofiles.Add(myJobProfile);
                    }
                    else
                    {
                        myJobProfile = (from P in myEntities.jobprofiles
                                        where P.idJobProfile == _id
                                        select P).Single();
                        myJobProfile.LastModified = DateTime.Now;
                        myJobProfile.LastModifiedBy = User.Identity.Name;
                    }
                    //Job Status
                    myJobProfile.JobStatusId = Convert.ToInt32(ddlJobStatus.SelectedValue);
                    //Start Time
                    myJobProfile.StartTimeId = Convert.ToInt32(ddlStartTime.SelectedValue);
                    //Job loc. state
                    myJobProfile.JobLocationStateId = Convert.ToInt32(ddlJobLocState.SelectedValue);
                    //Job loc. LG
                    myJobProfile.JobLocationLGId = Convert.ToInt32(ddlJobLocLG.SelectedValue);
                    //Job loc. town
                    if (tbxJobLocTown.Text != "")
                    {
                        myJobProfile.JobLocationTown = tbxJobLocTown.Text;
                    }
                    else
                    {
                        myJobProfile.JobLocationTown = "-";
                    }
                    //Job title
                    myJobProfile.JobTitle = tbxJobTitle.Text;
                    //Job description
                    myJobProfile.JobDescription = tbxJobDescription.Text;
                    //Profession
                    myJobProfile.SkillId = Convert.ToInt32(ddlSkill.SelectedValue);
                    //Specialisation
                    if (tbxSkillSpecific.Text != "")
                    {
                        myJobProfile.SpecificSkill = tbxSkillSpecific.Text;                        
                    }
                    else
                    {
                        myJobProfile.SpecificSkill = "-";
                    }
                    //Budget
                    myJobProfile.BudgetId = Convert.ToInt32(ddlBudget.SelectedValue);
                    //Full Name
                    myJobProfile.ContactFullName = tbxFullName.Text;
                    //Contact Number
                    myJobProfile.ContactNumber = tbxContactNumb.Text;
                    //Email
                    myJobProfile.ContactEmail = tbxEmail.Text;
                    //Publicise
                    myJobProfile.Publicise = Convert.ToBoolean(cbxPublicise.Checked);
                    //Expiry Date
                    myJobProfile.ExpiryDate = DateTime.Today.AddDays(Convert.ToDouble(ddlAdvertDuration.SelectedValue));

                    //save changes
                    myEntities.SaveChanges();
                    Response.Redirect("~/");
                }
            }

            
        }

        protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (tbxJobDescription.Text.Length < 50)
            {
                args.IsValid = false;
            }
            else
            {
                args.IsValid = true;
            }
        }

        protected void CustomValidator2_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (!string.IsNullOrEmpty(tbxContactNumb.Text) || !string.IsNullOrEmpty(tbxEmail.Text))
            {
                args.IsValid = true;
            }
            else
            {
                args.IsValid = false;
            }
        }
    }
}