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
    /// <summary>
    /// SpecimenDetails displays and allows updates to existing specimen.
    /// </summary>

    public partial class EditSpecimens : SpecimenMgmtDataEntryPage
{
        private int specimenId = 0;
        private string _identifierType = CaisisConfiguration.GetWebConfigValue("SpecimenModuleDefaultId");
        Specimen CurrentSpecimen;
        SpecimenManagerDa da = new SpecimenManagerDa();
        SpecimenPosition pos = new SpecimenPosition();

        // TODO: 
        // 1) should use all CaisisInputControls and BizO's to get/set data
        // 2) set lookup code values properly
        // 3) see if any data from SpecimenAccession table should be shown on this form

        override protected void Page_Load(object sender, System.EventArgs e)
        {
            specimenId = Convert.ToInt32(Request.QueryString["specimenId"]);

            // Set Parent Speciment
            CurrentSpecimen = new Specimen();
            CurrentSpecimen.Get(specimenId);

            if (!Page.IsPostBack)
            {
                //populating Contacts field
                DataTable contactsdt = da.GetContactsForSpecimens();
                Contact.DataSource = contactsdt;
                Contact.DataBind();

                LoadSpecimenInfo();                
            }
            
        }

       private void LoadSpecimenInfo()
        {
            Specimen specimen = new Specimen();
            specimen.Get(this.specimenId);

            string parentspecId = specimen[Specimen.ParentSpecimenId].ToString();
            pspecId.Value = parentspecId.ToString();

            //if (!string.IsNullOrEmpty(parentspecId))
            //{
            //    Specimen ParentSpecimen = new Specimen();
            //    ParentSpecimen.Get(Int32.Parse(parentspecId.ToString()));

            //    pRemQty.Value = ParentSpecimen[Specimen.SpecimenRemainingQty].ToString();
            //}

            CICHelper.SetFieldValues(this.inputControlsRow.Controls, specimen);

           //getting patient identifier
            PtId.Text = _identifierType + " :";
            SpecimenManagerDa da = new SpecimenManagerDa();
            string datasetSql = CacheManager.GetDatasetSQL(Session[SessionKey.DatasetId]);
            DataTable dt = da.GetIdentifier(this.specimenId, _identifierType, datasetSql);
            string identifier = dt.Rows[0].ItemArray[2].ToString();
            TumorBankNumber.Text = identifier.ToString();

            //load box and position from SpecimenBoxes and SpecimenPositions tables
            string sBoxId = specimen[Specimen.BoxId].ToString();
            if (!String.IsNullOrEmpty(sBoxId))
            {
                int boxId = int.Parse(sBoxId);
                SpecimenBox box = new SpecimenBox();
                box.Get(boxId);
                this.BoxId.Value = box[SpecimenBox.BoxId].ToString();
                this.BoxName.Value = box[SpecimenBox.BoxName].ToString();

                DataSet hierarchySet = da.GetBoxAndAncestors(boxId);

                DataTable boxesDT = hierarchySet.Tables[0];
                DataTable containersDT = hierarchySet.Tables[1];
                DataTable storagesDT = hierarchySet.Tables[2];
                DataTable siteDT = hierarchySet.Tables[3];

                if (boxesDT.Rows.Count >= 1)
                {
                    string containerIdStr = boxesDT.Rows[0][SpecimenBox.ContainerId].ToString();
                    DataRow containerRow = containersDT.Select(SpecimenContainer.ContainerId + " = " + containerIdStr)[0];
                    this.ContainerName.Value = PageUtil.EscapeSingleQuotes(containerRow[SpecimenContainer.ContainerName].ToString());
                }
                if (containersDT.Rows.Count >= 1)
                {
                    string storagesIdStr = containersDT.Rows[0][Caisis.BOL.SpecimenContainer.StorageId].ToString();
                    DataRow specimenRow = storagesDT.Select(Caisis.BOL.SpecimenStorage.StorageId + " = " + storagesIdStr)[0];
                    this.StorageName.Value = PageUtil.EscapeSingleQuotes(specimenRow[Caisis.BOL.SpecimenStorage.StorageName].ToString());
                }
                if (siteDT.Rows.Count >= 1)
                {
                    string siteId = siteDT.Rows[0][SpecimenSite.SiteId].ToString();
                    DataRow siteRow = siteDT.Select(SpecimenSite.SiteId + " = " + siteId)[0];
                    this.SiteName.Value = PageUtil.EscapeSingleQuotes(siteRow[SpecimenSite.SiteName].ToString());
                }
            }

            string sPositionId = specimen[Specimen.PositionId].ToString();
            if (!String.IsNullOrEmpty(sPositionId))
            {
                int positionId = int.Parse(sPositionId);
                SpecimenPosition pos = new SpecimenPosition();
                pos.Get(positionId);
                this.PositionName.Value = pos[SpecimenPosition.Position].ToString();
                this.PositionId.Value = pos[SpecimenPosition.PositionId].ToString();
            }
        }

        protected void Update_Click(object sender, CommandEventArgs e)
        {

            SpecimenPosition pos = new SpecimenPosition();

            if (!string.IsNullOrEmpty(BoxId.Value))
            {
                int boxId = int.Parse(BoxId.Value);
                // checks for Position & set values in Specimen Position Table
                if (!string.IsNullOrEmpty(PositionName.Value))
                {
                    if (!string.IsNullOrEmpty(this.PositionId.Value))
                    {
                        // Load Position Record
                        int posId = int.Parse(this.PositionId.Value);
                        pos.Get(posId);
                    }
                    pos[SpecimenPosition.BoxId] = this.BoxId.Value;
                    pos[SpecimenPosition.Position] = this.PositionName.Value;
                    pos[SpecimenPosition.PositionStatus] = "Filled";
                    pos.Save();

                    // Update specimens table with boxid and position ids
                    CurrentSpecimen[Specimen.PositionId] = pos[SpecimenPosition.PositionId].ToString();
                    CurrentSpecimen[Specimen.BoxId] = pos[SpecimenPosition.BoxId].ToString();
                }
                else
                {
                    string currentPosId = CurrentSpecimen[Specimen.PositionId].ToString();
                    // Checks for PositionId if already exists
                    // then remove from SpecimenPositions, since a box is choosen instead of a position
                    if (!string.IsNullOrEmpty(currentPosId))
                    {
                        CurrentSpecimen[Specimen.BoxId] = boxId;
                        CurrentSpecimen[Specimen.PositionId] = string.Empty;

                        pos.Delete(int.Parse(currentPosId));                                                
                    }
                    else
                    {
                        CurrentSpecimen[Specimen.BoxId] = boxId;
                        CurrentSpecimen[Specimen.PositionId] = string.Empty;
                    }
                }
            }
            CurrentSpecimen[Specimen.SpecimenNotes] = this.SpecimenNotes.Value;
            CurrentSpecimen[Specimen.SpecimenOriginalQty] = this.SpecimenOriginalQty.Value;
            CurrentSpecimen[Specimen.SpecimenRemainingQty] = this.SpecimenRemainingQty.Value;
            CurrentSpecimen[Specimen.SpecimenPreservationType] = this.SpecimenPreservationType.Value;
            CurrentSpecimen[Specimen.SpecimenReferenceNumber] = this.SpecimenReferenceNumber.Value;
            CurrentSpecimen[Specimen.SpecimenStatus] = this.SpecimenStatus.Value;
            CurrentSpecimen[Specimen.ContactId] = this.Contact.Value;
            CurrentSpecimen[Specimen.SpecimenSubType] = this.SpecimenSubType.Value;
            CurrentSpecimen[Specimen.SpecimenType] = this.SpecimenType.Value;
            CurrentSpecimen[Specimen.SpecimenUnits] = this.SpecimenUnits.Value;

            CurrentSpecimen.Save();

            string specId = CurrentSpecimen[Specimen.SpecimenId].ToString();
            string parentspecId = CurrentSpecimen[Specimen.ParentSpecimenId].ToString();

            //calculating parent specimen RemQty on updating sub-specimen OrgQty
            //if (!string.IsNullOrEmpty(parentspecId))
            //{
            //    Specimen ParentSpecimen = new Specimen();
            //    ParentSpecimen.Get(Int32.Parse(parentspecId.ToString()));
            //    string PparentspecId = ParentSpecimen[Specimen.ParentSpecimenId].ToString();
                
            //    string specimenRemQty = ParentSpecimen[Specimen.SpecimenRemainingQty].ToString();
            //    if (!string.IsNullOrEmpty(specimenRemQty))
            //    {
            //        specimenRemQty = ParentSpecimen[Specimen.SpecimenRemainingQty].ToString();
            //    }
            //    else
            //    {
            //        specimenRemQty = ParentSpecimen[Specimen.SpecimenOriginalQty].ToString();
            //    }
            //    string subspecOrgQty = this.SpecimenOriginalQty.Value;
            //    int specRemQty;

            //    if (!string.IsNullOrEmpty(subspecOrgQty))
            //    {
            //        if (Int32.Parse(subspecOrgQty) <= Int32.Parse(specimenRemQty))
            //        {
            //            specRemQty = Int32.Parse(specimenRemQty) - Int32.Parse(subspecOrgQty);
            //            ParentSpecimen[Specimen.SpecimenRemainingQty] = specRemQty;
            //        }
            //    }
            //    else
            //    {
            //        specRemQty = Int32.Parse(specimenRemQty) - 0;
            //        ParentSpecimen[Specimen.SpecimenRemainingQty] = specRemQty;
            //    }

            //    ParentSpecimen.Save();
            //}
            SetRefreshClientBlock();
        }

        //after Saves/updates displays the refresh icon & closes modal window
        private void SetRefreshClientBlock()
        {
            string refreshFun = "if(top.showRefrshIcon){ top.showRefrshIcon(); }";
            Page.ClientScript.RegisterStartupScript(typeof(Page), "showRefreshIcon", refreshFun, true);
        }        
    }
}

