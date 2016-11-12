using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Skills4Hire
{
    public partial class FindPeople : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //stdFilter(); //Show only published profiles
        }

        protected void btnFilter_Click(object sender, EventArgs e)
        {
            //Initialise whereparameters
            EntityDataSource1.WhereParameters.Clear();
            //stdFilter(); //Show only published profiles

            //Get profession filer data
            if (ddlProfessionFilter.SelectedValue != "78")
            {
                EntityDataSource1.WhereParameters.Add("SkillsId", TypeCode.Int32, ddlProfessionFilter.SelectedValue);
            }

            //Get state filter data
            if (ddlStateFilter.SelectedValue != "38")
            {
                EntityDataSource1.WhereParameters.Add("StateId", TypeCode.Int32, ddlStateFilter.SelectedValue);
                //Get LG filter data
                if (ddlLGFilter.SelectedItem.Text != "-- Select Local Govt. --")
                {
                    EntityDataSource1.WhereParameters.Add("LocalGovtId", TypeCode.Int32, ddlLGFilter.SelectedValue);
                }
            }
            
        }

        protected void btnClearFilter_Click(object sender, EventArgs e)
        {
            //Clear whereparameters and reload page
            EntityDataSource1.WhereParameters.Clear();
            Response.Redirect("~/FindPeople.aspx");
        }

        //protected void stdFilter() //to add the publicise parameter to a page
        //{
        //    EntityDataSource1.WhereParameters.Add("Publish", TypeCode.Boolean, cbxFilter.Checked.ToString());
        //}
    }
}