using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Skills4Hire
{
    public partial class FindJob : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            countExp(); //count expired post for quick clean up
        }

        protected void btnDeleteMultipleRows_Click(object sender, EventArgs e)
        {
            //Loop through all the rows
            foreach (GridViewRow row in GridView1.Rows)
            {
                CheckBox checkbox = (CheckBox)row.FindControl("cbxSelect");
                //Check if the checkbox is checked.
                //value in the HtmlInputCheckBox's Value property is set as the //value of the delete command's parameter.
                if (checkbox.Checked)
                {
                    //Retrieve idJobProfile
                    int JobProfileId = Convert.ToInt32(GridView1.DataKeys[row.RowIndex].Value);
                    // Pass the value of the selected Employye ID to the Delete //command.
                   
                    using (skillsforhireEntities myEntities = new skillsforhireEntities())
                    {
                        var delItem = (from del in myEntities.jobprofiles
                                       where del.idJobProfile == JobProfileId
                                       select del).Single();
                        if (delItem != null)
                        {
                            myEntities.jobprofiles.Remove(delItem);
                            myEntities.SaveChanges();
                        }
                    }
                    
                }
            }
            Response.Redirect("~/Management/AllJobs.aspx");
        }

        protected void btnClearFilter_Click(object sender, EventArgs e)
        {
            //Clear whereparameter collections and reload page
            EntityDataSource1.WhereParameters.Clear();
            Response.Redirect("~/Management/AllJobs.aspx");
        }

        protected void btnFilter_Click(object sender, EventArgs e)
        {
            //Clear whereparameter collections to avoid repeatation error
            EntityDataSource1.WhereParameters.Clear();
            //Add profession filter parameter            
            if (ddlProfFilter.SelectedValue != "78")
            {
                EntityDataSource1.WhereParameters.Add("SkillId", TypeCode.Int32, ddlProfFilter.SelectedValue);
            }

            //Add State and LG Filter Parameters
            if (ddlStateFilter.SelectedValue != "38")
            {
                EntityDataSource1.WhereParameters.Add("JobLocationStateId", TypeCode.Int32, ddlStateFilter.SelectedValue);
                //LGId whereparameter
                if (!string.IsNullOrEmpty(lbxLGFilter.SelectedValue) && lbxLGFilter.SelectedValue != "775")
                {
                    EntityDataSource1.WhereParameters.Add("JobLocationLGId", TypeCode.Int32, lbxLGFilter.SelectedValue);
                }
            }
            //Add publicise filter parameter
            if (cbxPublicised.Checked == true)
            {
                EntityDataSource1.WhereParameters.Add("Publicise", TypeCode.Boolean, cbxPublicised.Checked.ToString());
            }

        }

        protected void btnDelExpired_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                delExp();
                Response.Redirect("~/Management/AllJobs.aspx");
            }
        }
        //Count expired posts
        protected void countExp()
        {
            DateTime useDate = DateTime.Now.Date;
            using (skillsforhireEntities myEntities = new skillsforhireEntities())
            {
                var cntExp = (from E in myEntities.jobprofiles
                              where (E.ExpiryDate < useDate && E.Publicise == true)
                              select E).Count();
                ltlExpired.Text = cntExp.ToString();
            }
        }

        //Unpublish expired posts
        protected void unpubExp()
        {
            DateTime useDate = DateTime.Now.Date;
            using (skillsforhireEntities myEntities = new skillsforhireEntities())
            {
                var exp = from k in myEntities.jobprofiles
                          where k.ExpiryDate < useDate
                          select k;
                if (exp != null)
                {
                    foreach (var expItem in exp)
                    {
                        expItem.Publicise = false;
                    }
                    myEntities.SaveChanges();
                }
            }
        }

        //Count expired posts to be deleted 
        protected void cntDelExp()
        {
            if (ddlDeleteBeyond.SelectedValue != "-- Select Duration --")
            {
                Double delBeyond = Convert.ToDouble(ddlDeleteBeyond.SelectedValue);
                DateTime useDate = DateTime.Now.AddDays(delBeyond).Date;
                using (skillsforhireEntities myEntities = new skillsforhireEntities())
                {
                    var cntDel = (from E in myEntities.jobprofiles
                                  where E.ExpiryDate < useDate
                                  select E).Count();
                    ltlDeleteBeyond.Text = cntDel.ToString();
                } 
            }
        }

        //Delete expired posts
        protected void delExp()
        {
            Double delBeyond = Convert.ToDouble(ddlDeleteBeyond.SelectedValue);
            DateTime useDate = DateTime.Now.AddDays(delBeyond).Date;
            using (skillsforhireEntities myEntities = new skillsforhireEntities())
            {
                var del = from E in myEntities.jobprofiles
                              where E.ExpiryDate < useDate
                              select E;
                if (del != null)
                {
                    foreach (var iDel in del)
                    {
                        myEntities.jobprofiles.Remove(iDel);
                    }
                }
                myEntities.SaveChanges();
            }
        }

        protected void btnUnpublishExpired_Click(object sender, EventArgs e)
        {
            unpubExp();
            Response.Redirect("~/Management/AllJobs.aspx");
        }

        protected void ddlDeleteBeyond_TextChanged(object sender, EventArgs e)
        {
            cntDelExp();
        }
    }
}