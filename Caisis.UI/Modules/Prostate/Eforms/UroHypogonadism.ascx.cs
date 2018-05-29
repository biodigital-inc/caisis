namespace Caisis.UI.Modules.Prostate.Eforms
{
    using System;
    using System.Data;
    using System.Data.SqlClient;
    using System.Drawing;
    using System.Web;
    using System.Web.UI.WebControls;
    using System.Web.UI.HtmlControls;

    using Caisis.BOL;
    using Caisis.UI.Core.Classes;
    using Caisis.UI.Core.Classes.CustomControls;
    using Caisis.DataAccess;

    using System.Collections.Generic;

    /// <summary>
    ///		Summary description for UroHypogonadism
    /// </summary>
    public partial class UroHypogonadism : BaseEFormControl
    {
        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);
            BuildHypogonadism();
        }




        protected void BuildHypogonadism()
        {
                DataTable HypogonadismTable = this.HypogonadismTable();


                // Lab Tests
                LabTestDa lDa = new LabTestDa();
                List<List<string>> HypogonadismLabs = HypogonadismLabKey();
                List<string> HypogonadismLabValues = new List<string>();

                foreach (List<string> l in HypogonadismLabs)
                {
                    HypogonadismLabValues.AddRange(l);
                }

                DataSet lDs = lDa.GetLabTestsbyList(this._patientId, HypogonadismLabValues.ToArray());

                if (lDs != null && lDs.Tables.Count > 0 && lDs.Tables[0].Rows.Count > 0)
                {
                    foreach (DataRow hRow in lDs.Tables[0].Rows)
                    {
                        foreach (List<string> l in HypogonadismLabs)
                        {
                            //                     if (hRow[BOL.LabTest.LabTest_Field].ToString().ToUpper() == l[0].ToUpper())
                            if (l.Contains(hRow[BOL.LabTest.LabTest_Field].ToString().ToUpper()))
                            {
                                HypogonadismTable = AddValueToHypogonadismTable(HypogonadismTable, hRow[BOL.LabTest.LabDateText].ToString(), l[0], hRow[BOL.LabTest.LabResult].ToString(), (int)hRow[BOL.LabTest.LabTestId]);
                                break;
                            }
                        }
                    }
                }


                // Medications
                MedicationDa mDa = new MedicationDa();
                List<string> HypogonadismMedications = HypogonadismMedicationKey();

                DataSet mDs = mDa.FormGetRecords(this._patientId, "", "Dynamic", "");

                if (mDs != null && mDs.Tables.Count > 0 && mDs.Tables[0].Rows.Count > 0)
                {
                    foreach (DataRow mRow in mDs.Tables[0].Rows)
                    {
                        foreach (string m in HypogonadismMedications)
                        {
                            if (mRow[BOL.Medication.Medication_Field].ToString().ToUpper() == m.ToUpper())
                            {
                                string medValue = mRow[BOL.Medication.Medication_Field].ToString();
                                //                                if (mRow[BOL.Medication.MedDose].ToString().Length > 0) medValue += (" (" + mRow[BOL.Medication.MedDose].ToString() + mRow[BOL.Medication.MedUnits].ToString() + ")");
                                HypogonadismTable = AddValueToHypogonadismTable(HypogonadismTable, mRow[BOL.Medication.MedDateText].ToString(), "Medication", medValue, (int)mRow[BOL.Medication.MedicationId]);
                                HypogonadismTable = AddValueToHypogonadismTable(HypogonadismTable, mRow[BOL.Medication.MedDateText].ToString(), "MedDose", mRow[BOL.Medication.MedDose].ToString());
                                HypogonadismTable = AddValueToHypogonadismTable(HypogonadismTable, mRow[BOL.Medication.MedDateText].ToString(), "MedUnits", mRow[BOL.Medication.MedUnits].ToString());
                                break;
                            }
                        }
                    }
                }



                if (HypogonadismTable.Rows.Count > 0)
                {
                    foreach (DataRow hRow in HypogonadismTable.Rows)
                    {
                        if (hRow["DateText"].ToString().Length > 0)
                        {
                            DateTime dt;
                            if (DateTime.TryParse(hRow["DateText"].ToString(), out dt))
                            {
                                hRow["Date"] = dt;
                            }

                        }
                    }

                    int maxRowsToShowOnForm = 8;

                    if (HypogonadismTable.Rows.Count > maxRowsToShowOnForm)
                    {
                        int numRecordsToDelete = HypogonadismTable.Rows.Count - maxRowsToShowOnForm;
                        DataView hgv = HypogonadismTable.DefaultView;
                        hgv.Sort = "Date ASC";
                        DataTable hgt = hgv.ToTable();

                        for (int i = 0; i < numRecordsToDelete; i++)
                        {
                            hgt.Rows[0].Delete();
                        }

                        DataView hgv2 = hgt.DefaultView;
                        hgv2.Sort = "Date ASC";
                        FillHypogonadism(hgv2);

                    }
                    else
                    {
                        DataView hv = HypogonadismTable.DefaultView;
                        hv.Sort = "Date ASC";
                        FillHypogonadism(hv);
                    }
                }

        }

        protected void FillHypogonadism(DataView dv)
        {
            Hypogonadism.DataSource = dv;
            Hypogonadism.DataBind();
        }








    }
}