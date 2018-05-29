namespace Caisis.UI.Modules.Prostate.PaperForms
{
	using System;
	using System.Data;
	using System.Collections;
	using System.Web;
	using System.Web.UI;
	using System.Web.UI.WebControls;
	using System.Web.UI.HtmlControls;

	using Caisis.BOL;
	
	using Caisis.DataAccess;

	using System.Data.SqlClient;

	using System.Configuration;

	using Caisis.UI.Core.Classes;

	/// <summary>
	///		Summary description for GUProsFU.
	/// </summary>
    public partial class GUPatientMedicationSheet : BasePaperFormControl
	{



		override protected void Page_Load(object sender, EventArgs e)
		{

			base.Page_Load(sender, e);

            BuildAdditionalGUMedicationSection(22, 4, 26);

		}





        // this is really the last page of the GU Pros FU paper form
		override protected void SetFormInfo()  
		{
            this._formName = "GUPatientMedicationSheet";
            this._formTitle = "Home Medication List – GU/Urology";
		}






        // this is mostly identical to the method BuildMedications(int minNumMedRowsToShow, int minNumBlankMedRows)
        // but we need to populate 2 different medications sections on this form and the usual methods both
        // call for the same repeater id.  this version uses a different ID for the repeater
        protected virtual void BuildAdditionalGUMedicationSection(int minNumMedRowsToShow, int minNumBlankMedRows, int numRowsToShowIfNoRecords)
        {
            if (patientID != 0)
            {

                // Medications
                string stopDate = System.DateTime.Now.ToShortDateString();

                if (Session[SessionKey.CurrentListType] != null && Session[SessionKey.CurrentListType].ToString() == "Clinic" && Session[SessionKey.CurrentClinicDate] != null && Session[SessionKey.CurrentClinicDate].ToString().Length > 0)
                {
                    try
                    {
                        stopDate = Convert.ToDateTime(Session[SessionKey.CurrentClinicDate]).ToShortDateString();
                    }
                    catch { }
                }


                MedicationDa medDa = new MedicationDa();
                DataSet medDs = medDa.FormGetRecords(this.patientID, this._formName, "Dynamic", stopDate);

                MedicalTherapyDa medTxDa = new MedicalTherapyDa();
                DataSet medTxDs = medTxDa.FormGetRecords(this.patientID, this._formName, "Dynamic");
                if (medTxDs.Tables.Count > 0 && medTxDs.Tables[0].Rows.Count > 0)
                {
                    DataView medTxDv = new DataView(medTxDs.Tables[0]);
                    string filter = "(MedTxRoute = 'Orally') AND (Isnull(MedTxStopDateText,'') = '')";    //"(MedTxRoute = 'Orally') AND (MedTxStopDateText = '')";
                    medTxDv.RowFilter = filter;

                    foreach (DataRowView drv in medTxDv)
                    {
                        DataRow newRow;
                        newRow = medDs.Tables[0].NewRow();
                        newRow["Medication"] = drv.Row["MedTxAgent"];
                        newRow["MedDose"] = drv.Row["MedTxDose"];
                        newRow["MedUnits"] = drv.Row["MedTxUnits"];
                        newRow["MedSchedule"] = drv.Row["MedTxSchedule"];
                        newRow["MedIndication"] = drv.Row["MedTxIndication"];
                        newRow["MedRoute"] = drv.Row["MedTxRoute"];
                        newRow["MedDateText"] = drv.Row["MedTxDateText"];
                        newRow["MedDate"] = drv.Row["MedTxDate"];
                        newRow["MedStopDateText"] = drv.Row["MedTxStopDateText"];
                        medDs.Tables[0].Rows.Add(newRow);
                    }

                }


                // set the number of blank rows that are added to the medications section

                if (medDs.Tables.Count > 0 && medDs.Tables[0].Rows.Count > 0)
                {
                    int numBlankMedRows = minNumMedRowsToShow - medDs.Tables[0].Rows.Count;

                    // be sure you have at least the number of blank rows specified earlier
                    if (numBlankMedRows < minNumBlankMedRows)
                    {
                        numBlankMedRows = minNumBlankMedRows;
                    }

                    // add the blank rows
                    for (int i = 0; i < numBlankMedRows; i++)
                    {
                        DataRow blankMedsRow;
                        blankMedsRow = medDs.Tables[0].NewRow();
                        blankMedsRow["Medication"] = "&nbsp;";
                        blankMedsRow["MedDose"] = "&nbsp;";
                        blankMedsRow["MedSchedule"] = "&nbsp;";
                        blankMedsRow["MedDateText"] = "&nbsp;";
                        blankMedsRow["MedStopDateText"] = "&nbsp;";
                        blankMedsRow["MedIndication"] = "&nbsp;";
                        blankMedsRow["MedRoute"] = "&nbsp;";
                        blankMedsRow["MedDate"] = "12/31/9999";  // temp fix to facilitate sorting - VERY HACKY - jf
                        medDs.Tables[0].Rows.Add(blankMedsRow);
                    }



                    DataView medDv = new DataView(medDs.Tables[0]);
                    medDv.Sort = "MedDate, MedStopDate, Medication";


                    AdditionalGUMedicationSection.DataSource = medDv;
                }
                else
                {
                    AdditionalGUMedicationSection.DataSource = BlankMedications(numRowsToShowIfNoRecords).DefaultView;
                }

            }
            else
            {
                AdditionalGUMedicationSection.DataSource = BlankMedications(numRowsToShowIfNoRecords).DefaultView;

            }
            AdditionalGUMedicationSection.DataBind();
        }





	}

}
