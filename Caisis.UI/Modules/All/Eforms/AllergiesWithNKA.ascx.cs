namespace Caisis.UI.Modules.All.Eforms
{
	using System;
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

	/// <summary>
    ///		Summary description for AllergiesWithNKA.
	/// </summary>
    public partial class AllergiesWithNKA : BaseEFormControl
	{



		override protected void Page_Load(object sender, System.EventArgs e)
		{
			base.Page_Load(sender, e);
			BuildAllergies(this._patientId, this._eformName, "Dynamic");

//            BuildReadOnlyMeds(this._patientId, this._eformName, "Dynamic");


        }


        protected void AllergyRepeaterOnDataBound(Object Sender, RepeaterItemEventArgs e)
        {
            base.EFormRepeaterOnDataBound(Sender, e);

            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Literal AllergyResponseText = (Literal)e.Item.FindControl("AllergyResponseText");
                string a = "";

                if (((DataRowView)e.Item.DataItem)[BOL.Allergy.AllergyResponse].ToString() != null && ((DataRowView)e.Item.DataItem)[BOL.Allergy.AllergyResponse].ToString().ToUpper() == "OTHER" && ((DataRowView)e.Item.DataItem)[BOL.Allergy.AllergyNotes].ToString() != null && ((DataRowView)e.Item.DataItem)[BOL.Allergy.AllergyNotes].ToString().Length > 0)
                {
                    a = ((DataRowView)e.Item.DataItem)[BOL.Allergy.AllergyNotes].ToString();
                }
                else
                {
                    a = ((DataRowView)e.Item.DataItem)[BOL.Allergy.AllergyResponse].ToString();
                }

                if (a.Length > 0) AllergyResponseText.Text = a;
            }
        }



	}
}
