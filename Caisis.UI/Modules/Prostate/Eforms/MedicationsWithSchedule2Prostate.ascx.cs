namespace Caisis.UI.Modules.Prostate.Eforms
{
	using System;
	using System.Collections.Generic;
	using System.Data;
	using System.Drawing;
	using System.Linq;
	using System.Web;
	using System.Web.UI.WebControls;
	using System.Web.UI.HtmlControls;

	using Caisis.BOL;
	using Caisis.UI.Core.Classes;
	using Caisis.DataAccess;
	using Caisis.UI.Core.Classes.CustomControls;

	/// <summary>
    ///		Summary description for MedicationsWithSchedule2Prostate.
	/// </summary>
    public partial class MedicationsWithSchedule2Prostate : BaseEFormControl
	{

		override protected void Page_Load(object sender, System.EventArgs e)
		{
			base.Page_Load(sender, e);
            BuildProstateMedications(this._patientId, this._eformName, "Dynamic");
            base.SetTitle(ComponentTitle);

		}

        protected void BuildProstateMedications(int PatientID, string FormName, string FormType)
        {

            // set medication object to current patient
			//Medication ptMeds = new Medication();
			//ptMeds.PrimaryKeyName = "PatientId";
			//ptMeds.Get(PatientID);

			DataView ptMedsTableView = BusinessObject.GetByParentAsDataView<Medication>(PatientID);

            // retrieve lookupcode values for specified disease
            DataTable prostateMedsLkpcodes = CacheManager.GetLookupCodeList(Medication_11.LookupCode);
            string prostateMedsList = CreateDelimitedString(prostateMedsLkpcodes,LookupCode.LkpCode,",");
 
            // retrieve current patient medications only for specified lookupcode values
            string filterString = String.Concat(Medication.Medication_Field," IN (",prostateMedsList,")");
            //DataTable prostateMedsDt = FilterTable(ptMeds, filterString);
			DataTable prostateMedsDt = FilterTable(ptMedsTableView.Table, filterString);

            // set medication rows to repeater control
            if (prostateMedsDt.Rows.Count > 0)
            {
                medicationsAllProstate.DataSource = prostateMedsDt.DefaultView;
                medicationsAllProstate.DataBind();
            }
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
                HtmlImage LockImage;
                LockImage = (HtmlImage)e.Item.FindControl("LockImage");
                string medId = rowView["MedicationId"].ToString();

                if (LockImage != null)
                {
                    LockImage.Visible = false;
                }

                if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
                {
                    if (rowView.DataView.Table.Columns.Contains("LockedBy"))
                    {
                        if (rowView["LockedBy"] != null && !string.IsNullOrEmpty(rowView["LockedBy"].ToString()))
                        {
                            if (LockImage != null)
                            {
                                LockImage.Visible = true;
                            }
                        }
                    }

                    if (!(rowView["MedStopDate"] != null && rowView["MedStopDate"].ToString().Length > 0) && !(rowView["MedStopDateText"] != null && rowView["MedStopDateText"].ToString().Length > 0))
                    {
                        CheckBox StopDateCheckbox = (CheckBox)e.Item.FindControl("StopDateCheckbox");
                        if (StopDateCheckbox != null)
                        {
                            StopDateCheckbox.Visible = true;

                            // add ajax callback
                            StopDateCheckbox.Attributes["onclick"] = string.Format("stopMedication(this, '{0}', event);", medId);
                        }
                    }
                }

                // decorate tr
                HtmlTableRow tr = (HtmlTableRow)e.Item.FindControl("_tr_");

                tr.Attributes["onclick"] = "LoadDataEntryForm('Medications'," + medId + ",'MedDateText,MedDate,Medication,MedDose,MedUnits,MedSchedule,MedStopDateText,MedStopDate', 'MedicationsWithSchedule2');";

                // if the stop date < current clinic date, set parentTR.style.display = 'none'

                object objStopDate = rowView["MedStopDate"];
                if (objStopDate != DBNull.Value)
                {
                    DateTime stopDate = DateTime.Parse(objStopDate.ToString());
                    DateTime clinDate = DateTime.Now;

                    if (Session[SessionKey.CurrentClinicDate] != null)
                    {
                        clinDate = DateTime.Parse(Session[SessionKey.CurrentClinicDate].ToString());
                    }

                    if (stopDate < clinDate)
                    {
                        tr.Style["DISPLAY"] = "none";
                    }
                }
            }
        }

        private DataTable FilterTable(DataTable medProsTable, string filterString)
        {   
			//DataRow[] filteredRows = medPros.GetTable().Select(filterString);
			//DataTable filteredDt = medPros.GetTable().Clone();

			DataRow[] filteredRows = medProsTable.Select(filterString);
			DataTable filteredDt = medProsTable.Clone();

            DataRow dr;
            foreach (DataRow oldDr in filteredRows)
            {
                dr = filteredDt.NewRow();
				//for (int i = 0; i < medPros.GetTable().Columns.Count; i++)
				//    dr[medPros.GetTable().Columns[i].ColumnName] = oldDr[medPros.GetTable().Columns[i].ColumnName];
				for (int i = 0; i < medProsTable.Columns.Count; i++)
				    dr[medProsTable.Columns[i].ColumnName] = oldDr[medProsTable.Columns[i].ColumnName];
                filteredDt.Rows.Add(dr);
            }

            return filteredDt;
        }
        

        private String CreateDelimitedString(DataTable dt, string columnName, string delimter)
        {
            string list = "";
            foreach (DataRow dr in dt.Rows)
            {
                list = String.Concat(list,"\'",dr[columnName].ToString(),"\'",delimter);
            }

            if (list.EndsWith(delimter))
            {
                int index = list.LastIndexOf(delimter);
                list = list.Remove(index);
            }
            return list;
        }
	}
}
