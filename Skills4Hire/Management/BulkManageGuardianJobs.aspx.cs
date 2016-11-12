using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Skills4Hire.Management
{
    public partial class BulkManageGuardianJobs : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            cntJobsToUnplish();
            cntJobsToDel();
        }

        protected void btnUnpub_Click(object sender, EventArgs e)
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
                    int GuarJobId = Convert.ToInt32(GridView1.DataKeys[row.RowIndex].Value);
                    // Pass the value of the selected JobProfileId to the Delete //command.

                    using (skillsforhireEntities myEntities = new skillsforhireEntities())
                    {
                        var UnpItem = (from itm in myEntities.guardianjobs
                                       where itm.Id == GuarJobId
                                       select itm).Single();
                        if (UnpItem != null)
                        {
                            UnpItem.Publish = false;
                            UnpItem.EditedBy = User.Identity.Name;
                            UnpItem.DateTimeEdited = DateTime.Now;
                            myEntities.SaveChanges();
                        }
                    }

                }
            }
            Response.Redirect("~/Management/BulkManageGuardianJobs.aspx");
        }

        protected void btnPublish_Click(object sender, EventArgs e)
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
                    int GuarJobId = Convert.ToInt32(GridView1.DataKeys[row.RowIndex].Value);
                    // Pass the value of the selected JobProfileId to the Delete //command.

                    using (skillsforhireEntities myEntities = new skillsforhireEntities())
                    {
                        var PubItem = (from itm in myEntities.guardianjobs
                                       where itm.Id == GuarJobId
                                       select itm).Single();
                        if (PubItem != null && PubItem.Publish == false)
                        {
                            PubItem.Publish = true;
                            PubItem.EditedBy = User.Identity.Name;
                            PubItem.DateTimeEdited = DateTime.Now;
                            myEntities.SaveChanges();
                        }
                    }

                }
            }
            Response.Redirect("~/Management/BulkManageGuardianJobs.aspx");
        }

        protected void btnDel_Click(object sender, EventArgs e)
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
                    int GuarJobId = Convert.ToInt32(GridView1.DataKeys[row.RowIndex].Value);
                    // Pass the value of the selected JobProfileId to the Delete //command.

                    using (skillsforhireEntities myEntities = new skillsforhireEntities())
                    {
                        var delItem = (from del in myEntities.guardianjobs
                                       where del.Id == GuarJobId
                                       select del).Single();
                        if (delItem != null)
                        {
                            myEntities.guardianjobs.Remove(delItem);
                            myEntities.SaveChanges();
                        }
                    }

                }
            }
            Response.Redirect("~/Management/BulkManageGuardianJobs.aspx");
        }

        protected void cntJobsToUnplish()
        {
            //count jobs > 8 weeks to unplish
            DateTime timePoint = DateTime.Now.AddMonths(-2);
            using (skillsforhireEntities myEntities = new skillsforhireEntities())
            {
                var getItms = (from i in myEntities.guardianjobs
                               where i.PublicationDate < timePoint && i.Publish == true
                               select i).Count();
                Literal1.Text = getItms.ToString();
            }
        }

        protected void cntJobsToDel()
        {
            //count jobs > 12 weeks to unplish
            DateTime timePoint = DateTime.Now.AddMonths(-3);
            using (skillsforhireEntities myEntities = new skillsforhireEntities())
            {
                var getItms = (from i in myEntities.guardianjobs
                               where i.PublicationDate < timePoint
                               select i).Count();
                Literal2.Text = getItms.ToString();
            }
        }
        protected void btnUnpublish_Click(object sender, EventArgs e)
        {
            //Bulk unpublish jobs > 8 weeks
            DateTime timePoint = DateTime.Now.AddMonths(-2);
            using (skillsforhireEntities myEntities = new skillsforhireEntities())
            {
                var getItms = from i in myEntities.guardianjobs
                              where i.PublicationDate < timePoint && i.Publish == true
                              select i;
                if (getItms.Any())
                {
                    foreach (var itm in getItms)
                    {
                        itm.Publish = false;
                        itm.EditedBy = User.Identity.Name;
                        itm.DateTimeEdited = DateTime.Now;
                    }
                    myEntities.SaveChanges();
                }
            }
            Response.Redirect("~/Management/BulkManageGuardianJobs.aspx");
        }



        protected void btnDelete_Click(object sender, EventArgs e)
        {
            //Bulk delete jobs > 8 weeks
            DateTime timePoint = DateTime.Now.AddMonths(-3);
            using (skillsforhireEntities myEntities = new skillsforhireEntities())
            {
                var getItms = from i in myEntities.guardianjobs
                              where i.PublicationDate < timePoint
                              select i;
                if (getItms.Any())
                {
                    foreach (var itm in getItms)
                    {
                        myEntities.guardianjobs.Remove(itm);
                        
                    }
                    myEntities.SaveChanges();
                }
            }
            Response.Redirect("~/Management/BulkManageGuardianJobs.aspx");
        }


    }
}