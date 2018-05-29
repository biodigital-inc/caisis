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
using System.Linq;
using System.Xml;

using Caisis.Security;
using Caisis.BOL;
using Caisis.DataAccess;
using Caisis.UI.Core.Classes;
using Caisis.UI.Core.Classes.CustomControls;

namespace Caisis.UI.Modules.ProtocolMgmt
{
    public partial class PatientBaseline : ProtocolMgmtPatientBasePage
    {
        protected override void Page_Load(object sender, EventArgs e)
        {
            LoadBaselineForm();
            if (!Page.IsPostBack)
            {
                PopulateBaselineForm();
            }
        }

        protected void SaveBaselineClick(object sender, EventArgs e)
        {
            SaveBaselineForm();
        }

        protected void BuildControlNames(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Repeater controlNamesRptr = e.Item.FindControl("ControlNamesRptr") as Repeater;
                object controlNames = DataBinder.Eval(e.Item.DataItem, "ControlNames");
                controlNamesRptr.DataSource = controlNames;
                controlNamesRptr.DataBind();
            }
        }

        private void LoadBaselineForm()
        {
            // get the current disease
            CustomPrincipal cp = System.Threading.Thread.CurrentPrincipal as CustomPrincipal;
            string disease = cp.UserProfile["diseaseView"].ToString();

            XmlDocument xmlDoc = XmlUtil.GetXmlDoc("~/Modules/ProtocolMgmt/DataEntryForms/GUPCCTCBaseline.xml");
            // special bizo logic
            XmlNode formNode = xmlDoc.SelectSingleNode("/form");
            string appendToUserName = formNode != null && formNode.Attributes["appendToUserName"] != null ? formNode.Attributes["appendToUserName"].Value : "";

            // load components
            foreach (XmlNode node in xmlDoc.SelectNodes("//formItem"))
            {
                string controlName = node.Attributes["controlName"].Value;
                string fullControlName = controlName + ".ascx";
                string displayName = node.Attributes["displayName"].Value + "";

                Control control = null;
                string diseasePath = string.Format("~/Modules/{0}/DataEntryForms/{1}", disease, fullControlName);
                // check disease path for control
                if (System.IO.File.Exists(Server.MapPath(diseasePath)))
                {
                    control = this.LoadControl(diseasePath);
                }
                // otherwise, check other moduels
                else
                {
                    string folder = Caisis.UI.Core.Classes.XmlUtil.GetParentModuleDirectory(fullControlName, "DataEntryForms");
                    string modulesPath = string.Format("~/Modules/{0}/DataEntryForms/{1}", folder, fullControlName);
                    if (System.IO.File.Exists(Server.MapPath(modulesPath)))
                    {
                        control = this.LoadControl(modulesPath);
                    }
                }

                if (control is BaseDataEntryControl)
                {
                    // load component
                    BaseDataEntryControl dataEntryControl = control as BaseDataEntryControl;
                    HtmlGenericControl componentHolder = new HtmlGenericControl("div");
                    // set attributes
                    componentHolder.Attributes["id"] = controlName;
                    componentHolder.Attributes["class"] = "DataEntryComponent";
                    componentHolder.Controls.Add(control);
                    // set bizo append
                    if (!string.IsNullOrEmpty(appendToUserName))
                        dataEntryControl.AppendToUserName = appendToUserName;
                    BaselineFormComponents.Controls.Add(componentHolder);
                }
            }
            var navigation = from node in xmlDoc.SelectNodes("//formSection").Cast<XmlNode>()
                             select new
                             {
                                 SectionName = node.Attributes["name"].Value,
                                 ControlNames = from control in node.SelectNodes("formItem").Cast<XmlNode>()
                                                select new
                                                {
                                                    ControlName = control.Attributes["controlName"].Value,
                                                    DisplayName = control.Attributes["displayName"].Value
                                                }
                             };
            // load navigation
            NavigationRptr.DataSource = navigation;
            NavigationRptr.DataBind();
        }

        /// <summary>
        /// Populates the patient's baseline form
        /// </summary>
        private void PopulateBaselineForm()
        {
            int patientId = int.Parse(BaseDecryptedPatientId);
            int ptProtocolId = int.Parse(PatientProtocolId);
            var dataEntryControls = PageUtil.GetControls<BaseDataEntryControl>(BaselineFormPanel);
            // load patient
            Patient patient = new Patient();
            patient.Get(patientId);
            // load patient protocol
            PatientProtocol ptProtocol = new PatientProtocol();
            ptProtocol.Get(ptProtocolId);
            PatientProtocolController ptProtocolController = new PatientProtocolController(ptProtocolId);
            DateTime? onStudyDate = ptProtocolController.GetStatusDate(PatientProtocolController.OnStudy);
            DateTime? screeningFailedDate = ptProtocolController.GetStatusDate(PatientProtocolController.ScreeningFailed);
            DateTime? screeningPassedDate = ptProtocolController.GetStatusDate(PatientProtocolController.ScreeningPassed);
            // determine date ranges
            DateTime? baselineFromDate = null;
            DateTime? baselineToDate = onStudyDate ?? screeningFailedDate  ?? screeningPassedDate;

            List<ICaisisInputControl> inputs = new List<ICaisisInputControl>();
            // populate components
            foreach (BaseDataEntryControl control in dataEntryControls)
            {
                // set date ranges
                control.BaselineFromDate = baselineFromDate;
                // todo???
                control.BaselineToDate = baselineToDate;
                control.Populate();
                inputs.AddRange(CICHelper.GetCaisisInputControls(control));
            }
            // add required field
            foreach(var control in inputs.Where(i => i.Required).OfType<WebControl>()){
                control.Attributes["data-required"] = "true";
            }
        }

        /// <summary>
        /// Saves the patient's baseline form
        /// </summary>
        private void SaveBaselineForm()
        {
            var inputs = CICHelper.GetCaisisInputControls(BaselineFormPanel);
            var dataEntryControls = PageUtil.GetControls<BaseDataEntryControl>(BaselineFormPanel);
            int patientId = int.Parse(base.BaseDecryptedPatientId);
            Patient patient = new Patient();
            patient.Get(patientId);
            List<BusinessObject> ancestors = new List<BusinessObject>();
            ancestors.Add(patient);
            foreach (BaseDataEntryControl control in dataEntryControls)
            {
                List<BusinessObject> children = new List<BusinessObject>();
                children.AddRange(control.Save());
            }
        }
    }
}
