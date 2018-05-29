using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Collections.Generic;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Linq;

using Caisis.BOL;
using Caisis.DataAccess;
using Caisis.UI.Core.Classes;
using Caisis.UI.Core.Classes.CustomControls;

namespace Caisis.UI.Modules.ProtocolMgmt
{
    public partial class PatientImagingBone : ProtocolMgmtPatientBasePage
    {
        protected static readonly string[] ImageTypes = new string[] { "Bone" };

        protected static readonly string[] IMG_FIND_SUBSITES = new string[] { "Skull", "Thorax", "Spine", "Pelvis", "Extremities" };
        protected static readonly string[] IMG_FIND_AP = new string[] { "Anterior", "Posterior" };
        protected static readonly string[] IMG_FIND_SIDES = new string[] { "Left", "Right" };

        /// <summary>
        /// Contains a map of ICaisisInputControls to their DxImageFindingEvent, used to update a DxImageFinding record
        /// </summary>
        private Dictionary<ICaisisInputControl, DxImageFindingEvent> fieldToUpdateMap = new Dictionary<ICaisisInputControl, DxImageFindingEvent>();

        private DataView diagnosticRecords;
        private DataView DiagnosticRecords
        {
            get
            {
                // fill view with only bone scans
                if (diagnosticRecords == null)
                {
                    // old
                    //DiagnosticDa da = new DiagnosticDa();
                    //diagnosticRecords = da.GetDiagnosticAndImgFindNewByType(int.Parse(BaseDecryptedPatientId), ImageTypes).DefaultView;
                    // new
                    DiagnosticDa da = new DiagnosticDa();
                    int patientId = int.Parse(BaseDecryptedPatientId);
                    diagnosticRecords = da.GetDiagnosticsByType(patientId, ImageTypes).DefaultView;
                    // filter by date
                    var dateRange = GetDiagnosticDateRange();
                    List<string> dateFilters = new List<string>();
                    if (dateRange.Key.HasValue)
                        dateFilters.Add("DxDate >= #{0:d}#");
                    if (dateRange.Value.HasValue)
                        dateFilters.Add("DxDate <= #{1:d}#");
                    if (dateFilters.Count() > 0)
                        diagnosticRecords.RowFilter = string.Format(string.Join(" AND ", dateFilters.ToArray()), dateRange.Key, dateRange.Value);
                    diagnosticRecords.Sort = Diagnostic.DxDate + " ASC";
                }
                return diagnosticRecords;
            }
        }

        private DataView boneDxImageFindings;
        private DataView BoneDxImageFindings
        {
            get
            {
                if (boneDxImageFindings == null)
                {
                    int patientId = int.Parse(BaseDecryptedPatientId);
                    DiagnosticDa da = new DiagnosticDa();
                    DataTable baseImagingTable = da.GetDxImagesByType(patientId, ImageTypes);
                    boneDxImageFindings = baseImagingTable.DefaultView;
                }
                return boneDxImageFindings;
            }
        }

        /// <summary>
        /// An Event which occurs when binding to DxImageFindings
        /// </summary>
        private event DxImageFindingEvent PopulateDxImagingField;

        delegate void DxImageFindingEvent(int diagnosticId);

        protected string QueryDiagnosticId
        {
            get
            {
                return Request.QueryString["diagnosticId"];
            }
        }

        /// <summary>
        /// 
        /// </summary>
        private int DiagnosticId
        {
            get
            {
                return int.Parse(QueryDiagnosticId);
            }
        }

        /// <summary>
        /// Returns if creating/editing a new Diagnostic record
        /// </summary>
        protected bool IsNew
        {
            get
            {
                return string.IsNullOrEmpty(QueryDiagnosticId);
            }
        }

        public PatientImagingBone()
            : base()
        {
            this.Init += new EventHandler(InitEvents);
        }

        /// <summary>
        /// Initalizes variables and attaches event handlers for populating/updating DxImageFindingFields
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void InitEvents(object sender, EventArgs e)
        {
            List<CaisisCheckBox> checkBoxList = new List<CaisisCheckBox>(IMG_FIND_SUBSITES.Length);
            // setup event handlers
            foreach (string bodyPart in IMG_FIND_SUBSITES)
            {
                // Main Checkbox for each body part
                CaisisCheckBox subSiteCheckBox = this.FindControl(bodyPart + "_Check") as CaisisCheckBox;
                checkBoxList.Add(subSiteCheckBox);

                CaisisHidden basicSubSiteId = this.FindControl(bodyPart + "_BasicId") as CaisisHidden;
                string basicFindSubSite = bodyPart;

                // Populate basic basic image finding by subsite
                this.PopulateDxImagingField += new DxImageFindingEvent(delegate(int diagnosticId)
                {
                    // Check if a basic record is found for subsite and set prikey and check box
                    DataRow basicFind = FindDxBoneRecordBasic(diagnosticId, basicFindSubSite);
                    if (basicFind != null)
                    {
                        basicSubSiteId.Value = basicFind[ImageFinding.DxImageFindingId].ToString();
                        subSiteCheckBox.Checked = true;
                    }
                });

                // Update event for basic image finding by subsite, no ImgFindNew,ImgFindSide or ImgFindAP
                DxImageFindingEvent basicSubSiteUpdateEvent = new DxImageFindingEvent(delegate(int diagnosticId)
                    {
                        ImageFinding biz = new ImageFinding();
                        if (subSiteCheckBox.Checked)
                        {
                            if (!string.IsNullOrEmpty(basicSubSiteId.Value))
                            {
                                biz.Get(int.Parse(basicSubSiteId.Value));
                            }
                            else
                            {
                                biz[ImageFinding.DiagnosticId] = diagnosticId;
                            }
                            biz[ImageFinding.ImgFindSite] = ImageTypes[0];
                            biz[ImageFinding.ImgFindSubsite] = basicFindSubSite;
                            biz.Save();
                            // update prikey field
                            basicSubSiteId.Value = biz[ImageFinding.DxImageFindingId].ToString();
                        }
                        else
                        {
                            if (!string.IsNullOrEmpty(basicSubSiteId.Value))
                            {
                                biz.Delete(int.Parse(basicSubSiteId.Value));
                                // update prikey field
                                basicSubSiteId.Value = string.Empty;
                            }
                        }
                    });
                // When subsite checkbox changed, mark as dirty
                subSiteCheckBox.ValueChanged += GetValueChangeEventHandler(subSiteCheckBox, basicSubSiteUpdateEvent);

                // DETAIL ORIENTED FIELDS

                // iterate through specific subsite fields and set update and populate events
                foreach (string view in IMG_FIND_AP)
                {
                    foreach (string side in IMG_FIND_SIDES)
                    {
                        CaisisTextBox bodyPartViewSide = this.FindControl(view + "_" + bodyPart + "_" + side) as CaisisTextBox;
                        CaisisHidden bodyPartViewSideId = this.FindControl(view + "_" + bodyPart + "_" + side + "_Id") as CaisisHidden;

                        // Static Values
                        string imgFindAP = view;
                        string imgFindSide = side;
                        string imgFindSubsite = bodyPart;

                        // EVENT HANDLER which populates fields 
                        DxImageFindingEvent populateEvent = new DxImageFindingEvent(delegate(int diagnosticId)
                        {
                            // Populate when not posting back
                            DataRow foundBodyPartViewSide = FindDxBoneRecord(diagnosticId, imgFindAP, imgFindSide, imgFindSubsite);
                            if (bodyPartViewSideId != null && foundBodyPartViewSide != null)
                            {
                                // set pri key
                                bodyPartViewSideId.Value = foundBodyPartViewSide[ImageFinding.DxImageFindingId].ToString();
                                // set textbox value
                                bodyPartViewSide.Value = foundBodyPartViewSide[ImageFinding.ImgFindNew].ToString();
                                // check box to indicate record found and has value
                                subSiteCheckBox.Checked = true;

                                // COLLECT MORE ACTIVATED
                                CollectMore.Checked = true;
                            }
                        });

                        // EVENT HANDLER which updates the DxImageFindings table
                        DxImageFindingEvent updateEvent = new DxImageFindingEvent(delegate(int diagnosticId)
                        {
                            // Create new Biz
                            ImageFinding biz = new ImageFinding();
                            // load record if exists
                            if (!string.IsNullOrEmpty(bodyPartViewSideId.Value))
                            {
                                int priKey = int.Parse(bodyPartViewSideId.Value);
                                if (!string.IsNullOrEmpty(bodyPartViewSide.Value))
                                {
                                    biz.Get(priKey);
                                }
                                // otherwise, do not save empty ImgFindNew, remove record
                                else
                                {
                                    biz.Delete(priKey);
                                    return;
                                }
                            }
                            else
                            {
                                // set par key field
                                biz[ImageFinding.DiagnosticId] = diagnosticId;
                            }
                            // set ImgFindNew from text field
                            biz[ImageFinding.ImgFindNew] = bodyPartViewSide.Value;
                            // Get static values from dictionary
                            biz[ImageFinding.ImgFindSite] = ImageTypes[0];
                            biz[ImageFinding.ImgFindAP] = imgFindAP;
                            biz[ImageFinding.ImgFindSide] = imgFindSide;
                            biz[ImageFinding.ImgFindSubsite] = imgFindSubsite;
                            // save/update record
                            biz.Save();
                            // update prikeyfield
                            bodyPartViewSideId.Value = biz[ImageFinding.DxImageFindingId].ToString();

                            // Since we're creating a specific subsite find location, we need to remove generic subsite find record
                            if (!string.IsNullOrEmpty(basicSubSiteId.Value))
                            {
                                ImageFinding basicFinding = new ImageFinding();
                                biz.Delete(int.Parse(basicSubSiteId.Value));
                                // update basic finding field
                                basicSubSiteId.Value = string.Empty;
                            }

                        });


                        // Attach event for tracking dirty fields
                        bodyPartViewSide.ValueChanged += GetValueChangeEventHandler(bodyPartViewSide, updateEvent); ;
                        // Attach events for populating fields
                        this.PopulateDxImagingField += new DxImageFindingEvent(populateEvent);
                    }
                }
            }

            // EVENTS for Total Lesions compared to BASELINE SCAN

            //// Create populating event which will set hidden field and radio button value if an image finding found
            //DxImageFindingEvent totalNewLesionsUpdate = new DxImageFindingEvent(delegate(int diagnosticId)
            //       {
            //           DataRow found = FindDxBoneRecord(diagnosticId);
            //           if (found != null)
            //           {
            //               DxTotalNumNewTumors.Value = found[ImageFinding.ImgFindNew].ToString();
            //               TotalNewLesionsId.Value = found[ImageFinding.DxImageFindingId].ToString();
            //           }
            //       });
            //this.PopulateDxImagingField += new DxImageFindingEvent(totalNewLesionsUpdate);

            //// Create an update event which is used for updating the total number of lesions 
            //DxImageFindingEvent basicBareUpdate = new DxImageFindingEvent(delegate(int diagnosticId)
            //{
            //    ImageFinding biz = new ImageFinding();
            //    if (!string.IsNullOrEmpty(TotalNewLesionsId.Value))
            //    {
            //        biz.Get(int.Parse(TotalNewLesionsId.Value));
            //    }
            //    else
            //    {
            //        biz[ImageFinding.DiagnosticId] = diagnosticId;
            //    }
            //    //biz[ImageFinding.ImgFindNew] = DxTotalNumNewTumors.Value;
            //    biz[ImageFinding.ImgFindNotes] = "New total findings compared to BASELINE SCAN.";
            //    biz[ImageFinding.ImgFindSite] = ImageTypes[0];

            //    //            var q =
            //    //from c in checkBoxList
            //    //let v = c.Value
            //    //where c.Checked
            //    //select v;
            //    //string checkedValues = string.Join(",", checkBoxList.Where(c => c.Checked).Select(c => c.Value).ToArray());
            //    biz.Save();
            //});
            //// When chnaging total lesion, trigger dirty field
            //DxTotalNumNewTumors.ValueChanged += GetValueChangeEventHandler(DxTotalNumNewTumors, basicBareUpdate);
        }

        /// <summary>
        /// Returns a CaisisEventHandler which is used for triggering "dirty" functinality for an ICaisisInputControl
        /// </summary>
        /// <param name="srcControl"></param>
        /// <param name="updateEvent"></param>
        /// <returns></returns>
        private CaisisEventHandler GetValueChangeEventHandler(ICaisisInputControl srcControl, DxImageFindingEvent updateEvent)
        {
            CaisisEventHandler changeEvent = new CaisisEventHandler(delegate(ICaisisInputControl a, EventArgs b)
                {
                    if (!fieldToUpdateMap.ContainsKey(a))
                    {
                        fieldToUpdateMap.Add(a, updateEvent);
                    }
                });
            return changeEvent;
        }

        protected override void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                BindDiagnostics();
                if (!IsNew)
                {
                    this.PopulateForm(DiagnosticId);
                    Form.Visible = true;
                }
                    // don't allow new scans to be added
                else
                {
                    Form.Visible = false;
                }
            }
        }

        /// <summary>
        /// 
        /// </summary>
        private void BindDiagnostics()
        {
            // build list view of bone scans
            DiagnosticsRptr.DataSource = DiagnosticRecords;
            DiagnosticsRptr.DataBind();

            // get a list of all diagnostics belonging to this patient
            // use to bind to compared to drop down
            var prevDiagnostics = from diagnostic in DiagnosticRecords.Table.AsEnumerable()
                                  let diagnosticId = (int)diagnostic[Diagnostic.DiagnosticId]
                                  let dxType = diagnostic[Diagnostic.DxType]
                                  let dxDate = diagnostic[Diagnostic.DxDate]
                                  // filter out all diagnostics which aren't this diagnostic, or all for new
                                  where IsNew || diagnosticId != DiagnosticId
                                  // display text as "Bone Scan 01/26/2010" and value = diag id
                                  let displayText = string.Format("{0} {1:d}", dxType, dxDate)
                                  let sortDate = !diagnostic.IsNull(Diagnostic.DxDate) ? (DateTime)dxDate : DateTime.MaxValue
                                  orderby sortDate ascending
                                  select new
                                  {
                                      DiagnosticText = displayText,
                                      DiagnosticId = diagnosticId
                                  };
            // bind list of prev scans to new computed object
            PrevScans.DataSource = prevDiagnostics;
            PrevScans.DataBind();
        }

        /// <summary>
        /// Populates the Diagnostic record as well as applicable Image Findings
        /// </summary>
        /// <param name="diagnosticId"></param>
        protected void PopulateForm(int diagnosticId)
        {
            Diagnostic biz = new Diagnostic();
            biz.Get(diagnosticId);
            // set fields in panel
            base.PopulateForm(this, biz);
            // set data label
            DxDateLabel.Text = string.Format("{0:d}", biz[Diagnostic.DxDate]);

            if (!biz.IsNull(Diagnostic.DxTarget))
                DxTargetLabel.Text = string.Format("(Target={0})", biz[Diagnostic.DxTarget]);
            else
                DxTargetLabel.Text = "";

            // SPECIAL CASE:  for current diagnostic, check if there is a related record, used as compare to for follow up scans
            var relatedDiagnostics = Caisis.Controller.RelatedRecordController.GetRelatedRecords(biz.TableName, diagnosticId, biz.TableName);
            if (relatedDiagnostics.Count() > 0)
            {
                // get related diagnostic id
                int relatedDiagnosticId = (int)relatedDiagnostics.First()[RelatedRecord.DestPrimaryKey];
                PageUtil.SelectDropDownItem(PrevScans, relatedDiagnosticId.ToString());
            }

            string dxTracer = biz[Diagnostic.DxTracer].ToString();
            // no selection
            if (string.IsNullOrEmpty(dxTracer))
            {
                TracerUptake.ClearSelection();
            }
            // yes
            else if (PageUtil.IsTrueString(dxTracer))
            {
                TracerUptake.SelectedIndex = 0;
            }
            // no
            else
            {
                TracerUptake.SelectedIndex = 1;
            }

            // set baseline toggle panels
            if (ImgBaseline.Checked)
            {
                // hide follow up panel and impression fields, clear follow up num new value
                FollowUpPanel.Style["display"] = "none";
                ClinicalImpressionPanel.Style["display"] = "none";
                DxTotalNumTumorsFollowUp.Value = string.Empty;
                // show baseline panel and impression
                BaselinePanel.Style.Remove("display");
            }
            else
            {
                // hide baseline panel and show follow up and impression fields, clear baseline num new value
                BaselinePanel.Style["display"] = "none";
                DxTotalNumTumorsBaseline.Value = string.Empty;
                // show no baseline panel
                FollowUpPanel.Style.Remove("display");
                ClinicalImpressionPanel.Style.Remove("display");
            }

            // Populate fields when populating form
            this.OnPopulateDxImagingField(diagnosticId);
        }

        /// <summary>
        /// Invokes event which signals DxImageFinding records to bind to relevent fields
        /// </summary>
        /// <param name="diagnosticId"></param>
        protected void OnPopulateDxImagingField(int diagnosticId)
        {
            this.PopulateDxImagingField(diagnosticId);
        }

        /// <summary>
        /// Locates the basic scan record
        /// </summary>
        /// <param name="diagnosticId"></param>
        /// <returns></returns>
        private DataRow FindDxBoneRecord(int diagnosticId)
        {
            string expr = string.Format(ImageFinding.DiagnosticId + " = {0} AND " + ImageFinding.ImgFindSubsite + " IS NULL AND " + ImageFinding.ImgFindSide + " IS NULL AND " + ImageFinding.ImgFindAP + " IS NULL", diagnosticId);
            return FindDxBoneRecord(diagnosticId, expr);
        }

        /// <summary>
        /// Locates an ImageFinding record with basic scan info, such as site and subsite, but not particulars such as Side and AP
        /// </summary>
        /// <param name="diagnosticId"></param>
        /// <param name="imgFindSubsite"></param>
        /// <returns></returns>
        private DataRow FindDxBoneRecordBasic(int diagnosticId, string imgFindSubsite)
        {
            string selectExpr = string.Format(ImageFinding.DiagnosticId + " = {0} AND " + ImageFinding.ImgFindSite + " = '{1}' AND " + ImageFinding.ImgFindSubsite + " = '{2}' AND " + ImageFinding.ImgFindSide + " IS NULL AND " + ImageFinding.ImgFindAP + " IS NULL", diagnosticId, ImageTypes[0], imgFindSubsite);
            return FindDxBoneRecord(diagnosticId, selectExpr);
        }

        /// <summary>
        /// Locates a specfic DxImageFinding record based on side, subsite and AP
        /// </summary>
        /// <param name="diagnosticId"></param>
        /// <param name="view"></param>
        /// <param name="side"></param>
        /// <param name="subSite"></param>
        /// <returns></returns>
        private DataRow FindDxBoneRecord(int diagnosticId, string view, string side, string subSite)
        {
            string expr = ImageFinding.DiagnosticId + " = {0} AND " + ImageFinding.ImgFindAP + " = '{1}' AND " + ImageFinding.ImgFindSide + " = '{2}' AND " + ImageFinding.ImgFindSubsite + " = '{3}' AND " + ImageFinding.ImgFindNew + " IS NOT NULL";
            string selectExpr = string.Format(expr, diagnosticId, view, side, subSite);
            return FindDxBoneRecord(diagnosticId, selectExpr);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="diagnosticId"></param>
        /// <param name="selectExpr"></param>
        /// <returns></returns>
        private DataRow FindDxBoneRecord(int diagnosticId, string selectExpr)
        {
            DataRow[] foundRecords = BoneDxImageFindings.Table.Select(selectExpr);
            if (foundRecords.Length > 0)
            {
                return foundRecords[0];
            }
            else
            {
                return null;
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void SaveClick(object sender, EventArgs e)
        {
            // Save Diagnostic Record
            Diagnostic biz = new Diagnostic();
            RelatedRecord relatedDiagnostic = new RelatedRecord();
            // load existing record
            if (!IsNew)
            {
                biz.Get(DiagnosticId);
                // load exisiting related diagnostic (if any)
                var relatedDiagnostics = Caisis.Controller.RelatedRecordController.GetRelatedRecords(biz.TableName, DiagnosticId, biz.TableName);
                if (relatedDiagnostics.Count() > 0)
                {
                    // load related diagnostic
                    relatedDiagnostic = relatedDiagnostics.First();
                }
            }

            // set biz fields from control fields
            CICHelper.SetBOValues(this.Controls, biz, (int.Parse(BaseDecryptedPatientId)));
            // special cases, manual setting of biz fields
                        
            // handle baseline logic
            if (ImgBaseline.Checked)
            {
                // use total num from baseline panel
                biz[Diagnostic.ImgBaseline] = ImgBaseline.Value;
                // !!! baseline total number will be stored in new tumors
                biz[Diagnostic.DxNumNewTumors] = DxTotalNumTumorsBaseline.Value;
                //biz[Diagnostic.DxTotalNumTumors] = string.Empty;
            }
            else
            {
                // use total num from non baseline panel
                biz[Diagnostic.ImgBaseline] = ImgBaseline.Value;
                biz[Diagnostic.DxTotalNumTumors] = DxTotalNumTumorsFollowUp.Value;
            }
            // set tracer field       
            biz[Diagnostic.DxTracer] = TracerUptake.Value;

            // finally save diagnostic and child findings
            biz.Save();
            int diagnosticId = (int)biz[Diagnostic.DiagnosticId];
            // Save DxImageFindings
            this.SaveDxImaging(diagnosticId);

            // important, related record must be created after update
            // SPECIAL CASE: for current diagnostic create related record for capturing compared to scan for follow up
            if (PrevScans.SelectedIndex > -1 && !string.IsNullOrEmpty(PrevScans.SelectedValue))
            {
                int relatedDiagnosticId = int.Parse(PrevScans.SelectedValue);
                // if no realted record created, insert
                if (relatedDiagnostic.IsEmpty)
                {
                    relatedDiagnostic = Caisis.Controller.RelatedRecordController.CreateRelatedRecord(biz.TableName, diagnosticId, biz.TableName, relatedDiagnosticId);
                }
                // otherwise update diagnostic id in exising record
                else
                {
                    // if current related diag id != current diag id, update table
                    if (relatedDiagnostic[RelatedRecord.DestPrimaryKey].ToString() != relatedDiagnosticId.ToString())
                    {
                        relatedDiagnostic[RelatedRecord.DestPrimaryKey] = relatedDiagnosticId;
                        relatedDiagnostic.Save();
                    }
                }
            }
            // if no value selected, delete existing RELATED record (if any)
            else if (!relatedDiagnostic.IsEmpty)
            {
                int relatedRecordId = (int)relatedDiagnostic[relatedDiagnostic.PrimaryKeyName];
                relatedDiagnostic.Delete(relatedRecordId);
            }

            // Re-populate form with new request
            ReloadPage(diagnosticId.ToString());
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="diagnosticId"></param>
        private void SaveDxImaging(int diagnosticId)
        {
            //var q = from c in CICHelper.GetCaisisInputControls(this)
            //        where (c as Control).ID.Contains("_Check") && (c as CaisisCheckBox).Checked
            //        select c.Value;
            //string selectedSubSites = string.Join(",", q.ToArray());
            // iterate through dirty fields which represent each distinct view/side combination and update with parent key

            // invoke event handlers with diagnosticId
            foreach (DxImageFindingEvent updateEvent in fieldToUpdateMap.Values)
            {
                updateEvent(diagnosticId);
            }
            fieldToUpdateMap.Clear();
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="diagnosticId"></param>
        private void ReloadPage(string diagnosticId)
        {
            string url = GetQueryString("PatientImagingBone.aspx") + "&diagnosticId=" + diagnosticId;
            Response.Redirect(url);
        }

        /// <summary>
        /// Gets a start and end date filter for Diagnostics
        /// </summary>
        /// <returns></returns>
        private KeyValuePair<DateTime?, DateTime?> GetDiagnosticDateRange()
        {
            PatientProtocolController ppc = new PatientProtocolController(int.Parse(PatientProtocolId));
            DateTime? startDate = ppc.GetStatusDate(PatientProtocolController.OnStudy);
            // 90 days before on study
            if (startDate.HasValue)
                startDate = startDate.Value.AddDays(-90);
            DateTime? endDate = ppc.GetStatusDate(PatientProtocolController.OffStudy);
            return new KeyValuePair<DateTime?, DateTime?>(startDate, endDate); ;
        }
    }
}