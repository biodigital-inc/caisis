using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Caisis.DataAccess;
using Caisis.BOL;
using Caisis.UI.Core.Classes.CustomControls;

namespace Caisis.UI.Modules.ProtocolMgmt
{
    public partial class PatientToxAttributions : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public virtual void Populate(Dictionary<string, IEnumerable<MedTxAdministration>> protocolMedTxAgents, int? toxicityId)
        {
            List<ToxAttribution> attributions = new List<ToxAttribution>();
            // get attributions for exisitng toxicity
            if (toxicityId.HasValue)
                attributions.AddRange(BusinessObject.GetByParent<ToxAttribution>(toxicityId.Value));
            DataTable patientAttributionTable = attributions.AsDataView<ToxAttribution>().Table;
            // clear restrictions
            foreach (DataColumn column in patientAttributionTable.Columns)
                column.AllowDBNull = true;
            // search for existing attributions
            var exisitngMedTxAgents = from row in patientAttributionTable.AsEnumerable()
                                      let agent = row[ToxAttribution.ToxAttribution_Field].ToString()
                                      where protocolMedTxAgents.Keys.Contains(agent)
                                      select agent;
            // add blank agents not yet attributed
            var blankMedTxAgents = protocolMedTxAgents.Keys.Except(exisitngMedTxAgents).ToArray();
            for (int i = 0; i < blankMedTxAgents.Length; i++)
            {
                string agent = blankMedTxAgents[i];
                DataRow blankRow = patientAttributionTable.NewRow();
                blankRow[ToxAttribution.ToxAttribution_Field] = agent;
                patientAttributionTable.Rows.Add(blankRow);
            }
            DataView attributionView = patientAttributionTable.DefaultView;
            // build attributions
            if (attributionView.Count > 0)
            {
                ToxAttributionGrid.DataSource = attributionView;
                ToxAttributionGrid.DataBind();
                AttributionsMessage.Visible = false;
            }
            // no attributions or expectations
            else
            {
                AttributionsMessage.Visible = true;
            }
        }

        public virtual void Save(int toxicityId)
        {
            foreach (GridViewRow row in ToxAttributionGrid.Rows)
            {
                var inputs = CICHelper.GetCaisisInputControls(row);
                ToxAttribution biz = new ToxAttribution();
                bool notEmpty = CICHelper.InputControlsHaveValue(inputs);
                if (notEmpty)
                {
                    string priKey = ToxAttributionGrid.DataKeys[row.RowIndex][BOL.ToxAttribution.ToxAttributionId] + "";
                    if (!string.IsNullOrEmpty(priKey))
                    {
                        biz.Get(int.Parse(priKey));
                    }
                    else
                    {
                        biz[ToxAttribution.ToxicityId] = toxicityId;
                    }
                    foreach (var input in inputs)
                    {
                        string fieldName = input.Field;
                        string formValue = input.Value;// Request.Form[(input as Control).UniqueID];
                        biz[fieldName] = formValue;
                    }
                    biz.Save();
                }
            }
        }

        protected void SetAttributionFields(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                int rowIndex = e.Row.DataItemIndex;
                string toxAttributionId = DataBinder.Eval(e.Row.DataItem, ToxAttribution.ToxAttributionId).ToString();
                string toxAttribution = DataBinder.Eval(e.Row.DataItem, ToxAttribution.ToxAttribution_Field).ToString();
                string toxAttributionProbability = DataBinder.Eval(e.Row.DataItem, ToxAttribution.ToxAttributionProbability).ToString();
                string toxAttributionAction = DataBinder.Eval(e.Row.DataItem, ToxAttribution.ToxAttributionAction).ToString();

                Label toxAttributionLabel = e.Row.FindControl("ToxAttributionLabel") as Label;
                ICaisisInputControl toxAttributionField = e.Row.FindControl("ToxAttributionField") as ICaisisInputControl;
                CaisisSelect toxProbField = e.Row.FindControl("ToxProbabilityField") as CaisisSelect;
                CaisisSelect toxActionField = e.Row.FindControl("ToxActionField") as CaisisSelect;
                toxAttributionLabel.Text = toxAttribution;
                toxAttributionField.Value = toxAttribution;
                //toxProbField.DataBound += (a, b) => 
                    toxProbField.Value = toxAttributionProbability;
                //toxActionField.DataBound += (a, b) => 
                    toxActionField.Value = toxAttributionAction;
            }
        }

        protected void DeleteToxAttribution(object sender, GridViewDeletedEventArgs e)
        {
            //// save form ??
            //int toxicityId = int.Parse(ToxicityIdField.Value);
            //PopulateAttributions(toxicityId);
            //SaveForm(false);
        }
    }
}