namespace Caisis.UI.Modules.Gastric.Eforms
{
	using System;
	using System.Data;
	using System.Data.SqlClient;
	using System.Drawing;
	using System.Web;
	using System.Web.UI.WebControls;
	using System.Web.UI.HtmlControls;

	using Caisis.UI.Core.Classes;
	using Caisis.UI.Core.Classes.CustomControls;
	using Caisis.DataAccess;

	/// <summary>
    ///		Summary description for GastricLaparoscopyPath.
	/// </summary>
    public partial class GastricLaparoscopyPath : BaseEFormControl
	{
        override protected void Page_Load(object sender, System.EventArgs e)
        {
            base.Page_Load(sender, e);

            string Surgeon = "";
            if (Session[SessionKey.CurrentListType] != null && Session[SessionKey.CurrentListType].ToString().ToUpper().Equals("CLINIC") && Session[SessionKey.CurrentListCrit].ToString().Length > 0)
            {
                Surgeon = Session[SessionKey.CurrentListCrit].ToString();
            }
            //if (Surgeon.Length > 0 && string.IsNullOrEmpty(OpCaseSurgeon_11.Value))
            //{
            //    if (Surgeon.IndexOf(",") > -1)
            //    {
            //        Surgeon = Surgeon.Remove(Surgeon.IndexOf(","));
            //    }
            //    OpCaseSurgeon_11.Value = Surgeon;
            //}

            
        }
	

	}
}
