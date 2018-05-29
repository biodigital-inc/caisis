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
using System.Configuration;

using Caisis.UI.Core.Classes;
using Caisis.Controller;


namespace Caisis.UI.Core.PaperForms
{
	/// <summary>
	/// Summary description for FormsContainer.
	/// </summary>
	public partial class FormsContainer : BasePage
	{


		protected DataTable formBatchesTable;

		protected int numFormBatches;

        protected bool DoubleSidedPrintEnabled;
        protected bool DoubleSidedPrintPreference;
        protected bool HideAttendingPreference = true;




        protected override void OnInit(EventArgs e)
        {
            string NewDoubleSidedPrintingSetting = "";
            NewDoubleSidedPrintingSetting = Request.Form["NewDoubleSidedPrintingSetting"];

            if (!string.IsNullOrEmpty(NewDoubleSidedPrintingSetting))
            {
                UserController uc = new UserController();
                // user preference
                uc.UpdateUserAttribute("DoubleSidedPrinting", NewDoubleSidedPrintingSetting, "Forms Preference");
                Response.End();
            }
            else
            {
                base.OnInit(e);
            }
        }

		override protected void Page_Load(object sender, System.EventArgs e)
		{

			// if this is going to be a batch print
			if (Request.Form["batchPrint"] != null)
			{
				Session[SessionKey.FormStyle] = "populated";
				string BatchPrintBaseUrl = "FormsContent.aspx?batchPrint=true";


				int maxFormsPerPrintJob = 10;
                string maxFormConfig = CaisisConfiguration.GetWebConfigValue("maxFormsPerPrintJob");
				if (!string.IsNullOrEmpty(maxFormConfig))
				{
					maxFormsPerPrintJob = Convert.ToInt32(maxFormConfig);
				}

				int currentFormNumber = 0;
				int currentBatchIndexNumber = 0;



				DataTable BatchTable = BuildBatchTable();
				Object[] firstBatch = new Object[4] {1, 1, maxFormsPerPrintJob, BatchPrintBaseUrl};
 
				BatchTable.Rows.Add(firstBatch);




				foreach (string formElementName in Request.Form)
				{
					if (Request.Form[formElementName] != "" && Request.Form[formElementName] != "none" && formElementName != "batchPrint" && formElementName != "x" && formElementName != "y" && formElementName != "createBatchButton.x" && formElementName != "createBatchButton.y" && formElementName != "SelectForAllPatients")
					{
						currentFormNumber += 1;

						if (currentFormNumber > Convert.ToInt32(BatchTable.Rows[currentBatchIndexNumber]["BatchEndingFormNumber"]))
						{
							int newBatchNumber = Convert.ToInt32(BatchTable.Rows[currentBatchIndexNumber]["BatchNumber"]) + 1;
							int newBatchBeginningFormNumber = Convert.ToInt32(BatchTable.Rows[currentBatchIndexNumber]["BatchBeginningFormNumber"]) + maxFormsPerPrintJob;
							int newBatchEndingFormNumber = Convert.ToInt32(BatchTable.Rows[currentBatchIndexNumber]["BatchEndingFormNumber"]) + maxFormsPerPrintJob;
							Object[] newBatch = new Object[4] {newBatchNumber, newBatchBeginningFormNumber, newBatchEndingFormNumber, BatchPrintBaseUrl};
							BatchTable.Rows.Add(newBatch);
							
							currentBatchIndexNumber += 1;
						}
						
						BatchTable.Rows[currentBatchIndexNumber]["BatchUrlString"] = BatchTable.Rows[currentBatchIndexNumber]["BatchUrlString"].ToString() + "&" + formElementName + "=" + Request.Form[formElementName];


						//						formBatchUrl = formBatchUrl + "&" + formElementName + "=" + Request.Form[formElementName];
					}
				}


				if (BatchTable.Rows.Count > 1)
				{

					BatchTable.Rows[currentBatchIndexNumber]["BatchEndingFormNumber"] = currentFormNumber;
					
					numFormBatches = currentBatchIndexNumber + 1;


					rptPrintBatches.DataSource = BatchTable.DefaultView;
					rptPrintBatches.DataBind();

				}

				FormsContent.Attributes["src"] = BatchTable.Rows[0]["BatchUrlString"].ToString();





// --------------------------------------------
				string listTitle = "";
				string currentClinicDate;

                SessionHandler sh = new SessionHandler(this.Page.Session);
                currentClinicDate = sh.GetCurrentClinicDate();

                /*if (Session[SessionKey.CurrentClinicDate] != null && Session[SessionKey.CurrentClinicDate].ToString() != "")
				{
					currentClinicDate = Session[SessionKey.CurrentClinicDate].ToString();
				}
				else
				{
					// default clinic date to today
                    currentClinicDate = System.DateTime.Now.Date.ToShortDateString();// v4.5 ToString("MM/dd/yyyy");
                    Session[SessionKey.CurrentClinicDate] = currentClinicDate;
				}*/

				if (Session[SessionKey.CurrentListCrit] != null && Session[SessionKey.CurrentListType] != null)  
				{
					string listType = Session[SessionKey.CurrentListType].ToString();
					string listCrit = Session[SessionKey.CurrentListCrit].ToString();
					string listCritName = "";


					if (Session[SessionKey.CurrentListCritName] != null)
					{
						listCritName = Session[SessionKey.CurrentListCritName].ToString();
					}


					switch (listType)
					{
						case "Clinic":
							listTitle = listCrit + "<br/>on " + currentClinicDate;
							break;
						case "Protocol":
							if(!listCritName.Equals(""))
							{
								listTitle = "Patients in<br/>" + listType + " " + listCritName;
							}
							else
							{
								listTitle = listType;
							}
							break;
						case "Physician":
							if(!listCritName.Equals(""))
							{
								listTitle = "Patients who have visited<br/>"+ listCritName;
							}
							else
							{
								listTitle = listType;
							}
							break;
						case "lastname":
							if(listCrit.Equals("All"))
							{
								listTitle = "All Patients";
							}
							else
							{
								listTitle = "Patients with Last Names<br/>Beginning with the Letter \"" + listCrit + "\"";

							}
							break;
						case "ContactStatus":
							listTitle = "Patients on the Following List:<br/>Contact Status -  " + listCrit;
							break;
						case "ItemsMissing":
							listTitle = "Patients with Missing Items";
							break;
						case "ItemsPending":
							listTitle = "Patients with Pending Items";
							break;
						default:
							listTitle = "Patients on the Following List:<br/>" + listType + " -  " + listCrit;
							break;
					}

				}

				if (listTitle.Length > 0)
				{
					formTitlePatientName.Text = "for " + listTitle;
				}

// --------------------------------------------

				FormTitleMod.Text = "Forms";
//				printFormButton.Src = "../../Images/FormImages/PrintTheseForms.gif";


			}
			else if (Request.QueryString["blankForms"] != null && Request.QueryString["blankForms"] == "true")
			{
				Session[SessionKey.FormStyle] = "blank";
				FormsContent.Attributes["src"] = "FormsContent.aspx?blankForms=true";
			}
			else
			{
				Session[SessionKey.FormStyle] = "populated";

				if (Session[SessionKey.PtLastName] != null && Session[SessionKey.PtLastName].ToString().Length > 0)  
				{
					formTitlePatientName.Text = "for " + Session[SessionKey.PtFirstName].ToString() + " " + Session[SessionKey.PtLastName].ToString();
				}


			}


            DoubleSidedPrintEnabled = false;

            System.Xml.XmlDocument xDoc = XmlUtil.GetModulesConfigXml();
            string DSPrintConfig = xDoc.SelectSingleNode("/modules//module[@name='Forms']/configuration/allowDoubleSided") != null ? xDoc.SelectSingleNode("/modules//module[@name='Forms']/configuration/allowDoubleSided").InnerText : string.Empty;
            if (DSPrintConfig.Length > 0 && bool.TryParse(DSPrintConfig, out DoubleSidedPrintEnabled))
            {
                if (DoubleSidedPrintEnabled)
                {
                    DoubleSidedPrintPreference = UserPrefDoubleSided();
                }
                else
                {
                    DoubleSidedPrintPreference = false;
                }
            }
		}



		protected DataTable BuildBatchTable()
		{
					
			DataTable dt = new DataTable("BatchTable");

			DataColumn batchColumn;

			// add column for page number
			batchColumn = new DataColumn();
			batchColumn.ColumnName = "BatchNumber";
			batchColumn.DataType = System.Type.GetType("System.Int32");
			dt.Columns.Add(batchColumn);

			// add column for page number
			batchColumn = new DataColumn();
			batchColumn.ColumnName = "BatchBeginningFormNumber";
			batchColumn.DataType = System.Type.GetType("System.Int32");
			dt.Columns.Add(batchColumn);

			// add column for page number
			batchColumn = new DataColumn();
			batchColumn.ColumnName = "BatchEndingFormNumber";
			batchColumn.DataType = System.Type.GetType("System.Int32");
			dt.Columns.Add(batchColumn);

			// add column for control file name
			batchColumn = new DataColumn();
			batchColumn.ColumnName = "BatchUrlString";
			batchColumn.DataType = System.Type.GetType("System.String");
			dt.Columns.Add(batchColumn);

			return dt;

		}


        private bool UserPrefDoubleSided()
        {

            bool preferDoubleSided = false;

            UserController uc = new UserController();

            DataTable dt = uc.GetUserAttributesByType("Forms Preference");

            if (dt.Rows.Count > 0)
            {
                foreach (DataRow dr in dt.Rows)
                {
                    if (dr[BOL.UserAttribute.UserAttributeName].ToString().ToUpper() == "DOUBLESIDEDPRINTING")
                    {
                        bool.TryParse(dr[BOL.UserAttribute.UserAttributeValue].ToString(), out preferDoubleSided);
                    }
                }
            }


            return preferDoubleSided;
        }

	}
}
