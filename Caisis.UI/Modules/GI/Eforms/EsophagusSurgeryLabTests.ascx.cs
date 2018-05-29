namespace Caisis.UI.Modules.GI.Eforms
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
    using System.Linq;


	/// <summary>
    ///		Summary description for EsophagusSurgeryLabTests.
	/// </summary>
    public partial class EsophagusSurgeryLabTests : BaseEFormControl
	{
        private string thirtyDaysText = String.Empty;
        private string endDateText = String.Empty;

        override protected void Page_Load(object sender, System.EventArgs e)
        {
            base.Page_Load(sender, e);
            base.SetTitle(ComponentTitle);

            LabTestDa da = new LabTestDa();
            DataSet ds = da.GetMostRecentDistinctLabTests(this._patientId,1);          

                DataView labDv = new DataView(ds.Tables[0]);
                labDv.Sort = LabTest.LabDate + " ASC,  " + LabTest.LabTest_Field + " ASC ";

                if (labDv.Count > 0)
                {
                    OtherLabTests.DataSource = labDv;
                    OtherLabTests.DataBind();
                }

        }

		protected void EFormRepeaterOnDataBoundForOther(Object Sender, RepeaterItemEventArgs e)
		{
            if (e.Item.ItemType == ListItemType.Header)
            {
            }

			if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem ) 
			{
			}
		}

	}
}
