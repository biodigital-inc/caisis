<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PatientSpecimens.aspx.cs"
    Inherits="Caisis.UI.Modules.ProtocolMgmt.PatientSpecimens" %>

<%@ Register TagPrefix="cic" Namespace="Caisis.UI.Core.Classes" %>
<%@ Register TagPrefix="cic" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Patient Specimens</title>
    <link rel="stylesheet" type="text/css" href="../../StyleSheets/GlobalStyles.css" />
    <link rel="stylesheet" type="text/css" href="StyleSheets/ProtocolMgmtStyles.css" />
    <link rel="stylesheet" type="text/css" href="../../StyleSheets/DataAnalysis.css" />
    <script type="text/javascript" src="../../ClientScripts/utilities.js"></script>
    <script type="text/javascript" src="../../ClientScripts/DynamicControls.js"></script>
    <script type="text/javascript" src="../../ClientScripts/jquery.js"></script>
    <script type="text/javascript" src="ProtocolMgmtScripts.js"></script>
    <script type="text/javascript">
        jQuery.noConflict();

        Browser.ResizeElement({ nodeId: "OverflowContainer", heightOffset: 310 });
        Browser.ResizeElement({ nodeId: "CollectionOuterContainer", heightOffset: 350 });

        jQuery(document).ready(function (e) {

            // initalize visit auto ref #s
            initVisitSpecimens(e);

            // special case: tissue events
            if ("<%= QuerySpecimenType %>" == "Tissue") {
                // status checkboxes
                initStatusChecked(e);

                // todo: processing method
                var specimenRows = jQuery("#SpecimensGrid tr:not('.dataGridHeader')");
                var processFields = specimenRows.find("input[name*='SpecimenPreservationType']");
                var refFields = specimenRows.find("input[name*='SpecimenReferenceNumber']");
                // suppress multiple warnings
                var suppressWarning = false;
                processFields.blur(function (e) {
                    var processField = jQuery(this);
                    var index = processFields.index(processField);
                    var refField = refFields.eq(index)
                    var refAutoField = jQuery("#SpecimenReferenceNumber_Auto_" + index);
                    setTimeout(function () {
                        var method = processField.val();
                        if (method == 'FFPE') {
                            var visit = jQuery("#AccessionVisit").find("option:selected").val();
                            var refAutoFieldValue = refAutoField.val();
                            refAutoFieldValue = refAutoFieldValue == "" ? refField.val() : refAutoFieldValue;
                            var prefix = "-" + visit + "-";
                            var ffpeAutoId = refAutoFieldValue.substr(0, refAutoFieldValue.lastIndexOf(prefix)) + prefix + "FFPE";
                            if (ffpeAutoId != "-FFPE")
                                refField.val(ffpeAutoId);
                            // FFPE should be last row
                            if (index == 0 && !suppressWarning) {
                                alert('NOTE: Formalin specimen should be entered as the last entry.');
                                suppressWarning = true;
                                setTimeout(function () { suppressWarning = false; }, 1000);
                            }
                        }
                        // if method is other, fill in value unless non-empty
                        else if (method != "") {
                            var defaultValue = refField[0].defaultValue;
                            var refAutoFieldValue = refAutoField.val();
                            if (defaultValue == "") {
                                refField.val(refAutoFieldValue);
                            }
                            else {
                                refField.val(defaultValue);
                            }
                        }
                    }, 250);
                });
            }
            initCopyTimeFields(e);
            // date validation
            // init date field validation
            var dateFields = ['AccessionDateText'];
            jQuery.each(dateFields, function (index, fieldId) {
                var field = jQuery("#" + fieldId);
                if (field.length > 0) {
                    field.blur(function (e) {
                        var input = jQuery(this)[0];
                        validateDateField(input);
                    });
                }
            });
            // numberic validation
            // TODO: move to generic scipts
            var numericFields = ["Tissue_Gauge", "Tissue_Length", "ImgFindHeight", "ImgFindWidth", "ImgFindLength", "ImgFindNotes_Cortext", "ImgFindNotes_Skin"];
            jQuery.each(numericFields, function (index, fieldId) {
                var field = jQuery("#" + fieldId);
                if (field.length > 0) {
                    field.blur(function (e) {
                        var input = jQuery(this)[0];
                        validateNumericField(input);
                    });
                }
            });
        });

        function getStudyId() {
            return jQuery("#PtProtocolStudyId").val();
        }

        // For frozen and collected time in each specimen row, copy default values from first row
        function initCopyTimeFields(e) {
            var specimenRows = jQuery("#SpecimensGrid tr:not('.dataGridHeader')");
            var refFields = specimenRows.find("input[name*='SpecimenReferenceNumber']");
            var collectedTimeFields = specimenRows.find("input[name*='SpecimenCollectionTime']");
            var collectedCheckBoxes = specimenRows.find("input[name*='SpecimenStatus_Check']");
            var frozenFields = specimenRows.find("input[name*='SpecimenFrozenTime']");
            var allCopyTimeFields = refFields.add(collectedTimeFields).add(frozenFields).add(collectedCheckBoxes);
            // copy values from first row's collected and frozen time
            var copyTimeValues = function (index) {
                var collectedTime = collectedTimeFields.first().val();
                var frozenTime = frozenFields.first().val();
                var tr = specimenRows.eq(index);
                var refNum = refFields.eq(index);
                var collectedCheck = collectedCheckBoxes.eq(index);
                var isCollected = collectedCheck.is(":checked");
                var collectedTimeField = collectedTimeFields.eq(index);
                var frozenTimeField = frozenFields.eq(index);
                // copy value based on tissue type criteria
                var doCopy = "<%= QuerySpecimenType %>" == "Tissue" ? refNum.val() != "" : isCollected;
                if (doCopy) {
                    if (collectedTime != "" && collectedTimeField.val() == "")
                        collectedTimeField.val(collectedTime);
                    if (frozenTime != "" && frozenTimeField.val() == "")
                        frozenTimeField.val(frozenTime);
                }
            }
            // for each ref num field, on focus, copy first row's time value
            refFields.each(function (index, refField) {
                var refNum = jQuery(refField);
                if (index != 0) {
                    refNum.focus(function (e) {
                        copyTimeValues(index);
                    });
                }
            });
        }

        function initStatusChecked(e) {
            var collectionDate = jQuery("#AccessionDateText");
            var specimenRows = jQuery("#SpecimensGrid tr:not('.dataGridHeader')");
            specimenRows.each(function (index, row) {
                var tr = jQuery(row);
                var refNumField = tr.find("input[name*='SpecimenReferenceNumber']");
                var checkBoxField = tr.find("input[name*='SpecimenStatus_Check']");

                var setCheckBox = function (e) {
                    var doCheck = collectionDate.val() != "" && refNumField.val() != "";
                    if (doCheck) {
                        checkBoxField.attr("checked", "checked");
                    }
                };
                refNumField.blur(setCheckBox);
                setCheckBox();
            });
            //var collectionTime = jQuery("#AccessionTime");
            var statusCheckBoxes = jQuery("input[name*='SpecimenStatus_Check']");
            var setStatusCheckBoxes = function (e) {
                var doCheck = collectionDate.val() != "";
                if (doCheck) {
                    statusCheckBoxes.attr("checked", "checked");
                }
            };
            // when values selected, check collected
            //collectionDate.blur(setStatusCheckBoxes);
            //collectionTime.blur(setStatusCheckBoxes);

            //            // disable selection of collected
            //            statusCheckBoxes.attr("disabled", "disabled");
            //            // on submit, enable for postback
            //            jQuery("#form1").submit(function () {
            //                statusCheckBoxes.removeAttr("disabled");
            //            });
            // inital check
            //setStatusCheckBoxes(e);

        }

        function initVisitSpecimens(e) {
            // set change event
            var select = jQuery("#AccessionVisit");
            if (select.is(":enabled")) {
                select.change(doRemoteAutoSpecimens);
                // run inital auto-ref
                doRemoteAutoSpecimens();
            }
        }

        function doRemoteAutoSpecimens(e) {
            var select = jQuery("#AccessionVisit");
            var studyId = getStudyId();
            var type = '<%= QuerySpecimenType %>';
            var visit = select.find("option:selected").val();
            ProtocolSpecimenService.GetAutoSpecimenIds({
                data: {
                    protocolNum: '<%= ProtocolNumber %>',
                    ptProtocolId: '<%= PatientProtocolId %>',
                    type: type,
                    studyId: studyId,
                    visit: visit
                },
                success: function (autoRefNums) {
                    if (type === "Blood") {
                        setAutoBloodSpecimens(autoRefNums);
                    }
                    else if (type === "Tissue") {
                        setAutoTissueSpecimens(autoRefNums);
                    }
                }
            });
        }

        function setAutoBloodSpecimens(autoRefNums) {
            var rows = jQuery("#SpecimensGrid > tbody > tr:not(.dataGridHeader)");
            var ignore = false;
            rows.each(function (index) {
                var row = jQuery(this);
                var refNumField = row.find("input[id$='SpecimenReferenceNumber']");
                var subTypeField = row.find("input[id$='SpecimenSubType']");
                var vialTypeField = row.find("input[id$='SpecimenVialType']");
                if (refNumField.length === 1) {
                    // determine if record already exists
                    var exists = refNumField[0].defaultValue !== "";
                    ignore = ignore || index === 0 && exists;
                    // don't set if any values exist
                    if (!exists && !ignore) {
                        // set the blood default spec ref #
                        // TODO: special format
                        var pipedValue = autoRefNums.shift();
                        if (pipedValue && pipedValue != "") {
                            var values = pipedValue.split("|");
                            // get auto values
                            var autoRefNum = values[0];
                            var autoSubType = values[1];
                            var autoVialType = values[2];
                            // set input fields
                            refNumField.val(autoRefNum);
                            subTypeField.val(autoSubType);
                            vialTypeField.val(autoVialType);
                        }
                    }
                }
            });   
        }

        // for the specified list of auto ref #, set auto copy field
        function setAutoTissueSpecimens(autoRefNums) {
            var type = '<%= QuerySpecimenType %>';
            var autoRefNumFields = jQuery("#SpecimensGrid input[id*='SpecimenReferenceNumber_Auto_']");
            autoRefNumFields.each(function (index, hidden) {
                var autoRefNumField = jQuery(hidden);
                var refNumField = autoRefNumField.next();
                if (refNumField.val() == "") {
                    // get next available auto num
                    var autoRefNum = autoRefNums.shift();
                    if (autoRefNum) {
                        autoRefNumField.val(autoRefNum);
                    }
                }
            });
        }

        // copy the value from hidden auto-id field
        function copyReferenceNumber(field) {
            var refNumField = jQuery(field);
            var autoRefNumField = refNumField.prev();
            var refNumValue = refNumField.val();
            var autoRefNum = autoRefNumField.val();
            // only copy if no value exists and there is a valid auto num
            if (refNumValue == "" && autoRefNum != "")
                refNumField.val(autoRefNum);
        }

        function loadSpecimenAccession(specimenAccesionId) {
            var url = '<%= GetQueryString("PatientSpecimens.aspx") %>' + '&specimenAccessionId=' + specimenAccesionId;
            window.location = url;
        }

        function showSpecimenAccessions() {
            $("AccessionsMenu").style.display = "block";
        }

        function hideSpecimenAccessions(layer, e) {
            // on mouse leave, close layer
            if (layer == null || e == null || isMouseLeave(layer, e)) {
                $("AccessionsMenu").style.display = "none";
            }
        }

        function showNextRow(btn, gridId) {
            var hideBtn = false;
            var rows = $(gridId).getElementsByTagName("TR");
            for (var i = 0; i < rows.length; i++) {
                var row = rows[i];
                if (row.className == "dataGridBlankRowHidden") {
                    row.className = "dataGridBlankRowVisible";
                    if (i == rows.length - 1)
                        hideBtn = true;
                    break;
                }
            }
            if (hideBtn)
                btn.style.display = 'none';
        }

        function validateDataEntryTime(input) {
            var value = input.value || "";
            var valid = value == "" || validateTimeFormat(value, true) || value.toLowerCase() == "unknown";
            if (!valid) {
                alert("Please enter a value in the 24-hour format or 'unknown'.");
                // revert value
                input.value = input.defaultValue;
            }
            return valid;
        }
    
    </script>
    <style type="text/css">
        .dataEntryLayoutTable
        {
            table-layout: fixed;
            width: 100%;
        }
        .dataEntryLayoutTable td
        {
            vertical-align: top;
        }
        .dataEntryFieldsTable
        {
            table-layout: fixed;
            width: auto;
        }
        .dataEntryFieldsTable td
        {
            width: 140px;
            padding-right: 5px;
            vertical-align: middle;
        }
        .dataEntryFieldsTable td label
        {
            vertical-align: middle;
            font-weight: bold;
        }
        .dataEntryFieldsTable td.dataEntryLabelColumn
        {
            font-weight: bold;
            min-width: 35px;
            width: 110px;
        }
        .dataEntryFieldsTable td input, .dataEntryFieldsTable td select, .dataEntryFieldsTable td textarea
        {
            vertical-align: middle;
            width: 100px;
        }
        .dataEntryListColumn
        {
            width: 240px;
        }
        .dataEntryEditColumn
        {
            width: auto;
        }
        #SpecimensListOverflow
        {
            max-height: 100%;
            width: 300px;
            overflow: auto;
            border: solid 1px #cccccc;
        }
        input[type="text"], textarea, select
        {
            width: 125px;
            margin-right: 3px;
        }
        .hidden
        {
            display: none;
        }
        .dataGrid
        {
            margin-left: 0px;
        }
        #UpdateBtn
        {
            display: block;
            width: 125px;
            float: right;
            margin-top: 15px;
        }
        
        
        #OverflowContainer
        {
            overflow: auto;
            overflow-x: hidden;
            height: 375px;
            border: 1px solid #cccccc;
            margin: 0px;
            padding: 0px;
        }
        #OverflowContainer td
        {
            height: auto;
            padding: 4px 4px 4px 4px;
        }
        
        
        
        #CollectionTabs
        {
        }
        
        
        #CollectionOuterContainer
        {
            border: 1px solid #cccccc;
            margin: auto;
            padding: 8px;
            overflow: auto;
            position: relative;
        }
        
        .SpecimenSectionTitle
        {
            display: block;
            font-size: 12px;
            font-weight: bold;
            color: #000000;
        }
        fieldset
        {
            display: inline-block;
            padding: 0;
            margin: auto 0 5px 0;
            border: 1px solid #eeeeee;
            background-color: #fefefe;
        }
        fieldset legend
        {
            font-size: 12px;
            font-weight: bold;
            color: #666666;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <asp:HiddenField runat="server" ID="PtProtocolStudyId" />
    <script type="text/javascript" src="../../ClientScripts/popcalendar.js"></script>
    <table class="dataEntryLayoutTable">
        <tr>
            <td>
                <div id="CollectionTabs" class="SpecimenSubHeader">
                    <h3 class="SectionTitle">
                        Collection Details</h3>
                </div>
                <a id="BackToListBtn" class="dataEntryButtonGray" href="<%= GetQueryString("PatientSpecimensIndex.aspx") %>&specimenType=<%= QuerySpecimenType %>"
                    style="position: absolute; top: 15px; right: 5px; font-size: 12px;">Back To List
                </a>
                <div id="CollectionOuterContainer">
                    <div id="CollectionDetailsContainer">
                        <!-- Accession Details -->
                        <table id="DataEntryTable" class="dataEntryFieldsTable">
                            <tr>
                                <td class="dataEntryLabelColumn">
                                    <label for="AccessionDateText">
                                        Collection Date</label>
                                </td>
                                <td>
                                    <cic:CaisisTextBox runat="server" ID="AccessionDateText" ShowLabel="false" Table="SpecimenAccessions"
                                        Field="AccessionDateText" ShowCalendar="true" CalcDate="true" Width="85px"></cic:CaisisTextBox>
                                    <cic:CaisisHidden runat="server" ID="AccessionDate" ShowLabel="false" Table="SpecimenAccessions"
                                        Field="AccessionDate" DisplayCalculatedDate="false" ShowSpacer="false">
                                    </cic:CaisisHidden>
                                </td>
                                <td class="dataEntryLabelColumn">
                                    <label for="AccessionVisit">
                                        Visit</label>
                                </td>
                                <td>
                                    <cic:CaisisSelect runat="server" ID="AccessionVisit" ShowLabel="false" Table="SpecimenAccessions"
                                        Field="AccessionVisitType" Width="125px">
                                        <asp:ListItem Text="" Value=""></asp:ListItem>
                                        <asp:ListItem Text="Pre-Treatment (A)" Value="A"></asp:ListItem>
                                        <asp:ListItem Text="During Treatment (B)" Value="B"></asp:ListItem>
                                        <asp:ListItem Text="Post-Treatment (C)" Value="C"></asp:ListItem>
                                    </cic:CaisisSelect>
                                </td>
                            </tr>
                            <asp:PlaceHolder runat="server" ID="Tissue_Fields" Visible="false">
                                <tr>
                                    <td class="dataEntryLabelColumn">
                                        <label for="BiopsySite">
                                            Biopsy Site</label>
                                    </td>
                                    <td>
                                        <cic:CaisisComboBox runat="server" ID="BiopsySite" ShowLabel="false" Table="SpecimenAccessions"
                                            Field="AccessionAnatomicSite" LookupCode="BxSite" Width="85px"></cic:CaisisComboBox>
                                    </td>
                                    <td class="dataEntryLabelColumn">
                                        <label for="AccessionProcName">
                                            Collection Method</label>
                                    </td>
                                    <td>
                                        <cic:CaisisComboBox runat="server" ID="AccessionProcName" ShowLabel="false" Table="SpecimenAccessions"
                                            Field="AccessionProcName" LookupCode="Specimen_AccessionProcName"></cic:CaisisComboBox>
                                    </td>
                                    <td class="dataEntryLabelColumn">
                                        <label for="Tissue_SpecimenSubType">
                                            Sample Type</label>
                                    </td>
                                    <td>
                                        <cic:CaisisSelect runat="server" ID="Tissue_SpecimenSubType" ShowLabel="false" OnSelectedIndexChanged="SetSpecimenSubType">
                                            <asp:ListItem Text="" Value=""></asp:ListItem>
                                            <asp:ListItem Text="Bone" Value="Bone"></asp:ListItem>
                                            <asp:ListItem Text="Soft Tissue" Value="Soft Tissue"></asp:ListItem>
                                        </cic:CaisisSelect>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="dataEntryLabelColumn">
                                        Needle
                                    </td>
                                    <td>
                                        <cic:CaisisTextBox runat="server" ID="Tissue_Gauge" ShowLabel="false" Width="25px"
                                            Style="margin: 0;"></cic:CaisisTextBox>
                                        <span class="boldText">G</span>
                                        <cic:CaisisTextBox runat="server" ID="Tissue_Length" ShowLabel="false" Width="25px"></cic:CaisisTextBox>
                                        <cic:CaisisSelect runat="server" ID="Tissue_Unit" ShowLabel="false" Width="45px">
                                            <asp:ListItem Text=""></asp:ListItem>
                                            <asp:ListItem Text="cm"></asp:ListItem>
                                            <asp:ListItem Text="in"></asp:ListItem>
                                        </cic:CaisisSelect>
                                    </td>
                                    <td class="dataEntryLabelColumn">
                                        <label for="AccessionProcInstrumentType">
                                            Needle Type</label>
                                    </td>
                                    <td colspan="3">
                                        <cic:CaisisComboBox runat="server" ID="AccessionProcInstrumentType" Table="SpecimenAccessions"
                                            Field="AccessionProcInstrumentType" ShowLabel="false">
                                        </cic:CaisisComboBox>
                                    </td>
                                </tr>
                            </asp:PlaceHolder>
                            <tr>
                                <td class="dataEntryLabelColumn" style="width: auto;">
                                    <label for="AccessionNotes">
                                        Notes / Deviations from SOP (Comments)</label>
                                </td>
                                <td>
                                    <cic:CaisisTextArea runat="server" ID="AccessionNotes" ShowLabel="false" Table="SpecimenAccessions"
                                        Field="AccessionNotes" ShowTextEditor="true" Height="40px"></cic:CaisisTextArea>
                                </td>
                            </tr>
                        </table>
                        <!-- tissue imaging fields -->
                        <asp:Panel runat="server" ID="Tissue_DiagnosticFields" Visible="false">
                            <asp:HiddenField runat="server" ID="DiagnosticIdField" />
                            <fieldset>
                                <legend>Imaging Details</legend>
                                <table class="dataEntryFieldsTable">
                                    <tr>
                                        <td class="dataEntryLabelColumn">
                                            Size of Lesion (cm)
                                        </td>
                                        <td>
                                            <label>
                                                H
                                                <cic:CaisisTextBox runat="server" ID="ImgFindHeight" ShowLabel="false" Table="DxImageFindingsProstate"
                                                    Field="ImgFindHeight" Width="25px"></cic:CaisisTextBox></label>
                                            <label>
                                                W
                                                <cic:CaisisTextBox runat="server" ID="ImgFindWidth" ShowLabel="false" Table="DxImageFindingsProstate"
                                                    Field="ImgFindWidth" Width="25px"></cic:CaisisTextBox></label>
                                            <label>
                                                L
                                                <cic:CaisisTextBox runat="server" ID="ImgFindLength" ShowLabel="false" Table="DxImageFindingsProstate"
                                                    Field="ImgFindLength" Width="25px"></cic:CaisisTextBox></label>
                                        </td>
                                        <td class="dataEntryLabelColumn">
                                            <label for="ImgFindResult">
                                                Degree of Sclerosis</label>
                                        </td>
                                        <td>
                                            <cic:CaisisTextBox runat="server" ID="ImgFindResult" ShowLabel="false" Table="DxImageFindingsProstate"
                                                Field="ImgFindResult"></cic:CaisisTextBox>
                                        </td>
                                        <td class="dataEntryLabelColumn">
                                            <label for="ImgFindStatus">
                                                Description of Lesion</label>
                                        </td>
                                        <td>
                                            <cic:CaisisSelect runat="server" ID="ImgFindStatus" ShowLabel="false" Table="DxImageFindingsProstate"
                                                Field="ImgFindStatus">
                                                <asp:ListItem></asp:ListItem>
                                                <asp:ListItem>Lytic</asp:ListItem>
                                                <asp:ListItem>Sclerotic</asp:ListItem>
                                                <asp:ListItem>Mixed</asp:ListItem>
                                            </cic:CaisisSelect>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="dataEntryLabelColumn">
                                            <label for="DxSite">
                                                Targeting of Biopsy</label>
                                        </td>
                                        <td>
                                            <cic:CaisisSelect runat="server" ID="DxSite" ShowLabel="false" Table="Diagnostics"
                                                Field="DxSite">
                                                <asp:ListItem></asp:ListItem>
                                                <asp:ListItem>Center</asp:ListItem>
                                                <asp:ListItem>Peripheral</asp:ListItem>
                                                <asp:ListItem>Both</asp:ListItem>
                                            </cic:CaisisSelect>
                                        </td>
                                        <td class="dataEntryLabelColumn">
                                            <label for="ImgFindNotes_Cortext">
                                                Distance from cortex to lesion (cm)</label>
                                        </td>
                                        <td>
                                            <cic:CaisisTextBox runat="server" ID="ImgFindNotes_Cortext" ShowLabel="false" Table="DxImageFindingsProstate"
                                                Field="ImgFindDistanceToCortex"></cic:CaisisTextBox>
                                        </td>
                                        <td class="dataEntryLabelColumn">
                                            <label for="ImgFindNotes_Skin">
                                                Distance from skin to lesion (cm)</label>
                                        </td>
                                        <td>
                                            <cic:CaisisTextBox runat="server" ID="ImgFindNotes_Skin" ShowLabel="false" Table="DxImageFindingsProstate"
                                                Field="ImgFindDistanceToSkin"></cic:CaisisTextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="dataEntryLabelColumn">
                                            <label for="ImgFindNotes_Bone">
                                                Bone Scan Correlate</label>
                                        </td>
                                        <td>
                                            <cic:CaisisSelect runat="server" ID="ImgFindNotes_Bone" ShowLabel="false" Table="DxImageFindingsProstate"
                                                Field="ImgFindBoneScanCorrelate">
                                                <asp:ListItem></asp:ListItem>
                                                <asp:ListItem>Marked</asp:ListItem>
                                                <asp:ListItem>Moderate</asp:ListItem>
                                                <asp:ListItem>Mild</asp:ListItem>
                                                <asp:ListItem>Negative</asp:ListItem>
                                            </cic:CaisisSelect>
                                        </td>
                                        <td class="dataEntryLabelColumn">
                                            <label for="ImgFindNotes_PET">
                                                PET Scan Correlate</label>
                                        </td>
                                        <td>
                                            <cic:CaisisTextBox runat="server" ID="ImgFindNotes_PET" ShowLabel="false" Table="DxImageFindingsProstate"
                                                Field="ImgFindPETScanCorrelate">
                                            </cic:CaisisTextBox>
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </asp:Panel>
                        <!-- Specimens Details -->
                        <span class="SpecimenSectionTitle" style="margin-top: 10px;">
                            <%= QuerySpecimenType %>
                            Specimens</span><cic:ExtendedGridView runat="server" ID="SpecimensGrid" DataKeyNames="SpecimenAccessionId,SpecimenId"
                                TableName="Specimens" AutoGenerateColumns="false" GridLines="None" CssClass="dataGrid"
                                HeaderStyle-CssClass="dataGridHeader" RowStyle-CssClass="dataGridItemRowA" AlternatingRowStyle-CssClass="dataGridItemRowB"
                                BlankRowCssClass="dataGridBlankRowHidden" OnRowDataBound="SetSpecimenDisplay"
                                OnRowDeleted="ReloadOnSpecimenDelete">
                                <Columns>
                                    <asp:TemplateField HeaderText="Specimen ID">
                                        <ItemTemplate>
                                            <cic:CaisisHidden runat="server" ID="SpecimenId" Value='<%# Eval("SpecimenId") %>'>
                                            </cic:CaisisHidden>
                                            <input type="hidden" id="SpecimenReferenceNumber_Auto_<%# Container.DataItemIndex %>"
                                                value="" />
                                            <cic:CaisisTextBox runat="server" ID="SpecimenReferenceNumber" ShowLabel="false"
                                                Table="Specimens" Field="SpecimenReferenceNumber" Width="125px" onfocus="copyReferenceNumber(this);">
                                            </cic:CaisisTextBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <%--                                    <asp:TemplateField ItemStyle-CssClass="hidden" ControlStyle-CssClass="hidden" HeaderStyle-CssClass="hidden">
                                    --%>
                                    <asp:TemplateField HeaderText="">
                                        <ItemTemplate>
                                            <!-- read only -->
                                            <cic:CaisisHidden runat="server" ID="SpecimenType" ShowLabel="false" Table="Specimens"
                                                Field="SpecimenType">
                                            </cic:CaisisHidden>
                                            <!-- hidden sub type: set by parent selction -->
                                            <cic:CaisisComboBox runat="server" ID="SpecimenSubType" ShowLabel="false" Table="Specimens"
                                                Field="SpecimenSubType">
                                            </cic:CaisisComboBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Tube Type">
                                        <ItemTemplate>
                                            <cic:CaisisComboBox runat="server" ID="SpecimenVialType" Table="Specimens" Field="SpecimenVialType"
                                                ShowLabel="false" Width="75px" LookupCode="SpecimenVialType">
                                            </cic:CaisisComboBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Processing Method">
                                        <ItemTemplate>
                                            <cic:CaisisComboBox runat="server" ID="SpecimenPreservationType" ShowLabel="false"
                                                Table="Specimens" Field="SpecimenPreservationType">
                                            </cic:CaisisComboBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Collection Time" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <cic:CaisisTextBox runat="server" ID="SpecimenCollectionTime" Table="Specimens" Field="SpecimenCollectionTime"
                                                ShowLabel="false" Width="50px" onblur="return validateDataEntryTime(this);">
                                            </cic:CaisisTextBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Time Frozen" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <cic:CaisisTextBox runat="server" ID="SpecimenFrozenTime" Table="Specimens" Field="SpecimenFrozenTime"
                                                ShowLabel="false" Width="50px" onblur="return validateDataEntryTime(this);">
                                            </cic:CaisisTextBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Collected" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <cic:CaisisHidden runat="server" ID="SpecimenStatus" Table="Specimens" Field="SpecimenStatus">
                                            </cic:CaisisHidden>
                                            <cic:CaisisCheckBox runat="server" ShowLabel="false" ID="SpecimenStatus_Check" OnCheckedChanged="SetStatusValue" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <%--
                                <asp:TemplateField HeaderText="Vial #">
                                    <ItemTemplate>
                                        <cic:CaisisTextBox runat="server" ID="SpecimenVialNum" Table="Specimens" Field="SpecimenVialNum"
                                            ShowLabel="false" Width="50px">
                                        </cic:CaisisTextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>--%>
                                    <cic:GridRowDeleteImage>
                                    </cic:GridRowDeleteImage>
                                </Columns>
                            </cic:ExtendedGridView>
                        <span runat="server" id="AddBtn" class="dataEntryButtonGray" onclick="showNextRow(this, 'SpecimensGrid');">
                            Add Row</span>
                    </div>
                </div>
                <asp:Button runat="server" ID="UpdateBtn" CssClass="dataEntryButtonRed" Text="Save"
                    OnClick="UpdateClick" Style="margin-right: 20px;" />
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
