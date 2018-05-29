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

    public partial class EditSpecimenDetails : SpecimenMgmtDataEntryPage
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
            specId.Value = specimenId.ToString();

            CurrentSpecimen = new Specimen();
            CurrentSpecimen.Get(this.specimenId);

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
            CurrentSpecimen = new Specimen();
            CurrentSpecimen.Get(this.specimenId);

            string parentspecId = CurrentSpecimen[Specimen.ParentSpecimenId].ToString();
            pspecId.Value = parentspecId.ToString();

            //if (!string.IsNullOrEmpty(parentspecId))
            //{
            //    Specimen ParentSpecimen = new Specimen();
            //    ParentSpecimen.Get(Int32.Parse(parentspecId.ToString()));

            //    pRemQty.Value = ParentSpecimen[Specimen.SpecimenRemainingQty].ToString();
            //}
            //RemQty.Value = CurrentSpecimen[Specimen.SpecimenRemainingQty].ToString();

            CICHelper.SetFieldValues(this.inputControlsRow.Controls, CurrentSpecimen);


            //load box and position from SpecimenBoxes and SpecimenPositions tables
            string sBoxId = CurrentSpecimen[Specimen.BoxId].ToString();
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

            string sPositionId = CurrentSpecimen[Specimen.PositionId].ToString();
            if (!String.IsNullOrEmpty(sPositionId))
            {
                int positionId = int.Parse(sPositionId);
                pos.Get(positionId);
                this.PositionName.Value = pos[SpecimenPosition.Position].ToString();
                this.PositionId.Value = pos[SpecimenPosition.PositionId].ToString();
            }

        }

        protected void UpdateBtn_Click(object sender, ImageClickEventArgs e)
        {
            CurrentSpecimen = new Specimen();
            CurrentSpecimen.Get(this.specimenId);

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

            string specId = CurrentSpecimen[Specimen.SpecimenId].ToString();
            string parentspecId = CurrentSpecimen[Specimen.ParentSpecimenId].ToString();

            //calculating parent Rem qty based on child Qty
            if (!string.IsNullOrEmpty(parentspecId))
            {
                Specimen ParentSpecimen = new Specimen();
                ParentSpecimen.Get(Int32.Parse(parentspecId.ToString()));
                string PparentspecId = ParentSpecimen[Specimen.ParentSpecimenId].ToString();

                //string specimenRemQty = ParentSpecimen[Specimen.SpecimenRemainingQty].ToString();
                //if (!string.IsNullOrEmpty(specimenRemQty))
                //{
                //    specimenRemQty = ParentSpecimen[Specimen.SpecimenRemainingQty].ToString();
                //}
                //else
                //{
                //    specimenRemQty = ParentSpecimen[Specimen.SpecimenOriginalQty].ToString();
                //}

                //string subspecOrgQty = this.SpecimenOriginalQty.Value;
                //int specRemQty;

                //if (!string.IsNullOrEmpty(subspecOrgQty))
                //{
                //    if (Int32.Parse(subspecOrgQty) <= Int32.Parse(specimenRemQty))
                //    {
                //        specRemQty = Int32.Parse(specimenRemQty) - Int32.Parse(subspecOrgQty);
                //        ParentSpecimen[Specimen.SpecimenRemainingQty] = specRemQty;
                //    }
                //}
                //else
                //{
                //    specRemQty = Int32.Parse(specimenRemQty) - 0;
                //    ParentSpecimen[Specimen.SpecimenRemainingQty] = specRemQty;
                //}

                CurrentSpecimen.Save();
                ParentSpecimen.Save();                
            }
            else
            {
                CurrentSpecimen.Save();
            }

            //Refreshing specimens hierarchy frame of Parent page
            Page.ClientScript.RegisterClientScriptBlock(typeof(Page), "RefreshParentwindow", "refreshParentwindow();", true);
        }

        protected void addSubSpecimenbtn_Click(object sender, EventArgs e)
        {
            string refNum = CurrentSpecimen[Specimen.SpecimenReferenceNumber].ToString();

            CICHelper.ClearCaisisInputControlValues(this);

            if (!string.IsNullOrEmpty(refNum))
            {
                this.SpecimenReferenceNumber.Value = refNum + "-"; //pattern yet to decide
            }
            else
            {
                this.SpecimenReferenceNumber.Value = "";
            }
            this.SpecimenUnits.Value = CurrentSpecimen[Specimen.SpecimenUnits].ToString();

            this.UpdateBtn.Visible = false;
            this.SaveBtn.Visible = true;
            this.addSubSpecimenbtn.Visible = false;
            this.hdrlbl.Visible = false;
            this.subspeclbl.Visible = true;

            //get SpecimenReferencNumber
            string datasetSql = CacheManager.GetDatasetSQL(Session[SessionKey.DatasetId]);
            DataTable dt = da.GetIdentifier(this.specimenId, _identifierType, datasetSql);
            string refnum = dt.Rows[0].ItemArray[3].ToString();
            this.subspeclbl.Text = "Add Sub-Specimen for Specimen : " + refnum.ToString();

            Page.ClientScript.RegisterClientScriptBlock(typeof(Page), "HideProcessingEvents", "HideProcessingEvents();", true);
        }

        protected void SaveBtn_Click(object sender, ImageClickEventArgs e)
        {
            CurrentSpecimen = new Specimen();
            CurrentSpecimen.Get(specimenId);

            Specimen subspecimen = new Specimen();

            CICHelper.SetBOValues(inputControlsRow.Controls, subspecimen, specimenId);

            subspecimen[Specimen.SpecimenAccessionId] = CurrentSpecimen[Specimen.SpecimenAccessionId];
            subspecimen[Specimen.ParentSpecimenId] = CurrentSpecimen[Specimen.SpecimenId];
            subspecimen[Specimen.EnteredTime] = DateTime.Now;
            subspecimen[Specimen.EnteredBy] = new Caisis.Security.SecurityController().GetUserName();

            if (!string.IsNullOrEmpty(BoxId.Value))
            {
                int boxId = int.Parse(BoxId.Value);
                if (!string.IsNullOrEmpty(PositionName.Value))
                {
                    if (!string.IsNullOrEmpty(this.PositionId.Value))
                    {
                        int posId = int.Parse(this.PositionId.Value);
                        pos.Get(posId);
                    }

                    pos[SpecimenPosition.BoxId] = this.BoxId.Value;
                    pos[SpecimenPosition.Position] = this.PositionName.Value;
                    pos[SpecimenPosition.PositionStatus] = "Filled";
                    pos.Save();

                    // Update specimens table with boxid and positionids
                    subspecimen[Specimen.PositionId] = pos[SpecimenPosition.PositionId].ToString();
                    subspecimen[Specimen.BoxId] = pos[SpecimenPosition.BoxId].ToString();
                }
                else
                {
                    string currentPosId = subspecimen[Specimen.PositionId].ToString();
                    if (!string.IsNullOrEmpty(currentPosId))
                    {
                        subspecimen[Specimen.BoxId] = boxId;
                        subspecimen[Specimen.PositionId] = string.Empty;

                        pos.Delete(int.Parse(currentPosId));
                    }
                    else
                    {
                        subspecimen[Specimen.BoxId] = boxId;
                        subspecimen[Specimen.PositionId] = string.Empty;
                    }
                }
            }

            //calculating parent Rem qty based on child Org qty

            //string specimenRemQty = CurrentSpecimen[Specimen.SpecimenRemainingQty].ToString();
            //if (!string.IsNullOrEmpty(specimenRemQty))
            //{
            //    specimenRemQty = CurrentSpecimen[Specimen.SpecimenRemainingQty].ToString();
            //}
            //else
            //{
            //    specimenRemQty = CurrentSpecimen[Specimen.SpecimenOriginalQty].ToString();
            //}

            //string subspecOrgQty = this.SpecimenOriginalQty.Value;
            //string specimenUnits = CurrentSpecimen[Specimen.SpecimenUnits].ToString();
            //string subspecUnits = this.SpecimenUnits.Value;
            //int specRemQty;

            //if (!string.IsNullOrEmpty(subspecOrgQty))
            //{
            //    if (Int32.Parse(subspecOrgQty) <= Int32.Parse(specimenRemQty))
            //    {
            //        specRemQty = Int32.Parse(specimenRemQty) - Int32.Parse(subspecOrgQty);
            //        CurrentSpecimen[Specimen.SpecimenRemainingQty] = specRemQty;
            //    }
            //}
            //else
            //{
            //    specRemQty = Int32.Parse(specimenRemQty) - 0;
            //    CurrentSpecimen[Specimen.SpecimenRemainingQty] = specRemQty;
            //}

            CurrentSpecimen.Save();

            //if user didn't enter rem qty, then it is same as org qty
            if (!string.IsNullOrEmpty(SpecimenRemainingQty.Text))
            {
                subspecimen[Specimen.SpecimenRemainingQty] = SpecimenRemainingQty.Text;
            }
            else
            {
                subspecimen[Specimen.SpecimenRemainingQty] = SpecimenOriginalQty.Text;
            }

            subspecimen.Save();

            //Refreshing parent page
            string specId = subspecimen[Specimen.SpecimenId].ToString();
            string parentspecId = subspecimen[Specimen.ParentSpecimenId].ToString();

            Page.ClientScript.RegisterClientScriptBlock(typeof(Page), "RefreshParentwindow", "refreshParent('" + specId + "','" + parentspecId + "');", true);
        }

    }
}

