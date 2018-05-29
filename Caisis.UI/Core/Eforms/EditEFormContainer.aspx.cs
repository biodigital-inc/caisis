 using System;
using System.Collections;
using System.Collections.Generic;
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
using System.Linq;

using Caisis.DataAccess;

using Caisis.BOL;
using Caisis.Controller;
using Caisis.Security;

using Caisis.UI.Core.Classes;
using Caisis.UI.Core.Classes.CustomControls;

namespace Caisis.UI.Core.Eforms
{
	/// <summary>
	/// Loads eform components (.ascx files) and navigation based on the eforms Xml. 
	/// Eform base page handles saving data. 
	/// </summary>
	public partial class EditEFormContainer : EFormBasePage
	{
		

		private string _sectionName = "";
        
	
		protected override void Page_Load(object sender, System.EventArgs e)
		{
			base.Page_Load(sender, e);

			this.SetEFormNavigationSteps();
	
			// don't mess with the order of events fired on page load- very sensitive!
			this.SetEFormSectionName();

            // set nav state
            this.SetEFormNavigationState();

			// must always load eform nav and components whether or not page is being posted back!
			this.LoadEFormNavigationFromXml();

			this.LoadEFormComponents();
			
			if(Page.IsPostBack)
			{
				int primaryKey = base.WriteEform();
				
				this.GoToNextPage(primaryKey);
			}
			else
			{
				

				this.SetDeleteBtn();
			}
            this.SetNextandBackBtns();



			if (this.EFormId > 0)
			{
				// value used to trigger saving on click of clinic list btn
				nextEformId.Value = this.EFormId.ToString();
			}
			
			EFormTitle.Text = base.EFormTitle;

		
			// limit xml view to admins
			if (PermissionManager.HasPermission(PermissionManager.EditSecurity))
			{
                // if eform exists, load by id
                if (this.EFormId > 0)
                {
                    testLink.NavigateUrl = "EformDebug.aspx?encEformId=" + Security.CustomCryptoHelper.Encrypt(this.EFormId.ToString());
                }
                // otherwise load by name
                else
                {
                    testLink.NavigateUrl = "EformDebug.aspx?encEformName=" + Security.CustomCryptoHelper.Encrypt(base.EFormFileName);
                }
                // show link
                testLink.Visible = true;
			}


            if (base.EFormIsOfType("GU ", false)) doctypeBreaker.Visible = false;

            base.EFormSectionName = _sectionName;
		}
		
		private void SetEFormSectionName()
		{
			// navigation clicked
			if(Request.QueryString["sectionName"] != null && Request.QueryString["sectionName"].Length > 0)
			{
				_sectionName = Request.QueryString["sectionName"];
			}
			// returning from verify page
			else if(Request.QueryString["nodeName"] != null && Request.QueryString["nodeName"].Length > 0)
			{
				_sectionName = this.GetEFormSectionFromNodeName(Request.QueryString["nodeName"]);
			}
			// else default section name is set around line 170
		}


		/// <summary>
		/// Returns the name of the section in the EForm that contains the node.
		/// </summary>
		/// <param name="nodeName">name of parent or child node</param>
		/// <returns>name of the eform section</returns>
		private string GetEFormSectionFromNodeName(string nodeName)
		{

            
			XmlDocument eformsXml = this.GetEFormsXml();
			
			XmlNodeList eformSections = eformsXml.SelectNodes("eform/eformSection");
		
			foreach(XmlNode sectionNode in eformSections)
			{	
				foreach(XmlNode controlNode in sectionNode)
				{
					// need to iterate over all files included in this eform
					System.Web.UI.UserControl eFormControl = base.GetEFormControl(controlNode.Attributes["controlName"].Value + ".ascx");

					foreach (Control con in eFormControl.Controls)
					{	
						if(con is IEformInputField)
						{
							// compares either field name or table name to return the given section of the eform
							if(((IEformInputField)con).Field != null && ((IEformInputField)con).Table != null)
							{
								if( ((IEformInputField)con).Field.Equals(nodeName) || ((IEformInputField)con).Table.Equals(nodeName))
								{
									// return section name that contains this field
									return sectionNode.Attributes["name"].Value; 
								}
							}
						}
					}	
				}
			}

			return null;
		}

		
		/// <summary>
		/// Sets the onClick event of the Next button to direct the user to the next section of the eform, or if at the end of the eform, then the Verify Data page.
		/// </summary>
		private void SetNextandBackBtns()
		{
            string sectionName = "";
			string nextSectionName = "";
			string previousSectionName = "";
			
			// take current section name get next section name from 
			XmlDocument eformsXml = this.GetEFormsXml();
					
			if(Request.QueryString["sectionName"] != null && Request.QueryString["sectionName"].ToString().Length > 0)
			{
				sectionName = Request.QueryString["sectionName"].ToString();

				// get list of sections
				XmlNode currentSection	= eformsXml.SelectSingleNode("eform/eformSection[@name='" + sectionName + "']");

				// set next button
				if(currentSection.NextSibling != null && currentSection.NextSibling.NodeType== XmlNodeType.Element && currentSection.NextSibling.Attributes["name"] != null && currentSection.NextSibling.Attributes["name"].Value != "")
				{
					nextSectionName = currentSection.NextSibling.Attributes["name"].Value;
				}
				else
				{
					// last section, go to the verify data page
					// nextSectionName = "verify";
					nextSectionName = "narrative";
				}

				// set previous button
                if (currentSection.PreviousSibling != null && currentSection.PreviousSibling.NodeType== XmlNodeType.Element && currentSection.PreviousSibling.Attributes["name"] != null && currentSection.PreviousSibling.Attributes["name"].Value != "")
				{
					previousSectionName = currentSection.PreviousSibling.Attributes["name"].Value;
				}
				else
				{
					// first section, hide the back button
					BackButton.Visible = false;
				}
			
			}	
			else // loading first section by default, and load second section on next btn click
			{
				XmlNodeList sectionsList = eformsXml.SelectNodes("eform/eformSection");
			
				if(sectionsList == null || sectionsList.Count == 0) // eform xml was not found
				{
					EFormNavTitle.Text = "No eform exists with the name " + base.EFormTitle + ". <BR><BR>Please verify with the system admin.";
				}
				else if(sectionsList.Count > 1) // go to second section first time next btn clicked
				{
					XmlNode secondSection = sectionsList[1];  // second section

					nextSectionName = secondSection.Attributes["name"].Value;
				}
				else // eform is only 1 section long 
				{
					// nextSectionName = "verify";
					nextSectionName = "narrative";
				}

				// first section, hide back button
				BackButton.Visible = false;
			}

			NextButton.Attributes.Add("OnClick", "return saveAndLoad('" + base.EFormId + "', '" + base.EFormName + "', '" + nextSectionName + "')");
			BackButton.Attributes.Add("OnClick", "return saveAndLoad('" + base.EFormId + "', '" + base.EFormName + "', '" + previousSectionName + "')");

            // register script for updating current eform section
            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "saveCurrentEformPage", "function saveCurrentEformPage() { return saveAndLoad('" + base.EFormId + "', '" + base.EFormName + "', '" + sectionName + "'); }", true);
        }

		/// <summary>
		/// Sets delete button properties
		/// </summary>
		private void SetDeleteBtn()
		{
			if(base.EFormId > 0)
			{	
				DeleteBtn.Visible = true;

				DeleteBtn.Attributes.Add("OnClick", "document.location.href = 'EFormDelete.aspx?eformId=" + base.EFormId + "'");
			}
			else
			{
				DeleteBtn.Visible = false;
			}
		}

		
		/// <summary>
		/// Save data before preceeding to the next step
		/// </summary>
		protected void SetEFormNavigationSteps()
		{
			EditStep.HRef		= "";
			// VerifyStep.HRef		= "javascript:saveAndLoad('" + base.EFormId + "', '" + base.EFormName + "', 'verify')";
			NarrativeStep.HRef	= "javascript:saveAndLoad('" + base.EFormId + "', '" + base.EFormName + "', 'narrative')";
			//ApproveStep.HRef	= "javascript:saveAndLoad('" + base.EFormId + "', '" + base.EFormName + "', 'approve')";
		}

        /// <summary>
        /// Sets the state of the default navigation (opened or collapsed)
        /// </summary>
        protected void SetEFormNavigationState()
        {
            // default: use configuration value
            bool setShown = EFormController.ShownNavigation(base.EFormName);
            // check POSTed value to persist in navigation
            string POSTshowEformNav = Request.Form["ShowEformNav"];
            string QSshowEformNav = Request.QueryString["showNav"];
            if (!string.IsNullOrEmpty(POSTshowEformNav))
            {
                setShown = bool.Parse(POSTshowEformNav);
            }
            else if (!string.IsNullOrEmpty(QSshowEformNav))
            {
                setShown = bool.Parse(QSshowEformNav);
            }
            // register script
            string setShownString = setShown.ToString().ToLower();
            ShowEformNav.Value = setShownString;
        }
		

		/// <summary>
		/// Redirects user to the appropriate section within the eform or the next step in the eform process
		/// </summary>
		/// <param name="eformId">unique id of eform</param>
		private void GoToNextPage(int eformId)
		{
			string nextStep = Request.Form["nextSectionName"].ToString();

            // include any additional query string params
            string additionalParams = String.Empty;

            if (Request.QueryString["parentEformId"] != null)
            {
                // retrieve the eform id of the parent eform
                additionalParams += "&parentEformId=" + Request.QueryString["parentEformId"].ToString();
            }
			
			// if(nextStep.Equals("verify") || nextStep.Equals("narrative") || nextStep.Equals("approve"))
			if (nextStep.Equals("narrative") || nextStep.Equals("approve"))
			{
				// no matter what step is clicked always run the validation; validation page then redirects to correct step
				Response.Redirect("ValidateEForm.aspx?eform=" + base.EFormName + "&eformId=" + eformId + "&nextStep=" + nextStep + additionalParams + "");
			}
			else if(Request.Form["gotoNextPage"].Equals("true"))
			{
                additionalParams += "&showNav=" + ShowEformNav.Value;
				//arghh..asp: the controls added during a post-back must match the type and position of the controls added during the initial request
                Response.Redirect("EditEFormContainer.aspx?sectionName=" + Request.Form["nextSectionName"] + "&eformId=" + eformId + additionalParams + "");
			}	
		}


		/// <summary>
		/// Displays navigation from xml. XML file MUST be the same name as EFORM without whitespaces;
		/// ie the Prostate New Patient EForm should have a corresponding Xml file ProstateNewPatientEForm.xml
		/// </summary>
		/// <param name="eformName"></param>
		private void LoadEFormNavigationFromXml()
		{		
			if(base.EFormName != null && !base.EFormName.Equals(""))
			{
				string eformName = base.EFormName;

				string eformFileName = base.EFormFileName;
				
				// authorize user for edit
				bool canEdit = EFormController.CanEditEForm();
			
				// gets the directory name where the file exists; removes dependency on the current view mode
				string disease = Caisis.UI.Core.Classes.XmlUtil.GetParentModuleDirectory(eformFileName +".xml", "EForms" );

				// get Xml
				XmlDocument eformsXml = XmlUtil.GetXmlDoc("~\\Modules\\" + disease + "\\EForms\\" + eformFileName + ".xml");
		
				EFormNavTitle.Text = "Enter Data ";

				if (Session[SessionKey.PtFirstName] != null && Session[SessionKey.PtFirstName].ToString().Length > 0)
				{
					EFormNavTitle.Text += " for " + Session[SessionKey.PtFirstName].ToString();
				}

				if (Session[SessionKey.PtLastName] != null && Session[SessionKey.PtLastName].ToString().Length > 0)
				{
					EFormNavTitle.Text += " " + Session[SessionKey.PtLastName].ToString();
				}

				// get list of sections
				XmlNodeList eformSectionNames	= eformsXml.SelectNodes("/eform/eformSection");

				navigation.Text = "";

				bool isFirstSection = true;

				// if section name is not defined yet- show the first section of eform! 
				if(_sectionName.Equals(""))
				{
					try
					{
						XmlNode firstSection = eformSectionNames[0];
						_sectionName = firstSection.Attributes["name"].Value;
					}
					catch(NullReferenceException)
					{
						throw new ClientException("EForm with this name does not appear to exist. The eform name attribute must be exactly the name of the file WITH spaces. For example: <eform name=\"Uro Pros FU\" displayName=\"Urology Prostate Follow Up\"> when the file name is UroProsFU.xml.");
					}
				}

				// put together navigation string
				foreach(XmlNode node in eformSectionNames)
				{
					

					string sectionName = "";
				
					if(node.Attributes["name"] != null)
					{
						sectionName	= node.Attributes["name"].Value;
						//string filename = node.Attributes["fileName"].Value;
						string linkCssClass = "eformNavigationHeading";

						if ( _sectionName.Equals(sectionName) )
						{
							linkCssClass = "eformNavigationHeadingOn";
						}
						if (!isFirstSection)
						{
							navigation.Text += "<tr><td height=\"20\">&nbsp;</td></tr>";
						}
						else
						{
							isFirstSection = false;
						}
						if(canEdit)
						{
							navigation.Text += "<tr><td id=\"" + sectionName + "\" onclick=\"saveAndLoad('" + base.EFormId.ToString() + "', '" + eformName + "', '" + sectionName + "');\" class=\"" + linkCssClass + "\">" + sectionName + "</td></tr>"; 
						}
						else
						{
							navigation.Text += "<tr><td class=\"" + linkCssClass + "\">" + sectionName + "</td></tr>";
						}
					}
                    //foreach(XmlNode innerNode in node)
                    //{	
                    //    // attribute [0] is display name, attribute [1] is file name
                    //    if(innerNode.Attributes["displayName"] != null)
                    //    {
                    //        if ( _sectionName.Equals(sectionName) )
                    //        {
                    //            navigation.Text += "<tr><td class=\"eformNavigationLinkOn\" onclick=\"document.location='#" + innerNode.Attributes["controlName"].Value + "';\">" + innerNode.Attributes["displayName"].Value  + "</td></tr>";
                    //        }
                    //    }
                    //}

                    // v6 - select nodes by name and attributes (ac)
                    XmlNodeList eformSectionItems = node.SelectNodes("eformItem[@displayName and @controlName]");
                    foreach (XmlNode sectionItem in eformSectionItems)
                    {
                        string displayName = sectionItem.Attributes["displayName"].Value;
                        string controlName = sectionItem.Attributes["controlName"].Value;
                        if (_sectionName.Equals(sectionName))
                        {
                            navigation.Text += "<tr><td class=\"eformNavigationLinkOn\" onclick=\"document.location='#" + controlName + "';\">" + displayName + "</td></tr>";
                        }
                    }
				}
			}
			
		}

		
		/// <summary>
		///  Loads components that make up this section of eform
		/// </summary>
		/// <param name="sectionName"></param>
		private void LoadEFormComponents()
		{
			// take eform section name from url string and get eform components from xml
			if(_sectionName.Length > 0)
			{
					string sectionName = _sectionName;

					// get the current disease
					CustomPrincipal cp = System.Threading.Thread.CurrentPrincipal as CustomPrincipal;
					string disease = cp.UserProfile["diseaseView"].ToString();
						
					

					// get Xml
					XmlDocument eformsXml = this.GetEFormsXml();
					
					// get list of components (.ascx) within this section
					XmlNodeList eformControlNames	= eformsXml.SelectNodes("eform/eformSection[@name='" + sectionName + "']/eformItem");
				
					string controlName = "";
                    string controlTitle = "";
                    string overrideLookupCodes = "";
                    string associatedEformName = "";
                    string associatedEformSectionName = "";
						
					// iterate over file names in this section of the eform and load them
					foreach(XmlNode node in eformControlNames)
					{
						controlName = node.Attributes["controlName"].Value + ".ascx";

                        if (node.Attributes["title"] != null)
                        {
                            controlTitle = node.Attributes["title"].Value;
                        }

                        if (node.Attributes["overrideLookupCodes"] != null)
                        {
                            overrideLookupCodes = node.Attributes["overrideLookupCodes"].Value;
                        }

                        if (node.Attributes["associatedEformName"] != null)
                        {
                            associatedEformName = node.Attributes["associatedEformName"].Value;
                        }

                        if (node.Attributes["associatedEformSectionName"] != null)
                        {
                            associatedEformSectionName = node.Attributes["associatedEformSectionName"].Value;
                        }


						//System.Web.UI.UserControl eFormControl;
                        Caisis.UI.Core.Classes.BaseEFormControl eFormControl;
							
						// check the current disease view first for the .ascx file
						if( System.IO.File.Exists("../../Modules/" + disease + "/Eforms/" + controlName) )
						{
                            eFormControl = (Caisis.UI.Core.Classes.BaseEFormControl)this.LoadControl("../../Modules/" + disease + "/Eforms/" + controlName);
						}
						else // check the other modules for the .ascx file
						{
							string folder = Caisis.UI.Core.Classes.XmlUtil.GetParentModuleDirectory(controlName, "EForms" );
                            eFormControl = (Caisis.UI.Core.Classes.BaseEFormControl)this.LoadControl("../../Modules/" + folder + "/Eforms/" + controlName);
						}

                        // set the control properties
                        eFormControl.Title = controlTitle;
                        eFormControl.LookupCodes = overrideLookupCodes;
                        eFormControl.AssociatedEformName = associatedEformName;
                        eFormControl.AssociatedEformSectionName = associatedEformSectionName;

						// load .ascx file
                        holder.Controls.Add(eFormControl);
                        
					}

                    // Eform Default Values: regitser scripts
                    base.BuildDefaultValuesScript(eformsXml);                    
			}
			else // never reaches here- comment out line 170 to have this clause set the default landing page
			{
				System.Web.UI.UserControl eFormControl;
				
				string controlName = "EFormStart.ascx";
			
				eFormControl = (System.Web.UI.UserControl)this.LoadControl("../../Modules/All/Eforms/" + controlName);
				
				holder.Controls.Add(eFormControl);
			}

            
		}

        private XmlDocument GetEFormsXml()
        {
            string modFolder = Caisis.UI.Core.Classes.XmlUtil.GetParentModuleDirectory(base.EFormFileName + ".xml", "EForms");
            string eformsXmlFile = AppDomain.CurrentDomain.BaseDirectory.ToString() + "\\Modules\\" + modFolder + "\\EForms\\" + base.EFormFileName + ".xml";
            return CaisisConfiguration.GetEFormsXml(eformsXmlFile);
        }

		
	}
}
