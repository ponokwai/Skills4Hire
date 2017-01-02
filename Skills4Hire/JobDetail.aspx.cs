using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Skills4Hire
{
    public partial class JobDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int jobId = Convert.ToInt32(Request.QueryString.Get("JobId"));
            if (jobId < 1)
            {
                Response.Redirect("~/");
            }
            using (skillsforhireEntities db = new skillsforhireEntities())
            {
                var titleName = (from c in db.jobprofiles
                                 where c.idJobProfile == jobId
                                 select c).FirstOrDefault();

                if (titleName != null)
                {
                    Page.Title = titleName.JobTitle;
                }
                else
                {
                    Response.Redirect("~/Errors/OtherErrors.aspx");
                }

            }
        }


        protected void FormView1_DataBound(object sender, EventArgs e)
        {
            if (User.Identity.Name == "")
            {
                Label myContactLabel = (Label)FormView1.FindControl("ContactNumberLabel");
                myContactLabel.Text = "*Log in to website to view this contact number";
                myContactLabel.CssClass = "text-danger";

                Label myEmailLabel = (Label)FormView1.FindControl("ContactEmailLabel");
                myEmailLabel.Text = "*Log in to website to view this email address";
                myEmailLabel.CssClass = "text-danger";                
            }
            else if (!User.IsInRole("Gold") && !User.IsInRole("Administrator"))
            {
                Label mContactLabel = (Label)FormView1.FindControl("ContactNumberLabel");
                mContactLabel.Text = "*Gold membership subscription is required to view this contact number. To renew Gold subscription, go to My Profile";
                mContactLabel.CssClass = "text-danger";

                Label mEmailLabel = (Label)FormView1.FindControl("ContactEmailLabel");
                mEmailLabel.Text = "*Gold membership subscription is required to view this email address. To renew Gold subscription, go to My Profile ";
                mEmailLabel.CssClass = "text-danger";
            }
            cbxSaved();
        }

        protected void cbxSave_CheckedChanged(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(Request.QueryString.Get("JobId")))
            {
                if (cbxSave.Checked == true) //SAVE JOB
                {
                    int jobID = Convert.ToInt32(Request.QueryString.Get("JobId"));
                    using (skillsforhireEntities myEntities = new skillsforhireEntities())
                    {
                        var jobItem = (from j in myEntities.jobprofiles
                                       where j.idJobProfile == jobID
                                       select j).SingleOrDefault();
                        if (jobItem != null)
                        {
                            mysavedjob toSaveJob = new mysavedjob();
                            toSaveJob.sJobId = jobID;
                            toSaveJob.sJobTitle = jobItem.JobTitle;
                            toSaveJob.DateSaved = DateTime.Now.Date;
                            toSaveJob.SavedBy = User.Identity.Name;

                            myEntities.mysavedjobs.Add(toSaveJob);
                            myEntities.SaveChanges();

                            
                        }
                    }
                }
                else //DELETE SAVED JOB
                {
                    int jobID = Convert.ToInt32(Request.QueryString.Get("JobId"));
                    using (skillsforhireEntities myEntities = new skillsforhireEntities())
                    {
                        var mySavedJob = (from s in myEntities.mysavedjobs
                                          where (s.sJobId == jobID && s.SavedBy == User.Identity.Name)
                                          select s).SingleOrDefault();
                        if (mySavedJob != null)
                        {
                            myEntities.mysavedjobs.Remove(mySavedJob);
                            myEntities.SaveChanges();
                        }
                    }
                }
            }

        }

        //Saved checkbox status
        protected void cbxSaved()
        {
            int jobID = Convert.ToInt32(Request.QueryString.Get("JobId"));
            using (skillsforhireEntities myEntities = new skillsforhireEntities())
            {
                var jobSaved = (from d in myEntities.mysavedjobs
                                where (d.sJobId == jobID && d.SavedBy == User.Identity.Name)
                                select d).SingleOrDefault();
                if (jobSaved != null)
                {
                    cbxSave.Checked = true;
                }
                else
                {
                    cbxSave.Checked = false;
                }
            }
        }

        protected void btnReportLink_Click(object sender, EventArgs e)
        {
            pnlReport.Visible = true;
            btnReportLink.Visible = false;
        }

        protected void btnSendFeedback_Click(object sender, EventArgs e)
        {
            try
            {
                if (Page.IsValid)
                {
                    string pgURL = Request.Url.AbsoluteUri;
                    using (skillsforhireEntities myEntities = new skillsforhireEntities())
                    {
                        jobpostflag myJobFlag = new jobpostflag(); //Create class instance
                        myJobFlag.PostURL = pgURL;
                        myJobFlag.FlagReason = tbxFlagReason.Text;
                        myJobFlag.DateTimeReported = DateTime.Now;
                        myJobFlag.ReportedBy = User.Identity.Name;

                        //Save new item to dbo table
                        myEntities.jobpostflags.Add(myJobFlag);
                        myEntities.SaveChanges();

                        //Provide feedback
                        btnReportLink.Visible = false;
                        pnlReport.Visible = false;
                        lblReportFeedback.Text = "Feedback sent";
                        lblReportFeedback.Visible = true;
                        lblReportFeedback.CssClass = "text-success";
                    }
                }
            }
            catch
            {
                lblReportFeedback.Text = "An error has occured. Please try again";
                lblReportFeedback.Visible = true;
                lblReportFeedback.CssClass = "text-warning";
            }
        }
    }
}