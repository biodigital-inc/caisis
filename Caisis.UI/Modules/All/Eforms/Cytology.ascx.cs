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
    //2.0 	using Caisis.UI.Modules.Prostate.PaperForms;
	using Caisis.DataAccess;

	/// <summary>
    ///		Summary description for Cytology.
	/// </summary>
    public partial class Cytology : BaseEFormControl
	{


		override protected void Page_Load(object sender, System.EventArgs e)
		{
            base.Page_Load(sender, e);
            this.BuildCytolgy();
 //           base.SetTitle(ComponentTitle);
		}



        protected virtual void BuildCytolgy()
        {
            PathologyDa cytologyDa = new PathologyDa();
            DataSet cytologyDs = cytologyDa.FormGetRecords(this._patientId, this._eformName.Replace(" ", ""), "Dynamic");

            if (cytologyDs.Tables.Count > 0 && cytologyDs.Tables[0].Rows.Count > 0)
            {
                DataView cytologyDv = new DataView(cytologyDs.Tables[0]);
                cytologyDv.RowFilter = "PathSpecimenType = 'Cytology'";

                if (cytologyDv.Count > 0)
                {
                    Cytolgy.DataSource = cytologyDv;
                    Cytolgy.DataBind();
                }

            }



        }


	}
}
