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
using System.Linq;

using Caisis.BOL;
using Caisis.DataAccess;
using Caisis.Security;

using Caisis.UI.Core.Classes;

namespace Caisis.UI.Core.Help
{
	/// <summary>
	/// Summary description for HelpPage.
	/// </summary>
	public partial class HelpPage : BasePage
	{
		protected string pageName, helpSection;

		override protected void Page_Load(object sender, System.EventArgs e)
		{

			if (Request.QueryString["helpSection"] != null)
			{

				helpSection = Server.UrlDecode(Request.QueryString["helpSection"]);
				HelpDa hda = new HelpDa();


				// patient data section is a special section, the rest are in else statement
				if (helpSection.ToUpper() == "PATIENT DATA" || helpSection.ToUpper() == "WORKFLOWS")
				{
					if (Session[SessionKey.CurrentPage] != null)
					{
						pageName = Session[SessionKey.CurrentPage].ToString();
					}
					else
					{
						pageName = "none"; // no current Page
					}


                    //pageTitle.Text = pageName;
                    
					//DataSet hds = hda.GetHelpTableDescription(pageName);
					//DataTable PageHelpDt = hds.Tables[0];

					//DataTable PageHelpDt = GetPageHelp(pageName);
                    //if (PageHelpDt.Rows.Count > 0)
                    //{
                    //    pageDescription.Text = PageHelpDt.Rows[0]["TableDescription"].ToString();
                    //}


					//REPLACE HERE
//					DataTable FieldHelpDt = GetFieldHelp(pageName);

                    //DataSet FieldHelpDs = hda.GetHelpFieldDescriptionsWithLabels(pageName);
                    //DataTable FieldHelpDt = FieldHelpDs.Tables[0];

                    //if (FieldHelpDt.Rows.Count > 0)
                    //{
                    //    ItemsOnThisPage.Visible = true;
                    //    rptFieldDesciptions.DataSource = FieldHelpDt;
                    //    rptFieldDesciptions.DataBind();
                    //}

                    // v6
                    pageTitle.Text = pageName;

                    Caisis.Controller.PatientDataEntryController pdec = new Caisis.Controller.PatientDataEntryController();
                    if (pdec.IsTable(pageName))
                    {
                        // build table label and description
                        string tableName = pageName;
                        string tableLabel = pdec.GetTableLabel(tableName);
                        pageTitle.Text = tableLabel;

                        string tableDescription = pdec.GetTableDescription(tableName);
                        if (!string.IsNullOrEmpty(tableDescription))
                        {
                            pageDescription.Text = tableDescription;
                        }

                        // build fields (match data entry fields)
                        var dataEntryFields = from field in CICHelper.GetCaisisInputControlsByTableName(tableName)
                                              select new
                                              {
                                                  Field = field.Field,
                                                  FieldLabel = !string.IsNullOrEmpty(field.FieldLabel) ? field.FieldLabel : field.Field,
                                                  FieldDescription = !string.IsNullOrEmpty(field.HelpDescription) ? field.HelpDescription : "(No Description)"
                                              };
                        rptFieldDesciptions.DataSource = dataEntryFields;
                        rptFieldDesciptions.DataBind();                        
                    }

				}
				else
				{





					switch(Server.UrlDecode(Request.QueryString["helpSection"]).ToUpper())
					{
						case "PATIENT LISTS":
							pageTitle.Text = "Patient List";
							break;

						case "PATIENT DATA":
							pageTitle.Text = "Patient Data";
							break;

						case "SPLASH":
							pageTitle.Text = "Caisis Home Page";
							break;

						case "FORMS":
							pageTitle.Text = "Forms";
							break;

						case "REPORTS":
							pageTitle.Text = "Reports";
							break;

						case "ADMIN":
							pageTitle.Text = "Caisis Admin";
							break;


						case "NEWTOCAISIS":
							pageTitle.Text = "Getting Started";
                            ItemsOnThisPageRow.Visible = true;
							ItemsOnThisPage.Visible = true;
							ItemsOnThisPage.Text = "Caisis is a Cancer Database designed to bridge the gap between Clinical Research and Clinical Practice. The project was started with the goal of improving data quality and accuracy while reducing time and effort for clinicians trying to summarize and document patient histories. Currently, data is captured in the Caisis Database electronically then printed on to billing and compliant paper forms used for documentation purposes. A long term goal of the project is to replace these paper forms with wireless tablet PCs that reduce reliance on trained data management staff and decrease the turnaround time for data capture.<br><br>There are five major sections to this application, <a href=\"HelpPage.aspx?helpSection=PatientList\">Patient Lists</a>, <a href=\"HelpPage.aspx?helpSection=PatientDataSection\">Patient Data</a>, <a href=\"HelpPage.aspx?helpSection=Forms\">Forms</a>, <a href=\"HelpPage.aspx?helpSection=Reports\">Reports</a>, and the <a href=\"HelpPage.aspx?helpSection=Admin\">Admin</a>. Of these sections, the average user will have access to four of the sections. The fifth section, the Admin, will only be available if you have permissions to administer the application.";
							break;

						default :
							pageTitle.Text = "Help Unavailable";
							break;
					}

					//REPLACE HERE
//					pageDescription.Text = GetSectionHelp(Request.QueryString["helpSection"]);

                    //DataSet hsDs = hda.GetHelpSectionName(helpSection);
                    //DataTable SectionHelpDt = hsDs.Tables[0];                    
					//DataTable PageHelpDt = GetPageHelp(pageName);
                    //if (SectionHelpDt.Rows.Count > 0)
                    //{
                    //    pageDescription.Text = SectionHelpDt.Rows[0]["HelpSectionDescription"].ToString();
                    //}

                    // v6
                    var sections = BOL.BusinessObject.GetByFields<BOL.HelpSection>(new Dictionary<string, object>
                    {
                         { BOL.HelpSection.HelpSectionName, helpSection }
                    });
                    if (sections.Count() > 0)
                    {
                        pageDescription.Text = sections.First()[BOL.HelpSection.HelpSectionDescription].ToString();
                    }

				}

			}
			else
			{
				pageTitle.Text = "Help Unavailable";
			}

			
		}





		//protected DataTable GetPageHelp(string tableName)
		//{
		//	string cmdText = "select HelpTableDescription from HelpTables where HelpTableName ='"+tableName+"'";

		//	DataTable pagedt = new DataTable();
		//	DataAccessHelper.ExecuteSqlSelect(cmdText, pagedt);

		//	return pagedt;

		//}



		protected string GetSectionHelp(string HelpSectionName)
		{
			string cmdText = "select * from HelpSections where HelpSectionName ='"+HelpSectionName+"'";
			string helpText;

			DataTable sectiondt = new DataTable();
			DataAccessHelper.ExecuteSqlSelect(cmdText, sectiondt);

			if (sectiondt.Rows.Count.Equals(1))
			{
				helpText = sectiondt.Rows[0]["HelpSectionDescription"].ToString();
			}
			else
			{
				helpText = "No help is currently available for this section.";
			}

			return helpText;

		}



		protected DataTable GetFieldHelp(string tableName)
		{
			string cmdText = "select HelpFieldName, HelpFieldLabel, HelpFieldDescription from helpfields f, helptables t where f.helptableid = t.helptableid and t.helptablename='"+tableName+"' and f.HelpFieldLabel <> ''";

			DataTable dt = new DataTable();
			DataAccessHelper.ExecuteSqlSelect(cmdText, dt);

			return dt;
		}
	}
}
