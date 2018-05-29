using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

using Caisis.BOL;
using Caisis.DataAccess;
using Caisis.UI.Core.Classes;
using Caisis.UI.Core.Classes.CustomControls;

namespace Caisis.UI.Admin
{
    public partial class Contact_List : AdminBasePage
    {
        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);

            LoadContacts();
        }

        private void LoadContacts()
        {
            ProjectManagementDa projDA = new ProjectManagementDa();
            DataTable contactsDataSource = new DataTable();
            ContactsDa contactsDa = new ContactsDa();


            contactsDataSource = contactsDa.GetAllContacts();

            // Determine if there are any records and show message
            if (contactsDataSource.Rows.Count > 0)
            {
                // Bind grid to datasource
                var view = contactsDataSource.DefaultView;
                view.Sort = "Name ASC";

                ContactsRptr.DataSource = view;
                ContactsRptr.DataBind();
                NoResultsMsg.Visible = false;
            }

        }
    }
}