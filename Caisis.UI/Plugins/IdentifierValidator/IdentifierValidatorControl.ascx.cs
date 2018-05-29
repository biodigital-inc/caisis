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
using Caisis.Controller;
using Caisis.DataAccess;
using Caisis.UI.Core.Classes;
using Caisis.UI.ClientScript.Ajax;
using Caisis.UI.Core.Classes.CustomControls;
using Caisis.UI.Core;
using Caisis.PluginFramework;

using System.Linq;


namespace Caisis.UI.Plugins.Identifiers
{
    public partial class IdentifierValidatorControl : CaisisPlugin
    {
        /// <summary>
        /// The default id of the save button
        /// </summary>
        protected static readonly string SAVE_BUTTON_ID = "SaveBtn";

        /// <summary>
        /// The script which will initiate postback
        /// </summary>
        protected static readonly string SAVE_VALIDATION_SCRIPT = "doSaveOnIndentifierValidated";

        private static readonly string DEFAULT_IDENTIFIER = "MRN";

        private string identifierName = DEFAULT_IDENTIFIER;

        private string identifierControlId;

        /// <summary>
        /// Gets or sets the Identifier to search for (i.e., PathNum, etc..., default MRN)
        /// </summary>
        public virtual string IdentifierName
        {
            get
            {
                return identifierName;
            }
            set
            {
                identifierName = value;
            }
        }

        /// <summary>
        /// Gets or sets the identifier control id
        /// </summary>
        public virtual string IdentifierControlId
        {
            get
            {
                return identifierControlId;
            }
            set
            {
                identifierControlId = value;
            }
        }

        public string saveButtonId = SAVE_BUTTON_ID;

        public string SaveButtonId
        {
            get
            {
                return saveButtonId;
            }
            set
            {
                saveButtonId = value;
            }
        }

        private string saveButtonClientId = "";

        /// <summary>
        /// Gets the client id of the SaveButton
        /// </summary>
        protected string SaveButtonClientId
        {
            get
            {
                return saveButtonClientId;
            }
        }

        public IdentifierValidatorControl()
            : base()
        {

            // register late bound client id
            this.PreRender += (o, e) => RegisterScript();
            this.Load += (o, e) => RegisterSaveValidation();
        }

        /// <summary>
        /// 
        /// </summary>
        private void RegisterSaveValidation()
        {
            if (!string.IsNullOrEmpty(SaveButtonId))
            {
                // find save button
                ImageButton saveBtn = PageUtil.RecursiveFindControl(this as Control, saveButtonId) as ImageButton;
                // if found, add validation
                if (saveBtn != null)
                {
                    PageUtil.RegitserControlPostBackScript(saveBtn, SAVE_VALIDATION_SCRIPT);
                    saveButtonClientId = saveBtn.ClientID;
                }
            }
        }

        /// <summary>
        /// During pre-render, get the late bound clientid of the identifier field and register validation script on control
        /// </summary>
        private void RegisterScript()
        {
            List<string> validateFields = new List<string>();
            if (!string.IsNullOrEmpty(IdentifierControlId))
            {
                Control idField = PageUtil.RecursiveFindControl(this, IdentifierControlId);
                if (idField != null)
                {
                    validateFields.Add((idField as Control).ClientID);
                }
            }
            else
            {
                foreach (ICaisisInputControl icic in PageUtil.GetCaisisInputControlsInContainer(Page))
                {
                    if (!string.IsNullOrEmpty(icic.Table) && icic.Table == "Patients" && !string.IsNullOrEmpty(icic.Field) && icic.Field == Patient.PtMRN)
                    {
                        string IdFieldClientId = (icic as Control).ClientID;
                        validateFields.Add(IdFieldClientId);
                    }
                }
            }
            if (validateFields.Count > 0)
            {
                string clientScriptKey = "ValidateIdentifier";
                string clientFieldArray = "['" + string.Join("','", validateFields.ToArray()) + "']";
                string clientScript = string.Format("initValidateIdentifierFields({0});", clientFieldArray);
                Page.ClientScript.RegisterStartupScript(this.GetType(), clientScriptKey, clientScript, true);
            }
        }

        /// <summary>
        /// Method which is invoked by client callback and validates identifier value against db value
        /// </summary>
        /// <param name="e"></param>
        protected void HandleValidationCallback(CaisisAjaxEventArgs e)
        {
            PatientController pc = new PatientController();
            string validateFieldValue = e.ClientParams["Identifier"];
            bool isNew = false;
            try
            {
                UserController uc = new UserController();

                // search by MRN
                if (IdentifierName == DEFAULT_IDENTIFIER)
                {
                    if (uc.CanSearchIdentifier("LastNameMRN"))
                    {
                        isNew = pc.IsNewMRN(validateFieldValue,int.Parse(Session[SessionKey.DatasetId].ToString()));
                    }
                }
                // search by identifier
                else
                {
                    if (uc.CanSearchIdentifier(IdentifierName))
                    {
                        IdentifierDa da = new IdentifierDa();
                        isNew = !da.DoesIdentifierExist(validateFieldValue, IdentifierName);
                    }
                }               
            }
            catch (ClientException ex)
            {
                isNew = false;
            }
            // echo back a list of key value pairs to client
            foreach (string key in e.ClientParams.Keys)
            {
                e.ReturnParams.Add(key, e.ClientParams[key]);
            }
            // add if is new identifier value
            e.ReturnParams.Add("IsNew", isNew.ToString().ToLower());
            e.ReturnParams.Add("IdentifierName",IdentifierName);
        }

        #region CaisisPlugin members

        public override string ControlIdToModify
        {
            get
            {
                return null; //since we aren't modifying any controls on the parent page, just return null.
            }
        }

        public override PluginType Type
        {
            get
            {
                return PluginType.WebControl;
            }
        }

        public override string Name
        {
            get
            {
                return "Identifier Validator";
            }
        }

        #endregion
    }
}