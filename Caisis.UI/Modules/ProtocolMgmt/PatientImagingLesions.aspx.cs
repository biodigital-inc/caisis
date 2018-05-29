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
using Caisis.Extensions;
using Caisis.DataAccess;
using Caisis.UI.Core.Classes;
using Caisis.UI.Core.Classes.CustomControls;

namespace Caisis.UI.Modules.ProtocolMgmt
{
    public partial class PatientImagingLesions : ProtocolMgmtPatientBasePage
    {
        private static readonly string PET_SCAN_LOCATION_BONE = "Total Bone Lesions";
        private static readonly string PET_SCAN_LOCATION_SOFT_TISSUE = "Total Soft Tissue Lesions";
        private static readonly string PET_SCAN_LOCATION_NYMPH_NODE = "Total Lymph Node Lesions";

        private List<RepeaterItem> dirtyDxImageFindings = new List<RepeaterItem>();
        private List<RepeaterItem> dirtyDiagnostics = new List<RepeaterItem>();

        private DataView diagnosticRecords;
        private DataView DiagnosticRecords
        {
            get
            {
                if (diagnosticRecords == null)
                {
                    DiagnosticDa da = new DiagnosticDa();
                    diagnosticRecords = da.GetDiagnosticsByType(int.Parse(BaseDecryptedPatientId), ImageTypes).DefaultView;
                    diagnosticRecords.Sort = Diagnostic.ImgBaseline + " DESC, " + Diagnostic.DxDate + " ASC";
                    List<string> filters = new List<string>();
                    // filter by date
                    var dateRange = GetDiagnosticDateRange();
                    if (dateRange.Key.HasValue)
                        filters.Add(string.Format("DxDate >= #{0:d}#", dateRange.Key));
                    if (dateRange.Value.HasValue)
                        filters.Add(string.Format("DxDate <= #{0:d}#", dateRange.Value));
                    // optional filters
                    if (ImageType == "PET")
                    {
                        // determine tracer filter
                        string tracer = Request.QueryString["tracer"];
                        if (!string.IsNullOrEmpty(tracer))
                        {
                            int relatedBit = tracer == "1" ? 1 : 0;
                            string filterExpr = string.Format("ISNULL({0}, 0) = {1}", Diagnostic.DxTracer, relatedBit);
                            filters.Add(filterExpr);
                        }
                    }
                    diagnosticRecords.RowFilter = string.Join(" AND ", filters.ToArray());
                }
                return diagnosticRecords;
            }
        }

        private DataView dxImagingRows;

        /// <summary>
        /// Gets the Rows filtered by Imaging Type
        /// </summary>
        private DataView DxImagingRows
        {
            get
            {
                if (dxImagingRows == null)
                {
                    int patientId = int.Parse(BaseDecryptedPatientId);
                    DiagnosticDa da = new DiagnosticDa();
                    DataTable baseImagingTable = da.GetDxImagesByType(patientId, ImageTypes);
                    baseImagingTable.Columns.Add(new DataColumn("ColSortOrder", typeof(Int32), "ISNULL(" + ImageFinding.DxImageFindingId + "," + int.MaxValue + ")"));
                    dxImagingRows = baseImagingTable.DefaultView;
                    dxImagingRows.Sort = "ColSortOrder ASC";
                }
                return dxImagingRows;
            }
        }

        private DataView dxImgGroups;
        private DataView DxImgGroups
        {
            get
            {
                if (dxImgGroups == null)
                {
                    if (!string.IsNullOrEmpty(ImageType))
                    {
                        int patientId = int.Parse(BaseDecryptedPatientId);
                        DiagnosticDa da = new DiagnosticDa();
                        dxImgGroups = da.GetDxImagesByGroupNum(patientId, ImageTypes).DefaultView;
                    }
                }
                return dxImgGroups;
            }
        }

        /// <summary>
        /// 
        /// </summary>
        protected string ImageType
        {
            get
            {
                return Request.QueryString["type"];
            }
        }

        /// <summary>
        /// 
        /// </summary>
        protected string[] ImageTypes
        {
            get
            {
                string[] types = new string[0];
                if (!string.IsNullOrEmpty(ImageType))
                {
                    types = ImageType.Split(",".ToCharArray(), StringSplitOptions.RemoveEmptyEntries);
                }
                return types;
            }
        }

        private string mainDataEntryField;
        private string secondaryDataEntryField;
        
        /// <summary>
        /// Gets the BusinessObject field for the main data entry field on matrix interface.
        /// </summary>
        protected string MainDataEntryField
        {
            get
            {
                return mainDataEntryField;
            }
        }

        protected string SecondaryDataEntryField
        {
            get
            {
                return secondaryDataEntryField;
            }
        }

        public PatientImagingLesions()
            : base()
        {
            this.Init += new EventHandler(InitVariables);
        }

        protected void InitVariables(object sender, EventArgs e)
        {
            // Set column name for main data entry field
            mainDataEntryField = Request.QueryString["mainDataEntryField"];
            if (string.IsNullOrEmpty(mainDataEntryField))
            {
                switch (ImageType)
                {
                    case ("CT,MRI"):
                        mainDataEntryField = ImageFinding.ImgFindLength;
                        secondaryDataEntryField = ImageFinding.ImgFindWidth;
                        break;
                    case ("PET"):
                        mainDataEntryField = ImageFinding.ImgFindSUV;
                        break;
                    default:
                        mainDataEntryField = ImageFinding.ImgFindLength;
                        break;
                }
            }
            // validate main data entry field
            else
            {
                if (FieldSelectionsList.Items.FindByValue(mainDataEntryField) == null)
                {
                    mainDataEntryField = FieldSelectionsList.SelectedValue;
                }
            }

            // Default Values
            if (!Page.IsPostBack)
            {
                // NEW DIAGNOSTIC
                Control petFields = NewDiagnosticPanel.FindControl("PET_Fields");
                Control ctMRIFields = NewDiagnosticPanel.FindControl("CTMRI_Fields");
                Control shareFields = NewDiagnosticPanel.FindControl("SHARED_Fields");
                Control mainFields = ImageType == "PET" ? petFields : ctMRIFields;

                // build compared to
                BuildImgCompared(mainFields, null);

                // set init visibility
                ctMRIFields.Visible = ctMRIFields == mainFields;
                petFields.Visible = petFields == mainFields;

                string defaultDateText = DateTime.Today.ToShortDateString();
                FindInputControl(mainFields, Diagnostic.DxDate).Value = defaultDateText;
                FindInputControl(mainFields, Diagnostic.DxDateText).Value = defaultDateText;
                FindInputControl(mainFields, Diagnostic.DxType).Value = ImageTypes[0] + " Scan";
                FieldSelectionsList.SelectedValue = mainDataEntryField;
                // NEW DXIMAGEFINDING
                Control dx_petFields = NewDxImageFindingPanel.FindControl("DX_PET_Fields");
                Control dx_ctMRIFields = NewDxImageFindingPanel.FindControl("DX_CTMRI_Fields");
                Control dx_shareFields = NewDxImageFindingPanel.FindControl("DX_SHARED_Fields");
                Control dx_mainFields = ImageType == "PET" ? dx_petFields : dx_ctMRIFields;

                dx_ctMRIFields.Visible = dx_ctMRIFields == dx_mainFields;
                dx_petFields.Visible = dx_petFields == dx_mainFields;

            }
        }

        protected override void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                BuildMatrix();
            }
        }

        /// <summary>
        /// Builds the matrix representing Diagnostic and DxImageFinding Records based on DxType
        /// </summary>
        private void BuildMatrix()
        {
            if (!string.IsNullOrEmpty(ImageType))
            {
                // Bind Header Columns
                DiagnosticsHeaderRptr.DataSource = DiagnosticRecords;
                DiagnosticsHeaderRptr.DataBind();

                // Bind Main Matrix Spacer Headers
                DxImageFindingGroupRowsHeaderRptr.DataSource = DiagnosticRecords;
                DxImageFindingGroupRowsHeaderRptr.DataBind();

                // Bind Diagnostic List for Adding new Legion
                CTMRI_ExistingDiagnostics.DataSource = DiagnosticRecords;
                CTMRI_ExistingDiagnostics.DataBind();
                PET_ExistingDiagnostics.DataSource = DiagnosticRecords;
                PET_ExistingDiagnostics.DataBind();

                // Build Left Rows by GroupNum
                DxImageFindingsGroupsRptr.DataSource = DxImgGroups;
                DxImageFindingsGroupsRptr.DataBind();

                // Build Main Matrix Rows by GroupNum
                DxImageFindingGroupRowsRptr.DataSource = DxImgGroups;
                DxImageFindingGroupRowsRptr.DataBind();

                // Can't add Lesion without exisiting Diagnostic
                AddNewLesionBtn.Visible = DiagnosticRecords.Count > 0;

                // build default PET grid fields
                ExtendedGridView hottestGrid = DxGrid1;
                ExtendedGridView newGrid = DxGrid2;
                DataView childFindings = new BusinessObject[] { }.AsDataView("DxImageFindings");

                hottestGrid.DataSource = childFindings;
                hottestGrid.DataBind();

                newGrid.DataSource = new DataView(childFindings.Table);
                newGrid.DataBind();
            }
        }

        private void BuildImgCompared(Control container, int? diagnosticId)
        {
            CaisisSelect imgCompared = FindInputControl(container, Diagnostic.ImgCompared) as CaisisSelect;
            if (imgCompared != null)
            {
                int patientId = int.Parse(BaseDecryptedPatientId);
                var allDiagnostics = new DiagnosticDa().GetDiagnosticsByType(patientId, ImageTypes).DefaultView;
                var prevDiagnostics = from diagnostic in allDiagnostics.Table.AsEnumerable()
                                      let rowDiagnosticId = (int)diagnostic[Diagnostic.DiagnosticId]
                                      let dxType = diagnostic[Diagnostic.DxType]
                                      let dxDate = diagnostic[Diagnostic.DxDate]
                                      // exclude current ?
                                      where !diagnosticId.HasValue || diagnosticId.Value != rowDiagnosticId
                                      // display text as "Bone Scan 01/26/2010" and value = diag id
                                      let displayText = string.Format("{0} {1:d}", dxType, dxDate)
                                      let sortDate = !diagnostic.IsNull(Diagnostic.DxDate) ? (DateTime)dxDate : DateTime.MaxValue
                                      orderby sortDate ascending
                                      select new
                                      {
                                          DiagnosticText = displayText,
                                          DiagnosticId = rowDiagnosticId
                                      };
                // build dropdown
                imgCompared.DataSource = prevDiagnostics;
                imgCompared.DataBind();
                // SPECIAL CASE:  for current diagnostic, check if there is a related record, used as compare to for follow up scans
                if (diagnosticId.HasValue)
                {
                    // get related diagnostic id
                    var relatedDiagnostics = Caisis.Controller.RelatedRecordController.GetRelatedRecords("Diagnostics", diagnosticId.Value, "Diagnostics");
                    // set related diagnostic
                    if (relatedDiagnostics.Count() > 0)
                    {
                        int relatedDiagnosticId = (int)relatedDiagnostics.First()[RelatedRecord.DestPrimaryKey];
                        PageUtil.SelectDropDownItem(imgCompared, relatedDiagnosticId.ToString());
                    }
                }
            }
        }

        #region RPTR DataBinding

        // TODO: move methods into shared class

        protected ICaisisInputControl FindInputControl(Control container, string fieldName)
        {
            var inputs = from input in CICHelper.GetCaisisInputControls(container)
                         where !string.IsNullOrEmpty(input.Field) && input.Field == fieldName
                         select input;
            return inputs.FirstOrDefault();
        }

        protected string GetInputControlClientId(Control container, string fieldName)
        {
            Control petFields = container.FindControl("PET_Fields");
            Control ctMRIFields = container.FindControl("CTMRI_Fields");
            Control searchControl = ImageType == "PET" ? petFields : ctMRIFields;
            var input = FindInputControl(container, fieldName);
            if (input != null)
            {
                return (input as Control).ClientID;
            }
            else
            {
                return string.Empty;
            }
        }

        private void SetInputFieldValues(Control container, DataRow dataRow)
        {
            IEnumerable<ICaisisInputControl> inputs = CICHelper.GetCaisisInputControls(container);
            foreach (var input in inputs)
            {
                if (dataRow.Table.Columns.Contains(input.Field))
                {
                    input.Value = dataRow[input.Field].ToString();
                }
            }
        }

        /// <summary>
        /// Build columns for each Diagnostic record in each GroupNum row
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void BuildGroupRowColumns(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.AlternatingItem || e.Item.ItemType == ListItemType.Item)
            {
                Repeater rowCells = e.Item.FindControl("ImageFindingsRowCellsRptr") as Repeater;
                rowCells.DataSource = DiagnosticRecords;
                rowCells.DataBind();
            }

        }

        /// <summary>
        /// Add event handler to mark "dirty" Diagnostic records, which need updating
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void TrackDirtyDiagnoticFields(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.AlternatingItem || e.Item.ItemType == ListItemType.Item)
            {
                var inputFields = CICHelper.GetCaisisInputControls(e.Item);
                foreach (ICaisisInputControl inputField in inputFields)
                {
                    inputField.ValueChanged += MarkDiagnosticDirty;
                }
            }
        }

        protected void TrackDirtyImageFindingFields(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.AlternatingItem || e.Item.ItemType == ListItemType.Item)
            {
                var inputFields = CICHelper.GetCaisisInputControls(e.Item);
                foreach (ICaisisInputControl inputField in inputFields)
                {
                    inputField.ValueChanged += MarkDxImageFindingDirty;
                }
            }
        }

        protected void SetScanSpecificFields(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.AlternatingItem || e.Item.ItemType == ListItemType.Item)
            {
                int diagnosticId = (int)DataBinder.Eval(e.Item.DataItem, ImageFinding.DiagnosticId);

                Control petFields = e.Item.FindControl("PET_Fields");
                Control ctMRIFields = e.Item.FindControl("CTMRI_Fields");
                Control shareFields = e.Item.FindControl("SHARED_Fields");
                Control mainFields = ImageType == "PET" ? petFields : ctMRIFields;

                // build Compared To
                BuildImgCompared(mainFields, diagnosticId);

                // poulate main fields
                IEnumerable<ICaisisInputControl> inputFields = CICHelper.GetCaisisInputControls(shareFields).Concat(CICHelper.GetCaisisInputControls(mainFields));
                inputFields.Where(f => BOL.BusinessObject.HasField("Diagnostics", f.Field)).ForEach(f => f.Value = DataBinder.Eval(e.Item.DataItem, f.Field).ToString());

                if (ImageType == "PET")
                {
                    petFields.Visible = true;
                    ctMRIFields.Visible = false;
                    // PET specific interface, populate special DxImageFinding records used for capturing special values
                    
                    // step 1: filter findings by special status
                    var specialFindings = from row in DxImagingRows.Table.AsEnumerable()
                                          let imgDiagId = (int)row[ImageFinding.DiagnosticId]
                                          where imgDiagId == diagnosticId
                                          let imgFindStatus = row[ImageFinding.ImgFindStatus].ToString()
                                          select new 
                                          {
                                              ImgFindStatus = imgFindStatus,
                                              DataRow = row
                                          };                                         
                    if (specialFindings.Count() > 0)
                    {
                        // set bone finding
                        Control boneFields = petFields.FindControl("PET_Fields_Finding0");
                        var boneData = specialFindings.Where(a => a.ImgFindStatus.Equals(PET_SCAN_LOCATION_BONE, StringComparison.OrdinalIgnoreCase));
                        if (boneData.Count() > 0)
                            SetInputFieldValues(boneFields, boneData.First().DataRow);

                        // set soft tissue finding
                        Control softTissueFields = petFields.FindControl("PET_Fields_Finding1");
                        var softTissueData = specialFindings.Where(a => a.ImgFindStatus.Equals(PET_SCAN_LOCATION_SOFT_TISSUE, StringComparison.OrdinalIgnoreCase));
                        if (softTissueData.Count() > 0)
                            SetInputFieldValues(softTissueFields, softTissueData.First().DataRow);

                        // set lynph node finding
                        Control lymphNodeFields = petFields.FindControl("PET_Fields_Finding2");
                        var lymphNodeData = specialFindings.Where(a => a.ImgFindStatus.Equals(PET_SCAN_LOCATION_NYMPH_NODE, StringComparison.OrdinalIgnoreCase));
                        if (lymphNodeData.Count() > 0)
                            SetInputFieldValues(lymphNodeFields, lymphNodeData.First().DataRow);

                    }

                    // set baseline script
                    var baselineField = FindInputControl(petFields, Diagnostic.ImgBaseline) as CheckBox;
                    if(baselineField != null)
                    {
                        baselineField.Attributes["onclick"] = "toggleBaselineFields('EditDiagnostic_" + e.Item.ItemIndex + "_Baseline',this.checked);";
                    }
                }
                else
                {
                    petFields.Visible = false;
                    ctMRIFields.Visible = true;
                }
            }
        }

        /// <summary>
        /// Sets the label for most recent DxImageFinding record per GroupNum
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void SetGroupNumTitles(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.AlternatingItem || e.Item.ItemType == ListItemType.Item)
            {
                string groupNum = DataBinder.Eval(e.Item.DataItem, ImageFinding.ImgFindGroupNum).ToString();
                Image imgFindTarget = e.Item.FindControl(ImageFinding.ImgFindTarget) as Image;
                Label imgFindSite = e.Item.FindControl(ImageFinding.ImgFindSite) as Label;
                Label imgFindSubsite = e.Item.FindControl(ImageFinding.ImgFindSubsite) as Label;
                DxImagingRows.RowFilter = ImageFinding.ImgFindGroupNum + " = " + groupNum;
                if (DxImagingRows.Count > 0)
                {
                    string targetValue = DxImagingRows[0][ImageFinding.ImgFindTarget].ToString();
                    imgFindTarget.Visible = targetValue == "yes";
                    imgFindSite.Text = DxImagingRows[0][ImageFinding.ImgFindSite].ToString();
                    imgFindSubsite.Text = DxImagingRows[0][ImageFinding.ImgFindSubsite].ToString();
                }
                else
                {
                    imgFindTarget.Visible = false;
                }
            }
        }

        /// <summary>
        /// Populates each cell of the matrix with relevent DxImaging record
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void PopulateImagingCell(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.AlternatingItem || e.Item.ItemType == ListItemType.Item)
            {
                // get coordinates of data entry cell
                int colIndex = e.Item.ItemIndex;
                int rowIndex = (e.Item.NamingContainer.NamingContainer as RepeaterItem).ItemIndex;

                // determine which set of DxImageFinding fields to display
                Control petFields = e.Item.FindControl("PET_Fields");
                Control ctMRIFields = e.Item.FindControl("CTMRI_Fields");
                Control dataEntryFields;
                if (ImageType == "PET")
                {
                    dataEntryFields = petFields;
                    petFields.Visible = true;
                    ctMRIFields.Visible = false;
                }
                else
                {
                    dataEntryFields = ctMRIFields;
                    petFields.Visible = false;
                    ctMRIFields.Visible = true;
                }

                // determine if cell maps to existing record
                List<ICaisisInputControl> iCICList = CICHelper.GetCaisisInputControls(dataEntryFields); //PageUtil.GetCaisisInputControlsInContainer(e.Item);
                string diagnosticId = DataBinder.Eval(e.Item.DataItem, ImageFinding.DiagnosticId).ToString();
                string imgFindGroupNum = DataBinder.Eval((e.Item.NamingContainer.NamingContainer as RepeaterItem).DataItem, ImageFinding.ImgFindGroupNum).ToString();
                CaisisHidden imageFindingId = e.Item.FindControl("ImageFindingId") as CaisisHidden;
                CaisisHidden diagnosticIdField = DiagnosticsHeaderRptr.Items[colIndex].FindControl("DiagnosticIdField") as CaisisHidden;
                CaisisHidden imgFindGroupNumField = e.Item.FindControl("ImgFindGroupNum") as CaisisHidden;
                imgFindGroupNumField.Value = imgFindGroupNum;

                PlaceHolder ctMRIHeader = e.Item.FindControl("CTMRI_TimelineHeader") as PlaceHolder;
                TextBox mainDataEntryFieldLabel = e.Item.FindControl("MainDataEntryFieldLabel") as TextBox;
                TextBox secondaryDataEntryFieldLabel = e.Item.FindControl("SecondaryDataEntryFieldLabel") as TextBox;
                // set special header: sd/ld
                bool hasSpecialHeader = !string.IsNullOrEmpty(SecondaryDataEntryField);
                ctMRIHeader.Visible = hasSpecialHeader;
                secondaryDataEntryFieldLabel.Visible = hasSpecialHeader;

                string searchForImage = Diagnostic.DiagnosticId + " = " + diagnosticId + " AND " + ImageFinding.ImgFindGroupNum + " = " + imgFindGroupNum;
                DataRow[] foundRecords = DxImagingRows.Table.Select(searchForImage);
                // if a record is found, set imaging id for update
                if (foundRecords.Length > 0)
                {
                    DataRow foundRecord = foundRecords[0];
                    // set pri key fields for tracking updates
                    imageFindingId.Value = foundRecord[ImageFinding.DxImageFindingId].ToString();
                    // set displayable field value
                    string mainDataEntryFieldValue = foundRecord[MainDataEntryField].ToString();
                    if (!string.IsNullOrEmpty(mainDataEntryFieldValue))
                    {
                        mainDataEntryFieldLabel.Text = mainDataEntryFieldValue;
                    }
                    if (!string.IsNullOrEmpty(SecondaryDataEntryField) && secondaryDataEntryFieldLabel != null)
                    {
                        string secondaryDataEntryFieldValue = foundRecord[SecondaryDataEntryField].ToString();
                        if (!string.IsNullOrEmpty(secondaryDataEntryFieldValue))
                        {
                            secondaryDataEntryFieldLabel.Text = secondaryDataEntryFieldValue;
                        }
                    }
                    // set data entry fields from db record
                    foreach (ICaisisInputControl iCIC in iCICList)
                    {
                        iCIC.Value = foundRecord[iCIC.Field].ToString();
                    }
                }
                // if no record found for dximagefinding, new record, and default fields to groupnum defaults
                else
                {
                    DxImagingRows.RowFilter = ImageFinding.ImgFindGroupNum + " = " + imgFindGroupNum;
                    if (DxImagingRows.Count > 0)
                    {
                        List<string> defaultFields = new List<string>(new string[] { ImageFinding.ImgFindTarget, ImageFinding.ImgFindSite, ImageFinding.ImgFindSubsite });
                        foreach (ICaisisInputControl iCIC in iCICList)
                        {
                            // only default values for these fields
                            if (defaultFields.Contains(iCIC.Field))
                            {
                                iCIC.Value = DxImagingRows[0][iCIC.Field].ToString();
                            }
                        }
                    }
                }
                foreach (ICaisisInputControl iCIC in iCICList)
                {
                    if (iCIC.Field == MainDataEntryField)
                    {
                        iCIC.CssClass = "MainDataEntryField";
                    }
                    else if (iCIC.Field == SecondaryDataEntryField)
                    {
                        iCIC.CssClass = "SecondaryDataEntryField";
                    }
                }
            }
        }
        #endregion

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void ChangeImageField(object sender, EventArgs e)
        {
            string imagingField = FieldSelectionsList.SelectedValue;
            ReloadImaging(imagingField);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="src"></param>
        /// <param name="emptyArgs"></param>
        protected void MarkDiagnosticDirty(ICaisisInputControl src, EventArgs emptyArgs)
        {
            MarkDirtyListItem(src, dirtyDiagnostics);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="src"></param>
        /// <param name="emptyArgs"></param>
        protected void MarkDxImageFindingDirty(ICaisisInputControl src, EventArgs emptyArgs)
        {
            MarkDirtyListItem(src, dirtyDxImageFindings);
        }

        /// <summary>
        /// Gets if the current diagnostic record is the BASELINE scan
        /// </summary>
        /// <param name="dataItem"></param>
        /// <returns></returns>
        protected bool IsBaselineColumn(object dataItem)
        {
            string baseline = DataBinder.Eval(dataItem, Diagnostic.ImgBaseline).ToString();
            if (!string.IsNullOrEmpty(baseline))
                return PageUtil.IsTrueString(baseline);
            else
                return false;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="src"></param>
        /// <param name="dirtyItems"></param>
        private void MarkDirtyListItem(ICaisisInputControl src, List<RepeaterItem> dirtyItems)
        {
            // locate container repeater item
            RepeaterItem item = (src as Control).NamingContainer as RepeaterItem;
            if (!dirtyItems.Contains(item))
            {
                dirtyItems.Add(item);
            }
        }

        /// <summary>
        /// Adds a new Diagnostic record
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void AddNewDiagnosticClick(object sender, EventArgs e)
        {
            // add new diagnostic
            int patientId = int.Parse(BaseDecryptedPatientId);
            UpdateDiagnosticsByContainer(NewDiagnosticPanel, patientId);

            // Save Matrix
            MainSaveBtnClick(sender, e);
        }

        /// <summary>
        /// Add a new Lesion (DxImageFindings) record
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void AddLesionClick(object sender, EventArgs e)
        {
            // Get field values for add adding new lesion
            Control petFields = NewDxImageFindingPanel.FindControl("DX_PET_Fields");
            Control ctMRIFields = NewDxImageFindingPanel.FindControl("DX_CTMRI_Fields");
            Control shareFields = NewDxImageFindingPanel.FindControl("DX_SHARED_Fields");
            Control mainFields = ImageType == "PET" ? petFields : ctMRIFields;
            ICaisisInputControl diagnosticField = FindInputControl(mainFields, ImageFinding.DiagnosticId);

            string diagnosticId = diagnosticField.Value;
            if (!string.IsNullOrEmpty(diagnosticId))
            {
                int diagId = int.Parse(diagnosticId);
                ImageFinding newFinding = new ImageFinding();
                newFinding[ImageFinding.DiagnosticId] = diagId;
                CICHelper.SetBOValues(mainFields.Controls, newFinding, diagId);
                // special fields
                string imgFindTarget = FindInputControl(mainFields, ImageFinding.ImgFindTarget).Value;
                int imgFindGroupNum = GetNextGroupNum();
                newFinding[ImageFinding.ImgFindGroupNum] = imgFindGroupNum;
                newFinding[ImageFinding.ImgFindTarget] = imgFindTarget;
                newFinding.Save();
            }
            // Save Matrix
            MainSaveBtnClick(sender, e);
        }

        /// <summary>
        /// Saves all the lesions on the page which are "dirty", i.e., values modified during postback
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void MainSaveBtnClick(object sender, EventArgs e)
        {
            UpdateDiagnostics();
            UpdateDxImageFindings();
            ReloadImaging(MainDataEntryField);
        }

        /// <summary>
        /// Inserts/Updates the Diagnostic record in the specific container, i.e., RepeaterItem, Control, etc...
        /// </summary>
        /// <param name="fieldsContainer"></param>
        /// <param name="patientId"></param>
        /// <returns></returns>
        private Diagnostic UpdateDiagnosticsByContainer(Control fieldsContainer, int patientId)
        {
            Control petFields = fieldsContainer.FindControl("PET_Fields");
            Control ctMRIFields = fieldsContainer.FindControl("CTMRI_Fields");
            Control shareFields = fieldsContainer.FindControl("SHARED_Fields");
            Control mainFields = ImageType == "PET" ? petFields : ctMRIFields;

            CaisisHidden diagIdField = fieldsContainer.FindControl("DiagnosticIdField") as CaisisHidden;
            Diagnostic biz = new Diagnostic();
            int? diagnosticId = null;
            if (!string.IsNullOrEmpty(diagIdField.Value))
            {
                diagnosticId = int.Parse(diagIdField.Value);
                biz.Get(diagnosticId.Value);
            }            
            // set main fields
            CICHelper.SetBOValues(shareFields.Controls, biz, patientId);
            CICHelper.SetBOValues(mainFields.Controls, biz, patientId);
            biz.Save();
            // update key
            diagnosticId = (int)biz[Diagnostic.DiagnosticId];
            diagIdField.Value = diagnosticId.ToString();

            // special case: updated/insert PET image findings
            if (mainFields == petFields && diagnosticId.HasValue)
            {
                // containers are named by index
                Control boneFields = petFields.FindControl("PET_Fields_Finding0");
                Control softTissueFields = petFields.FindControl("PET_Fields_Finding1");
                Control lymphNodeFields = petFields.FindControl("PET_Fields_Finding2");

                // generic insert/update logic
                foreach (Control petFindingContainer in new Control[] { boneFields, softTissueFields, lymphNodeFields })
                {
                    ImageFinding findingBiz = new ImageFinding();
                    ICaisisInputControl findingKeyField = FindInputControl(petFindingContainer, ImageFinding.DxImageFindingId);
                    // only continue if fields have values
                    bool fieldsHaveData = (from input in CICHelper.GetCaisisInputControls(petFindingContainer)
                                           where input != findingKeyField && !string.IsNullOrEmpty(input.Value)
                                           select input).Count() > 0;
                    // update
                    if (!string.IsNullOrEmpty(findingKeyField.Value))
                    {
                        int dxImageFindingId = int.Parse(findingKeyField.Value);
                        findingBiz.Get(dxImageFindingId);
                    }
                    // insert 
                    else if (fieldsHaveData)
                    {
                        // !important, mark special DxImageFinding status for later retrieval (bone/soft tissue)
                        if (petFindingContainer == boneFields)
                            findingBiz[ImageFinding.ImgFindStatus] = PET_SCAN_LOCATION_BONE;
                        else if (petFindingContainer == softTissueFields)
                            findingBiz[ImageFinding.ImgFindStatus] = PET_SCAN_LOCATION_SOFT_TISSUE;
                        else if (petFindingContainer == lymphNodeFields)
                            findingBiz[ImageFinding.ImgFindStatus] = PET_SCAN_LOCATION_NYMPH_NODE;
                    }
                    // if field have no data on new records, ignore, do not insert
                    else
                    {
                        continue;
                    }
                    // set fields and update
                    CICHelper.SetBOValues(petFindingContainer.Controls, findingBiz, diagnosticId.Value);
                    findingBiz.Save();
                    findingKeyField.Value = findingBiz[ImageFinding.DxImageFindingId].ToString();
                }

                // udpate/insert special findings datagrids
                ExtendedGridView hottestGrid = petFields.FindControl("DxGrid1") as ExtendedGridView;
                ExtendedGridView newGrid = petFields.FindControl("DxGrid2") as ExtendedGridView;
                if (hottestGrid != null && newGrid != null)
                {
                    string type = Request.Form["NewLesionsGroup_Type"];
                    // update grids
                    foreach (ExtendedGridView grid in new ExtendedGridView[] { hottestGrid, newGrid })
                    {
                        // special fix, set ImgFindGroupNum
                        foreach (GridViewRow row in grid.Rows)
                        {
                            int groupNum = row.RowIndex + 1;
                            var imgFindGroupField = FindInputControl(row, ImageFinding.ImgFindGroupNum);
                            imgFindGroupField.Value = groupNum.ToString();
                        }
                        if ((grid == hottestGrid && type == "Hottest") || (grid == newGrid && type == "New"))
                        {
                            grid.Save(diagnosticId.Value);
                        }
                        
                    }
                }
            }
            return biz;
        }

        /// <summary>
        /// Updates all "dirty" Diagnostic Rptr items.
        /// </summary>
        private void UpdateDiagnostics()
        {
            int patientId = int.Parse(BaseDecryptedPatientId);
            foreach (RepeaterItem item in dirtyDiagnostics)
            {
                UpdateDiagnosticsByContainer(item, patientId);
            }
            dirtyDiagnostics.Clear();
        }

        /// <summary>
        /// Updates all "dirty" DxImageFinding Rptr items.
        /// </summary>
        private void UpdateDxImageFindings()
        {
            // Iterate through each "dirty" image finding record
            foreach (RepeaterItem item in dirtyDxImageFindings)
            {
                // Locate PriKey Field for ImageFinding
                CaisisHidden imageFindingId = item.FindControl("ImageFindingId") as CaisisHidden;
                // dirtyItems index is same as Diganostic column index, to find diagnosticid
                CaisisHidden diagnosticId = DiagnosticsHeaderRptr.Items[item.ItemIndex].FindControl("DiagnosticIdField") as CaisisHidden;
                // Main Data Entry Field
                Control petFields = item.FindControl("PET_Fields");
                Control ctMRIFields = item.FindControl("CTMRI_Fields");
                Control shareFields = item.FindControl("SHARED_Fields");
                Control mainFields = ImageType == "PET" ? petFields : ctMRIFields;
                CaisisTextBox mainDataEntryField = FindInputControl(mainFields, MainDataEntryField) as CaisisTextBox;

                ImageFinding biz = new ImageFinding();
                // determine if updating
                if (!string.IsNullOrEmpty(imageFindingId.Value))
                {
                    int priKey = int.Parse(imageFindingId.Value);
                    // deleting and go to next item
                    if (string.IsNullOrEmpty(mainDataEntryField.Value))
                    {
                        biz.Delete(priKey);
                        continue;
                    }
                    // updating
                    else
                    {
                        biz.Get(priKey);
                    }
                }
                // Get Parent Key
                int parKey = int.Parse(diagnosticId.Value);
                // Set BusinessObject fields based on controls in data entry cell
                CICHelper.SetBOValues(shareFields.Controls, biz, parKey);
                CICHelper.SetBOValues(mainFields.Controls, biz, parKey);
                // save Image Finding
                biz.Save();
            }
            dirtyDxImageFindings.Clear();
        }

        /// <summary>
        /// Returns the next ImgFindGroupNum based on current type of scan
        /// </summary>
        /// <returns></returns>
        private int GetNextGroupNum()
        {
            DiagnosticDa da = new DiagnosticDa();
            int nextGroupNum = da.GetNextDxImgGroupNum(int.Parse(BaseDecryptedPatientId), ImageTypes);
            return nextGroupNum;
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

        /// <summary>
        /// Reloads the page, which will retrieve fresh information from db
        /// </summary>
        /// <param name="mainDataEntryField"></param>
        private void ReloadImaging(string mainDataEntryField)
        {
            BuildMatrix();
            /*
            var URLParams = PageUtil.GetUrlPairs(Request.Url.Query);
            if (!URLParams.ContainsKey("mainDataEntryField"))
                URLParams.Add("mainDataEntryField", mainDataEntryField);
            else
                URLParams["mainDataEntryField"] = mainDataEntryField;
            string redirectURL = "PatientImagingLesions.aspx?" + PageUtil.CreateUrlPairs(URLParams);
            Response.Redirect(redirectURL, true);
            */
        }
    }
}
