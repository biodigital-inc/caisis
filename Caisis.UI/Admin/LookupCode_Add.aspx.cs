using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Caisis.BOL;
using Caisis.DataAccess;
using Caisis.UI.Core.Classes;

namespace Caisis.UI.Admin
{
    public partial class LookupCode_Add : AdminBasePage
    {
        private DataTable lkpFields;

        private IEnumerable<string> LookupFieldNames
        {
            get
            {
                if (lkpFields == null)
                {
                    LookupCodeDa da = new LookupCodeDa();
                    lkpFields = da.GetLookupFieldNames().Tables[0];
                }
                return from field in lkpFields.AsEnumerable()
                       select field[LookupCode.LkpFieldName].ToString();
            }
        }

        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);
            RegisterCurrentCodes();
        }

        protected void AddLkpCode(object sender, EventArgs e)
        {
            bool isValid = ValidateLkpFieldName(LkpFieldName.Text);
            if (isValid)
            {
                LookupCode lkpCode = new LookupCode();
                lkpCode[LookupCode.LkpFieldName] = LkpFieldName.Text;
                lkpCode[LookupCode.LkpSuppress] = 0;
                lkpCode[LookupCode.LkpCode] = "[enter]";
                lkpCode.Save();

                string lkpFieldName = PageUtil.EscapeSingleQuotes(LkpFieldName.Text);
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Reload", "closeAndReloadLkpCode('" + lkpFieldName + "')", true);
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "WarnDuplicateField", "alert('The " + LookupCode.LkpFieldName + " already exists, please enter a new value.')", true);
            }
        }

        /// <summary>
        /// Regitser a list of current lookup field names
        /// </summary>
        private void RegisterCurrentCodes()
        {
            string[] clientArray = LookupFieldNames.Select(f => PageUtil.EscapeSingleQuotes(f)).ToArray();
            string clientScriptArray = "['" + string.Join("','", clientArray) + "'];";
            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "CURRENT_LKPFIELDS", "var CURRENT_LKPFIELDS = " + clientScriptArray, true);
        }

        /// <summary>
        /// Validates a LkpFieldName, not empty and doesn't already exist
        /// </summary>
        /// <param name="lkpField"></param>
        /// <returns></returns>
        private bool ValidateLkpFieldName(string lkpField)
        {
            bool isValid = false;
            if (!string.IsNullOrEmpty(lkpField) && !lkpField.Trim().Equals(string.Empty))
            {
                isValid = !LookupFieldNames.Contains(lkpField, StringComparer.OrdinalIgnoreCase);
            }
            return isValid;
        }
    }
}
