<%@ Control Language="c#" Inherits="Caisis.UI.Modules.GI.Eforms.EsophagusSurgeryDiagnostics" CodeFile="EsophagusSurgeryDiagnostics.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="../../../ClientScripts/utilities.js"></script>
<script type="text/javascript" src="../../../ClientScripts/EFormScripts.js"></script>


<script type="text/javascript" language="javascript">

	tableArray.EsophagusSurgeryDiagnosticsHTMLTbl = "EsophagusSurgeryDiagnosticsHTMLTbl";
	tableArray.dxfindings_11 = "dxfindings_11";
	tableArray.dxfindings_12 = "dxfindings_12";
	tableArray.dxfindings_13 = "dxfindings_13";
	tableArray.dxfindings_14 = "dxfindings_14";
	tableArray.dxfindings_15 = "dxfindings_15";

</script>

<a name="EsophagusSurgeryDiagnostics" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Imaging Studies"></asp:Label><br/>
<table cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="EsophagusSurgeryDiagnosticsHTMLTbl">
  
  
  
  <tr>
    <td style="padding-bottom: 20px;">
        <table width="100%" class="">
              <tr> 
                <td class="controlBoxDataGridTitleColumn" style="text-align: left;">&nbsp;Date</td>
                <td class="controlBoxDataGridTitleColumn"  style="text-align: left;">Study</td>
                <td class="controlBoxDataGridTitleColumn"  style="text-align: left; ">Result</td>
                <td class="controlBoxDataGridTitleColumn"  style="text-align: left; ">Notes</td>
                <td class="controlBoxDataGridTitleColumn"  style="text-align: left; ">&nbsp;</td>
              </tr>  
              <tr align="left" > 
                 <td height="28" class="ClinicalEformGridColumnOne" valign="top">
		            <euc:EformTextBox Runat="server" RecordId="11"  ID="DxDateText_11" TABLE="Diagnostics" FIELD="DxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
		            <euc:EformHidden RecordId="11" Runat="server" ID="DxDate_11" Table="Diagnostics" Field="DxDate"></euc:EformHidden>	
                    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="11" TABLE="Diagnostics" FIELD="DxDisease" ID="DxDisease_11" /></td>
                
                  <td style="white-space: nowrap;" valign="top">
		            <euc:EformComboBox style="width:80px;" RecordId="11" TABLE="Diagnostics" FIELD="DxType" Runat="server" ID="DxType_11" LookupCode="DxType,Disease,@DiseaseView" DropDownWidth="auto"  /></td>
             
                  <td align="left" style="white-space: nowrap;" valign="top">
		                <euc:EformComboBox style="width:100px;" RecordId="11"  Table="Diagnostics" Field="DxResult"   id="DxResult_11" LookupCode="DxResult,Disease,@DiseaseView" Runat="server" DropDownWidth="auto" />
	              </td>
            	  
                  <td align="left" style="white-space: nowrap;" valign="top">
		                <euc:EformTextBox style="width:100px;" RecordId="11"  Table="Diagnostics" Field="DxNotes"   id="DxNotes_11"  Runat="server" ShowTextEditor="true"  />
	              </td>
            	  
                    <td class="ControlBoxLinedRows" align="center" valign="middle" ><euc:EformDeleteIcon ID="EformDeleteIcon_11" runat="server"/></td>  
            	  
                </tr>
              <tr>  
	              <td></td>
	              <td height="28" class="ClinicalEformTable" colspan="4" >
                    <table id="dxfindings_11" >
                          <tr> 
                            <td class=""  style="text-align: left; ">&nbsp;&nbsp;Site</td>
                            <td class=""  style="text-align: left; ">Side</td>
                            <td class=""  style="text-align: left; ">Sub site</td>
                            <td class=""  style="text-align: left; white-space: nowrap;">Primary Dimension (cm)</td>
                            <td class=""  style="text-align: left; ">Extension</td>
                            <td class=""  style="text-align: left; ">&nbsp;</td>
                          </tr>
                        <tr id="dxfindings_11a" > 
                            <td align="left" style="white-space: nowrap;" valign="top">
        	                    <euc:EformComboBox DropDownWidth="auto" Width="100px" Runat="server" RecordId="1" ParentRecordId="11" ID="ImgFindSite_11a" TABLE="DxImageFindings" FIELD="ImgFindSite" LookupCode="ImgFindSite,Disease,@DiseaseView"  />
        	                    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="1" ParentRecordId="11" ID="ImgFindResult_11a" TABLE="DxImageFindings" FIELD="ImgFindResult"  /></td>
        	                <td align="left" style="white-space: nowrap;" valign="top">
                                <euc:EformComboBox Width="100px" RecordId="1" ParentRecordId="11" TABLE="DxImageFindings" FIELD="ImgFindSide" LookupCode="FindSide,Disease,@DiseaseView" Runat="server" ID="ImgFindSide_11a" DropDownWidth="auto"/></td>
                            <td align="left" style="white-space: nowrap;" valign="top">
		                        <euc:EformComboBox style="width:100px;" RecordId="1" ParentRecordId="11" Table="DxImageFindings" Field="ImgFindSubsite" LookupCode="ImgFindSubsite,Disease,@DiseaseView"   Runat="server" id="ImgFindSubsite_11a"  DropDownWidth="auto"/></td>		  
                            <td align="left" style="white-space: nowrap;" valign="top">
		                        <euc:EformTextBox style="width:60px;" RecordId="1" ParentRecordId="11" Table="DxImageFindings" Field="ImgFindWidth" Runat="server" id="ImgFindWidth_11a"  /></td>
                            <td align="left" style="white-space: nowrap;" valign="top">
		                        <euc:EformComboBox style="width:100px;" RecordId="1" ParentRecordId="11" Table="DxImageFindings" Field="ImgFindExtension" LookupCode="DxTarget,Disease,@DiseaseView"  Runat="server" id="ImgFindExtension_11a" DropDownWidth="auto" /></td>
		                    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon ID="EformDeleteIcon_11a" runat="server"/></td>
                        </tr>
                          <tr id="dxfindings_11b" style="DISPLAY: none">
                           <td align="left" style="white-space: nowrap;" valign="top">
        	                    <euc:EformComboBox DropDownWidth="auto" Width="100px" Runat="server" RecordId="2" ParentRecordId="11" ID="ImgFindSite_11b" TABLE="DxImageFindings" FIELD="ImgFindSite"  LookupCode="ImgFindSite,Disease,@DiseaseView" />
        	                    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="2" ParentRecordId="11" ID="ImgFindResult_11b" TABLE="DxImageFindings" FIELD="ImgFindResult"  /></td>
        	                <td align="left" style="white-space: nowrap;" valign="top">
                                <euc:EformComboBox Width="100px" RecordId="2" ParentRecordId="11" TABLE="DxImageFindings" FIELD="ImgFindSide" LookupCode="FindSide,Disease,@DiseaseView" Runat="server" ID="ImgFindSide_11b" DropDownWidth="auto"/></td>
                            <td align="left" style="white-space: nowrap;" valign="top">
		                        <euc:EformComboBox style="width:100px;" RecordId="2" ParentRecordId="11" Table="DxImageFindings" Field="ImgFindSubsite" LookupCode="ImgFindSubsite,Disease,@DiseaseView"   Runat="server" id="ImgFindSubsite_11b"  DropDownWidth="auto"/></td>		  
                             <td align="left" style="white-space: nowrap;" valign="top">
		                        <euc:EformTextBox style="width:60px;" RecordId="2" ParentRecordId="11" Table="DxImageFindings" Field="ImgFindWidth" Runat="server" id="ImgFindWidth_11b" /></td>
                           <td align="left" style="white-space: nowrap;" valign="top">
		                        <euc:EformComboBox style="width:100px;" RecordId="2" ParentRecordId="11" Table="DxImageFindings" Field="ImgFindExtension" LookupCode="DxTarget,Disease,@DiseaseView"  Runat="server" id="ImgFindExtension_11b" DropDownWidth="auto" /></td>
                            <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon ID="EformDeleteIcon_11b" runat="server"/></td>
                          </tr>
                          <tr id="dxfindings_11c" style="DISPLAY: none">
                           <td align="left" style="white-space: nowrap;" valign="top">
        	                    <euc:EformComboBox DropDownWidth="auto" Width="100px" Runat="server" RecordId="3" ParentRecordId="11" ID="ImgFindSite_11c" TABLE="DxImageFindings" FIELD="ImgFindSite"  LookupCode="ImgFindSite,Disease,@DiseaseView" />
        	                    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="3" ParentRecordId="11" ID="ImgFindResult_11c" TABLE="DxImageFindings" FIELD="ImgFindResult"  /></td>
        	                <td align="left" style="white-space: nowrap;" valign="top">
                                <euc:EformComboBox Width="100px" RecordId="3" ParentRecordId="11" TABLE="DxImageFindings" FIELD="ImgFindSide" LookupCode="FindSide,Disease,@DiseaseView" Runat="server" ID="ImgFindSide_11c" DropDownWidth="auto"/></td>
                            <td align="left" style="white-space: nowrap;" valign="top">
		                        <euc:EformComboBox style="width:100px;" RecordId="3" ParentRecordId="11" Table="DxImageFindings" Field="ImgFindSubsite" LookupCode="ImgFindSubsite,Disease,@DiseaseView"   Runat="server" id="ImgFindSubsite_11c"  DropDownWidth="auto"/></td>		  
                             <td align="left" style="white-space: nowrap;" valign="top">
		                        <euc:EformTextBox style="width:60px;" RecordId="3" ParentRecordId="11" Table="DxImageFindings" Field="ImgFindWidth" Runat="server" id="ImgFindWidth_11c"  /></td>
                           <td align="left" style="white-space: nowrap;" valign="top">
		                        <euc:EformComboBox style="width:100px;" RecordId="3" ParentRecordId="11" Table="DxImageFindings" Field="ImgFindExtension" LookupCode="DxTarget,Disease,@DiseaseView"  Runat="server" id="ImgFindExtension_11c" DropDownWidth="auto" /></td>
                            <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon ID="EformDeleteIcon_11c" runat="server"/></td>
                          </tr>
                          <tr id="dxfindings_11d" style="DISPLAY: none">
                           <td align="left" style="white-space: nowrap;" valign="top">
        	                    <euc:EformComboBox DropDownWidth="auto" Width="100px" Runat="server" RecordId="4" ParentRecordId="11" ID="ImgFindSite_11d" TABLE="DxImageFindings" FIELD="ImgFindSite" LookupCode="ImgFindSite,Disease,@DiseaseView" />
        	                    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="4" ParentRecordId="11" ID="ImgFindResult_11d" TABLE="DxImageFindings" FIELD="ImgFindResult"  /></td>
        	                <td align="left" style="white-space: nowrap;" valign="top">
                                <euc:EformComboBox Width="100px" RecordId="4" ParentRecordId="11" TABLE="DxImageFindings" FIELD="ImgFindSide" LookupCode="FindSide,Disease,@DiseaseView" Runat="server" ID="ImgFindSide_11d" DropDownWidth="auto"/></td>
                            <td align="left" style="white-space: nowrap;" valign="top">
		                        <euc:EformComboBox style="width:100px;" RecordId="4" ParentRecordId="11" Table="DxImageFindings" Field="ImgFindSubsite" LookupCode="ImgFindSubsite,Disease,@DiseaseView"   Runat="server" id="ImgFindSubsite_11d"  DropDownWidth="auto"/></td>		  
                            <td align="left" style="white-space: nowrap;" valign="top">
		                        <euc:EformTextBox style="width:60px;" RecordId="4" ParentRecordId="11" Table="DxImageFindings" Field="ImgFindWidth" Runat="server" id="ImgFindWidth_11d"  /></td>
                            <td align="left" style="white-space: nowrap;" valign="top">
		                        <euc:EformComboBox style="width:100px;" RecordId="4" ParentRecordId="11" Table="DxImageFindings" Field="ImgFindExtension" LookupCode="DxTarget,Disease,@DiseaseView"  Runat="server" id="ImgFindExtension_11d" DropDownWidth="auto" /></td>
                            <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon ID="EformDeleteIcon_11d" runat="server"/></td>
                          </tr>             
                          <tr id="dxfindings_11e" style="DISPLAY: none">
                           <td align="left" style="white-space: nowrap;" valign="top">
        	                    <euc:EformComboBox DropDownWidth="auto" Width="100px" Runat="server" RecordId="5" ParentRecordId="11" ID="ImgFindSite_11e" TABLE="DxImageFindings" FIELD="ImgFindSite" LookupCode="ImgFindSite,Disease,@DiseaseView" />
        	                    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="5" ParentRecordId="11" ID="ImgFindResult_11e" TABLE="DxImageFindings" FIELD="ImgFindResult"  /></td>
        	                <td align="left" style="white-space: nowrap;" valign="top">
                                <euc:EformComboBox Width="100px" RecordId="5" ParentRecordId="11" TABLE="DxImageFindings" FIELD="ImgFindSide" LookupCode="FindSide,Disease,@DiseaseView" Runat="server" ID="ImgFindSide_11e" DropDownWidth="auto"/></td>
                            <td align="left" style="white-space: nowrap;" valign="top">
		                        <euc:EformComboBox style="width:100px;" RecordId="5" ParentRecordId="11" Table="DxImageFindings" Field="ImgFindSubsite" LookupCode="ImgFindSubsite,Disease,@DiseaseView"   Runat="server" id="ImgFindSubsite_11e"  DropDownWidth="auto"/></td>		  
                             <td align="left" style="white-space: nowrap;" valign="top">
		                        <euc:EformTextBox style="width:60px;" RecordId="5" ParentRecordId="11" Table="DxImageFindings" Field="ImgFindWidth" Runat="server" id="ImgFindWidth_113" /></td>
                           <td align="left" style="white-space: nowrap;" valign="top">
		                        <euc:EformComboBox style="width:100px;" RecordId="5" ParentRecordId="11" Table="DxImageFindings" Field="ImgFindExtension" LookupCode="DxTarget,Disease,@DiseaseView"  Runat="server" id="ImgFindExtension_11e" DropDownWidth="auto" /></td>
                            <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon ID="EformDeleteIcon_11e" runat="server"/></td>
                          </tr>
                          <tr >
                            <td height="28" width="10%" ><img alt="" src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'dxfindings_11');" /></td>
                          </tr>
                    </table>
                </td>
             </tr>        
        </table>
    </td>
  </tr>
  
   <tr>
    <td style="padding-bottom: 20px;">
        <table width="100%" class="">
          <tr> 
            <td class="controlBoxDataGridTitleColumn" style="text-align: left;">&nbsp;Date</td>
            <td class="controlBoxDataGridTitleColumn"  style="text-align: left;">Study</td>
            <td class="controlBoxDataGridTitleColumn"  style="text-align: left; ">Result</td>
            <td class="controlBoxDataGridTitleColumn"  style="text-align: left; ">Notes</td>
            <td class="controlBoxDataGridTitleColumn"  style="text-align: left; ">&nbsp;</td>
          </tr>   
          <tr align="left" > 
             <td height="28" class="ClinicalEformGridColumnOne" valign="top">
		        <euc:EformTextBox Runat="server" RecordId="12"  ID="DxDateText_12" TABLE="Diagnostics" FIELD="DxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
		        <euc:EformHidden RecordId="12" Runat="server" ID="DxDate_12" Table="Diagnostics" Field="DxDate"></euc:EformHidden>	
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="12" TABLE="Diagnostics" FIELD="DxDisease" ID="DxDisease_12" /></td>
            
              <td style="white-space: nowrap;" valign="top">
		        <euc:EformComboBox style="width:80px;" RecordId="12" TABLE="Diagnostics" FIELD="DxType" Runat="server" ID="DxType_12" LookupCode="DxType,Disease,@DiseaseView" DropDownWidth="auto"  /></td>
         
                 <td align="left" style="white-space: nowrap;" valign="top">
		            <euc:EformComboBox style="width:100px;" RecordId="12"  Table="Diagnostics" Field="DxResult"   id="DxResult_12" LookupCode="DxResult,Disease,@DiseaseView" Runat="server" DropDownWidth="auto" />
	          </td>
        	  
	          <td align="left" style="white-space: nowrap;" valign="top">
		            <euc:EformTextBox style="width:100px;" RecordId="12"  Table="Diagnostics" Field="DxNotes"   id="DxNotes_12"  Runat="server" ShowTextEditor="true" />
	          </td>
              <td class="ControlBoxLinedRows" align="center" valign="middle" ><euc:EformDeleteIcon ID="EformDeleteIcon_12" runat="server"/></td>  
	        </tr>
          <tr>  
                <td></td>
	          <td height="28" class="ClinicalEformTable" colspan="4" >
                <table id="dxfindings_12" >
                      <tr> 
                        <td class=""  style="text-align: left; ">&nbsp;&nbsp;Site</td>
                        <td class=""  style="text-align: left; ">Side</td>
                        <td class=""  style="text-align: left; ">Sub site</td>
                        <td class=""  style="text-align: left; white-space: nowrap; ">Primary Dimension (cm)</td>
                        <td class=""  style="text-align: left; ">Extension</td>
                        <td class=""  style="text-align: left; ">&nbsp;</td>
                      </tr>
                    <tr id="dxfindings_12a" > 
                        <td align="left" style="white-space: nowrap;" valign="top">
        	                <euc:EformComboBox DropDownWidth="auto" Width="100px" Runat="server" RecordId="1" ParentRecordId="12" ID="ImgFindSite_12a" TABLE="DxImageFindings" FIELD="ImgFindSite" LookupCode="ImgFindSite,Disease,@DiseaseView"  />
        	                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="1" ParentRecordId="12" ID="ImgFindResult_12a" TABLE="DxImageFindings" FIELD="ImgFindResult"  /></td>
        	            <td align="left" style="white-space: nowrap;" valign="top">
                            <euc:EformComboBox Width="100px" RecordId="1" ParentRecordId="12" TABLE="DxImageFindings" FIELD="ImgFindSide" LookupCode="FindSide,Disease,@DiseaseView" Runat="server" ID="ImgFindSide_12a" DropDownWidth="auto"/></td>
                        <td align="left" style="white-space: nowrap;" valign="top">
		                    <euc:EformComboBox style="width:100px;" RecordId="1" ParentRecordId="12" Table="DxImageFindings" Field="ImgFindSubsite" LookupCode="ImgFindSubsite,Disease,@DiseaseView"   Runat="server" id="ImgFindSubsite_12a"  DropDownWidth="auto"/></td>		  
                        <td align="left" style="white-space: nowrap;" valign="top">
		                    <euc:EformTextBox style="width:60px;" RecordId="1" ParentRecordId="12" Table="DxImageFindings" Field="ImgFindWidth" Runat="server" id="ImgFindWidth_12a"  /></td>
                        <td align="left" style="white-space: nowrap;" valign="top">
		                    <euc:EformComboBox style="width:100px;" RecordId="1" ParentRecordId="12" Table="DxImageFindings" Field="ImgFindExtension" LookupCode="DxTarget,Disease,@DiseaseView"  Runat="server" id="ImgFindExtension_12a" DropDownWidth="auto" /></td>
		                <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon ID="EformDeleteIcon_12a" runat="server"/></td>
                    </tr>
                      <tr id="dxfindings_12b" style="DISPLAY: none">
                       <td align="left" style="white-space: nowrap;" valign="top">
        	                <euc:EformComboBox DropDownWidth="auto" Width="100px" Runat="server" RecordId="2" ParentRecordId="12" ID="ImgFindSite_12b" TABLE="DxImageFindings" FIELD="ImgFindSite"  LookupCode="ImgFindSite,Disease,@DiseaseView"/>
        	                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="2" ParentRecordId="12" ID="ImgFindResult_12b" TABLE="DxImageFindings" FIELD="ImgFindResult"  /></td>
        	            <td align="left" style="white-space: nowrap;" valign="top">
                            <euc:EformComboBox Width="100px" RecordId="2" ParentRecordId="12" TABLE="DxImageFindings" FIELD="ImgFindSide" LookupCode="FindSide,Disease,@DiseaseView" Runat="server" ID="ImgFindSide_12b" DropDownWidth="auto"/></td>
                        <td align="left" style="white-space: nowrap;" valign="top">
		                    <euc:EformComboBox style="width:100px;" RecordId="2" ParentRecordId="12" Table="DxImageFindings" Field="ImgFindSubsite" LookupCode="ImgFindSubsite,Disease,@DiseaseView"   Runat="server" id="ImgFindSubsite_12b"  DropDownWidth="auto"/></td>		  
                        <td align="left" style="white-space: nowrap;" valign="top">
		                    <euc:EformTextBox style="width:60px;" RecordId="2" ParentRecordId="12" Table="DxImageFindings" Field="ImgFindWidth" Runat="server" id="ImgFindWidth_12b"  /></td>
                        <td align="left" style="white-space: nowrap;" valign="top">
		                    <euc:EformComboBox style="width:100px;" RecordId="2" ParentRecordId="12" Table="DxImageFindings" Field="ImgFindExtension" LookupCode="DxTarget,Disease,@DiseaseView"  Runat="server" id="ImgFindExtension_12b" DropDownWidth="auto" /></td>
                        <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon ID="EformDeleteIcon_12b" runat="server"/></td>
                      </tr>
                      <tr id="dxfindings_12c" style="DISPLAY: none">
                       <td align="left" style="white-space: nowrap;" valign="top">
        	                <euc:EformComboBox DropDownWidth="auto" Width="100px" Runat="server" RecordId="3" ParentRecordId="12" ID="ImgFindSite_12c" TABLE="DxImageFindings" FIELD="ImgFindSite"  LookupCode="ImgFindSite,Disease,@DiseaseView"/>
        	                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="3" ParentRecordId="12" ID="ImgFindResult_12c" TABLE="DxImageFindings" FIELD="ImgFindResult"  /></td>
        	            <td align="left" style="white-space: nowrap;" valign="top">
                            <euc:EformComboBox Width="100px" RecordId="3" ParentRecordId="12" TABLE="DxImageFindings" FIELD="ImgFindSide" LookupCode="FindSide,Disease,@DiseaseView" Runat="server" ID="ImgFindSide_12c" DropDownWidth="auto"/></td>
                        <td align="left" style="white-space: nowrap;" valign="top">
		                    <euc:EformComboBox style="width:100px;" RecordId="3" ParentRecordId="12" Table="DxImageFindings" Field="ImgFindSubsite" LookupCode="ImgFindSubsite,Disease,@DiseaseView"   Runat="server" id="ImgFindSubsite_12c"  DropDownWidth="auto"/></td>		  
                        <td align="left" style="white-space: nowrap;" valign="top">
		                    <euc:EformTextBox style="width:60px;" RecordId="3" ParentRecordId="12" Table="DxImageFindings" Field="ImgFindWidth" Runat="server" id="ImgFindWidth_12c"  /></td>
                        <td align="left" style="white-space: nowrap;" valign="top">
		                    <euc:EformComboBox style="width:100px;" RecordId="3" ParentRecordId="12" Table="DxImageFindings" Field="ImgFindExtension" LookupCode="DxTarget,Disease,@DiseaseView"  Runat="server" id="ImgFindExtension_12c" DropDownWidth="auto" /></td>
                        <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon ID="EformDeleteIcon_12c" runat="server"/></td>
                      </tr>
                      <tr id="dxfindings_12d" style="DISPLAY: none">
                       <td align="left" style="white-space: nowrap;" valign="top">
        	                <euc:EformComboBox Width="100px" Runat="server" RecordId="4" ParentRecordId="12" ID="ImgFindSite_12d" TABLE="DxImageFindings" FIELD="ImgFindSite"  LookupCode="ImgFindSite,Disease,@DiseaseView"/>
        	                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="4" ParentRecordId="12" ID="ImgFindResult_12d" TABLE="DxImageFindings" FIELD="ImgFindResult"  /></td>
        	            <td align="left" style="white-space: nowrap;" valign="top">
                            <euc:EformComboBox Width="100px" RecordId="4" ParentRecordId="12" TABLE="DxImageFindings" FIELD="ImgFindSide" LookupCode="FindSide,Disease,@DiseaseView" Runat="server" ID="ImgFindSide_12d" DropDownWidth="auto"/></td>
                        <td align="left" style="white-space: nowrap;" valign="top">
		                    <euc:EformComboBox style="width:100px;" RecordId="4" ParentRecordId="12" Table="DxImageFindings" Field="ImgFindSubsite" LookupCode="ImgFindSubsite,Disease,@DiseaseView"   Runat="server" id="ImgFindSubsite_12d"  DropDownWidth="auto"/></td>		  
                         <td align="left" style="white-space: nowrap;" valign="top">
		                    <euc:EformTextBox style="width:60px;" RecordId="4" ParentRecordId="12" Table="DxImageFindings" Field="ImgFindWidth" Runat="server" id="ImgFindWidth_12d"  /></td>
                       <td align="left" style="white-space: nowrap;" valign="top">
		                    <euc:EformComboBox style="width:100px;" RecordId="4" ParentRecordId="12" Table="DxImageFindings" Field="ImgFindExtension" LookupCode="DxTarget,Disease,@DiseaseView"  Runat="server" id="ImgFindExtension_12d" DropDownWidth="auto" /></td>
                        <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon ID="EformDeleteIcon_12d" runat="server"/></td>
                      </tr>             
                      <tr id="dxfindings_12e" style="DISPLAY: none">
                       <td align="left" style="white-space: nowrap;" valign="top">
        	                <euc:EformComboBox DropDownWidth="auto" Width="100px" Runat="server" RecordId="5" ParentRecordId="12" ID="ImgFindSite_12e" TABLE="DxImageFindings" FIELD="ImgFindSite" LookupCode="ImgFindSite,Disease,@DiseaseView" />
        	                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="5" ParentRecordId="12" ID="ImgFindResult_12e" TABLE="DxImageFindings" FIELD="ImgFindResult"  /></td>
        	            <td align="left" style="white-space: nowrap;" valign="top">
                            <euc:EformComboBox Width="100px" RecordId="5" ParentRecordId="12" TABLE="DxImageFindings" FIELD="ImgFindSide" LookupCode="FindSide,Disease,@DiseaseView" Runat="server" ID="ImgFindSide_12e" DropDownWidth="auto"/></td>
                        <td align="left" style="white-space: nowrap;" valign="top">
		                    <euc:EformComboBox style="width:100px;" RecordId="5" ParentRecordId="12" Table="DxImageFindings" Field="ImgFindSubsite" LookupCode="ImgFindSubsite,Disease,@DiseaseView"   Runat="server" id="ImgFindSubsite_12e"  DropDownWidth="auto"/></td>		  
                        <td align="left" style="white-space: nowrap;" valign="top">
		                    <euc:EformTextBox style="width:60px;" RecordId="5" ParentRecordId="12" Table="DxImageFindings" Field="ImgFindWidth" Runat="server" id="ImgFindWidth_12e"  /></td>
                        <td align="left" style="white-space: nowrap;" valign="top">
		                    <euc:EformComboBox style="width:100px;" RecordId="5" ParentRecordId="12" Table="DxImageFindings" Field="ImgFindExtension" LookupCode="DxTarget,Disease,@DiseaseView"  Runat="server" id="ImgFindExtension_12e" DropDownWidth="auto" /></td>
                        <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon ID="EformDeleteIcon_12e" runat="server"/></td>
                      </tr>
                      <tr >
                        <td height="28" width="10%" ><img alt="" src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'dxfindings_12');" /></td>
                      </tr>
                </table>
            </td>
         </tr>

        </table>
    </td>
  </tr>

   <tr style="DISPLAY: none">
    <td style="padding-bottom: 20px;">
        <table width="100%" class="">
          <tr> 
            <td class="controlBoxDataGridTitleColumn" style="text-align: left;">&nbsp;Date</td>
            <td class="controlBoxDataGridTitleColumn"  style="text-align: left;">Study</td>
            <td class="controlBoxDataGridTitleColumn"  style="text-align: left; ">Result</td>
            <td class="controlBoxDataGridTitleColumn"  style="text-align: left; ">Notes</td>
            <td class="controlBoxDataGridTitleColumn"  style="text-align: left; ">&nbsp;</td>
          </tr>  
           <tr align="left" > 
             <td height="28" class="ClinicalEformGridColumnOne" valign="top">
		        <euc:EformTextBox Runat="server" RecordId="13"  ID="DxDateText_13" TABLE="Diagnostics" FIELD="DxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
		        <euc:EformHidden RecordId="13" Runat="server" ID="DxDate_13" Table="Diagnostics" Field="DxDate"></euc:EformHidden>	
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="13" TABLE="Diagnostics" FIELD="DxDisease" ID="DxDisease_13" /></td>
            
              <td style="white-space: nowrap;" valign="top">
		        <euc:EformComboBox style="width:80px;" RecordId="13" TABLE="Diagnostics" FIELD="DxType" Runat="server" ID="DxType_13" LookupCode="DxType,Disease,@DiseaseView" DropDownWidth="auto"  /></td>
         
                 <td align="left" style="white-space: nowrap;" valign="top">
		            <euc:EformComboBox style="width:100px;" RecordId="13"  Table="Diagnostics" Field="DxResult"   id="DxResult_13" LookupCode="DxResult,Disease,@DiseaseView" Runat="server" DropDownWidth="auto" />
	          </td>

              <td align="left" style="white-space: nowrap;" valign="top">
		            <euc:EformTextBox style="width:100px;" RecordId="13"  Table="Diagnostics" Field="DxNotes"   id="DxNotes_13"  Runat="server" ShowTextEditor="true" />
	          </td>
            <td class="ControlBoxLinedRows" align="center" valign="middle" ><euc:EformDeleteIcon ID="EformDeleteIcon_13" runat="server"/></td>  
            </tr>
           <tr>
              <td></td>
	          <td height="28" class="ClinicalEformTable" colspan="4" >
                <table id="dxfindings_13" >
                      <tr> 
                        <td class=""  style="text-align: left; ">&nbsp;&nbsp;Site</td>
                        <td class=""  style="text-align: left; ">Side</td>
                        <td class=""  style="text-align: left; ">Sub site</td>
                        <td class=""  style="text-align: left; white-space: nowrap; ">Primary Dimension (cm)</td>
                        <td class=""  style="text-align: left; ">Extension</td>
                        <td class=""  style="text-align: left; ">&nbsp;</td>
                      </tr>
                    <tr id="dxfindings_13a" > 
                        <td align="left" style="white-space: nowrap;" valign="top">
        	                <euc:EformComboBox DropDownWidth="auto" Width="100px" Runat="server" RecordId="1" ParentRecordId="13" ID="ImgFindSite_13a" TABLE="DxImageFindings" FIELD="ImgFindSite" LookupCode="ImgFindSite,Disease,@DiseaseView"  />
        	                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="1" ParentRecordId="13" ID="ImgFindResult_13a" TABLE="DxImageFindings" FIELD="ImgFindResult"  /></td>
        	            <td align="left" style="white-space: nowrap;" valign="top">
                            <euc:EformComboBox Width="100px" RecordId="1" ParentRecordId="13" TABLE="DxImageFindings" FIELD="ImgFindSide" LookupCode="FindSide,Disease,@DiseaseView" Runat="server" ID="ImgFindSide_13a" DropDownWidth="auto"/></td>
                        <td align="left" style="white-space: nowrap;" valign="top">
		                    <euc:EformComboBox style="width:100px;" RecordId="1" ParentRecordId="13" Table="DxImageFindings" Field="ImgFindSubsite" LookupCode="ImgFindSubsite,Disease,@DiseaseView"   Runat="server" id="ImgFindSubsite_13a"  DropDownWidth="auto"/></td>		  
                        <td align="left" style="white-space: nowrap;" valign="top">
		                    <euc:EformTextBox style="width:60px;" RecordId="1" ParentRecordId="13" Table="DxImageFindings" Field="ImgFindWidth" Runat="server" id="ImgFindWidth_13a"  /></td>
                        <td align="left" style="white-space: nowrap;" valign="top">
		                    <euc:EformComboBox style="width:100px;" RecordId="1" ParentRecordId="13" Table="DxImageFindings" Field="ImgFindExtension" LookupCode="DxTarget,Disease,@DiseaseView"  Runat="server" id="ImgFindExtension_13a" DropDownWidth="auto" /></td>
		                <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon ID="EformDeleteIcon_13a" runat="server"/></td>
                    </tr>
                      <tr id="dxfindings_13b" style="DISPLAY: none">
                       <td align="left" style="white-space: nowrap;" valign="top">
        	                <euc:EformComboBox DropDownWidth="auto" Width="100px" Runat="server" RecordId="2" ParentRecordId="13" ID="ImgFindSite_13b" TABLE="DxImageFindings" FIELD="ImgFindSite" LookupCode="ImgFindSite,Disease,@DiseaseView" />
        	                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="2" ParentRecordId="13" ID="ImgFindResult_13b" TABLE="DxImageFindings" FIELD="ImgFindResult"  /></td>
        	            <td align="left" style="white-space: nowrap;" valign="top">
                            <euc:EformComboBox Width="100px" RecordId="2" ParentRecordId="13" TABLE="DxImageFindings" FIELD="ImgFindSide" LookupCode="FindSide,Disease,@DiseaseView" Runat="server" ID="ImgFindSide_13b" DropDownWidth="auto"/></td>
                        <td align="left" style="white-space: nowrap;" valign="top">
		                    <euc:EformComboBox style="width:100px;" RecordId="2" ParentRecordId="13" Table="DxImageFindings" Field="ImgFindSubsite" LookupCode="ImgFindSubsite,Disease,@DiseaseView"   Runat="server" id="ImgFindSubsite_13b"  DropDownWidth="auto"/></td>		  
                        <td align="left" style="white-space: nowrap;" valign="top">
		                    <euc:EformTextBox style="width:60px;" RecordId="2" ParentRecordId="13" Table="DxImageFindings" Field="ImgFindWidth" Runat="server" id="ImgFindWidth_13b"  /></td>
                        <td align="left" style="white-space: nowrap;" valign="top">
		                    <euc:EformComboBox style="width:100px;" RecordId="2" ParentRecordId="13" Table="DxImageFindings" Field="ImgFindExtension" LookupCode="DxTarget,Disease,@DiseaseView"  Runat="server" id="ImgFindExtension_13b" DropDownWidth="auto" /></td>
                        <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon ID="EformDeleteIcon_13b" runat="server"/></td>
                      </tr>
                      <tr id="dxfindings_13c" style="DISPLAY: none">
                       <td align="left" style="white-space: nowrap;" valign="top">
        	                <euc:EformComboBox DropDownWidth="auto"  Width="100px" Runat="server" RecordId="3" ParentRecordId="13" ID="ImgFindSite_13c" TABLE="DxImageFindings" FIELD="ImgFindSite" LookupCode="ImgFindSite,Disease,@DiseaseView" />
        	                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="3" ParentRecordId="13" ID="ImgFindResult_13c" TABLE="DxImageFindings" FIELD="ImgFindResult"  /></td>
        	            <td align="left" style="white-space: nowrap;" valign="top">
                            <euc:EformComboBox Width="100px" RecordId="3" ParentRecordId="13" TABLE="DxImageFindings" FIELD="ImgFindSide" LookupCode="FindSide,Disease,@DiseaseView" Runat="server" ID="ImgFindSide_13c" DropDownWidth="auto"/></td>
                        <td align="left" style="white-space: nowrap;" valign="top">
		                    <euc:EformComboBox style="width:100px;" RecordId="3" ParentRecordId="13" Table="DxImageFindings" Field="ImgFindSubsite" LookupCode="ImgFindSubsite,Disease,@DiseaseView"   Runat="server" id="ImgFindSubsite_13c"  DropDownWidth="auto"/></td>		  
                        <td align="left" style="white-space: nowrap;" valign="top">
		                    <euc:EformTextBox style="width:60px;" RecordId="3" ParentRecordId="13" Table="DxImageFindings" Field="ImgFindWidth" Runat="server" id="ImgFindWidth_13c"  /></td>
                        <td align="left" style="white-space: nowrap;" valign="top">
		                    <euc:EformComboBox style="width:100px;" RecordId="3" ParentRecordId="13" Table="DxImageFindings" Field="ImgFindExtension" LookupCode="DxTarget,Disease,@DiseaseView"  Runat="server" id="ImgFindExtension_13c" DropDownWidth="auto" /></td>
                        <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon ID="EformDeleteIcon_13c" runat="server"/></td>
                      </tr>
                      <tr id="dxfindings_13d" style="DISPLAY: none">
                       <td align="left" style="white-space: nowrap;" valign="top">
        	                <euc:EformComboBox DropDownWidth="auto" Width="100px" Runat="server" RecordId="4" ParentRecordId="13" ID="ImgFindSite_13d" TABLE="DxImageFindings" FIELD="ImgFindSite" LookupCode="ImgFindSite,Disease,@DiseaseView" />
        	                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="4" ParentRecordId="13" ID="ImgFindResult_13d" TABLE="DxImageFindings" FIELD="ImgFindResult"  /></td>
        	            <td align="left" style="white-space: nowrap;" valign="top">
                            <euc:EformComboBox Width="100px" RecordId="4" ParentRecordId="13" TABLE="DxImageFindings" FIELD="ImgFindSide" LookupCode="FindSide,Disease,@DiseaseView" Runat="server" ID="ImgFindSide_13d" DropDownWidth="auto"/></td>
                        <td align="left" style="white-space: nowrap;" valign="top">
		                    <euc:EformComboBox style="width:100px;" RecordId="4" ParentRecordId="13" Table="DxImageFindings" Field="ImgFindSubsite" LookupCode="ImgFindSubsite,Disease,@DiseaseView"   Runat="server" id="ImgFindSubsite_13d"  DropDownWidth="auto"/></td>		  
                        <td align="left" style="white-space: nowrap;" valign="top">
		                    <euc:EformTextBox style="width:60px;" RecordId="4" ParentRecordId="13" Table="DxImageFindings" Field="ImgFindWidth" Runat="server" id="ImgFindWidth_13d"  /></td>
                        <td align="left" style="white-space: nowrap;" valign="top">
		                    <euc:EformComboBox style="width:100px;" RecordId="4" ParentRecordId="13" Table="DxImageFindings" Field="ImgFindExtension" LookupCode="DxTarget,Disease,@DiseaseView"  Runat="server" id="ImgFindExtension_13d" DropDownWidth="auto" /></td>
                        <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon ID="EformDeleteIcon_13d" runat="server"/></td>
                      </tr>             
                      <tr id="dxfindings_13e" style="DISPLAY: none">
                       <td align="left" style="white-space: nowrap;" valign="top">
        	                <euc:EformComboBox DropDownWidth="auto" Width="100px" Runat="server" RecordId="5" ParentRecordId="13" ID="ImgFindSite_13e" TABLE="DxImageFindings" FIELD="ImgFindSite" LookupCode="ImgFindSite,Disease,@DiseaseView" />
        	                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="5" ParentRecordId="13" ID="ImgFindResult_13e" TABLE="DxImageFindings" FIELD="ImgFindResult"  /></td>
        	            <td align="left" style="white-space: nowrap;" valign="top">
                            <euc:EformComboBox Width="100px" RecordId="5" ParentRecordId="13" TABLE="DxImageFindings" FIELD="ImgFindSide" LookupCode="FindSide,Disease,@DiseaseView" Runat="server" ID="ImgFindSide_13e" DropDownWidth="auto"/></td>
                        <td align="left" style="white-space: nowrap;" valign="top">
		                    <euc:EformComboBox style="width:100px;" RecordId="5" ParentRecordId="13" Table="DxImageFindings" Field="ImgFindSubsite" LookupCode="ImgFindSubsite,Disease,@DiseaseView"   Runat="server" id="ImgFindSubsite_13e"  DropDownWidth="auto"/></td>		  
                        <td align="left" style="white-space: nowrap;" valign="top">
		                    <euc:EformTextBox style="width:60px;" RecordId="5" ParentRecordId="13" Table="DxImageFindings" Field="ImgFindWidth" Runat="server" id="ImgFindWidth_13e"  /></td>
                        <td align="left" style="white-space: nowrap;" valign="top">
		                    <euc:EformComboBox style="width:100px;" RecordId="5" ParentRecordId="13" Table="DxImageFindings" Field="ImgFindExtension" LookupCode="DxTarget,Disease,@DiseaseView"  Runat="server" id="ImgFindExtension_13e" DropDownWidth="auto" /></td>
                        <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon ID="EformDeleteIcon_13e" runat="server"/></td>
                      </tr>
                      <tr >
                        <td height="28" width="10%" ><img alt="" src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'dxfindings_13');" /></td>
                      </tr>
                </table>
            </td>
         </tr> 
        </table>
    </td>
  </tr>

   <tr style="DISPLAY: none">
    <td style="padding-bottom: 20px;">
        <table width="100%" class=" ">
          <tr> 
            <td class="controlBoxDataGridTitleColumn" style="text-align: left;">&nbsp;Date</td>
            <td class="controlBoxDataGridTitleColumn"  style="text-align: left;">Study</td>
            <td class="controlBoxDataGridTitleColumn"  style="text-align: left; ">Result</td>
            <td class="controlBoxDataGridTitleColumn"  style="text-align: left; ">Notes</td>
            <td class="controlBoxDataGridTitleColumn"  style="text-align: left; ">&nbsp;</td>
          </tr>  
          <tr align="left" > 
             <td height="28" class="ClinicalEformGridColumnOne" valign="top">
	            <euc:EformTextBox Runat="server" RecordId="14"  ID="DxDateText_14" TABLE="Diagnostics" FIELD="DxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
	            <euc:EformHidden RecordId="14" Runat="server" ID="DxDate_14" Table="Diagnostics" Field="DxDate"></euc:EformHidden>	
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="14" TABLE="Diagnostics" FIELD="DxDisease" ID="DxDisease_14" /></td>
            
              <td style="white-space: nowrap;" valign="top">
	            <euc:EformComboBox style="width:80px;" RecordId="14" TABLE="Diagnostics" FIELD="DxType" Runat="server" ID="DxType_14" LookupCode="DxType,Disease,@DiseaseView" DropDownWidth="auto"  /></td>
         
                 <td align="left" style="white-space: nowrap;" valign="top">
	                <euc:EformComboBox style="width:100px;" RecordId="14"  Table="Diagnostics" Field="DxResult"   id="DxResult_14" LookupCode="DxResult,Disease,@DiseaseView" Runat="server" DropDownWidth="auto" />
              </td>

              <td align="left" style="white-space: nowrap;" valign="top">
	                <euc:EformTextBox style="width:100px;" RecordId="14"  Table="Diagnostics" Field="DxNotes"   id="DxNotes_14"  Runat="server" ShowTextEditor="true" />
              </td>
            <td class="ControlBoxLinedRows" align="center" valign="middle" ><euc:EformDeleteIcon ID="EformDeleteIcon_14" runat="server"/></td>  
            </tr>
          <tr>
              <td></td>
              <td height="28" class="ClinicalEformTable" colspan="4" >
                <table id="dxfindings_14" >
                      <tr> 
                        <td class=""  style="text-align: left; ">&nbsp;&nbsp;Site</td>
                        <td class=""  style="text-align: left; ">Side</td>
                        <td class=""  style="text-align: left; ">Sub site</td>
                        <td class=""  style="text-align: left; white-space: nowrap; ">Primary Dimension (cm)</td>
                        <td class=""  style="text-align: left; ">Extension</td>
                        <td class=""  style="text-align: left; ">&nbsp;</td>
                      </tr>
                    <tr id="dxfindings_14a" > 
                        <td align="left" style="white-space: nowrap;" valign="top">
    	                    <euc:EformComboBox DropDownWidth="auto" Width="100px" Runat="server" RecordId="1" ParentRecordId="14" ID="ImgFindSite_14a" TABLE="DxImageFindings" FIELD="ImgFindSite" LookupCode="ImgFindSite,Disease,@DiseaseView"  />
    	                    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="1" ParentRecordId="14" ID="ImgFindResult_14a" TABLE="DxImageFindings" FIELD="ImgFindResult"  /></td>
    	                <td align="left" style="white-space: nowrap;" valign="top">
                            <euc:EformComboBox Width="100px" RecordId="1" ParentRecordId="14" TABLE="DxImageFindings" FIELD="ImgFindSide" LookupCode="FindSide,Disease,@DiseaseView" Runat="server" ID="ImgFindSide_14a" DropDownWidth="auto"/></td>
                        <td align="left" style="white-space: nowrap;" valign="top">
	                        <euc:EformComboBox style="width:100px;" RecordId="1" ParentRecordId="14" Table="DxImageFindings" Field="ImgFindSubsite" LookupCode="ImgFindSubsite,Disease,@DiseaseView"   Runat="server" id="ImgFindSubsite_14a"  DropDownWidth="auto"/></td>		  
                        <td align="left" style="white-space: nowrap;" valign="top">
	                        <euc:EformTextBox style="width:60px;" RecordId="1" ParentRecordId="14" Table="DxImageFindings" Field="ImgFindWidth" Runat="server" id="ImgFindWidth_14a"  /></td>
                        <td align="left" style="white-space: nowrap;" valign="top">
	                        <euc:EformComboBox style="width:100px;" RecordId="1" ParentRecordId="14" Table="DxImageFindings" Field="ImgFindExtension" LookupCode="DxTarget,Disease,@DiseaseView"  Runat="server" id="ImgFindExtension_14a" DropDownWidth="auto" /></td>
	                    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon ID="EformDeleteIcon_14a" runat="server"/></td>
                    </tr>
                      <tr id="dxfindings_14b" style="DISPLAY: none">
                       <td align="left" style="white-space: nowrap;" valign="top">
    	                    <euc:EformComboBox DropDownWidth="auto" Width="100px" Runat="server" RecordId="2" ParentRecordId="14" ID="ImgFindSite_14b" TABLE="DxImageFindings" FIELD="ImgFindSite" LookupCode="ImgFindSite,Disease,@DiseaseView" />
    	                    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="2" ParentRecordId="14" ID="ImgFindResult_14b" TABLE="DxImageFindings" FIELD="ImgFindResult"  /></td>
    	                <td align="left" style="white-space: nowrap;" valign="top">
                            <euc:EformComboBox Width="100px" RecordId="2" ParentRecordId="14" TABLE="DxImageFindings" FIELD="ImgFindSide" LookupCode="FindSide,Disease,@DiseaseView" Runat="server" ID="ImgFindSide_14b" DropDownWidth="auto"/></td>
                        <td align="left" style="white-space: nowrap;" valign="top">
	                        <euc:EformComboBox style="width:100px;" RecordId="2" ParentRecordId="14" Table="DxImageFindings" Field="ImgFindSubsite" LookupCode="ImgFindSubsite,Disease,@DiseaseView"   Runat="server" id="ImgFindSubsite_14b"  DropDownWidth="auto"/></td>		  
                        <td align="left" style="white-space: nowrap;" valign="top">
	                        <euc:EformTextBox style="width:60px;" RecordId="2" ParentRecordId="14" Table="DxImageFindings" Field="ImgFindWidth" Runat="server" id="ImgFindWidth_14b"  /></td>
                        <td align="left" style="white-space: nowrap;" valign="top">
	                        <euc:EformComboBox style="width:100px;" RecordId="2" ParentRecordId="14" Table="DxImageFindings" Field="ImgFindExtension" LookupCode="DxTarget,Disease,@DiseaseView"  Runat="server" id="ImgFindExtension_14b" DropDownWidth="auto" /></td>
                        <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon ID="EformDeleteIcon_14b" runat="server"/></td>
                      </tr>
                      <tr id="dxfindings_14c" style="DISPLAY: none">
                       <td align="left" style="white-space: nowrap;" valign="top">
    	                    <euc:EformComboBox DropDownWidth="auto" Width="100px" Runat="server" RecordId="3" ParentRecordId="14" ID="ImgFindSite_14c" TABLE="DxImageFindings" FIELD="ImgFindSite" LookupCode="ImgFindSite,Disease,@DiseaseView" />
    	                    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="3" ParentRecordId="14" ID="ImgFindResult_14c" TABLE="DxImageFindings" FIELD="ImgFindResult"  /></td>
    	                <td align="left" style="white-space: nowrap;" valign="top">
                            <euc:EformComboBox Width="100px" RecordId="3" ParentRecordId="14" TABLE="DxImageFindings" FIELD="ImgFindSide" LookupCode="FindSide,Disease,@DiseaseView" Runat="server" ID="ImgFindSide_14c" DropDownWidth="auto"/></td>
                        <td align="left" style="white-space: nowrap;" valign="top">
	                        <euc:EformComboBox style="width:100px;" RecordId="3" ParentRecordId="14" Table="DxImageFindings" Field="ImgFindSubsite" LookupCode="ImgFindSubsite,Disease,@DiseaseView"   Runat="server" id="ImgFindSubsite_14c"  DropDownWidth="auto"/></td>		  
                        <td align="left" style="white-space: nowrap;" valign="top">
	                        <euc:EformTextBox style="width:60px;" RecordId="3" ParentRecordId="14" Table="DxImageFindings" Field="ImgFindWidth" Runat="server" id="ImgFindWidth_14c"  /></td>
                        <td align="left" style="white-space: nowrap;" valign="top">
	                        <euc:EformComboBox style="width:100px;" RecordId="3" ParentRecordId="14" Table="DxImageFindings" Field="ImgFindExtension" LookupCode="DxTarget,Disease,@DiseaseView"  Runat="server" id="ImgFindExtension_14c" DropDownWidth="auto" /></td>
                        <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon ID="EformDeleteIcon_14c" runat="server"/></td>
                      </tr>
                      <tr id="dxfindings_14d" style="DISPLAY: none">
                       <td align="left" style="white-space: nowrap;" valign="top">
    	                    <euc:EformComboBox DropDownWidth="auto" Width="100px" Runat="server" RecordId="4" ParentRecordId="14" ID="ImgFindSite_14d" TABLE="DxImageFindings" FIELD="ImgFindSite" LookupCode="ImgFindSite,Disease,@DiseaseView" />
    	                    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="4" ParentRecordId="14" ID="ImgFindResult_14d" TABLE="DxImageFindings" FIELD="ImgFindResult"  /></td>
    	                <td align="left" style="white-space: nowrap;" valign="top">
                            <euc:EformComboBox Width="100px" RecordId="4" ParentRecordId="14" TABLE="DxImageFindings" FIELD="ImgFindSide" LookupCode="FindSide,Disease,@DiseaseView" Runat="server" ID="ImgFindSide_14d" DropDownWidth="auto"/></td>
                        <td align="left" style="white-space: nowrap;" valign="top">
	                        <euc:EformComboBox style="width:100px;" RecordId="4" ParentRecordId="14" Table="DxImageFindings" Field="ImgFindSubsite" LookupCode="ImgFindSubsite,Disease,@DiseaseView"   Runat="server" id="ImgFindSubsite_14d"  DropDownWidth="auto"/></td>		  
                        <td align="left" style="white-space: nowrap;" valign="top">
	                        <euc:EformTextBox style="width:60px;" RecordId="4" ParentRecordId="14" Table="DxImageFindings" Field="ImgFindWidth" Runat="server" id="ImgFindWidth_14d"  /></td>
                        <td align="left" style="white-space: nowrap;" valign="top">
	                        <euc:EformComboBox style="width:100px;" RecordId="4" ParentRecordId="14" Table="DxImageFindings" Field="ImgFindExtension" LookupCode="DxTarget,Disease,@DiseaseView"  Runat="server" id="ImgFindExtension_14d" DropDownWidth="auto" /></td>
                        <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon ID="EformDeleteIcon_14d" runat="server"/></td>
                      </tr>             
                      <tr id="dxfindings_14e" style="DISPLAY: none">
                       <td align="left" style="white-space: nowrap;" valign="top">
    	                    <euc:EformComboBox DropDownWidth="auto" Width="100px" Runat="server" RecordId="5" ParentRecordId="14" ID="ImgFindSite_14e" TABLE="DxImageFindings" FIELD="ImgFindSite" LookupCode="ImgFindSite,Disease,@DiseaseView" />
    	                    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="5" ParentRecordId="14" ID="ImgFindResult_14e" TABLE="DxImageFindings" FIELD="ImgFindResult"  /></td>
    	                <td align="left" style="white-space: nowrap;" valign="top">
                            <euc:EformComboBox Width="100px" RecordId="5" ParentRecordId="14" TABLE="DxImageFindings" FIELD="ImgFindSide" LookupCode="FindSide,Disease,@DiseaseView" Runat="server" ID="ImgFindSide_14e" DropDownWidth="auto"/></td>
                        <td align="left" style="white-space: nowrap;" valign="top">
	                        <euc:EformComboBox style="width:100px;" RecordId="5" ParentRecordId="14" Table="DxImageFindings" Field="ImgFindSubsite" LookupCode="ImgFindSubsite,Disease,@DiseaseView"   Runat="server" id="ImgFindSubsite_14e"  DropDownWidth="auto"/></td>		  
                        <td align="left" style="white-space: nowrap;" valign="top">
	                        <euc:EformTextBox style="width:60px;" RecordId="5" ParentRecordId="14" Table="DxImageFindings" Field="ImgFindWidth" Runat="server" id="ImgFindWidth_14e"  /></td>
                        <td align="left" style="white-space: nowrap;" valign="top">
	                        <euc:EformComboBox style="width:100px;" RecordId="5" ParentRecordId="14" Table="DxImageFindings" Field="ImgFindExtension" LookupCode="DxTarget,Disease,@DiseaseView"  Runat="server" id="ImgFindExtension_14e" DropDownWidth="auto" /></td>
                        <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon ID="EformDeleteIcon_14e" runat="server"/></td>
                      </tr>
                      <tr >
                        <td height="28" width="10%" ><img alt="" src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'dxfindings_14');" /></td>
                      </tr>
                </table>
            </td>
         </tr> 
         </table>
    </td>
  </tr>

   <tr style="DISPLAY: none">
    <td style="padding-bottom: 20px;">
        <table width="100%" class="">
          <tr> 
            <td class="controlBoxDataGridTitleColumn" style="text-align: left;">&nbsp;Date</td>
            <td class="controlBoxDataGridTitleColumn"  style="text-align: left;">Study</td>
            <td class="controlBoxDataGridTitleColumn"  style="text-align: left; ">Result</td>
            <td class="controlBoxDataGridTitleColumn"  style="text-align: left; ">Notes</td>
            <td class="controlBoxDataGridTitleColumn"  style="text-align: left; ">&nbsp;</td>
          </tr>  
           <tr align="left"  > 
             <td height="28" class="ClinicalEformGridColumnOne" valign="top">
		        <euc:EformTextBox Runat="server" RecordId="15"  ID="DxDateText_15" TABLE="Diagnostics" FIELD="DxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
		        <euc:EformHidden RecordId="15" Runat="server" ID="DxDate_15" Table="Diagnostics" Field="DxDate"></euc:EformHidden>	
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="15" TABLE="Diagnostics" FIELD="DxDisease" ID="DxDisease_15" /></td>
            
              <td style="white-space: nowrap;" valign="top">
		        <euc:EformComboBox style="width:80px;" RecordId="15" TABLE="Diagnostics" FIELD="DxType" Runat="server" ID="DxType_15" LookupCode="DxType,Disease,@DiseaseView" DropDownWidth="auto"  /></td>
         
                 <td align="left" style="white-space: nowrap;" valign="top">
		            <euc:EformComboBox style="width:100px;" RecordId="15"  Table="Diagnostics" Field="DxResult"   id="DxResult_15" LookupCode="DxResult,Disease,@DiseaseView" Runat="server" DropDownWidth="auto" />
	          </td>

              <td align="left" style="white-space: nowrap;" valign="top">
		            <euc:EformTextBox style="width:100px;" RecordId="15"  Table="Diagnostics" Field="DxNotes"   id="DxNotes_15"  Runat="server" ShowTextEditor="true" />
	          </td>
            <td class="ControlBoxLinedRows" align="center" valign="middle" ><euc:EformDeleteIcon ID="EformDeleteIcon_15" runat="server"/></td>  
            </tr>
            <tr>
              <td></td>
	          <td height="28" class="ClinicalEformTable" colspan="4" >
                <table id="dxfindings_15" class="ClinicalEformTable" >
                      <tr> 
                        <td class=""  style="text-align: left; ">&nbsp;&nbsp;Site</td>
                        <td class=""  style="text-align: left; ">Side</td>
                        <td class=""  style="text-align: left; ">Sub site</td>
                        <td class=""  style="text-align: left; white-space: nowrap; ">Primary Dimension (cm)</td>
                        <td class=""  style="text-align: left; ">Extension</td>
                        <td class=""  style="text-align: left; ">&nbsp;</td>
                      </tr>
                    <tr id="dxfindings_15a" > 
                        <td align="left" style="white-space: nowrap;" valign="top">
        	                <euc:EformComboBox DropDownWidth="auto" Width="100px" Runat="server" RecordId="1" ParentRecordId="15" ID="ImgFindSite_15a" TABLE="DxImageFindings" FIELD="ImgFindSite" LookupCode="ImgFindSite,Disease,@DiseaseView"  />
        	                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="1" ParentRecordId="15" ID="ImgFindResult_15a" TABLE="DxImageFindings" FIELD="ImgFindResult"  /></td>
        	            <td align="left" style="white-space: nowrap;" valign="top">
                            <euc:EformComboBox Width="100px" RecordId="1" ParentRecordId="15" TABLE="DxImageFindings" FIELD="ImgFindSide" LookupCode="FindSide,Disease,@DiseaseView" Runat="server" ID="ImgFindSide_15a" DropDownWidth="auto"/></td>
                        <td align="left" style="white-space: nowrap;" valign="top">
		                    <euc:EformComboBox style="width:100px;" RecordId="1" ParentRecordId="15" Table="DxImageFindings" Field="ImgFindSubsite" LookupCode="ImgFindSubsite,Disease,@DiseaseView"   Runat="server" id="ImgFindSubsite_15a"  DropDownWidth="auto"/></td>		  
                        <td align="left" style="white-space: nowrap;" valign="top">
		                    <euc:EformTextBox style="width:60px;" RecordId="1" ParentRecordId="15" Table="DxImageFindings" Field="ImgFindWidth" Runat="server" id="ImgFindWidth_15a"  /></td>
                        <td align="left" style="white-space: nowrap;" valign="top">
		                    <euc:EformComboBox style="width:100px;" RecordId="1" ParentRecordId="15" Table="DxImageFindings" Field="ImgFindExtension" LookupCode="DxTarget,Disease,@DiseaseView"  Runat="server" id="ImgFindExtension_15a" DropDownWidth="auto" /></td>
		                <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon ID="EformDeleteIcon_15a" runat="server"/></td>
                    </tr>
                      <tr id="dxfindings_15b" style="DISPLAY: none">
                       <td align="left" style="white-space: nowrap;" valign="top">
        	                <euc:EformComboBox Width="100px" Runat="server" RecordId="2" ParentRecordId="15" ID="ImgFindSite_15b" TABLE="DxImageFindings" FIELD="ImgFindSite" LookupCode="ImgFindSite,Disease,@DiseaseView" />
        	                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="2" ParentRecordId="15" ID="ImgFindResult_15b" TABLE="DxImageFindings" FIELD="ImgFindResult"  /></td>
        	            <td align="left" style="white-space: nowrap;" valign="top">
                            <euc:EformComboBox Width="100px" RecordId="2" ParentRecordId="15" TABLE="DxImageFindings" FIELD="ImgFindSide" LookupCode="FindSide,Disease,@DiseaseView" Runat="server" ID="ImgFindSide_15b" DropDownWidth="auto"/></td>
                        <td align="left" style="white-space: nowrap;" valign="top">
		                    <euc:EformComboBox style="width:100px;" RecordId="2" ParentRecordId="15" Table="DxImageFindings" Field="ImgFindSubsite" LookupCode="ImgFindSubsite,Disease,@DiseaseView"   Runat="server" id="ImgFindSubsite_15b"  DropDownWidth="auto"/></td>		  
                        <td align="left" style="white-space: nowrap;" valign="top">
		                    <euc:EformTextBox style="width:60px;" RecordId="2" ParentRecordId="15" Table="DxImageFindings" Field="ImgFindWidth" Runat="server" id="ImgFindWidth_15b"  /></td>
                        <td align="left" style="white-space: nowrap;" valign="top">
		                    <euc:EformComboBox style="width:100px;" RecordId="2" ParentRecordId="15" Table="DxImageFindings" Field="ImgFindExtension" LookupCode="DxTarget,Disease,@DiseaseView"  Runat="server" id="ImgFindExtension_15b" DropDownWidth="auto" /></td>
                        <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon ID="EformDeleteIcon_15b" runat="server"/></td>
                      </tr>
                      <tr id="dxfindings_15c" style="DISPLAY: none">
                       <td align="left" style="white-space: nowrap;" valign="top">
        	                <euc:EformComboBox DropDownWidth="auto" Width="100px" Runat="server" RecordId="3" ParentRecordId="15" ID="ImgFindSite_15c" TABLE="DxImageFindings" FIELD="ImgFindSite" LookupCode="ImgFindSite,Disease,@DiseaseView"  />
        	                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="3" ParentRecordId="15" ID="ImgFindResult_15c" TABLE="DxImageFindings" FIELD="ImgFindResult"  /></td>
        	            <td align="left" style="white-space: nowrap;" valign="top">
                            <euc:EformComboBox Width="100px" RecordId="3" ParentRecordId="15" TABLE="DxImageFindings" FIELD="ImgFindSide" LookupCode="FindSide,Disease,@DiseaseView" Runat="server" ID="ImgFindSide_15c" DropDownWidth="auto"/></td>
                        <td align="left" style="white-space: nowrap;" valign="top">
		                    <euc:EformComboBox style="width:100px;" RecordId="3" ParentRecordId="15" Table="DxImageFindings" Field="ImgFindSubsite" LookupCode="ImgFindSubsite,Disease,@DiseaseView"   Runat="server" id="ImgFindSubsite_15c"  DropDownWidth="auto"/></td>		  
                        <td align="left" style="white-space: nowrap;" valign="top">
		                    <euc:EformTextBox style="width:60px;" RecordId="3" ParentRecordId="15" Table="DxImageFindings" Field="ImgFindWidth" Runat="server" id="ImgFindWidth_15c"  /></td>
                        <td align="left" style="white-space: nowrap;" valign="top">
		                    <euc:EformComboBox style="width:100px;" RecordId="3" ParentRecordId="15" Table="DxImageFindings" Field="ImgFindExtension" LookupCode="DxTarget,Disease,@DiseaseView"  Runat="server" id="ImgFindExtension_15c" DropDownWidth="auto" /></td>
                        <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon ID="EformDeleteIcon_15c" runat="server"/></td>
                      </tr>
                      <tr id="dxfindings_15d" style="DISPLAY: none">
                       <td align="left" style="white-space: nowrap;" valign="top">
        	                <euc:EformComboBox Width="100px" Runat="server" RecordId="4" ParentRecordId="15" ID="ImgFindSite_15d" TABLE="DxImageFindings" FIELD="ImgFindSite" LookupCode="ImgFindSite,Disease,@DiseaseView" />
        	                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="4" ParentRecordId="15" ID="ImgFindResult_15d" TABLE="DxImageFindings" FIELD="ImgFindResult"  /></td>
        	            <td align="left" style="white-space: nowrap;" valign="top">
                            <euc:EformComboBox Width="100px" RecordId="4" ParentRecordId="15" TABLE="DxImageFindings" FIELD="ImgFindSide" LookupCode="FindSide,Disease,@DiseaseView" Runat="server" ID="ImgFindSide_15d" DropDownWidth="auto"/></td>
                        <td align="left" style="white-space: nowrap;" valign="top">
		                    <euc:EformComboBox style="width:100px;" RecordId="4" ParentRecordId="15" Table="DxImageFindings" Field="ImgFindSubsite" LookupCode="ImgFindSubsite,Disease,@DiseaseView"   Runat="server" id="ImgFindSubsite_15d"  DropDownWidth="auto"/></td>		  
                        <td align="left" style="white-space: nowrap;" valign="top">
		                    <euc:EformTextBox style="width:60px;" RecordId="4" ParentRecordId="15" Table="DxImageFindings" Field="ImgFindWidth" Runat="server" id="ImgFindWidth_15d"  /></td>
                        <td align="left" style="white-space: nowrap;" valign="top">
		                    <euc:EformComboBox style="width:100px;" RecordId="4" ParentRecordId="15" Table="DxImageFindings" Field="ImgFindExtension" LookupCode="DxTarget,Disease,@DiseaseView"  Runat="server" id="ImgFindExtension_15d" DropDownWidth="auto" /></td>
                        <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon ID="EformDeleteIcon_15d" runat="server"/></td>
                      </tr>             
                      <tr id="dxfindings_15e" style="DISPLAY: none">
                       <td align="left" style="white-space: nowrap;" valign="top">
        	                <euc:EformComboBox DropDownWidth="auto" Width="100px" Runat="server" RecordId="5" ParentRecordId="15" ID="ImgFindSite_15e" TABLE="DxImageFindings" FIELD="ImgFindSite" LookupCode="ImgFindSite,Disease,@DiseaseView" />
        	                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="5" ParentRecordId="15" ID="ImgFindResult_15e" TABLE="DxImageFindings" FIELD="ImgFindResult"  /></td>
        	            <td align="left" style="white-space: nowrap;" valign="top">
                            <euc:EformComboBox Width="100px" RecordId="5" ParentRecordId="15" TABLE="DxImageFindings" FIELD="ImgFindSide" LookupCode="FindSide,Disease,@DiseaseView" Runat="server" ID="ImgFindSide_15e" DropDownWidth="auto"/></td>
                        <td align="left" style="white-space: nowrap;" valign="top">
		                    <euc:EformComboBox style="width:100px;" RecordId="5" ParentRecordId="15" Table="DxImageFindings" Field="ImgFindSubsite" LookupCode="ImgFindSubsite,Disease,@DiseaseView"   Runat="server" id="ImgFindSubsite_15e"  DropDownWidth="auto"/></td>		  
                        <td align="left" style="white-space: nowrap;" valign="top">
		                    <euc:EformTextBox style="width:60px;" RecordId="5" ParentRecordId="15" Table="DxImageFindings" Field="ImgFindWidth" Runat="server" id="ImgFindWidth_15e"  /></td>
                        <td align="left" style="white-space: nowrap;" valign="top">
		                    <euc:EformComboBox style="width:100px;" RecordId="5" ParentRecordId="15" Table="DxImageFindings" Field="ImgFindExtension" LookupCode="DxTarget,Disease,@DiseaseView"  Runat="server" id="ImgFindExtension_15e" DropDownWidth="auto" /></td>
                        <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon ID="EformDeleteIcon_15e" runat="server"/></td>
                      </tr>
                      <tr >
                        <td height="28" width="10%" ><img alt="" src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'dxfindings_15');" /></td>
                      </tr>
                </table>
            </td>
         </tr> 

         </table>
    </td>
  </tr>


</table>
<img alt="" src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'EsophagusSurgeryDiagnosticsHTMLTbl');" />

<br/><br/><br/>

<script type="text/javascript" language="javascript">

     /* <![CDATA[ */ 
 
   /* ****************************************************************************************  */ 
   /* ****************************************************************************************  */ 
   /* ****************************************************************************************  */ 

    addEvents($('<%= DxDateText_11.ClientID %>'),$('<%= DxType_11.ClientID %>'),$('<%= DxResult_11.ClientID %>'),$('<%= DxNotes_11.ClientID %>'),$('<%= DxDisease_11.ClientID %>'));
    addEvents($('<%= DxDateText_12.ClientID %>'),$('<%= DxType_12.ClientID %>'),$('<%= DxResult_12.ClientID %>'),$('<%= DxNotes_12.ClientID %>'),$('<%= DxDisease_12.ClientID %>'));
    addEvents($('<%= DxDateText_13.ClientID %>'),$('<%= DxType_13.ClientID %>'),$('<%= DxResult_13.ClientID %>'),$('<%= DxNotes_13.ClientID %>'),$('<%= DxDisease_13.ClientID %>'));
    addEvents($('<%= DxDateText_14.ClientID %>'),$('<%= DxType_14.ClientID %>'),$('<%= DxResult_14.ClientID %>'),$('<%= DxNotes_14.ClientID %>'),$('<%= DxDisease_14.ClientID %>'));
    addEvents($('<%= DxDateText_15.ClientID %>'),$('<%= DxType_15.ClientID %>'),$('<%= DxResult_15.ClientID %>'),$('<%= DxNotes_15.ClientID %>'),$('<%= DxDisease_15.ClientID %>'));
    
    function addEvents(dxDateText,dxType,dxResult,DxNotes,dxDisease)
    { 
        $(dxDateText).addEvent('blur',curry(SetDxFields,dxDateText,dxType,dxResult,DxNotes,dxDisease));
        $(dxType).addEvent('blur',curry(SetDxFields,dxDateText,dxType,dxResult,DxNotes,dxDisease));
        $(dxResult).addEvent('blur',curry(SetDxFields,dxDateText,dxType,dxResult,DxNotes,dxDisease));
        $(DxNotes).addEvent('blur',curry(SetDxFields,dxDateText,dxType,dxResult,DxNotes,dxDisease));
    }

    function SetDxFields(dxDateText,dxType,dxResult,DxNotes,dxDisease)
    { 
        if (dxDateText.value != '' || dxType.value != '' || dxResult.value != '' || DxNotes.value != '')
        {
            dxDisease.value  = 'Esophageal Cancer';
        }
        else 
            dxDisease.value  = '';
    }
  
    //Adds events to controls
    function addEvents2(ImgFindSide,ImgFindSubsite,ImgFindSite,ImgFindResult,DxResult,ImgFindExtension)
    { 
        $(ImgFindSide).addEvent('blur',curry(SetDxFindingsFields,ImgFindSide,ImgFindSubsite,ImgFindSite,ImgFindResult,DxResult,ImgFindExtension));
        $(ImgFindSubsite).addEvent('blur',curry(SetDxFindingsFields,ImgFindSide,ImgFindSubsite,ImgFindSite,ImgFindResult,DxResult,ImgFindExtension));
        $(DxResult).addEvent('blur',curry(SetDxFindingsFields,ImgFindSide,ImgFindSubsite,ImgFindSite,ImgFindResult,DxResult,ImgFindExtension));
        $(ImgFindExtension).addEvent('blur',curry(SetDxFindingsFields,ImgFindSide,ImgFindSubsite,ImgFindSite,ImgFindResult,DxResult,ImgFindExtension));
    }

    addEvents2($('<%= ImgFindSide_11a.ClientID %>'),$('<%= ImgFindSubsite_11a.ClientID %>'),$('<%= ImgFindSite_11a.ClientID %>'),$('<%= ImgFindResult_11a.ClientID %>'),$('<%= DxResult_11.ClientID %>'), $('<%= ImgFindExtension_11a.ClientID %>'));
    addEvents2($('<%= ImgFindSide_11b.ClientID %>'),$('<%= ImgFindSubsite_11b.ClientID %>'),$('<%= ImgFindSite_11b.ClientID %>'),$('<%= ImgFindResult_11b.ClientID %>'),$('<%= DxResult_11.ClientID %>'), $('<%= ImgFindExtension_11b.ClientID %>'));
    addEvents2($('<%= ImgFindSide_11c.ClientID %>'),$('<%= ImgFindSubsite_11c.ClientID %>'),$('<%= ImgFindSite_11c.ClientID %>'),$('<%= ImgFindResult_11c.ClientID %>'),$('<%= DxResult_11.ClientID %>'), $('<%= ImgFindExtension_11c.ClientID %>'));
    addEvents2($('<%= ImgFindSide_11d.ClientID %>'),$('<%= ImgFindSubsite_11d.ClientID %>'),$('<%= ImgFindSite_11d.ClientID %>'),$('<%= ImgFindResult_11d.ClientID %>'),$('<%= DxResult_11.ClientID %>'), $('<%= ImgFindExtension_11d.ClientID %>'));
    addEvents2($('<%= ImgFindSide_11e.ClientID %>'),$('<%= ImgFindSubsite_11e.ClientID %>'),$('<%= ImgFindSite_11e.ClientID %>'),$('<%= ImgFindResult_11e.ClientID %>'),$('<%= DxResult_11.ClientID %>'), $('<%= ImgFindExtension_11e.ClientID %>'));

    addEvents2($('<%= ImgFindSide_12a.ClientID %>'),$('<%= ImgFindSubsite_12a.ClientID %>'),$('<%= ImgFindSite_12a.ClientID %>'),$('<%= ImgFindResult_12a.ClientID %>'),$('<%= DxResult_12.ClientID %>'), $('<%= ImgFindExtension_12a.ClientID %>'));
    addEvents2($('<%= ImgFindSide_12b.ClientID %>'),$('<%= ImgFindSubsite_12b.ClientID %>'),$('<%= ImgFindSite_12b.ClientID %>'),$('<%= ImgFindResult_12b.ClientID %>'),$('<%= DxResult_12.ClientID %>'), $('<%= ImgFindExtension_12b.ClientID %>'));
    addEvents2($('<%= ImgFindSide_12c.ClientID %>'),$('<%= ImgFindSubsite_12c.ClientID %>'),$('<%= ImgFindSite_12c.ClientID %>'),$('<%= ImgFindResult_12c.ClientID %>'),$('<%= DxResult_12.ClientID %>'), $('<%= ImgFindExtension_12c.ClientID %>'));
    addEvents2($('<%= ImgFindSide_12d.ClientID %>'),$('<%= ImgFindSubsite_12d.ClientID %>'),$('<%= ImgFindSite_12d.ClientID %>'),$('<%= ImgFindResult_12d.ClientID %>'),$('<%= DxResult_12.ClientID %>'), $('<%= ImgFindExtension_12d.ClientID %>'));
    addEvents2($('<%= ImgFindSide_12e.ClientID %>'),$('<%= ImgFindSubsite_12e.ClientID %>'),$('<%= ImgFindSite_12e.ClientID %>'),$('<%= ImgFindResult_12e.ClientID %>'),$('<%= DxResult_12.ClientID %>'), $('<%= ImgFindExtension_12e.ClientID %>'));

    addEvents2($('<%= ImgFindSide_13a.ClientID %>'),$('<%= ImgFindSubsite_13a.ClientID %>'),$('<%= ImgFindSite_13a.ClientID %>'),$('<%= ImgFindResult_13a.ClientID %>'),$('<%= DxResult_13.ClientID %>'), $('<%= ImgFindExtension_13a.ClientID %>'));
    addEvents2($('<%= ImgFindSide_13b.ClientID %>'),$('<%= ImgFindSubsite_13b.ClientID %>'),$('<%= ImgFindSite_13b.ClientID %>'),$('<%= ImgFindResult_13b.ClientID %>'),$('<%= DxResult_13.ClientID %>'), $('<%= ImgFindExtension_13b.ClientID %>'));
    addEvents2($('<%= ImgFindSide_13c.ClientID %>'),$('<%= ImgFindSubsite_13c.ClientID %>'),$('<%= ImgFindSite_13c.ClientID %>'),$('<%= ImgFindResult_13c.ClientID %>'),$('<%= DxResult_13.ClientID %>'), $('<%= ImgFindExtension_13c.ClientID %>'));
    addEvents2($('<%= ImgFindSide_13d.ClientID %>'),$('<%= ImgFindSubsite_13d.ClientID %>'),$('<%= ImgFindSite_13d.ClientID %>'),$('<%= ImgFindResult_13d.ClientID %>'),$('<%= DxResult_13.ClientID %>'), $('<%= ImgFindExtension_13d.ClientID %>'));
    addEvents2($('<%= ImgFindSide_13e.ClientID %>'),$('<%= ImgFindSubsite_13e.ClientID %>'),$('<%= ImgFindSite_13e.ClientID %>'),$('<%= ImgFindResult_13e.ClientID %>'),$('<%= DxResult_13.ClientID %>'), $('<%= ImgFindExtension_13e.ClientID %>'));

    addEvents2($('<%= ImgFindSide_14a.ClientID %>'),$('<%= ImgFindSubsite_14a.ClientID %>'),$('<%= ImgFindSite_14a.ClientID %>'),$('<%= ImgFindResult_14a.ClientID %>'),$('<%= DxResult_14.ClientID %>'), $('<%= ImgFindExtension_14a.ClientID %>'));
    addEvents2($('<%= ImgFindSide_14b.ClientID %>'),$('<%= ImgFindSubsite_14b.ClientID %>'),$('<%= ImgFindSite_14b.ClientID %>'),$('<%= ImgFindResult_14b.ClientID %>'),$('<%= DxResult_14.ClientID %>'), $('<%= ImgFindExtension_14b.ClientID %>'));
    addEvents2($('<%= ImgFindSide_14c.ClientID %>'),$('<%= ImgFindSubsite_14c.ClientID %>'),$('<%= ImgFindSite_14c.ClientID %>'),$('<%= ImgFindResult_14c.ClientID %>'),$('<%= DxResult_14.ClientID %>'), $('<%= ImgFindExtension_14c.ClientID %>'));
    addEvents2($('<%= ImgFindSide_14d.ClientID %>'),$('<%= ImgFindSubsite_14d.ClientID %>'),$('<%= ImgFindSite_14d.ClientID %>'),$('<%= ImgFindResult_14d.ClientID %>'),$('<%= DxResult_14.ClientID %>'), $('<%= ImgFindExtension_14d.ClientID %>'));
    addEvents2($('<%= ImgFindSide_14e.ClientID %>'),$('<%= ImgFindSubsite_14e.ClientID %>'),$('<%= ImgFindSite_14e.ClientID %>'),$('<%= ImgFindResult_14e.ClientID %>'),$('<%= DxResult_14.ClientID %>'), $('<%= ImgFindExtension_14e.ClientID %>'));

    addEvents2($('<%= ImgFindSide_15a.ClientID %>'),$('<%= ImgFindSubsite_15a.ClientID %>'),$('<%= ImgFindSite_15a.ClientID %>'),$('<%= ImgFindResult_15a.ClientID %>'),$('<%= DxResult_15.ClientID %>'), $('<%= ImgFindExtension_15a.ClientID %>'));
    addEvents2($('<%= ImgFindSide_15b.ClientID %>'),$('<%= ImgFindSubsite_15b.ClientID %>'),$('<%= ImgFindSite_15b.ClientID %>'),$('<%= ImgFindResult_15b.ClientID %>'),$('<%= DxResult_15.ClientID %>'), $('<%= ImgFindExtension_15b.ClientID %>'));
    addEvents2($('<%= ImgFindSide_15c.ClientID %>'),$('<%= ImgFindSubsite_15c.ClientID %>'),$('<%= ImgFindSite_15c.ClientID %>'),$('<%= ImgFindResult_15c.ClientID %>'),$('<%= DxResult_15.ClientID %>'), $('<%= ImgFindExtension_15c.ClientID %>'));
    addEvents2($('<%= ImgFindSide_15d.ClientID %>'),$('<%= ImgFindSubsite_15d.ClientID %>'),$('<%= ImgFindSite_15d.ClientID %>'),$('<%= ImgFindResult_15d.ClientID %>'),$('<%= DxResult_15.ClientID %>'), $('<%= ImgFindExtension_15d.ClientID %>'));
    addEvents2($('<%= ImgFindSide_15e.ClientID %>'),$('<%= ImgFindSubsite_15e.ClientID %>'),$('<%= ImgFindSite_15e.ClientID %>'),$('<%= ImgFindResult_15e.ClientID %>'),$('<%= DxResult_15.ClientID %>'), $('<%= ImgFindExtension_15e.ClientID %>'));

  
    function SetDxFindingsFields(ImgFindSide,ImgFindSubsite,ImgFindSite,ImgFindResult,DxResult,ImgFindExtension)
    {
        if (ImgFindSide.value != '' || ImgFindSubsite.value != '' || ImgFindExtension.value != '' || ImgFindSite.value != '')
        {
            ImgFindResult.value  = DxResult.value;
        }
    }
    
    
    /* ]]> */
    
</script>