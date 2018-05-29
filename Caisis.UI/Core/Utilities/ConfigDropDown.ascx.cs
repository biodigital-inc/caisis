using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;

using Caisis.Security;
using Caisis.BOL;
using Caisis.DataAccess;
using Caisis.Controller;

using System.Linq;
using System.Xml.Linq;

using Caisis.UI.Core.Classes;

namespace Caisis.UI.Core.Utilities
{
    /// <summary>
    /// A DropDownList bound to Caisis Configuration Objects
    /// </summary>
    public partial class ConfigDropDown : BaseControl
    {
        private static readonly string[] EFormAttributeColumns = new string[] { "displayname", "name", "disease" };
        private IEnumerable<ICaisisConfiguration> configList;
        private string DefaultEForm = "";
        private List<string> DefaultEForms;

        private string viewMode = string.Empty;
        protected string ViewMode
        {
            get
            {
                return viewMode;
            }
        }

        protected bool ViewAllItems
        {
            get
            {
                return string.IsNullOrEmpty(viewMode) || viewMode == "All";
            }
        }

        private int ItemCount = 0;

        private string cssClass = "EformDropDownList";
        public string CssClass
        {
            get
            {
                return cssClass;
            }
            set
            {
                cssClass = value;
            }
        }

        private string configTypeName;
        public string ConfigTypeName
        {
            get
            {
                return configTypeName;
            }
            set
            {
                configTypeName = value;
            }
        }

        private string onClientChange = string.Empty;
        public string OnClientChange
        {
            get
            {
                return onClientChange;
            }
            set
            {
                onClientChange = value;
            }
        }

        private string configName;

        private string formClientId;

        /// <summary>
        /// Gets or sets the html select @id attribute rendered to the client (default control ClientID)
        /// </summary>
        public string FormClientId
        {
            get
            {
                return formClientId;
            }
            set
            {
                formClientId = value;
            }
        }

        private string formClientName;

        /// <summary>
        /// Gets or sets the html select @name attribute rendered to the client (default control UniqueId)
        /// </summary>
        public string FormClientName
        {
            get
            {
                return formClientName;
            }
            set
            {
                formClientName = value;
            }
        }

        private bool groupByDisease = true;

        /// <summary>
        /// Gets or set whethere optgroup will display, nested options by disease
        /// </summary>
        public bool GroupByDisease
        {
            get
            {
                return groupByDisease;
            }
            set
            {
                groupByDisease = value;
            }
        }

        private bool filterByDiseaseView = true;

        /// <summary>
        /// Gets or sets whether list of options are filtered by disease view
        /// </summary>
        public bool FilterByDiseaseView
        {
            get
            {
                return filterByDiseaseView;
            }
            set
            {
                filterByDiseaseView = value;
            }
        }

        private bool displayBlankItem = true;

        /// <summary>
        /// Gets or sets whether blank option is rendered in select
        /// </summary>
        private bool DisplayBlankItem
        {
            get
            {
                return displayBlankItem;
            }
            set
            {
                displayBlankItem = value;
            }
        }

        private string blankItemText;

        /// <summary>
        /// Gets or sets the text of the blank option at top of select
        /// </summary>
        public string BlankItemText
        {
            get
            {
                return blankItemText;
            }
            set
            {
                blankItemText = value;
            }
        }

        private string noItemsText;

        /// <summary>
        /// Gets or sets the text which is displayed when no options exists 
        /// </summary>
        public string NoItemsText
        {
            get
            {
                return noItemsText;
            }
            set
            {
                noItemsText = value;
            }
        }



        private bool useUserDefault = true;
        /// <summary>
        /// Gets or sets whether blank option is rendered in select
        /// </summary>
        public bool UseUserDefault
        {
            get
            {
                return useUserDefault;
            }
            set
            {
                useUserDefault = value;
            }
        }



        private string _value;

        /// <summary>
        /// Gets or sets the text which is displayed when no options exists 
        /// </summary>
        public virtual string Value
        {
            get
            {
                return _value;
            }
            set
            {
                _value = value;
            }
        }



        protected override void Page_Load(object sender, EventArgs e)
        {
            // set view mode
            viewMode = new SecurityController().GetViewMode();
            BuildEFormDropDownList();
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="e"></param>
        protected override void OnPreRender(EventArgs e)
        {
            if (ItemCount == 0 && !ViewAllItems)
            {
                string noText = string.Empty;
                if (!string.IsNullOrEmpty(NoItemsText))
                {
                    noText = NoItemsText;
                }
                else
                {
                    if (FilterByDiseaseView)
                    {
                        string noItemOfTypeInDiseaseView = string.Format("--- No {0} {1} ---", Server.HtmlEncode(ViewMode), configName);
                        noText = string.Format(NoItemsLiteral.Text, "\"", noItemOfTypeInDiseaseView);
                    }
                    else
                    {
                        string noItemOfType = string.Format("--- No {0} ---", configName);
                        noText = string.Format(NoItemsLiteral.Text, "\"", noItemOfType);
                    }
                }
                NoItemsLiteral.Text = noText;
                NoItemsLiteral.Visible = true;
                BlankItem.Visible = false;
            }
            else
            {
                string bItemText = Server.HtmlEncode(!string.IsNullOrEmpty(BlankItemText) ? BlankItemText : string.Empty);
                BlankItem.Text = string.Format(BlankItem.Text, "\"", bItemText);
                // determine if blank item should be displayed
                BlankItem.Visible = DisplayBlankItem;
            }
            base.OnPreRender(e);
        }

        /// <summary>
        /// 
        /// </summary>
        public void BuildEFormDropDownList()
        {
            if (ConfigTypeName == typeof(PaperFormConfig).Name)
            {
                configName = "Paper Form";
                // filter list if needed
                configList = CaisisConfiguration.GetPaperFormConfigList().OfType<ICaisisConfiguration>();

            }
            else if (ConfigTypeName == typeof(EformConfig).Name)
            {
                configName = "Eform";
                configList = CaisisConfiguration.GetEformsConfigList().OfType<ICaisisConfiguration>();
                DefaultEForm = UserPrefDefaultEForm();
                DefaultEForms = UserPrefDefaultEForms();

            }
            // finally, filter out only active nodes
            configList = configList.Where(c => !string.IsNullOrEmpty(c.DisplayName) && c.Active);

            // get distinct list of diseases
            var diseases = configList.SelectMany(c => c.Diseases).Distinct();

            // bind outer repeater
            EformDropDownRptr.DataSource = diseases;
            EformDropDownRptr.DataBind();
        }

        /// <summary>
        /// For each disease build eforms for disease
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void BindDiseaseEforms(object sender, RepeaterItemEventArgs e)
        {
            Repeater srcRptr = sender as Repeater;
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                string disease = e.Item.DataItem.ToString();
                Repeater diseaseEforms = e.Item.FindControl("DiseaseEformsRptr") as Repeater;
                Literal noItemsOption = e.Item.FindControl("NoItemsLiteral") as Literal;
                // Under each disease, the eforms are filtered
                var filteredList = configList.Where(c => c.Diseases.Contains(disease));
                // this disease's items should only be rendered if they are in "All" view
                // or if they belong to the current "View"
                if (ViewAllItems || viewMode == disease || !FilterByDiseaseView)
                {
                    diseaseEforms.DataSource = filteredList;
                    diseaseEforms.DataBind();
                    ItemCount += filteredList.Count();
                }
            }
        }

        /// <summary>
        /// When in "All" mode, show optgroup, else hide when in disease specific mode 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void SetEformVisibility(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Header || e.Item.ItemType == ListItemType.Footer)
            {
                // when viewing all AND no list of MULTIPLE Default EForms
                if (GroupByDisease && (ViewAllItems || !FilterByDiseaseView) && (ConfigTypeName != typeof(EformConfig).Name || (ConfigTypeName == typeof(EformConfig).Name && DefaultEForms.Count < 1)))
                {
                    e.Item.Visible = true;
                }
                else
                {
                    e.Item.Visible = false;
                }
            }
            else if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {

                string displayValue = ((ICaisisConfiguration)e.Item.DataItem).DisplayValue.Replace(" ", "").ToUpper();

                if (!String.IsNullOrEmpty(Value) && Value.Equals(displayValue))
                {
                    Literal defaultselection = e.Item.FindControl("defaultselection") as Literal;
                    defaultselection.Text = "selected=\"selected\"";
                }
                // set default selection
                else if (useUserDefault)
                {
                        Literal defaultselection = e.Item.FindControl("defaultselection") as Literal;
                    if (DefaultEForm.Length > 0 && (DefaultEForm.Equals(displayValue)))
                    {
                        defaultselection.Text = "selected=\"selected\"";
                    }
                    if (ConfigTypeName == typeof(EformConfig).Name && DefaultEForms.Count > 0 && !DefaultEForms.Contains(displayValue.Replace(" ", "").ToUpper())) e.Item.Visible = false; //defaultselection.Text = "data-test=\"" + displayValue + "\"";

                }

                
            }

        }


        protected string UserPrefDefaultEForm()
        {

            string defaultEForm = "";

            UserController uc = new UserController();

            DataTable dt = uc.GetUserAttributesByType("EForms Preference");

            if (dt.Rows.Count > 0)
            {
                foreach (DataRow dr in dt.Rows)
                {
                    if (dr[BOL.UserAttribute.UserAttributeName].ToString().ToUpper() == "DEFAULT EFORM" && !dr[BOL.UserAttribute.UserAttributeValue].ToString().Contains(","))
                    {
                        defaultEForm = dr[BOL.UserAttribute.UserAttributeValue].ToString().Replace(" ", "").ToUpper();
                        break;
                    }
                }
            }


            return defaultEForm;
        }


        protected List<string> UserPrefDefaultEForms()
        {

            List<string> DefaultEForms = new List<string>();


            UserController uc = new UserController();

            DataTable dt = uc.GetUserAttributesByType("EForms Preference");

            if (dt.Rows.Count > 0)
            {
                foreach (DataRow dr in dt.Rows)
                {
                    if (dr[BOL.UserAttribute.UserAttributeName].ToString().ToUpper() == "DEFAULT EFORM" && dr[BOL.UserAttribute.UserAttributeValue].ToString().Contains(","))
                    {
                        char[] c = { ',' };

                        string[] s = dr[BOL.UserAttribute.UserAttributeValue].ToString().Split(c);

                        foreach (string defaultEForm in s)
                        {
                            DefaultEForms.Add(defaultEForm.Replace(" ", "").ToUpper());
                        }

                        break;
                    }
                }
            }


            return DefaultEForms;
        }
    }
}