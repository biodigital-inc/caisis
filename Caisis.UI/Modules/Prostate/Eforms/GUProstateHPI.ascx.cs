namespace Caisis.UI.Modules.Prostate.Eforms
{
	using System;
    using System.Collections;
    using System.Collections.Generic;
	using System.Data;
	using System.Drawing;
	using System.Web;
	using System.Web.UI.WebControls;
	using System.Web.UI.HtmlControls;
	using System.Text;
    using System.Linq;


	using Caisis.BOL;
	using Caisis.UI.Core.Classes;
    //2.0 using Caisis.UI.Modules.Prostate.PaperForms;
	using Caisis.DataAccess;
    using Caisis.Controller;

	/// <summary>
    ///		Summary description for GUProstateHPI.
	/// </summary>
    public partial class GUProstateHPI : BaseEFormControl
	{

        private System.Web.UI.HtmlTextWriter _htmlWriter;
        private StringBuilder _htmlSB;

        protected string CurrentTreatmentTdId = "";

        private List<EFormHPITreatment> HpiTreatments = new List<EFormHPITreatment>();

        private string[] GnRHTreatments = new string[4]{"LUPRON", "ZOLADEX", "GOSERELIN", "ZOLADEX (GOSERELIN)"};
        private string[] BisphosphonateTreatments = new string[4] {"PAMIDRONATE", "ZOLEDRONIC ACID", "ZOMETA", "ZOLEDRONIC ACID (ZOMETA)" };


        private string[] StopDateTables = new string[] 
        { 
            //new BOL.Medication().TableName,
            new BOL.MedicalTherapy().TableName, 
            //new BOL.RadiationTherapy().TableName,  
            //new BOL.BrachyTherapy().TableName
        };

        private IDictionary<string, KeyValuePair<string, string>> CreateChildAdminTables = new Dictionary<string,KeyValuePair<string,string>>
        { 
            { new MedicalTherapy().TableName, new KeyValuePair<string, string>(new MedTxAdministration().TableName, MedTxAdministration.MedTxAdminStartDate) },
 //           { new RadiationTherapy().TableName, new KeyValuePair<string, string>(new RadTxAdministration().TableName, RadTxAdministration.RadTxAdminStartDate) },
        };


        private PatientDataEntryController pdec = new PatientDataEntryController();



		override protected void Page_Load(object sender, System.EventArgs e)
		{
			base.Page_Load(sender, e);
			BuildHPI();

        }

        protected void BuildHPI()
        {
                InitContentBuffer();

                PatientDa hpiDa = new PatientDa();
                DataSet hpiDs;

                hpiDs = hpiDa.GetPatientHPIProstateGU(this._patientId, 1);

                if (hpiDs.Tables[0].Rows.Count > 0)
                {
                    DataTable ExpandedHpiDT = ExpandedHpi(hpiDs.Tables[0]);
                    hpi.DataSource = ExpandedHpiDT.DefaultView;
                    hpi.DataBind();


                }
                else
                {
                    NoHPIMsg.Visible = true;
                }


        }

        protected DataTable ExpandedHpi(DataTable HpiDt)
        {
            HpiDt.Columns.Add("LastAdminDate");
            HpiDt.Columns.Add("SpecialTreatmentStatus");
            HpiDt.Columns.Add("SpecialProcStatus");

            foreach (DataRow dr in HpiDt.Rows)
            {

                // eventually move a lot of the processing in SetHpiItem to here, a lot of this is copied from there for now

                    char[] sep2 = { ',' };

                    string[] tableNames = dr["TableNames"].ToString().Split(sep2);

                    string[] primaryKeys = dr["PrimaryKeys"].ToString().Split(sep2);

                    int numberOfHpiItems = primaryKeys.Length;

                    string s = "";


                    if (numberOfHpiItems == 1)  // treatments have only one row at this time
                    {
                        
                        if (tableNames[0].Length > 0)
                        {
                            if (CreateChildAdminTables.ContainsKey(tableNames[0]))
                            {
                                string parentTable = tableNames[0];
                                string childTable = CreateChildAdminTables[parentTable].Key;
                                string childTableDateField = CreateChildAdminTables[parentTable].Value;
                                int parentKey = int.Parse(primaryKeys[0]);

                                DataView childView = BOL.BusinessObject.GetByParentAsDataView(childTable, parentKey);
                                childView.Sort = childTableDateField + " ASC";
                                DateTime parseDate;
                                if (childView.Count > 0 && DateTime.TryParse(childView[childView.Count - 1][childTableDateField].ToString(), out parseDate))
                                {
                                    dr["LastAdminDate"] = parseDate.ToShortDateString();
                                }

                            }

                        }
                    }
            }

            bool lastBisphosphonateFound = false;
            bool lastGnRHFound = false;
            bool currentTreatmentFound = false;
            bool lastCystoFound = false;
            
            for (int i = HpiDt.Rows.Count-1; i>-1; i--)
            {

                bool ongoing = true;
                // check if there are stop dates
                if (HpiDt.Rows[i]["StopDateText"].ToString().Length > 0) ongoing = false;

                if (HpiDt.Rows[i]["TableNames"].ToString().ToUpper().IndexOf("MEDICALTHERAPY") > -1 && ongoing)
                {
                    // mark last GnRH
                    if (!lastGnRHFound && (HpiDt.Rows[i]["Filters"].ToString().ToUpper().IndexOf("LHRH") > -1 || HpiDt.Rows[i]["Filters"].ToString().ToUpper().IndexOf("GNRH") > -1))
                    {
                        lastGnRHFound = true;
                        HpiDt.Rows[i]["SpecialTreatmentStatus"] = "LastGnRH";

                        if (LastGnRHDateText.Value.Length < 1 && LastGnRHAgent.Value.Length < 1)
                        {
                            DateTime dt;
                            if (DateTime.TryParse(HpiDt.Rows[i]["LastAdminDate"].ToString(), out dt)) LastGnRHDateText.Value = dt.ToShortDateString();
                            LastGnRHAgent.Value = HpiDt.Rows[i]["patientHPI"].ToString().Substring(HpiDt.Rows[i]["patientHPI"].ToString().IndexOf(" ") + 1);
                        }
                    }
                    // mark last BISPHOSPHONATE
                    if (!lastBisphosphonateFound && HpiDt.Rows[i]["Filters"].ToString().ToUpper().IndexOf("BISPHOSPHONATE") > -1)
                    {
                        lastBisphosphonateFound = true;
                        HpiDt.Rows[i]["SpecialTreatmentStatus"] = "LastBisphosphonate";

                        if (LastBisphosphonateDateText.Value.Length < 1 && LastBisphosphonateAgent.Value.Length < 1)
                        {
                            DateTime db;
                            if (DateTime.TryParse(HpiDt.Rows[i]["LastAdminDate"].ToString(), out db)) LastBisphosphonateDateText.Value = db.ToShortDateString();
                            LastBisphosphonateAgent.Value = HpiDt.Rows[i]["patientHPI"].ToString().Substring(HpiDt.Rows[i]["patientHPI"].ToString().IndexOf(" ") + 1);
                        }
                    }
                    // mark current (last) treatment
                    if (!currentTreatmentFound && !HpiDt.Rows[i]["Filters"].ToString().ToUpper().Contains("BISPHOSPHONATE") && !HpiDt.Rows[i]["Filters"].ToString().ToUpper().Contains("GNRH") && !HpiDt.Rows[i]["Filters"].ToString().ToUpper().Contains("LHRH"))
                    {
                        currentTreatmentFound = true;
                        HpiDt.Rows[i]["SpecialTreatmentStatus"] = "CurrentTreatment";

                        if (CurrentMedTx_DateText.Value.Length < 1 && CurrentMedTx_Agent.Value.Length < 1)
                        {
                            DateTime d;
                            if (DateTime.TryParse(HpiDt.Rows[i]["SortDate"].ToString(), out d)) CurrentMedTx_DateText.Value = d.ToShortDateString();
                            CurrentMedTx_Agent.Value = HpiDt.Rows[i]["patientHPI"].ToString().Substring(HpiDt.Rows[i]["patientHPI"].ToString().IndexOf(" ") + 1);
                        }

                    }
                }
                else if (!lastCystoFound && HpiDt.Rows[i]["Filters"].ToString().ToUpper().Contains("CYSTOPROC"))
                {
                    lastCystoFound = true;
                    HpiDt.Rows[i]["SpecialProcStatus"] = "LastCysto";
                }

            }


            return HpiDt;
        }

        protected void SetHpiItem(Object Sender, RepeaterItemEventArgs e)
		{
			
			Literal HpiRowItems;
			HpiRowItems = (Literal) e.Item.FindControl("HpiRowItems");

			HtmlTableRow HpiRow;
			HpiRow = (HtmlTableRow) e.Item.FindControl("HpiRow");

            HtmlTableCell HpiCell;
            HpiCell = (HtmlTableCell)e.Item.FindControl("HpiCell");

            //HtmlTableCell PopulatedDateDisplay;
            //PopulatedDateDisplay = (HtmlTableCell)e.Item.FindControl("PopulatedDateDisplay");


            //HtmlTableCell SpecialTreatmentOptionsTd = (HtmlTableCell) e.Item.FindControl("SpecialTreatmentOptionsTd");
            Caisis.UI.Modules.All.Eforms.TreatmentOptions SpecialTreatmentOptions = e.Item.FindControl("SpecialTreatmentOptions") as Caisis.UI.Modules.All.Eforms.TreatmentOptions;

            HtmlInputHidden PopulatedDate = (HtmlInputHidden)e.Item.FindControl("PopulatedDate");
            HtmlInputHidden ProcType = (HtmlInputHidden)e.Item.FindControl("ProcType");
            
            
            DateTime popDate;
            

			if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
			{
                string hpiString = ((DataRowView)e.Item.DataItem)["patientHPI"].ToString();
                string hpiLeadString = hpiString;
                if (hpiLeadString.Length > 10) hpiLeadString = hpiLeadString.Remove(10);
                int hpiStringSpaceIndex = hpiString.IndexOf(" ");

                string sortDate = ((DataRowView)e.Item.DataItem)["SortDate"].ToString();

                if (sortDate.Length > 0)
                {
                    DateTime sortDateTime;
                    if (DateTime.TryParse(sortDate, out sortDateTime))
                    { PopulatedDate.Value = sortDateTime.ToString("MM/dd/yyyy"); }
                    else { PopulatedDate.Value = sortDate; }
                }
                else if (hpiStringSpaceIndex > -1 && DateTime.TryParse(hpiString.Remove(hpiStringSpaceIndex), out popDate))
                {
                    PopulatedDate.Value = popDate.ToString("MM/dd/yyyy");
                }
                else if (DateTime.TryParse(hpiLeadString, out popDate))
                {
                    PopulatedDate.Value = popDate.ToString("MM/dd/yyyy");
                    //PopulatedDateDisplay.InnerHtml = popDate.ToShortDateString();
                    //PopulatedDateDisplay.Visible = true;
                }


                try
                {
                    ProcType.Value = ((DataRowView)e.Item.DataItem)["Filters"].ToString();
                }
                catch (Exception ex)
                {}


                try
                {
                    char[] sep1 = { '|' };

                    char[] sep2 = { ',' };

                    string[] tableNames = ((DataRowView)e.Item.DataItem)["TableNames"].ToString().Split(sep2);

                    string[] primaryKeys = ((DataRowView)e.Item.DataItem)["PrimaryKeys"].ToString().Split(sep2);

                    string[] qualities = ((DataRowView)e.Item.DataItem)["Qualities"].ToString().Split(sep2);

                    string[] hpiItems = ((DataRowView)e.Item.DataItem)["patientHPIDelimited"].ToString().Split(sep1);

                    int numberOfHpiItems = primaryKeys.Length;

                    string s = "";


                    if (numberOfHpiItems > 0)
                    {
                        if (numberOfHpiItems > 1)
                        {
                            HpiCell.Attributes.Add("style", "background-image: none; filter: none; background-color: #dddddd; cursor: default;");


                            for (int i = 0; i < numberOfHpiItems; i++)
                            {
                                try
                                {
                                    if (hpiItems[i] != "" && primaryKeys.Length > i && tableNames.Length > i)
                                    {
                                        string hpiItem = hpiItems[i].Replace("__", "");


                                        if (primaryKeys[i].Length > 0 && tableNames[i].Length > 0)
                                        {
                                            int priKey;
                                            bool priKeyIsInt = Int32.TryParse(primaryKeys[i], out priKey);

                                            if (priKeyIsInt)
                                            {

                                                string tdClassName = "hpiDBMultiRecordInnerCell";

                                                if (tableNames[i] == "MedicalTherapy") tdClassName += " HpiCurrentTreatment";

                                                string qualityString = "None";
                                                if (qualities[i].Length > 0 && qualities[i] != "NO_DQ") qualityString = qualities[i];

                                                string recordDetails = RecordDetails(tableNames[i], primaryKeys[i]);

                                               

//                                                s += "<td title=\"Table: " + tableNames[i] + ".  \nData Quality: " + qualityString + ".  \nClick to view/edit.\" class=\"" + tdClassName + "\" onmouseover=\"showHPIRecordData('" + tableNames[i] + "', '" + primaryKeys[i] + "', true, this);\"  onmouseout=\"showHPIRecordData('" + tableNames[i] + "', '" + primaryKeys[i] + "', false, this);\" onclick=\"LoadDataEntryForm('" + tableNames[i] + "', '" + primaryKeys[i] + "', '');\">" + hpiItem + recordDetails + " </td>";
                                                s += "<td class=\"" + tdClassName + "\" onmouseover=\"showHPIRecordData('" + tableNames[i] + "', '" + primaryKeys[i] + "', true, this);\"  onmouseout=\"showHPIRecordData('" + tableNames[i] + "', '" + primaryKeys[i] + "', false, this);\" onclick=\"LoadDataEntryForm('" + tableNames[i] + "', '" + primaryKeys[i] + "', '');\">" + hpiItem + recordDetails + " </td>";
                                            }
                                        }
                                        else
                                        {
                                            s += "<td class=\"hpiDBMultiRecordInnerCell\" >" + hpiItem + " </td>";
                                        }
                                    }

                                }
                                catch (Exception ex)
                                {
                                    s += "<td><strong>error: " + ex.Message + "</strong></td>";
                                }
                            }


                        }
                        else
                        {
                            if (tableNames[0].Length > 0)
                            {
                                HpiRow.Attributes.Add("onclick", "LoadDataEntryForm('" + tableNames[0] + "', '" + primaryKeys[0] + "', '');");
                                HpiRow.Attributes.Add("onmouseover", "showHPIRecordData('" + tableNames[0] + "', '" + primaryKeys[0] + "', true, this);");
                                HpiRow.Attributes.Add("onmouseout", "showHPIRecordData('" + tableNames[0] + "', '" + primaryKeys[0] + "', false, this);");


                                string recordDetails = RecordDetails(tableNames[0], primaryKeys[0]);


                                string qualityString = "None";
                                if (qualities[0].Length > 0 && qualities[0] != "NO_DQ") qualityString = qualities[0];

                        //        HpiRow.Attributes.Add("title", "Table: " + tableNames[0] + ".  \nData Quality: " + qualityString + ".  \nClick to view/edit.");

                                bool ongoing = true;
                                // check if there are stop dates
                                if (((DataRowView)e.Item.DataItem)["StopDateText"].ToString().Length > 0) ongoing = false;

                                //string hpiItem = hpiItems[0].Replace("__", "");
                                string hpiItem = ((DataRowView)e.Item.DataItem)["PatientHPI"].ToString();




                                string tdId = "";
                                string TdTagString = "<td";
                                if (CreateChildAdminTables.ContainsKey(tableNames[0]))
                                {

                                    tdId += "treatmentTd_" + e.Item.ItemIndex.ToString();


                                    string parentTable = tableNames[0];
                                    string childTable = CreateChildAdminTables[parentTable].Key;
                                    string childTableDateField = CreateChildAdminTables[parentTable].Value;
                                    int parentKey = int.Parse(primaryKeys[0]);

                                    s = TdTagString + ">" + hpiItem + recordDetails + " </td>";

                                    if (ongoing)
                                    {
                                        SpecialTreatmentOptions.Visible = true;
                                        SpecialTreatmentOptions.BuildCreateChildRecord(parentTable, int.Parse(primaryKeys[0]), childTable, childTableDateField, ongoing);
                                    }

                                }
                                else
                                {
                                    s = TdTagString + ">" + hpiString + recordDetails + " </td>";
                                }
                                if (StopDateTables.Contains(tableNames[0]))
                                {
                                    // check if there are stop dates
                                    if (ongoing)
                                    {
                                        string table = tableNames[0];
                                        string key = primaryKeys[0];

                                        SpecialTreatmentOptions.Visible = true;
                                        SpecialTreatmentOptions.BuildStopDate(table, key);
                                    }
                                }

                                string SpecialTreatmentStatus = ((DataRowView)e.Item.DataItem)["SpecialTreatmentStatus"].ToString();
                                if (SpecialTreatmentStatus.Length > 0) HpiCell.Attributes["class"] = SpecialTreatmentStatus;

                            }
                            else
                            {
                                s = "<td style=\"background-image: none; filter: none; background-color: #e7e7e7; cursor: default; border-bottom: none;\"  onmouseover=\"showHPIBubbleMsg('Further details about this item are not available.', true, this);\"  onmouseout=\"showHPIBubbleMsg('', false, this);\"  >" + hpiString + " </td>";
                                HpiCell.Attributes.Add("style", "background-image: none; filter: none; background-color: #e7e7e7; cursor: default;");
//                                HpiRow.Attributes.Add("title", "Further details about this item are not available.");
                            }

                        }

                        HpiRowItems.Text = s;

                    }
                }
                catch (Exception ex)
                {
                    HpiRowItems.Text = "<td>" + hpiString + "</td>";
                }


                try
                {
                    string filter = ((DataRowView)e.Item.DataItem)["Filters"].ToString();
                    if (filter.Length > 0 
                        && filter.ToUpper().IndexOf("PROSTATEPROC") < 0 
                        && filter.ToUpper().IndexOf("MEDTXTYPE") < 0 
                        && filter.ToUpper().IndexOf("CYSTOPROC") < 0)
                    { HpiRow.Attributes["class"] += " nonProstateProc"; HpiRow.Style["display"] = "none"; }
                    if (filter.Length > 0 
                        && filter.ToUpper().IndexOf("CYSTOPROC") > -1 
                        && !((DataRowView)e.Item.DataItem)["SpecialProcStatus"].ToString().ToUpper().Contains("LASTCYSTO"))
                    { HpiRow.Attributes["class"] += " oldCysto"; HpiRow.Style["display"] = "none"; }
                }
                catch (Exception ex)
                { }


			}	
		}


        protected string RecordDetails(string tableName, string primaryKey)
        {
            string recordDetails = "";

            if (BOL.BusinessObjectFactory.CanBuildBusinessObject(tableName))
            {

                IBusinessObject biz = BusinessObjectFactory.BuildBusinessObject(tableName);
                biz.Get(int.Parse(primaryKey));

                string tableDisplayName = (biz.TableLabel.Length > 0) ? biz.TableLabel : tableName;

                Dictionary<string, string> HPIRecordDataEntryFields = new Dictionary<string, string>();
                HPIRecordDataEntryFields = CICHelper.GetCaisisInputControlsByTableName(tableName).ToDictionary(i => i.Field, i => pdec.GetFieldLabel(i.Table, i.Field));

                if (HPIRecordDataEntryFields.Keys.Count > 0)
                {
                    recordDetails = "<span id=\"HPIRecordDetailsBubbleContent_" + tableName + "_" + primaryKey + "\" class=\"HPIRecordDetailsBubbleContent\"><table><tr><td colspan=\"2\" class=\"HPIRecordDetailsBubbleTitle\" >" + tableDisplayName + "</td>";
                    foreach (string fieldName in HPIRecordDataEntryFields.Keys)
                    {
                        string fieldLabel = HPIRecordDataEntryFields[fieldName];
                        string fieldValue = biz[fieldName].ToString();

                        if (fieldValue.Length > 0) recordDetails += "<tr><td>" + fieldLabel + "</td><td>" + fieldValue + "</td></tr>";
                    }
                    recordDetails += "</table></span>";
                }

            }

            return recordDetails;
                                                
        }



        //protected void SetCurrentTreatment(object sender, System.EventArgs e)
        //{

        //    bool lastBisphosphonateFound = false;
        //    bool lastGnRHFound = false;
        //    bool currentTreatmentFound = false;

        //    if (HpiTreatments.Count > 0)
        //    {
        //        if (HpiTreatments.Count > 1)
        //        {
        //            HpiTreatments.Sort(delegate(EFormHPITreatment t1, EFormHPITreatment t2)
        //              {
        //                  return t1.LastAdminDate.CompareTo(t2.LastAdminDate);
        //              });
        //            HpiTreatments.Reverse();
        //        }



        //        foreach (EFormHPITreatment t in HpiTreatments)
        //        {
        //            if (!lastGnRHFound && LastGnRHDateText.Value.Length < 1 && LastGnRHAgent.Value.Length < 1)
        //            {
        //                string lastGnRH = IsOfTreatmentType(GnRHTreatments, t.TreatmentHPIString);
        //                if (lastGnRH.Length > 0)
        //                {
        //                    lastGnRHFound = true;
        //                    LastGnRHDateText.Value = t.LastAdminDate.ToString("MM/dd/yyyy");
        //                    LastGnRHAgent.Value = lastGnRH;
        //                }
        //            }
        //            if (!lastBisphosphonateFound && LastBisphosphonateDateText.Value.Length < 1 && LastBisphosphonateAgent.Value.Length < 1)
        //            {
        //                string lastBisphosphonate = IsOfTreatmentType(BisphosphonateTreatments, t.TreatmentHPIString);
        //                if (lastBisphosphonate.Length > 0)
        //                {
        //                    lastBisphosphonateFound = true;
        //                    LastBisphosphonateDateText.Value = t.LastAdminDate.ToString("MM/dd/yyyy");
        //                    LastBisphosphonateAgent.Value = lastBisphosphonate;
        //                }
        //            }
        //            if (!currentTreatmentFound)
        //            {
        //                string lastGnRH = IsOfTreatmentType(GnRHTreatments, t.TreatmentHPIString);
        //                string lastBisphosphonate = IsOfTreatmentType(BisphosphonateTreatments, t.TreatmentHPIString);

        //                if (lastGnRH.Length < 1 && lastBisphosphonate.Length < 1 && CurrentMedTx_DateText.Value.Length < 1 && CurrentMedTx_Agent.Value.Length < 1)
        //                {
        //                    currentTreatmentFound = true;

        //                    DateTime popDate;
        //                    string hpiString = t.TreatmentHPIString;
        //                    char[] sep = { ' ' };
        //                    string[] hpiPieces = t.TreatmentHPIString.Split(sep);

        //                    string hpiLeadString = hpiString;
        //                    string hpiEndString = "";
        //                    if (hpiLeadString.Length > 10) { hpiLeadString = hpiLeadString.Remove(10); hpiEndString = hpiString.Remove(0, 10); }


        //                    if (hpiPieces.Length > 1 && hpiPieces[1].Length > 0 && DateTime.TryParse(hpiPieces[0], out popDate))
        //                    {
        //                        List<string> tmp = new List<string>(hpiPieces);
        //                        tmp.RemoveAt(0);
        //                        hpiPieces = tmp.ToArray();

        //                        string agentDisplay = String.Join(" ", hpiPieces);
        //                        if (!agentDisplay.StartsWith("-"))
        //                        {
        //                            CurrentMedTx_Agent.Value = agentDisplay;
        //                            CurrentMedTx_DateText.Value = t.LastAdminDate.ToString("MM/dd/yyyy");
        //                            CurrentTreatmentTdId = t.TreatmentTdId;
        //                            currentTx.Text = CurrentTreatmentTdId;
        //                            currentTxDate.Text = t.LastAdminDate.ToString("MM/dd/yyyy");

        //                        }
                                
        //                    }
        //                    else if (DateTime.TryParse(hpiLeadString, out popDate))
        //                    {
        //                        if (!hpiEndString.StartsWith("-"))
        //                        {
        //                            CurrentMedTx_Agent.Value = hpiEndString;
        //                            CurrentMedTx_DateText.Value = t.LastAdminDate.ToString("MM/dd/yyyy");
        //                            CurrentTreatmentTdId = t.TreatmentTdId;
        //                            currentTx.Text = CurrentTreatmentTdId;
        //                            currentTxDate.Text = t.LastAdminDate.ToString("MM/dd/yyyy");
        //                        }
        //                    }


        //                }
        //            }
        //        }

        //    }

        //    if (LastBisphosphonateAgent.Value.Length < 1 && LastBisphosphonateDateText.Value.Length < 1) LastBisphosphonateAgent.Value = "Not Applicable";
        //    if (LastGnRHAgent.Value.Length < 1 && LastGnRHDateText.Value.Length < 1) LastGnRHAgent.Value = "Not Applicable";
        //    if (CurrentMedTx_Agent.Value.Length < 1 && CurrentMedTx_DateText.Value.Length < 1) CurrentMedTx_Agent.Value = "Not Applicable";

        //}

        protected string IsOfTreatmentType(string[] treatmentListForSpecifiedType, string treatmentHPIString)
        {
            string treatmentOfSpecifiedType = "";

            foreach (string t in treatmentListForSpecifiedType)
            {
                if (treatmentHPIString.ToUpper().Contains(t)) treatmentOfSpecifiedType = t;
            }

            return treatmentOfSpecifiedType;

        }

        private void InitContentBuffer()
        {
            _htmlSB = new StringBuilder();
            System.IO.StringWriter tw = new System.IO.StringWriter(_htmlSB);
            _htmlWriter = new System.Web.UI.HtmlTextWriter(tw);
        }

	}

    public class EFormHPITreatment
    {
      public string TreatmentTdId;
      public DateTime LastAdminDate;
      public string TreatmentHPIString;

      public EFormHPITreatment(string TreatmentTdId, DateTime LastAdminDate, string TreatmentHPIString)
      {
          this.TreatmentTdId = TreatmentTdId;
          this.LastAdminDate = LastAdminDate;
          this.TreatmentHPIString = TreatmentHPIString;
      }
    }

    

}
