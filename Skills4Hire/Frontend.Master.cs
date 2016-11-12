using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Web.UI;
using System.Web.UI.WebControls;

namespace Skills4Hire
{
    public partial class Frontend : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            using (skillsforhireEntities myEntities = new skillsforhireEntities())
            {
                //Freelance
                var cntFree = (from c in myEntities.jobprofiles
                               where c.Publicise == true
                               select c).Count();
                ltlFree.Text = cntFree.ToString();

                //Guardian newspaper
                var cntGuard = (from g in myEntities.guardianjobs
                                where g.Publish == true
                                select g).Count();
                ltlGuard.Text = cntGuard.ToString();
            }

        }
    }
}