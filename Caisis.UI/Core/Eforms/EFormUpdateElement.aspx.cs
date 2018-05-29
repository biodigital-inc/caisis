using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Xml;
using System.Xml.Schema;
using System.Collections.Generic;

using Caisis.Security;
using Caisis.DataAccess;

using Caisis.UI.Core.Classes;
using Caisis.UI.Core.Classes.CustomControls;

namespace Caisis.UI.Core.Eforms
{
	/// <summary>
	/// Takes element name passed in from query string, finds the .ascx control that the element is in
	/// and displays it for update.
	/// </summary>
	public partial class EFormUpdateElement : EFormBasePage
	{
		//protected System.Web.UI.HtmlControls.HtmlContainerControl reportContainer;

		private string _eformName = "";
		private string _eformFileName = ""; 
		private string _userName;
		private int	   _patientId;
		private string _recordId;

		//private bool _isElementField = false;
		//private string _numberOfReferences = "undefined";

		protected override void Page_Load(object sender, System.EventArgs e)
		{
			base.Page_Load(sender, e); //must be called first

			_userName = base.EFormUserName;
			_patientId = base.EFormPatientId;
			_eformName = base.EFormName;
			_eformFileName = base.EFormFileName;
			
			//_numberOfReferences = Request.QueryString["numberOfReferences"].ToString();

		
			// get field being updated
			string s = "";
			string nodeType = "field";
			
			// defined in javascript on eform narrative page

			if(Request.QueryString["dataElement"] != null)
			{
				s = Request.QueryString["dataElement"].ToString();	
				//_isElementField = true;
			}
			else if(Request.QueryString["dataTable"] != null)
			{
				s = Request.QueryString["dataTable"].ToString();	

				if(Request.QueryString["recordId"] != null)
				{
					_recordId = Request.QueryString["recordId"].ToString();
				}

				nodeType = "table";
			}
			else if (Request.QueryString["table"] != null && Request.QueryString["fields"] != null)
			{
				nodeType = "both";
			}
		
			// if element id is appended by _ref, more than one element is in narrative that needs updating
			int index = s.IndexOf("_ref");		
			
			// element id has a reference id (more than one exist)
			if(index != -1)
			{
				//remove the _ref + number (only works for single digits, should never be more than 10 on the same report)
				s = s.Remove(index, 5); 
			}

			// write the new value to the xml document
			if (nodeType == "both")
			{	
				WriteField(Request.QueryString["table"], Request.QueryString["fields"].Split(new char[] {','}));
			}
			else
			{
				WriteField(s, nodeType);
			}

            // Eform Default Values: regitser scripts
            XmlDocument eformXml = this.LoadEformXml();
            base.BuildDefaultValuesScript(eformXml);

			if(Page.IsPostBack)
			{
				
				base.WriteEform();

				// reload parent window and hide this one
				Body.Attributes.Add("onload", "closeAfterSave();");				
			}
		}

        private void WriteField(string dataElement, string nodeType)
        {
            //1) loop over ALL files that comprise the eform
            //2) find input control that matches the field name passed in Query string
            //3) if match is found put that file in the placholder


            // 1.
            string modFolder = Caisis.UI.Core.Classes.XmlUtil.GetParentModuleDirectory(_eformFileName + ".xml", "EForms");
            XmlDocument eformsXml = XmlUtil.GetXmlDoc("~\\Modules\\" + modFolder + "\\EForms\\" + _eformFileName + ".xml");
            XmlNodeList eformSections = eformsXml.SelectNodes("eform[@name='" + _eformName + "']/eformSection");

            holder.Controls.Clear();

            // need to record all the controls you have loaded so you don't load twice - jf
            List<string> loadedControlNames = new List<string>();


            foreach (XmlNode sectionNode in eformSections)
            {

                foreach (XmlNode controlNode in sectionNode)
                {

                    // need to iterate over all files included in this eform
                    System.Web.UI.UserControl eFormControl = base.GetEFormControl(controlNode.Attributes["controlName"].Value + ".ascx");

                    // 2.
                    foreach (Control con in eFormControl.Controls)
                    {

                        if (con is IEformInputField)
                        {
                            if (nodeType.Equals("table")) // we are looking for a table name match
                            {
                                if (((IEformInputField)con).Table != null)
                                {
                                    string nodeName = ((IEformInputField)con).Table;

                                    //if( ((IEformInputField)con).RecordId != null && ((IEformInputField)con).RecordId != "" )
                                    //{
                                    //	nodeName += "_" + ((IEformInputField)con).RecordId;
                                    //}

                                    if (nodeName.Equals(dataElement))
                                    {

                                        // 3. 
                                        if (!holder.Controls.Contains(eFormControl) && (!loadedControlNames.Contains(controlNode.Attributes["controlName"].Value)))
                                        {
                                            holder.Controls.Add(eFormControl);
                                            loadedControlNames.Add(controlNode.Attributes["controlName"].Value);
                                        }

                                        // now we want to highlight the entire row if this is the one the user selected
                                        if (((IEformInputField)con).RecordId != null)
                                        {
                                            string recordId = ((IEformInputField)con).RecordId;

                                            if (recordId.Equals(_recordId))
                                            {
                                                // highlight it
                                                base.SetInvalidStyle(con, "e7d1c8");
                                            }
                                        }
                                    }
                                }

                            }
                            else // we are looking for a field name
                            {

                                if (((IEformInputField)con).Field != null)
                                {
                                    string nodeName = ((IEformInputField)con).Field;

                                    //if( ((IEformInputField)con).RecordId != null && ((IEformInputField)con).RecordId != "" )
                                    //{
                                    //	nodeName += "_" + ((IEformInputField)con).RecordId;
                                    //}

                                    if (nodeName.Equals(dataElement))
                                    {


                                        // 3. 
                                        if (!holder.Controls.Contains(eFormControl) && (!loadedControlNames.Contains(controlNode.Attributes["controlName"].Value)))
                                        {
                                            holder.Controls.Add(eFormControl);
                                            loadedControlNames.Add(controlNode.Attributes["controlName"].Value);
                                        }

                                        base.SetInvalidStyle(con, "e7d1c8");
                                    }
                                }
                            }
                        }
                        else if (con.HasControls())
                        {
                            IterateOverChildControls(eFormControl, con, dataElement, nodeType, loadedControlNames, controlNode);
                        }
                    }
                }
            }
        }

        private void IterateOverChildControls(System.Web.UI.UserControl eFormUserControl, Control eFormControl, string dataElement, string nodeType, List<string> loadedControlNames, XmlNode controlNode)
        {
            foreach (Control con in eFormControl.Controls)
            {

                if (con is IEformInputField)
                {
                    if (nodeType.Equals("table")) // we are looking for a table name match
                    {
                        if (((IEformInputField)con).Table != null)
                        {
                            string nodeName = ((IEformInputField)con).Table;
                            if (nodeName.Equals(dataElement))
                            {

                                // 3. 
                                if (!holder.Controls.Contains(eFormUserControl) && (!loadedControlNames.Contains(controlNode.Attributes["controlName"].Value)))
                                {
                                    holder.Controls.Add(eFormUserControl);
                                    loadedControlNames.Add(controlNode.Attributes["controlName"].Value);
                                }

                                // now we want to highlight the entire row if this is the one the user selected
                                if (((IEformInputField)con).RecordId != null)
                                {
                                    string recordId = ((IEformInputField)con).RecordId;

                                    if (recordId.Equals(_recordId))
                                    {
                                        // highlight it
                                        base.SetInvalidStyle(con, "e7d1c8");
                                    }
                                }
                            }
                        }

                    }
                    else // we are looking for a field name
                    {

                        if (((IEformInputField)con).Field != null)
                        {
                            string nodeName = ((IEformInputField)con).Field;

                            if (nodeName.Equals(dataElement))
                            {
                                // 3. 
                                if (!holder.Controls.Contains(eFormUserControl) && (!loadedControlNames.Contains(controlNode.Attributes["controlName"].Value)))
                                {
                                    holder.Controls.Add(eFormUserControl);
                                    loadedControlNames.Add(controlNode.Attributes["controlName"].Value);
                                }

                                base.SetInvalidStyle(con, "e7d1c8");
                            }
                        }
                    }
                }
                else if (con.HasControls())
                {
                    IterateOverChildControls(eFormUserControl, con, dataElement, nodeType, loadedControlNames, controlNode);
                }
            }
        }

		private void WriteField(string table, string[] fields)
		{
			// preserve sanity
			if (table == null || table == "" || fields.Length == 0)
			{
				return;
			}

			Hashtable stringMap = new Hashtable();
			foreach (string s in fields)
			{
				stringMap[s] = "";
			}

			string modFolder = Caisis.UI.Core.Classes.XmlUtil.GetParentModuleDirectory(_eformFileName +".xml", "EForms" );
			XmlDocument eformsXml = XmlUtil.GetXmlDoc("~\\Modules\\" + modFolder + "\\EForms\\" + _eformFileName + ".xml");
			XmlNodeList eformSections = eformsXml.SelectNodes("eform[@name='" + _eformName + "']/eformSection");
		
			holder.Controls.Clear();

            // need to record all the controls you have loaded so you don't load twice - jf
            List<string> loadedControlNames = new List<string>();


			foreach(XmlNode sectionNode in eformSections)
			{	
				foreach(XmlNode controlNode in sectionNode)
				{
					System.Web.UI.UserControl eFormControl = base.GetEFormControl(controlNode.Attributes["controlName"].Value + ".ascx");

					foreach (Control con in eFormControl.Controls)
					{	
						if(con is IEformInputField)
						{
							// we need to add (to our holder) the control containing table/fields and highlight the appropriate fields
							IEformInputField inputField = (IEformInputField) con;
							if (table == inputField.Table && stringMap.ContainsKey(inputField.Field))
							{
                                if (!holder.Controls.Contains(eFormControl) && (!loadedControlNames.Contains(controlNode.Attributes["controlName"].Value)))
								{
									holder.Controls.Add(eFormControl);
                                    loadedControlNames.Add(controlNode.Attributes["controlName"].Value);
								}
								base.SetInvalidStyle(con, "e7d1c8");
							}
						}
					}
				}
			}
		}

		/* to update the element back on the main page
		private void SetOnChangeEvent(Control inputControl)
		{
			//update report client side calls function in EFormReport

			if(inputControl is IEformInputField)
			{
				string fieldName = ((IEformInputField)inputControl).Field;
				
				if(((IEformInputField)inputControl).RecordId != null && ((IEformInputField)inputControl).RecordId != "")
				{
					fieldName += "_" + ((IEformInputField)inputControl).RecordId;
				}
	
				//string jsFunction =  "window.opener.updateDE(this.value, '" + fieldName + "', '" + _numberOfReferences + "')";

				if(inputControl is HtmlControl)
				{
					//((HtmlControl)inputControl).Attributes.Add("onChange", jsFunction);
				}
				else if(inputControl is WebControl)
				{
					if(inputControl is EformRadioButtonList)
					{
						// TODO: "OnClientEvent" ==> "AddClientSideEventHandler"
						// ((EformRadioButtonList)inputControl).OnClientEvent("onfocus", jsFunction);
						//((EformRadioButtonList)inputControl).AddClientSideEventHandler("onfocus", jsFunction);
					}
					else
					{
						//((WebControl)inputControl).Attributes.Add("onChange", jsFunction);
					}
				}
				else if(inputControl is ComboBox) // TODO: make onChange behave well with combo dhtml! 
				{
					//((ComboBox)inputControl).OnClientEvent("onChange", jsFunction);
				}
																					
			}

		}*/
	}
}
