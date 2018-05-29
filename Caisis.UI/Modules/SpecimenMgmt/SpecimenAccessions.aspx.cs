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
using System.Security;
using System.Security.Principal;
using System.Security.Permissions;
using Caisis.Security;
using System.Text.RegularExpressions;

using Caisis.UI.Core.Classes;
using Caisis.UI.Core.Classes.CustomControls;
using Caisis.BOL;
using Caisis.DataAccess;

namespace Caisis.UI.Modules.SpecimenMgmt
{
    /// <summary>
    /// Specimen Accessions
    /// </summary>

    public partial class SpecimenAccessions : SpecimenMgmtBasePage
    {
        SpecimenManagerDa da = new SpecimenManagerDa();
        private int accessionId = 0;
        private int newAccessionId = 0;
        private int patientId = 0;
        private string identifier = "";
        private bool _isFormEnabled;
        private string _identifierType = CaisisConfiguration.GetWebConfigValue("SpecimenModuleDefaultId");
        SpecimenAccession sa;
        List<string> _tableNames = new List<string>();

        override protected void Page_Load(object sender, System.EventArgs e)
        {
            patientId = int.Parse(DecryptPatientId(Request.QueryString["patientId"].ToString()));

            Caisis.BOL.Patient ptObj=new Caisis.BOL.Patient();
            ptObj.Get(patientId);

            string datasetSql = CacheManager.GetDatasetSQL(Session[SessionKey.DatasetId]);
            DataTable identifiersdt = da.GetIdentifierByType(patientId, _identifierType, datasetSql);
            if (identifiersdt.Rows.Count >= 1)
            {
                identifier = identifiersdt.Rows[0]["Identifier"].ToString();
            }

            if (PermissionManager.HasPermission(PermissionManager.ViewPatientIdentifiers))
            {
                AccessionTitle.Text = "Specimen Accession for " + ptObj[Patient.PtFirstName].ToString() + " " + ptObj[Patient.PtLastName].ToString();
            }
            else
            {
                AccessionTitle.Text = "Specimen Accession for " + _identifierType + " : " + identifier;
            }

            if (!string.IsNullOrEmpty(Request.QueryString["specimenaccessionId"]))
            {
                accessionId = int.Parse(Request.QueryString["specimenaccessionId"].ToString());
            }
            // Get Accession
            sa = new SpecimenAccession();
            sa.Get(accessionId);
            if (!Page.IsPostBack)
            {
                LoadAccesssionInfo(accessionId);
                BindSpecimensGrid(accessionId);

                if (accessionId == 0)
                {
                    SetButtonStates(false, false, true, true, false);
                }
                else
                {
                    this.IsFormEnabled = false;
                    SetButtonStates(true, true, false, false, false);
                }
            }
        }

        private void LoadAccesssionInfo(int accId)
        {
            sa.Get(accId);
            CICHelper.SetFieldValues(this.inputControlsRow.Controls, sa);

            string accDate = sa["AccessionDate"].ToString();
            if (!string.IsNullOrEmpty(accDate))
            {
                int index = accDate.IndexOf(@" ");
                AccCollectionDate.Value = accDate.Substring(0, index);
            }
            SetEnteredUpdatedLockedInfo();
        }

        private void BindSpecimensGrid(int accId)
        {
            DataTable dt = da.GetSpecimensbyAccessionId(accId, _identifierType);
            this.specimensGrid.DataSource = dt;
            this.specimensGrid.DataBind();
        }
        
        protected void SaveBtn_Click(object sender, ImageClickEventArgs e)
        {
            if (accessionId != 0)
            {
                //updating existing accession record
                SpecimenAccession accession = new SpecimenAccession();
                accession.Get(accessionId);
                CICHelper.SetBOValues(inputControlsRow.Controls, accession, patientId);
                accession.Save();

                specimensGrid.Save(accessionId);

                LoadAccesssionInfo(accessionId);
                BindSpecimensGrid(accessionId);

                Page.ClientScript.RegisterStartupScript(typeof(Page), "refreshParent", "refreshParent('" + EncryptPatientId(patientId.ToString()) + "','" + accessionId + "');", true);
            }
            else
            {
                //saving new accession
                SpecimenAccession newaccession = new SpecimenAccession();
                CICHelper.SetBOValues(inputControlsRow.Controls, newaccession, patientId);
                newaccession[SpecimenAccession.PatientId] = patientId;
                newaccession.Save();

                newAccessionId = int.Parse(newaccession[SpecimenAccession.SpecimenAccessionId].ToString());
                specimensGrid.Save(newAccessionId);

                LoadAccesssionInfo(newAccessionId);
                BindSpecimensGrid(newAccessionId);

                Page.ClientScript.RegisterClientScriptBlock(typeof(Page), "refreshParent", "refreshParent('" + EncryptPatientId(patientId.ToString()) + "','" + newAccessionId + "');", true);
            }
        }

        protected void EditAccession(object sender, CommandEventArgs e)
        {
            IsFormEnabled = true;
            SetButtonStates(false, false, true, true, true);
            specimensGrid.Columns[11].Visible = true;
            AddRow.Visible = true;
        }

        protected void CancelSave(object sender, CommandEventArgs e)
        {
            Response.Redirect(Request.Url.PathAndQuery);
        }

        protected void AccessionDelete(object sender, CommandEventArgs e)
        {
            DataTable dt = da.GetSpecimensbyAccessionId(accessionId, _identifierType);

            sa.Get(accessionId);
            if (dt.Rows.Count > 0)
            {
                Response.Write("<script>alert('The Accession can not be deleted because it has " + dt.Rows.Count + " Specimen(s) derived from it.\\nIf you would like to delete the Accession please delete each Specimen first.');</script>");

                Page.ClientScript.RegisterClientScriptBlock(typeof(Page), "refreshParent", "refreshParent('" + EncryptPatientId(patientId.ToString()) + "','" + accessionId + "');", true);
            }
            else
            {
                sa.Delete(accessionId);
                
                //opens new record after deletion
                NewAccession(sender, e);
            }
        }

        protected void NewAccession(object sender, CommandEventArgs e)
        {
            Page.ClientScript.RegisterClientScriptBlock(typeof(Page), "NewAccessionRecord", "NewAccessionRecord('" + EncryptPatientId(patientId.ToString()) + "');", true);
        }

        protected void SetFieldValues(object sender, GridViewRowEventArgs e)
        {
            // Get SpecimenAccessionId and register Array of Specimens with child Speicmens
            if (specimensGrid.DataKeys.Count > 0)
            {
                object specKey = specimensGrid.DataKeys[0][Specimen.SpecimenId];
                if (specKey != null && !string.IsNullOrEmpty(specKey.ToString()))
                {
                    int specKeyId = int.Parse(specKey.ToString());
                    sa.Get(specKeyId);
                    string specAccKey = sa[Specimen.SpecimenAccessionId].ToString();
                    if (specAccKey != null && !string.IsNullOrEmpty(specAccKey.ToString()))
                    {
                        int specAccId = int.Parse(specAccKey.ToString());
                        SpecimenManagerDa da = new SpecimenManagerDa();
                        DataTable dt = da.GetSpecimenshavingChilds(specAccId);
                        List<string> specIds = new List<string>();
                        foreach (DataRow row in dt.Rows)
                        {
                            string specIdWithChildren = row[Specimen.ParentSpecimenId].ToString();
                            if (!string.IsNullOrEmpty(specIdWithChildren))
                            {
                                specIds.Add(specIdWithChildren);
                            }
                        }
                        //Array of all specimenIds of specimens having children, create safe js array, instead of new Array();
                        string jsArray = "var SpecimensWithChildren = [" + string.Join(",", specIds.ToArray()) + "];";

                        Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "SpecimensWithChildren", jsArray, true);
                    }

                    HtmlImage img = e.Row.FindControl("SpecimenPickerImg") as HtmlImage;
                    if (img != null)
                    {
                        Control siteName = e.Row.FindControl("SiteName") as Control;
                        Control storageName = e.Row.FindControl("StorageName") as Control;
                        Control Contname = e.Row.FindControl("ContainerName") as Control;
                        Control bid = e.Row.FindControl("BoxId") as Control;
                        Control pid = e.Row.FindControl("PositionId") as Control;
                        Control bname = e.Row.FindControl("SpecBoxName") as Control;
                        Control pname = e.Row.FindControl("SpecPositionName") as Control;

                        img.Attributes["onclick"] = "showSpecimenPicker('" + siteName.ClientID + "','" + storageName.ClientID + "','" + Contname.ClientID + "''" + bid.ClientID + "','" + pid.ClientID + "','" + bname.ClientID + "','" + pname.ClientID + "');";
                    }
                }
            }
        }

        protected void HandleRowDelete(object sender, GridViewDeletedEventArgs e)
        {
            //string positionId = e.Values[Specimen.PositionId].ToString();
            //if (!string.IsNullOrEmpty(positionId))
            //{
            //    SpecimenPosition biz = new SpecimenPosition();
            //    biz.Delete(int.Parse(positionId));
            //}

            Page.ClientScript.RegisterClientScriptBlock(typeof(Page), "refreshParent", "refreshParent('" + EncryptPatientId(patientId.ToString()) + "','" + accessionId + "');", true);
        }

        private bool IsFormEnabled
        {
            get
            {
                return _isFormEnabled;
            }
            set
            {
                _isFormEnabled = value;

                CICHelper.EnableFields(this.dataForm.Controls, _isFormEnabled);
            }
        }

        private void SetButtonStates(bool enableNewBtn, bool enableEditBtn, bool enableSaveBtn, bool enableCancelBtn, bool enableDeleteBtn)
        {
            // new
            if (enableNewBtn) { NewBtn.Enabled = true; NewBtn.ImageUrl = "../../Images/DataEntryButtons/Button_New_On.gif"; NewBtn.CssClass = "PDButtonOn"; } else { NewBtn.Enabled = false; NewBtn.ImageUrl = "../../Images/DataEntryButtons/Button_New_Off.gif"; NewBtn.CssClass = "PDButtonOff"; }

            // edit
            if (enableEditBtn) { EditBtn.Enabled = true; EditBtn.ImageUrl = "../../Images/DataEntryButtons/Button_Edit_On.gif"; EditBtn.CssClass = "PDButtonOn"; } else { EditBtn.Enabled = false; EditBtn.ImageUrl = "../../Images/DataEntryButtons/Button_Edit_Off.gif"; EditBtn.CssClass = "PDButtonOff"; }

            // save
            if (enableSaveBtn) { SaveBtn.Enabled = true; SaveBtn.ImageUrl = "../../Images/DataEntryButtons/Button_Save_On.gif"; SaveBtn.CssClass = "PDButtonOn"; } else { SaveBtn.Enabled = false; SaveBtn.ImageUrl = "../../Images/DataEntryButtons/Button_Save_Off.gif"; SaveBtn.CssClass = "PDButtonOff"; }

            // cancel
            if (enableCancelBtn) { CancelBtn.Enabled = true; CancelBtn.ImageUrl = "../../Images/DataEntryButtons/Button_Cancel_On.gif"; CancelBtn.CssClass = "PDButtonOn"; } else { CancelBtn.Enabled = false; CancelBtn.ImageUrl = "../../Images/DataEntryButtons/Button_Cancel_Off.gif"; CancelBtn.CssClass = "PDButtonOff"; };
            
            // delete
            if (enableDeleteBtn) { DeleteBtn.Enabled = true; DeleteBtn.ImageUrl = "../../Images/DataEntryButtons/Button_Delete_On.gif"; DeleteBtn.CssClass = "PDButtonOn"; }
            else
            {
                DeleteBtn.Enabled = false;
                DeleteBtn.ImageUrl = "../../Images/DataEntryButtons/Button_Delete_Off.gif";
                DeleteBtn.CssClass = "PDButtonOff";
            }
        }

        protected void SetEnteredUpdatedLockedInfo()
        {
            if (!string.IsNullOrEmpty(sa[SpecimenAccession.EnteredBy].ToString()) && sa["EnteredBy"].ToString().Length > 0)
            {
                EnteredBy.Text = sa["EnteredBy"].ToString();
                EnteredTime.Text = " @ " + sa["EnteredTime"].ToString();
            }

            if (!string.IsNullOrEmpty(sa[SpecimenAccession.UpdatedBy].ToString()) && sa["UpdatedBy"].ToString().Length > 0)
            {
                UpdatedBy.Text = sa["UpdatedBy"].ToString();
                UpdatedTime.Text = " @ " + sa["UpdatedTime"].ToString();
            }

            if (!string.IsNullOrEmpty(sa[SpecimenAccession.LockedBy].ToString()) && sa["LockedBy"].ToString().Length > 0)
            {
                LockedBy.Text = sa["LockedBy"].ToString();
                LockedTime.Text = " @ " + sa["LockedTime"].ToString();

            }
            else
            {
                LockedBy.Text = "";
                LockedTime.Text = "";
            }
        }
    }
}