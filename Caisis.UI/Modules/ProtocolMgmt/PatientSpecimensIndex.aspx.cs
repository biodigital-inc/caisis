using System;
using System.Data;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


using Caisis.BOL;
using Caisis.DataAccess;
using Caisis.UI.Core.Classes;
using Caisis.UI.Core.Classes.CustomControls;

namespace Caisis.UI.Modules.ProtocolMgmt
{
    public partial class PatientSpecimensIndex : PatientSpecimenBasePage
    {
        protected override void Page_Load(object sender, EventArgs e)
        {
            // render <THEAD>
            SpecimensListing.Load += (obj, evt) =>
            {
                if (SpecimensListing.Rows.Count > 0)
                {
                    SpecimensListing.HeaderRow.TableSection = TableRowSection.TableHeader;
                    SpecimensListing.ShowHeader = true;
                    SpecimensListing.UseAccessibleHeader = true;
                }
            };
            // set no record message
            SpecimensListing.DataBound += (obj, evt) =>
                {
                    NoRecordsText.Visible = SpecimensListing.Rows.Count == 0;
                };
            if (!Page.IsPostBack)
            {
                BuildListings(QuerySpecimenType);
            }
            ListingsPanel.Visible = !string.IsNullOrEmpty(QuerySpecimenType);
        }

        protected void SetEditLink(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                int accessionId = (int)DataBinder.Eval(e.Row.DataItem, BOL.SpecimenAccession.SpecimenAccessionId);
                string refNum = DataBinder.Eval(e.Row.DataItem, Specimen.SpecimenReferenceNumber).ToString();
                // determine visit filter
                string rowVisitType = QueryVisitType;
                // All view, determine correct visit, A, B, C...
                if (string.IsNullOrEmpty(QueryVisitType) && !string.IsNullOrEmpty(QuerySpecimenType) && !string.IsNullOrEmpty(refNum))
                {
                    string[] visits = { "A", "B", "C" };
                    foreach (string visit in visits)
                    {
                        // check if the visit type matches specimen ref num
                        string visitSubString = ProtocolMgmtSpecimenController.GetSpecimenReferenceNumber(PatientStudyId, QuerySpecimenType, visit, "");
                        if (refNum.Contains(visitSubString))
                        {
                            rowVisitType = visit;
                            break;
                        }
                    }
                }
                string onclick = "editAccession('" + accessionId + "', '" + rowVisitType + "');";
                e.Row.Attributes["onclick"] = onclick;
            }
        }

        private void BuildListings(string specimenType)
        {
            // generate column
            if (!string.IsNullOrEmpty(specimenType))
            {
                // set display columns
                var columns = QuerySpecimenType == QUERY_TISSUE ? TISSUE_COLUMNS : BLOOD_COLUMNS;
                // set columns based on tissue type
                SpecimensListing.Columns.Clear();
                foreach (var col in columns)
                {
                    string colName = col[0];
                    string colLabel = col[1];
                    string conType = col[2];
                    var bf = new BoundField();
                    bf.DataField = col[0];
                    bf.HeaderText = col[1];
                    bf.DataFormatString = colName.EndsWith("Date") ? "{0:d}" : "{0}";
                    SpecimensListing.Columns.Add(bf);
                }
                int patientId = int.Parse(BaseDecryptedPatientId);
                int ptProtocolId = int.Parse(PatientProtocolId);

                Caisis.DataAccess.SpecimenManagerDa da = new SpecimenManagerDa();
                // optionally filter by specimen types (i.e., Blood, Tissue)
                List<string> types = new List<string>();
                if (!string.IsNullOrEmpty(QuerySpecimenType))
                {
                    types.Add(QuerySpecimenType);
                }
                // get specimens report
                DataView specimens = da.GetSpecimenReport(ptProtocolId, null, types.ToArray()).DefaultView;
                // sort: pri key ???
                specimens.Sort = Specimen.SpecimenId + " ASC";
                // restrict non null status ???
                specimens.RowFilter = Specimen.SpecimenStatus + " IS NOT NULL";

                // filter: checks for specimen num like current filter
                //if (!string.IsNullOrEmpty(QueryVisitType))
                //{
                //    string refNumMatch = base.GetSpecimenReferenceNumber("");
                //    specimens.RowFilter = Specimen.SpecimenReferenceNumber + " LIKE '" + PageUtil.EscapeSingleQuotesForSql(refNumMatch) + "%'";
                //}

                SpecimensListing.DataSource = specimens;
                SpecimensListing.DataBind();

                if (specimens.Count == 0)
                {
                    string message = "There are no";
                    if (!string.IsNullOrEmpty(QuerySpecimenType))
                    {
                        message += " " + QuerySpecimenType + " specimens";
                        if (!string.IsNullOrEmpty(QueryVisitType))
                        {
                            message += " on the selected visit";
                        }
                    }
                    else
                    {
                        message += " specimens";
                    }
                    NoRecordsText.Text = message + ".";
                    NoRecordsText.Visible = true;
                }
                else
                {
                    NoRecordsText.Text = "";
                    NoRecordsText.Visible = false;
                }
            }
            else
            {
                NoRecordsText.Text = "";
                NoRecordsText.Visible = false;
            }
        }
    }
}