namespace Caisis.UI.Modules.Prostate.Eforms
{
    using System;
    using System.Data;
    using System.Drawing;
    using System.Web;
    using System.Web.UI.WebControls;
    using System.Web.UI.HtmlControls;
    using System.Text;
    using System.Collections;
    using Caisis.BOL;
    using Caisis.UI.Core.Classes;
    using Caisis.DataAccess;

    /// <summary>
    ///		Summary description for UroSexualHPI.
    /// </summary>
    public partial class UroSexualHPI : BaseEFormControl
    {
        override protected void Page_Load(object sender, System.EventArgs e)
        {
            base.Page_Load(sender, e);
            BuildHPI();

            DataSet ds = GetLabTestDataSet(this._patientId);

            if (ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
            {
                BuildOtherLabTests(ds);
            }

            GetMeds();
        }
                
        protected void BuildHPI()
        {
            try
            {
                PatientDa hpiDa = new PatientDa();
                DataSet hpiDs = hpiDa.GetPatientHPIForEForm(this._patientId, 0, 0, 1);

                if (hpiDs.Tables[0].Rows.Count > 0)
                {
                    hpi.DataSource = hpiDs.Tables[0].DefaultView;
                    hpi.DataBind();
                }
                else
                {
                    NoHPIMsg.Visible = true;
                }                

                if (hpiDs.Tables[1].Rows[0]["DxBiopsyId"] != null && hpiDs.Tables[1].Rows[0]["DxBiopsyId"].ToString().Length > 0)
                {
                    hpiBiopsyId = (int)hpiDs.Tables[1].Rows[0]["DxBiopsyId"];
                }
            }
            catch (Exception ex)
            {
                hpi.Visible = false;
                ExceptionHandler.Publish(ex);
            }



            PopulateHPIPreTxPotency();
            BuildHpiProstatectomies(this._patientId, this._eformName, "Dynamic");
            BuildHpiProtocols(this._patientId, this._eformName, "Dynamic");
            BuildHpiBiopsies(this._patientId, this._eformName, "Dynamic", hpiBiopsyId);
            BuildHPINerveStatus();
        }


        protected void SetHpiItem(Object Sender, RepeaterItemEventArgs e)
        {
            Literal HpiRowItems;
            HpiRowItems = (Literal)e.Item.FindControl("HpiRowItems");

            HtmlTableRow HpiRow;
            HpiRow = (HtmlTableRow)e.Item.FindControl("HpiRow");

            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                char[] sep1 = { '|' };

                char[] sep2 = { ',' };

                string[] tableNames = ((DataRowView)e.Item.DataItem)["TableNames"].ToString().Split(sep2);

                string[] primaryKeys = ((DataRowView)e.Item.DataItem)["PrimaryKeys"].ToString().Split(sep2);

                string[] hpiItems = ((DataRowView)e.Item.DataItem)["patientHPIDelimited"].ToString().Split(sep1);

                int numberOfHpiItems = primaryKeys.Length;

                string s = "";


                if (numberOfHpiItems > 0)
                {
                    if (numberOfHpiItems > 1)
                    {

                        HpiRow.Attributes["class"] = "ClinicalEformPopulatedRowNonClickable";
                        HpiRow.Attributes.Remove("onmouseover");
                        HpiRow.Attributes.Remove("onmouseout");

                        for (int i = 0; i < numberOfHpiItems; i++)
                        {
                            try
                            {
                                if (hpiItems[i] != "" && primaryKeys.Length > i && tableNames.Length > i)
                                {
                                    string hpiItem = hpiItems[i].Replace("__", "&nbsp;");


                                    if (primaryKeys[i].Length > 0 && tableNames[i].Length > 0)
                                    {
                                        s += "<span class=\"ClinicalEformPopulatedSpan\" onMouseOver=\"this.className='ClinicalEformHighlightedSpan';\" onMouseOut=\"this.className='ClinicalEformPopulatedSpan';\" onclick=\"LoadDataEntryForm('" + tableNames[i] + "', '" + primaryKeys[i] + "', '');\">" + hpiItem + "&nbsp;</span>&nbsp;&nbsp;&nbsp;";
                                    }
                                    else
                                    {
                                        s += "<span style=\"padding: 2px;\" >" + hpiItem + "&nbsp;</span>&nbsp;&nbsp;&nbsp;";
                                    }
                                }
                            }
                            catch (Exception ex)
                            {
                                s += "<b>error: " + ex.Message + "</b>";
                            }
                        }


                    }
                    else
                    {
                        HpiRow.Attributes.Add("onclick", "LoadDataEntryForm('" + tableNames[0] + "', '" + primaryKeys[0] + "', '');");
                        string hpiItem = hpiItems[0].Replace("__", "&nbsp;");
                        s = hpiItem;
                    }

                    HpiRowItems.Text = s;

                }
            }
        }

        protected void PopulateHPIPreTxPotency()
        {
            SurveyDa potencyDa = new SurveyDa();
            Hashtable ht = potencyDa.FormGetPotencyStatusValues(this._patientId, this._eformName, "Dynamic");

            if (ht["PreTxPot"] != null && ht["PreTxPot"].ToString().Length > 0)
            {
                PreTxPot.Text = ht["PreTxPot"].ToString();
                PreTxPotencyTr.Visible = true;
            }
            else
            {
                PreTxPotencyTr.Visible = false;
            }
        }

        protected virtual void BuildHPINerveStatus()
        {
            ProstatectomyDa pDa = new ProstatectomyDa();
            Hashtable ht = pDa.FormGetNerveStatus(this._patientId, this._eformName, "Dynamic");

            NvbRightTr.Visible = false;
            NvbLeftTr.Visible = false;

            if (ht["NVB_Left"] != null && ht["NVB_Left"].ToString() != "")
            {
                NVB_Left.Text = ht["NVB_Left"].ToString();
                NvbLeftTr.Visible = true;
            }
            if (ht["NVB_Right"] != null && ht["NVB_Right"].ToString() != "")
            {
                NVB_Right.Text = ht["NVB_Right"].ToString();
                NvbRightTr.Visible = true;
            }
        }

        protected void EFormRepeaterOnDataBoundForOther(Object Sender, RepeaterItemEventArgs e)
        {
            HtmlImage LockImage;
            LockImage = (HtmlImage)e.Item.FindControl("OtherLockImage");

            if (LockImage != null)
            {
                LockImage.Visible = false;
            }

            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                DataRowView drv = e.Item.DataItem as DataRowView;

                if (drv != null && drv.DataView.Table.Columns.Contains("LockedBy"))
                {
                    if (drv["LockedBy"] != null && !string.IsNullOrEmpty(drv["LockedBy"].ToString()))
                    {
                        if (LockImage != null)
                        {
                            LockImage.Visible = true;
                        }
                    }
                }
            }
        }

        private void BuildOtherLabTests(DataSet ds)
        {
            BuildRepeater(OtherLabTests, ds, "");
        }

        private void BuildRepeater(Repeater r, DataSet ds, string filter)
        {
            DataView dv = new DataView(ds.Tables[0]);
            dv.RowFilter = filter;

            if (dv.Count > 0)
            {
                r.DataSource = dv;
                r.DataBind();
            }
        }

        private DataSet GetLabTestDataSet(int PatientID)
        {
            LabTestDa da = new LabTestDa();
            return da.GetUroSexualLabs(PatientID, "PSA");
        }

        protected void GetMeds()
        {
            DataView dv = BusinessObject.GetByParentAsDataView<Medication>(_patientId);

            dv.RowFilter = BOL.Medication.MedStopDateText + " IS NULL OR " + BOL.Medication.MedStopDateText + " = ''";



            if (dv.Count > 0)
            {
                medicationsRpt.DataSource = dv;
                medicationsRpt.DataBind();
            }
        }
    }
}