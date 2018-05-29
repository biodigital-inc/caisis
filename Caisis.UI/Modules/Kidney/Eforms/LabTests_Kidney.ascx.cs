namespace Caisis.UI.Modules.Kidney.Eforms
{
	using System;
	using System.Data;
	using System.Drawing;
	using System.Web;
	using System.Web.UI.WebControls;
	using System.Web.UI.HtmlControls;

	using Caisis.BOL;
	using Caisis.UI.Core.Classes;
    //2.0 	using Caisis.UI.Modules.Prostate.PaperForms;
	using Caisis.DataAccess;

	/// <summary>
	///		Summary description for MedicationsClinical.
	/// </summary>
    public partial class LabTests_Kidney : BaseEFormControl
	{


		override protected void Page_Load(object sender, System.EventArgs e)
		{
            base.Page_Load(sender, e);
            base.SetTitle(ComponentTitle);
            DataRow Nephrectomy = PatientNephrectomy(this._patientId, this._eformName, "Dynamic");
            BuildLabTestsKidney(Nephrectomy);
            addGFRParams();
		}

        protected void BuildLabTestsKidney(DataRow Nephrectomy)
        {
            if (Nephrectomy != null && Nephrectomy[BOL.Procedure.ProcDate] != null)
            {
                DateTime NephDate;
                if (DateTime.TryParse(Nephrectomy[BOL.Procedure.ProcDate].ToString(), out NephDate))
                {
                    BuildLabTestsKidney(NephDate);
                }
                else
                {
                    BuildLabTestsKidney(DateTime.MinValue);
                }
            }
            else
            {
                BuildLabTestsKidney(DateTime.MinValue);
            }

        }


        protected void BuildLabTestsKidney(DateTime NephrectomyDate)
        {
                LabTestDa da = new LabTestDa();

                string[] l = { "CREAT" };
                DataSet ds = da.GetLabTestsbyList(this._patientId, l);

                if (ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                {
                    DataTable dt = ds.Tables[0];

                    DataColumn LastBeforeNeph = new DataColumn();
                    LastBeforeNeph.ColumnName = "LastBeforeNeph";
                    LastBeforeNeph.DataType = System.Type.GetType("System.Boolean");
                    LastBeforeNeph.DefaultValue = false;
                    dt.Columns.Add(LastBeforeNeph);

                    // highlight pre-op creat
                    if (NephrectomyDate != null && NephrectomyDate != DateTime.MinValue)
                    {
                        for (int i = 0; i < dt.Rows.Count; i++)
                        {
                            if (dt.Rows[i][BOL.LabTest.LabDate] != null && dt.Rows[i][BOL.LabTest.LabDate].ToString().Length > 0 && (DateTime)dt.Rows[i][BOL.LabTest.LabDate] <= NephrectomyDate)
                            {
                                if ((i == (dt.Rows.Count - 1)) || (DateTime)dt.Rows[i + 1][BOL.LabTest.LabDate] > NephrectomyDate || (DateTime)dt.Rows[i][BOL.LabTest.LabDate] == NephrectomyDate)
                                {
                                    dt.Rows[i]["LastBeforeNeph"] = true;
                                }
                            }
                        }
                    }


                    DataView labDv = new DataView(dt);
                    labDv.RowFilter = "(" + BOL.LabTest.LabDate + " > #" + DateTime.Today.AddMonths(-3) + "# AND " + BOL.LabTest.LabDate + " >= #" + NephrectomyDate.ToShortDateString() + "#) OR LastBeforeNeph = true";

                    if (labDv.Count > 0)
                    {
                        DataView labRptDv = KidneyLabsWithGFR(this._patientId, labDv);
                        labTests.DataSource = labRptDv;
                        labTests.DataBind();
                    }

                }


        }



        protected void addGFRParams()
        {
            bool AgeOK = false;
            bool GenderOK = false;
            bool RaceOK = false;

            IBusinessObject biz = BusinessObjectFactory.BuildBusinessObject("Patients");
            biz.Get(this._patientId);
            string ptGender = biz[BOL.Patient.PtGender].ToString();
            string ptRace = biz[BOL.Patient.PtRace].ToString();
            int ptAge = 0;

            DateTime ptBirthDate;
            if (DateTime.TryParse(biz[BOL.Patient.PtBirthDate].ToString(), out ptBirthDate))
            {
                ptAge = Convert.ToInt32(Math.Floor(((DateTime.Now - ptBirthDate).TotalDays) / (365.242222)));
                AgeOK = true;
            }

            double k = 0;
            double a = 0;


            if (ptGender.ToUpper() == "MALE") { k = 0.9; a = -0.411; GenderOK = true; }
            else if (ptGender.ToUpper() == "FEMALE") { k = 0.7; a = -0.329; GenderOK = true; }

            if (ptRace.Length > 0) { RaceOK = true; }

            if (GenderOK && RaceOK && AgeOK)
            {
                gfr_calcOK.Text = "true";
                gfr_k.Text = k.ToString();
                gfr_a.Text = a.ToString();
                gfr_age.Text = ptAge.ToString();
                gfr_genderMod.Text = ptGender.ToUpper() == "FEMALE" ? "1.018" : "1";
                gfr_raceMod.Text = ptRace.ToUpper().Contains("BLACK") ? "1.159" : "1";
            }
            else
            {
                gfr_calcOK.Text = "false";
                gfr_k.Text = "0";
                gfr_a.Text = "0";
                gfr_age.Text = "0";
                gfr_genderMod.Text = "0";
                gfr_raceMod.Text = "0";
            }

        }

	}
}
