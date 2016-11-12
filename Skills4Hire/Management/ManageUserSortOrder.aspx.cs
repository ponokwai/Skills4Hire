using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Skills4Hire.Management
{
    public partial class ManageUserSortOrder : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            countUpgrades();
            countDowngrades();
            countToUnpublish();
            countToPublish();
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            EntityDataSource1.WhereParameters.Clear();
            EntityDataSource1.WhereParameters.Add("UserName", TypeCode.String, tbxSearch.Text);
        }

        protected void btnDowngrade_Click(object sender, EventArgs e)
        {
            //downgrade all users without professional profile
            using (skillsforhireEntities myEntities = new skillsforhireEntities())
            {
                var allItms = from a in myEntities.indprofiles
                              where a.SkillsId == 78 && a.SortOrder < 4
                              select a;
                if (allItms.Any())
                {
                    foreach (var itm in allItms)
                    {
                        itm.SortOrder = 4;
                    }
                    myEntities.SaveChanges();
                }
            }
            //countDowngrades();
            Response.Redirect("~/Management/ManageUserSortOrder.aspx");
        }

        protected void btnUpgrade_Click(object sender, EventArgs e)
        {
            //Upgrade all users with updated professional profile
            using (skillsforhireEntities myEntities = new skillsforhireEntities())
            {
                var allItms = from a in myEntities.indprofiles
                              where a.SkillsId != 78 && a.SortOrder == 4
                              select a;
                if (allItms.Any())
                {
                    foreach (var itm in allItms)
                    {
                        itm.SortOrder = 3;
                    }
                    myEntities.SaveChanges();
                }
            }
            //countUpgrades();
            Response.Redirect("~/Management/ManageUserSortOrder.aspx");
        }

        protected void countDowngrades()
        {
            //count downgrade all users without professional profile
            using (skillsforhireEntities myEntities = new skillsforhireEntities())
            {
                var allItms = (from a in myEntities.indprofiles
                              where a.SkillsId == 78 && a.SortOrder < 4
                              select a).Count();
                ltlDowngrades.Text = allItms.ToString();
            }
        }

        protected void countUpgrades()
        {
            //count upgrade all users without professional profile
            using (skillsforhireEntities myEntities = new skillsforhireEntities())
            {
                var allItms = (from a in myEntities.indprofiles
                               where a.SkillsId != 78 && a.SortOrder == 4
                               select a).Count();
                ltlUpgrades.Text = allItms.ToString();
            }
        }

        protected void btnUnpublish_Click(object sender, EventArgs e)
        {
            //Unpublish all users without professional profile
            using (skillsforhireEntities myEntities = new skillsforhireEntities())
            {
                var allItms = from a in myEntities.indprofiles
                              where a.SkillsId == 78 && a.Publish == true
                              select a;
                if (allItms.Any())
                {
                    foreach (var itm in allItms)
                    {
                        itm.Publish = false;
                    }
                    myEntities.SaveChanges();
                }
            }
            Response.Redirect("~/Management/ManageUserSortOrder.aspx");
        }

        protected void btnPublish_Click(object sender, EventArgs e)
        {
            //Publish all users updated professional profile
            using (skillsforhireEntities myEntities = new skillsforhireEntities())
            {
                var allItms = from a in myEntities.indprofiles
                              where a.SkillsId != 78 && a.Publish == false
                              select a;
                if (allItms.Any())
                {
                    foreach (var itm in allItms)
                    {
                        itm.Publish = true;
                    }
                    myEntities.SaveChanges();
                }
            }
            Response.Redirect("~/Management/ManageUserSortOrder.aspx");
        }

        protected void countToUnpublish()
        {
            //count profiles to unpublish
            using (skillsforhireEntities myEntities = new skillsforhireEntities())
            {
                var allItms = (from a in myEntities.indprofiles
                               where a.SkillsId == 78 && a.Publish == true
                               select a).Count();
                ltlUnpublish.Text = allItms.ToString();
            }
        }
        protected void countToPublish()
        {
            //count profiles to publish
            using (skillsforhireEntities myEntities = new skillsforhireEntities())
            {
                var allItms = (from a in myEntities.indprofiles
                               where a.SkillsId != 78 && a.Publish == false
                               select a).Count();
                ltlPublish.Text = allItms.ToString();
            }
        }
    }
}