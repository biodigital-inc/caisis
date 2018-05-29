<%@ Control Language="C#" Inherits="Caisis.UI.Modules.Thoracic.Eforms.CTScanThoracic" CodeFile="CTScanThoracic.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<script language="javascript" type="text/javascript">
    tableArray.DxFindingsTbl1 = "DxFindingsTbl1";
</script>

<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>

<a name="CTScanThoracic" /><span class="controlBoxTitle">CT Scan</span> <br/>

<table width="550" cellpadding="5" cellspacing="0" class="eformLargePopulatedTable" id="CTScanTbl">
    <tr>
        <td>
        <table width="450" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="CTScanParentTable">
          <tr>
		    <td  class="controlBoxDataGridTitleColumn">Date</td>
		    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Side</td>
		    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Target</td>
		    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Indication</td>
		    <td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
          </tr>
      
          <tr>
             <td><euc:EformTextBox RecordId="2" ShowCalendar="True" CalcDate="True" Width="100px" TABLE="Diagnostics" FIELD="DxDateText" 
	            Runat="server" ID="DxDateText_2"/>
		            <euc:EformHidden RecordId="2" TABLE="Diagnostics" FIELD="DxDate" Runat="server" ID="DxDate_2"/></td>
            <td align="center"><euc:EformTextBox RecordId="2" style="display:none;width:1px;" TABLE="Diagnostics" FIELD="DxType" 
                Runat="server" ID="DxType_2"/>
                <euc:EformComboBox RecordId="2" Width="100px" TABLE="Diagnostics" FIELD="DxSide" Runat="server" ID="DxSide_2" 
                LookupCode="FindSide,Disease,Thoracic" DropDownHeight="auto"/></td>
            <td align="center"><euc:EformTextBox RecordId="2" Width="100px" TABLE="Diagnostics" FIELD="DxTarget" Runat="server" 
                ID="DxTarget_2" ReadOnly="true"/>
                <euc:EformTextBox RecordId="2" Width="1px" style="display:none" TABLE="Diagnostics" FIELD="DxQuality" Runat="server" 
                    ID="DxQuality_2"/></td>
            <td align="center"><euc:EformDropDownList RecordId="2" Width="100px" TABLE="Diagnostics" FIELD="DxIndication" Runat="server" 
                ID="DxIndication_2" LookupCode="ThoracicDxIndication"/></td>
            <td><euc:EformDeleteIcon ID="EformDeleteIcon1" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
        </tr>
        </table>
        </td>
    </tr>
    
      <tr id="DxFindingsTR1" runat="server" style=" display:none;">
        <td colspan="4">
        <span class="controlBoxDataGridHeader">Image Findings</span> <br/>
        <table width="300" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="DxFindingsTbl1">
          <tr> 
            <td class="controlBoxDataGridHeaderFirstCol">Result</td>
            <td class="controlBoxDataGridHeaderFirstCol">Site</td>
            <td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
          </tr>  
          
          <tr>
            <td align="center"><euc:EformDropDownList RecordId="1" Width="100px" TABLE="DxImageFindings" FIELD="ImgFindResult" Runat="server" 
                ID="ImgFindResult_1" LookupCode="DxResult,Disease,Thoracic" DropDownHeight="auto"/></td>
            <td align="center"><euc:EformTextBox RecordId="1" Width="100px" TABLE="DxImageFindings" FIELD="ImgFindSite" Runat="server" 
                ID="ImgFindSite_1" ReadOnly="true"/></td>
            <td><euc:EformDeleteIcon ID="EformDeleteIcon2" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
          </tr>
          <tr>
            <td align="center"><euc:EformDropDownList RecordId="2" Width="100px" TABLE="DxImageFindings" FIELD="ImgFindResult" Runat="server" 
                ID="ImgFindResult_2" LookupCode="DxResult,Disease,Thoracic" DropDownHeight="auto"/></td>
            <td align="center"><euc:EformTextBox RecordId="2" Width="100px" TABLE="DxImageFindings" FIELD="ImgFindSite" Runat="server" 
                ID="ImgFindSite_2" ReadOnly="true"/></td>
            <td><euc:EformDeleteIcon ID="EformDeleteIcon3" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
          </tr>
          <tr style=" display:none;">
            <td align="center"><euc:EformDropDownList RecordId="3" Width="100px" TABLE="DxImageFindings" FIELD="ImgFindResult" Runat="server" 
                ID="ImgFindResult_3" LookupCode="DxResult,Disease,Thoracic" DropDownHeight="auto"/></td>
            <td align="center"><euc:EformTextBox RecordId="3" Width="100px" TABLE="DxImageFindings" FIELD="ImgFindSite" Runat="server" 
                ID="ImgFindSite_3" ReadOnly="true"/></td>
            <td><euc:EformDeleteIcon ID="EformDeleteIcon4" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
          </tr>
          <tr style=" display:none;">
            <td align="center"><euc:EformDropDownList RecordId="4" Width="100px" TABLE="DxImageFindings" FIELD="ImgFindResult" Runat="server" 
                ID="ImgFindResult_4" LookupCode="DxResult,Disease,Thoracic" DropDownHeight="auto"/></td>
            <td align="center"><euc:EformTextBox RecordId="4" Width="100px" TABLE="DxImageFindings" FIELD="ImgFindSite" Runat="server" 
                ID="ImgFindSite_4" ReadOnly="true"/></td>
            <td><euc:EformDeleteIcon ID="EformDeleteIcon5" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
          </tr>
          <tr style=" display:none;">
            <td align="center"><euc:EformDropDownList RecordId="5" Width="100px" TABLE="DxImageFindings" FIELD="ImgFindResult" Runat="server" 
                ID="ImgFindResult_5" LookupCode="DxResult,Disease,Thoracic" DropDownHeight="auto"/></td>
            <td align="center"><euc:EformTextBox RecordId="5" Width="100px" TABLE="DxImageFindings" FIELD="ImgFindSite" Runat="server" 
                ID="ImgFindSite_5" ReadOnly="true"/></td>
            <td><euc:EformDeleteIcon ID="EformDeleteIcon6" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
          </tr>
        </table>
        <img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'DxFindingsTbl1');" />
    </td>
  </tr>
</table><br /><br />

<script type="text/javascript">
    //updates CT scan details
    function addEvents(dxDate,dxType,dxSide,dxTarget,dxQlty)
    { 
        $(dxDate).addEvent('blur',curry(AutoPopulates,dxDate,dxType,dxSide,dxTarget,dxQlty));
        $(dxSide).addEvent('blur',curry(AutoPopulates,dxDate,dxType,dxSide,dxTarget,dxQlty));
    } 
    addEvents($('<%= DxDateText_2.ClientID %>'),$('<%= DxType_2.ClientID %>'),$('<%= DxSide_2.ClientID %>'),$('<%= DxTarget_2.ClientID %>'),$('<%= DxQuality_2.ClientID %>'));

    function AutoPopulates(dxDate,dxType,dxSide,dxTarget,dxQlty)
    {
       if (dxDate.value != '' || dxSide.value != '')
        {
           dxType.value = 'CT Scan';
           dxQlty.value = 'STD';
           dxTarget.value = 'Chest';
        }
        else
        {
            dxType.value = '';
            dxQlty.value = '';
            dxTarget.value = '';
        }
    }
    
    //shows findings child record only if any field in parent Dx record is entered
    function findingaddEvnt(dxDate,dxSide,dxTarget,dxfindingRow)
    { 
        $(dxDate).addEvent('blur',curry(showHideDxFinding,dxDate,dxSide,dxTarget,dxfindingRow));
        $(dxSide).addEvent('blur',curry(showHideDxFinding,dxDate,dxSide,dxTarget,dxfindingRow));
        $(dxTarget).addEvent('blur',curry(showHideDxFinding,dxDate,dxSide,dxTarget,dxfindingRow));
    } 
    findingaddEvnt($('<%= DxDateText_2.ClientID %>'),$('<%= DxSide_2.ClientID %>'),$('<%= DxTarget_2.ClientID %>'),$('<%= DxFindingsTR1.ClientID %>'));

    function showHideDxFinding(dxDate,dxSide,dxTarget,dxfindingRow)
    {
       if (dxDate.value != '' || dxSide.value != '' || dxTarget.value != '')
        {
           dxfindingRow.style.display = 'block';
        }
        else
        {
            dxfindingRow.style.display = 'none';
        }
    }
    
    //updates DX findings details
    function updateFindings(dxFindingResult,dxFindingSite)
    { 
        $(dxFindingResult).addEvent('blur',curry(FindingPopulates,dxFindingResult,dxFindingSite));
    } 
    updateFindings($('<%= ImgFindResult_1.ClientID %>'),$('<%= ImgFindSite_1.ClientID %>'));
    updateFindings($('<%= ImgFindResult_2.ClientID %>'),$('<%= ImgFindSite_2.ClientID %>'));
    updateFindings($('<%= ImgFindResult_3.ClientID %>'),$('<%= ImgFindSite_3.ClientID %>'));
    updateFindings($('<%= ImgFindResult_4.ClientID %>'),$('<%= ImgFindSite_4.ClientID %>'));
    updateFindings($('<%= ImgFindResult_5.ClientID %>'),$('<%= ImgFindSite_5.ClientID %>'));

    function FindingPopulates(dxFindingResult,dxFindingSite)
    {
       if (dxFindingResult.value != '')
        {
           dxFindingSite.value = 'Lung';
        }
        else
        {
            dxFindingSite.value = '';
        }
    }
</script>