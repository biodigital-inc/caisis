<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Bladder.Eforms.BreastProcedure" CodeFile="BreastProcedure.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<%-- javascript moved to end of this file - jf --%>

<style type="text/css">
	.controlBoxDataGridTitleColumn {background-color: #E2E6E9;}
	.controlBoxDataGridValueColumn {background-color: #E8EBED;}
	
	.controlBoxDataGridTitleColumn td {color: #111111;}
	.controlBoxDataGridValueColumn td {color: #111111;}
	
</style>


<a name="BreastProcedure" id="BreastProcedure" />
<table width="600" border="0" cellspacing="0" cellpadding="4" class="eformXLargePopulatedTable">
    <tr> 
        <td height="18" align="left" class="controlBoxTitle" width="105">Surgery Date</td>
        <td><euc:EformTextBox RecordId="1" TABLE="OperatingRoomDetails" FIELD="OpDateText" ID="OpDateText_1" Runat="server" Width="100px" 
            ShowCalendar="True" CalcDate="True" class="InputText"/>
	        <euc:EformHidden  RecordId="1" TABLE="OperatingRoomDetails" FIELD="OpDate" ID="OpDate_1" Runat="server" />		
	    </td>
	    <td height="18" align="left" class="controlBoxTitle" width="115">Surgeon</td>
	    <td><euc:EformComboBox LookupCode="OpSurgeon,Disease,Breast" DropDownWidth="280px" id="OpCaseSurgeon_1" RecordId="1" Table="OperatingRoomDetails" 
	        Field="OpCaseSurgeon" runat="server" onblur="updateORQlty();"/>
	         <euc:EformTextBox id="OpQuality_1" RecordId="1" Table="OperatingRoomDetails" Field="OpQuality" runat="server" Width="1px" 
	            style="display:none"/>         
	    </td>
    </tr>
</table><br /><br />
<asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Breast Procedure"></asp:Label><br/>
<table border="0" cellspacing="0" cellpadding="16" width="700" class="eformXLargePopulatedTable">
 <tr >
	<td style="white-space:nowrap;"><strong>Breast Procedure Performed?</strong><euc:EformRadioButtonList Table="NoTable" Field="Breast_ProcName" id="ProcName_Breast" runat="server" 
	    RepeatLayout="Flow" RepeatDirection="Horizontal" style="margin-left: 30px;">
		    <asp:ListItem>Yes</asp:ListItem>
            <asp:ListItem>No</asp:ListItem>
		</euc:EformRadioButtonList></td>
  </tr>
 <tr id="BreastProcDetails" style="display: none;">
 <td style="padding: 0px;">
 <table border="0" cellspacing="0" cellpadding="16" width="100%"> 
     <tr >
       <td style="padding-top: 0px; vertical-align: top; ">
        <table border="0" cellpadding="0" cellspacing="0" class="controlBoxDataGridTable"  style="margin-bottom: 0px; margin-left: 0px; margin-top: 0px; border: solid 1px #cccccc; background-color: #ffffff;">
           <tr>
             <td class="controlBoxDataGridHeader" style="font-size:10px;">Date</td>
             <td class="controlBoxDataGridHeader" style="font-size:10px;">Procedure</td>
             <td class="controlBoxDataGridHeader" style="font-size:10px;">Side</td>
             <td class="controlBoxDataGridHeader" style="font-size:10px;">Approach</td>
             <td class="controlBoxDataGridHeader" style="font-size:10px;">Indication</td>
             <td class="controlBoxDataGridHeader" style="font-size:10px;">Surgeon</td>
            </tr>
           <tr id="BreastProcRow">
             <td style="padding-left: 10px; height: 24px;">
                <euc:EformTextBox id="ProcDateText_13" Table="Procedures" Field="ProcDateText" RecordId="13" runat="server"   ShowCalendar="True" CalcDate="True" style="width: 80px;" />
               <euc:EformHidden id="ProcDate_13" Table="Procedures" Field="ProcDate"  RecordId="13" runat="server"/></td>
             <td style="padding-left: 10px;" >
                <euc:EformComboBox  runat="server" LookupCode="ProcName, Disease, Breast" MaxLength="50" style="width:140px;" Field="ProcName" RecordId="13" Table="Procedures" id="ProcName_13" EnableHiddenOnUIEvent="ProcSite_13,ProcQuality_13"  />
                
		        <euc:EformHidden id="ProcSite_13" runat="server" RecordId="13" Table="Procedures" Field="ProcSite" Value="Breast" />
                <euc:EformHidden id="ProcQuality_13" runat="server" RecordId="13" Table="Procedures" Field="ProcQuality" Value="STD" />         </td>
             <td style="padding-left: 10px;" >
                <euc:EFormDropDownList style="width:56px;" LookupCode="OpSide" runat="server"  Field="ProcSide" RecordId="13" Table="Procedures" 
                    id="ProcSide_13" onblur="updatePathSide();" />         </td>
             <td style="padding-left: 10px;" ><euc:EformComboBox  runat="server" LookupCode="OpApproach" style="width:90px;" MaxLength="50" Field="ProcApproach" RecordId="13" Table="Procedures" id="ProcApproach_13" /></td>
             <td style="padding-left: 10px;" ><euc:EformComboBox  runat="server" LookupCode="Indication" style="width:100px;" MaxLength="50" Field="ProcIndication" RecordId="13" Table="Procedures" id="ProcIndication_13" /></td>
             <td style="padding-left: 10px;" >
                <euc:EformComboBox  runat="server" LookupCode="OpSurgeon" style="width:100px;" Field="ProcSurgeon" RecordId="13" 
                    Table="Procedures" id="ProcSurgeon_13"/>         </td>
            </tr>
         </table></td>
      </tr>
     <tr >
       <td ><table cellspacing="0" cellpadding="0" class="controlBoxDataGridTable" style="border:solid 1px #cccccc; margin-left: 0px;background-color: #ffffff;">
         <tr>
             <td class="controlBoxDataGridHeader" style="font-size:10px;" align="center">Path Report Date</td>
             <td class="controlBoxDataGridHeader" style="font-size:10px;" align="center">Primary Histology</td>
         </tr>
         <tr id="BreastProcPathRow"  >
            <td style="padding-left: 20px; height: 24px; padding-right: 20px;" align="center">
                <euc:EformTextBox id="PathologyDateText_1" Table="Pathology" Field="PathDateText" RecordId="1" runat="server" ShowCalendar="True" 
                    CalcDate="True" style="width: 80px;"  />
               <euc:EformHidden id="PathologyDate_1" Table="Pathology" Field="PathDate"  RecordId="1" runat="server"/></td>
           <td align="center"><euc:EformComboBox id="PathHistology_1" LookupCode="PathHistology, Disease, Breast" Table="Pathology" Field="PathHistology"  RecordId="1" runat="server" DropDownWidth="400" style="width: 400px;" EnableHiddenOnUIEvent="PathSite_1,PathQuality_1"/>
               <euc:EformTextBox id="PathSide_1" Table="Pathology" Field="PathSide" RecordId="1" runat="server" Width="1px" style="display:none"/>
               <euc:EformHidden id="PathSite_1" Table="Pathology" Field="PathSite"  RecordId="1" runat="server" Value="Breast" />
               <euc:EformHidden id="PathQuality_1" Table="Pathology" Field="PathQuality"  RecordId="1" runat="server" Value="STD" /></td>

         </tr>

       </table></td>
      </tr>
     <tr>
       <td ><strong>Pathology Findings</strong>&nbsp;&nbsp;&nbsp;(Breast)
         <table width="550" border="0" cellpadding="0" cellspacing="0" class="controlBoxDataGridTable" id="BreastProcedurePathFindingsHtmlTable"  style="margin-bottom: 0px; margin-left: 0px; margin-top: 0px; border: solid 1px #cccccc; background-color: #ffffff;">
        <tr> 
          <td class="controlBoxDataGridHeader" style="font-size:10px;">Side</td>
          <td   height="18" class="controlBoxDataGridHeader" style="font-size:10px;">Site</td>
          <td   class="controlBoxDataGridHeader" style="font-size:10px;" colspan="2">Histology</td>
          </tr>

        <tr  id="BreastPathFindingsRow1"> 
          <td style="padding-left: 10px; height: 24px;"><euc:EFormDropDownList style="width:86px;" LookupCode="FindSide" DropDownHeight="auto" DropDownWidth="auto" runat="server"  Field="PathFindSide" RecordId="1" ParentRecordId="1" Table="PathologyFinding" id="PathFindSide_1"  /></td>
          <td style="padding-left: 10px;" ><euc:EFormDropDownList  LookupCode="DxTarget" DropDownHeight="auto" runat="server"  Field="PathFindSite" RecordId="1" ParentRecordId="1" Table="PathologyFinding" id="PathFindSite_1"  /></td>
          <td style="padding-left: 20px;"><euc:EformComboBox id="PathFindHistology_1" LookupCode="PathHistology, Disease, Breast" Table="PathologyFinding" Field="PathFindHistology"  ParentRecordId="1" RecordId="1" style="width: 270px;" runat="server" /></td>
          <td><euc:EformDeleteIcon ID="EformDeleteIcon1" runat="server"/></td>
        </tr>
	    <tr id="BreastPathFindingsRow2"> 
          <td style="padding-left: 10px; height: 24px;"><euc:EFormDropDownList style="width:86px;" LookupCode="FindSide" DropDownHeight="auto" DropDownWidth="auto" runat="server"  Field="PathFindSide" RecordId="2" ParentRecordId="1" Table="PathologyFinding" id="PathFindSide_2"  /></td>
          <td style="padding-left: 10px;" ><euc:EFormDropDownList  LookupCode="DxTarget" DropDownHeight="auto" runat="server"  Field="PathFindSite" RecordId="2" ParentRecordId="1" Table="PathologyFinding" id="PathFindSite_2"  /></td>
          <td style="padding-left: 20px;"><euc:EformComboBox id="PathFindHistology_2" LookupCode="PathHistology, Disease, Breast" Table="PathologyFinding" Field="PathFindHistology"  ParentRecordId="1"  RecordId="2" style="width: 270px;" runat="server" /></td>
          <td><euc:EformDeleteIcon ID="EformDeleteIcon10" runat="server"/></td>
	    </tr>
	    <tr id="BreastPathFindingsRow3"> 
		      <td style="padding-left: 10px; height: 24px;"><euc:EFormDropDownList style="width:86px;" LookupCode="FindSide" DropDownHeight="auto" DropDownWidth="auto" runat="server"  Field="PathFindSide" RecordId="3" ParentRecordId="1" Table="PathologyFinding" id="PathFindSide_3"  /></td>
		      <td style="padding-left: 10px;" ><euc:EFormDropDownList  LookupCode="DxTarget" DropDownHeight="auto" runat="server"  Field="PathFindSite" RecordId="3" ParentRecordId="1" Table="PathologyFinding" id="PathFindSite_3"  /></td>
		      <td style="padding-left: 20px;"><euc:EformComboBox id="PathFindHistology_3" LookupCode="PathHistology, Disease, Breast" Table="PathologyFinding" Field="PathFindHistology"  ParentRecordId="1"  RecordId="3" style="width: 270px;" runat="server" /></td>
		      <td><euc:EformDeleteIcon ID="EformDeleteIcon2" runat="server"/></td>
	    </tr>
	    <tr id="BreastPathFindingsRow4"> 
		      <td style="padding-left: 10px; height: 24px;"><euc:EFormDropDownList style="width:86px;" LookupCode="FindSide" DropDownHeight="auto" DropDownWidth="auto" runat="server"  Field="PathFindSide" RecordId="4" ParentRecordId="1" Table="PathologyFinding" id="PathFindSide_4"  /></td>
		      <td style="padding-left: 10px;" ><euc:EFormDropDownList  LookupCode="DxTarget" DropDownHeight="auto" runat="server"  Field="PathFindSite" RecordId="4" ParentRecordId="1" Table="PathologyFinding" id="PathFindSite_4"  /></td>
		      <td style="padding-left: 20px;"><euc:EformComboBox id="PathFindHistology_4" LookupCode="PathHistology, Disease, Breast" Table="PathologyFinding" Field="PathFindHistology"  ParentRecordId="1"  RecordId="4" style="width: 270px;" runat="server" /></td>
		      <td><euc:EformDeleteIcon ID="EformDeleteIcon3" runat="server"/></td>
	    </tr>
	    <tr id="BreastPathFindingsRow5"> 
          <td style="padding-left: 10px; height: 24px;"><euc:EFormDropDownList style="width:86px;" LookupCode="FindSide" DropDownHeight="auto" DropDownWidth="auto" runat="server"  Field="PathFindSide" RecordId="5" ParentRecordId="1" Table="PathologyFinding" id="PathFindSide_5"  /></td>
          <td style="padding-left: 10px;" ><euc:EFormDropDownList  LookupCode="DxTarget" DropDownHeight="auto" runat="server"  Field="PathFindSite" RecordId="5" ParentRecordId="1" Table="PathologyFinding" id="PathFindSite_5"  /></td>
          <td style="padding-left: 20px;"><euc:EformComboBox id="PathFindHistology_5" LookupCode="PathHistology, Disease, Breast" Table="PathologyFinding" Field="PathFindHistology"  ParentRecordId="1"  RecordId="5" style="width: 270px;" runat="server" /></td>
          <td><euc:EformDeleteIcon ID="EformDeleteIcon4" runat="server"/></td>
    </tr>
    <tr style="display: none;" id="BreastPathFindingsRow6"> 
          <td style="padding-left: 10px; height: 24px;"><euc:EFormDropDownList style="width:86px;" LookupCode="FindSide" DropDownHeight="auto" DropDownWidth="auto" runat="server"  Field="PathFindSide" RecordId="6" ParentRecordId="1" Table="PathologyFinding" id="PathFindSide_6"  /></td>
          <td style="padding-left: 10px;" ><euc:EFormDropDownList  LookupCode="DxTarget" DropDownHeight="auto" runat="server"  Field="PathFindSite" RecordId="6" ParentRecordId="1" Table="PathologyFinding" id="PathFindSite_6"  /></td>
          <td style="padding-left: 20px;"><euc:EformComboBox id="PathFindHistology_6" LookupCode="PathHistology, Disease, Breast" Table="PathologyFinding" Field="PathFindHistology"  ParentRecordId="1"  RecordId="6" style="width: 270px;" runat="server" /></td>
          <td><euc:EformDeleteIcon ID="EformDeleteIcon5" runat="server"/></td>
    </tr>
    <tr style="display: none;" id="BreastPathFindingsRow7"> 
          <td style="padding-left: 10px; height: 24px;"><euc:EFormDropDownList style="width:86px;" LookupCode="FindSide" DropDownHeight="auto" DropDownWidth="auto" runat="server"  Field="PathFindSide" RecordId="7" ParentRecordId="1" Table="PathologyFinding" id="PathFindSide_7"  /></td>
          <td style="padding-left: 10px;" ><euc:EFormDropDownList  LookupCode="DxTarget" DropDownHeight="auto" runat="server"  Field="PathFindSite" RecordId="7" ParentRecordId="1" Table="PathologyFinding" id="PathFindSite_7"  /></td>
          <td style="padding-left: 20px;"><euc:EformComboBox id="PathFindHistology_7" LookupCode="PathHistology, Disease, Breast" Table="PathologyFinding" Field="PathFindHistology"  ParentRecordId="1"  RecordId="7" style="width: 270px;" runat="server" /></td>
          <td><euc:EformDeleteIcon ID="EformDeleteIcon6" runat="server"/></td>
    </tr>
    <tr style="display: none;" id="BreastPathFindingsRow8"> 
          <td style="padding-left: 10px; height: 24px;"><euc:EFormDropDownList style="width:86px;" LookupCode="FindSide" DropDownHeight="auto" DropDownWidth="auto" runat="server"  Field="PathFindSide" RecordId="8" ParentRecordId="1" Table="PathologyFinding" id="PathFindSide_8"  /></td>
          <td style="padding-left: 10px;" ><euc:EFormDropDownList  LookupCode="DxTarget" DropDownHeight="auto" runat="server"  Field="PathFindSite" RecordId="8" ParentRecordId="1" Table="PathologyFinding" id="PathFindSite_8"  /></td>
          <td style="padding-left: 20px;"><euc:EformComboBox id="PathFindHistology_8" LookupCode="PathHistology, Disease, Breast" Table="PathologyFinding" Field="PathFindHistology"  ParentRecordId="1"  RecordId="8" style="width: 270px;" runat="server" /></td>
          <td><euc:EformDeleteIcon ID="EformDeleteIcon7" runat="server"/></td>
    </tr>
    <tr style="display: none;" id="BreastPathFindingsRow9"> 
          <td style="padding-left: 10px; height: 24px;"><euc:EFormDropDownList style="width:86px;" LookupCode="FindSide" DropDownHeight="auto" DropDownWidth="auto" runat="server"  Field="PathFindSide" RecordId="9" ParentRecordId="1" Table="PathologyFinding" id="PathFindSide_9"  /></td>
          <td style="padding-left: 10px;" ><euc:EFormDropDownList  LookupCode="DxTarget" DropDownHeight="auto" runat="server"  Field="PathFindSite" RecordId="9" ParentRecordId="1" Table="PathologyFinding" id="PathFindSite_9"  /></td>
          <td style="padding-left: 20px;"><euc:EformComboBox id="PathFindHistology_9" LookupCode="PathHistology, Disease, Breast" Table="PathologyFinding" Field="PathFindHistology"  ParentRecordId="1"  RecordId="9" style="width: 270px;" runat="server" /></td>
          <td><euc:EformDeleteIcon ID="EformDeleteIcon8" runat="server"/></td>
    </tr>
    <tr style="display: none;" id="BreastPathFindingsRow10"> 
          <td style="padding-left: 10px; height: 24px;"><euc:EFormDropDownList style="width:86px;" LookupCode="FindSide" DropDownHeight="auto" DropDownWidth="auto" runat="server"  Field="PathFindSide" RecordId="10" ParentRecordId="1" Table="PathologyFinding" id="PathFindSide_10"  /></td>
          <td style="padding-left: 10px;" ><euc:EFormDropDownList  LookupCode="DxTarget" DropDownHeight="auto" runat="server"  Field="PathFindSite" RecordId="10" ParentRecordId="1" Table="PathologyFinding" id="PathFindSite_10"  /></td>
          <td style="padding-left: 20px;"><euc:EformComboBox id="PathFindHistology_10" LookupCode="PathHistology, Disease, Breast" Table="PathologyFinding" Field="PathFindHistology"  ParentRecordId="1"  RecordId="10" style="width: 270px;" runat="server" /></td>
          <td><euc:EformDeleteIcon ID="EformDeleteIcon9" runat="server"/></td>
    </tr>
    </table><img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" onclick="return showFirstAdditionalRow(this,'BreastProcedurePathFindingsHtmlTable');" /></td>
     </tr>
     <tr >
       <td style=""><table border="0" cellspacing="0" cellpadding="4" style="width: 70%; border: solid 1px #cccccc;">
         <tr class="controlBoxDataGridTitleColumn" id="BreastTumorDimRow">
           <td height="24" style="width: 180px; font-weight: bold;">Tumor Max Dimension (cm)</td>
           <td ><euc:EformTextBox id="PathTumorMaxDim_1"  Table="BreastPath" Field="PathTumorMaxDim" ParentRecordId="1" RecordId="1" runat="server" style="width: 100px;" ShowNumberPad="true"/></td>
         </tr>
	     <tr class="controlBoxDataGridValueColumn" id="BreastExtentInSituRow">
	     <td height="24" style="font-weight: bold;">Extent of In Situ</td>
	       <td ><euc:EFormSelect id="PathExtentInSitu_1" LookupCode="BreastExtentInSitu"  Table="BreastPath" DropDownHeight="auto" DropDownWidth="120"  Field="PathExtentInSitu" ParentRecordId="1" RecordId="1" runat="server" style="width: 100px;"/></td>
         </tr>
	     <tr class="controlBoxDataGridTitleColumn" id="BreastOverallGradeRow">
	     <td height="24" style="font-weight: bold;">Overall Grade</td>
	       <td ><euc:EformComboBox id="PathOverallGrade_1" LookupCode="PathGrade"  Table="BreastPath" DropDownHeight="auto" DropDownWidth="250"  Field="PathOverallGrade" ParentRecordId="1" RecordId="1" runat="server" style="width: 120px;"/></td>
         </tr>
	     <tr class="controlBoxDataGridTitleColumn" id="BreastNuclearGradeRow">
	     <td height="24" style="font-weight: bold;">Nuclear Grade</td>
	       <td ><euc:EformComboBox id="PathNuclearGrade_1" LookupCode="BreastNuclearGrade"  Table="BreastPath" DropDownHeight="auto" DropDownWidth="120"  Field="PathNuclearGrade" ParentRecordId="1" RecordId="1" runat="server" style="width: 100px;"/></td>
         </tr>
	     <%--<tr class="controlBoxDataGridValueColumn">
	     <td height="24" style="font-weight: bold;">LVI Invasion</td>
	       <td ><euc:EformComboBox id="PathLVIInv" LookupCode="YesNoUnknown"  Table="NoTable" DropDownHeight="auto" DropDownWidth="80"  Field="PathLVIInv" runat="server" style="width: 70px;"/></td>
         </tr>
	     --%>
	     <tr class="controlBoxDataGridValueColumn" id="BreastLVIRow">
	     <td height="24" style="font-weight: bold;">LVI</td>
	       <td >
	       
	       <euc:EformRadioButtonList Table="BreastPath" ParentRecordId="1" RecordId="1"  Field="PathLymphaticInv" id="PathLymphaticInv_1" runat="server" RepeatLayout="Table" RepeatDirection="Horizontal" >
		    <asp:ListItem>Yes</asp:ListItem>
            <asp:ListItem>No</asp:ListItem>
		</euc:EformRadioButtonList>
</td>
         </tr>
	     <%--<tr class="controlBoxDataGridTitleColumn">
	     <td height="24" style="font-weight: bold;">Vascular Invasion</td>
	       <td >
	       <euc:EformCheckBox id="PathVascularInv_1" Table="BreastPath" Field="PathVascularInv" ParentRecordId="1" RecordId="1" runat="server" value="Yes" />Yes</td>
         </tr>
	     <tr class="controlBoxDataGridValueColumn">
	     <td height="24" style="font-weight: bold;">Perineural Invasion</td>
	       <td >
	        <euc:EformCheckBox id="PathPerineuralInv_1" Table="BreastPath" Field="PathPerineuralInv" ParentRecordId="1" RecordId="1" runat="server" value="Yes" />Yes</td>
         </tr>--%>
    	 
	     <tr class="controlBoxDataGridTitleColumn" id="BreastMultifocalRow">
	     <td height="24" style="font-weight: bold;">Multifocal Tumor</td>
	       <td ><euc:EformSelect id="PathMultifocal_1" LookupCode="YesNoUnknown"  Table="BreastPath" DropDownHeight="auto" DropDownWidth="auto"  Field="PathMultifocal" ParentRecordId="1" RecordId="1" runat="server" style="width: 70px;"/></td>
         </tr>
	     <tr class="controlBoxDataGridTitleColumn" id="BreastMulticentricRow">
	     <td height="24" style="font-weight: bold;">Multicentric Tumor</td>
	       <td ><euc:EformSelect id="PathMulticentric_1" LookupCode="YesNoUnknown"  Table="BreastPath" DropDownHeight="auto" DropDownWidth="auto"  Field="PathMulticentric" ParentRecordId="1" RecordId="1" runat="server" style="width: 70px;"/></td>
         </tr>
	     <tr class="controlBoxDataGridValueColumn" id="BreastReexcisionsRow">
	     <td height="24" style="font-weight: bold;">Number of reexcisions</td>
	       <td ><euc:EformTextBox id="PathNumReExcision_1"  Table="BreastPath" Field="PathNumReExcision" ParentRecordId="1" RecordId="1" runat="server" style="width: 70px;"/></td>
         </tr>
	     <tr class="controlBoxDataGridTitleColumn" id="BreastMarginStatusRow">
	     <td height="24" style="font-weight: bold;">Margin Status</td>
	       <td ><euc:EformComboBox id="PathMargin_1" LookupCode="MarginStatus,Disease,Breast"  Table="BreastPath" DropDownHeight="auto" DropDownWidth="170"  Field="PathMargin" ParentRecordId="1" RecordId="1" runat="server" style="width: 150px;"/></td>
         </tr>
	     <tr class="controlBoxDataGridValueColumn" id="BreastPosMarginsRow">
	     <td height="24" style="font-weight: bold;"># of Positive Margins</td>
	       <td ><euc:EformTextBox id="PathNumPositiveMargins_1"  Table="BreastPath"   Field="PathNumPositiveMargins" ParentRecordId="1" RecordId="1" runat="server" style="width: 70px;"/></td>
         </tr>
       </table></td>
      </tr>
     <tr >
       <td ><strong>Pathology Stage/Grade </strong>&nbsp;&nbsp;&nbsp;(Breast)
         <table width="400" border="0" cellpadding="0" cellspacing="0" class="controlBoxDataGridTable" style="margin-bottom: 0px; margin-left: 0px; margin-top: 0px; border: solid 1px #cccccc; background-color: #ffffff;">
             <tr>
               <td class="controlBoxDataGridHeader" style="font-size:10px;">T</td>
               <td class="controlBoxDataGridHeader" style="font-size:10px;">N</td>
               <td   height="18" class="controlBoxDataGridHeader" style="font-size:10px;">M</td>
               <td   class="controlBoxDataGridHeader" style="font-size:10px;">Grade</td>
               <td   class="controlBoxDataGridHeader" style="font-size:10px;">Side</td>
               <td class="controlBoxDataGridHeader" style="font-size:10px;"></td>
             </tr>
             <tr id="BreastPathStageRow1">
               <td style="padding-left: 10px; height: 24px;">
		       <euc:EformHidden id="PathStageDisease_1" runat="server" RecordId="1" ParentRecordId="1" Table="PathologyStageGrade" Field="PathStageDisease" Value="Breast" />
	       <euc:EformHidden id="PathStageSystem_1" runat="server" RecordId="1" ParentRecordId="1" Table="PathologyStageGrade" Field="PathStageSystem" Value="AJCC_02" />
	    <euc:EformSelect id="PathStageT_1" LookupCode="StagePath_Breast_02_T"  Table="PathologyStageGrade" DropDownWidth="450"  Field="PathStageT" ParentRecordId="1" RecordId="1" runat="server" style="width: 80px;" EnableHiddenOnUIEvent="PathStageDisease_1,PathStageSystem_1"/></td>
               <td style="padding-left: 10px;" ><euc:EformSelect id="PathStageN_1" LookupCode="StagePath_Breast_02_N"  Table="PathologyStageGrade" DropDownWidth="450"  Field="PathStageN" ParentRecordId="1" RecordId="1" runat="server" style="width: 80px;" EnableHiddenOnUIEvent="PathStageDisease_1,PathStageSystem_1"/></td>
               <td style="padding-left: 10px;" ><euc:EformSelect id="PathStageM_1" LookupCode="StagePath_Breast_02_M"  Table="PathologyStageGrade" DropDownWidth="300" DropDownHeight="auto"  Field="PathStageM" ParentRecordId="1" RecordId="1" runat="server" style="width: 80px;" EnableHiddenOnUIEvent="PathStageDisease_1,PathStageSystem_1"/></td>
               <td style="padding-left: 10px;padding-right: 10px;"><euc:EformSelect id="PathGrade_1" LookupCode="PathGrade, Disease, Breast"  Table="PathologyStageGrade" DropDownWidth="180"  Field="PathGrade" ParentRecordId="1" RecordId="1" runat="server" style="width: 100px;" EnableHiddenOnUIEvent="PathStageDisease_1,PathStageSystem_1"/></td>
               <%--PathStageGrade side is updating into PathNotes field--%>
               <td style="padding-left: 10px;padding-right: 10px;"><euc:EformDropDownList id="PathGradeSide_1" LookupCode="OpSide"  Field="PathNotes" 
                Table="PathologyStageGrade" ParentRecordId="1" RecordId="1" runat="server" style="width: 100px;" /></td>
               <td><euc:EformDeleteIcon ID="EformDeleteIcon11" runat="server"/></td>
             </tr>
             <tr id="BreastPathStageRow2">
               <td style="padding-left: 10px; height: 24px;">
		       <euc:EformHidden id="PathStageDisease_2" runat="server" RecordId="2" ParentRecordId="1" Table="PathologyStageGrade" Field="PathStageDisease" Value="Breast" />
	       <euc:EformHidden id="PathStageSystem_2" runat="server" RecordId="2" ParentRecordId="1" Table="PathologyStageGrade" Field="PathStageSystem" Value="AJCC_02" />
	    <euc:EformSelect id="PathStageT_2" LookupCode="StagePath_Breast_02_T"  Table="PathologyStageGrade" DropDownWidth="450"  Field="PathStageT" ParentRecordId="1" RecordId="2" runat="server" style="width: 80px;" EnableHiddenOnUIEvent="PathStageDisease_2,PathStageSystem_2"/></td>
               <td style="padding-left: 10px;" ><euc:EformSelect id="PathStageN_2" LookupCode="StagePath_Breast_02_N"  Table="PathologyStageGrade" DropDownWidth="450"  Field="PathStageN" ParentRecordId="1" RecordId="2" runat="server" style="width: 80px;" EnableHiddenOnUIEvent="PathStageDisease_2,PathStageSystem_2"/></td>
               <td style="padding-left: 10px;" ><euc:EformSelect id="PathStageM_2" LookupCode="StagePath_Breast_02_M"  Table="PathologyStageGrade" DropDownWidth="300" DropDownHeight="auto"  Field="PathStageM" ParentRecordId="1" RecordId="2" runat="server" style="width: 80px;" EnableHiddenOnUIEvent="PathStageDisease_2,PathStageSystem_2"/></td>
               <td style="padding-left: 10px;padding-right: 10px;"><euc:EformSelect id="PathGrade_2" LookupCode="PathGrade, Disease, Breast"  Table="PathologyStageGrade" DropDownWidth="180"  Field="PathGrade" ParentRecordId="1" RecordId="2" runat="server" style="width: 100px;" EnableHiddenOnUIEvent="PathStageDisease_2,PathStageSystem_2"/></td>
               <%--PathStageGrade side is updating into PathNotes field--%>
               <td style="padding-left: 10px;padding-right: 10px;"><euc:EformDropDownList id="PathGradeSide_2" LookupCode="OpSide"  Field="PathNotes" 
                Table="PathologyStageGrade" ParentRecordId="1" RecordId="2" runat="server" style="width: 100px;" /></td>
               <td><euc:EformDeleteIcon ID="EformDeleteIcon12" runat="server"/></td>
             </tr>
           </table>    </td>
     </tr>
     <tr >
       <td ><strong>Pathology Tests  </strong>&nbsp;&nbsp;&nbsp;(Breast)
           <table width="550" border="0" cellpadding="0" cellspacing="0" class="controlBoxDataGridTable" id="PathTestHtmlTable"  style="margin-bottom: 0px; margin-left: 0px; margin-top: 0px; border: solid 1px #cccccc; background-color: #ffffff;">
             <tr>
               <td class="controlBoxDataGridHeader" style="font-size:10px;">Date</td>
               <td class="controlBoxDataGridHeader" style="font-size:10px;">Test</td>
               <td   height="18" class="controlBoxDataGridHeader" style="font-size:10px;">Result</td>
               <td   class="controlBoxDataGridHeader" style="font-size:10px;" colspan="2">Notes</td>
             </tr>
             <tr id="BreastPathTestRow1">
               <td style="padding-left: 10px; height: 24px;"><euc:EformTextBox id="PathDateText_1" Table="PathTest" Field="PathDateText" RecordId="1" ParentRecordId="1" runat="server"   ShowCalendar="True" CalcDate="True" style="width: 80px;"  />
                   <euc:EformHidden id="PathDate_1" Table="PathTest" Field="PathDate" ParentRecordId="1"  RecordId="1" runat="server"/></td>
               <td style="padding-left: 10px;" >
		       <euc:EformComboBox id="PathTest_1" LookupCode="PathTest,PathSite,Breast"  Table="PathTest" DropDownHeight="auto" DropDownWidth="150"  Field="PathTest" ParentRecordId="1" RecordId="1" runat="server" style="width: 100px;" onblur="setDefaultBreastPathTestDate(this,1)"/></td>
               <td style="padding-left: 10px;" ><euc:EformComboBox id="PathResult_1" LookupCode="PathTestResult,Disease,Breast"  Table="PathTest" DropDownHeight="auto" DropDownWidth="auto"  Field="PathResult" ParentRecordId="1" RecordId="1" runat="server" style="width: 70px;"/></td>
               <td style="padding-left: 10px;padding-right: 10px;"><euc:EformTextBox id="PathNotes_1" Table="PathTest" Field="PathNotes" ParentRecordId="1" RecordId="1" runat="server"   style="width: 170px;" ShowTextEditor="True"  /></td>
               <td><euc:EformDeleteIcon ID="EformDeleteIcon13" runat="server"/></td>
             </tr>
 		     <tr id="BreastPathTestRow2">
               <td style="padding-left: 10px; height: 24px;"><euc:EformTextBox id="PathDateText_2" Table="PathTest" Field="PathDateText" RecordId="2" ParentRecordId="1" runat="server"   ShowCalendar="True" CalcDate="True" style="width: 80px;"  />
                   <euc:EformHidden id="PathDate_2" Table="PathTest" Field="PathDate"  ParentRecordId="1"  RecordId="2" runat="server"/></td>
               <td style="padding-left: 10px;" >
		       <euc:EformComboBox id="PathTest_2"  LookupCode="PathTest,PathSite,Breast"  Table="PathTest" DropDownHeight="auto" DropDownWidth="150"  Field="PathTest" ParentRecordId="1" RecordId="2" runat="server" style="width: 100px;" onblur="setDefaultBreastPathTestDate(this,2)" /></td>
               <td style="padding-left: 10px;" ><euc:EformComboBox id="PathResult_2" LookupCode="PathTestResult,Disease,Breast"  Table="PathTest" DropDownHeight="auto" DropDownWidth="auto"  Field="PathResult" ParentRecordId="1" RecordId="2" runat="server" style="width: 70px;"/></td>
               <td style="padding-left: 10px;padding-right: 10px;"><euc:EformTextBox id="PathNotes_2" Table="PathTest" Field="PathNotes" ParentRecordId="1" RecordId="2" runat="server"   style="width: 170px;" ShowTextEditor="True"  /></td>
               <td><euc:EformDeleteIcon ID="EformDeleteIcon14" runat="server"/></td>
             </tr>
		 	 <tr id="BreastPathTestRow3">
               <td style="padding-left: 10px; height: 24px;"><euc:EformTextBox id="PathDateText_3" Table="PathTest" Field="PathDateText" RecordId="3" ParentRecordId="1" runat="server"   ShowCalendar="True" CalcDate="True" style="width: 80px;"  />
                   <euc:EformHidden id="PathDate_3" Table="PathTest" Field="PathDate"  ParentRecordId="1"  RecordId="3" runat="server"/></td>
               <td style="padding-left: 10px;" >
		       <euc:EformComboBox id="PathTest_3"  LookupCode="PathTest,PathSite,Breast"  Table="PathTest" DropDownHeight="auto" DropDownWidth="150"  Field="PathTest" ParentRecordId="1" RecordId="3" runat="server" style="width: 100px;" onblur="setDefaultBreastPathTestDate(this,3)" /></td>
               <td style="padding-left: 10px;" ><euc:EformComboBox id="PathResult_3" LookupCode="PathTestResult,Disease,Breast"  Table="PathTest" DropDownHeight="auto" DropDownWidth="auto"  Field="PathResult" ParentRecordId="1" RecordId="3" runat="server" style="width: 70px;"/></td>
               <td style="padding-left: 10px;padding-right: 10px;"><euc:EformTextBox id="PathNotes_3" Table="PathTest" Field="PathNotes" ParentRecordId="1" RecordId="3" runat="server"   style="width: 170px;" ShowTextEditor="True"  /></td>
               <td><euc:EformDeleteIcon ID="EformDeleteIcon15" runat="server"/></td>
             </tr>
		 	 <tr id="BreastPathTestRow4">
               <td style="padding-left: 10px; height: 24px;"><euc:EformTextBox id="PathDateText_4" Table="PathTest" Field="PathDateText" RecordId="4" ParentRecordId="1" runat="server"   ShowCalendar="True" CalcDate="True" style="width: 80px;"  />
                   <euc:EformHidden id="PathDate_4" Table="PathTest" Field="PathDate"  ParentRecordId="1"  RecordId="4" runat="server"/></td>
               <td style="padding-left: 10px;" >
		       <euc:EformComboBox id="PathTest_4"  LookupCode="PathTest,PathSite,Breast"  Table="PathTest" DropDownHeight="auto" DropDownWidth="150"  Field="PathTest" ParentRecordId="1" RecordId="4" runat="server" style="width: 100px;" onblur="setDefaultBreastPathTestDate(this,4)" /></td>
               <td style="padding-left: 10px;" ><euc:EformComboBox id="PathResult_4" LookupCode="PathTestResult,Disease,Breast"  Table="PathTest" DropDownHeight="auto" DropDownWidth="auto"  Field="PathResult" ParentRecordId="1" RecordId="4" runat="server" style="width: 70px;"/></td>
               <td style="padding-left: 10px;padding-right: 10px;"><euc:EformTextBox id="PathNotes_4" Table="PathTest" Field="PathNotes" ParentRecordId="1" RecordId="4" runat="server"   style="width: 170px;" ShowTextEditor="True"  /></td>
               <td><euc:EformDeleteIcon ID="EformDeleteIcon16" runat="server"/></td>
             </tr>
		     <tr id="BreastPathTestRow5">
               <td style="padding-left: 10px; height: 24px;"><euc:EformTextBox id="PathDateText_5" Table="PathTest" Field="PathDateText" RecordId="5" ParentRecordId="1" runat="server"   ShowCalendar="True" CalcDate="True" style="width: 80px;"  />
                   <euc:EformHidden id="PathDate_5" Table="PathTest" Field="PathDate"  ParentRecordId="1"  RecordId="5" runat="server"/></td>
               <td style="padding-left: 10px;" >
		       <euc:EformComboBox id="PathTest_5"  LookupCode="PathTest,PathSite,Breast"  Table="PathTest" DropDownHeight="auto" DropDownWidth="150"  Field="PathTest" ParentRecordId="1" RecordId="5" runat="server" style="width: 100px;" onblur="setDefaultBreastPathTestDate(this,5)" /></td>
               <td style="padding-left: 10px;" ><euc:EformComboBox id="PathResult_5" LookupCode="PathTestResult,Disease,Breast"  Table="PathTest" DropDownHeight="auto" DropDownWidth="auto"  Field="PathResult" ParentRecordId="1" RecordId="5" runat="server" style="width: 70px;"/></td>
               <td style="padding-left: 10px;padding-right: 10px;"><euc:EformTextBox id="PathNotes_5" Table="PathTest" Field="PathNotes" ParentRecordId="1" RecordId="5" runat="server"   style="width: 170px;" ShowTextEditor="True"  /></td>
               <td><euc:EformDeleteIcon ID="EformDeleteIcon17" runat="server"/></td>
             </tr>
		     <tr style="display: none;" id="BreastPathTestRow6">
               <td style="padding-left: 10px; height: 24px;"><euc:EformTextBox id="PathDateText_6" Table="PathTest" Field="PathDateText" RecordId="6" ParentRecordId="1" runat="server"   ShowCalendar="True" CalcDate="True" style="width: 80px;"  />
                   <euc:EformHidden id="PathDate_6" Table="PathTest" Field="PathDate"  ParentRecordId="1"  RecordId="6" runat="server"/></td>
               <td style="padding-left: 10px;" >
		       <euc:EformComboBox id="PathTest_6"  LookupCode="PathTest,PathSite,Breast"  Table="PathTest" DropDownHeight="auto" DropDownWidth="150"  Field="PathTest" ParentRecordId="1" RecordId="6" runat="server" style="width: 100px;" onblur="setDefaultBreastPathTestDate(this,6)" /></td>
               <td style="padding-left: 10px;" ><euc:EformComboBox id="PathResult_6" LookupCode="PathTestResult,Disease,Breast"  Table="PathTest" DropDownHeight="auto" DropDownWidth="auto"  Field="PathResult" ParentRecordId="1" RecordId="6" runat="server" style="width: 70px;"/></td>
               <td style="padding-left: 10px;padding-right: 10px;"><euc:EformTextBox id="PathNotes_6" Table="PathTest" Field="PathNotes" ParentRecordId="1" RecordId="6" runat="server"   style="width: 170px;" ShowTextEditor="True"  /></td>
               <td><euc:EformDeleteIcon ID="EformDeleteIcon18" runat="server"/></td>
             </tr>
		     <tr style="display: none;" id="BreastPathTestRow7">
               <td style="padding-left: 10px; height: 24px;"><euc:EformTextBox id="PathDateText_7" Table="PathTest" Field="PathDateText" RecordId="7" ParentRecordId="1" runat="server"   ShowCalendar="True" CalcDate="True" style="width: 80px;"  />
                   <euc:EformHidden id="PathDate_7" Table="PathTest" Field="PathDate"  ParentRecordId="1"  RecordId="7" runat="server"/></td>
               <td style="padding-left: 10px;" >
		       <euc:EformComboBox id="PathTest_7"  LookupCode="PathTest,PathSite,Breast"  Table="PathTest" DropDownHeight="auto" DropDownWidth="150"  Field="PathTest" ParentRecordId="1" RecordId="7" runat="server" style="width: 100px;" onblur="setDefaultBreastPathTestDate(this,7)" /></td>
               <td style="padding-left: 10px;" ><euc:EformComboBox id="PathResult_7" LookupCode="PathTestResult,Disease,Breast"  Table="PathTest" DropDownHeight="auto" DropDownWidth="auto"  Field="PathResult" ParentRecordId="1" RecordId="7" runat="server" style="width: 70px;"/></td>
               <td style="padding-left: 10px;padding-right: 10px;"><euc:EformTextBox id="PathNotes_7" Table="PathTest" Field="PathNotes" ParentRecordId="1" RecordId="7" runat="server"   style="width: 170px;" ShowTextEditor="True"  /></td>
               <td><euc:EformDeleteIcon ID="EformDeleteIcon19" runat="server"/></td>
             </tr>
		     <tr style="display: none;" id="BreastPathTestRow8">
               <td style="padding-left: 10px; height: 24px;"><euc:EformTextBox id="PathDateText_8" Table="PathTest" Field="PathDateText" RecordId="8" ParentRecordId="1" runat="server"   ShowCalendar="True" CalcDate="True" style="width: 80px;"  />
                   <euc:EformHidden id="PathDate_8" Table="PathTest" Field="PathDate"  ParentRecordId="1"  RecordId="8" runat="server"/></td>
               <td style="padding-left: 10px;" >
		       <euc:EformComboBox id="PathTest_8"  LookupCode="PathTest,PathSite,Breast"  Table="PathTest" DropDownHeight="auto" DropDownWidth="150"  Field="PathTest" ParentRecordId="1" RecordId="8" runat="server" style="width: 100px;" onblur="setDefaultBreastPathTestDate(this,8)" /></td>
               <td style="padding-left: 10px;" ><euc:EformComboBox id="PathResult_8" LookupCode="PathTestResult,Disease,Breast"  Table="PathTest" DropDownHeight="auto" DropDownWidth="auto"  Field="PathResult" ParentRecordId="1" RecordId="8" runat="server" style="width: 70px;"/></td>
               <td style="padding-left: 10px;padding-right: 10px;"><euc:EformTextBox id="PathNotes_8" Table="PathTest" Field="PathNotes" ParentRecordId="1" RecordId="8" runat="server"   style="width: 170px;" ShowTextEditor="True"  /></td>
               <td><euc:EformDeleteIcon ID="EformDeleteIcon20" runat="server"/></td>
             </tr>
		     <tr style="display: none;" id="BreastPathTestRow9">
               <td style="padding-left: 10px; height: 24px;"><euc:EformTextBox id="PathDateText_9" Table="PathTest" Field="PathDateText" RecordId="9" ParentRecordId="1" runat="server"   ShowCalendar="True" CalcDate="True" style="width: 80px;"  />
                   <euc:EformHidden id="PathDate_9" Table="PathTest" Field="PathDate"  ParentRecordId="1"  RecordId="9" runat="server"/></td>
               <td style="padding-left: 10px;" >
		       <euc:EformComboBox id="PathTest_9"  LookupCode="PathTest,PathSite,Breast"  Table="PathTest" DropDownHeight="auto" DropDownWidth="150"  Field="PathTest" ParentRecordId="1" RecordId="9" runat="server" style="width: 100px;" onblur="setDefaultBreastPathTestDate(this,9)" /></td>
               <td style="padding-left: 10px;" ><euc:EformComboBox id="PathResult_9" LookupCode="PathTestResult,Disease,Breast"  Table="PathTest" DropDownHeight="auto" DropDownWidth="auto"  Field="PathResult" ParentRecordId="1" RecordId="9" runat="server" style="width: 70px;"/></td>
               <td style="padding-left: 10px;padding-right: 10px;"><euc:EformTextBox id="PathNotes_9" Table="PathTest" Field="PathNotes" ParentRecordId="1" RecordId="9" runat="server"   style="width: 170px;" ShowTextEditor="True"  /></td>
               <td><euc:EformDeleteIcon ID="EformDeleteIcon21" runat="server"/></td>
             </tr>
		     <tr style="display: none;" id="BreastPathTestRow10">
               <td style="padding-left: 10px; height: 24px;"><euc:EformTextBox id="PathDateText_10" Table="PathTest" Field="PathDateText" RecordId="10" ParentRecordId="1" runat="server"   ShowCalendar="True" CalcDate="True" style="width: 80px;"  />
                   <euc:EformHidden id="PathDate_10" Table="PathTest" Field="PathDate" ParentRecordId="1"   RecordId="10" runat="server"/></td>
               <td style="padding-left: 10px;" >
		       <euc:EformComboBox id="PathTest_10"  LookupCode="PathTest,PathSite,Breast"  Table="PathTest" DropDownHeight="auto" DropDownWidth="150"  Field="PathTest" ParentRecordId="1" RecordId="10" runat="server" style="width: 100px;" onblur="setDefaultBreastPathTestDate(this,10)" /></td>
               <td style="padding-left: 10px;" ><euc:EformComboBox id="PathResult_10" LookupCode="PathTestResult,Disease,Breast"  Table="PathTest" DropDownHeight="auto" DropDownWidth="auto"  Field="PathResult" ParentRecordId="1" RecordId="10" runat="server" style="width: 70px;"/></td>
               <td style="padding-left: 10px;padding-right: 10px;"><euc:EformTextBox id="PathNotes_10" Table="PathTest" Field="PathNotes" ParentRecordId="1" RecordId="10" runat="server"   style="width: 170px;" ShowTextEditor="True"  /></td>
               <td><euc:EformDeleteIcon ID="EformDeleteIcon22" runat="server"/></td>
             </tr>
         </table>
           <img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" onclick="return showFirstAdditionalRow(this,'PathTestHtmlTable');" /></td>
     </tr>
     <tr id="BreastProcNotesRow">
       <td><strong>Notes</strong><br />
           <euc:EformTextBox id="PathNotes" Table="Pathology" Field="PathNotes" RecordId="1" runat="server" Width="500px" Height="80px" 
                ShowTextEditor="true"/>
       </td>
     </tr>
 </table>
 </td>
 </tr>
</table>
<table>
    <tr id="BreastProcAbsentRow">
        <td>
            <euc:EformTextBox RecordId="1" Table="AbsentEvents" Field="AbsentDateText" ID="AbsentDateText_1"
                runat="server" style="width:1px;display:none;"/>
            <euc:EformTextBox RecordId="1" TABLE="AbsentEvents" FIELD="AbsentDate" ID="AbsentDate_1"
                Runat="server" style="width:1px;display:none;"/>
            <euc:EformTextBox RecordId="1" Table="AbsentEvents" Field="TableName" ID="TableName_1"
                runat="server" style="width:1px;display:none;"/>
            <euc:EformTextBox RecordId="1" Table="AbsentEvents" Field="FieldName" ID="FieldName_1"
                runat="server" style="width:1px;display:none;"/>
            <euc:EformTextBox RecordId="1" Table="AbsentEvents" Field="FieldValue" ID="FieldValue_1"
                runat="server" style="width:1px;display:none;"/>
            <euc:EformTextBox RecordId="1" Table="AbsentEvents" Field="AbsentReason" ID="AbsentReason_1"
                runat="server" style="width:1px;display:none;"/>
            <euc:EformTextBox RecordId="1" Table="AbsentEvents" Field="AbsentQuality" ID="AbsentQuality_1"
                runat="server"  style="width:1px;display:none;"/>
        </td>
    </tr>
</table><br/><br/>

<script type="text/javascript">

function updatePathSide()
{
    if($('<%= ProcSide_13.ClientID %>').value!='')
    {    	
        $('<%= PathSide_1.ClientID %>').value = $('<%= ProcSide_13.ClientID %>').value;
    }
    else{$('<%= PathSide_1.ClientID %>').value = '';}
}

function updateORQlty()
{
    if($('<%= OpCaseSurgeon_1.ClientID %>').value!='')
    {
        $('<%= OpQuality_1.ClientID %>').value='STD';
    }
    else{$('<%= OpQuality_1.ClientID %>').value='';}
}


// these vars are needed to auto populate the date fields for the breast, axilla, and reconstruction procedures
// and to populate absent event dates
var ORDateTextField = $('<%= OpDateText_1.ClientID %>');
var ORDateField = $('<%= OpDate_1.ClientID %>');



function showHideBreastProc(breastPerformed_value,breastAEDtTxtId, breastAEDtId, breastAETableId, breastAETableIdVal, breastAEFieldId, breastAEFieldIdVal, breastAEFieldValueId, breastAEFieldValueIdVal, breastAEReasonId, breastAEReasonIdVal, breastAEQltyId, breastAEQltyIdVal)
    {
      var BreastProcDetailsRow = $('BreastProcDetails');
      if (breastPerformed_value == "Yes")
      {
        BreastProcDetailsRow.style.display='block';
        
        
        // adding this to auto populate the proc date based on value entered for the OR Date
        var BreastProcDateTextField = $('<%= ProcDateText_13.ClientID %>');
        var BreastProcDateField = $('<%= ProcDate_13.ClientID %>');
        var BreastPathDateTextField = $('<%= PathologyDateText_1.ClientID %>');
        var BreastPathDateField = $('<%= PathologyDate_1.ClientID %>');
		$('<%= PathSite_1.ClientID %>').disabled = false;
		$('<%= PathQuality_1.ClientID %>').disabled = false;
        if (ORDateTextField.value.length > 0 && BreastProcDateTextField.value.length < 1)
        {
            BreastProcDateTextField.value = ORDateTextField.value;
            BreastProcDateField.disabled = false;
            BreastProcDateField.value = ORDateField.value;
        }
		if (ORDateTextField.value.length > 0 && BreastPathDateTextField.value.length < 1)
        {
            BreastPathDateTextField.value = ORDateTextField.value;
            BreastPathDateField.disabled = false;
            BreastPathDateField.value = ORDateField.value;
        }
        
        //clears absent row data
        clearElementsInParentRow(document.getElementById('BreastProcAbsentRow'));      
      } 
      else if (breastPerformed_value == "No")
      {        
        BreastProcDetailsRow.style.display='none';  
        
        //clears breast proc and path rows data
        clearElementsInParentRow(document.getElementById('BreastProcRow'));
        clearElementsInParentRow(document.getElementById('BreastProcPathRow'));
        clearElementsInParentRow(document.getElementById('BreastPathFindingsRow1'));
        clearElementsInParentRow(document.getElementById('BreastPathFindingsRow2'));
        clearElementsInParentRow(document.getElementById('BreastPathFindingsRow3'));
        clearElementsInParentRow(document.getElementById('BreastPathFindingsRow4'));
        clearElementsInParentRow(document.getElementById('BreastPathFindingsRow5'));
        clearElementsInParentRow(document.getElementById('BreastPathFindingsRow6'));
        clearElementsInParentRow(document.getElementById('BreastPathFindingsRow7'));
        clearElementsInParentRow(document.getElementById('BreastPathFindingsRow8'));
        clearElementsInParentRow(document.getElementById('BreastPathFindingsRow9'));
        clearElementsInParentRow(document.getElementById('BreastPathFindingsRow10'));
        clearElementsInParentRow(document.getElementById('BreastTumorDimRow'));
        clearElementsInParentRow(document.getElementById('BreastExtentInSituRow'));
        clearElementsInParentRow(document.getElementById('BreastNuclearGradeRow'));
        clearElementsInParentRow(document.getElementById('BreastLVIRow'));
        clearElementsInParentRow(document.getElementById('BreastMultifocalRow'));
        clearElementsInParentRow(document.getElementById('BreastReexcisionsRow'));
        clearElementsInParentRow(document.getElementById('BreastMarginStatusRow'));
        clearElementsInParentRow(document.getElementById('BreastPosMarginsRow'));
        clearElementsInParentRow(document.getElementById('BreastPathStageRow1'));
        clearElementsInParentRow(document.getElementById('BreastPathStageRow2'));
        clearElementsInParentRow(document.getElementById('BreastPathTestRow1'));
        clearElementsInParentRow(document.getElementById('BreastPathTestRow2'));
        clearElementsInParentRow(document.getElementById('BreastPathTestRow3'));
        clearElementsInParentRow(document.getElementById('BreastPathTestRow4'));
        clearElementsInParentRow(document.getElementById('BreastPathTestRow5'));
        clearElementsInParentRow(document.getElementById('BreastPathTestRow6'));
        clearElementsInParentRow(document.getElementById('BreastPathTestRow7'));
        clearElementsInParentRow(document.getElementById('BreastPathTestRow8'));
        clearElementsInParentRow(document.getElementById('BreastPathTestRow9'));
        clearElementsInParentRow(document.getElementById('BreastPathTestRow10'));
        clearElementsInParentRow(document.getElementById('BreastProcNotesRow'));
        
        
        document.getElementById(breastAEDtTxtId).value = $('<%= OpDateText_1.ClientID %>').value;
        document.getElementById(breastAEDtId).value = $('<%= OpDate_1.ClientID %>').value;
        document.getElementById(breastAETableId).value = breastAETableIdVal;        
        document.getElementById(breastAEFieldId).value = breastAEFieldIdVal;
        document.getElementById(breastAEFieldValueId).value = breastAEFieldValueIdVal;
        document.getElementById(breastAEReasonId).value = breastAEReasonIdVal;
        document.getElementById(breastAEQltyId).value = breastAEQltyIdVal;
      }
    }


tableArray.BreastProcedurePathFindingsHtmlTable = "BreastProcedurePathFindingsHtmlTable";
tableArray.PathTestHtmlTable = "PathTestHtmlTable";

var breastPathTestDateTextFieldId = ['<%= PathDateText_1.ClientID %>', '<%= PathDateText_2.ClientID %>', '<%= PathDateText_3.ClientID %>', '<%= PathDateText_4.ClientID %>', '<%= PathDateText_5.ClientID %>', '<%= PathDateText_6.ClientID %>', '<%= PathDateText_7.ClientID %>', '<%= PathDateText_8.ClientID %>', '<%= PathDateText_9.ClientID %>', '<%= PathDateText_10.ClientID %>'];
var breastPathTestDateFieldId = ['<%= PathDate_1.ClientID %>', '<%= PathDate_2.ClientID %>', '<%= PathDate_3.ClientID %>', '<%= PathDate_4.ClientID %>', '<%= PathDate_5.ClientID %>', '<%= PathDate_6.ClientID %>', '<%= PathDate_7.ClientID %>', '<%= PathDate_8.ClientID %>', '<%= PathDate_9.ClientID %>', '<%= PathDate_10.ClientID %>'];


function setDefaultBreastPathTestDate(PathTestInput,RecordId)
{
	var PathTestDateTextInput = $(breastPathTestDateTextFieldId[RecordId-1]);
	var PathTestDateInput = $(breastPathTestDateFieldId[RecordId-1]);
	if (PathTestInput.value.length > 0 && PathTestDateTextInput.value.length < 1)
	{
		PathTestDateTextInput.value = $('<%= PathologyDateText_1.ClientID %>').value;
		PathTestDateInput.value = $('<%= PathologyDate_1.ClientID %>').value;
	}
}

</script>