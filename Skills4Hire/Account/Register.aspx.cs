using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Skills4Hire
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void CreateUserWizard1_CreatedUser(object sender, EventArgs e)
        {
            string userName = CreateUserWizard1.UserName.ToString();
            string email = CreateUserWizard1.Email.ToString();
            
            using (skillsforhireEntities myEntities = new skillsforhireEntities())
            {
                indprofile nwProfile = new indprofile();
                nwProfile.UserName = userName;
                nwProfile.EmailAddr = email;
                nwProfile.DateCreated = DateTime.Now;
                nwProfile.GoldSubExpire = DateTime.Now.AddMonths(6);
                nwProfile.IsGoldMember = true;
                nwProfile.SortOrder = 3;
                //Assign Gold Membership
                Roles.AddUserToRole(userName, "Gold");

                //Create new profile and save changes
                myEntities.indprofiles.Add(nwProfile);
                myEntities.SaveChanges();

                //Redirect to profile page
                //Response.Redirect("~/MyProfile.aspx");
            }
        }
    }
}