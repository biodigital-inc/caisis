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
using Caisis.UI.Core;
using Caisis.PluginFramework;

using System.Linq;


namespace Caisis.UI.Plugins.SurveyPlugin
{
    public partial class SurveyControl : CaisisPlugin
    {
        protected bool showNextToField = true;

        public bool ShowNextToField
        {
            get
            {
                return showNextToField;
            }
            set
            {
                showNextToField = value;
            }
        }

        /// <summary>
        /// Returns a client script array containing all surveys
        /// </summary>
        protected string ClientMetaSurveyList
        {
            get
            {
				//MetadataSurvey metaSurveyBiz = new MetadataSurvey();
				//metaSurveyBiz.GetAll();
                //IEnumerable<string> surveys = from survey in metaSurveyBiz.DataSourceView.Table.AsEnumerable()
				IEnumerable<string> surveys = from survey in BusinessObject.GetAll<MetadataSurvey>()
                                              let escapedTitle = PageUtil.EscapeSingleQuotes(survey[MetadataSurvey.SurveyType].ToString())
                                              select string.Format("'{0}'", escapedTitle);

                return string.Join(",", surveys.ToArray());
            }
        }

        private string surveyTypeClientId;
        /// <summary>
        /// 
        /// </summary>
        protected string SurveyTypeClientId
        {
            get
            {
                return surveyTypeClientId;
            }
            set
            {
                surveyTypeClientId = value;
            }
        }

        private string clientSurveyFieldsLookup = string.Empty;

        /// <summary>
        /// 
        /// </summary>
        protected string ClientSurveyFieldsLookup
        {
            get
            {
                return clientSurveyFieldsLookup;
            }
        }

        private string activeSurveyType = string.Empty;

        /// <summary>
        /// Returns the survey type of exisitng record
        /// </summary>
        protected string ActiveSurveyType
        {
            get
            {
                return PageUtil.EscapeSingleQuotes(activeSurveyType);
            }
        }


        public SurveyControl()
            : base()
        {
            // during pre-render, registers scripts and adjust links
            this.PreRender += (a, b) =>
                {
                    RegisterInitScript();
                    SetNavigationLinks();
                };
        }

        protected override void OnLoad(EventArgs e)
        {
            base.OnLoad(e);
            if (!Page.IsPostBack)
            {
                PopulateSurveyFromQuery();
            }
            // register client script to init default events (check if plugin visible)
            Page.ClientScript.RegisterStartupScript(this.GetType(), "RegisterSurveyPlugin_" + this.UniqueID, "if(window.initSurveyField) { initSurveyField(); }", true);
        }              

        /// <summary>
        /// Sets the current SurveyId for the plugin (for updating existing Surveys). 
        /// </summary>
        /// <param name="surveyId"></param>
        public void SetSurveyIdField(string surveyId)
        {
            SurveyIdField.Value = surveyId;
        }

        /// <summary>
        /// Set visibility of create/update links based on if in context of new/exisiting
        /// </summary>
        private void SetNavigationLinks()
        {
            if (!string.IsNullOrEmpty(SurveyIdField.Value))
            {
                NewSurveyLink.Visible = false;
                PrintSurveyLink.Visible = true;
            }
            else
            {
                NewSurveyLink.Visible = true;
                PrintSurveyLink.Visible = false;
            }
        }

        /// <summary>
        /// Initilizes the SurveyId field based on query string params.
        /// </summary>
        private void PopulateSurveyFromQuery()
        {
            string tableName = Request.QueryString["tableName"];
            string surveyId = Request.QueryString["primKey"];
            if (!string.IsNullOrEmpty(tableName) && tableName.Equals("Surveys") && !string.IsNullOrEmpty(surveyId))
            {
                SurveyIdField.Value = surveyId;
            }
        }

        /// <summary>
        /// Set SurveyType client id, as well as generate lookup array [field,field client id].
        /// </summary>
        private void RegisterInitScript()
        {
            Survey surveyBiz = new Survey();

            List<ICaisisInputControl> iCICs = PageUtil.GetCaisisInputControlsInContainer(Page);
            foreach (ICaisisInputControl iCIC in iCICs)
            {
                // set survey type client id, for getting user selected SurveyType
                if (iCIC.Table == surveyBiz.TableName && iCIC.Field == Survey.SurveyType)
                {
                    Control iControl = iCIC as Control;
                    SurveyTypeClientId = iControl.ClientID;
                    activeSurveyType = iCIC.Value;
                    break;
                }
            }
            // build js array of [field,client id]
            IEnumerable<string> fieldsToClientId = from field in iCICs
                                                   where field.Table == surveyBiz.TableName && field.Field != Survey.SurveyType
                                                   select string.Format("['{0}','{1}']", field.Field, (field as Control).ClientID);

            clientSurveyFieldsLookup = string.Join(",", fieldsToClientId.ToArray());
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
                return "Survey Control";
            }
        }

        #endregion

    }
}
