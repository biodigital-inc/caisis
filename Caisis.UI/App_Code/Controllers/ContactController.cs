using System;
using System.Data;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using Caisis.BOL;
using Caisis.DataAccess;

namespace Caisis.Controller
{
    /// <summary>
    /// ContacController
    /// </summary>
    public class ContactController : BaseController
    {
        public ContactController()
            : base()
        {

        }

        public IEnumerable<Contact> SearchContacts(string firstName, string lastName)
        {
            return BusinessObject.GetByFields<Contact>(new Dictionary<string, object>
                {
                    { Contact.FirstName, firstName },
                    { Contact.LastName, lastName }
                });
        }

        public IEnumerable<ContactMethod> GetContactMethod(int contactId, string contactType)
        {
            return BusinessObject.GetByFields<ContactMethod>(new Dictionary<string, object>
            {
                { ContactMethod.ContactId, contactId },
                { ContactMethod.Type, contactType } 
            });
        }

    }
}