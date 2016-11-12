using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Net.Mail;
using Skills4Hire.App_Code;

namespace Skills4Hire
{
    public partial class Donate : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnPaymentDetailRequest_Click(object sender, EventArgs e)
        {
            try
            {
                MembershipUser myUser = Membership.GetUser(User.Identity.Name); //Retrieve user information

                //Update BankPaymentRequest database
                using (skillsforhireEntities myEntities = new skillsforhireEntities())
                {
                    bankpaymentrequest addRequest = new bankpaymentrequest();
                    addRequest.userName = myUser.UserName;
                    addRequest.emailUsed = myUser.Email;
                    addRequest.paymentType = "Donate";
                    addRequest.dateRequested = DateTime.Now;

                    myEntities.bankpaymentrequests.Add(addRequest);
                    myEntities.SaveChanges();
                }

                //Send bank detail via e-mail to user
                string fileName = Server.MapPath("~/App_Data/DonationPaymentDetails.txt");
                string mailBody = File.ReadAllText(fileName);

                mailBody = mailBody.Replace("##UserName##", myUser.UserName);

                MailMessage myMessage = new MailMessage();
                myMessage.Body = mailBody;
                myMessage.Subject = "Skills4Hire Bank Payment Details";
                myMessage.From = new MailAddress(AppConfiguration.FromAccAddress, AppConfiguration.FromName);
                myMessage.To.Add(new MailAddress(myUser.Email));

                SmtpClient mySmtpClient = new SmtpClient();
                mySmtpClient.Send(myMessage);

                //Send feedback
                btnPaymentDetailRequest.Visible = false;
                lblFeedback.Text = "We have emailed you our bank details. If you cannot find it in your inbox, please check your spam folder";
                lblFeedback.CssClass = "text-success";
                lblFeedback.Visible = true;
            }
            catch
            {
                lblFeedback.Text = "An error as occured. Please try again or email us on info@skills4hire.com.ng";
                lblFeedback.CssClass = "text-warning";
                lblFeedback.Visible = true;
            }
        }
    }
}