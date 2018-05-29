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
    ///		Summary description for GastricResectionPastAndNew.
	/// </summary>
    public partial class GastricResectionPastAndNew : BaseEFormControl
	{
        override protected void Page_Load(object sender, System.EventArgs e)
        {
            base.Page_Load(sender, e);

            BuildSurgicalHistory();


        }


        protected void BuildSurgicalHistory()
        {
            ProcedureDa pDa = new ProcedureDa();
            DataSet pDs = pDa.FormGetSpecialRecords(this._patientId, this._eformName, "Dynamic", BOL.Procedure.ProcName, "IN", "'Laparoscopic Total Gastrectomy', 'Total Gastrectomy', 'Laparoscopic Distal Gastrectomy', 'Esophagogastrectomy Total', 'Laparoscopic Proximal Gastrectomy', 'Esophagogastrectomy Proximal', 'Laparoscopic Wedge Resection', 'Robotic Esophagogastrectomy Proximal', 'Other/Bypass', 'Robotic Esophagogastrectomy Total', 'Laparoscopic Esophagogastrectomy Proximal', 'Bypass/Gastrojejunostomy', 'Laparoscopic Esophagogastrectomy Total', 'Exploratory Laparotomy', 'Other Resection', 'Wedge Resection', 'Other surgery/Gastric Cancer', 'Completion Gastrectomy', 'Distal Gastrectomy', 'Proximal Gastrectomy'");














            if (pDs.Tables.Count > 0 && pDs.Tables[0].Rows.Count > 0)
            {
                rptSurgicalHistory.DataSource = pDs.Tables[0].DefaultView;
                rptSurgicalHistory.DataBind();
                //                NoSurgicalHistoryMsgTr.Visible = false;
                SurgicalHistoryMsg.Visible = true;
                NoResectionHistoryMsg.Visible = false;
                ResectionHistoryMsg.Visible = true;
            }


        }




        protected void getLinkedData(Object Sender, RepeaterItemEventArgs e)
        {
            HtmlContainerControl ORDetailsLink = (HtmlContainerControl)e.Item.FindControl("ORDetailsLink");


            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                int ORDetailId = 0;
                if (((DataRowView)e.Item.DataItem)[BOL.Procedure.OperatingRoomDetailId].ToString() != null && int.TryParse(((DataRowView)e.Item.DataItem)[BOL.Procedure.OperatingRoomDetailId].ToString(), out ORDetailId))
                {
                    ORDetailsLink.Visible = true;
                }
                else
                {
                    ORDetailsLink.Visible = false;
                }


                PathologyDa paDa = new PathologyDa();
                DataSet paDs = paDa.FormGetRecords(this._patientId, this._eformName, "Dynamic");
                if (paDs.Tables.Count > 0 && paDs.Tables[0].Rows.Count > 0)
                {
                    DataView paDv = new DataView(paDs.Tables[0]);
                    paDv.RowFilter = BOL.Pathology.ProcedureId + " = " + ((DataRowView)e.Item.DataItem)[BOL.Procedure.ProcedureId].ToString();

                    if (paDv.Count > 0)
                    {
                        Repeater linkedPathologies = (Repeater)e.Item.FindControl("linkedPathologies");
                        linkedPathologies.DataSource = paDv;
                        linkedPathologies.DataBind();
                    }
                }


            }

        }
	}
}
