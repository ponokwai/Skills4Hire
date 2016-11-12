using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Skills4Hire.Management
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ltlOnline.Text = Membership.GetNumberOfUsersOnline().ToString();
            using (skillsforhireEntities myEntities = new skillsforhireEntities())
            {
                var cntUsers = (from t in myEntities.indprofiles
                                select t).Count();
                ltlTotal.Text = cntUsers.ToString();
            }
        }
    }
}