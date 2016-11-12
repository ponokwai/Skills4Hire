using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.Configuration;
using Skills4Hire.App_Code;
using System.Web.Routing;

namespace Skills4Hire
{
    public class Global : System.Web.HttpApplication
    {

        protected void Application_Start(object sender, EventArgs e)
        {            
            RouteConfig.RegisterRoutes(RouteTable.Routes);

            ScriptManager.ScriptResourceMapping.AddDefinition("jquery", new ScriptResourceDefinition
            {
                Path = "~/Scripts/jquery-2.2.1.min.js"
            }
        );  
        }

        protected void Session_Start(object sender, EventArgs e)
        {

        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {

        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {
            // Code that runs when an unhandled error occurs
            // Code that runs when an unhandled error occurs
            {
                if (AppConfiguration.SendMailOnError)
                {
                    if (HttpContext.Current.Server.GetLastError() != null)
                    {
                        Exception myException = HttpContext.Current.Server.GetLastError().GetBaseException();
                        string mailSubject = "Error in page " + Request.Url.ToString();
                        string message = string.Empty;
                        message += "<strong>Message</strong><br />" + myException.Message + "<br />";
                        message += "<strong>Stack Trace</strong><br />" + myException.StackTrace + "<br />";
                        message += "<strong>Target Site</strong><br />" + myException.TargetSite + "<br />";
                        message += "<strong>Query String</strong><br />" + Request.QueryString.ToString() + "<br />";

                        MailMessage myMessage = new MailMessage(AppConfiguration.FromNoreplyAddress, AppConfiguration.ToMiscAddress, mailSubject, message);
                        myMessage.IsBodyHtml = true;
                        SmtpClient mySmtpClient = new SmtpClient();
                        mySmtpClient.Send(myMessage);
                    }
                }
            }
        }

        protected void Session_End(object sender, EventArgs e)
        {

        }

        protected void Application_End(object sender, EventArgs e)
        {

        }
    }
}