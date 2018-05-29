namespace Caisis.UI.Modules.Bone.Eforms
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
    ///		Summary description for ComorbiditiesOsteo.
    /// </summaryComorbiditiesOsteo
    public partial class ComorbiditiesOsteo : BaseEFormControl
	{



		override protected void Page_Load(object sender, System.EventArgs e)
		{
			base.Page_Load(sender, e);
            string searchFilter = "'Osteoporosis','Fracture','Primary Hyperparathyroidism','Secondary Hyperparathyroidism','Vitamin D Insufficiency','Steriods-induced Osteoporosis','Paget''s Disease'";
            BuildGeneralComorbidities(this._patientId, this._eformName, "Dynamic", Comorbidity.Comorbidity_Field, " NOT IN ", searchFilter);
            BuildComorbidityState();
            base.SetTitle(ComponentTitle);
		}

        protected void BuildGeneralComorbidities(int PatientID, string FormName, string FormType, string searchField, string searchClause, string searchFilter)
        {
            ComorbidityDa CombDa = new ComorbidityDa();

            DataSet ComorbiditiesDs = CombDa.FormGetNonOsteoRecords(PatientID, FormName, FormType, searchField, searchClause, searchFilter);
            if (ComorbiditiesDs.Tables.Count > 0 && ComorbiditiesDs.Tables[0].Rows.Count > 0)
            {
                genComorbidities.DataSource = ComorbiditiesDs.Tables[0].DefaultView;
                genComorbidities.DataBind();
            }

        }

        protected void BuildComorbidityState()
        {
            BuildStatusRow(Comorbidity_Hypertension.Value, DateLabel_1, ComorbDateText_1, ComorbRow_1, Comorbidity_Hypertension, NoteLabel_1, ComorbNotes_1, Delete_1);
            BuildStatusRow(Comorbidity_Diabetestype2.Value, DateLabel_2, ComorbDateText_2, ComorbRow_2, Comorbidity_Diabetestype2, NoteLabel_2, ComorbNotes_2, Delete_2);
            BuildStatusRow(Comorbidity_CoronaryArteryDisease.Value, DateLabel_3, ComorbDateText_3, ComorbRow_3, Comorbidity_CoronaryArteryDisease, NoteLabel_3, ComorbNotes_3, Delete_3);
            BuildStatusRow(Comorbidity_MyocardialInfarction.Value, DateLabel_4, ComorbDateText_4, ComorbRow_4, Comorbidity_MyocardialInfarction, NoteLabel_4, ComorbNotes_4, Delete_4);
            BuildStatusRow(Comorbidity_AtrialFibrillation.Value, DateLabel_5, ComorbDateText_5, ComorbRow_5, Comorbidity_AtrialFibrillation, NoteLabel_5, ComorbNotes_5, Delete_5);
            BuildStatusRow(Comorbidity_StrokeTransientIschemicAttack.Value, DateLabel_6, ComorbDateText_6, ComorbRow_6, Comorbidity_StrokeTransientIschemicAttack, NoteLabel_6, ComorbNotes_6, Delete_6);
            BuildStatusRow(Comorbidity_ChronicKidneyDisease.Value, DateLabel_7, ComorbDateText_7, ComorbRow_7, Comorbidity_ChronicKidneyDisease, NoteLabel_7, ComorbNotes_7, Delete_7);
            BuildStatusRow(Comorbidity_DeepVeinThrombosisPulmonaryEmbolism.Value, DateLabel_8, ComorbDateText_8, ComorbRow_8, Comorbidity_DeepVeinThrombosisPulmonaryEmbolism, NoteLabel_8, ComorbNotes_8, Delete_8);
            BuildStatusRow(Comorbidity_Hypothyroidism.Value, DateLabel_9, ComorbDateText_9, ComorbRow_9, Comorbidity_Hypothyroidism, NoteLabel_9, ComorbNotes_9, Delete_9);
            BuildStatusRow(Comorbidity_ChronicObstructivePulmonaryDisease.Value, DateLabel_10, ComorbDateText_10, ComorbRow_10, Comorbidity_ChronicObstructivePulmonaryDisease, NoteLabel_10, ComorbNotes_10, Delete_10);
        }

        protected void BuildStatusRow(string ComorbidityText, Label ComorbDateLabel, EformTextBox ComorbDateText, HtmlTableRow ComorbRow, EformCheckBox CurrentComorbCheckBox, Label ComorbNoteLabel, EformTextBox ComorbNote, EformDeleteIcon ComorbDelete)
        {
            ComorbidityDa comorbDa = new ComorbidityDa();
            DataSet comorbDs = comorbDa.FormGetSpecialRecords(this._patientId, this._eformName, "Dynamic", Comorbidity.Comorbidity_Field, "IN", String.Concat("'", ReadyStringForDB(ComorbidityText), "'"));


            if (comorbDs.Tables.Count > 0 && comorbDs.Tables[0].Rows.Count > 0)
            {
                if (comorbDs.Tables[0].Rows[0][Comorbidity.ComorbDateText].ToString().Length > 0)
                {
                    ComorbDateLabel.Text = comorbDs.Tables[0].Rows[0][Comorbidity.ComorbDateText].ToString();
                    ComorbDateText.Visible = false;

                    ComorbNoteLabel.Text = comorbDs.Tables[0].Rows[0][Comorbidity.ComorbNotes].ToString();
                    ComorbNote.Visible = false;

                    CurrentComorbCheckBox.Visible = false;
                    ComorbDelete.Visible = false;

                    ActivatePopulatedStatusRow(ComorbRow, comorbDs.Tables[0].Rows[0][Comorbidity.ComorbidityId].ToString());
                }
                else if (comorbDs.Tables[0].Rows[0][Comorbidity.ComorbDate].ToString().Length > 0)
                {
                    ComorbDateLabel.Text = comorbDs.Tables[0].Rows[0][Comorbidity.ComorbDate].ToString();
                    ComorbDateText.Visible = false;

                    ComorbNoteLabel.Text = comorbDs.Tables[0].Rows[0][Comorbidity.ComorbNotes].ToString();
                    ComorbNote.Visible = false;

                    CurrentComorbCheckBox.Visible = false;
                    ComorbDelete.Visible = false;

                    ActivatePopulatedStatusRow(ComorbRow, comorbDs.Tables[0].Rows[0][Comorbidity.ComorbidityId].ToString());
                }

            }

        }


        protected void ActivatePopulatedStatusRow(HtmlTableRow ComorbRow, string ComorbidityId)
        {
            ComorbRow.Attributes.Add("class", "ClinicalEformPopulatedRow");
            ComorbRow.Attributes.Add("onMouseOver", "this.className='ClinicalEformHighlightedRow';");
            ComorbRow.Attributes.Add("onMouseOut", "this.className='ClinicalEformPopulatedRow';");
            ComorbRow.Attributes.Add("onclick", "LoadDataEntryForm('Comorbidities', " + ComorbidityId + ", 'ComorbDateText,ComorbDate,Comorbidity,ComorbNotes', 'Comorbidities');");
        }


        override protected void EFormRepeaterOnDataBound(Object Sender, RepeaterItemEventArgs e)
        {

            base.EFormRepeaterOnDataBound(Sender, e);

            if ((e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem) && e.Item.DataItem != null)
            {
                if (((DataRowView)e.Item.DataItem)[Comorbidity.Comorbidity_Field].ToString().Length > 0)
                {
                    string value = ((DataRowView)e.Item.DataItem)[Comorbidity.Comorbidity_Field].ToString();

                    if (value.Trim() == Comorbidity_Hypertension.Value.Trim())
                    {
                        ComorbRow_1.Visible = false;
                    }
                    if (value.Trim() == Comorbidity_Diabetestype2.Value.Trim())
                    {
                        ComorbRow_2.Visible = false;
                    }
                    if (value.Trim() == Comorbidity_CoronaryArteryDisease.Value.Trim())
                    {
                        ComorbRow_3.Visible = false;
                    }
                    if (value.Trim() == Comorbidity_MyocardialInfarction.Value.Trim())
                    {
                        ComorbRow_4.Visible = false;
                    }
                    if (value.Trim() == Comorbidity_AtrialFibrillation.Value.Trim())
                    {
                        ComorbRow_5.Visible = false;
                    }
                    if (value.Trim() == Comorbidity_StrokeTransientIschemicAttack.Value.Trim())
                    {
                        ComorbRow_6.Visible = false;
                    }
                    if (value.Trim() == Comorbidity_ChronicKidneyDisease.Value.Trim())
                    {
                        ComorbRow_7.Visible = false;
                    }
                    if (value.Trim() == Comorbidity_DeepVeinThrombosisPulmonaryEmbolism.Value.Trim())
                    {
                        ComorbRow_8.Visible = false;
                    }
                    if (value.Trim() == Comorbidity_Hypothyroidism.Value.Trim())
                    {
                        ComorbRow_9.Visible = false;
                    }
                    if (value.Trim() == Comorbidity_ChronicObstructivePulmonaryDisease.Value.Trim())
                    {
                        ComorbRow_10.Visible = false;
                    }

                }

            }
        }

        public string ReadyStringForDB(string text)
        {
            // if the string contains an apostrophe
            if (text.Contains("'"))
            {
                text = text.Replace("'", "''");
            }

            return text;
        }


    }
}
