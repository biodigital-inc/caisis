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
    ///		Summary description for ProstateSpecimenAccessionsYear.
    /// </summary
    public partial class ProstateSpecimenAccessionsYear : BaseEFormControl
	{
		override protected void Page_Load(object sender, System.EventArgs e)
		{
			base.Page_Load(sender, e);
            base.SetTitle(ComponentTitle);

            // retrieve the specimen accessoins for this patient
            SpecimenManagerDa smDa = new SpecimenManagerDa();
            DataSet smDs = smDa.GetAccessionsByPatientId(this._patientId);

            PathNumWithAccessDate.Style.Add("display", "none");
            NoAccessionsSPAN.Style.Add("display", "none");

            if (smDs.Tables.Count > 0)
            {
                DataView smDv = new DataView(smDs.Tables[0]);
                smDv.RowFilter = SpecimenAccession.PathologyReferenceNumber + " <> '' AND " + SpecimenAccession.PathologyReferenceNumber + " IS NOT NULL ";

                if (smDv.Count > 0)
                {
                    PathNumWithAccessDate.Style.Add("display", "");

                    //populate specimen drop down list
                    ListItem emptyLi = new ListItem("", "");
                    PathNumWithAccessDate.Items.Add(emptyLi);

                    foreach (DataRowView drv in smDv)
                    {
                        string listItemValue = drv[SpecimenAccession.PathologyReferenceNumber].ToString();
                        string listItemText = String.Empty;
                        if (!String.IsNullOrEmpty(drv[SpecimenAccession.CollectDateText].ToString()))
                            listItemText = String.Concat(drv[SpecimenAccession.PathologyReferenceNumber].ToString(), " [Date:  ", drv[SpecimenAccession.CollectDateText].ToString(), "]");
                        else
                            listItemText = String.Concat(drv[SpecimenAccession.PathologyReferenceNumber].ToString(), " [Date Not Specified]");

                        ListItem li = new ListItem(listItemText, listItemValue);
                        PathNumWithAccessDate.Items.Add(li);
                    }
                    PathNumWithAccessDate.DataBind();
                }
                else
                    NoAccessionsSPAN.Style.Add("display", "");
            }
            else
                NoAccessionsSPAN.Style.Add("display", "");
		}
	}
}
