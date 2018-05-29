namespace Caisis.UI.Modules.All.Eforms
{
	using System;
	using System.Data;
	using System.Drawing;
	using System.Web;
	using System.Web.UI.WebControls;
	using System.Web.UI.HtmlControls;

	using Caisis.BOL;
	using Caisis.UI.Core.Classes;
	using Caisis.UI.Core.Classes.CustomControls;
    //2.0 	using Caisis.UI.Modules.Prostate.PaperForms;
	using Caisis.DataAccess;

	/// <summary>
    ///		Summary description for AllergiesWithReadOnlyMeds.
	/// </summary>
    public partial class AllergiesWithNKAAndUnchanged : BaseEFormControl
	{



		override protected void Page_Load(object sender, System.EventArgs e)
		{
			base.Page_Load(sender, e);
			BuildAllergies(this._patientId, this._eformName, "Dynamic");

//            BuildReadOnlyMeds(this._patientId, this._eformName, "Dynamic");


		}

        

        /// <summary>
        /// For customization reasons, this method reimplements BaseEFormControl.EFormRepeaterOnDataBound(...)
        /// and appends functionality to hide rows that have "past" MedStopDates
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void DecorateMedicationsAll(object sender, RepeaterItemEventArgs e)
        {
            DataRowView rowView = (DataRowView)e.Item.DataItem;

            if (rowView != null)
            {


                // include extra header row if necessary
                HtmlTableRow extraHeaderRow;
                extraHeaderRow = (HtmlTableRow)e.Item.FindControl("extraHeaderRow");
                if (e.Item.ItemIndex != 0 && e.Item.ItemIndex % 10 == 0) extraHeaderRow.Visible = true;


            }

            // decorate tr

            // if the stop date < current clinic date, set parentTR.style.display = 'none'

            //object objStopDate = rowView["MedStopDate"];
            //if (objStopDate != DBNull.Value)
            //{
            //    DateTime stopDate = DateTime.Parse(objStopDate.ToString());
            //    DateTime clinDate = DateTime.Now;

            //    if (Session[SessionKey.CurrentClinicDate] != null)
            //    {
            //        clinDate = DateTime.Parse(Session[SessionKey.CurrentClinicDate].ToString());
            //    }

            //    if (stopDate < clinDate)
            //    {
            //        tr.Style["DISPLAY"] = "none";
            //    }
            //}
        }

        /*
        protected virtual void BuildReadOnlyMeds(int PatientID, string FormName, string FormType)
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
            DataSet medDs = medDa.FormGetRecords(PatientID, FormName, FormType, stopDate);

            medDs.Tables[0].Columns.Add("MedTableType");

            foreach (DataRow dr in medDs.Tables[0].Rows)
            {
                dr["MedTableType"] = "Medications";
            }

            MedicalTherapyDa medTxDa = new MedicalTherapyDa();
            DataSet medTxDs = medTxDa.FormGetRecords(PatientID, FormName, FormType);
            if (medTxDs.Tables.Count > 0 && medTxDs.Tables[0].Rows.Count > 0)
            {
                DataView medTxDv = new DataView(medTxDs.Tables[0]);
                string filter = "(MedTxRoute = 'Orally') AND (Isnull(MedTxStopDateText,'') = '')";
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
                    newRow["MedicationId"] = drv.Row["MedicalTherapyId"];
                    newRow["MedTableType"] = "MedicalTherapy";


                    medDs.Tables[0].Rows.Add(newRow);
                }

            }


            if (medDs.Tables[0].Rows.Count > 0)
            {
                DataView medDv = new DataView(medDs.Tables[0]);
                medDv.Sort = "MedDate, MedStopDate, Medication";
                medicationsAll.DataSource = medDv;
                medicationsAll.DataBind();
            }
            else
            {
                readOnlyMedsTitle.Visible = false;
                noReadOnlyMedsTitle.Visible = true;
            }
        }


        */
	}
}
