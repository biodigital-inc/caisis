namespace Caisis.UI.Modules.Neuro.Eforms
{
    using System;
    using System.Data;
    using System.Data.SqlClient;
    using System.Drawing;
    using System.Web;
    using System.Web.UI.WebControls;
    using System.Web.UI.HtmlControls;

    using Caisis.BOL;
    using Caisis.UI.Core.Classes;
    using Caisis.UI.Core.Classes.CustomControls;
    using Caisis.DataAccess;

    /// <summary>
    ///		Summary description for Neuro Rad Tx
    /// </summary>
    public partial class RadiationTxNeuro : BaseEFormControl
    {
        //string Dtstr;
        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);
            GetRadTx();

            DataView view = BusinessObject.GetByParentAsDataView<Status>(_patientId);
            if (view.Count >= 1)
            {
                for (int i = 0; i < view.Table.Rows.Count;i++)
                {
                    if (view.Table.Rows[i]["Status"].ToString() == "Alive" && view.Table.Rows[i]["StatusDisease"].ToString() == "Brain")
                    {
                        RadTxAbsEvntDt.Value = view.Table.Rows[i]["StatusDateText"].ToString();
                        break;
                    }
                    else
                    {
                        RadTxAbsEvntDt.Value = System.DateTime.Now.ToShortDateString();
                    }
                }
            }
            else
            {
                RadTxAbsEvntDt.Value = System.DateTime.Now.ToShortDateString();
            }
        }

        protected void GetRadTx()
        {
			DataView view = BusinessObject.GetByParentAsDataView<RadiationTherapy>(_patientId);
			if (view.Count >= 1)
            {
                PDFormDiv.Style.Add("display", "block");

				NeuroRadTxRpt.DataSource = view;
                NeuroRadTxRpt.DataBind();
            }
            else
            {
                NoNeuroRadTxMsgTr.Style.Add("display", "block");
            }
        }
    }
}