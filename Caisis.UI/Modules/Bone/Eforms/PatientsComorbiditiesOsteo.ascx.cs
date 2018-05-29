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
    ///		Summary description for PatientsComorbiditiesOsteo.
	/// </summary>
    public partial class PatientsComorbiditiesOsteo : BaseEFormControl
	{



		override protected void Page_Load(object sender, System.EventArgs e)
		{
			base.Page_Load(sender, e);

            string searchFilter = "'Osteoporosis','Fracture','Primary Hyperparathyroidism','Secondary Hyperparathyroidism','Vitamin D Insufficiency','Steriods-induced Osteoporosis','Paget''s Disease'";
            BuildOsteoComorbidities(this._patientId, this._eformName, "Dynamic", Comorbidity.Comorbidity_Field, "IN", searchFilter);
            //BuildComorbidityState();

            base.SetTitle(ComponentTitle);
		}


        protected void BuildOsteoComorbidities(int PatientID, string FormName, string FormType, string searchField, string searchClause, string searchFilter)
		{        
           ComorbidityDa osteoCombDa = new ComorbidityDa();

           DataSet osteoComorbiditiecomorbDs = osteoCombDa.FormGetOsteoRecords(PatientID, FormName, FormType, searchField, searchClause, searchFilter);
		    if (osteoComorbiditiecomorbDs.Tables.Count > 0 && osteoComorbiditiecomorbDs.Tables[0].Rows.Count > 0)
		    {
                osteoComorbidities.DataSource = osteoComorbiditiecomorbDs.Tables[0].DefaultView;
                osteoComorbidities.DataBind();
		    }
        }

        protected void BuildComorbidityState()
        {
            BuildStatusRow(Comorbidity_Osteoporosis.Value, DateLabel_16, ComorbDateText_16, ComorbRow_16, Comorbidity_Osteoporosis, NoteLabel_16, ComorbNotes_16, Delete_16);
            //BuildStatusRow(Comorbidity_Fracture.Value, DateLabel_17, ComorbDateText_17, ComorbRow_17, Comorbidity_Fracture, NoteLabel_17, ComorbNotes_17, Delete_17);
            BuildStatusRow(Comorbidity_PrimaryHyperparathyroidism.Value, DateLabel_18, ComorbDateText_18, ComorbRow_18, Comorbidity_PrimaryHyperparathyroidism, NoteLabel_18, ComorbNotes_18, Delete_18);
            BuildStatusRow(Comorbidity_SecondaryHyperparathyroidism.Value, DateLabel_19, ComorbDateText_19, ComorbRow_19, Comorbidity_SecondaryHyperparathyroidism, NoteLabel_19, ComorbNotes_19, Delete_19);
            BuildStatusRow(Comorbidity_VitaminDInsufficiency.Value, DateLabel_20, ComorbDateText_20, ComorbRow_20, Comorbidity_VitaminDInsufficiency, NoteLabel_20, ComorbNotes_20, Delete_20);
            BuildStatusRow(Comorbidity_SteriodsinducedOsteoporosis.Value, DateLabel_21, ComorbDateText_21, ComorbRow_21, Comorbidity_SteriodsinducedOsteoporosis, NoteLabel_21, ComorbNotes_21, Delete_21);
            BuildStatusRow(Comorbidity_PagetsDisease.Value, DateLabel_22, ComorbDateText_22, ComorbRow_22, Comorbidity_PagetsDisease, NoteLabel_22, ComorbNotes_22, Delete_22);
        }

        protected void BuildStatusRow(string ComorbidityText, Label ComorbDateLabel, EformTextBox ComorbDateText, HtmlTableRow ComorbRow, EformCheckBox CurrentComorbCheckBox, Label ComorbNoteLabel, EformTextBox ComorbNote, EformDeleteIcon ComorbDelete)
        {
            ComorbidityDa comorbDa = new ComorbidityDa();
            DataSet comorbDs = comorbDa.FormGetSpecialRecords(this._patientId, this._eformName, "Dynamic", Comorbidity.Comorbidity_Field, "IN", String.Concat("'",ReadyStringForDB(ComorbidityText),"'"));


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

                    if (value == Comorbidity_Osteoporosis.Value)
                    {
                        ComorbRow_16.Visible = false;
                    }
                    //if (value == Comorbidity_Fracture.Value)
                    //{
                    //    ComorbRow_17.Visible = false;
                    //}
                    if (value == Comorbidity_PrimaryHyperparathyroidism.Value)
                    {
                        ComorbRow_18.Visible = false;
                    }
                    if (value == Comorbidity_SecondaryHyperparathyroidism.Value)
                    {
                        ComorbRow_19.Visible = false;
                    }
                    if (value == Comorbidity_VitaminDInsufficiency.Value)
                    {
                        ComorbRow_20.Visible = false;
                    }
                    if (value == Comorbidity_SteriodsinducedOsteoporosis.Value)
                    {
                        ComorbRow_21.Visible = false;
                    }
                    if (value == Comorbidity_PagetsDisease.Value)
                    {
                        ComorbRow_22.Visible = false;
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
