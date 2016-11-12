using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Skills4Hire.Management
{
    public partial class GuardianJobs : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void EntityDataSource1_Inserting(object sender, EntityDataSourceChangingEventArgs e)
        {
            //Update edited by fields
            guardianjob myJob = (guardianjob)e.Entity;
            myJob.EditedBy = User.Identity.Name;
            myJob.DateTimeEdited = DateTime.Now;
            
        }

        protected void EntityDataSource1_Updating(object sender, EntityDataSourceChangingEventArgs e)
        {
            guardianjob myJob = (guardianjob)e.Entity;
            myJob.EditedBy = User.Identity.Name;
            myJob.DateTimeEdited = DateTime.Now;
        }
    }
}