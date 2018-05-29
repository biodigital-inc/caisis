namespace Caisis.UI.Modules.All.Eforms
{
    using System;
    using System.Data;
    using System.Drawing;
    using System.Web;
    using System.Web.UI.WebControls;
    using System.Web.UI.HtmlControls;

    using Caisis.UI.Core;

    using Caisis.BOL;

    using Caisis.UI.Core.Classes;

    using Caisis.DataAccess;
    using Caisis.UI.Core.Classes.CustomControls;



    /// <summary>
    ///		Summary description for Anesthesia.
    /// </summary>
    public partial class ProceduresShortForm : BaseEFormControl
	{



        protected override void OnInit(EventArgs e)
        {
            base.OnInit(e);
            disableEformHiddenControls = true;
        }

		override protected void Page_Load(object sender, System.EventArgs e)
		{	

			base.Page_Load(sender, e);
			

			
			BuildJSArray();


            string SurgeryDate = "";
            if (Session[SessionKey.CurrentClinicDate] != null) SurgeryDate = Session[SessionKey.CurrentClinicDate].ToString();
            if (SurgeryDate.Length > 0)
            {
                SetHiddenDateFieldPair(ProcDateText_1, ProcDate_1, SurgeryDate);
            }

		}


		protected void BuildJSArray()
		{
			ProcedureSurgeonsJSArray.Text = "procedureSurgeonsArray[0] = ['', '" + OpSurgeon.ClientID + "'];";
            ProcedureSurgeonsJSArray.Text += "procedureSurgeonsArray[1] = ['" + OpName_2.ClientID + "', '" + OpSurgeon_2.ClientID + "'];";
            ProcedureSurgeonsJSArray.Text += "procedureSurgeonsArray[2] = ['" + OpName_3.ClientID + "', '" + OpSurgeon_3.ClientID + "'];";
			ProcedureSurgeonsJSArray.Text += "procedureSurgeonsArray[3] = ['" + OpName_4.ClientID + "', '" + OpSurgeon_4.ClientID + "'];";
			ProcedureSurgeonsJSArray.Text += "procedureSurgeonsArray[4] = ['" + OpName_5.ClientID + "', '" + OpSurgeon_5.ClientID + "'];";
			ProcedureSurgeonsJSArray.Text += "procedureSurgeonsArray[5] = ['" + OpName_6.ClientID + "', '" + OpSurgeon_6.ClientID + "'];";
			ProcedureSurgeonsJSArray.Text += "procedureSurgeonsArray[6] = ['" + OpName_7.ClientID + "', '" + OpSurgeon_7.ClientID + "'];";
			ProcedureSurgeonsJSArray.Text += "procedureSurgeonsArray[7] = ['" + OpName_8.ClientID + "', '" + OpSurgeon_8.ClientID + "'];";
            ProcedureSurgeonsJSArray.Text += "procedureSurgeonsArray[8] = ['" + OpName_9.ClientID + "', '" + OpSurgeon_9.ClientID + "'];";
            ProcedureSurgeonsJSArray.Text += "procedureSurgeonsArray[9] = ['" + OpName_10.ClientID + "', '" + OpSurgeon_10.ClientID + "'];";
        }




	}
}
