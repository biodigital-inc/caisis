<%@ Control Language="C#" Inherits="Caisis.UI.Modules.Thoracic.Eforms.PETScanThoracic" CodeFile="PETScanThoracic.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<script language="javascript" type="text/javascript">
    tableArray.DxFindingsTbl2 = "DxFindingsTbl2";
</script>

<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>

<a name="PETScanThoracic" /><span class="controlBoxTitle">PET Scan</span> <br/>

<table width="500" cellpadding="5" cellspacing="0" class="eformLargePopulatedTable" id="PETScanTbl">
    <tr>
        <td>
        <table width="450" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="PETScanParentTable">
          <tr>
		    <td  class="controlBoxDataGridTitleColumn">Date</td>
		    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Side</td>
		    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Target</td>
		    <%--<td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Indication</td>--%>
		    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Institution</td>
		    <td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
          </tr>
      
          <tr>
             <td><euc:EformTextBox RecordId="3" ShowCalendar="True" CalcDate="True" Width="100px" TABLE="Diagnostics" FIELD="DxDateText" 
	            Runat="server" ID="DxDateText_3"/>
		            <euc:EformHidden RecordId="3" TABLE="Diagnostics" FIELD="DxDate" Runat="server" ID="DxDate_3"/></td>
            <td align="center"><euc:EformTextBox RecordId="3" style="display:none;width:1px;" TABLE="Diagnostics" FIELD="DxType" Runat="server" 
                ID="DxType_3"/>
                <euc:EformComboBox RecordId="3" Width="100px" TABLE="Diagnostics" FIELD="DxSide" Runat="server" ID="DxSide_3" 
                LookupCode="FindSide,Disease,Thoracic" DropDownHeight="auto"/></td>
            <td align="center"><euc:EformTextBox RecordId="3" Width="100px" TABLE="Diagnostics" FIELD="DxTarget" Runat="server" 
                ID="DxTarget_3" ReadOnly="true"/></td>
            <%--<td align="center"><euc:EformTextBox RecordId="3" Width="100px" TABLE="Diagnostics" FIELD="DxIndication" Runat="server" 
                ID="DxIndication_3" ReadOnly="true"/></td>--%>
            <td align="center"><euc:EformComboBox RecordId="3" Width="100px" TABLE="Diagnostics" FIELD="DxInstitution" Runat="server" 
                ID="DxInstitution_3" LookupCode="Institution,Disease,Thoracic" DropDownWidth="250px" DropDownHeight="auto"/>
                <euc:EformTextBox RecordId="3" Width="1px" style="display:none" TABLE="Diagnostics" FIELD="DxQuality" Runat="server" 
                    ID="DxQuality_3"/></td>
            <td><euc:EformDeleteIcon ID="EformDeleteIcon1" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
        </tr>
        </table>
        </td>
    </tr>
    
      <tr id="DxFindingsTR2" runat="server" style=" display:none;">
        <td colspan="4">
        <span class="controlBoxDataGridHeader">Image Findings</span> <br/>
        <table width="300" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="DxFindingsTbl2">
          <tr> 
            <td class="controlBoxDataGridHeaderFirstCol">Result</td>
            <td class="controlBoxDataGridHeaderFirstCol">SUV</td>
            <td class="controlBoxDataGridHeaderFirstCol">Site</td>
            <td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
          </tr>  
          
          <tr>
            <td align="center"><euc:EformDropDownList RecordId="6" Width="100px" TABLE="DxImageFindings" FIELD="ImgFindResult" Runat="server" 
                ID="ImgFindResult_6" LookupCode="DxResult,Disease,Thoracic" DropDownHeight="auto"/></td>
            <td align="center"><euc:EformTextBox RecordId="6" Width="100px" TABLE="DxImageFindings" FIELD="ImgFindSUV" Runat="server" 
                ID="ImgFindSUV_6" /></td>
            <td align="center"><euc:EformTextBox RecordId="6" Width="100px" TABLE="DxImageFindings" FIELD="ImgFindSite" Runat="server" 
                ID="ImgFindSite_6" ReadOnly="true"/></td>
            <td><euc:EformDeleteIcon ID="EformDeleteIcon2" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
          </tr>          
          <tr>
            <td align="center"><euc:EformDropDownList RecordId="7" Width="100px" TABLE="DxImageFindings" FIELD="ImgFindResult" Runat="server" 
                ID="ImgFindResult_7" LookupCode="DxResult,Disease,Thoracic" DropDownHeight="auto"/></td>
            <td align="center"><euc:EformTextBox RecordId="7" Width="100px" TABLE="DxImageFindings" FIELD="ImgFindSUV" Runat="server" 
                ID="ImgFindSUV_7" /></td>
            <td align="center"><euc:EformTextBox RecordId="7" Width="100px" TABLE="DxImageFindings" FIELD="ImgFindSite" Runat="server" 
                ID="ImgFindSite_7" ReadOnly="true"/></td>
            <td><euc:EformDeleteIcon ID="EformDeleteIcon3" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
          </tr> 
          <tr style="display:none;">
            <td align="center"><euc:EformDropDownList RecordId="8" Width="100px" TABLE="DxImageFindings" FIELD="ImgFindResult" Runat="server" 
                ID="ImgFindResult_8" LookupCode="DxResult,Disease,Thoracic" DropDownHeight="auto"/></td>
            <td align="center"><euc:EformTextBox RecordId="8" Width="100px" TABLE="DxImageFindings" FIELD="ImgFindSUV" Runat="server" 
                ID="ImgFindSUV_8" /></td>
            <td align="center"><euc:EformTextBox RecordId="8" Width="100px" TABLE="DxImageFindings" FIELD="ImgFindSite" Runat="server" 
                ID="ImgFindSite_8" ReadOnly="true"/></td>
            <td><euc:EformDeleteIcon ID="EformDeleteIcon4" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
          </tr> 
          <tr style="display:none;">
            <td align="center"><euc:EformDropDownList RecordId="9" Width="100px" TABLE="DxImageFindings" FIELD="ImgFindResult" Runat="server" 
                ID="ImgFindResult_9" LookupCode="DxResult,Disease,Thoracic" DropDownHeight="auto"/></td>
            <td align="center"><euc:EformTextBox RecordId="9" Width="100px" TABLE="DxImageFindings" FIELD="ImgFindSUV" Runat="server" 
                ID="ImgFindSUV_9" /></td>
            <td align="center"><euc:EformTextBox RecordId="9" Width="100px" TABLE="DxImageFindings" FIELD="ImgFindSite" Runat="server" 
                ID="ImgFindSite_9" ReadOnly="true"/></td>
            <td><euc:EformDeleteIcon ID="EformDeleteIcon5" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
          </tr>
          <tr style="display:none;">
            <td align="center"><euc:EformDropDownList RecordId="10" Width="100px" TABLE="DxImageFindings" FIELD="ImgFindResult" Runat="server" 
                ID="ImgFindResult_10" LookupCode="DxResult,Disease,Thoracic" DropDownHeight="auto"/></td>
            <td align="center"><euc:EformTextBox RecordId="10" Width="100px" TABLE="DxImageFindings" FIELD="ImgFindSUV" Runat="server" 
                ID="ImgFindSUV_10" /></td>
            <td align="center"><euc:EformTextBox RecordId="10" Width="100px" TABLE="DxImageFindings" FIELD="ImgFindSite" Runat="server" 
                ID="ImgFindSite_10" ReadOnly="true"/></td>
            <td><euc:EformDeleteIcon ID="EformDeleteIcon6" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
          </tr>
        </table>
        <img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'DxFindingsTbl2');" />
    </td>
  </tr>
</table><br /><br />

<script type="text/javascript">
    //updates PET scan details
    function addEvents1(dxDate,dxType,dxSide,dxTarget,dxQlty)
    { 
        $(dxDate).addEvent('blur',curry(AutoPopulates,dxDate,dxType,dxSide,dxTarget,dxQlty));
        $(dxSide).addEvent('blur',curry(AutoPopulates,dxDate,dxType,dxSide,dxTarget,dxQlty));
    } 
    addEvents1($('<%= DxDateText_3.ClientID %>'),$('<%= DxType_3.ClientID %>'),$('<%= DxSide_3.ClientID %>'),$('<%= DxTarget_3.ClientID %>'),$('<%= DxQuality_3.ClientID %>'));

    function AutoPopulates(dxDate,dxType,dxSide,dxTarget,dxQlty)
    {
       if (dxDate.value != '' || dxSide.value != '')
        {
           dxType.value = 'PET Scan';
           dxTarget.value = 'Chest';
           dxQlty.value = 'STD';
        }
        else
        {
            dxType.value = '';
            dxTarget.value = '';
            dxQlty.value = '';
        }
    }
    
    //shows findings child record only if any field in parent Dx record is entered
    function findingaddEvnt1(dxDate,dxSide,dxTarget,dxfindingRow)
    { 
        $(dxDate).addEvent('blur',curry(showHideDxFinding,dxDate,dxSide,dxTarget,dxfindingRow));
        $(dxSide).addEvent('blur',curry(showHideDxFinding,dxDate,dxSide,dxTarget,dxfindingRow));
        $(dxTarget).addEvent('blur',curry(showHideDxFinding,dxDate,dxSide,dxTarget,dxfindingRow));
    } 
    findingaddEvnt1($('<%= DxDateText_3.ClientID %>'),$('<%= DxSide_3.ClientID %>'),$('<%= DxTarget_3.ClientID %>'),$('<%= DxFindingsTR2.ClientID %>'));

    function showHideDxFinding(dxDate,dxSide,dxTarget,dxfindingRow)
    {
       if (dxDate.value != '' || dxSide.value != '')
        {
           dxfindingRow.style.display = 'block';
        }
        else
        {
            dxfindingRow.style.display = 'none';
        }
    }
    
    //updates DX findings details
    function updateFindings1(dxFindingResult,dxFindingSite)
    { 
        $(dxFindingResult).addEvent('blur',curry(FindingPopulates,dxFindingResult,dxFindingSite));
    } 
    updateFindings1($('<%= ImgFindResult_6.ClientID %>'),$('<%= ImgFindSite_6.ClientID %>'));
    updateFindings1($('<%= ImgFindResult_7.ClientID %>'),$('<%= ImgFindSite_7.ClientID %>'));
    updateFindings1($('<%= ImgFindResult_8.ClientID %>'),$('<%= ImgFindSite_8.ClientID %>'));
    updateFindings1($('<%= ImgFindResult_9.ClientID %>'),$('<%= ImgFindSite_9.ClientID %>'));
    updateFindings1($('<%= ImgFindResult_10.ClientID %>'),$('<%= ImgFindSite_10.ClientID %>'));

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