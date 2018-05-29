using System;
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Text.RegularExpressions;

using Caisis.UI.Core.Classes;
using Caisis.UI.Core.Classes.CustomControls;
using Caisis.BOL;
using Caisis.DataAccess;

namespace Caisis.UI.Modules.SpecimenMgmt
{
    public partial class AddSpecimenEvents : SpecimenMgmtDataEntryPage
    {
        private int specimenId = 0;
        private string _identifierType = CaisisConfiguration.GetWebConfigValue("SpecimenModuleDefaultId");
        Specimen CurrentSpecimen;
        SpecimenManagerDa da = new SpecimenManagerDa();
        // TODO: 
        // 1) should use all CaisisInputControls and BizO's to get/set data
        // 2) set lookup code values properly

        override protected void Page_Load(object sender, System.EventArgs e)
        {
            base.Page_Load(sender, e);

            specimenId = Convert.ToInt32(Request.QueryString["specimenId"]);

            // Set Parent Specimen
            CurrentSpecimen = new Specimen();
            CurrentSpecimen.Get(specimenId);

            BindSpecimenEventsGrid();
        }

        private void BindSpecimenEventsGrid()
        {
			//SpecimenEvents se = new SpecimenEvents();
			//se.GetByParent(specimenId);

			DataView view = BusinessObject.GetByParentAsDataView<SpecimenEvents>(specimenId);

			//this.SpecimenEventsGridView.DataSource = se.DataSourceView;
			this.SpecimenEventsGridView.DataSource = view;
            this.SpecimenEventsGridView.DataBind();

			//this.totalSpecimenEvents.Text = se.RecordCount.ToString() + " Specimen Event(s)";
			this.totalSpecimenEvents.Text = view.Count.ToString() + " Specimen Event(s)";

            //getting SpecimenReferencNumber
            string datasetSql = CacheManager.GetDatasetSQL(Session[SessionKey.DatasetId]);
            DataTable dt = da.GetIdentifier(this.specimenId, _identifierType, datasetSql);
            string refnum = dt.Rows[0].ItemArray[3].ToString();
            this.refNumber.Text = "Processing Events for Specimen : " + refnum.ToString();

        }

        /// <summary>
        /// Set Value for CaisisSelect controls in the GridView
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void SetFieldValues(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowIndex > -1)
            {
                List<ICaisisInputControl> cicList = PageUtil.GetCaisisInputControlsInContainer(e.Row);
                foreach (ICaisisInputControl cic in cicList)
                {
                    object o = DataBinder.Eval(DataBinder.GetDataItem(e.Row), cic.Field);
                    if (o != null)
                    {
                        cic.Value = o.ToString();
                    }
                }                
            }
            AddClickEventToButtons(sender, e);
        }

        /// <summary>
        /// Updates/Saves a row in the Grid
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="args"></param>
        protected void HandleRowUpdating(object sender, GridViewUpdateEventArgs args)
        {
            // Occurs when no real data/rows present in Grid
            // NOTE: Footer control is null in this case, as grid has no real data
            if (args.RowIndex < 0 && SpecimenEventsGridView.FooterRow == null)
            {
                CaisisGridView.ExtractCaisisInputValuesFromContainer(SpecimenEventsGridView, args.NewValues);
            }
            // Occurs when adding a record to a grid with data, values are in footer row
            else if (args.RowIndex < 0 && SpecimenEventsGridView.FooterRow != null)
            {
                CaisisGridView.ExtractCaisisInputValuesFromContainer(SpecimenEventsGridView.FooterRow, args.NewValues);
            }
            // Occurs when a row of real data is updating
            else
            {
                CaisisGridView.ExtractCaisisInputValuesFromContainer(SpecimenEventsGridView.Rows[args.RowIndex], args.NewValues);
            }

            // Create Biz Object
            SpecimenEvents biz = new SpecimenEvents();
            // If record exits (row of data/not footer)
            if (args.NewValues.Contains(SpecimenEvents.SpecimenEventId))
            {
                int priKey = int.Parse(args.NewValues[SpecimenEvents.SpecimenEventId].ToString());
                biz.Get(priKey);
            }
            // Footer Row, insert specimenid
            else
            {
                biz[SpecimenEvents.SpecimenId] = CurrentSpecimen[Specimen.SpecimenId];
            }
            // Set biz values
            foreach (string field in args.NewValues.Keys)
            {
                biz[field] = args.NewValues[field];
            }
            // Save/Update
            biz.Save();
            // Rebind grid to show saved data
            BindSpecimenEventsGrid();
            Page.Response.Redirect(Page.Request.Url.ToString(), true);
        }

        //to check the Type is not null, before Add/Update events in different RowTypes of gridview control
        protected void AddClickEventToButtons(object sender, GridViewRowEventArgs e)
        {
            //adding new event
            if (e.Row.RowType == DataControlRowType.EmptyDataRow)
            {
                ImageButton emptyrowAddBtn = e.Row.FindControl("EvtAdd") as ImageButton;
                CaisisComboBox emptyrowevtTest = e.Row.FindControl("EvtTest") as CaisisComboBox;
                if (emptyrowAddBtn != null && emptyrowevtTest != null)
                {
                    emptyrowAddBtn.Attributes["onclick"] = "return validateTest('" + emptyrowevtTest.ClientID + "');";
                }
            }
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                //delete existing event
                ImageButton deleteBtn = e.Row.FindControl("DeleteBtn") as ImageButton;
                if (deleteBtn != null)
                {
                    deleteBtn.Attributes["onclick"] = "return confirm('Are you sure you want to delete this event?');";
                }

                //updating existing event data in edit mode
                ImageButton saveBtn = e.Row.FindControl("SaveRowBtn") as ImageButton;
                CaisisComboBox evtTest = e.Row.FindControl("EvtTest1") as CaisisComboBox;
                if (saveBtn != null && evtTest != null)
                {
                    saveBtn.Attributes["onclick"] = "return validateTest('" + evtTest.ClientID + "');";
                }

                //getting Specimen Reference # to view report
                DataRowView drv = (DataRowView)e.Row.DataItem;
                int id = int.Parse(drv["SpecimenId"].ToString());
                SpecimenManagerDa da = new SpecimenManagerDa();
                string datasetSQL = CacheManager.GetDatasetSQL(Session[SessionKey.DatasetId]);
                DataTable dt = da.GetIdentifier(id, _identifierType, datasetSQL);
                string str = dt.Rows[0].ItemArray[3].ToString();
                string refnum;

                //to get the substring of ReferenceNumber removing from first hyphen(-)
                if (str.Contains("-"))
                {
                    int index = str.IndexOf(@"-");
                    refnum = str.Substring(0, index);
                }
                else
                {
                    refnum = str;
                }

                //show URL button for only processed aCGH tests
                //commented this section temporarily
                /*
                string testValue = drv["EventType"].ToString();
                string testProcessedBy = drv["ProcessedBy"].ToString();

                Button urlBtn1 = e.Row.FindControl("EvtURL1") as Button;
                if (testValue == "aCGH" && testProcessedBy == "")
                {
                    SpecimenEventsGridViewTable.FindControl("hdrRpt").Visible = true;
                    SpecimenEventsGridView.Columns[11].Visible = true;
                }
                if (urlBtn1 != null)
                {
                    if (testValue == "aCGH" && testProcessedBy == "")
                    {
                        urlBtn1.Attributes["onclick"] = "window.open('http://aji.cbio.mskcc.org/btc/" + refnum + "/index.html','_new'); return false;";
                        urlBtn1.Style["visibility"] = "visible";
                        urlBtn1.NamingContainer.Visible = true;
                    }
                }
                 */

                // enable edit click
                ImageButton editBtn = e.Row.FindControl("EditImage") as ImageButton;
                editBtn.OnClientClick = "enableGridFields(" + e.Row.RowIndex + ");return false;"; 
            }
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                //Adding new event, with some events already existing
                ImageButton AddBtn = e.Row.FindControl("EvntAdd1") as ImageButton;
                CaisisComboBox footerevtTest = e.Row.FindControl("EvtTest2") as CaisisComboBox;
                if (AddBtn != null && footerevtTest != null)
                {
                    AddBtn.Attributes["onclick"] = "return validateTest('" + footerevtTest.ClientID + "');";
                }
            }
        }

        protected void HandleRowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            object key = (sender as GridView).DataKeys[e.RowIndex][SpecimenEvents.SpecimenEventId];
            if (key != null && key.ToString() != "")
            {
                int priKey = int.Parse(key.ToString());
                SpecimenEvents biz = new SpecimenEvents();
                biz.Delete(priKey);
                BindSpecimenEventsGrid();
                Page.Response.Redirect(Page.Request.Url.ToString(), true);
            }
        }
    }
}