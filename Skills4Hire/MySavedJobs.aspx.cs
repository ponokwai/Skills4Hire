using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Skills4Hire
{
    public partial class MySavedJobs : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            JobsSaved();
        }
        
        //Filter according to user
        protected void JobsSaved()
        {
            EntityDataSource1.WhereParameters.Clear();
            EntityDataSource1.WhereParameters.Add("SavedBy", TypeCode.String, User.Identity.Name);
        }
    }
}