using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Skills4Hire
{
    public partial class test2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnFilter_Click(object sender, EventArgs e)
        {
            EntityDataSource1.WhereParameters.Clear();
            stdFilter();

            //Profession Filter
            if (ddlFilterProfession.SelectedItem.Text != "-- Select Profession --")
            {
                EntityDataSource1.WhereParameters.Add("SkillId", TypeCode.Int32, ddlFilterProfession.SelectedValue);
            }

            //State Filter
            if (ddlFilterStates.SelectedValue != "38")
            {
                EntityDataSource1.WhereParameters.Add("JobLocationStateId", TypeCode.Int32, ddlFilterStates.SelectedValue);
                //LGId whereparameter
                if (ddlFilterLG.SelectedItem.Text != "-- Select Local Govt. --")
                {
                    EntityDataSource1.WhereParameters.Add("JobLocationLGId", TypeCode.Int32, ddlFilterLG.SelectedValue);
                }
            }
        }

        protected void btnClearFilter_Click(object sender, EventArgs e)
        {
            //Clear whereparameter collections and reload page
            EntityDataSource1.WhereParameters.Clear();
            Response.Redirect("~/FindJob.aspx");
        }

        protected void stdFilter() //to add the publicise parameter to a page
        {
            EntityDataSource1.WhereParameters.Add("Publicise", System.Data.DbType.Boolean, cbxFilter.Checked.ToString());
        }
    }
}