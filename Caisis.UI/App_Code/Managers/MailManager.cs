using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Collections.Generic;
using System.Net;
using System.Net.Mail;

namespace Caisis.UI.Core.Classes
{
    /// <summary>
    /// A class used for sending emails though Caisis.
    /// </summary>
    public class MailManager
    {
        #region PRIVATE MEMBERS
        private bool useHTML = false;
        private MailAddress adminMailAddress, errorMailAddress, defaultFromAddress;
        private SmtpClient client;
        #endregion

        #region CONSTRUCTOR
        public MailManager()
        {
            InitalizeMailSettings();
        }
        #endregion

        #region PUBLIC PROPERTIES

        /// <summary>
        /// Gets the email address for the admin.
        /// </summary>
        public string AdminEmailAddress
        {
            get
            {
                return CaisisConfiguration.GetWebConfigValue("adminEmail");
            }
        }

        /// <summary>
        /// Gets the MailAddress of the admin
        /// </summary>
        public MailAddress AdminMailAddress
        {
            get
            {
                return adminMailAddress;
            }
        }


        /// <summary>
        /// Gets the error email address.
        /// </summary>
        public string ErrorEmailAddress
        {
            get
            {
                return CaisisConfiguration.GetWebConfigValue("errorEmail");
            }
        }

        /// <summary>
        /// Gets the MailAddress of the ErrorEmail
        /// </summary>
        public MailAddress ErrorMailAddress
        {
            get
            {
                return errorMailAddress;
            }
        }

        /// <summary>
        /// Gets the name of the Mail Server
        /// </summary>
        public string EmailServer
        {
            get
            {
                return CaisisConfiguration.GetWebConfigValue("mailServer");
            }
        }

        /// <summary>
        /// Gets whether to use SMTP Authentication or not. (default false)
        /// </summary>
        public bool UseSMTPAuthentication
        {
            get
            {
                string val = CaisisConfiguration.GetWebConfigValue("UseSmtpAuthentication");
                if (string.IsNullOrEmpty(val))
                {
                    return false;
                }
                else
                {
                    return bool.Parse(val);
                }
            }
        }

        /// <summary>
        /// Gets the SMTP UserName if UseSMTPAuthentication=true
        /// </summary>
        public string SMTPUserName
        {
            get
            {
                return CaisisConfiguration.GetWebConfigValue("smtpUsername");
            }
        }

        /// <summary>
        /// Gets the SMTP UserPassword if UseSMTPAuthentication=true
        /// </summary>
        public string SMTPPassword
        {
            get
            {
                return CaisisConfiguration.GetWebConfigValue("smtpPassword");
            }
        }

        /// <summary>
        /// Gets or sets if to use HTML when sending emails. (default false)
        /// </summary>
        public bool UseHtmlFormat
        {
            get
            {
                return useHTML;
            }
            set
            {
                useHTML = value;
            }
        }

        /// <summary>
        /// Gets or sets the default "From" address when sending emails.
        /// </summary>
        public MailAddress DefaultFromAddress
        {
            get
            {
                return defaultFromAddress;
            }
        }

        #endregion

        #region MESSAGING METHODS

        /// <summary>
        ///  Sends a MailMessage using an SmtpClient
        /// </summary>
        /// <param name="message"></param>
        public void SendEmail(MailMessage message)
        {
            // Ensure From Exists
            if (message.From == null)
            {
                message.From = DefaultFromAddress;
            }
            this.client.Send(message);
        }

        /// <summary>
        /// Send a message, sepecifing a send from address and name
        /// </summary>
        /// <param name="fromAddress">The address to appear in the "From" field</param>
        /// <param name="fromName">The name to appear in the "From" field</param>
        /// <param name="to">The address of the recipient, or a ";" seperated list of addresses</param>
        /// <param name="cc">The cc address of the recipient, or a ";" seperated list of addresses</param>
        /// <param name="subject"></param>
        /// <param name="body"></param>
        public void SendEmail(string fromAddress, string fromName, string to, string cc, string subject, string body)
        {
            MailMessage m = GetEmptyMessage();
            m.From = new MailAddress(fromAddress, fromName);
            SetMailAddressCollection(m.To, to);
            SetMailAddressCollection(m.CC, cc);
            m.Subject = subject;
            m.Body = body;
            SendEmail(m);
        }

        /// <summary>
        /// Sends an email from the Admin Email, as specified in web config
        /// </summary>
        /// <param name="to">The address of the recipient, or a ";" seperated list of addresses</param>
        /// <param name="cc">The cc address of the recipient, or a ";" seperated list of addresses</param>
        /// <param name="subject"></param>
        /// <param name="body"></param>
        public void SendEmailFromAdmin(string to, string cc, string subject, string body)
        {
            SendEmailHelper(AdminMailAddress, to, cc, subject, body);
        }

        /// <summary>
        /// Sends an email from the Error Email, as specified in web config
        /// </summary>
        /// <param name="to">The address of the recipient, or a ";" seperated list of addresses</param>
        /// <param name="cc">The cc address of the recipient, or a ";" seperated list of addresses</param>
        /// <param name="subject"></param>
        /// <param name="body"></param>
        public void SendEmailFromError(string to, string cc, string subject, string body)
        {
            SendEmailHelper(ErrorMailAddress, to, cc, subject, body);
        }

        /// <summary>
        /// Send a message, sepecifing a send from address
        /// </summary>
        /// <param name="from"></param>
        /// <param name="to"></param>
        /// <param name="cc"></param>
        /// <param name="subject"></param>
        /// <param name="body"></param>
        private void SendEmailHelper(MailAddress from, string to, string cc, string subject, string body)
        {
            MailMessage m = GetEmptyMessage();
            m.From = from;
            SetMailAddressCollection(m.To, to);
            SetMailAddressCollection(m.CC, cc);
            m.Subject = subject;
            m.Body = body;
            SendEmail(m);
        }

        #endregion

        #region HELPER METHODS

        /// <summary>
        /// Returns an empty MailMessage 
        /// </summary>
        /// <returns></returns>
        private MailMessage GetEmptyMessage()
        {
            MailMessage message = new MailMessage();
            message.IsBodyHtml = UseHtmlFormat;
            message.From = DefaultFromAddress;
            return message;
        }

        /// <summary>
        /// Parses ; seperated values out of an address string, and adds to an address collection
        /// </summary>
        /// <param name="collection"></param>
        /// <param name="addressString"></param>
        private void SetMailAddressCollection(MailAddressCollection collection, string addressString)
        {
            char[] seperator = new char[] { ';' };
            if (addressString.Contains(seperator.ToString()))
            {
                SetMailAddressCollection(collection, addressString.Split(seperator));
            }
            else if (addressString.Length > 0)
            {
                collection.Add(addressString);
            }
        }

        /// <summary>
        /// Creates a new array of Mail Addresses to add to the Mail Collection
        /// </summary>
        /// <param name="collection"></param>
        /// <param name="addressArray"></param>
        private void SetMailAddressCollection(MailAddressCollection collection, string[] addressArray)
        {
            foreach (string address in addressArray)
            {
                MailAddress mailAddress = new MailAddress(address);
                collection.Add(mailAddress);
            }
        }

        /// <summary>
        /// Initalizes defaults based on Web.config values
        /// </summary>
        private void InitalizeMailSettings()
        {
            adminMailAddress = new MailAddress(AdminEmailAddress, "Caisis Admin");
            defaultFromAddress = adminMailAddress;
            // Set Error Email, default to admin if not present
            if (!string.IsNullOrEmpty(ErrorEmailAddress))
            {
                errorMailAddress = new MailAddress(ErrorEmailAddress, "Caisis Errors");
            }
            else
            {
                errorMailAddress = adminMailAddress;
            }

            // Initalize SmtpClient
            this.client = new SmtpClient(EmailServer);

            // Setup authentication, if any
            if (UseSMTPAuthentication)
            {
                this.client.Credentials = new NetworkCredential(SMTPUserName, SMTPPassword);
            }
        }
        #endregion

    }
}
