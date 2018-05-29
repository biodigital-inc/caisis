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

    using Caisis.BOL;
    using Caisis.UI.Core.Classes;
    using Caisis.UI.Core.Classes.CustomControls;
    //2.0 	using Caisis.UI.Modules.Prostate.PaperForms;
    using Caisis.DataAccess;
    using System.Linq;
    using Caisis.Controller;


    /// <summary>
    ///		Summary description for ProstateHPI.
    /// </summary>
    public partial class ReviewOfSystems_GUFU_v2 : BaseEFormControl
    {

        private RelatedRecordController rc = new RelatedRecordController();
        private PatientDataEntryController pdec = new PatientDataEntryController();


        override protected void Page_Load(object sender, System.EventArgs e)
        {
            base.Page_Load(sender, e);
            BuildPriorToxicities();
            BuildReviewOfSystemsWithBaslineToxicities();
            BuildCTCAELookup();
        }


        protected virtual void BuildPriorToxicities()
        {

            ToxicityDa tDa = new ToxicityDa();
            DataSet tDs = tDa.FormListToxicities(this._patientId, "", "Dynamic", "");  // using no value for eform name to get all prior toxicities


            if (tDs.Tables.Count > 0 && tDs.Tables[0].Rows.Count > 0)
            {

                DataView myView = tDs.Tables[0].DefaultView;
                myView.RowFilter = "(" + BOL.Toxicity.ToxScale + " LIKE '%CTC%') AND (" + BOL.Toxicity.ToxCategory + " <> '' OR " + BOL.Toxicity.ToxName + " <> '') AND (" + BOL.Toxicity.ToxStopDateText + " IS NULL OR " + BOL.Toxicity.ToxStopDateText + " = '')";
                myView.Sort = BOL.Toxicity.ToxDateText + " ASC";

                if (myView.Count > 0)
                {
                    PriorToxicities.DataSource = myView;
                    PriorToxicities.DataBind();
                }



            }
        }



        protected virtual void BuildReviewOfSystemsWithBaslineToxicities()
        {
            ToxicityDa tDa = new ToxicityDa();
            DataSet tDs = tDa.FormListToxicities(this._patientId, this._eformName, "Dynamic", "");

            DataView tDv = tDs.Tables[0].DefaultView;
            tDv.RowFilter = "(" + BOL.Toxicity.ToxScale + " LIKE '%CTC%')";


            if (tDv.Count > 0)
            {
                DataTable SymptomsTable = new DataTable();

                DataColumn Symptoms = new DataColumn();
                Symptoms.ColumnName = "Symptoms";
                Symptoms.DataType = System.Type.GetType("System.String");
                SymptomsTable.Columns.Add(Symptoms);

                DataColumn BaselineGradeLabel = new DataColumn();
                BaselineGradeLabel.ColumnName = "BaselineGradeLabel";
                BaselineGradeLabel.DataType = System.Type.GetType("System.Object");
                SymptomsTable.Columns.Add(BaselineGradeLabel);

                AddSymptomToToxicityList(SymptomsTable, "Fatigue", BaselineGrade_Fatigue);
                AddSymptomToToxicityList(SymptomsTable, "Fever", BaselineGrade_Fever);
                AddSymptomToToxicityList(SymptomsTable, "Anorexia", BaselineGrade_Anorexia);
                AddSymptomToToxicityList(SymptomsTable, "Rash", BaselineGrade_Rash);
                AddSymptomToToxicityList(SymptomsTable, "Oral Mucositis", BaselineGrade_OralMucositis);
                AddSymptomToToxicityList(SymptomsTable, "Dyspnea", BaselineGrade_Dyspnea);
                AddSymptomToToxicityList(SymptomsTable, "Edema", BaselineGrade_Edema);
                AddSymptomToToxicityList(SymptomsTable, "Chest Pain", BaselineGrade_ChestPain);
                AddSymptomToToxicityList(SymptomsTable, "Nausea", BaselineGrade_Nausea);
                AddSymptomToToxicityList(SymptomsTable, "Vomiting", BaselineGrade_Vomiting);
                AddSymptomToToxicityList(SymptomsTable, "Diarrhea", BaselineGrade_Diarrhea);
                AddSymptomToToxicityList(SymptomsTable, "Constipation", BaselineGrade_Constipation);
                AddSymptomToToxicityList(SymptomsTable, "Sensory Neuropathy", BaselineGrade_SensoryNeuropathy);
                AddSymptomToToxicityList(SymptomsTable, "Motor Neuropathy", BaselineGrade_MotorNeuropathy);
                AddSymptomToToxicityList(SymptomsTable, "Urinary Frequency", BaselineGrade_UrinaryFrequency);
                AddSymptomToToxicityList(SymptomsTable, "Hemorrhage - Urinary NOS", BaselineGrade_HemorrhageUrinaryNOS);
                AddSymptomToToxicityList(SymptomsTable, "Pain - Urethra", BaselineGrade_PainUrethra);
                AddSymptomToToxicityList(SymptomsTable, "Incontinence", BaselineGrade_Incontinence);
                AddSymptomToToxicityList(SymptomsTable, "Pain", BaselineGrade_Pain);


                string filterExpression = "(1 = 1) ";

                foreach (DataRow sRow in SymptomsTable.Rows)
                {
                    filterExpression += "AND (ToxName <> '" + sRow["Symptoms"].ToString() + "')";
                    CheckForBaselineToxicity(tDv, sRow["Symptoms"].ToString(), (Label)sRow["BaselineGradeLabel"]);
                }

                //DataView myView = tDs.Tables[0].DefaultView;
                //myView.RowFilter = filterExpression;

                //if (myView.Count > 0)
                //{
                //    OtherBaselineToxicitiesHtmlRow.Visible = true;
                //    OtherBaselineToxicitiesRpt.DataSource = myView;
                //    OtherBaselineToxicitiesRpt.DataBind();
                //}
            }
        }

        protected virtual void AddSymptomToToxicityList(DataTable sTable, string symptomName, Label BaselineGradeLabelControl)
        {
            DataRow sRow = sTable.NewRow();
            sRow["Symptoms"] = symptomName;
            sRow["BaselineGradeLabel"] = BaselineGradeLabelControl;
            sTable.Rows.Add(sRow);
        }

        protected virtual void CheckForBaselineToxicity(DataView BaselineToxicitiesTable, string Symptom, Label BaselineDisplay)
        {
            foreach (DataRowView tRow in BaselineToxicitiesTable)
            {
                if (tRow["ToxName"].ToString().ToUpper().Equals(Symptom.ToUpper()))
                {
                    if (tRow["ToxGrade"].ToString().Length > 0)
                    {
                        BaselineDisplay.Text = "Baseline<br/>Grade " + tRow["ToxGrade"].ToString();
                    }
                }
            }
        }

        protected void ShowROSComments(Object Sender, RepeaterItemEventArgs e)
        {

            HtmlTableRow priorToxCommentsRow;
            priorToxCommentsRow = (HtmlTableRow)e.Item.FindControl("priorToxCommentsRow");

            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                string comments = ((DataRowView)e.Item.DataItem)["ToxNotes"].ToString();
                if (comments.Length > 0) priorToxCommentsRow.Visible = true;

                // RELATED RECORDS (get a list of realted records for this Toxicity)
                EformRelatedRecordWidget relatedWidget = e.Item.FindControl("RelatedRecordWidget") as EformRelatedRecordWidget;
                var relatableTables = relatedWidget.RelatableTables;
                int toxicityId = (int)((DataRowView)e.Item.DataItem)[Toxicity.ToxicityId];
                // get a list of related records restricted to relatable table
                DataView toxicityRelatedRecords = rc.GetRelatedRecordsByTableAndKey(base._patientId, "Toxicities", toxicityId, relatableTables);
                Repeater relatedRptr = e.Item.FindControl("RelatedRptr") as Repeater;
                relatedRptr.DataSource = toxicityRelatedRecords;
                relatedRptr.DataBind();
            }

        }

        /// <summary>
        /// Sets the display label for the related record
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void SetRelatedDisplayLabel(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Label displayLabel = e.Item.FindControl("DisplayLabel") as Label;
                // i.e., Toxicities
                string tableName = ((DataRowView)e.Item.DataItem)[RelatedRecord.SrcTableName].ToString();
                // i.e., ToxicityId
                int tablePriKey = (int)((DataRowView)e.Item.DataItem)[RelatedRecord.SrcPrimaryKey];
                // i.e., ToxName value or empty if no metadata defined
                string tableField = ((DataRowView)e.Item.DataItem)["SrcTableField"].ToString();
                // i.e., ToxDate formatted or empty
                string tableSortField = string.Format("{0:d}", ((DataRowView)e.Item.DataItem)["SrcTableSortField"]);
                // i.e., 0 = unrelated
                string relationStrength = ((DataRowView)e.Item.DataItem)[RelatedRecord.RelationStrength].ToString();
                // i.e. Toxicity
                string tableLabel = pdec.GetTableLabel(tableName);

                // format display text if metadata defined
                string displayValue = !string.IsNullOrEmpty(tableField) ? tableField : "[" + tableLabel + "]" + (!string.IsNullOrEmpty(tableSortField) ? " (" + tableSortField + ")" : "");
                displayLabel.Text = displayValue;
            }
        }


        #region CTCAE

        /// <summary>
        /// Builds a lookup for CTCAE caregories, toxicities and grades
        /// </summary>
        private void BuildCTCAELookup()
        {
            string ctcaeVersion = CTCAEVersion.Value;
            if (!string.IsNullOrEmpty(ctcaeVersion))
            {
                CTCAEDa da = new CTCAEDa();
                var versions = da.GetCTCAETerminlogyVersions().Tables[0].DefaultView;
                // locate version by name
                versions.RowFilter = "AE_Terminology_ShortDesc = '" + PageUtil.EscapeSingleQuotesForSql(ctcaeVersion) + "'";
                if (versions.Count > 0)
                {
                    int termId = (int)versions[0]["AE_TerminologyID"];
                    // get a list of categories, toxicities, and grades by version
                    var dt = da.GetCTCLookup(termId);
                    // get a list of radio button groups on page, verify field names
                    var radioButtonGroup = from rg in CICHelper.GetCaisisInputControls(this).OfType<EformRadioButtonGroup>()
                                           where rg.Table == "Toxicities" && rg.Field1 == "ToxCategory" && rg.Field2 == "ToxName" && rg.Field3 == "ToxScale"
                                           let category = rg.Value1
                                           let tox = rg.Value2
                                           select rg;

                    // get a lookup of grades for each radio button group
                    var radioGroupToCTC = from rg in radioButtonGroup
                                          let rgTox = rg.Value2
                                          let rgCat = rg.Value1
                                          // check if this toxicity and category has grade entries
                                          let foundGrades = from row in dt.AsEnumerable()
                                                            let tox = row["CTC_AE_Toxicity_ShortDesc"].ToString()
                                                            let cat = row["AE_Category_Description"].ToString()
                                                            where tox.Contains(rg.Value2) && cat.Contains(rg.Value1)
                                                            select new
                                                            {
                                                                Grade = Server.HtmlEncode(row["AE_Grade"].ToString()),
                                                                GradeDesc = Server.HtmlEncode(row["AE_Grade_Description"].ToString())
                                                            }
                                          where foundGrades.Count() > 0
                                          select new
                                          {
                                              ToxName = rgTox,
                                              // get normalized client lookup name (only alpha characters)
                                              //ToxNameLookupKey = new String(rgTox.Replace(" ", "").ToCharArray().Where(c => (c >= 'a' || c <= 'z') || (c >= 'A' || c <= 'Z')).ToArray()),
                                              ToxNameLookupKey = rgTox.Replace(" ", "").Replace("-", ""),
                                              ClientId = rg.ClientID,
                                              Grades = foundGrades
                                          };
                    // build outer rptr with tooltip for each radio group
                    CTCAERptr.DataSource = radioGroupToCTC;
                    CTCAERptr.DataBind();

                    // register a list of client ids used for mapping tooltip content
                    var CTC_GRADE_LOOKUP = "var CTC_GRADE_LOOKUP = { " + string.Join(",", radioGroupToCTC.Select(c => "'" + c.ToxNameLookupKey + "': '" + c.ClientId + "'").ToArray()) + "};";
                    Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "CTC_GRADE_LOOKUP", CTC_GRADE_LOOKUP, true);
                }

            }
        }

        /// <summary>
        /// Builds a list of available grades for the specified radio button group values.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void BuildGradeByRadioGroup(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Repeater gradesRptr = e.Item.FindControl("CTCAEGradeRptr") as Repeater;
                var grades = System.Web.UI.DataBinder.Eval(e.Item.DataItem, "Grades");
                gradesRptr.DataSource = grades;
                gradesRptr.DataBind();

            }
        }

        #endregion





    }
}
