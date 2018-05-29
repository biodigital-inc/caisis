<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ProstateDataExportButton.aspx.cs" Inherits="Caisis.UI.Core.DataAnalysis.Export.ProstateDataExportButton" %>
<%@ Register TagPrefix="cic" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="../../../ClientScripts/utilities.js" type="text/javascript"></script>
<style type="text/css">
div#shell
{
    margin-left: auto;
    margin-right: auto;
    height: 686px;
    width: 986px;
    background-image: url(../../../Images/ProstateDataExport_TempBG.png);
	background-repeat: no-repeat;
    position: relative;
}
.ExportButton
{
    margin-left: 100px;
	margin-top: 15px;
	margin-bottom: 20px;
}

span.panelTitle
{
	color: #ffffff;
	
	
/*	color: #1f1f1f; */
	font-family: Arial, Helvetica, sans-serif;
	font-weight: bold;
	font-size: 13px;
	display: block;
	padding: 0px 0px 11px 0px;
	width: 80%;
}
table#AuthProjInfo
{
}
table#AuthProjInfo td
{
	padding: 12px 12px 12px 0px;
}
div.PanelContent td.dataExportFieldLabel
{
	width: 150px;
	font-family: Arial, Helvetica, sans-serif;
	font-weight: normal;
	font-size: 13px;
	color: #1f1f1f;
	padding: 12px 12px 12px 0px;
}


div.PanelOuterContainer
{
    background-image: url(../../../Images/Panel2_Red_BG_TopRight.png);

/*    background-image: url(../../../Images/Panel1_BG_TopRight.png); */
	background-repeat: no-repeat;
	background-position: top right;

}
div.PanelMiddleContainer
{
    background-image: url(../../../Images/Panel2_BG_BottomRight.png);
	padding-right: 11px;
	
	
/*    background-image: url(../../../Images/Panel1_BG_BottomRight.png);
	padding-right: 6px; */
	background-repeat: no-repeat;
	background-position: bottom right;
}
div.PanelInnerContainer
{
    background-image: url(../../../Images/Panel2_BG_BottomLeft.png);
	padding-bottom: 11px;
	
	
/*    background-image: url(../../../Images/Panel1_BG_BottomLeft.png);
	padding-bottom: 6px; */
	background-repeat: no-repeat;
	background-position: bottom left;
}
div.PanelContent
{
    background-image: url(../../../Images/Panel2_Red_BG_TopLeft.png);
	padding-left: 14px;
	padding-top: 10px;
    
    
/*    background-image: url(../../../Images/Panel1_BG_TopLeft.png);
	padding-left: 10px;
	padding-top: 9px; */
	background-repeat: no-repeat;
	background-position: top left;
	font-family: Arial, Helvetica, sans-serif;
	font-weight: normal;
	font-size: 11px;
	color: #1f1f1f;
}
div.PanelContent input
{
	font-size: 11px;
}
div.PanelContent select
{
	font-size: 11px;
}
div.PanelContent p
{
	margin: 10px 0px 20px 0px;
}
div.PanelContent table.tabularData
{
	border-top: solid 1px #1f1f1f;
	margin-bottom: 14px;
}
div.PanelContent table.tabularData td
{
	font-size: 13px;
	vertical-align: middle;
	padding: 3px 6px 3px 0px;
}
div.PanelContent table.tabularData td.tabularDataNotes
{
	font-size: 10px;
}




span.tableTitle
{
	font-family: Arial, Helvetica, sans-serif;
	font-weight: normal;
	font-size: 13px;
	color: #1f1f1f;
	display: inline;
}
div#ProjInfo
{
    position: absolute;
    top: 37px;
    left: 0px;
}
div#DataSetPreview
{
    position: absolute;
    top: 37px;
    right: 0px;
	width: 50%;
}
div#AboutTheData
{
    position: absolute;
    top: 300px;
	width: 100%;
}
img#datasetPreviewGraph
{
	float: right;
	margin: 10px 20px 0px 0px;
}
div#summary
{
    height: 261px;
    width: 100%;
    overflow: auto;
}
div#DataDictionary
{
	float: right;
	width: 74%;
	height: 100px;
	border-left: solid 1px #cccccc;
	margin: 10px 0px 20px 20px;
	padding: 0px 10px 0px 20px;
	overflow: scroll;
	overflow-x: hidden;
}

div#summary td
{
	vertical-align: top;
	font-size: 11px;
	font-weight: normal;
	padding: 10px 5px 5px 10px;
	border-bottom: solid 1px #e5e5e5;
}
div#summary td.term
{
	font-size: 11px;
	font-weight: bold;
	width: 30%;
}




</style>    
    
    
</head>
<body>
    <script src="../../../ClientScripts/popcalendar.js" type="text/javascript"></script>
    <form id="form1" runat="server">
	
	
	
    <div id="shell">
	
	<div>
	<div id="ProjInfo" class="PanelOuterContainer"><div class="PanelMiddleContainer"><div class="PanelInnerContainer">
		<div class="PanelContent">
			<span class="panelTitle">Authorization &amp; Project Info</span>
			
			
			<p style="margin-bottom: 10px; width: 360px;">This page allows you to generate a dataset and download it in .csv format, usable in spreadsheet applications (Microsof Excel), database applications (MS Access) or statistical analysis packages.</p>
			
			<table cellspacing="0" id="AuthProjInfo">
				<tr>
					<td class="dataExportFieldLabel">Purpose</td>
					<td>
                        <!--
					    <select>
						    <option>Data Exploration</option>
						    <option>Data Review Preparatory To Research</option>
						    <option>Research Data Analysis</option>
						    <option>Operations Data Analysis</option>
					    </select>
                        -->
                        <asp:DropDownList ID="Purpose" runat="server">
                            <asp:ListItem Text="Data Exploration" Value="Data Exploration" />
                            <asp:ListItem Text="Data Review Preparatory To Research" Value="Data Review Preparatory To Research" />
                            <asp:ListItem Text="Research Data Analysis" Value="Research Data Analysis" />
                            <asp:ListItem Text="Operations Data Analysis" Value="Operations Data Analysis" />
                        </asp:DropDownList>
					</td>
				</tr>
                <!--
				<tr>
					<td class="dataExportFieldLabel">Privacy Level</td>
					<td>
					<select>
						<option>De-Identifield</option>
						<option>De-Identifield</option>
						<option>De-Identifield</option>
						<option>De-Identifield</option>
					</select>
					</td>
				</tr>
                -->
				<tr>
					<td class="dataExportFieldLabel">IRB Approval Type</td>
					<td>
                        <!--
					    <select>
						    <option>Research Authorization</option>
						    <option>Waiver of Authorization</option>
						    <option>Data Review Preparatory To Research</option>
						    <option>Data Use Agreement</option>
					    </select>
                        -->
                        <asp:DropDownList ID="IRB_ApprovalType" runat="server">
                            <asp:ListItem Text="" Value="" />
                            <asp:ListItem Text="Research Authorization" Value="Research Authorization" />
                            <asp:ListItem Text="Waiver of Authorization" Value="Waiver of Authorization" />
                            <asp:ListItem Text="Data Review Preparatory To Research" Value="Data Review Preparatory To Research" />
                            <asp:ListItem Text="Data Use Agreement" Value="Data Use Agreement" />
                        </asp:DropDownList>
					</td>
				</tr>
                <tr>
                    <td class="dataExportFieldLabel">IRB Approval Date</td>
                    <td>
                        <cic:CaisisTextBox ID="IRB_ApprovalDate" ShowCalendar="true" runat="server"></cic:CaisisTextBox>
                    </td>
                </tr>
				<%--<tr>
					<td class="dataExportFieldLabel">Project Name</td>
					<td valign="top">
						<!--<input type="text" style="width: 220px;" />-->
                        <asp:TextBox ID="ProjectName" Width="220px" runat="server" />
					</td>
				</tr>--%>
				<tr>
					<td class="dataExportFieldLabel">Investigator</td>
					<td>
                        <!--
					    <select>
						    <option>Scardino, Peter</option>
						    <option>Scardino, Peter</option>
						    <option>Scardino, Peter</option>
						    <option>Scardino, Peter</option>
					    </select>
                        -->
                        <asp:TextBox ID="Investigator" Width="220px" runat="server" />
					</td>
				</tr>
                <!--
				<tr>
					<td class="dataExportFieldLabel" style="vertical-align: top;">Description</td>
					<td>
						<textarea style="width: 240px; height: 100px;" ></textarea>
					</td>
				</tr>
                -->
			</table>
			
			<asp:ImageButton ID="SubmitButton" OnClick="SubmitButton_Click" ImageUrl="../../../Images/ProstateDataExport_CreateDataset.png" runat="server" Text="Create Dataset" CssClass="ExportButton" />
			
			
		</div>
	</div></div></div>
	
    <%--
	<div id="Div1" class="PanelOuterContainer"><div class="PanelMiddleContainer"><div class="PanelInnerContainer">
		<div class="PanelContent">
			<span class="panelTitle">Dataset Preview</span>
			<p>Duis egestas, odio id consequat vehicula, libero sapien pretium est, a lacinia odio risus eu lorem. Ut quis risus sit amet felis consectetur ullamcorper nec a diam. Donec sodales luctus nisl nec ultricies. Maecenas congue, mi quis commodo posuere, risus lacus dictum mi, vel ultrices sapien metus.</p>
			
			
			<img id="Img1" src="../../../Images/Panel1_TempGraph.png" />
			<span class="tableTitle">Dataset Parameters</span>
			<table cellspacing="0" class="tabularData">
				<tr>
					<td><input type="checkbox" id="checkbox2" /></td>
					<td style="width: 130px;">Option 1</td>
					<td>44%</td>
					<td class="tabularDataNotes">(21,324)</td>
				</tr>
				<tr>
					<td><input type="checkbox" id="checkbox3" /></td>
					<td>Option 2</td>
					<td>33%</td>
					<td class="tabularDataNotes">(11,222)</td>
				</tr>
				<tr>
					<td><input type="checkbox" id="checkbox4" /></td>
					<td>Option 3</td>
					<td>23%</td>
					<td class="tabularDataNotes">(7,111)</td>
				</tr>
			</table>
			
			<span class="tableTitle">Dataset Summary</span>
			<table cellspacing="0" class="tabularData">
				<tr>
					<td style="text-align: right">202,438</td>
					<td>Patients Selected</td>
				</tr>
				<tr>
					<td>97%</td>
					<td>of 213,021 Prostate Patients</td>
				</tr>
			</table>
			
			<asp:ImageButton ID="ImageButton1" OnClick="SubmitButton_Click" ImageUrl="../../../Images/ProstateDataExport_CreateDataset.png" runat="server" Text="Create Dataset" CssClass="ExportButton" />
			
		</div>
	</div></div></div>
    --%>
	
	<div id="DataSetPreview" class="PanelOuterContainer" style="background-image: url(../../../Images/Panel2_Blue_BG_TopRight.png);"><div class="PanelMiddleContainer"><div class="PanelInnerContainer">
		<div class="PanelContent" style="background-image: url(../../../Images/Panel2_Blue_BG_TopLeft.png);">
			<span class="panelTitle">Dataset Summary</span>
			<p>Below is a list of a fields that will be exported, along with a short description of each.</p>
            <div id="summary">
                <table id="DictionaryHTMLTable" cellspacing="0">
                    <tr><td class="term">PtMRN</td><td>Medical record number</td></tr>
                    <tr><td class="term">PatientID</td><td>Caisis patient identifier</td></tr>
                    <tr><td class="term">DOB</td><td>Patient birth date</td></tr>
                    <tr><td class="term">PtRace</td><td>Patient race</td></tr>
                    <tr><td class="term">PtEthnicity</td><td>Patient ethnicity</td></tr>
                    <tr><td class="term">PtDeathDate</td><td>Patient death date</td></tr>
                    <tr><td class="term">PtDeathType</td><td>Patient death type</td></tr>
                    <tr><td class="term">PtDeathCause</td><td>Cause of patient death</td></tr>
                    <tr><td class="term">ActiveSurveillance</td><td>Active surveillance status</td></tr>
                    <tr><td class="term">PreDxBxPSA_Date</td><td>Date of pre-diagnostic-biopsy PSA</td></tr>
                    <tr><td class="term">PreDxBxPSA_Value</td><td>Value of pre-diagnostic-biopsy PSA</td></tr>
                    <tr><td class="term">DxBxDate</td><td>Date of diagnostic biopsy</td></tr>
                    <tr><td class="term">DxBxAge</td><td>Age at diagnostic biopsy</td></tr>
                    <tr><td class="term">DxBxType</td><td>Type of diagnostic biopsy</td></tr>
                    <tr><td class="term">DxBxGG1</td><td>Primary gleason score from diagnostic biopsy</td></tr>
                    <tr><td class="term">DxBxGG2</td><td>Secondary gleason score from diagnostic biopsy</td></tr>
                    <tr><td class="term">DxBxGGS</td><td>Gleason sum from diagnostic biopsy</td></tr>
                    <tr><td class="term">DxBxPosCores</td><td>Positive cores from diagnostic biopsy</td></tr>
                    <tr><td class="term">DxBxNumCores</td><td>Total cores from diagnostic biopsy</td></tr>
                    <tr><td class="term">DxBxQuality</td><td>Quality of biopsy</td></tr>
                    <tr><td class="term">ClinStageDate</td><td>Date of clinical stage</td></tr>
                    <tr><td class="term">ClinStageSystem</td><td>Clinical staging system</td></tr>
                    <tr><td class="term">ClinT_Stage</td><td>Clinical T stage</td></tr>
                    <tr><td class="term">ClinN_Stage</td><td>Clinical N stage</td></tr>
                    <tr><td class="term">ClinM_Stage</td><td>Clinical M stage</td></tr>
                    <tr><td class="term">ClinStageQuality</td><td>Quality of clinical stage record</td></tr>
                    <tr><td class="term">OpNoteClinStageSystem</td><td>Clinical stage system from op note</td></tr>
                    <tr><td class="term">OpNoteClinStage</td><td>Clinical stage from the op note</td></tr>
                    <tr><td class="term">PreOpMets</td><td>Pre-operative metastasis status</td></tr>
                    <tr><td class="term">NeoAdjHormType</td><td>Type of neoadjuvant hormones</td></tr>
                    <tr><td class="term">NeoAdjHormStartDate</td><td>Neoadjuvant hormones start date</td></tr>
                    <tr><td class="term">NeoAdjHormStopDate</td><td>Neoadjuvant hormones stop date</td></tr>
                    <tr><td class="term">NeoAdjHormDuration</td><td>Duration of neoadjuvant hormones</td></tr>
                    <tr><td class="term">NeoAdjRadTxType</td><td>Type of neoadjuvant radiation</td></tr>
                    <tr><td class="term">NeoAdjRadTxDose</td><td>Neoadjuvant radiation dose</td></tr>
                    <tr><td class="term">NeoAdjRadTxDate</td><td>Date of neoadjuvant radiation</td></tr>
                    <tr><td class="term">NeoAdjRadTxTarget</td><td>Neoadjuvant radiation target</td></tr>
                    <tr><td class="term">NeoAdjBrachyType</td><td>Type of neoadjuvant brachytherapy</td></tr>
                    <tr><td class="term">NeoAdjBrachyDose</td><td>Neoadjuvant brachytherapy dose</td></tr>
                    <tr><td class="term">NeoAdjBrachyDate</td><td>Date of neoadjuvant brachytherapy</td></tr>
                    <tr><td class="term">NeoAdjChemoDate</td><td>Date of neoadjuvant chemotherapy</td></tr>
                    <tr><td class="term">NeoAdjChemoAgent</td><td>Neoadjuvant chemotherapy agent</td></tr>
                    <tr><td class="term">NeoAdjClinTrialDate</td><td>Date of neoadjuvant clinical trials treatment</td></tr>
                    <tr><td class="term">NeoAdjClinTrialAgent</td><td>Neoadjuvant clinical trials agent</td></tr>
                    <tr><td class="term">PreRP_PSA_Date</td><td>Date of pre-surgery PSA</td></tr>
                    <tr><td class="term">PreRP_PSA_Value</td><td>Value of pre-surgery PSA</td></tr>
                    <tr><td class="term">RP_Date</td><td>Date of prostatectomy</td></tr>
                    <tr><td class="term">RP_Type</td><td>Type of prostatectomy</td></tr>
                    <tr><td class="term">RP_Institution</td><td>Institution where the prostatectomy was performed</td></tr>
                    <tr><td class="term">CaseSurgeon</td><td>Case surgeon associated with the operation</td></tr>
                    <tr><td class="term">Surgeon</td><td>Surgeon who performed the prostatectomy</td></tr>
                    <tr><td class="term">RP_OperatingTime</td><td>Surgery duration</td></tr>
                    <tr><td class="term">RP_EstBloodLoss</td><td>Estimated blood loss</td></tr>
                    <tr><td class="term">RP_L_NVB_Dissection</td><td>Nerve dissection</td></tr>
                    <tr><td class="term">RP_L_NVB_Status</td><td>Nerve sparing status left</td></tr>
                    <tr><td class="term">RP_R_NVB_Dissection</td><td>Nerve dissection</td></tr>
                    <tr><td class="term">RP_R_NVB_Status</td><td>Nerve sparing status right</td></tr>
                    <tr><td class="term">PathGG1</td><td>primary gleason from prostatectomy</td></tr>
                    <tr><td class="term">PathGG2</td><td>secondary gleason from prostatectomy</td></tr>
                    <tr><td class="term">PathGGS</td><td>gleason sum from prostatectomy</td></tr>
                    <tr><td class="term">BNI</td><td>bladder neck invasion</td></tr>
                    <tr><td class="term">ECE</td><td>extracapsular invasion</td></tr>
                    <tr><td class="term">SMS</td><td>margin status</td></tr>
                    <tr><td class="term">PNI</td><td>perineural invasion</td></tr>
                    <tr><td class="term">SVI</td><td>seminal vesicle invasion</td></tr>
                    <tr><td class="term">VascularInv</td><td>vascular invasion</td></tr>
                    <tr><td class="term">LNI</td><td>lymph node invasion</td></tr>
                    <tr><td class="term">StageSystem</td><td>Staging System</td></tr>
                    <tr><td class="term">PathStage</td><td>T stage from prostatectomy</td></tr>
                    <tr><td class="term">PostRP_HormType</td><td>Type of post-surgery hormones</td></tr>
                    <tr><td class="term">PostRP_HormStartDate</td><td>post-surgery hormones start date</td></tr>
                    <tr><td class="term">PostRP_HormStopDate</td><td>post-surgery hormones stop date</td></tr>
                    <tr><td class="term">PostRP_HormDuration</td><td>Duration of post-surgery hormones</td></tr>
                    <tr><td class="term">PostRP_RadTxType</td><td>Type of post-surgery radiation</td></tr>
                    <tr><td class="term">PostRP_RadTxDose</td><td>post-surgery radiation dose</td></tr>
                    <tr><td class="term">PostRP_RadTxDate</td><td>Date of post-surgery radiation</td></tr>
                    <tr><td class="term">PostRP_RadTxTarget</td><td>post-surgery radiation target</td></tr>
                    <tr><td class="term">PostRP_RadTxFreeTime</td><td>Time to post-surgery radiation</td></tr>
                    <tr><td class="term">PostRP_BrachyType</td><td>Type of post-surgery brachytherapy</td></tr>
                    <tr><td class="term">PostRP_BrachyDose</td><td>Post-surgery brachytherapy dose</td></tr>
                    <tr><td class="term">PostRP_BrachyDate</td><td>Date of post-surgery brachytherapy</td></tr>
                    <tr><td class="term">PostRP_BrachyFreeTime</td><td>Time to post-surgery brachytherapy</td></tr>
                    <tr><td class="term">PostRP_ChemoDate</td><td>Date of post-surgery chemotherapy</td></tr>
                    <tr><td class="term">PostRP_ChemoAgent</td><td>post-surgery chemotherapy agent</td></tr>
                    <tr><td class="term">PostRP_ChemoFreeTime</td><td>Time to post-surgery chemotherapy</td></tr>
                    <tr><td class="term">PostRP_ClinTrialDate</td><td>Post-surgery clinical trials treatment date</td></tr>
                    <tr><td class="term">PostRP_ClinTrialAgent</td><td>Post-surgery clinical trials treatment agent</td></tr>
                    <tr><td class="term">PostRP_ClinTrialFreeTime</td><td>Time to post-surgery clinical trials treatment</td></tr>
                    <tr><td class="term">BCR_Date</td><td>Biochemical recurrence date</td></tr>
                    <tr><td class="term">BCR_PSA_Value</td><td>Value of PSA at biochemical recurrence</td></tr>
                    <tr><td class="term">BCR_FreeTime</td><td>Time to biochemical recurrence</td></tr>
                    <tr><td class="term">LCR_BxDate</td><td>Date of local recurrence biopsy</td></tr>
                    <tr><td class="term">LCR_BxResult</td><td>Result of local recurrence biopsy</td></tr>
                    <tr><td class="term">LCR_BxQuality</td><td>Type of local recurrence biopsy</td></tr>
                    <tr><td class="term">LCR_BxGG1</td><td>Quality of local recurrence biopsy</td></tr>
                    <tr><td class="term">LCR_BxGG2</td><td>Primary gleason score from local recurrence biopsy</td></tr>
                    <tr><td class="term">LCR_BxGGS</td><td>Secondary gleason score from local recurrence biopsy</td></tr>
                    <tr><td class="term">MetsFreeTime</td><td>Time to metastasis</td></tr>
                </table>
			</div>
		</div>
	</div></div></div>
	</div>
	<!--
	<div id="AboutTheData" class="PanelOuterContainer"><div class="PanelMiddleContainer"><div class="PanelInnerContainer">
		<div class="PanelContent">
			<span class="panelTitle">About the Data</span>
			
			<div id="DataDictionary">
				<table cellspacing="0">
					
                    <tr>
    	                <td class="term">PtMRN</td>
    	                <td>Medical record number</td>
                    </tr>

                    <tr>
    	                <td class="term">PatientID</td>
    	                <td>Caisis patient identifier</td>
                    </tr>

                    <tr>
    	                <td class="term">DOB</td>
    	                <td>Patient birth date</td>
                    </tr>

                    <tr>
    	                <td class="term">ActiveSurveillance</td>
    	                <td>Active surveillance status</td>
                    </tr>

                    <tr>
    	                <td class="term">PreDxBxPSA_Date</td>
    	                <td>Date of pre-diagnostic-biopsy PSA</td>
                    </tr>

                    <tr>
    	                <td class="term">PreDxBxPSA_Value</td>
    	                <td>Value of pre-diagnostic-biopsy PSA</td>
                    </tr>

                    <tr>
    	                <td class="term">DxBxDate</td>
    	                <td>Date of diagnostic biopsy</td>
                    </tr>

                    <tr>
    	                <td class="term">DxBxAge</td>
    	                <td>Age at diagnostic biopsy</td>
                    </tr>

                    <tr>
    	                <td class="term">DxBxType</td>
    	                <td>Type of diagnostic biopsy</td>
                    </tr>

                    <tr>
    	                <td class="term">DxBxGG1</td>
    	                <td>Primary gleason score from diagnostic biopsy</td>
                    </tr>

                    <tr>
    	                <td class="term">DxBxGG2</td>
    	                <td>Secondary gleason score from diagnostic biopsy</td>
                    </tr>

                    <tr>
    	                <td class="term">DxBxGGS</td>
    	                <td>Gleason sum from diagnostic biopsy</td>
                    </tr>

                    <tr>
    	                <td class="term">DxBxPosCores</td>
    	                <td>Positive cores from diagnostic biopsy</td>
                    </tr>

                    <tr>
    	                <td class="term">DxBxNumCores</td>
    	                <td>Total cores from diagnostic biopsy</td>
                    </tr>

                    <tr>
    	                <td class="term">DxBxQuality</td>
    	                <td>Quality of biopsy</td>
                    </tr>

                    <tr>
    	                <td class="term">ClinStageSystem</td>
    	                <td>Clinical staging system</td>
                    </tr>

                    <tr>
    	                <td class="term">ClinT_Stage</td>
    	                <td>Clinical T stage</td>
                    </tr>

                    <tr>
    	                <td class="term">ClinN_Stage</td>
    	                <td>Clinical N stage</td>
                    </tr>

                    <tr>
    	                <td class="term">ClinM_Stage</td>
    	                <td>Clinical M stage</td>
                    </tr>

                    <tr>
    	                <td class="term">ClinStageQuality</td>
    	                <td>Quality of clinical stage record</td>
                    </tr>

                    <tr>
    	                <td class="term">OpNoteClinStageSystem</td>
    	                <td>Clinical stage system from op note</td>
                    </tr>

                    <tr>
    	                <td class="term">OpNoteClinStage</td>
    	                <td>Clinical stage from the op note</td>
                    </tr>

                    <tr>
    	                <td class="term">PreOpMets</td>
    	                <td>Pre-operative metastasis status</td>
                    </tr>

                    <tr>
    	                <td class="term">NeoAdjHormType</td>
    	                <td>Type of neoadjuvant hormones</td>
                    </tr>

                    <tr>
    	                <td class="term">NeoAdjHormStartDate</td>
    	                <td>Neoadjuvant hormones start date</td>
                    </tr>

                    <tr>
    	                <td class="term">NeoAdjHormStopDate</td>
    	                <td>Neoadjuvant hormones stop date</td>
                    </tr>

                    <tr>
    	                <td class="term">NeoAdjHormDuration</td>
    	                <td>Duration of neoadjuvant hormones</td>
                    </tr>

                    <tr>
    	                <td class="term">NeoAdjRadTxType</td>
    	                <td>Type of neoadjuvant radiation</td>
                    </tr>

                    <tr>
    	                <td class="term">NeoAdjRadTxDose</td>
    	                <td>Neoadjuvant radiation dose</td>
                    </tr>

                    <tr>
    	                <td class="term">NeoAdjRadTxDate</td>
    	                <td>Date of neoadjuvant radiation</td>
                    </tr>

                    <tr>
    	                <td class="term">NeoAdjRadTxTarget</td>
    	                <td>Neoadjuvant radiation target</td>
                    </tr>

                    <tr>
    	                <td class="term">PreRP_RadTxType</td>
    	                <td>Type of pre-surgery radiation</td>
                    </tr>

                    <tr>
    	                <td class="term">PreRP_RadTxDose</td>
    	                <td>pre-surgery radiation dose</td>
                    </tr>

                    <tr>
    	                <td class="term">PreRP_RadTxDate</td>
    	                <td>Date of pre-surgery radiation</td>
                    </tr>

                    <tr>
    	                <td class="term">PreRP_RadTxTarget</td>
    	                <td>pre-surgery radiation target</td>
                    </tr>

                    <tr>
    	                <td class="term">NeoAdjBrachyType</td>
    	                <td>Type of neoadjuvant brachytherapy</td>
                    </tr>

                    <tr>
    	                <td class="term">NeoAdjBrachyDate</td>
    	                <td>Date of neoadjuvant brachytherapy</td>
                    </tr>

                    <tr>
    	                <td class="term">PreRP_BrachyType</td>
    	                <td>Type of pre-surgery brachytherapy</td>
                    </tr>

                    <tr>
    	                <td class="term">PreRP_BrachyDate</td>
    	                <td>Date of pre-surgery brachytherapy</td>
                    </tr>

                    <tr>
    	                <td class="term">NeoAdjChemoType</td>
    	                <td>Type of neoadjuvant chemotherapy</td>
                    </tr>

                    <tr>
    	                <td class="term">NeoAdjChemoAgent</td>
    	                <td>Neoadjuvant chemotherapy agent</td>
                    </tr>

                    <tr>
    	                <td class="term">NeoAdjChemoClinTrial</td>
    	                <td>Neoadjuvant chemotherapy clinic trials details</td>
                    </tr>

                    <tr>
    	                <td class="term">NeoAdjChemoDate</td>
    	                <td>Date of neoadjuvant chemotherapy</td>
                    </tr>

                    <tr>
    	                <td class="term">PreRP_ChemoType</td>
    	                <td>Type of pre-surgery chemotherapy</td>
                    </tr>

                    <tr>
    	                <td class="term">PreRP_ChemoAgent</td>
    	                <td>pre-surgery chemotherapy agent</td>
                    </tr>

                    <tr>
    	                <td class="term">PreRP_ChemoClinTrial</td>
    	                <td>pre-surgery chemotherapy clinic trials details</td>
                    </tr>

                    <tr>
    	                <td class="term">PreRP_ChemoDate</td>
    	                <td>Date of pre-surgery chemotherapy</td>
                    </tr>

                    <tr>
    	                <td class="term">PreRP_PSA_Date</td>
    	                <td>Date of pre-surgery PSA</td>
                    </tr>

                    <tr>
    	                <td class="term">PreRP_PSA_Value</td>
    	                <td>Value of pre-surgery PSA</td>
                    </tr>

                    <tr>
    	                <td class="term">RP_Date</td>
    	                <td>Date of prostatectomy</td>
                    </tr>

                    <tr>
    	                <td class="term">RP_Type</td>
    	                <td>type of prostatectomy</td>
                    </tr>

                    <tr>
    	                <td class="term">RP_Institution</td>
    	                <td></td>
                    </tr>

                    <tr>
    	                <td class="term">CaseSurgeon</td>
    	                <td>surgeon from OR details</td>
                    </tr>

                    <tr>
    	                <td class="term">Surgeon</td>
    	                <td>surgery from Procedure details</td>
                    </tr>

                    <tr>
    	                <td class="term">RP_OperatingTime</td>
    	                <td>surgery duration (skin to skin)</td>
                    </tr>

                    <tr>
    	                <td class="term">RP_EstBloodLoss</td>
    	                <td></td>
                    </tr>

                    <tr>
    	                <td class="term">RP_L_NVB_Dissection</td>
    	                <td>Nerve dissection</td>
                    </tr>

                    <tr>
    	                <td class="term">RP_L_NVB_Status</td>
    	                <td>Nerve sparing status left</td>
                    </tr>

                    <tr>
    	                <td class="term">RP_R_NVB_Dissection</td>
    	                <td>Nerve dissection</td>
                    </tr>

                    <tr>
    	                <td class="term">RP_R_NVB_Status</td>
    	                <td>Nerve sparing status right</td>
                    </tr>

                    <tr>
    	                <td class="term">PathGG1</td>
    	                <td>primary gleason from prostatectomy</td>
                    </tr>

                    <tr>
    	                <td class="term">PathGG2</td>
    	                <td>secondary gleason from prostatectomy</td>
                    </tr>

                    <tr>
    	                <td class="term">PathGGS</td>
    	                <td>gleason sum from prostatectomy</td>
                    </tr>

                    <tr>
    	                <td class="term">BNI</td>
    	                <td>bladder neck invasion</td>
                    </tr>

                    <tr>
    	                <td class="term">ECE</td>
    	                <td>extracapsular invasion</td>
                    </tr>

                    <tr>
    	                <td class="term">SMS</td>
    	                <td>margin status</td>
                    </tr>

                    <tr>
    	                <td class="term">PNI</td>
    	                <td>perineural invasion</td>
                    </tr>

                    <tr>
    	                <td class="term">SVI</td>
    	                <td>seminal vesicle invasion</td>
                    </tr>

                    <tr>
    	                <td class="term">VascularInv</td>
    	                <td>vascular invasion</td>
                    </tr>

                    <tr>
    	                <td class="term">LNI</td>
    	                <td>lymph node invasion</td>
                    </tr>

                    <tr>
    	                <td class="term">StageSystem</td>
    	                <td>Staging System</td>
                    </tr>

                    <tr>
    	                <td class="term">PathStage</td>
    	                <td>T stage from prostatectomy</td>
                    </tr>

                    <tr>
    	                <td class="term">PostRP_HormType</td>
    	                <td>Type of post-surgery hormones</td>
                    </tr>

                    <tr>
    	                <td class="term">PostRP_HormStartDate</td>
    	                <td>post-surgery hormones start date</td>
                    </tr>

                    <tr>
    	                <td class="term">PostRP_HormStopDate</td>
    	                <td>post-surgery hormones stop date</td>
                    </tr>

                    <tr>
    	                <td class="term">PostRP_HormDuration</td>
    	                <td>Duration of post-surgery hormones</td>
                    </tr>

                    <tr>
    	                <td class="term">PostRP_RadTxType</td>
    	                <td>Type of post-surgery radiation</td>
                    </tr>

                    <tr>
    	                <td class="term">PostRP_RadTxDose</td>
    	                <td>post-surgery radiation dose</td>
                    </tr>

                    <tr>
    	                <td class="term">PostRP_RadTxDate</td>
    	                <td>Date of post-surgery radiation</td>
                    </tr>

                    <tr>
    	                <td class="term">PostRP_RadTxTarget</td>
    	                <td>post-surgery radiation target</td>
                    </tr>

                    <tr>
    	                <td class="term">PostRP_RadTxFreeTime</td>
    	                <td>Time to post-surgery radiation</td>
                    </tr>

                    <tr>
    	                <td class="term">PostRP_BrachyType</td>
    	                <td>Type of post-surgery brachytherapy</td>
                    </tr>

                    <tr>
    	                <td class="term">PostRP_BrachyDate</td>
    	                <td>Date of post-surgery brachytherapy</td>
                    </tr>

                    <tr>
    	                <td class="term">PostRP_BrachyFreeTime</td>
    	                <td>Time to post-surgery brachytherapy</td>
                    </tr>

                    <tr>
    	                <td class="term">PostRP_ChemoDate</td>
    	                <td>Date of post-surgery chemotherapy</td>
                    </tr>

                    <tr>
    	                <td class="term">PostRP_ChemoAgent</td>
    	                <td>post-surgery chemotherapy agent</td>
                    </tr>

                    <tr>
    	                <td class="term">PostRP_ChemoFreeTime</td>
    	                <td>Time to post-surgery chemotherapy</td>
                    </tr>

                    <tr>
    	                <td class="term">PostRP_ClinTrialDate</td>
    	                <td>post-surgery chemotherapy clinic trials details</td>
                    </tr>

                    <tr>
    	                <td class="term">PostRP_ClinTrialAgent</td>
    	                <td></td>
                    </tr>

                    <tr>
    	                <td class="term">PostRP_ClinTrialFreeTime</td>
    	                <td></td>
                    </tr>

                    <tr>
    	                <td class="term">BCR_Date</td>
    	                <td>Biochemical recurrence date</td>
                    </tr>

                    <tr>
    	                <td class="term">BCR_PSA_Value</td>
    	                <td>Value of PSA at biochemical recurrence</td>
                    </tr>

                    <tr>
    	                <td class="term">BCR_FreeTime</td>
    	                <td>Time to biochemical recurrence</td>
                    </tr>

                    <tr>
    	                <td class="term">LCR_BxDate</td>
    	                <td>Date of local recurrence biopsy</td>
                    </tr>

                    <tr>
    	                <td class="term">LCR_BxQuality</td>
    	                <td>Type of local recurrence biopsy</td>
                    </tr>

                    <tr>
    	                <td class="term">LCR_BxGG1</td>
    	                <td>Quality of local recurrence biopsy</td>
                    </tr>

                    <tr>
    	                <td class="term">LCR_BxGG2</td>
    	                <td>Primary gleason score from local recurrence biopsy</td>
                    </tr>

                    <tr>
    	                <td class="term">LCR_BxGGS</td>
    	                <td>Secondary gleason score from local recurrence biopsy</td>
                    </tr>

                    <tr>
    	                <td class="term">MetsFreeTime</td>
    	                <td>Time to metastasis</td>
                    </tr>

				</table>
			</div>
			
			
			<p>This is just a brief explanation of this section, which provides a list of the fields that are exported and has a brief description of each.</p>
			
			
			
		</div>
	</div></div></div>
	-->
	
        
    </div>
    </form>
</body>
</html>
