using System;
using System.Collections;
using System.Collections.Generic;
using System.Xml;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Linq;


using Caisis.DataAccess;

using Caisis.BOL;
using Caisis.Controller;
using Caisis.Security;
using Caisis.UI.Core.Classes.CustomControls;

namespace Caisis.UI.Core.Classes
{
	/// <summary>
	/// Handles writing values from web/html controls to Xml document that temporarily stores data before approval.
	/// </summary>
	public class EFormBasePage : BasePage
	{
		
		private int _eformId;
		private string _eformName;
        private string _eformSectionName;
		private string _eformFileName;
		private int _patientId;
		private string _userName;
		private string _eformTitle;
		private bool isNewEForm;

		private string _status; // to be set on page load

		public int EFormPatientId
		{
			get
			{
				_patientId = int.Parse(Session[SessionKey.PatientId].ToString());
				return _patientId;
			}
		}
		
	
		public string EFormUserName
		{
			get
			{
				if(_userName == null || _userName.Equals(""))
				{
					SecurityController sc = new SecurityController();
					_userName = sc.GetUserName();
				}
				return _userName;
			}
		}
		
	
		public int EFormId
		{
			get{return _eformId;}
			set{_eformId = value;}
		}
		
		
		public string EFormName
		{
			get{return _eformName;}
			set{_eformName = value;}
		}
		
	
		// if EFormName has been set, then EFormFileName is set
		public string EFormFileName
		{
			get
			{
				if(_eformFileName == null || _eformFileName.Equals(""))
				{	
					if(this.EFormName != null && this.EFormName != "")
					{
						_eformFileName = this.EFormName.Replace(" ", "");
					}
					else
					{
						_eformFileName =  "";
					}
				}
				
				return _eformFileName;
				
			}

			set{_eformFileName = value;}
		}

        public string EFormSectionName
        {
 			get{return _eformSectionName;}
			set{_eformSectionName = value;}
        }
	
		public string EFormTitle
		{
			get
			{
				if(_eformTitle == null || _eformTitle.Equals(""))
				{
					_eformTitle  = this.GetTitleFromXml();
				}
				return _eformTitle;
			}
		}

		protected string StatusOnPageLoad
		{
			get
			{
				return _status;
			}
		}
		

		public EFormBasePage()
		{
		}

		protected override void Page_Load(object sender, System.EventArgs e)
		{
			base.Page_Load(sender, e); // disables view state
          
			// existing eforms use eform id to load components
			if(Request.QueryString["eformId"] != null && !Request.QueryString["eformId"].Equals("") && !Request.QueryString["eformId"].Equals("0"))
			{
				this.EFormId = int.Parse(Request.QueryString["eformId"]);
				
				// TODO: this query may be redundant
				EFormController ctr = new EFormController();
				
				DataSet ds = ctr.GetRecord(int.Parse(Request.QueryString["eformId"]));

				if(ds.Tables[0].Rows.Count == 1)
				{
					this.EFormName = ds.Tables[0].Rows[0][EForm.EFormName].ToString();

					isNewEForm = false;
				}
			}
			// new eform passes eform name in on url string when coming from list page
			else if(Request.QueryString["eform"] != null && !Request.QueryString["eform"].Equals(""))
			{
				this.EFormName = Request.QueryString["eform"];

				if(Request.QueryString["status"] != null && Request.QueryString["status"].Equals("new"))
				{
					// TODO: BEFORE SETTING true we should see if this SAME eform has already been created today by the SAME physician; appears users click refresh
					isNewEForm = true;

                    // do not check if user is allowed to enter multiple
                    if (!EFormController.CanAllowMultiple(this.EFormName))
                    {
                        Caisis.DataAccess.EFormsDa da = new EFormsDa();

                        DataRowView rv = da.GetPatientRecentEForm(this.EFormPatientId, Request.QueryString["eform"]);
                        if (rv != null)
                        {
                            isNewEForm = false;
                            this.EFormId = (int)rv["EFormId"];
                            this.EFormName = rv["EFormName"].ToString();
                        }
                    }
                    
				}
			}
	
            try
            {
                _status = this.SetEFormStatus();
            }
            catch (ClientException ex)
            {
                Response.Write(ex.Message);
                Response.End();
            }
		}

		/// <summary>
		/// "displayName" attribute must exist in definition of eform Xml
		/// </summary>
		/// <returns>title of eform</returns>
		private string GetTitleFromXml()
		{
			string modFolder = Caisis.UI.Core.Classes.XmlUtil.GetParentModuleDirectory(this.EFormFileName +".xml", "EForms" );
			XmlDocument eformsXml = XmlUtil.GetXmlDoc("~\\Modules\\" + modFolder + "\\EForms\\" + this.EFormFileName + ".xml");
			
			XmlNode eform	= eformsXml.SelectSingleNode("eform");
			
			if(eform != null && eform.Attributes["displayName"] != null)
			{
				return eform.Attributes["displayName"].Value;
			}
			else
			{
				return "";
			}
		}

		
		// secure module
		override protected void OnInit(EventArgs e)
		{
			// redirect to eform clinic list if no patient is in session
			if(Session[SessionKey.PatientId] == null || Session[SessionKey.PatientId].ToString().Length < 1)
			{
				Response.Redirect("EFormList.aspx?msg=NoPatientInSession", true);
			}
			// user must have edit eform rights to get to it (currently no view eform permission)
			else if(Request.Path.IndexOf("EFormList") > -1 && !PermissionManager.HasPermission("EditEForm"))
			{
				Response.Redirect("EFormList.aspx?msg=InvalidEditPermission", true);
			}
			
			base.OnInit(e);
		}

		/// <summary>
		/// Sets status of eform on page load. Stores the step COMPLETED in the process. 
		/// User is directed to the step AFTER one completed.
		/// </summary>
		protected virtual string SetEFormStatus()
		{
			EFormController ect = new EFormController();

			string page = Request.Path;
			string status;
					
			try
			{
				status = ect.GetEFormStatus(this.EFormId);
			}
			catch
			{
				status = "";
			}
	
			// get status from the db
			string nextstatus = EformStatusManager.GetNextStatus(status, Request.UrlReferrer.PathAndQuery, Request.Path);
		
			// only updates status when one of the above pages is loaded AND eform has not been already approved (concurrency)
			if(nextstatus != "" && !status.Equals(EformStatusManager.Status_Approved) && !status.Equals(EformStatusManager.Status_Deleted) )
			{
				
				ect.UpdateEFormStatus(this.EFormId, nextstatus, this.EFormUserName);

				status = nextstatus;
			}
			
			return status;
		}

		
		/// <summary>
		/// Iterates over control collection and puts values in Xml. Inserts/Updates DB with Xml
		/// </summary>
		/// <returns>eform Id</returns>
		protected int WriteEform()
		{
			if(_status.Equals(EformStatusManager.Status_Approved) )
			{
				// get user outta here if this form was already approved by someone else!
				Response.Redirect("ApproveEFormContainer.aspx?eformId=" + this.EFormId, true);
			}
			else
			{
				// fill in the values to the eform template loaded above
				XmlDocument eformXml = this.LoadEformXml();

				this.AddInputValue(this, eformXml);

                // Eform Default Values
                EFormController.TransformEformDefaultValues(eformXml);

				// put xml doc in the database
				//string s = eformXml.InnerXml;

			
				EFormController ctr = new EFormController();


			
				// insert on first save of eform
				if(this.EFormId == 0)
				{
					DataTable table = ctr.ValidateSessionAppointmentData(Session[SessionKey.PtMRN], Session[SessionKey.CurrentListCrit], Session[SessionKey.CurrentClinicDate]);
						
					object apptDate = null;
					string apptPhysician = "";

					if (table.Rows.Count > 0)
					{
						DataRow row = table.Rows[0];
						apptPhysician = row["ApptPhysician"].ToString();
						apptDate = row["ApptTime"];
					}                    
					
					int userId = this.GetAccountableUserId(apptPhysician); // returns 0 if can not match apptPhysician with a username

					// insert
                    this.EFormId = ctr.InsertRecord(userId, EFormPatientId, EFormName, eformXml, _status, apptDate, apptPhysician);
				}
				else // update
				{
					// sets narrative equal to empty string so xsl is reapplied
                    ctr.UpdateEFormRecord(this.EFormId, eformXml, "", _status);
				}
			}
				
			return this.EFormId;
		}
		
		/// <summary>
		/// Gets the user id of the clinic attending in session. If match is unsuccessful, then returns the id of the current user
		/// </summary>
		/// <param name="name"></param>
		/// <returns>user id of clinic attending or current user</returns>
		[CodeDependency("Appointment Physician from Datafeed","If the format of the appt physician name from the datafeed changes, this string match will no longer work")] 
		private int GetAccountableUserId(string name)
		{
			//TODO: we don't care about userid anymore, need to replace with a "AccountableTo" which can be physician or other! Inbox is based on this ID
				
			// ARGGG.. TEMP FIX: we will use the userid of the current clinic's attending. how to get this? string match for now...
	
			string apptPhysician = name;
			int userId = 0;
			
			UserDa da = new UserDa();

			// we have the attending, is there a username that matches? Appt Physician is in format like SCARDINO, PETER (then sometime middle initial)
			string[] attending = apptPhysician.Trim().Split(new Char[] { ',' });
			if(attending.Length > 1)
			{
				string[] attendingFirstAndMiddle = attending[1].Trim().Split(new Char[] { ' ' });
				string attendingLast = attending[0].ToUpper();
				string attendingFirst = attendingFirstAndMiddle[0].ToUpper();
				DataSet userDs = da.GetUserIdByFirstAndLastName(attendingFirst, attendingLast);

				if(userDs.Tables[0].Rows.Count == 1)
				{
					userId = int.Parse(userDs.Tables[0].Rows[0]["UserId"].ToString());
				}
			}

			// if userid is 0, we could NOT find a matching attending, so insert the current userId
			if(userId == 0)
			{
				DataSet ds = da.GetByUserName(this.EFormUserName);
				userId = int.Parse(ds.Tables[0].Rows[0][0].ToString());
			}

			return userId;
		}

		/// <summary>
		/// Gets the xml document from the eformname.xml template when starting a new eform.
		/// Gets xml from the database when eform has already been initiated.
		/// </summary>
		/// <param name="patientId"></param>
		/// <param name="eformName"></param>
		/// <returns></returns>
		protected XmlDocument LoadEformXml()
		{
			XmlDocument xmlDoc = new XmlDocument();

			EFormController ctr = new EFormController();
			
			// DONT use this anymore
			//int returnVal = ctr.IsNewEForm(this.EFormPatientId, this.EFormName);

			//if first time loaded use eform xml template
			if(isNewEForm)
			{
				string disease = Caisis.UI.Core.Classes.XmlUtil.GetParentModuleDirectory(this.EFormFileName +".xml", "EForms" );
				xmlDoc = XmlUtil.GetXmlDoc("~\\Modules\\" + disease + "\\Eforms\\" + this.EFormFileName + ".xml");		
			}
			else // get xml from database column
			{
				DataSet ds = ctr.GetRecord(this.EFormId);
				string s = ds.Tables[0].Rows[0][Caisis.BOL.EForm.EFormXML].ToString(); // should replace col name w/ reference to BizO
				xmlDoc.LoadXml(s);
			}

			return xmlDoc;
		}

		
		/// <summary>
		/// Recursively iterate over control collection to reach the eform input controls
		/// </summary>
		/// <param name="control"></param>
		/// <param name="xDoc"></param>
		protected void AddInputValue(Control control, XmlDocument xDoc)
		{
			foreach(Control con in control.Controls)  
			{
				if(con is IEformInputField)
				{	
					this.WriteControlValueToXmlNode(con, xDoc);
				}
				else
				{	
					this.AddInputValue(con, xDoc);
				}
			}
		}

	
		/// <summary>
		/// Writes the value from the eform input field to the associated Xml Node. Handles record Id's for one to many relations
		/// </summary>
		/// <param name="con"></param>
		/// <param name="xmlDoc"></param>
		protected void SetXmlNodeValue(IEformInputField con, XmlDocument xmlDoc)  
		{
			if (con.Table != null)  
			{
				XmlNode node = GetXmlNode(con.Table, con.Field, con.RecordId, con.ParentRecordId, xmlDoc);

				if (node != null)  
				{
					node.InnerText = PageUtil.GetInputControlValue(con);				
				}
			}
		}

	
		private XmlNode GetXmlNode(string tableName, string fieldName, string recordId, string parentRecordId, XmlDocument xmlDocument)
		{
			XmlNode node = null;
			// use recordId to locate the node if it is set
			if (recordId != null && !recordId.Equals(""))  
			{
				if (parentRecordId != null && !"".Equals(parentRecordId))
				{
					string xPath = "//" + tableName + "[attribute::RecordId='" + recordId + "']";
					XmlNodeList list = xmlDocument.SelectNodes(xPath);

					if (list != null && list.Count > 0) // what do we do if this condition d/n obtain?
					{
						foreach (XmlNode xnode in list)
						{
							if (xnode.ParentNode != null)
							{
								XmlAttribute att = xnode.ParentNode.Attributes["RecordId"];
								if (att != null && parentRecordId.Equals(att.Value))
								{
									node = xnode.SelectSingleNode("child::" + fieldName);
									break;
								}
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
				// XML node should not be set for controls which have a defined recordId but is empty string.
			else if (recordId != null && recordId.Equals("")) 
			{
				// do nothing
			}	
			else // in all other cases, find the first node that matches the table and field name.
			{
				string xpath = "//" + tableName + "/" + fieldName;		
				node = xmlDocument.SelectSingleNode(xpath);
			}

			return node;
		}

		
		/// <summary>
		/// Writes value from control to matching Xml node.
		/// </summary>
		/// <param name="con"></param>
		/// <param name="xDoc"></param>
		protected void WriteControlValueToXmlNode(Control con, XmlDocument xDoc)
		{	
			// TODO: give this method the parent id treatment
			if(con is EformHidden)
			{
				IEformInputField tb = (IEformInputField)con;
				this.SetXmlNodeValue(tb, xDoc);				
			}
			else if(con is EformTextBox)
			{
				EformTextBox tb = (EformTextBox)con;
				this.SetXmlNodeValue(tb, xDoc);	
			}

			else if(con is EformComboBox)
			{
				IEformInputField tb = (IEformInputField)con;
				this.SetXmlNodeValue(tb, xDoc);			
			}
			
			else if(con is EformTextArea)
			{
				IEformInputField tb = (IEformInputField)con;
				this.SetXmlNodeValue(tb, xDoc);			
			}

			else if(con is EformDropDownList)
			{
				IEformInputField tb = (IEformInputField)con;
				this.SetXmlNodeValue(tb, xDoc);			
			}
			else if (con is EformSelect)
			{
				EformSelect es = (EformSelect) con;
				this.SetXmlNodeValue(es, xDoc);	
			}
			else if(con is EformCheckBox)
			{
				EformCheckBox cb = (EformCheckBox)con;

				string recordId = cb.RecordId;
				// XmlNode node = null;

				/*
				#region get node
				// use recordId to locate the node if it is set
				if (recordId != null && !recordId.Equals(""))  
				{
					string xPath = "//"+cb.Table+"[attribute::RecordId='"+recordId+"']";
					XmlNode parentNode = xDoc.SelectSingleNode(xPath);
					if (parentNode != null)  
					{
						node = parentNode.SelectSingleNode("child::"+cb.Field);
					}
				}
				else // in all other cases, find the first node that matches the table and field name.
				{
					string xpath = "//" + cb.Table + "/" + cb.Field;
							
					node = xDoc.SelectSingleNode(xpath);
				}
				#endregion
				*/

				XmlNode node = GetXmlNode(cb.Table, cb.Field, cb.RecordId, cb.ParentRecordId, xDoc);

				if(node != null)
				{
					string val = Request.Form[con.UniqueID];

					if(val != null && val.Equals("on"))
					{
						// brandon: cb.Text is the text label (sigh. ask Microsoft)
						// node.InnerText = cb.Text;
						node.InnerText = cb.Value;
					}
					else
					{
						node.InnerText = "";
					}
				}
			}
			else if (con is EformRadioButton)
			{
				EformRadioButton rb = (EformRadioButton)con;

				string recordId = rb.RecordId;

				/*
				XmlNode node = null;

				#region get node
				// use recordId to locate the node if it is set
				if (recordId != null && !recordId.Equals(""))  
				{
					string xPath = "//"+rb.Table+"[attribute::RecordId='"+recordId+"']";
					XmlNode parentNode = xDoc.SelectSingleNode(xPath);
					if (parentNode != null)  
					{
						node = parentNode.SelectSingleNode("child::"+rb.Field);
					}
				}
				else // in all other cases, find the first node that matches the table and field name.
				{
					string xpath = "//" + rb.Table + "/" + rb.Field;
							
					node = xDoc.SelectSingleNode(xpath);
				}
				#endregion
				
				*/

				XmlNode node = GetXmlNode(rb.Table, rb.Field, rb.RecordId, rb.ParentRecordId, xDoc);

				if(node != null)
				{
					string val = Request.Form[con.UniqueID];

					if(val != null && val.Equals("on"))
					{
						// brandon: cb.Text is the text label (sigh. ask Microsoft)
						// node.InnerText = cb.Text;
						node.InnerText = rb.Value;
					}
					else
					{
						node.InnerText = "";
					}
				}
			}
			else if (con is EformRadioButtonList)
			{
				// EformRadioButtonList rb = (EformRadioButtonList) con;
				EformRadioButtonList rb = (EformRadioButtonList) con;

				XmlNode node = FetchNode(xDoc, rb.Table, rb.Field, rb.RecordId, rb.ParentRecordId);

				if (node != null)
				{
                    node.InnerText = rb.Value;// Request.Form[con.UniqueID];

					if (node.InnerText != null && !"".Equals(node.InnerText))
					{
						// handle additional fields
						if (rb.Field1 != null && !"".Equals(rb.Field1))
						{
							XmlNode node1 = FetchNode(xDoc, rb.Table, rb.Field1, rb.RecordId, rb.ParentRecordId);
							node1.InnerText = rb.Value1;
						}

						if (rb.Field2 != null && !"".Equals(rb.Field2))
						{
							XmlNode node2 = FetchNode(xDoc, rb.Table, rb.Field2, rb.RecordId, rb.ParentRecordId);
							node2.InnerText = rb.Value2;
						}

						if (rb.Field3 != null && !"".Equals(rb.Field3))
						{
							XmlNode node3 = FetchNode(xDoc, rb.Table, rb.Field3, rb.RecordId, rb.ParentRecordId);
							node3.InnerText = rb.Value3;
						}
					}
				}
			}
			else if (con is EformRadioButtonGroup)
			{
				// save each additional field
				// may also need to deal w/ xml for child controls
				EformRadioButtonGroup rg = (EformRadioButtonGroup) con;
				string val = rg.GetSelectedValue(this.Request);
				if (val != null && !"".Equals(val))
				{

					// DO WE NEED TO WORRY ABOUT PARENT ID HERE?
					if (rg.Field1 != null && !"".Equals(rg.Field1))
					{
						XmlNode node = FetchNode(xDoc, rg.Table, rg.Field1, rg.RecordId, rg.ParentRecordId);
						node.InnerText = rg.Value1;
					}

					if (rg.Field2 != null && !"".Equals(rg.Field2))
					{
						XmlNode node = FetchNode(xDoc, rg.Table, rg.Field2, rg.RecordId, rg.ParentRecordId);
						node.InnerText = rg.Value2;
					}

					if (rg.Field3 != null && !"".Equals(rg.Field3))
					{
						XmlNode node = FetchNode(xDoc, rg.Table, rg.Field3, rg.RecordId, rg.ParentRecordId);
						node.InnerText = rg.Value3;
					}

					// we already know our value
					EformRadioButton rb = rg.GetCheckedButton(this.Request);
					if (rb != null)
					{
						XmlNode node = GetXmlNode(rg.Table, rg.Field, rg.RecordId, rg.ParentRecordId, xDoc);

						if(node != null)
						{
							node.InnerText = rb.Value;
						}
					}
				}
				else // we will have to unset values if the user "cleared" the group of radio buttons
				{
					if (rg.Field1 != null && !"".Equals(rg.Field1))
					{
						XmlNode node1 = FetchNode(xDoc, rg.Table, rg.Field1, rg.RecordId, rg.ParentRecordId);
						node1.InnerText = null;
					}

					if (rg.Field2 != null && !"".Equals(rg.Field2))
					{
						XmlNode node2 = FetchNode(xDoc, rg.Table, rg.Field2, rg.RecordId, rg.ParentRecordId);
						node2.InnerText = null;
					}

					if (rg.Field3 != null && !"".Equals(rg.Field3))
					{
						XmlNode node3 = FetchNode(xDoc, rg.Table, rg.Field3, rg.RecordId, rg.ParentRecordId);
						node3.InnerText = null;
					}

					XmlNode node = GetXmlNode(rg.Table, rg.Field, rg.RecordId, rg.ParentRecordId, xDoc);

					if(node != null)
					{
						node.InnerText = null;
					}
				}
			}
            else if (con is EformCheckBoxList || con is EformRadioButtonList)
            {
                IEformInputField eFormControl = con as IEformInputField;
                this.SetXmlNodeValue(eFormControl, xDoc);
            }
					
		}

		
		// TODO: maybe a fetch by parent method?
		private XmlNode FetchNode(XmlDocument xDoc, string table, string field, string recordId, string parentRecordId)
		{
			if (parentRecordId != null && !"".Equals(parentRecordId))
			{
				// this should never happen, and would only be caused by an improperly developed ascx control
				if (recordId == null || "".Equals(recordId))
				{
					return null;
				}
				else
				{
					// XmlNodeList nodes = xDoc.SelectNodes("//" + table + "[attribute::RecordId='" + recordId + "']" + "/" + field);
					XmlNodeList nodes = xDoc.SelectNodes("//" + table + "[attribute::RecordId='" + recordId + "']");
					foreach (XmlNode node in nodes)
					{
						if (node.ParentNode != null)
						{
							XmlAttribute att = node.ParentNode.Attributes["RecordId"];
							if (att != null && parentRecordId.Equals(att.Value))
							{
								// return node;
								return node.SelectSingleNode("child::" + field);
							}
						}
					}

					// if we can't return anything else
					return null;
				}
			}
			else
			{
				string xpath;
				
				if (recordId != null && !"".Equals(recordId))
				{
					xpath = "//" + table + "[attribute::RecordId='" + recordId + "']" + "/" + field;
				}
				else
				{
					xpath = "//" + table + "/" + field;
				}
					
				return xDoc.SelectSingleNode(xpath);
			}
		}

	
		// return one control
		protected UserControl GetEFormControl(string controlName)
		{
			System.Web.UI.UserControl eFormControl;

			// find control and return name of parent disease folder
			string folder = Caisis.UI.Core.Classes.XmlUtil.GetParentModuleDirectory(controlName, "EForms" );
			eFormControl = (System.Web.UI.UserControl)this.LoadControl("../../Modules/" + folder + "/Eforms/" + controlName);

			return eFormControl;
		}

		/*protected void SetInvalidStyle(Control con)
		{
			if(con is HtmlControl)
			{
				((HtmlControl)con).Style.Add("background-color", "yellow;");
			}
			else if(con is WebControl)
			{
				((WebControl)con).Style.Add("background-color", "yellow;");
			}
			else if(con is ComboBox)
			{
				((ComboBox)con).Style = "background-color: yellow;";
			}
		}*/

		protected void SetInvalidStyle(Control con, string highlightColor)
		{
			string myStyle = "";
			
			string color = highlightColor + ";";

			if(con is HtmlControl)
			{
				myStyle = ((HtmlControl)con).Attributes["style"];
			}
			else if(con is WebControl)
			{
				myStyle = ((WebControl)con).Attributes["style"];
			}
            //else if(con is ComboBox)
            //{
            //    myStyle = ((ComboBox)con).Style;
            //}
			else if (con is EformRadioButtonGroup)
			{
				myStyle = ((EformRadioButtonGroup) con).GroupStyle;
			}
			
			
			if (myStyle == null || myStyle == "")
			{
				if(con is HtmlControl)
				{
					((HtmlControl)con).Style.Add("background-color", color);
				}
				else if(con is WebControl)
				{
					((WebControl)con).Style.Add("background-color", color);
				}
                //else if(con is ComboBox)
                //{
                //    ((ComboBox)con).Style = "background-color: " + color;
                //}
				else if (con is EformRadioButtonGroup)
				{
					EformRadioButtonGroup rbg = (EformRadioButtonGroup) con;
					rbg.GroupStyle = "background-color: " + color;
				}
			}
			else // append styles
			{
				string newStyle;

				if (myStyle.Trim().EndsWith(";"))
				{
					newStyle = myStyle + "background-color: " + color;
				}
				else
				{
					newStyle = myStyle + "; background-color: " + color;
				}

				if(con is HtmlControl)
				{
					((HtmlControl)con).Attributes["style"] = newStyle;
				}
				else if(con is WebControl)
				{
					((WebControl)con).Attributes["style"] = newStyle;
				}
                //else if(con is ComboBox)
                //{
                //    ((ComboBox)con).Style = newStyle;
                //}
				else if (con is EformRadioButtonGroup)
				{
					EformRadioButtonGroup rbg = (EformRadioButtonGroup) con;
					rbg.GroupStyle = newStyle;
				}
			}
		}

		private void AddNewXmlNode(string tableName)
		{
			// 1) using table name find similar node and it's child records
			// 2) replicate it
			// 3) get the last record id and add one
			// 3) then insert the new node with next record id to the eform table Xml
		}

		private void DeleteXmlNode(string tableName, string recordId)
		{
			// can just use js to remove items from row or could remove xml nodes server side
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


        protected bool EFormIsOfType(string EFormType, bool FindExactMatch)
        {
            bool eformIsOfType = false;

            if (FindExactMatch)
            {
                if (this._eformName.Equals(EFormType)) eformIsOfType = true;
            }
            else if (this._eformName.Contains(EFormType)) eformIsOfType = true;

            return eformIsOfType;

        }

        protected bool LimitReferralEmailInfo(string ReferralUserName)
        {
            bool limitInfo = false;

            //if (REFERRAL_RECIPIENTS_TO_GET_LIMITED_DATA.Contains(ReferralUserName)) limitInfo = true;

            // if using a user preference
            DataTable uDt = ReferralRecipientsToGetLimitedData();
            List<string> RECIPIENTS_TO_GET_LIMITED_DATA = (from row in uDt.AsEnumerable()
                                                           select row.Field<string>(BOL.User.UserName)).ToList<string>();
            if (RECIPIENTS_TO_GET_LIMITED_DATA.Contains(ReferralUserName)) limitInfo = true;

            return limitInfo;
        }

        protected DataTable ReferralRecipientsToGetLimitedData()
        {
            UserDa uDa = new UserDa();
            DataTable uDt = uDa.GetUsersByAttributeValue("AdditionalReferralRecipient", "true");
            return uDt;
        }




        #region EFORM DEFAULT VALUES

        /// <summary>
        /// For the given eform docuemnt, build client scripts for handling client sider EFromDefaultValue logic.
        /// </summary>
        /// <param name="eformsXml">The Eform document containing EFromDefaultValue mappings</param>
        protected void BuildDefaultValuesScript(XmlDocument eformsXml)
        {
            var eFields = EFormController.GetEformDefaultValues(eformsXml);
            if (eFields.Count() > 0)
            {
                // list of all eform inputs
                IEnumerable<IEformInputField> inputs = PageUtil.GetControls<IEformInputField>(Page);
                // list of eform labels
                IEnumerable<EformDefaultLabel> labels = PageUtil.GetControls<EformDefaultLabel>(Page);
                // create JSON Serialier and list of output objects  
                System.Web.Script.Serialization.JavaScriptSerializer serializer = new System.Web.Script.Serialization.JavaScriptSerializer();
                // list of client JSON objects
                List<string> _clientConfigs = new List<string>();
                // temp: fix to empty RecordId's
                Func<string, string, bool> matchRecordIds = (r1, r2) =>
                {
                    return (!string.IsNullOrEmpty(r1) ? r1 : "1") == (!string.IsNullOrEmpty(r2) ? r2 : "1");
                };
                foreach (var eField in eFields)
                {
                    // FIND INPUTS
                    // i.e., Table=Encounters, RecordId=1
                    var inputsByTableRecordId = inputs.Where(input => input.Table == eField.TargetTable && matchRecordIds(input.RecordId, eField.TargetRecordId));
                    // i.e., Table=Encounters, Field=EncDate, RecordId=1
                    var targetInput = inputsByTableRecordId.Where(input => input.Field == eField.TargetField);
                    // i.e., Table=Encounters, Field!=EncDate, RecordId=1
                    var targetInputSiblings = inputsByTableRecordId.Except(targetInput);
                    // get type of default
                    EFormController.EformDefaultType type = eField.GetDefaultType();
                    if (targetInput.Count() > 0)
                    {
                        // get eform input field
                        IEformInputField targetInputField = targetInput.First();
                        // i.e., find sources by table and record (will be reduced by field, if needed)
                        var sourceInputs = from input in inputs
                                           // validate table
                                           where !string.IsNullOrEmpty(eField.TargetTable)
                                           where input.Table == eField.SourceTable && matchRecordIds(input.RecordId, eField.SourceRecordId)
                                           select input;

                        // get child input fields of target
                        if (eField.TriggeredByChildren)
                        {
                            // i.e. target=Survey.SurveyType,1, children=SurveyItems where ParentRecordId = 1
                            var targetChildInputs = from childTable in BOL.BusinessObject.GetChildTableNames(eField.TargetTable)
                                                    from input in inputs
                                                    where input.Table == childTable && matchRecordIds(input.ParentRecordId, targetInputField.RecordId)
                                                    select input;
                            if (targetChildInputs.Count() > 0)
                            {
                                // TODO: do we just combine sibling and children and rely on side effect ???
                                targetInputSiblings = targetInputSiblings.Concat(targetChildInputs).Distinct();
                            }
                        }

                        // FILTER and VALIDATE
                        bool hasClientFields = true;
                        switch (type)
                        {
                            case EFormController.EformDefaultType.Default:
                                // no source
                                sourceInputs = sourceInputs.Take(0);
                                break;
                            case EFormController.EformDefaultType.SourceDefaultValue:
                                // validate: 1+ source
                                if (sourceInputs.Count() == 0)
                                    hasClientFields = false;
                                break;
                            case EFormController.EformDefaultType.SourceValue:
                                // validate: only 1 source (match exact Field)
                                sourceInputs = sourceInputs.Where(i => i.Field == eField.SourceField).Take(1);
                                if (sourceInputs.Count() == 0)
                                    hasClientFields = false;
                                break;
                            // never gets called
                            default:
                                hasClientFields = false;
                                break;
                        }

                        // BUILD: client scripts

                        if (hasClientFields)
                        {
                            // get fields as Control to get client id
                            Control targetInputControl = targetInputField as Control;
                            IEnumerable<Control> targetInputSiblingControls = targetInputSiblings.OfType<Control>();
                            IEnumerable<Control> sourceInputControls = sourceInputs.OfType<Control>();

                            // BUILD: client JSON
                            var JSONConfig = new
                            {
                                DefaultType = type.ToString(),
                                DefaultValue = eField.DefaultValue,
                                Target = new { Type = targetInputControl.GetType().Name, Id = targetInputControl.ClientID },
                                TargetSiblings = targetInputSiblingControls.Select(s => new { Type = s.GetType().Name, Id = s.ClientID }),
                                Sources = sourceInputControls.Select(t => new { Type = t.GetType().Name, Id = t.ClientID }),
                                RequireSiblings = eField.RequireSiblings,
                                TriggerSiblings = eField.TriggeredBySiblings
                            };
                            // serialize object
                            string JSONConfigString = serializer.Serialize(JSONConfig);
                            _clientConfigs.Add(JSONConfigString);
                        }
                    }

                    // BUILD: default labels
                    if (type == EFormController.EformDefaultType.Default)
                    {
                        foreach (var label in labels)
                        {
                            // parse via id
                            if (!string.IsNullOrEmpty(label.DefaultField))
                            {
                                string labelTable = "";
                                string labelField = "";
                                string labelRecordId = "";
                                EFormController.EformDefaultValueField.ParseDefaultField(label.DefaultField, ref labelTable, ref labelField, ref labelRecordId);
                                if (eField.TargetTable == labelTable && eField.TargetField == labelField && eField.TargetRecordId == labelRecordId)
                                {
                                    label.Text = eField.DefaultValue;
                                }
                            }
                        }
                    }
                }
                // CLIENT SCRIPT: build and register client script
                if (_clientConfigs.Count() > 0)
                {
                    // serialize list of objects into JSON array for client scripts
                    string configJSONArray = "[" + string.Join(",", _clientConfigs.ToArray()) + "]";

                    // register start up script: validate functions exists
                    string _script = "if(window.initEformDefaultValues) { window.initEformDefaultValues(" + configJSONArray + "); }";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "initEformDefaultValues_" + this.ClientID, _script, true);
                }
            }
        }         


        #endregion
    }
}
