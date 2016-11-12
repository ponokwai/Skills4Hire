using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Skills4Hire
{
    public partial class MyJobPosts : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            EntityDataSource1.WhereParameters.Clear();
            getUserPost();
        }

        protected void getUserPost()
        {
            EntityDataSource1.WhereParameters.Add("CreatedBy", TypeCode.String, User.Identity.Name);
        }

        protected void btnPostNewJob_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/PostAJob.aspx"); // redirect to post a job page
        }
    }
}