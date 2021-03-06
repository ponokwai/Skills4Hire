﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Skills4Hire
{
    public partial class GuardianJobDetails : System.Web.UI.Page
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
                var titleName = (from c in db.guardianjobs
                                where c.Id == jobId
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
            //Doctor how to apply text if user is logged in or user gold membership has expired
            if (User.Identity.Name == "")
            {
                Label myHowToApplyLabel = (Label)FormView1.FindControl("HowToApplyLabel");
                myHowToApplyLabel.Text = "*Log in to website to view this How To Apply information";
                myHowToApplyLabel.CssClass = "text-danger";
            }
            else if (!User.IsInRole("Gold") && !User.IsInRole("Administrator"))
            {
                Label myHowToApplyLabel = (Label)FormView1.FindControl("HowToApplyLabel");
                myHowToApplyLabel.Text = "*Gold membership subscription is required to view this How To Apply information. To renew Gold subscription, go to My Profile";
                myHowToApplyLabel.CssClass = "text-danger";
            }
        }
    }
}