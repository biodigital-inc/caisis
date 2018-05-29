<%@ Control Language="C#" Inherits="Caisis.UI.Modules.Thoracic.Eforms.DxThoracic" CodeFile="DxThoracic.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<script language="javascript" type="text/javascript">
    tableArray.DxImgFindingsTbl = "DxImgFindingsTbl";
    tableArray.DxImgFindingsTbl2 = "DxImgFindingsTbl2";
</script>

<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>

<a name="DxThoracic" /><span class="controlBoxTitle">Diagnostics</span> <br/>

<table width="500" cellpadding="5" cellspacing="0" class="eformLargePopulatedTable" id="DxTbl">
    <tr><td height="10"></td></tr>
    <tr>
        <td>
        <span class="controlBoxTitle">CT Scan</span> <br/>
        <table width="450" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="DxCTScanTable">
          <tr>
		    <td  class="controlBoxDataGridTitleColumn">Date</td>
		    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Side</td>
		    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Target</td>
		    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Indication</td>
		    <td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
          </tr>
      
          <tr>
             <td><euc:EformTextBox RecordId="6" ShowCalendar="True" CalcDate="True" Width="100px" TABLE="Diagnostics" FIELD="DxDateText" 
	            Runat="server" ID="DxDateText_6"/>
		            <euc:EformHidden RecordId="6" TABLE="Diagnostics" FIELD="DxDate" Runat="server" ID="DxDate_6"/>
		            <euc:EformTextBox RecordId="6" TABLE="Diagnostics" FIELD="DxType" Runat="server" ID="DxType_6" 
		                style="display:none;width:1px;" /></td>
            <td align="center"><euc:EformComboBox RecordId="6" Width="100px" TABLE="Diagnostics" FIELD="DxSide" Runat="server" 
                ID="DxSide_6" LookupCode="FindSide,Disease,Thoracic" DropDownHeight="auto"/></td>
            <td align="center"><euc:EformTextBox RecordId="6" Width="100px" TABLE="Diagnostics" FIELD="DxTarget" Runat="server" 
                ID="DxTarget_6" ReadOnly="true"/>
                <euc:EformTextBox RecordId="6" Width="1px" style="display:none" TABLE="Diagnostics" FIELD="DxQuality" Runat="server" 
                    ID="DxQuality_6"/>
                    <euc:EformTextBox RecordId="6" Width="1px" style="display:none" TABLE="Diagnostics" FIELD="DxDisease" Runat="server" 
                    ID="DxDisease_6"/></td>
            <td align="center"><euc:EformTextBox RecordId="6" Width="100px" TABLE="Diagnostics" FIELD="DxIndication" Runat="server" 
                ID="DxIndication_6" ReadOnly="true"/></td>
            <td><euc:EformDeleteIcon ID="EformDeleteIcon1" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
        </tr>
        </table>
        </td>
    </tr>
    
      <tr id="DxImgFindingsTR" runat="server" style=" display:none;">
        <td colspan="4">
        <span class="controlBoxDataGridHeader">Image Findings</span> <br/>
        <table width="300" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="DxImgFindingsTbl">
          <tr> 
            <td class="controlBoxDataGridHeaderFirstCol">Result</td>
            <td class="controlBoxDataGridHeaderFirstCol">Status</td>
            <%--<td class="controlBoxDataGridHeaderFirstCol">SUV</td>--%>
            <td class="controlBoxDataGridHeaderFirstCol">Site</td>
            <td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
          </tr>  
          
          <tr>
            <td align="center"><euc:EformDropDownList RecordId="11" Width="100px" TABLE="DxImageFindings" FIELD="ImgFindResult" 
                Runat="server" ID="ImgFindResult_11" LookupCode="DxResult,Disease,Thoracic" DropDownHeight="auto"/></td>
            <td align="center"><euc:EformDropDownList RecordId="11" Width="100px" TABLE="DxImageFindings" FIELD="ImgFindStatus" 
                Runat="server" ID="ImgFindStatus_11" LookupCode="ImgFindStatus" DropDownHeight="auto"/></td>
            <%--<td align="center"><euc:EformTextBox RecordId="11" Width="100px" TABLE="DxImageFindings" FIELD="ImgFindSUV" Runat="server" 
                ID="ImgFindSUV_11" /></td>--%>
            <td align="center"><euc:EformTextBox RecordId="11" TABLE="DxImageFindings" FIELD="ImgFindSite" Runat="server" 
                ID="ImgFindSite_11" width="70px" ReadOnly="true"/></td>
            <td><euc:EformDeleteIcon ID="EformDeleteIcon2" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
        </tr>
        
        <tr>
            <td align="center"><euc:EformDropDownList RecordId="12" Width="100px" TABLE="DxImageFindings" FIELD="ImgFindResult" Runat="server" 
                ID="ImgFindResult_12" LookupCode="DxResult,Disease,Thoracic" DropDownHeight="auto"/></td>
            <td align="center"><euc:EformDropDownList RecordId="12" Width="100px" TABLE="DxImageFindings" FIELD="ImgFindStatus" Runat="server" 
                ID="ImgFindStatus_12" LookupCode="ImgFindStatus" DropDownHeight="auto"/></td>
            <%--<td align="center"><euc:EformTextBox RecordId="12" Width="100px" TABLE="DxImageFindings" FIELD="ImgFindSUV" Runat="server" 
                ID="ImgFindSUV_12" /></td>--%>
            <td align="center"><euc:EformTextBox RecordId="12" TABLE="DxImageFindings" FIELD="ImgFindSite" Runat="server" 
                ID="ImgFindSite_12" width="70px" ReadOnly="true"/></td>
            <td><euc:EformDeleteIcon ID="EformDeleteIcon3" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
        </tr>
        
        <tr style="display:none">
            <td align="center"><euc:EformDropDownList RecordId="13" Width="100px" TABLE="DxImageFindings" FIELD="ImgFindResult" Runat="server" 
                ID="ImgFindResult_13" LookupCode="DxResult,Disease,Thoracic" DropDownHeight="auto"/></td>
            <td align="center"><euc:EformDropDownList RecordId="13" Width="100px" TABLE="DxImageFindings" FIELD="ImgFindStatus" Runat="server" 
                ID="ImgFindStatus_13" LookupCode="ImgFindStatus" DropDownHeight="auto"/></td>
            <%--<td align="center"><euc:EformTextBox RecordId="13" Width="100px" TABLE="DxImageFindings" FIELD="ImgFindSUV" Runat="server" 
                ID="ImgFindSUV_13" /></td>--%>
            <td align="center"><euc:EformTextBox RecordId="13" TABLE="DxImageFindings" FIELD="ImgFindSite" Runat="server" 
                ID="ImgFindSite_13" width="70px" ReadOnly="true"/></td>
            <td><euc:EformDeleteIcon ID="EformDeleteIcon4" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
        </tr>
        
        <tr style="display:none">
            <td align="center"><euc:EformDropDownList RecordId="14" Width="100px" TABLE="DxImageFindings" FIELD="ImgFindResult" Runat="server" 
                ID="ImgFindResult_14" LookupCode="DxResult,Disease,Thoracic" DropDownHeight="auto"/></td>
            <td align="center"><euc:EformDropDownList RecordId="14" Width="100px" TABLE="DxImageFindings" FIELD="ImgFindStatus" Runat="server" 
                ID="ImgFindStatus_14" LookupCode="ImgFindStatus" DropDownHeight="auto"/></td>
            <%--<td align="center"><euc:EformTextBox RecordId="14" Width="100px" TABLE="DxImageFindings" FIELD="ImgFindSUV" Runat="server" 
                ID="ImgFindSUV_14" /></td>--%>
            <td align="center"><euc:EformTextBox RecordId="14" TABLE="DxImageFindings" FIELD="ImgFindSite" Runat="server" 
                ID="ImgFindSite_14" width="70px" ReadOnly="true"/></td>
            <td><euc:EformDeleteIcon ID="EformDeleteIcon5" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
        </tr>
        
        <tr style="display:none">
            <td align="center"><euc:EformDropDownList RecordId="15" Width="100px" TABLE="DxImageFindings" FIELD="ImgFindResult" Runat="server" 
                ID="ImgFindResult_15" LookupCode="DxResult,Disease,Thoracic" DropDownHeight="auto"/></td>
            <td align="center"><euc:EformDropDownList RecordId="15" Width="100px" TABLE="DxImageFindings" FIELD="ImgFindStatus" Runat="server" 
                ID="ImgFindStatus_15" LookupCode="ImgFindStatus" DropDownHeight="auto"/></td>
            <%--<td align="center"><euc:EformTextBox RecordId="15" Width="100px" TABLE="DxImageFindings" FIELD="ImgFindSUV" Runat="server" 
                ID="ImgFindSUV_15" /></td>--%>
            <td align="center"><euc:EformTextBox RecordId="15" TABLE="DxImageFindings" FIELD="ImgFindSite" Runat="server" 
                ID="ImgFindSite_15" width="70px" ReadOnly="true"/></td>
            <td><euc:EformDeleteIcon ID="EformDeleteIcon6" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
        </tr>
      </table>
      <img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'DxImgFindingsTbl');" /><br /><br />
        </td>
    </tr>
      
    <tr>
        <td>  
          <span class="controlBoxTitle">PET Scan</span> <br/>
          <table width="450" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="DxPETScanTable">
          <tr>
		    <td  class="controlBoxDataGridTitleColumn">Date</td>
		    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Side</td>
		    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Target</td>
		    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Indication</td>
		    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Institution</td>
		    <td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
          </tr>
      
          <tr>
             <td><euc:EformTextBox RecordId="13" ShowCalendar="True" CalcDate="True" Width="100px" TABLE="Diagnostics" FIELD="DxDateText" 
	            Runat="server" ID="DxDateText_13"/>
		            <euc:EformHidden RecordId="13" TABLE="Diagnostics" FIELD="DxDate" Runat="server" ID="DxDate_13"/></td>
            <td align="center"><euc:EformTextBox RecordId="13" style="display:none;width:1px;" TABLE="Diagnostics" FIELD="DxType" 
                Runat="server" ID="DxType_13"/>
                <euc:EformComboBox RecordId="13" Width="100px" TABLE="Diagnostics" FIELD="DxSide" Runat="server" ID="DxSide_13" 
                LookupCode="FindSide,Disease,Thoracic" DropDownHeight="auto"/></td>
            <td align="center"><euc:EformTextBox RecordId="13" Width="100px" TABLE="Diagnostics" FIELD="DxTarget" Runat="server" 
                ID="DxTarget_13" ReadOnly="true"/></td>
            <td align="center"><euc:EformTextBox RecordId="13" Width="100px" TABLE="Diagnostics" FIELD="DxIndication" Runat="server" 
                ID="DxIndication_13" ReadOnly="true"/></td>
            <td align="center"><euc:EformComboBox RecordId="13" Width="100px" TABLE="Diagnostics" FIELD="DxInstitution" Runat="server" 
                ID="DxInstitution_13" LookupCode="Institution,Disease,Thoracic" DropDownWidth="250px" DropDownHeight="auto"/>
                <euc:EformTextBox RecordId="13" Width="1px" style="display:none" TABLE="Diagnostics" FIELD="DxQuality" Runat="server" 
                    ID="DxQuality_13"/>
                <euc:EformTextBox RecordId="13" Width="1px" style="display:none" TABLE="Diagnostics" FIELD="DxDisease" Runat="server" 
                    ID="DxDisease_13"/></td>
            <td><euc:EformDeleteIcon ID="EformDeleteIcon7" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
        </tr>
        </table>
        </td>
    </tr>
    
    <tr id="DxImgFindingsTR2" runat="server" style=" display:none;">
        <td colspan="4">
        <span class="controlBoxDataGridHeader">Image Findings</span> <br/>
        <table width="300" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="DxImgFindingsTbl2">
          <tr> 
            <td class="controlBoxDataGridHeaderFirstCol">Result</td>
            <td class="controlBoxDataGridHeaderFirstCol">Status</td>
            <td class="controlBoxDataGridHeaderFirstCol">SUV</td>
            <td class="controlBoxDataGridHeaderFirstCol">Site</td>
            <td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
          </tr>  
          
          <tr>
            <td align="center"><euc:EformDropDownList RecordId="16" Width="100px" TABLE="DxImageFindings" FIELD="ImgFindResult" Runat="server" 
                ID="ImgFindResult_16" LookupCode="DxResult,Disease,Thoracic" DropDownHeight="auto"/></td>
            <td align="center"><euc:EformDropDownList RecordId="16" Width="100px" TABLE="DxImageFindings" FIELD="ImgFindStatus" 
                Runat="server" ID="ImgFindStatus_16" LookupCode="ImgFindStatus" DropDownHeight="auto"/></td>
            <td align="center"><euc:EformTextBox RecordId="16" Width="100px" TABLE="DxImageFindings" FIELD="ImgFindSUV" Runat="server" 
                ID="ImgFindSUV_16" /></td>
            <td align="center"><euc:EformTextBox RecordId="16" Width="100px" TABLE="DxImageFindings" FIELD="ImgFindSite" Runat="server" 
                ID="ImgFindSite_16" ReadOnly="true"/></td>
            <td><euc:EformDeleteIcon ID="EformDeleteIcon8" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
          </tr>          
          <tr>
            <td align="center"><euc:EformDropDownList RecordId="17" Width="100px" TABLE="DxImageFindings" FIELD="ImgFindResult" 
                Runat="server" ID="ImgFindResult_17" LookupCode="DxResult,Disease,Thoracic" DropDownHeight="auto"/></td>
            <td align="center"><euc:EformDropDownList RecordId="17" Width="100px" TABLE="DxImageFindings" FIELD="ImgFindStatus" 
                Runat="server" ID="ImgFindStatus_17" LookupCode="ImgFindStatus" DropDownHeight="auto"/></td>
            <td align="center"><euc:EformTextBox RecordId="17" Width="100px" TABLE="DxImageFindings" FIELD="ImgFindSUV" Runat="server" 
                ID="ImgFindSUV_17" /></td>
            <td align="center"><euc:EformTextBox RecordId="17" Width="100px" TABLE="DxImageFindings" FIELD="ImgFindSite" Runat="server" 
                ID="ImgFindSite_17" ReadOnly="true"/></td>
            <td><euc:EformDeleteIcon ID="EformDeleteIcon9" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
          </tr> 
          <tr style="display:none;">
            <td align="center"><euc:EformDropDownList RecordId="18" Width="100px" TABLE="DxImageFindings" FIELD="ImgFindResult" 
                Runat="server" ID="ImgFindResult_18" LookupCode="DxResult,Disease,Thoracic" DropDownHeight="auto"/></td>
            <td align="center"><euc:EformDropDownList RecordId="18" Width="100px" TABLE="DxImageFindings" FIELD="ImgFindStatus" 
                Runat="server" ID="ImgFindStatus_18" LookupCode="ImgFindStatus" DropDownHeight="auto"/></td>    
            <td align="center"><euc:EformTextBox RecordId="18" Width="100px" TABLE="DxImageFindings" FIELD="ImgFindSUV" Runat="server" 
                ID="ImgFindSUV_18" /></td>
            <td align="center"><euc:EformTextBox RecordId="18" Width="100px" TABLE="DxImageFindings" FIELD="ImgFindSite" Runat="server" 
                ID="ImgFindSite_18" ReadOnly="true"/></td>
            <td><euc:EformDeleteIcon ID="EformDeleteIcon10" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
          </tr> 
          <tr style="display:none;">
            <td align="center"><euc:EformDropDownList RecordId="19" Width="100px" TABLE="DxImageFindings" FIELD="ImgFindResult" 
                Runat="server" ID="ImgFindResult_19" LookupCode="DxResult,Disease,Thoracic" DropDownHeight="auto"/></td>
            <td align="center"><euc:EformDropDownList RecordId="19" Width="100px" TABLE="DxImageFindings" FIELD="ImgFindStatus" 
                Runat="server" ID="ImgFindStatus_19" LookupCode="ImgFindStatus" DropDownHeight="auto"/></td>
            <td align="center"><euc:EformTextBox RecordId="19" Width="100px" TABLE="DxImageFindings" FIELD="ImgFindSUV" Runat="server" 
                ID="ImgFindSUV_19" /></td>
            <td align="center"><euc:EformTextBox RecordId="19" Width="100px" TABLE="DxImageFindings" FIELD="ImgFindSite" Runat="server" 
                ID="ImgFindSite_19" ReadOnly="true"/></td>
            <td><euc:EformDeleteIcon ID="EformDeleteIcon11" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
          </tr>
          <tr style="display:none;">
            <td align="center"><euc:EformDropDownList RecordId="20" Width="100px" TABLE="DxImageFindings" FIELD="ImgFindResult" 
                Runat="server" ID="ImgFindResult_20" LookupCode="DxResult,Disease,Thoracic" DropDownHeight="auto"/></td>
            <td align="center"><euc:EformDropDownList RecordId="20" Width="100px" TABLE="DxImageFindings" FIELD="ImgFindStatus" 
                Runat="server" ID="ImgFindStatus_20" LookupCode="ImgFindStatus" DropDownHeight="auto"/></td>
            <td align="center"><euc:EformTextBox RecordId="20" Width="100px" TABLE="DxImageFindings" FIELD="ImgFindSUV" Runat="server" 
                ID="ImgFindSUV_20" /></td>
            <td align="center"><euc:EformTextBox RecordId="20" Width="100px" TABLE="DxImageFindings" FIELD="ImgFindSite" Runat="server" 
                ID="ImgFindSite_20" ReadOnly="true"/></td>
            <td><euc:EformDeleteIcon ID="EformDeleteIcon12" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
          </tr>
        </table>
        <img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'DxImgFindingsTbl2');" />
    </td>
  </tr>
</table><br /><br />


<script type="text/javascript">
    //updates Dx CT Scan details
    function addEvents(dxResult,dxStatus,dxSite)
    { 
        $(dxResult).addEvent('blur',curry(AutoPopulates,dxResult,dxStatus,dxSite));
        $(dxStatus).addEvent('blur',curry(AutoPopulates,dxResult,dxStatus,dxSite));
    } 
    
    addEvents($('<%= ImgFindResult_11.ClientID %>'),$('<%= ImgFindStatus_11.ClientID %>'),$('<%= ImgFindSite_11.ClientID %>'));
    addEvents($('<%= ImgFindResult_12.ClientID %>'),$('<%= ImgFindStatus_12.ClientID %>'),$('<%= ImgFindSite_12.ClientID %>'));
    addEvents($('<%= ImgFindResult_13.ClientID %>'),$('<%= ImgFindStatus_13.ClientID %>'),$('<%= ImgFindSite_13.ClientID %>'));
    addEvents($('<%= ImgFindResult_14.ClientID %>'),$('<%= ImgFindStatus_14.ClientID %>'),$('<%= ImgFindSite_14.ClientID %>'));
    addEvents($('<%= ImgFindResult_15.ClientID %>'),$('<%= ImgFindStatus_15.ClientID %>'),$('<%= ImgFindSite_15.ClientID %>'));

    function AutoPopulates(dxResult,dxStatus,dxSite)
    {
       if (dxResult.value != '' || dxStatus.value != '')
        {
           dxSite.value = 'Lung';
        }
        else
        {
            dxSite.value = '';
        }
    }   
    
    //updates CT scan details
    //shows findings child record only if any field in parent Dx record is entered
    function findingaddEvnt(dxDate,dxSide,dxTarget,dxType,dxIndc,dxQlty,dxDisease,dxfindingRow)
    { 
        $(dxDate).addEvent('blur',curry(showHideDxFinding,dxDate,dxSide,dxTarget,dxType,dxIndc,dxQlty,dxDisease,dxfindingRow));
        $(dxSide).addEvent('blur',curry(showHideDxFinding,dxDate,dxSide,dxTarget,dxType,dxIndc,dxQlty,dxDisease,dxfindingRow));
    } 
    findingaddEvnt($('<%= DxDateText_6.ClientID %>'),$('<%= DxSide_6.ClientID %>'),$('<%= DxTarget_6.ClientID %>'),$('<%= DxType_6.ClientID %>'),$('<%= DxIndication_6.ClientID %>'),$('<%= DxQuality_6.ClientID %>'),$('<%= DxDisease_6.ClientID %>'),$('<%= DxImgFindingsTR.ClientID %>'));

    function showHideDxFinding(dxDate,dxSide,dxTarget,dxType,dxIndc,dxQlty,dxDisease,dxfindingRow)
    {
       if (dxDate.value != '' || dxSide.value != '')
        {
           dxType.value = 'CT Scan';
           dxTarget.value = 'Chest';
           dxIndc.value = 'Induction';
           dxQlty.value = 'STD';
           dxDisease.value = 'Lung Cancer';
           dxfindingRow.style.display = 'block';
        }
        else
        {
            dxType.value = '';
            dxTarget.value = '';
            dxIndc.value = '';
            dxQlty.value = '';
            dxDisease.value = '';
            dxfindingRow.style.display = 'none';
        }
    }
    
    
    //updates PET scan details
    //shows findings child record only if any field in parent Dx record is entered
    function DxPETEvents(dxDate,dxType,dxSide,dxTarget,dxQlty,dxDisease,dxIndc,dxfindingRow)
    { 
        $(dxDate).addEvent('blur',curry(DxPetPopulates,dxDate,dxType,dxSide,dxTarget,dxQlty,dxDisease,dxIndc,dxfindingRow));
        $(dxSide).addEvent('blur',curry(DxPetPopulates,dxDate,dxType,dxSide,dxTarget,dxQlty,dxDisease,dxIndc,dxfindingRow));
    } 
    DxPETEvents($('<%= DxDateText_13.ClientID %>'),$('<%= DxType_13.ClientID %>'),$('<%= DxSide_13.ClientID %>'),$('<%= DxTarget_13.ClientID %>'),$('<%= DxQuality_13.ClientID %>'),$('<%= DxDisease_13.ClientID %>'),$('<%= DxIndication_13.ClientID %>'),$('<%= DxImgFindingsTR2.ClientID %>'));

    function DxPetPopulates(dxDate,dxType,dxSide,dxTarget,dxQlty,dxDisease,dxIndc,dxfindingRow)
    {
       if (dxDate.value != '' || dxSide.value != '')
        {
           dxType.value = 'PET Scan';
           dxTarget.value = 'Chest';
           dxQlty.value = 'STD';
           dxDisease.value = 'Lung Cancer';
           dxIndc.value = 'Induction';
           dxfindingRow.style.display = 'block';
        }
        else
        {
            dxType.value = '';
            dxTarget.value = '';
            dxQlty.value = '';
            dxDisease.value = '';
            dxIndc.value = '';
            dxfindingRow.style.display = 'none';
        }
    }
        
    //updates DX PET findings details
    function DxPETfindings(dxFindingResult,dxFindingSite)
    { 
        $(dxFindingResult).addEvent('blur',curry(DxPetFindingPopulates,dxFindingResult,dxFindingSite));
    } 
    DxPETfindings($('<%= ImgFindResult_16.ClientID %>'),$('<%= ImgFindSite_16.ClientID %>'));
    DxPETfindings($('<%= ImgFindResult_17.ClientID %>'),$('<%= ImgFindSite_17.ClientID %>'));
    DxPETfindings($('<%= ImgFindResult_18.ClientID %>'),$('<%= ImgFindSite_18.ClientID %>'));
    DxPETfindings($('<%= ImgFindResult_19.ClientID %>'),$('<%= ImgFindSite_19.ClientID %>'));
    DxPETfindings($('<%= ImgFindResult_20.ClientID %>'),$('<%= ImgFindSite_20.ClientID %>'));

    function DxPetFindingPopulates(dxFindingResult,dxFindingSite)
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