using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Collections.Generic;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

using Caisis.BOL;
using Caisis.DataAccess;
using Caisis.UI.Core.Classes;
using Caisis.UI.Core.Classes.CustomControls;

namespace Caisis.UI.Modules.ProjectMgmt
{
    public partial class LetterOfIntentEditor : ProjectMgmtAddFormBaseControl, ICallbackEventHandler
    {

        private string _callBackContactId;

        #region CALLBACK Related Methods (To retrieve contact phone and email)

        /// <summary>
        /// Registers the callback script used for retrieving phone and email info
        /// </summary>
        private void RegisterContactCallBackScript()
        {
            // Register startup
            ClientScriptManager cm = Page.ClientScript;
            String cbReference = cm.GetCallbackEventReference(this, "arg",
                "onLOICallBackEnd", "");
            String callbackScript = "function LOICallback(arg, context) {" +
                cbReference + "; }";
            cm.RegisterClientScriptBlock(this.GetType(),
                "LOICallback", callbackScript, true);
        }

        /// <summary>
        /// Gets called with argument from client
        /// </summary>
        /// <param name="eventArgument"></param>
        public void RaiseCallbackEvent(String eventArgument)
        {
            _callBackContactId = eventArgument;
        }

        /// <summary>
        /// Returns a js array used by client to populate dropdowns
        /// </summary>
        /// <returns></returns>
        public string GetCallbackResult()
        {
            if (!string.IsNullOrEmpty(_callBackContactId))
            {
                int contactId = int.Parse(_callBackContactId);
				//ContactMethod biz = new ContactMethod();
				//biz.GetByParent(contactId);

				DataTable table = BusinessObject.GetByParentAsDataView<ContactMethod>(contactId).Table;


				//DataRow[] emailAddresses = biz.GetTable().Select("[Type] Like '%Email%'");
				//DataRow[] phoneNumbers = biz.GetTable().Select("[Type] Like '%Phone%'");
				DataRow[] emailAddresses = table.Select("[Type] Like '%Email%'");
				DataRow[] phoneNumbers = table.Select("[Type] Like '%Phone%'");
                string js = "[[";
                foreach (DataRow email in emailAddresses)
                {
                    string text = Server.HtmlEncode(email[ContactMethod.ContactData].ToString());
                    js += "['" + text + "'],";
                }
                js = js.TrimEnd(",".ToCharArray());
                js += "],[";
                foreach (DataRow phone in phoneNumbers)
                {
                    string text = Server.HtmlEncode(phone[ContactMethod.ContactData].ToString());
                    js += "['" + text + "'],";
                }
                js = js.TrimEnd(",".ToCharArray());
                js += "]]";
                return js;
            }
            else
            {
                return string.Empty;
            }
        }
        #endregion

        protected override void OnLoad(EventArgs e)
        {
            base.OnLoad(e);
            if (!IsPostBack)
            {
                PopulateCompletedByName();
            }
            RegisterContactCallBackScript();
        }

        private void PopulateCompletedByName()
        {
            ProjectManagementDa projDa = new ProjectManagementDa();
            DataView contactsList = projDa.GetAllContacts().DefaultView;
            contactsList.Sort = "Name ASC";
            FindCompletedByName.DataSource = contactsList;
            FindCompletedByName.DataBind();
        }

        protected override void PopulateDiseaseState(string strDiseaseState)
        {
            diseaseStates = new List<string>(strDiseaseState.Split(','));
            DiseaseState disState = (DiseaseState)this.FindControl("DiseaseStateEditor");
            if (disState != null)
                disState.PopulateDiseaseStateLOI(diseaseStates, true);
        }
    }
}