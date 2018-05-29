namespace Caisis.UI.Modules.Prostate.Eforms
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
    ///		Summary description for ProstateSpecimenComorbidities.
    /// </summaryProstateSpecimenComorbidities
    public partial class ProstateSpecimenComorbidities : BaseEFormControl
	{



		override protected void Page_Load(object sender, System.EventArgs e)
		{
			base.Page_Load(sender, e);
            string searchFilter = "'NA'";
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
            BuildStatusRow(Comorbidity_CoronaryArteryDisease.Value, DateLabel_1, ComorbDateText_1, ComorbRow_1, Comorbidity_CoronaryArteryDisease, NoteLabel_1, ComorbNotes_1, Delete_1);
            BuildStatusRow(Comorbidity_MyocardialInfarction.Value, DateLabel_2, ComorbDateText_2, ComorbRow_2, Comorbidity_MyocardialInfarction, NoteLabel_2, ComorbNotes_2, Delete_2);
            BuildStatusRow(Comorbidity_Hypertension.Value, DateLabel_3, ComorbDateText_3, ComorbRow_3, Comorbidity_Hypertension, NoteLabel_3, ComorbNotes_3, Delete_3);
            BuildStatusRow(Comorbidity_CVA.Value, DateLabel_4, ComorbDateText_4, ComorbRow_4, Comorbidity_CVA, NoteLabel_4, ComorbNotes_4, Delete_4);
            BuildStatusRow(Comorbidity_ThromboembolicEventsDVT.Value, DateLabel_5, ComorbDateText_5, ComorbRow_5, Comorbidity_ThromboembolicEventsDVT, NoteLabel_5, ComorbNotes_5, Delete_5);
            BuildStatusRow(Comorbidity_Asthma.Value, DateLabel_6, ComorbDateText_6, ComorbRow_6, Comorbidity_Asthma, NoteLabel_6, ComorbNotes_6, Delete_6);
            BuildStatusRow(Comorbidity_DiabetesIDDM.Value, DateLabel_7, ComorbDateText_7, ComorbRow_7, Comorbidity_DiabetesIDDM, NoteLabel_7, ComorbNotes_7, Delete_7);
            BuildStatusRow(Comorbidity_DiabetesNIDDM.Value, DateLabel_8, ComorbDateText_8, ComorbRow_8, Comorbidity_DiabetesNIDDM, NoteLabel_8, ComorbNotes_8, Delete_8);
            BuildStatusRow(Comorbidity_Hypercholesterolemia.Value, DateLabel_9, ComorbDateText_9, ComorbRow_9, Comorbidity_Hypercholesterolemia, NoteLabel_9, ComorbNotes_9, Delete_9);
            BuildStatusRow(Comorbidity_Depression.Value, DateLabel_10, ComorbDateText_10, ComorbRow_10, Comorbidity_Depression, NoteLabel_10, ComorbNotes_10, Delete_10);
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

                    if (value == Comorbidity_CoronaryArteryDisease.Value)
                    {
                        ComorbRow_1.Visible = false;
                    }
                    if (value == Comorbidity_MyocardialInfarction.Value)
                    {
                        ComorbRow_2.Visible = false;
                    } 
                    if (value == Comorbidity_Hypertension.Value)
                    {
                        ComorbRow_3.Visible = false;
                    } 
                    if (value == Comorbidity_CVA.Value)
                    {
                        ComorbRow_4.Visible = false;
                    } 
                    if (value == Comorbidity_ThromboembolicEventsDVT.Value)
                    {
                        ComorbRow_5.Visible = false;
                    } 
                    if (value == Comorbidity_Asthma.Value)
                    {
                        ComorbRow_6.Visible = false;
                    } 
                    if (value == Comorbidity_DiabetesIDDM.Value)
                    {
                        ComorbRow_7.Visible = false;
                    }
                    if (value == Comorbidity_DiabetesNIDDM.Value)
                    {
                        ComorbRow_8.Visible = false;
                    }
                    if (value == Comorbidity_Hypercholesterolemia.Value)
                    {
                        ComorbRow_9.Visible = false;
                    }
                    if (value == Comorbidity_Depression.Value)
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
