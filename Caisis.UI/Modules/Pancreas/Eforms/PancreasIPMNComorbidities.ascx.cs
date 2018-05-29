namespace Caisis.UI.Modules.Pancreas.Eforms
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

    public partial class PancreasIPMNComorbidities : BaseEFormControl
    {
        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);
            base.SetTitle(ComponentTitle);
        }





        override protected void BuildComorbidities(int PatientID, string FormName, string FormType)
        {

            ComorbidityDa comorbiditiesDa = new ComorbidityDa();
            DataSet comorbiditiesDs = comorbiditiesDa.FormGetRecords(PatientID, FormName, FormType);
            if (comorbiditiesDs.Tables.Count > 0 && comorbiditiesDs.Tables[0].Rows.Count > 0)
            {
                comorbidities.DataSource = comorbiditiesDs.Tables[0].DefaultView;
                comorbidities.DataBind();



                DataTable ComorbidityListTable = new DataTable();

                DataColumn Comorbidity = new DataColumn();
                Comorbidity.ColumnName = "Comorbidity";
                Comorbidity.DataType = System.Type.GetType("System.String");
                ComorbidityListTable.Columns.Add(Comorbidity);

                DataColumn ComorbidityHtmlRow = new DataColumn();
                ComorbidityHtmlRow.ColumnName = "ComorbidityHtmlRow";
                ComorbidityHtmlRow.DataType = System.Type.GetType("System.Object");
                ComorbidityListTable.Columns.Add(ComorbidityHtmlRow);

                AddComorbidityToListTable(ComorbidityListTable, "Coronary Artery Disease", ComorbidityRow_CoronaryArteryDisease);
                AddComorbidityToListTable(ComorbidityListTable, "Hypertension", ComorbidityRow_Hypertension);
                AddComorbidityToListTable(ComorbidityListTable, "Diabetes", ComorbidityRow_Diabetes);
                AddComorbidityToListTable(ComorbidityListTable, "Chronic Obstructive Pulmonary Disease", ComorbidityRow_COPD);
                AddComorbidityToListTable(ComorbidityListTable, "Hypercholesterolemia", ComorbidityRow_Hypercholesterolemia);
                AddComorbidityToListTable(ComorbidityListTable, "Hyperlipidemia", ComorbidityRow_Hyperlipidemia);

                foreach (DataRow cRow in ComorbidityListTable.Rows)
                {
                    CheckForMatchingComorbidity(comorbiditiesDs.Tables[0], cRow["Comorbidity"].ToString(), (HtmlTableRow)cRow["ComorbidityHtmlRow"]);
                }
            }




        }

        protected virtual void AddComorbidityToListTable(DataTable cTable, string comorbidityName, HtmlTableRow ComorbidityHtmlRow)
        {
            DataRow cRow = cTable.NewRow();
            cRow["Comorbidity"] = comorbidityName;
            cRow["ComorbidityHtmlRow"] = ComorbidityHtmlRow;
            cTable.Rows.Add(cRow);
        }


        protected virtual void CheckForMatchingComorbidity(DataTable ComorbiditiesTable, string comorbidityName, HtmlTableRow ComorbidityHtmlRow)
        {
            foreach (DataRow cRow in ComorbiditiesTable.Rows)
            {
                if (cRow[BOL.Comorbidity.Comorbidity_Field].ToString().ToUpper().Equals(comorbidityName.ToUpper()))
                {
                    ComorbidityHtmlRow.Visible = false;
                }
            }
        }





    }
}

