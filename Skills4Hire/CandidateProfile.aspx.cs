using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Skills4Hire
{
    public partial class CandidateProfile1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int candId = Convert.ToInt32(Request.QueryString.Get("CandId"));
            if (candId < 1)
            {
                Response.Redirect("~/");
            }
            using (skillsforhireEntities db = new skillsforhireEntities())
            {
                var myCand = (from k in db.indprofiles
                              where k.idIndProfile == candId
                              select k).FirstOrDefault();

                if (myCand != null)
                {
                    Page.Title = myCand.FullName + ": " + myCand.skill.SkillType;
                }
                else
                {
                    Response.Redirect("~/Errors/OtherErrors.aspx");
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
                        profileflag myProfileFlag = new profileflag(); //Create class instance
                        myProfileFlag.ProfileUrl = pgURL;
                        myProfileFlag.FlagReason = tbxFlagReason.Text;
                        myProfileFlag.DateTimeReported = DateTime.Now;
                        myProfileFlag.ReportedBy = User.Identity.Name;

                        //Save new item to dbo table
                        myEntities.profileflags.Add(myProfileFlag);
                        myEntities.SaveChanges();

                        //Provide feedback
                        btnReportLink.Visible = false;
                        pnlReport.Visible = false;
                        lblReportFeedback.Text = "Feedback Sent";
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