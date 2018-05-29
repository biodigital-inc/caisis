using System;
using System.Collections;
using System.Data;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Xml;
using System.Collections.Generic;

using Caisis.BOL;
using Caisis.Controller;
using Caisis.UI.Core.Classes.CustomControls;
using Caisis.UI.Core.Classes;



namespace Caisis.UI.Core.Classes
{
	/// <summary>
	/// Iterates over xml document and populates the values of input fields within eform controls.
	/// </summary>
	public class BaseEFormControl : Caisis.UI.Core.Classes.BaseClinicFormControl  
	{
        private static readonly string XML_MISSMATCH_ERROR = "Eform XML/Control Mismatch";

		protected int _patientId;
		protected string _eformName;
		protected bool disableEformHiddenControls = false;

        protected int _eformId;
        private string _title;
        private string _associatedEformName;
        private string _associatedEformSectionName;
        private string _lookupCodes;

        static string disabledHelpText = "Disabled: This field was added since this EForm was initiated, and cannot be accessed.";

		public BaseEFormControl()
		{
		}

        public String Title
        {
            get { return _title; }
            set { _title = value; }
        }

        public String AssociatedEformName
        {
            get { return _associatedEformName; }
            set { _associatedEformName = value; }
        }

        public String AssociatedEformSectionName
        {
            get { return _associatedEformSectionName; }
            set { _associatedEformSectionName = value; }
        }
        public String LookupCodes
        {
            get { return _lookupCodes; }
            set { _lookupCodes = value; }
        }

        /// <summary>
        /// Gets if the current page is in preview mode
        /// </summary>
        public bool IsPreview
        {
            get
            {
                string qsPreview = Request.QueryString["preview"];
                return !string.IsNullOrEmpty(qsPreview) && bool.Parse(qsPreview);
            }
        }

		override protected void Page_Load(object sender, System.EventArgs e)
		{
			// view state is disabled in base control

            if (IsPreview)
            {
                _patientId = int.MinValue;
            }
            else
            {
                _patientId = int.Parse(Session[SessionKey.PatientId].ToString());
            }

			// get eform id and name from url vars
            if (Request.QueryString["eformId"] != null)
            {
                _eformId = int.Parse(Request.QueryString["eformId"]);
                EForm eb = new EForm();
                eb.Get(_eformId);
                _eformName = eb[EForm.EFormName].ToString();
            }
            else
            {
                _eformName = Request.QueryString["eform"];
            }
			
			if(!Page.IsPostBack)
			{
                this.OverrideLookupCodes();
				this.PopulateEform();
			}		
		}

        /// <summary>
        /// Sets the Title of the eform control from the "controlName" node in the Xml definition
        /// </summary>
        /// <param name="label"></param>
        protected void SetTitle(Label label)
        {
            if (!String.IsNullOrEmpty(this.Title))
            {
                label.Text = this.Title;
            }
        }
        /// <summary>
        /// Returns the eform name (not the display name) of the associated eform from the Xml definition
        /// </summary>
        /// <param name="label"></param>
        protected string GetAssociatedEformName()
        {
            if (!String.IsNullOrEmpty(this.AssociatedEformName))
                return this.AssociatedEformName;
            else
                return String.Empty;
        }
        
        /// <summary>
        /// Returns the eform section name of the associated eform from the Xml definition
        /// </summary>
        /// <param name="label"></param>
        protected string GetAssociationEformSectionName()
        {
            if (!String.IsNullOrEmpty(this.AssociatedEformSectionName))
                return this.AssociatedEformSectionName;
            else
                return String.Empty;
        }
        protected void OverrideLookupCodes()
        {
            if (!String.IsNullOrEmpty(this.LookupCodes))
            {
                char[] splitchar1 = { ',' };
                string[] lkpCodeArr = this.LookupCodes.Split(splitchar1);

                List<ICaisisInputControl> cicList = PageUtil.GetCaisisInputControlsInContainer(this);

                foreach (ICaisisInputControl con in cicList)
                {
                    if (con is ICaisisLookupControl)
                    {
                        foreach (string s in lkpCodeArr)
                        {
                            // [0] is TableName, [1] is FieldName, [2] is LookupCodeName: i.e. Procedures.ProcName.ProcName
                            char[] splitchar2 = { '.' };
                            string[] parsed = s.Trim().Split(splitchar2);

                            if (parsed.Length > 2 && parsed[0].Equals(con.Table) && parsed[1].Equals(con.Field))
                            {
                                ICaisisLookupControl lkpControl = (ICaisisLookupControl)con;
                                lkpControl.LookupCode = parsed[2];
                            }
                        }
                    }
                }
            }
        }

		/// <summary>
		///  Get xml string from database and populate parent control
		/// </summary>
		protected void PopulateEform()
		{
			EFormController ctr = new EFormController();

			//DataSet ds = ctr.GetOpenRecordByName(_patientId, _eformName);
			DataSet ds = ctr.GetRecord(_eformId);

			// get xml string from db 
			if (ds.Tables[0].Rows.Count != 0)
			{
				XmlDocument xmlDoc = new XmlDocument();

				string s = ds.Tables[0].Rows[0][Caisis.BOL.EForm.EFormXML].ToString(); // should replace col name w/ reference to BizO
				// put string in xml doc
				xmlDoc.LoadXml(s);

				if (xmlDoc.InnerXml.Length > 0)
				{
					TraverseEformControls(this.Controls, xmlDoc);
				}
			}
			else if (disableEformHiddenControls)
			{
				DisableEformHiddenControls(this.Controls);
			}
		}

		
		// this is to support some nesting work that Jay wanted to do
		private void TraverseEformControls(ControlCollection controls, XmlDocument xmlDoc)
		{
            List<IEformInputField> invalidFields = new List<IEformInputField>();
			foreach (Control con in controls)
			{
				if (con is IEformInputField)
				{
                    IEformInputField iEformField = con as IEformInputField;
                    // get raw node value
                    string nodeVal = GetNodeValue(iEformField, xmlDoc);
                    // no value found, node not found
                    if (nodeVal == null)
                    {
                        invalidFields.Add(iEformField);
                    }
                    else
                    {
                        // otherwise set control value
                        this.SetControlValue(iEformField, xmlDoc, nodeVal);
                    }
				}
				else if (con is HtmlContainerControl)
				{
					TraverseEformControls(con.Controls, xmlDoc);
				}
			}

            // Publish Error if any invalid fields found
            if (invalidFields.Count > 0)
            {
                string newLine = System.Environment.NewLine;
                string controlName = this.GetType().BaseType.Name;
                string controlPath = this.AppRelativeVirtualPath;
                // display that there was an xml mismatch
                System.Text.StringBuilder errorMessage = new System.Text.StringBuilder(string.Format("There was an error finding control values in component '{0}' in the XML Document.{1}", this.GetType().BaseType.Name, newLine));
                // display contorl and path to control
                errorMessage.AppendLine(string.Format("Control: {0}{2}Path: {1}{2}", controlName, controlPath, newLine));
                foreach (IEformInputField iEformField in invalidFields)
                {
                    // disable control
                    iEformField.Enabled = false;
                    iEformField.CssClass = "DisabledEformInputField";
                    // set tooltip
                    if (iEformField is WebControl)
                    {
                        (iEformField as WebControl).ToolTip = disabledHelpText;
                    }                    

                    string tableName = iEformField.Table;
                    string fieldName = iEformField.Field;
                    string recordId = iEformField.RecordId;
                    string parentRecordId = iEformField.ParentRecordId;
                    string controlType = iEformField.GetType().Name;
                    errorMessage.AppendLine(string.Format("{5}Table: {0}{5} Field: {1}{5} RecordId: {2}{5} ParentRecordId: {3}{5}Control Type: {4}{5}{5}", tableName, fieldName, recordId, parentRecordId, controlType, newLine));
                }
                Exception ex = new Exception(errorMessage.ToString());
                ExceptionHandler.Publish(ex, XML_MISSMATCH_ERROR);
            }
		}

		private void DisableEformHiddenControls(ControlCollection controls)
		{
			foreach (Control c in controls)
			{
				if (c is EformHidden)
				{
					EformHidden h = c as EformHidden;
					h.Disabled = true;
				}
				else
				{
					DisableEformHiddenControls(c.Controls);
				}
			}
		}

        /// <summary>
        /// 
        /// </summary>
        /// <param name="con"></param>
        /// <param name="xmlDoc"></param>
        /// <param name="inputFieldValue"></param>
        protected void SetControlValue(IEformInputField con, XmlDocument xmlDoc, string inputFieldValue)
        {
            if (inputFieldValue != null)
            {
                // TODO: collapse this into a call on the IEformInputField interface
                if (con is EformTextBox)
                {
                    EformTextBox temp = (EformTextBox)con;
                    //temp.Value = inputFieldValue;	
                    temp.Text = inputFieldValue;
                }

                else if (con is EformHidden)
                {
                    EformHidden temp = (EformHidden)con;
                    // let's experiment
                    string val = inputFieldValue;
                    if (temp.Field.EndsWith("Date")) // we want Dates enabled to pick up the DateText conversion
                    {
                        temp.Disabled = false;
                        // we need to propagate the value here, b/c it would be empty on the page
                        temp.Value = val;
                    }
                    else if (val == null || "".Equals(val))
                    {
                        temp.Disabled = true;
                    }
                    else
                    {
                        temp.Disabled = false;
                        // persist the value in this case
                        temp.Value = val;
                    }

                    // leave the value alone, keeping what was on the page;
                    // temp.Value = inputFieldValue;
                }

                else if (con is EformTextArea)
                {
                    EformTextArea temp = (EformTextArea)con;
                    //temp.Value = inputFieldValue;
                    temp.Text = inputFieldValue;
                }

                else if (con is EformDropDownList)
                {
                    EformDropDownList temp = (EformDropDownList)con;
                    //temp.Value = inputFieldValue;
                    temp.SelectedValue = inputFieldValue;
                }

                else if (con is EformComboBox)
                {
                    EformComboBox temp = (EformComboBox)con;
                    temp.Value = inputFieldValue;
                }

                //else if (con is EformRadioButtonList)
                //{
                //    EformRadioButtonList temp = (EformRadioButtonList)con;
                //    string val = inputFieldValue;

                //    if (val != null && !val.Equals(""))
                //        temp.SelectedValue = val;
                //}
                else if (con is EformRadioButtonGroup)
                {
                    EformRadioButtonGroup rg = (EformRadioButtonGroup)con;

                    // tell it to the child controls
                    foreach (Control c in rg.Controls)
                    {
                        if (c is EformRadioButton)
                        {
                            EformRadioButton rb = (EformRadioButton)c;

                            string nodeInnerText = GetNodeValue(rg, xmlDoc);

                            if (nodeInnerText != null && !"".Equals(nodeInnerText))
                            {
                                if (rb.Value.Equals(nodeInnerText))
                                {
                                    rb.Checked = true;
                                }
                            }
                        }
                    }
                }
                else if (con is EformRadioButton)
                {
                    EformRadioButton rb = (EformRadioButton)con;

                    string nodeInnerText = inputFieldValue;

                    if (nodeInnerText != null && nodeInnerText != "")
                    {
                        rb.Checked = true;
                    }
                }
                else if (con is EformCheckBox)
                {
                    EformCheckBox cb = (EformCheckBox)con;

                    string nodeInnerText = inputFieldValue;

                    if (nodeInnerText != null && nodeInnerText != "")
                    {
                        cb.Checked = true;
                    }
                }
                else if (con is EformSelect)
                {
                    EformSelect temp = (EformSelect)con;
                    temp.Text = inputFieldValue;
                }
                else if (con is EformCheckBoxList || con is EformRadioButtonList)
                {
                    IEformInputField eFormControl = con as IEformInputField;
                    eFormControl.Value = inputFieldValue;
                }
            }
        }
	
		/// <summary>
		/// Populate eform input field with value from Xml Document node
 		/// </summary>
		/// <param name="con"></param>
		/// <param name="xmlDoc"></param>	
        protected void SetControlValue(IEformInputField con, XmlDocument xmlDoc)
		{
            string conValue = GetNodeValue(con, xmlDoc);
            SetControlValue(con, xmlDoc, conValue);
		}

		/// <summary>
		/// Gets the value of the node.
		/// </summary>
		/// <param name="con"></param>
		/// <param name="xmlDoc"></param>
		/// <returns></returns>
		private string GetNodeValue(IEformInputField con, XmlDocument xmlDocument)
		{
			return GetNodeValue(con.Table, con.Field, con.RecordId, con.ParentRecordId, xmlDocument);
		}
        		
        /// <summary>
        /// 
        /// </summary>
        /// <param name="tableName"></param>
        /// <param name="fieldName"></param>
        /// <param name="recordId"></param>
        /// <param name="parentRecordId"></param>
        /// <param name="xmlDocument"></param>
        /// <returns></returns>
		private string GetNodeValue(string tableName, string fieldName, string recordId, string parentRecordId, XmlDocument xmlDocument)
		{	
			XmlNode node = null;
				
			if (recordId != null && !recordId.Equals(""))  
			{
				// TODO: add parentid support
				if (parentRecordId != null && !"".Equals(parentRecordId))
				{
					string xPath = "//" + tableName + "[attribute::RecordId='" + recordId + "']";
					XmlNodeList list = xmlDocument.SelectNodes(xPath);
					
					foreach (XmlNode xnode in list)
					{
						if (xnode.ParentNode != null)
						{
							XmlAttribute att = xnode.ParentNode.Attributes["RecordId"];
							if (att != null && parentRecordId.Equals(att.Value))
							{
								// we have the xnode we want; get the field
								node = xnode.SelectSingleNode("child::" + fieldName);
								break;
							}
						}
					}
				}
				else
				{
					string xPath = "//" + tableName + "[attribute::RecordId='" + recordId + "']";
					XmlNode parentNode = xmlDocument.SelectSingleNode(xPath);
					if (parentNode != null)  
					{
						node = parentNode.SelectSingleNode("child::" + fieldName);
					}
				}
			}
			else
			{
				string xpath = "//" + tableName + "/" + fieldName;
				node = xmlDocument.SelectSingleNode(xpath);
			}

            // Handle node not found
            if (node == null)
            {
               return null;
            }
            else
            {
                return node.InnerText;
            }
		}

		
		/// <summary>
		/// Format records as they are displayed in asp repeater
		/// </summary>
		/// <param name="Sender"></param>
		/// <param name="e"></param>
		protected virtual void EFormRepeaterOnDataBound(Object Sender, RepeaterItemEventArgs e)
		{
			HtmlImage LockImage;
			LockImage = (HtmlImage) e.Item.FindControl("LockImage");

			if (LockImage != null)
			{
				LockImage.Visible = false;
			}


			if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem) 
			{
				DataRowView drv = e.Item.DataItem as DataRowView;

				if (drv != null && drv.DataView.Table.Columns.Contains("LockedBy"))
				{
					if (drv["LockedBy"] != null && !string.IsNullOrEmpty(drv["LockedBy"].ToString()))
					{
						if (LockImage != null)
						{
							LockImage.Visible = true;
						}
					}
				}

				//if( !(((DataRowView) e.Item.DataItem )["LockedBy"] != null &&((DataRowView) e.Item.DataItem )["LockedBy"].ToString().Length > 0))
				//{
				//    if (LockImage != null)
				//    {
				//        LockImage.Visible = false;
				//    }
				//}
			}


		}


        protected virtual void SetHiddenDateFieldPair(EformHidden hiddenDateTextField, EformHidden hiddenDateField, string SurgeryDate)
        {
            if (string.IsNullOrEmpty(hiddenDateTextField.Value))
            {
                hiddenDateTextField.Value = SurgeryDate;
            }
            if (string.IsNullOrEmpty(hiddenDateField.Value))
            {
                hiddenDateField.Value = SurgeryDate;
                hiddenDateField.Disabled = true;
            }
        }

        protected String GetPatientAge(DateTime bdObj)
        {
            if (bdObj == null)
                return String.Empty;

            // get the difference in years
            int years = DateTime.Now.Year - bdObj.Year;

            //// subtract another year if we're before the
            //// birth day in the current year
            if (DateTime.Now.Month < bdObj.Month || (DateTime.Now.Month == bdObj.Month && DateTime.Now.Day < bdObj.Day))
                years--;

            // if patient is less than 1 years old, determine months
            if (years == 0)
            {
                int months = Math.Abs(DateTime.Now.Month - bdObj.Month);

                // i fpatient is less than 1 month old
                if (months == 0)
                    return "< 1 month";
                else if (months == 1)
                    return "1 month";
                else
                    return months.ToString() + " months";
            }
            else
                return years.ToString();
        }

        protected String CreateDelimitedString(DataTable dt, string columnName, string delimter)
        {
            string list = "";
            foreach (DataRow dr in dt.Rows)
            {
                string fieldValue = dr[columnName].ToString();
                // if value already contains an apostrophe
                if (fieldValue.Contains("'"))
                    fieldValue = fieldValue.Replace("'", "''");

                list = String.Concat(list, "\'", fieldValue, "\'", delimter);
            }

            if (list.EndsWith(delimter))
            {
                int index = list.LastIndexOf(delimter);
                list = list.Remove(index);
            }
            return list;
        }

        protected DataView GetTopDataViewRows(DataView dv, Int32 n)
        {
            DataTable dt = dv.Table.Clone();

            for (int i = 0; i < n; i++)
            {
                if (i >= dv.Count)
                {
                    break;
                }
                dt.ImportRow(dv[i].Row);
            }
            return new DataView(dt, dv.RowFilter, dv.Sort, dv.RowStateFilter);
        }

	
		#region Web Form Designer generated code: inherited from base control
		/*
		/// <summary>
		/// Overrides base method to add linking of PageLoad method.  By default, ViewState is turned off
		/// to minimize page overhead and page loading times, method may be overridden if individual controls
		/// require viewstate.
		/// </summary>
		/// <param name="e"></param>
		override protected void OnInit(EventArgs e)
		{	
			InitializeComponent();
			base.OnInit(e);
			//this.EnableViewState = false;   VIEWSTATE ENABLED!!!!!
		}
		
		/// <summary>
		/// Required method for Designer support - do not modify
		///		the contents of this method with the code editor.
		/// </summary>
		private void InitializeComponent()
		{
			this.Load += new System.EventHandler(this.Page_Load);
		}
		*/
		#endregion

	}
}
