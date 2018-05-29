namespace Caisis.UI.Modules.All.Eforms
{
    using System;
    using System.Data;
    using System.Drawing;
    using System.Web;
    using System.Web.UI.WebControls;
    using System.Web.UI.HtmlControls;

    using Caisis.UI.Core;

    using Caisis.BOL;

    using Caisis.UI.Core.Classes;

    using Caisis.DataAccess;
    using Caisis.UI.Core.Classes.CustomControls;




	/// <summary>
	///		Summary description for MedicationsClinical.
	/// </summary>
	public partial class MedicationsClinical : BaseEFormControl
	{

        protected override void Page_Load(object sender, System.EventArgs e)
        {
            base.Page_Load(sender, e);

            BuildAllMedications(this._patientId, this._eformName, "Dynamic");

            /*
            object o_phy = Session[SessionKey.CurrentListCrit];
			object o_dt = Session[SessionKey.CurrentClinicDate];
			object o_mrn = Session[SessionKey.PtMRN];
            if (o_phy != null && o_dt != null && o_mrn != null)
            {
                EFormController EC = new EFormController();
                DataTable ApptTable = EC.ValidateSessionAppointmentData(o_mrn, o_phy, o_dt);


                if (ApptTable.Rows.Count > 0) // if row is returned, clinic date is correct;
                {


                    string SurgeryDate = o_dt.ToString();
                    if (SurgeryDate.Length > 0)
                    {
                        SetHiddenDateFieldPair(MedDateText_1, MedDate_1, SurgeryDate);
                        SetHiddenDateFieldPair(MedDateText_2, MedDate_2, SurgeryDate);
                        SetHiddenDateFieldPair(MedDateText_3, MedDate_3, SurgeryDate);
                        SetHiddenDateFieldPair(MedDateText_4, MedDate_4, SurgeryDate);
                        SetHiddenDateFieldPair(MedDateText_5, MedDate_5, SurgeryDate);
                        SetHiddenDateFieldPair(MedDateText_6, MedDate_6, SurgeryDate);
                        SetHiddenDateFieldPair(MedDateText_7, MedDate_7, SurgeryDate);
                        SetHiddenDateFieldPair(MedDateText_8, MedDate_8, SurgeryDate);
                        SetHiddenDateFieldPair(MedDateText_9, MedDate_9, SurgeryDate);
                        SetHiddenDateFieldPair(MedDateText_10, MedDate_10, SurgeryDate);
                        SetHiddenDateFieldPair(MedDateText_11, MedDate_11, SurgeryDate);
                        SetHiddenDateFieldPair(MedDateText_12, MedDate_12, SurgeryDate);
                        SetHiddenDateFieldPair(MedDateText_13, MedDate_13, SurgeryDate);
                        SetHiddenDateFieldPair(MedDateText_14, MedDate_14, SurgeryDate);
                        SetHiddenDateFieldPair(MedDateText_15, MedDate_15, SurgeryDate);
                        SetHiddenDateFieldPair(MedDateText_16, MedDate_16, SurgeryDate);
                        SetHiddenDateFieldPair(MedDateText_17, MedDate_17, SurgeryDate);
                        SetHiddenDateFieldPair(MedDateText_18, MedDate_18, SurgeryDate);
                        SetHiddenDateFieldPair(MedDateText_19, MedDate_19, SurgeryDate);
                        SetHiddenDateFieldPair(MedDateText_20, MedDate_20, SurgeryDate);
                    }

                }

            }*/

        }










		protected void BuildAllMedications(int PatientID, string FormName, string FormType)
		{
			MedicationDa medDa = new MedicationDa();
			DataSet medDs = medDa.FormGetRecords(PatientID, FormName, FormType, null);
				
			if (medDs.Tables.Count > 0 && medDs.Tables[0].Rows.Count > 0)
			{
				medicationsAll.DataSource = medDs.Tables[0].DefaultView;
				medicationsAll.DataBind();
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
			DataRowView rowView = (DataRowView) e.Item.DataItem;

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

					//if(!(rowView["LockedBy"] != null && rowView["LockedBy"].ToString().Length > 0))
					//{
					//    if (LockImage != null)
					//    {
					//        LockImage.Visible = false;
					//    }
					//}
                  
                    if(!(rowView["MedStopDate"] != null && rowView["MedStopDate"].ToString().Length > 0) && !(rowView["MedStopDateText"] != null && rowView["MedStopDateText"].ToString().Length > 0))
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
                
                tr.Attributes["onclick"] = "LoadDataEntryForm('Medications'," + medId + ",'MedDateText,MedDate,Medication,MedDose,MedUnits,MedSchedule,MedStopDateText,MedStopDate', 'MedicationsClinical');";

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





	}
}
