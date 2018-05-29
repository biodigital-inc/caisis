namespace Caisis.UI.Modules.Prostate.Eforms
{
    using System;
    using System.Data;
    using System.Configuration;
    using System.Collections;
    using System.Drawing;
    using System.Web;
    using System.Web.Security;
    using System.Web.UI;
    using System.Web.UI.WebControls;
    using System.Web.UI.WebControls.WebParts;
    using System.Web.UI.HtmlControls;

    using Caisis.BOL;
    using Caisis.UI.Core.Classes;
    using Caisis.UI.Core.Classes.CustomControls;
    //2.0 	using Caisis.UI.Modules.Prostate.PaperForms;
    using Caisis.DataAccess;

    /// <summary>
    ///		Summary description for MedicationsClinical.
    /// </summary>
    public partial class BiopsyOfProstateAllergies : BaseEFormControl
    {



        override protected void Page_Load(object sender, System.EventArgs e)
        {
            base.Page_Load(sender, e);
            //BuildAllergies(this._patientId, this._eformName, "Dynamic");
            BuildAllAllergies(this._patientId, this._eformName, "Dynamic");
        }

        protected void BuildAllAllergies(int PatientID, string FormName, string FormType)
        {
            AllergyDa allergyDa = new AllergyDa();
            DataSet allergyDs = allergyDa.FormGetRecords(PatientID, FormName, FormType);

            if (allergyDs.Tables.Count > 0 && allergyDs.Tables[0].Rows.Count > 0)
            {
                allergiesAll.DataSource = allergyDs.Tables[0].DefaultView;
                allergiesAll.DataBind();
            }
        }

       

        protected void DecorateAllergiesAll(object sender, RepeaterItemEventArgs e)
        {
            DataRowView rowView = (DataRowView)e.Item.DataItem;

            if (rowView != null)
            {
                HtmlImage LockImage;
                LockImage = (HtmlImage)e.Item.FindControl("LockImage");
                string allergyId = rowView["AllergyId"].ToString();

                if (LockImage != null)
                {
                    LockImage.Visible = false;
                }

                if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
                {
                    if (rowView.DataView.Table.Columns.Contains("LockedBy"))
                    {
                        if (rowView["LockedBy"] != null && !string.IsNullOrEmpty(rowView["LockedBy"].ToString()))
                        {
                            if (LockImage != null)
                            {
                                LockImage.Visible = true;
                            }
                        }
                    }

                }

                // decorate tr
                HtmlTableRow tr = (HtmlTableRow)e.Item.FindControl("_tr_");

                tr.Attributes["onclick"] = "LoadDataEntryForm('Allergies'," + allergyId + ",'Allergen,AllergyResponse', 'AllergiesClinical');";
               
            }
        }
        

    }
}
