using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Skills4Hire.Management
{
    public partial class ReviewJobPost : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(Request.QueryString.Get("JobId"));
            using (skillsforhireEntities myEntities = new skillsforhireEntities())
            {
                var delPost = (from del in myEntities.jobprofiles
                               where del.idJobProfile == id
                               select del).Single();
                if (delPost != null)
                {
                    myEntities.jobprofiles.Remove(delPost);
                    myEntities.SaveChanges();
                }
            }
            Response.Redirect("~/Management/AllJobs.aspx");
        }
    }
}
