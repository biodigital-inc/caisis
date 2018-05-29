<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Breast.Eforms.DxBreastFU" CodeFile="DxBreastFU.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../../../ClientScripts/utilities.js"></script>
<script type="text/javascript" src="../../../ClientScripts/EFormScripts.js"></script>
<script language="javascript" type="text/javascript">

    tableArray.BreastDxTable = "BreastDxTable";    
</script>

<a name="DxBreastFU" /><span class="controlBoxTitle">Imaging</span> <br/>
<table border="0" cellspacing="0" cellpadding="16" width="650" class="eformXLargePopulatedTable"  style="border-bottom:none;">
 <tr >
    <td style="white-space:nowrap;"><strong>Any image findings since last appointment ?</strong></td>
	<td style="text-align:left;"><euc:EformRadioButtonList Table="NoTable" Field="ImgDone" id="ImgDone" runat="server" 
	    RepeatLayout="Table" RepeatDirection="Horizontal" >
		    <asp:ListItem>Yes</asp:ListItem>
            <asp:ListItem>No</asp:ListItem>
		</euc:EformRadioButtonList></td>
	<td style="width:50%"></td>
  </tr>
  
  <tr id="BreastImgDetailsTR" style="display: none;" runat="server">
     <td colspan="3">
        <span class="controlBoxTitle" style="font-size: 12px;">Previous Diagnostics</span><br/>
            <table cellpadding="2" cellspacing="0" class="ClinicalEformTable" id="DxHxTable" style="background-color: #f8f8f8;">
                <tr>
                    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center; width:90px;">&nbsp;Date</td>
                    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center; width:120px;">Disease</td>
                    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center; width:150px;">Type</td>
                    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center; width:70px;">Side</td>
                    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center; width:100px;">Target</td>
                    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center; width:70px;">Result</td>
                    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center; width:70px;">Indication</td>
                    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center; width:70px;">Physician</td>
                    <td height="10%" class="controlBoxDataGridHeaderFirstCol" style="text-align: center; width:30px;">&nbsp;</td>
                </tr>
                <asp:Repeater ID="BreastFUDxRpt" runat="server" OnItemDataBound="EFormRepeaterOnDataBound">
                <ItemTemplate>
                    <tr class="ClinicalEformPopulatedRow" onMouseOver="this.className='ClinicalEformHighlightedRow';" onMouseOut="this.className='ClinicalEformPopulatedRow';"  onclick="LoadDataEntryForm('Diagnostics', <%# DataBinder.Eval(Container.DataItem, "DiagnosticId") %>, 'DxDateText,DxDate,DxType,DxSide,DxTarget,DxResult,DxIndication,DxPhysician','Diagnostics');">
                        <td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "DxDateText")%></td>
                        <td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "DxDisease")%></td>
                        <td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "DxType")%></td>
                        <td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "DxSide")%></td>
                        <td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "DxTarget")%></td>
                        <td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "DxResult")%></td>
                        <td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "DxIndication")%></td>
                        <td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "DxPhysician")%></td>
                        <td class="ClinicalEformPopulatedColumn"><img alt="" align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9"
                                height="11" id="LockImage" runat="server" title="This record has been locked." />&nbsp;</td>
                    </tr>
                </ItemTemplate>
            </asp:Repeater>
            </table><br /><br />
            
            <table width="650" cellpadding="2" cellspacing="0" class="ClinicalEformTable" id="BreastDxTable" style="background-color: #efefef;">
            <tr><td>                    
            <span class="controlBoxTitle">Add Diagnostics</span> <br/>
            <table width="650" cellpadding="2" cellspacing="0" id="BreastImgHtmlTable1"  style="background-color: #ffffff;">
            <tr>
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">&nbsp;Date</td>
                <td class="controlBoxDataGridHeaderFirstCol" align="center">Disease</td>
                <td class="controlBoxDataGridHeaderFirstCol" align="center">Type</td>
                <td class="controlBoxDataGridHeaderFirstCol" align="center">Side</td>
                <td class="controlBoxDataGridHeaderFirstCol" align="center">Target</td>
                <td class="controlBoxDataGridHeaderFirstCol" align="center">Result</td>
                <td class="controlBoxDataGridHeaderFirstCol" align="center">Indication</td>
                <td class="controlBoxDataGridHeaderFirstCol" align="center">Physician</td>
                <td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
            </tr>
            
            <tr id="BreastImgHtmlTr1">
                <td align="center"><euc:EformTextBox  Width="70px" RecordId="1"   TABLE="Diagnostics" FIELD="DxDateText" ID="DxDateText_1" 
                    Runat="server" ShowCalendar="true" CalcDate="true"/>
                    <euc:EformHidden  RecordId="1" TABLE="Diagnostics" FIELD="DxDate" ID="DxDate_1" Runat="server"/></td>
                <td align="center"><euc:EformDropDownList Width="120px" RecordId="1"  TABLE="Diagnostics" FIELD="DxDisease" 
                    ID="DxDisease_1" LookupCode="Disease" Runat="server"/></td>
                <td align="center"><euc:EformDropDownList RecordId="1"  TABLE="Diagnostics" FIELD="DxType" ID="DxType_1" 
                    LookupCode="DxType" Runat="server"/>
                    
                    <euc:EformTextBox RecordId="1"  TABLE="Diagnostics" FIELD="DxInstitution" ID="DxInstitution_1" Runat="server" 
                        style="width:1px;display:none;"/>
                    <euc:EformTextBox RecordId="1"  TABLE="Diagnostics" FIELD="DxQuality" ID="DxQuality_1" Runat="server" 
                        style="width:1px;display:none;"/></td>
                    
                <td align="center"><euc:EformDropDownList RecordId="1"  TABLE="Diagnostics" FIELD="DxSide" ID="DxSide_1" 
                    LookupCode="FindSide" Runat="server"/></td>
                <td align="center"><euc:EformComboBox RecordId="1"  TABLE="Diagnostics" FIELD="DxTarget" ID="DxTarget_1" 
                    LookupCode="DxTarget" Runat="server" Width="80px" DropDownWidth="300px"/></td>
                <td align="center"><euc:EformDropDownList RecordId="1"  TABLE="Diagnostics" FIELD="DxResult" ID="DxResult_1" 
                    LookupCode="DxResult,Disease,Breast" Runat="server"/></td>
                <td align="center"><euc:EformTextBox RecordId="1"  TABLE="Diagnostics" FIELD="DxIndication" ID="DxIndication_1"
                    Runat="server" Width="80px"/></td>
                <td align="center"><euc:EformComboBox RecordId="1"  TABLE="Diagnostics" FIELD="DxPhysician" ID="DxPhysician_1" 
                    LookupCode="DxPhysician" Runat="server" Width="80px" DropDownWidth="200px"/></td>
                <td><euc:EformDeleteIcon ID="EformDeleteIcon1" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
            </tr>
         </table><br />
         
            <table border="0" cellpadding="0" cellspacing="0" style="padding-left:15px;">
            <tr>
                <td>
                    <span class="controlBoxTitle">Other Image Findings</span> <br/>
                    <table width="450" cellpadding="2" cellspacing="0" class="ClinicalEformTable" id="BreastImgFindingsTable1" style="background-color: #ffffff;">
                        <tr>
                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Side</td>
                            <td class="controlBoxDataGridHeaderFirstCol">Site</td>
                            <td class="controlBoxDataGridHeaderFirstCol">Result</td>
                            <td class="controlBoxDataGridHeaderFirstCol" style="white-space: nowrap;">Max Dimension</td>
                            <td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
                        </tr>
                        
                        <tr id="BreastImgFindingsHtmlTr1">
                            <td align="center"><euc:EformDropDownList RecordId="1"  TABLE="DxImageFindings" FIELD="ImgFindSide" 
                                ID="ImgFindSide_1" LookupCode="FindSide" Runat="server"/></td>
                            <td align="center"><euc:EformDropDownList RecordId="1"  TABLE="DxImageFindings" FIELD="ImgFindSite" 
                                ID="ImgFindSite_1" LookupCode="ImgFindSite" Runat="server"/></td>
                            <td align="center"><euc:EformDropDownList RecordId="1"  TABLE="DxImageFindings" FIELD="ImgFindResult" 
                                ID="ImgFindResult_1" LookupCode="DxResult" Runat="server"/></td>
                            <td align="center"><euc:EformTextBox RecordId="1"  TABLE="DxImageFindings" FIELD="ImgFindHeight" 
                                ID="ImgFindHeight_1" Runat="server" Width="100px"/></td>
                            <td><euc:EformDeleteIcon ID="EformDeleteIcon2" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
                        </tr>
                        <tr id="BreastImgFindingsHtmlTr2">
                            <td align="center"><euc:EformDropDownList RecordId="2"  TABLE="DxImageFindings" FIELD="ImgFindSide" 
                                ID="ImgFindSide_2" LookupCode="FindSide" Runat="server"/></td>
                            <td align="center"><euc:EformDropDownList RecordId="2"  TABLE="DxImageFindings" FIELD="ImgFindSite" 
                                ID="ImgFindSite_2" LookupCode="ImgFindSite" Runat="server"/></td>
                            <td align="center"><euc:EformDropDownList RecordId="2"  TABLE="DxImageFindings" FIELD="ImgFindResult" 
                                ID="ImgFindResult_2" LookupCode="DxResult" Runat="server"/></td>
                            <td align="center"><euc:EformTextBox RecordId="2"  TABLE="DxImageFindings" FIELD="ImgFindHeight" 
                                ID="ImgFindHeight_2" Runat="server" Width="100px"/></td>
                            <td><euc:EformDeleteIcon ID="EformDeleteIcon3" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
                        </tr>
                        <tr id="BreastImgFindingsHtmlTr3">
                            <td align="center"><euc:EformDropDownList RecordId="3"  TABLE="DxImageFindings" FIELD="ImgFindSide" 
                                ID="ImgFindSide_3" LookupCode="FindSide" Runat="server"/></td>
                            <td align="center"><euc:EformDropDownList RecordId="3"  TABLE="DxImageFindings" FIELD="ImgFindSite" 
                                ID="ImgFindSite_3" LookupCode="ImgFindSite" Runat="server"/></td>
                            <td align="center"><euc:EformDropDownList RecordId="3"  TABLE="DxImageFindings" FIELD="ImgFindResult" 
                                ID="ImgFindResult_3" LookupCode="DxResult" Runat="server"/></td>
                            <td align="center"><euc:EformTextBox RecordId="3"  TABLE="DxImageFindings" FIELD="ImgFindHeight" 
                                ID="ImgFindHeight_3" Runat="server" Width="100px"/></td>
                            <td><euc:EformDeleteIcon ID="EformDeleteIcon4" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
                        </tr>
                    </table><br />
                 </td>
              </tr>
         </table>
            </td></tr>
         
            <tr style="display:none;"><td>
            <hr width="1200" align="center" style=" color:#666666;" /><br />
            <span class="controlBoxTitle">Diagnostics</span> <br/>
            <table width="650" cellpadding="2" cellspacing="0" class="ClinicalEformTable" id="BreastImgHtmlTable2">
            <tr>
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">&nbsp;Date</td>
                <td class="controlBoxDataGridHeaderFirstCol" align="center">Disease</td>
                <td class="controlBoxDataGridHeaderFirstCol" align="center">Type</td>
                <td class="controlBoxDataGridHeaderFirstCol" align="center">Side</td>
                <td class="controlBoxDataGridHeaderFirstCol" align="center">Target</td>
                <td class="controlBoxDataGridHeaderFirstCol" align="center">Result</td>
                <td class="controlBoxDataGridHeaderFirstCol" align="center">Indication</td>
                <td class="controlBoxDataGridHeaderFirstCol" align="center">Physician</td>
                <td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
            </tr>
            
            <tr id="BreastImgHtmlTr2">
                <td align="center"><euc:EformTextBox  Width="70px" RecordId="2"   TABLE="Diagnostics" FIELD="DxDateText" ID="DxDateText_2" 
                    Runat="server" ShowCalendar="true" CalcDate="true"/>
                    <euc:EformHidden  RecordId="2" TABLE="Diagnostics" FIELD="DxDate" ID="DxDate_2" Runat="server"/></td>
                <td align="center"><euc:EformDropDownList Width="120px" RecordId="2"  TABLE="Diagnostics" FIELD="DxDisease" 
                    ID="DxDisease_2" LookupCode="Disease" Runat="server"/></td>
                <td align="center"><euc:EformDropDownList RecordId="2"  TABLE="Diagnostics" FIELD="DxType" ID="DxType_2" 
                    LookupCode="DxType" Runat="server"/>
                    
                    <euc:EformTextBox RecordId="2"  TABLE="Diagnostics" FIELD="DxInstitution" ID="DxInstitution_2" Runat="server" 
                        style="width:1px;display:none;"/>
                    <euc:EformTextBox RecordId="2"  TABLE="Diagnostics" FIELD="DxQuality" ID="DxQuality_2" Runat="server" 
                        style="width:1px;display:none;"/></td>
                    
                <td align="center"><euc:EformDropDownList RecordId="2"  TABLE="Diagnostics" FIELD="DxSide" ID="DxSide_2" 
                    LookupCode="FindSide" Runat="server"/></td>
                <td align="center"><euc:EformComboBox RecordId="2"  TABLE="Diagnostics" FIELD="DxTarget" ID="DxTarget_2" 
                    LookupCode="DxTarget" Runat="server" Width="80px" DropDownWidth="300px"/></td>
                <td align="center"><euc:EformDropDownList RecordId="2"  TABLE="Diagnostics" FIELD="DxResult" ID="DxResult_2" 
                    LookupCode="DxResult,Disease,Breast" Runat="server"/></td>
                <td align="center"><euc:EformTextBox RecordId="2"  TABLE="Diagnostics" FIELD="DxIndication" ID="DxIndication_2"
                    Runat="server" Width="80px"/></td>
                <td align="center"><euc:EformComboBox RecordId="2"  TABLE="Diagnostics" FIELD="DxPhysician" ID="DxPhysician_2" 
                    LookupCode="DxPhysician" Runat="server" Width="80px" DropDownWidth="200px"/></td>
                <td><euc:EformDeleteIcon ID="EformDeleteIcon5" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
            </tr>
         </table><br />
         
            <table border="0" cellpadding="0" cellspacing="0" style="padding-left:15px;">
            <tr>
                <td>
                    <span class="controlBoxTitle">Other Image Findings</span> <br/>
                    <table width="450" cellpadding="2" cellspacing="0" class="ClinicalEformTable" id="BreastImgFindingsTable2">
                        <tr>
                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Side</td>
                            <td class="controlBoxDataGridHeaderFirstCol">Site</td>
                            <td class="controlBoxDataGridHeaderFirstCol">Result</td>
                            <td class="controlBoxDataGridHeaderFirstCol" style="white-space: nowrap;">Max Dimension</td>
                            <td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
                        </tr>
                        
                        <tr id="BreastImgFindingsHtmlTr4">
                            <td align="center"><euc:EformDropDownList RecordId="4"  TABLE="DxImageFindings" FIELD="ImgFindSide" 
                                ID="ImgFindSide_4" LookupCode="FindSide" Runat="server"/></td>
                            <td align="center"><euc:EformDropDownList RecordId="4"  TABLE="DxImageFindings" FIELD="ImgFindSite" 
                                ID="ImgFindSite_4" LookupCode="ImgFindSite" Runat="server"/></td>
                            <td align="center"><euc:EformDropDownList RecordId="4"  TABLE="DxImageFindings" FIELD="ImgFindResult" 
                                ID="ImgFindResult_4" LookupCode="DxResult" Runat="server"/></td>
                            <td align="center"><euc:EformTextBox RecordId="4"  TABLE="DxImageFindings" FIELD="ImgFindHeight" 
                                ID="ImgFindHeight_4" Runat="server" Width="100px"/></td>
                            <td><euc:EformDeleteIcon ID="EformDeleteIcon6" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
                        </tr>
                        <tr id="BreastImgFindingsHtmlTr5">
                            <td align="center"><euc:EformDropDownList RecordId="5"  TABLE="DxImageFindings" FIELD="ImgFindSide" 
                                ID="ImgFindSide_5" LookupCode="FindSide" Runat="server"/></td>
                            <td align="center"><euc:EformDropDownList RecordId="5"  TABLE="DxImageFindings" FIELD="ImgFindSite" 
                                ID="ImgFindSite_5" LookupCode="ImgFindSite" Runat="server"/></td>
                            <td align="center"><euc:EformDropDownList RecordId="5"  TABLE="DxImageFindings" FIELD="ImgFindResult" 
                                ID="ImgFindResult_5" LookupCode="DxResult" Runat="server"/></td>
                            <td align="center"><euc:EformTextBox RecordId="5"  TABLE="DxImageFindings" FIELD="ImgFindHeight" 
                                ID="ImgFindHeight_5" Runat="server" Width="100px"/></td>
                            <td><euc:EformDeleteIcon ID="EformDeleteIcon7" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
                        </tr>
                        <tr id="BreastImgFindingsHtmlTr6">
                            <td align="center"><euc:EformDropDownList RecordId="6"  TABLE="DxImageFindings" FIELD="ImgFindSide" 
                                ID="ImgFindSide_6" LookupCode="FindSide" Runat="server"/></td>
                            <td align="center"><euc:EformDropDownList RecordId="6"  TABLE="DxImageFindings" FIELD="ImgFindSite" 
                                ID="ImgFindSite_6" LookupCode="ImgFindSite" Runat="server"/></td>
                            <td align="center"><euc:EformDropDownList RecordId="6"  TABLE="DxImageFindings" FIELD="ImgFindResult" 
                                ID="ImgFindResult_6" LookupCode="DxResult" Runat="server"/></td>
                            <td align="center"><euc:EformTextBox RecordId="6"  TABLE="DxImageFindings" FIELD="ImgFindHeight" 
                                ID="ImgFindHeight_6" Runat="server" Width="100px"/></td>
                            <td><euc:EformDeleteIcon ID="EformDeleteIcon8" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
                        </tr>
                    </table><br />
                 </td>
              </tr>
         </table>
            </td></tr>
         
            <tr style="display:none;"><td>
            <hr width="1200" align="center" style=" color:#666666;" /><br />
            <span class="controlBoxTitle">Diagnostics</span> <br/>
            <table width="650" cellpadding="2" cellspacing="0" class="ClinicalEformTable" id="BreastImgHtmlTable3">
            <tr>
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">&nbsp;Date</td>
                <td class="controlBoxDataGridHeaderFirstCol" align="center">Disease</td>
                <td class="controlBoxDataGridHeaderFirstCol" align="center">Type</td>
                <td class="controlBoxDataGridHeaderFirstCol" align="center">Side</td>
                <td class="controlBoxDataGridHeaderFirstCol" align="center">Target</td>
                <td class="controlBoxDataGridHeaderFirstCol" align="center">Result</td>
                <td class="controlBoxDataGridHeaderFirstCol" align="center">Indication</td>
                <td class="controlBoxDataGridHeaderFirstCol" align="center">Physician</td>
                <td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
            </tr>
            
            <tr id="BreastImgHtmlTr3">
                <td align="center"><euc:EformTextBox  Width="70px" RecordId="3"   TABLE="Diagnostics" FIELD="DxDateText" ID="DxDateText_3" 
                    Runat="server" ShowCalendar="true" CalcDate="true"/>
                    <euc:EformHidden  RecordId="3" TABLE="Diagnostics" FIELD="DxDate" ID="DxDate_3" Runat="server"/></td>
                <td align="center"><euc:EformDropDownList Width="120px" RecordId="3"  TABLE="Diagnostics" FIELD="DxDisease" 
                    ID="DxDisease_3" LookupCode="Disease" Runat="server"/></td>
                <td align="center"><euc:EformDropDownList RecordId="3"  TABLE="Diagnostics" FIELD="DxType" ID="DxType_3" 
                    LookupCode="DxType" Runat="server"/>
                    
                    <euc:EformTextBox RecordId="3"  TABLE="Diagnostics" FIELD="DxInstitution" ID="DxInstitution_3" Runat="server" 
                        style="width:1px;display:none;"/>
                    <euc:EformTextBox RecordId="3"  TABLE="Diagnostics" FIELD="DxQuality" ID="DxQuality_3" Runat="server" 
                        style="width:1px;display:none;"/></td>
                    
                <td align="center"><euc:EformDropDownList RecordId="3"  TABLE="Diagnostics" FIELD="DxSide" ID="DxSide_3" 
                    LookupCode="FindSide" Runat="server"/></td>
                <td align="center"><euc:EformComboBox RecordId="3"  TABLE="Diagnostics" FIELD="DxTarget" ID="DxTarget_3" 
                    LookupCode="DxTarget" Runat="server" Width="80px" DropDownWidth="300px"/></td>
                <td align="center"><euc:EformDropDownList RecordId="3"  TABLE="Diagnostics" FIELD="DxResult" ID="DxResult_3" 
                    LookupCode="DxResult,Disease,Breast" Runat="server"/></td>
                <td align="center"><euc:EformTextBox RecordId="3"  TABLE="Diagnostics" FIELD="DxIndication" ID="DxIndication_3"
                    Runat="server" Width="80px"/></td>
                <td align="center"><euc:EformComboBox RecordId="3"  TABLE="Diagnostics" FIELD="DxPhysician" ID="DxPhysician_3" 
                    LookupCode="DxPhysician" Runat="server" Width="80px" DropDownWidth="200px"/></td>
                <td><euc:EformDeleteIcon ID="EformDeleteIcon9" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
            </tr>
         </table><br />
         
            <table border="0" cellpadding="0" cellspacing="0" style="padding-left:15px;">
            <tr>
                <td>
                    <span class="controlBoxTitle">Other Image Findings</span> <br/>
                    <table width="450" cellpadding="2" cellspacing="0" class="ClinicalEformTable" id="BreastImgFindingsTable3">
                        <tr>
                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Side</td>
                            <td class="controlBoxDataGridHeaderFirstCol">Site</td>
                            <td class="controlBoxDataGridHeaderFirstCol">Result</td>
                            <td class="controlBoxDataGridHeaderFirstCol" style="white-space: nowrap;">Max Dimension</td>
                            <td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
                        </tr>
                        
                        <tr id="BreastImgFindingsHtmlTr7">
                            <td align="center"><euc:EformDropDownList RecordId="7"  TABLE="DxImageFindings" FIELD="ImgFindSide" 
                                ID="ImgFindSide_7" LookupCode="FindSide" Runat="server"/></td>
                            <td align="center"><euc:EformDropDownList RecordId="7"  TABLE="DxImageFindings" FIELD="ImgFindSite" 
                                ID="ImgFindSite_7" LookupCode="ImgFindSite" Runat="server"/></td>
                            <td align="center"><euc:EformDropDownList RecordId="7"  TABLE="DxImageFindings" FIELD="ImgFindResult" 
                                ID="ImgFindResult_7" LookupCode="DxResult" Runat="server"/></td>
                            <td align="center"><euc:EformTextBox RecordId="7"  TABLE="DxImageFindings" FIELD="ImgFindHeight" 
                                ID="ImgFindHeight_7" Runat="server" Width="100px"/></td>
                            <td><euc:EformDeleteIcon ID="EformDeleteIcon10" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
                        </tr>
                        <tr id="BreastImgFindingsHtmlTr8">
                            <td align="center"><euc:EformDropDownList RecordId="8"  TABLE="DxImageFindings" FIELD="ImgFindSide" 
                                ID="ImgFindSide_8" LookupCode="FindSide" Runat="server"/></td>
                            <td align="center"><euc:EformDropDownList RecordId="8"  TABLE="DxImageFindings" FIELD="ImgFindSite" 
                                ID="ImgFindSite_8" LookupCode="ImgFindSite" Runat="server"/></td>
                            <td align="center"><euc:EformDropDownList RecordId="8"  TABLE="DxImageFindings" FIELD="ImgFindResult" 
                                ID="ImgFindResult_8" LookupCode="DxResult" Runat="server"/></td>
                            <td align="center"><euc:EformTextBox RecordId="8"  TABLE="DxImageFindings" FIELD="ImgFindHeight" 
                                ID="ImgFindHeight_8" Runat="server" Width="100px"/></td>
                            <td><euc:EformDeleteIcon ID="EformDeleteIcon11" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
                        </tr>
                        <tr id="BreastImgFindingsHtmlTr9">
                            <td align="center"><euc:EformDropDownList RecordId="9"  TABLE="DxImageFindings" FIELD="ImgFindSide" 
                                ID="ImgFindSide_9" LookupCode="FindSide" Runat="server"/></td>
                            <td align="center"><euc:EformDropDownList RecordId="9"  TABLE="DxImageFindings" FIELD="ImgFindSite" 
                                ID="ImgFindSite_9" LookupCode="ImgFindSite" Runat="server"/></td>
                            <td align="center"><euc:EformDropDownList RecordId="9"  TABLE="DxImageFindings" FIELD="ImgFindResult" 
                                ID="ImgFindResult_9" LookupCode="DxResult" Runat="server"/></td>
                            <td align="center"><euc:EformTextBox RecordId="9"  TABLE="DxImageFindings" FIELD="ImgFindHeight" 
                                ID="ImgFindHeight_9" Runat="server" Width="100px"/></td>
                            <td><euc:EformDeleteIcon ID="EformDeleteIcon12" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
                        </tr>
                    </table><br />
                 </td>
              </tr>
         </table>
            </td></tr>
         
            <tr style="display:none;"><td>
            <hr width="1200" align="center" style=" color:#666666;" /><br />
            <span class="controlBoxTitle">Diagnostics</span> <br/>
            <table width="650" cellpadding="2" cellspacing="0" class="ClinicalEformTable" id="BreastImgHtmlTable4">
            <tr>
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">&nbsp;Date</td>
                <td class="controlBoxDataGridHeaderFirstCol" align="center">Disease</td>
                <td class="controlBoxDataGridHeaderFirstCol" align="center">Type</td>
                <td class="controlBoxDataGridHeaderFirstCol" align="center">Side</td>
                <td class="controlBoxDataGridHeaderFirstCol" align="center">Target</td>
                <td class="controlBoxDataGridHeaderFirstCol" align="center">Result</td>
                <td class="controlBoxDataGridHeaderFirstCol" align="center">Indication</td>
                <td class="controlBoxDataGridHeaderFirstCol" align="center">Physician</td>
                <td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
            </tr>
            
            <tr id="BreastImgHtmlTr4">
                <td align="center"><euc:EformTextBox  Width="70px" RecordId="4"   TABLE="Diagnostics" FIELD="DxDateText" ID="DxDateText_4" 
                    Runat="server" ShowCalendar="true" CalcDate="true"/>
                    <euc:EformHidden  RecordId="4" TABLE="Diagnostics" FIELD="DxDate" ID="DxDate_4" Runat="server"/></td>
                <td align="center"><euc:EformDropDownList Width="120px" RecordId="4"  TABLE="Diagnostics" FIELD="DxDisease" 
                    ID="DxDisease_4" LookupCode="Disease" Runat="server"/></td>
                <td align="center"><euc:EformDropDownList RecordId="4"  TABLE="Diagnostics" FIELD="DxType" ID="DxType_4" 
                    LookupCode="DxType" Runat="server"/>
                    
                    <euc:EformTextBox RecordId="4"  TABLE="Diagnostics" FIELD="DxInstitution" ID="DxInstitution_4" Runat="server" 
                        style="width:1px;display:none;"/>
                    <euc:EformTextBox RecordId="4"  TABLE="Diagnostics" FIELD="DxQuality" ID="DxQuality_4" Runat="server" 
                        style="width:1px;display:none;"/></td>
                    
                <td align="center"><euc:EformDropDownList RecordId="4"  TABLE="Diagnostics" FIELD="DxSide" ID="DxSide_4" 
                    LookupCode="FindSide" Runat="server"/></td>
                <td align="center"><euc:EformComboBox RecordId="4"  TABLE="Diagnostics" FIELD="DxTarget" ID="DxTarget_4" 
                    LookupCode="DxTarget" Runat="server" Width="80px" DropDownWidth="300px"/></td>
                <td align="center"><euc:EformDropDownList RecordId="4"  TABLE="Diagnostics" FIELD="DxResult" ID="DxResult_4" 
                    LookupCode="DxResult,Disease,Breast" Runat="server"/></td>
                <td align="center"><euc:EformTextBox RecordId="4"  TABLE="Diagnostics" FIELD="DxIndication" ID="DxIndication_4"
                    Runat="server" Width="80px"/></td>
                <td align="center"><euc:EformComboBox RecordId="4"  TABLE="Diagnostics" FIELD="DxPhysician" ID="DxPhysician_4" 
                    LookupCode="DxPhysician" Runat="server" Width="80px" DropDownWidth="200px"/></td>
                <td><euc:EformDeleteIcon ID="EformDeleteIcon13" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
            </tr>
         </table><br />
         
            <table border="0" cellpadding="0" cellspacing="0" style="padding-left:15px;">
            <tr>
                <td>
                    <span class="controlBoxTitle">Other Image Findings</span> <br/>
                    <table width="450" cellpadding="2" cellspacing="0" class="ClinicalEformTable" id="BreastImgFindingsTable4">
                        <tr>
                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Side</td>
                            <td class="controlBoxDataGridHeaderFirstCol">Site</td>
                            <td class="controlBoxDataGridHeaderFirstCol">Result</td>
                            <td class="controlBoxDataGridHeaderFirstCol" style="white-space: nowrap;">Max Dimension</td>
                            <td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
                        </tr>
                        
                        <tr id="BreastImgFindingsHtmlTr10">
                            <td align="center"><euc:EformDropDownList RecordId="10"  TABLE="DxImageFindings" FIELD="ImgFindSide" 
                                ID="ImgFindSide_10" LookupCode="FindSide" Runat="server"/></td>
                            <td align="center"><euc:EformDropDownList RecordId="10"  TABLE="DxImageFindings" FIELD="ImgFindSite" 
                                ID="ImgFindSite_10" LookupCode="ImgFindSite" Runat="server"/></td>
                            <td align="center"><euc:EformDropDownList RecordId="10"  TABLE="DxImageFindings" FIELD="ImgFindResult" 
                                ID="ImgFindResult_10" LookupCode="DxResult" Runat="server"/></td>
                            <td align="center"><euc:EformTextBox RecordId="10"  TABLE="DxImageFindings" FIELD="ImgFindHeight" 
                                ID="ImgFindHeight_10" Runat="server" Width="100px"/></td>
                            <td><euc:EformDeleteIcon ID="EformDeleteIcon14" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
                        </tr>
                        <tr id="BreastImgFindingsHtmlTr11">
                            <td align="center"><euc:EformDropDownList RecordId="11"  TABLE="DxImageFindings" FIELD="ImgFindSide" 
                                ID="ImgFindSide_11" LookupCode="FindSide" Runat="server"/></td>
                            <td align="center"><euc:EformDropDownList RecordId="11"  TABLE="DxImageFindings" FIELD="ImgFindSite" 
                                ID="ImgFindSite_11" LookupCode="ImgFindSite" Runat="server"/></td>
                            <td align="center"><euc:EformDropDownList RecordId="11"  TABLE="DxImageFindings" FIELD="ImgFindResult" 
                                ID="ImgFindResult_11" LookupCode="DxResult" Runat="server"/></td>
                            <td align="center"><euc:EformTextBox RecordId="11"  TABLE="DxImageFindings" FIELD="ImgFindHeight" 
                                ID="ImgFindHeight_11" Runat="server" Width="100px"/></td>
                            <td><euc:EformDeleteIcon ID="EformDeleteIcon15" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
                        </tr>
                        <tr id="BreastImgFindingsHtmlTr12">
                            <td align="center"><euc:EformDropDownList RecordId="12"  TABLE="DxImageFindings" FIELD="ImgFindSide" 
                                ID="ImgFindSide_12" LookupCode="FindSide" Runat="server"/></td>
                            <td align="center"><euc:EformDropDownList RecordId="12"  TABLE="DxImageFindings" FIELD="ImgFindSite" 
                                ID="ImgFindSite_12" LookupCode="ImgFindSite" Runat="server"/></td>
                            <td align="center"><euc:EformDropDownList RecordId="12"  TABLE="DxImageFindings" FIELD="ImgFindResult" 
                                ID="ImgFindResult_12" LookupCode="DxResult" Runat="server"/></td>
                            <td align="center"><euc:EformTextBox RecordId="12"  TABLE="DxImageFindings" FIELD="ImgFindHeight" 
                                ID="ImgFindHeight_12" Runat="server" Width="100px"/></td>
                            <td><euc:EformDeleteIcon ID="EformDeleteIcon16" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
                        </tr>
                    </table><br />
                 </td>
              </tr>
         </table>
            </td></tr>
         
            <tr style="display:none;"><td>
            <hr width="1200" align="center" style=" color:#666666;" /><br />
            <span class="controlBoxTitle">Diagnostics</span> <br/>
            <table width="650" cellpadding="2" cellspacing="0" class="ClinicalEformTable" id="BreastImgHtmlTable5">
            <tr>
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">&nbsp;Date</td>
                <td class="controlBoxDataGridHeaderFirstCol" align="center">Disease</td>
                <td class="controlBoxDataGridHeaderFirstCol" align="center">Type</td>
                <td class="controlBoxDataGridHeaderFirstCol" align="center">Side</td>
                <td class="controlBoxDataGridHeaderFirstCol" align="center">Target</td>
                <td class="controlBoxDataGridHeaderFirstCol" align="center">Result</td>
                <td class="controlBoxDataGridHeaderFirstCol" align="center">Indication</td>
                <td class="controlBoxDataGridHeaderFirstCol" align="center">Physician</td>
                <td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
            </tr>
            
            <tr id="BreastImgHtmlTr5">
                <td align="center"><euc:EformTextBox  Width="70px" RecordId="5"   TABLE="Diagnostics" FIELD="DxDateText" ID="DxDateText_5" 
                    Runat="server" ShowCalendar="true" CalcDate="true"/>
                    <euc:EformHidden  RecordId="5" TABLE="Diagnostics" FIELD="DxDate" ID="DxDate_5" Runat="server"/></td>
                <td align="center"><euc:EformDropDownList Width="120px" RecordId="5"  TABLE="Diagnostics" FIELD="DxDisease" 
                    ID="DxDisease_5" LookupCode="Disease" Runat="server"/></td>
                <td align="center"><euc:EformDropDownList RecordId="5"  TABLE="Diagnostics" FIELD="DxType" ID="DxType_5" 
                    LookupCode="DxType" Runat="server"/>
                    
                    <euc:EformTextBox RecordId="5"  TABLE="Diagnostics" FIELD="DxInstitution" ID="DxInstitution_5" Runat="server" 
                        style="width:1px;display:none;"/>
                    <euc:EformTextBox RecordId="5"  TABLE="Diagnostics" FIELD="DxQuality" ID="DxQuality_5" Runat="server" 
                        style="width:1px;display:none;"/></td>
                    
                <td align="center"><euc:EformDropDownList RecordId="5"  TABLE="Diagnostics" FIELD="DxSide" ID="DxSide_5" 
                    LookupCode="FindSide" Runat="server"/></td>
                <td align="center"><euc:EformComboBox RecordId="5"  TABLE="Diagnostics" FIELD="DxTarget" ID="DxTarget_5" 
                    LookupCode="DxTarget" Runat="server" Width="80px" DropDownWidth="300px"/></td>
                <td align="center"><euc:EformDropDownList RecordId="5"  TABLE="Diagnostics" FIELD="DxResult" ID="DxResult_5" 
                    LookupCode="DxResult,Disease,Breast" Runat="server"/></td>
                <td align="center"><euc:EformTextBox RecordId="5"  TABLE="Diagnostics" FIELD="DxIndication" ID="DxIndication_5"
                    Runat="server" Width="80px"/></td>
                <td align="center"><euc:EformComboBox RecordId="5"  TABLE="Diagnostics" FIELD="DxPhysician" ID="DxPhysician_5" 
                    LookupCode="DxPhysician" Runat="server" Width="80px" DropDownWidth="200px"/></td>
                <td><euc:EformDeleteIcon ID="EformDeleteIcon17" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
            </tr>
         </table><br />
            
            <table border="0" cellpadding="0" cellspacing="0" style="padding-left:15px;">
            <tr>
                <td>
                    <span class="controlBoxTitle">Other Image Findings</span> <br/>
                    <table width="450" cellpadding="2" cellspacing="0" class="ClinicalEformTable" id="BreastImgFindingsTable5">
                        <tr>
                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Side</td>
                            <td class="controlBoxDataGridHeaderFirstCol">Site</td>
                            <td class="controlBoxDataGridHeaderFirstCol">Result</td>
                            <td class="controlBoxDataGridHeaderFirstCol" style="white-space: nowrap;">Max Dimension</td>
                            <td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
                        </tr>
                        
                        <tr id="BreastImgFindingsHtmlTr13">
                            <td align="center"><euc:EformDropDownList RecordId="13"  TABLE="DxImageFindings" FIELD="ImgFindSide" 
                                ID="ImgFindSide_13" LookupCode="FindSide" Runat="server"/></td>
                            <td align="center"><euc:EformDropDownList RecordId="13"  TABLE="DxImageFindings" FIELD="ImgFindSite" 
                                ID="ImgFindSite_13" LookupCode="ImgFindSite" Runat="server"/></td>
                            <td align="center"><euc:EformDropDownList RecordId="13"  TABLE="DxImageFindings" FIELD="ImgFindResult" 
                                ID="ImgFindResult_13" LookupCode="DxResult" Runat="server"/></td>
                            <td align="center"><euc:EformTextBox RecordId="13"  TABLE="DxImageFindings" FIELD="ImgFindHeight" 
                                ID="ImgFindHeight_13" Runat="server" Width="100px"/></td>
                            <td><euc:EformDeleteIcon ID="EformDeleteIcon18" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
                        </tr>
                        <tr id="BreastImgFindingsHtmlTr14">
                            <td align="center"><euc:EformDropDownList RecordId="14"  TABLE="DxImageFindings" FIELD="ImgFindSide" 
                                ID="ImgFindSide_14" LookupCode="FindSide" Runat="server"/></td>
                            <td align="center"><euc:EformDropDownList RecordId="14"  TABLE="DxImageFindings" FIELD="ImgFindSite" 
                                ID="ImgFindSite_14" LookupCode="ImgFindSite" Runat="server"/></td>
                            <td align="center"><euc:EformDropDownList RecordId="14"  TABLE="DxImageFindings" FIELD="ImgFindResult" 
                                ID="ImgFindResult_14" LookupCode="DxResult" Runat="server"/></td>
                            <td align="center"><euc:EformTextBox RecordId="14"  TABLE="DxImageFindings" FIELD="ImgFindHeight" 
                                ID="ImgFindHeight_14" Runat="server" Width="100px"/></td>
                            <td><euc:EformDeleteIcon ID="EformDeleteIcon19" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
                        </tr>
                        <tr id="BreastImgFindingsHtmlTr15">
                            <td align="center"><euc:EformDropDownList RecordId="15"  TABLE="DxImageFindings" FIELD="ImgFindSide" 
                                ID="ImgFindSide_15" LookupCode="FindSide" Runat="server"/></td>
                            <td align="center"><euc:EformDropDownList RecordId="15"  TABLE="DxImageFindings" FIELD="ImgFindSite" 
                                ID="ImgFindSite_15" LookupCode="ImgFindSite" Runat="server"/></td>
                            <td align="center"><euc:EformDropDownList RecordId="15"  TABLE="DxImageFindings" FIELD="ImgFindResult" 
                                ID="ImgFindResult_15" LookupCode="DxResult" Runat="server"/></td>
                            <td align="center"><euc:EformTextBox RecordId="15"  TABLE="DxImageFindings" FIELD="ImgFindHeight" 
                                ID="ImgFindHeight_15" Runat="server" Width="100px"/></td>
                            <td><euc:EformDeleteIcon ID="EformDeleteIcon20" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
                        </tr>
                    </table><br />
                 </td>
              </tr>
         </table>
            </td></tr>
        </table>
        <img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'BreastDxTable');" /><br />
     </td>
 </tr>
</table><br /><br />



<script type="text/javascript">
    //updates procedure autopopulates
    function addDxEvents(dxType,dxInst,dxQlty)
    { 
        $(dxType).addEvent('blur',curry(DxPopulates,dxType,dxInst,dxQlty));
    } 
    addDxEvents($('<%= DxType_1.ClientID %>'),$('<%= DxInstitution_1.ClientID %>'),$('<%= DxQuality_1.ClientID %>'));
    addDxEvents($('<%= DxType_2.ClientID %>'),$('<%= DxInstitution_2.ClientID %>'),$('<%= DxQuality_2.ClientID %>'));
    addDxEvents($('<%= DxType_3.ClientID %>'),$('<%= DxInstitution_3.ClientID %>'),$('<%= DxQuality_3.ClientID %>'));
    addDxEvents($('<%= DxType_4.ClientID %>'),$('<%= DxInstitution_4.ClientID %>'),$('<%= DxQuality_4.ClientID %>'));
    addDxEvents($('<%= DxType_5.ClientID %>'),$('<%= DxInstitution_5.ClientID %>'),$('<%= DxQuality_5.ClientID %>'));

    function DxPopulates(dxType,dxInst,dxQlty)
    {
       if (dxType.value != '')
        {
           dxInst.value = 'Memorial Sloan Kettering Cancer Center';
           dxQlty.value = 'STD';
        }
        else
        {
            dxInst.value = '';
            dxQlty.value = '';
        }
    }   
    
    
    //Adds events for Meds   
    addImgEvent($('<%= ImgDone.ClientID %>'),$('<%= BreastImgDetailsTR.ClientID %>'));
    
    function addImgEvent(ImgYesNoID,ImgTRID)
    {  
        $(ImgYesNoID).addEvent('click',curry(ImgHxYesNo,ImgYesNoID,ImgTRID));

        // check on load as well
        ImgHxYesNo(ImgYesNoID,ImgTRID);
    }
   
    function ImgHxYesNo(ImgYesNoID,ImgTRID)
    {
       var ImgYesNoRef = ImgYesNoID.getElementsByTagName('input');
       
       for (var i = 0; i < ImgYesNoRef.length; i++) 
        if (ImgYesNoRef[i].checked) 
        {  
            ImgHxRadioClick(ImgYesNoRef[i].value,ImgTRID);
        }
    }
    
    function ImgHxRadioClick(Imgoption_value,ImghideTR)
    {
      if (Imgoption_value == "Yes")
      { 
        ImghideTR.style.display='block';
        
      } 
      else if (Imgoption_value == "No")
      {
        ImghideTR.style.display='none';
        
        //clears row data
        for(var i=1;i<=5;i++)
        {
            clearElementsInParentRow(document.getElementById('BreastImgHtmlTr'+i));
        }
        
        for(var j=1;j<=15;j++)
        {             
            clearElementsInParentRow(document.getElementById('BreastImgFindingsHtmlTr'+j));
        }
      }
    }
    
</script>
