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


using Caisis.Security;
using Caisis.DataAccess;
using Caisis.Controller;
using Caisis.UI.Core.Classes;
using Caisis.UI.Core.Classes.CustomControls;

namespace Caisis.UI.Core.Eforms
{
	/// <summary>
	/// Summary description for ValidateEForm.
	/// </summary>
	public partial class ValidateEForm : EFormBasePage
	{
		private	bool isValidXml;

		protected ArrayList invalidFields = new ArrayList();
		
		protected override void Page_Load(object sender, System.EventArgs e)
		{
			base.Page_Load(sender, e);

			valMsg.Text = "";	
			
			debugOut.Text = "";
	
			returnLink.HRef = "EditEFormContainer.aspx?eformId=" + base.EFormId + "";

			//isValidXml = true;
			
			if(this.ValidateXml() == true)
			{
				this.GoToVerify();	
			}
			else
			{
				this.WriteInvalidFields();

				valMsg.Text = "This report can not be previewed until invalid data is updated. Please update fields highlighted in yellow below.";

                // Eform Default Values: regitser scripts
                XmlDocument eformXml = this.LoadEformXml();
                base.BuildDefaultValuesScript(eformXml);
            }
			
			if(Page.IsPostBack)
			{
				base.WriteEform();

				//isValidXml = true;

				if(this.ValidateXml() == true)
				{
					this.GoToVerify();	
				}
			}

            if (this.EFormName == "GU Pros FU") doctypeBreaker.Visible = false;

		}


		/****************************************************************************************************************
		***************************** Events that fire during validation ******************************************
		****************************************************************************************************************/



		protected void WriteInvalidFields()
		{
			//1) loop over ALL files that comprise the eform
			//2) find input controls that match the field names in the invalidArray
			//3) if match is found add that file to the placholder
			//4) change style of invalid field

			// 1.
			string modFolder = Caisis.UI.Core.Classes.XmlUtil.GetParentModuleDirectory(base.EFormFileName +".xml", "EForms" );
			XmlDocument eformsXml = XmlUtil.GetXmlDoc("~\\Modules\\" + modFolder + "\\EForms\\" + base.EFormFileName + ".xml");
			XmlNodeList eformSections = eformsXml.SelectNodes("eform[@name='" + base.EFormName + "']/eformSection");
		
			holder.Controls.Clear();

			foreach(XmlNode sectionNode in eformSections)
			{	
				foreach(XmlNode controlNode in sectionNode)
				{
					//DEBUG: Response.Write("<BR>"+controlNode.Attributes["controlName"].Value);

					// need to iterate over all files included in this eform
					System.Web.UI.UserControl eFormControl = base.GetEFormControl(controlNode.Attributes["controlName"].Value + ".ascx");

					// 2.
					foreach (Control con in PageUtil.GetCaisisInputControlsInContainer(eFormControl))
					{	
						if(con is IEformInputField)
						{
							if(((IEformInputField)con).Field != null)
							{
								foreach (string[] s in invalidFields)
								{
									string nodeName = s[0];
									string recordId = s[1];
									

									// only add field when record id and name of node matches 
									if(recordId != null && ((IEformInputField)con).RecordId != null && ((IEformInputField)con).RecordId.Equals(recordId) && ((IEformInputField)con).Field.Equals(nodeName))
									{
										//Response.Write("<BR>MATCH Node: " + nodeName + " RECORDID: " + recordId);
										// 3. 
										holder.Controls.Add(eFormControl);

										// 4.
										base.SetInvalidStyle(con, "yellow");
									}
									// no record id, just match name of node
									else if(((IEformInputField)con).Field.Equals(nodeName) && recordId == null)
									{
										//Response.Write("<BR>MATCH Node: " + nodeName);
										// 3. 
										holder.Controls.Add(eFormControl);

										// 4.
										base.SetInvalidStyle(con, "yellow");
									}
								}
								//DEBUG: Response.Write("<BR>FIELD:" + ((IEformInputField)con).Field);
							}
						}
					}	
				}
			}
		}
		
	

		/// <summary>
		/// Determines if eform xml is valid based on Xml Required attributes and/or an .xsd document. 
		/// Note .xsd logic is currently commented out. If range validation is needed use .xsd as well.
		/// </summary>
		/// <returns>Return true/false if xml is valid</returns>
		private bool ValidateXml()
		{
			isValidXml = true;
			// get xml from database
			EFormController ctr = new EFormController();

			//DataSet ds = ctr.GetOpenRecordByName(_patientId, _eformName);
			DataSet ds = ctr.GetRecord(base.EFormId);
			
			if(ds.Tables[0].Rows.Count > 0)
			{
				string xmlString = ds.Tables[0].Rows[0]["EFormXml"].ToString(); // should replace col name w/ reference to BizO
			
				// first check Xml doc for required fields
				this.CheckRequiredElements(xmlString);

				return isValidXml;
			}
			// no record in db yet, should display msg
			return false;
		}




		/// <summary>
		/// Puts all xml elements with a "Required='True'" attribute that do no have values in an array. 
		/// Contains logic to distinguish between Required fields that have the same parent "RecordId". 
		/// </summary>
		/// <param name="xmlString">eform xml document with saved values</param>
		private void CheckRequiredElements(string xmlString)
		{
			XmlDocument xDoc = new XmlDocument();
			xDoc.LoadXml(xmlString);

			// get list of sections //fs 6/27/05
			XmlNodeList eformNodes	= xDoc.SelectNodes("//*");
			
	
			// put elements with Required attribute that do not have values in array
			foreach(XmlNode node in eformNodes)
			{
				if(node.Attributes["Required"] != null && node.InnerText.Equals(""))
				{
					this.isValidXml = false;
					
					string recId = null;

					// get record Id from parent node to highlight correct child node
					if(node.ParentNode.Attributes["RecordId"] != null)
					{
						recId = node.ParentNode.Attributes["RecordId"].Value;
					}
					string[] invalidPair = new string[2]; // multidimensional array to hold invalid node names and record id's
		
					invalidPair[0] = node.Name;
					invalidPair[1] = recId;
					
					invalidFields.Add(invalidPair);	
				}
			}


			// put elements with NotNull attribute in array when they do not have a value AND another element in the record has a value 
			foreach(XmlNode node in eformNodes)
			{
				if(node.Attributes["NotNull"] != null && node.InnerText.Equals(""))
				{
					bool rowHasData = false;
					
					// see if any other elements with same parent node have values
					if(node.ParentNode.HasChildNodes)
					{
						foreach (XmlNode nodeInRow in node.ParentNode.ChildNodes)
						{
							if(nodeInRow.InnerText != "")
							{
								// at least one node of this parent node has a value
								rowHasData = true;
							}
						}
					}

					if(rowHasData == true)
					{
						this.isValidXml = false;

						this.AddInvalidNodeToArray(node);
					}
					
				}
			}
		}

		private void AddInvalidNodeToArray(XmlNode invalidNode)
		{
			string recId = null;

			// get record Id from parent node to highlight correct child node
			if(invalidNode.ParentNode.Attributes["RecordId"] != null)
			{
				recId = invalidNode.ParentNode.Attributes["RecordId"].Value;
			}
			string[] invalidPair = new string[2]; // multidimensional array to hold invalid node names and record id's
		
			invalidPair[0] = invalidNode.Name;
			invalidPair[1] = recId;
					
			invalidFields.Add(invalidPair);	
		}

		
		
		protected void GoToVerify()
		{
			// by default redirects to the verify page unless Validation page sends over url var saying otherwise
			// string url = "EformVerify.aspx?eformId="+ base.EFormId +"";

			//string url = "EformNarrative.aspx?eformId="+ this.EFormId +"";
			string url = "ReviewEFormContainer.aspx?eformId="+ this.EFormId +"";

			if(Request.QueryString["nextStep"] != null && Request.QueryString["nextStep"].Length > 0)
			{
				string nextStep = Request.QueryString["nextStep"].ToLower();
				
				if(nextStep.Equals("narrative"))
				{
					url =  "ReviewEFormContainer.aspx?eformId=" + this.EFormId;
				}
				else if(nextStep.Equals("approve"))
				{
                    url = "ReviewEFormContainer.aspx?eformId=" + this.EFormId;
                    // v4.1 approval now done on review page // url = "ApproveEFormContainer.aspx?eformId=" + this.EFormId;
				}
			}

			Response.Redirect(url);
		}
	}
}
