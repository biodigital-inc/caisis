using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

using Caisis.Controller;
using Caisis.Extensions;
using Caisis.BOL;
using Caisis.UI.Core.Classes.CustomControls;

namespace Caisis.UI.Core.DynamicEforms
{
	public partial class Eform : System.Web.UI.Page
	{

        /// <summary>
        /// Returns if accessing from Patient Data Entry (via query string pde=true)
        /// </summary>
        protected bool IsPatientData
        {
            get
            {
                return Request.QueryString["pde"] == bool.TrueString.ToLower();
            }
        }

        /// <summary>
        /// Gets if the current date entry workflow is in preview mode
        /// </summary>
        protected bool IsPreview
        {
            get
            {
                string preview = Request.QueryString["preview"];
                return !string.IsNullOrEmpty(preview) && bool.Parse(preview);
            }
        }

		IEnumerable<BOL.IBusinessObject> businessObjects = null;
		List<EformPage> eformPages = new List<EformPage>();
		EformPage currentPage;
		EformSection currentSection;
		EformPageTitleListItem currentTitleItem;
		int currentPageNumber;

		// TODO: refactor encapsulation/interaction between Eform and DataEntryController
		DataEntryController controller = new DataEntryController(CICHelper.InvokeInputControl);

		// TODO: control for navigation title

		// validation members
		List<Control> controlsToValidate = new List<Control>();
		List<GridView> gridsToValidate = new List<GridView>();

		int? patientId = null;
		
		protected override void OnInit(EventArgs e)
		{
			base.OnInit(e);

			string eformName = Request["eformName"] ?? "Baseline";
			string pidString = Request["pid"];
			string paid = Request["paid"];

            // no need for patient id in preview mode
            if (!IsPreview)
            {
                object sessionPtId = Session[Caisis.UI.Core.Classes.SessionKey.PatientId];

                if (!string.IsNullOrEmpty(pidString))
                    patientId = int.Parse(pidString);

                else if (!string.IsNullOrEmpty(paid))
                    patientId = int.Parse(Caisis.Security.CustomCryptoHelper.Decrypt(paid));
                // patient from session???
                else if (sessionPtId != null && sessionPtId != "")
                    patientId = (int)sessionPtId;
            }
            

			Action<string, int> addPage = AddEformPage;
			Action<string, bool, int, int> addDynamicSection = AddEformSection;
			Action<string, bool, string> addStaticSection = null;

			// initialize the form structure
			IEnumerable<XElement> metadataList = EformMetadata.GetMetadata(eformName, addPage, addDynamicSection, addStaticSection);

			// handle final title item
			if (currentTitleItem != null)
				PageTitles.Controls.Add(currentTitleItem);
			
			Action<BOL.BusinessObject, string, IDictionary<string, string>> addControl = AddControl;
			Action<Func<IEnumerable<IBusinessObject>>, Action<IBusinessObject>, IEnumerable<string>, XElement> addGrid = 
				(f, a, c, x) => AddGrid(f, a, x);
			Action<string> doTransition = null;

			string identifier = null;
			int? identiferValue = null;

            bool isBaselineForm = eformName.Equals("Baseline", StringComparison.CurrentCultureIgnoreCase);

			// baseline eform will be a future subclass that handles this via GetIdentifier(), GetIdentifierValue() overrides
            if (isBaselineForm)
			{
                identifier = Patient.PatientId;
				identiferValue = patientId;
			}

			businessObjects = BusinessObject.Convert(metadataList, addControl, addGrid, doTransition, identifier, identiferValue);
            
            foreach (EformPage page in eformPages)
            {
                PagePanel.Controls.Add(page);
            }

            // SPECIAL CASE: for biz which are 1-1 or patient biz
            //               get a list of biz where pri-key and foreign-key are patient id
            // NOTE: only process in special cases
            if (!isBaselineForm && patientId.HasValue)
            {
                IEnumerable<IBusinessObject> parentPriKeyIsPatient = from biz in businessObjects
                                                                     where biz.PrimaryKeyName == Patient.PatientId && biz.ParentKeyName == Patient.PatientId
                                                                     select biz;
                // during load, popuplate special biz objects objects
                if (parentPriKeyIsPatient.Count() > 0)
                {
                    // load biz by patient id
                    foreach (IBusinessObject biz in parentPriKeyIsPatient)
                    {
                        biz.Get(patientId.Value);
                    }
                }
            }

            // supress navigation on preview mode
            if (IsPreview)
            {
                SaveButton.Visible = false;
            } 			
		}

		protected void SaveButton_Click(object sender, EventArgs e)
		{
			Save(false);
            RegisterOnUpdateScript();
		}

		protected override void OnPreRender(EventArgs e)
		{
			base.OnPreRender(e);

			Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "validationLists", GetValidationScript(), true);
		}

		private void AddEformPage(string title, int pageNumber)
		{
			currentSection = null;

			currentPage = LoadControl("~/Core/DynamicEforms/EformPage.ascx") as EformPage;
			currentPageNumber = pageNumber;

			if (currentTitleItem != null)
				PageTitles.Controls.Add(currentTitleItem);

			currentTitleItem = LoadControl("~/Core/DynamicEforms/EformPageTitleListItem.ascx") as EformPageTitleListItem;
			currentTitleItem.Title = title;

			eformPages.Add(currentPage);
		}

		private void AddEformSection(string title, bool showTitle, int rows, int columns)
		{
			if (currentTitleItem != null)
				currentTitleItem.AddSectionName(title);

			currentSection = LoadControl("~/Core/DynamicEforms/EformSection.ascx") as EformSection;
			currentSection.Title = title;
			currentSection.ShowTitle = showTitle;
			currentSection.Rows = rows;
			currentSection.Columns = columns;

			currentPage.AddSection(currentSection);
		}

		private void AddControl(Control c, int page, int section, int row, int column)
		{
			eformPages[page - 1].AddControlToSection(c, section - 1, row, column);
		}

		private void AddControl(BOL.BusinessObject b, string fieldname, IDictionary<string, string> extensions)
		{
			ICaisisInputControl control = controller.BuildControl(b, fieldname);

			// TODO: handle control.Required via js list
			if (control.Required)
				controlsToValidate.Add(control as Control);

			// kill the labels and help
			control.ShowHelpBubble = false;
			// control.ShowLabel = false;

			// use extensions to find page#, section#, row#, column#
			int page = int.Parse(extensions["Page"]);
			int section = int.Parse(extensions["Section"]);
			int row = int.Parse(extensions["Row"]);
			int column = int.Parse(extensions["Column"]);

			Panel panel = new Panel();
			panel.CssClass = "dataEntrControlCell";
			panel.Controls.Add(control as Control);

			AddControl(panel, page, section, row, column);
		}

		private void AddGrid(Func<IEnumerable<Caisis.BOL.IBusinessObject>> datasource, Action<Caisis.BOL.IBusinessObject> adder, XElement metadata)
		{
			//string name = BOL.BusinessObject.GetTableLabel(metadata.Name.LocalName);
			string name = metadata.Name.LocalName;
			KeyValuePair<GridView, ImageButton> kvp = controller.BuildGrid(datasource, adder, metadata, name);

			GridView grid = kvp.Key;
			ImageButton addNewButton = kvp.Value;

			gridsToValidate.Add(grid);

			grid.DataBind();
			grid.DataKeyNames = null; // workaround for ControlState bogosity

			// TODO: optimize by using XAttribute
			Dictionary<string, string> extensions = new Dictionary<string, string>();
			metadata.Attributes().ForEach(a => extensions[a.Name.LocalName] = a.Value);

			// use extensions to find page#, section#, row#, column#
			int page = int.Parse(extensions["Page"]);
			int section = int.Parse(extensions["Section"]);
			int row = int.Parse(extensions["Row"]);
			int column = int.Parse(extensions["Column"]);

			Panel panel = new Panel();
			panel.CssClass = "dataEntrControlCell";

			panel.Controls.Add(grid);
			panel.Controls.Add(addNewButton);
			
			AddControl(panel, page, section, row, column);
		}

		private void Save(bool useXml)
		{
			foreach (BusinessObject b in businessObjects)
			{
				if (b.HasField(Patient.PatientId) &&
					b.IsNull(Patient.PatientId) &&
					patientId.HasValue)
				{
					b[Patient.PatientId] = patientId.Value;
				}
			}

			if (useXml)
			{
				// do something else
				// XmlWriter writer = .... // wrap a db call to Eforms in an XmlWriter
				// businessObject.ToXElement().Save()
			}
			else
			{
				businessObjects.ForEach(b => b.Save());
			}
		}

		private string GetValidationScript()
		{
			StringBuilder b = new StringBuilder();

			controlsToValidate.ForEach(c => b.AppendLine("fieldValidationList.push('" + c.ClientID + "');"));
			gridsToValidate.ForEach(g => b.AppendLine("gridValidationList.push('" + g.ID + "');"));

			return b.ToString();
		}

        /// <summary>
        /// 
        /// </summary>
        private void RegisterOnUpdateScript()
        {
            string script = "if(window.top.endDynamicEformDataEntry) { window.top.endDynamicEformDataEntry.call(window.top); } ";
            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "RegsiterOnSave", script, true);
        }
	}
}
