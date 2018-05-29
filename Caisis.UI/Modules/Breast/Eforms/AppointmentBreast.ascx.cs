namespace Caisis.UI.Modules.Breast.Eforms
{
    using System;
    using System.Data;
    using System.Drawing;
    using System.Web;
    using System.Web.UI.WebControls;
    using System.Web.UI.HtmlControls;

    using Caisis.BOL;
    using Caisis.UI.Core.Classes;
    using Caisis.DataAccess;
    using Caisis.UI.Core.Classes.CustomControls;

    /// <summary>
    ///		Summary description for Surgery FU Appointments
    /// </summary>
    public partial class AppointmentBreast : BaseEFormControl
    {
        protected static int NumHpiRowsAllowed = 10;

        override protected void Page_Load(object sender, System.EventArgs e)
        {
            base.Page_Load(sender, e);

            BuildHPI();

            //populating clinic date and clinician
            if (Session[SessionKey.CurrentClinicDate] != null)
            {
                string s = Session[SessionKey.CurrentClinicDate].ToString();

                if ((!string.IsNullOrEmpty(s)) && string.IsNullOrEmpty(EncDateText_1.Value))
                {
                    EncDateText_1.Value = s;
                    EncDate_1.Value = DateTime.Parse(s).ToShortDateString();
                }
            }

            string Physician = "";
            if (Session[SessionKey.CurrentListType] != null && Session[SessionKey.CurrentListType].ToString().ToUpper().Equals("CLINIC") && Session[SessionKey.CurrentListCrit].ToString().Length > 0)
            {
                Physician = Session[SessionKey.CurrentListCrit].ToString();
            }
            if (Physician.Length > 0 && string.IsNullOrEmpty(EncPhysician_1.Value))
            {
                if (Physician.IndexOf(",") > -1)
                {
                    Physician = Physician.Remove(Physician.IndexOf(","));
                }
                EncPhysician_1.Value = Physician;
            }

            //populating existing referring MDs
            BuildReferringMD();
        }

        protected void BuildHPI()
        {
            if (_patientId != 0)
            {
                try
                {
                    PatientDa hpiDa = new PatientDa();
                    DataSet hpiDs = hpiDa.GetPatientHPIBreast(this._patientId);

                    if (hpiDs.Tables[0].Rows.Count > 0)
                    {
                        DataColumn VarOrderNumCol = new DataColumn("VarOrderNum", typeof(System.Int32));
                        hpiDs.Tables[0].Columns.Add(VarOrderNumCol);

                        DataColumn IsAppendedRowCol = new DataColumn("RowType", typeof(System.String));
                        hpiDs.Tables[0].Columns.Add(IsAppendedRowCol);

                        for (int i = 0; i < hpiDs.Tables[0].Rows.Count; i++)
                        {
                            hpiDs.Tables[0].Rows[i]["VarOrderNum"] = i;
                            hpiDs.Tables[0].Rows[i]["RowType"] = "normal";
                        }

                        int currentRowId = 0;
                        for (int k = 0; k < hpiDs.Tables[0].Rows.Count; k++)
                        {
                            currentRowId = Convert.ToInt16(hpiDs.Tables[0].Rows[k]["RowId"]);
                            for (int j = 0; j < hpiDs.Tables[0].Rows.Count; j++)
                            {
                                if (j != k && hpiDs.Tables[0].Rows[j]["RelatedRowId"].Equals(currentRowId))
                                {
                                    hpiDs.Tables[0].Rows[j]["VarOrderNum"] = hpiDs.Tables[0].Rows[k]["VarOrderNum"];
                                    hpiDs.Tables[0].Rows[j]["RowType"] = "multi";
                                    hpiDs.Tables[0].Rows[k]["RowType"] = "start multi";
                                }
                            }

                        }


                        DataView hpiDv = hpiDs.Tables[0].DefaultView;
                        hpiDv.Sort = "VarOrderNum ASC, RowId ASC";

                        hpi.DataSource = hpiDv;
                        hpi.DataBind();

                    }
                
                
                }
                catch (Exception ex)
                {
                    hpi.Visible = false;
                    ExceptionHandler.Publish(ex);
                }
            }
        }


        protected void hpiItemDataBound(Object Sender, RepeaterItemEventArgs e)
        {
            Literal hpiStartNormalRow = (Literal)e.Item.FindControl("hpiStartNormalRow");
            Literal hpiStartMultiRow = (Literal)e.Item.FindControl("hpiStartMultiRow");
            Literal hpiDate = (Literal)e.Item.FindControl("hpiDate");


            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                if (((DataRowView)e.Item.DataItem)["RowType"].ToString() == "normal")
                {
                    hpiStartNormalRow.Visible = true;
                    hpiDate.Text = ((DataRowView)e.Item.DataItem)["VarDate"].ToString() + "&nbsp;&nbsp;";
                }
                else if (((DataRowView)e.Item.DataItem)["RowType"].ToString() == "start multi")
                {
                    hpiStartMultiRow.Visible = true;
                    hpiDate.Text = ((DataRowView)e.Item.DataItem)["VarDate"].ToString() + "&nbsp;&nbsp;";
                }
                else
                {
                    
                }
            }
        }

        protected void BuildReferringMD()
        {
            if (_patientId != 0)
            {

                PatientPhysicianDa rmdDa = new PatientPhysicianDa();
                DataSet rmdDs = rmdDa.FormGetReferringMDs(_patientId, _eformName, "Dynamic");
                if (rmdDs.Tables.Count > 0 && !rmdDs.Tables[0].Rows.Count.Equals(0))
                {
                    ReferringMD.DataSource = rmdDs.Tables[0].DefaultView;
                    ReferringMD.DataBind();
                    blankReferrringMD.Visible = false;
                }
                else
                {
                    blankReferrringMD.Text = "(" + CaisisConfiguration.GetWebConfigValue("institutionShortName") + ")<img src=\"../../images/shim.gif\" border=\"0\" width=\"200\" height=\"1\">Non-" + CaisisConfiguration.GetWebConfigValue("institutionShortName") + ": ";
                }
            }
            else
            {
                blankReferrringMD.Text = "(" + CaisisConfiguration.GetWebConfigValue("institutionShortName") + ")<img src=\"../../images/shim.gif\" border=\"0\" width=\"200\" height=\"1\">Non-" + CaisisConfiguration.GetWebConfigValue("institutionShortName") + ": ";
            }
        }
    }
}