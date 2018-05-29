<%@ WebService Language="C#" Class="Caisis.WebServices.ContactService" %>

using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.Runtime.Serialization;
using System.Linq;
using System.Xml;
using System.Xml.Linq;

using Caisis.BOL;
using Caisis.DataAccess;
using Caisis.Controller;

namespace Caisis.WebServices
{
    /// <summary>
    /// A service for querying contact info
    /// </summary>
    [WebService(Namespace = "http://www.caisis.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class ContactService : System.Web.Services.WebService
    {
        [WebMethod(EnableSession = true)]
        public ContactInfo GetContactInfo(string name)
        {
            // cleanup
            name = name.Trim();
            string firstName = "";
            string lastName = "";
            if (name.Contains(","))
            {
                string[] names = name.Split(',');
                lastName = names.Length > 0 ? names[0] : "";
                firstName = names.Length > 1 ? names[1] : "";
            }
            else
            {
                string[] names = name.Split(' ');
                firstName = names.Length > 0 ? names[0] : "";
                lastName = names.Length > 1 ? names[1] : "";
            }
            string phone = "";
            string email = "";
            if (!string.IsNullOrEmpty(firstName) && !string.IsNullOrEmpty(lastName))
            {
                ContactController sc = new ContactController();
                Contact contact = sc.SearchContacts(firstName, lastName).FirstOrDefault();
                if (contact != null && contact.PrimaryKeyHasValue)
                {
                    int contactId = (int)contact[Contact.ContactId];
                    ContactMethod workPhone = sc.GetContactMethod(contactId, "Work Phone").FirstOrDefault();
                    ContactMethod workEmail = sc.GetContactMethod(contactId, "Work Email").FirstOrDefault();
                    phone = workPhone != null ? workPhone[ContactMethod.ContactData].ToString() : "";
                    email = workEmail != null ? workEmail[ContactMethod.ContactData].ToString() : "";
                }
            }
            // write response
            ContactInfo contactInfo = new ContactInfo();
            contactInfo.Email = email;
            contactInfo.Phone = phone;
            return contactInfo;
        }
    }

    [DataContract]
    public class ContactInfo
    {
        [DataMember]
        public string Name;
        [DataMember]
        public string Email;
        [DataMember]
        public string Phone;
    }
}