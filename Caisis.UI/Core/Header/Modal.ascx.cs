using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Caisis.Controller;
using System.Data;

using Caisis.UI.Core.Classes;

namespace Caisis.UI.Core.Header
{
    public partial class Modal : HeaderControl
    {

        protected bool DoubleSidedPrintEnabled;
        protected bool DoubleSidedPrintPreference;

        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);

            setDoubleSidedToggle();
        }


        public Modal()
            : base()
        {
            // register adjust script on load
            this.Load += (a, b) =>
            {
                RegisterDOMAdjustScript();
            };
        }

        /// <summary>
        /// Registers a script for adjusting the modal DOM
        /// </summary>
        private void RegisterDOMAdjustScript()
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "InitModalWindow", "initModalWindow();", true);
        }

        private void setDoubleSidedToggle()
        {
            // this is for EForms only at this time - jf
            DoubleSidedPrintEnabled = false;

            System.Xml.XmlDocument xDoc = XmlUtil.GetModulesConfigXml();
            string DSPrintConfig = xDoc.SelectSingleNode("/modules//module[@name='EForms']/configuration/allowDoubleSided") != null ? xDoc.SelectSingleNode("/modules//module[@name='EForms']/configuration/allowDoubleSided").InnerText : string.Empty;
            if (DSPrintConfig.Length > 0 && bool.TryParse(DSPrintConfig, out DoubleSidedPrintEnabled))
            {
                if (DoubleSidedPrintEnabled)
                {
                    DoubleSidedPrintPreference = UserPrefDoubleSided();
                }
                else
                {
                    DoubleSidedPrintPreference = false;
                }
            }
        }


        private bool UserPrefDoubleSided()
        {

            bool preferDoubleSided = false;

            UserController uc = new UserController();

            DataTable dt = uc.GetUserAttributesByType("Forms Preference");

            if (dt.Rows.Count > 0)
            {
                foreach (DataRow dr in dt.Rows)
                {
                    if (dr[BOL.UserAttribute.UserAttributeName].ToString().ToUpper() == "DOUBLESIDEDPRINTING")
                    {
                        bool.TryParse(dr[BOL.UserAttribute.UserAttributeValue].ToString(), out preferDoubleSided);
                    }
                }
            }


            return preferDoubleSided;
        }


    }
}