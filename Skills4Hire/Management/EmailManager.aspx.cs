using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using Skills4Hire.App_Code;

namespace Skills4Hire.Management
{
    public partial class EmailManager : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSend_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                try
                {
                //All Users Email
                if (ddlToGroup.SelectedValue == "1")
                {
                    using (skillsforhireEntities myEntities = new skillsforhireEntities())
                    {
                        var allEmails = from u in myEntities.indprofiles
                                        select u.EmailAddr;
                        if (allEmails != null)
                        {
                            foreach (var itm in allEmails)
                            {
                                //send email
                                MailMessage myMessage = new MailMessage();
                                myMessage.To.Add(new MailAddress(itm.ToString()));
                                myMessage.From = new MailAddress(AppConfiguration.FromNoreplyAddress, AppConfiguration.FromName);
                                myMessage.Subject = tbxSubject.Text;
                                myMessage.Body = tbxBody.Text;

                                SmtpClient mySmtpClient = new SmtpClient();
                                mySmtpClient.Send(myMessage);

                            }
                        }
                    }
                }
                //New Users < 1month Email
                else if (ddlToGroup.SelectedValue == "2")
                {
                    DateTime dateCreated = DateTime.Now.AddDays(-30);
                    using (skillsforhireEntities myEntities = new skillsforhireEntities())
                    {
                        var allEmails = from u in myEntities.indprofiles
                                        where u.DateCreated > dateCreated
                                        select u.EmailAddr;
                        if (allEmails != null)
                        {
                            foreach (var itm in allEmails)
                            {
                                //send email
                                MailMessage myMessage = new MailMessage();
                                myMessage.To.Add(new MailAddress(itm.ToString()));
                                myMessage.From = new MailAddress(AppConfiguration.FromNoreplyAddress, AppConfiguration.FromName);
                                myMessage.Subject = tbxSubject.Text;
                                myMessage.Body = tbxBody.Text;

                                SmtpClient mySmtpClient = new SmtpClient();
                                mySmtpClient.Send(myMessage);

                            }
                        }
                    }
                }
                //Expired Gold Users Email
                else if (ddlToGroup.SelectedValue == "3")
                {
                    using (skillsforhireEntities myEntities = new skillsforhireEntities())
                    {
                        var allEmails = from u in myEntities.indprofiles
                                        where u.GoldSubExpire < DateTime.Now
                                        select u.EmailAddr;
                        if (allEmails != null)
                        {
                            foreach (var itm in allEmails)
                            {
                                //send email
                                MailMessage myMessage = new MailMessage();
                                myMessage.To.Add(new MailAddress(itm.ToString()));
                                myMessage.From = new MailAddress(AppConfiguration.FromNoreplyAddress, AppConfiguration.FromName);
                                myMessage.Subject = tbxSubject.Text;
                                myMessage.Body = tbxBody.Text;

                                SmtpClient mySmtpClient = new SmtpClient();
                                mySmtpClient.Send(myMessage);

                            }
                        }
                    }
                }
                    // seleted no skill/profession
                else if (ddlToGroup.SelectedValue == "4")
                {
                    using (skillsforhireEntities myEntities = new skillsforhireEntities())
                    {
                        var allEmails = from u in myEntities.indprofiles
                                        where u.SkillsId == 78
                                        select u.EmailAddr;
                        if (allEmails != null)
                        {
                            foreach (var itm in allEmails)
                            {
                                //send email
                                MailMessage myMessage = new MailMessage();
                                myMessage.To.Add(new MailAddress(itm.ToString()));
                                myMessage.From = new MailAddress(AppConfiguration.FromNoreplyAddress, AppConfiguration.FromName);
                                myMessage.Subject = tbxSubject.Text;
                                myMessage.Body = tbxBody.Text;

                                SmtpClient mySmtpClient = new SmtpClient();
                                mySmtpClient.Send(myMessage);

                            }
                        }
                    }
                }
                pnlSendMessage.Visible = false;
                lblSendFeedback.Visible = true;
                lblSendFeedback.Text = "Message sent";
                lblSendFeedback.CssClass = "text-success";

                }
                catch
                {
                    pnlSendMessage.Visible = false;
                    lblSendFeedback.Visible = true;
                    lblSendFeedback.Text = "Sending message failed";
                    lblSendFeedback.CssClass = "text-warning";
                }
            }
        }
    }
}