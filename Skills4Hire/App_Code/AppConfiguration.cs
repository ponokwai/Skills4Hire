using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Configuration;

namespace Skills4Hire.App_Code
{
    public static class AppConfiguration
    {
        public static string FromInfoAddress
        {
            get
            {
                string result = WebConfigurationManager.AppSettings.Get("FromInfoAddress");
                if (!string.IsNullOrEmpty(result))
                {
                    return result;
                }
                throw new Exception("AppSetting FromInfoAddress not found in web.config file.");
            }
        }

        public static string FromAccAddress
        {
            get
            {
                string result = WebConfigurationManager.AppSettings.Get("FromAccAddress");
                if (!string.IsNullOrEmpty(result))
                {
                    return result;
                }
                throw new Exception("AppSetting FromAccAddress not found in web.config file.");
            }
        }

        public static string FromNoreplyAddress
        {
            get
            {
                string result = WebConfigurationManager.AppSettings.Get("FromNoreplyAddress");
                if (!string.IsNullOrEmpty(result))
                {
                    return result;
                }
                throw new Exception("AppSetting FromNoreplyAddress not found in web.config file.");
            }
        }

        public static string FromName
        {
            get
            {
                string result = WebConfigurationManager.AppSettings.Get("FromName");
                if (!string.IsNullOrEmpty(result))
                {
                    return result;
                }
                throw new Exception("AppSetting FromName not found in web.config file.");
            }
        }

        public static string ToAddress
        {
            get
            {
                string result = WebConfigurationManager.AppSettings.Get("ToAddress");
                if (!string.IsNullOrEmpty(result))
                {
                    return result;
                }
                throw new Exception("AppSetting ToAddress not found in web.config file.");
            }
        }

        public static string ToMiscAddress
        {
            get
            {
                string result = WebConfigurationManager.AppSettings.Get("ToMiscAddress");
                if (!string.IsNullOrEmpty(result))
                {
                    return result;
                }
                throw new Exception("AppSetting ToMiscAddress not found in web.config file.");
            }
        }
        public static string ToName
        {
            get
            {
                string result = WebConfigurationManager.AppSettings.Get("ToName");
                if (!string.IsNullOrEmpty(result))
                {
                    return result;
                }
                throw new Exception("AppSetting ToName not found in web.config file.");
            }
        }
        public static bool SendMailOnError
        {
            get
            {
                string result = WebConfigurationManager.AppSettings.Get("SendMailOnError");
                if (!string.IsNullOrEmpty(result))
                {
                    return Convert.ToBoolean(result);
                }
                throw new Exception("AppSetting SendMailOnError not found in web.config file.");
            }
        }
    }
}