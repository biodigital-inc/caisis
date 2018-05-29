<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Prostate.Eforms.BiopsyOfProstateHypoechoic" CodeFile="BiopsyOfProstateHypoechoic.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<script language="javascript">
	tableArray.ImgFindProstateHtmlTable = "ImgFindProstateHtmlTable";
</script>
<script>
function ImgFindProstate_showFirstAdditionalRow(linkReference, tableId) {
		var rowShown = false;
		var hideWidget = true;
		var table = document.getElementById(tableId);
		for (i = 0; i < table.rows.length; i++) {
			var row = table.rows[i];
			
			// skip rows with an id containing "_tr_"
			var rowId = row.id;
			if (rowId != null && rowId.indexOf('_tr_') != -1)
				continue;
				
			if (rowShown == false && row.style['display'] == 'none') {
				row.style['display'] = '';
				rowShown = true;
			} else if (rowShown == true && row.style['display'] == 'none') {
				hideWidget = false;
			}
		}
		
		if (hideWidget) {
			linkReference.style['display'] = 'none';
		}
		return false;
	}
</script>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css">
	
<a name="Hypoechoic" /><span class="controlBoxTitle">&nbsp;Suspicious Nodules</span><br>
<table border="0" cellspacing="0" cellpadding="0" class="ClinicalEformTable" id="ImgFindProstateHtmlTable" style="width: auto;">
      <tr>
        <td class="controlBoxDataGridHeaderFirstCol" style="font-size: 10px;">Side</td>
        <td class="controlBoxDataGridHeaderFirstCol" style="font-size: 10px;">Area</td>
        <td class="controlBoxDataGridHeaderFirstCol" style="font-size: 10px;">Laterality</td>
        <td class="controlBoxDataGridHeaderFirstCol" style="font-size: 10px;">AP</td>
        <td class="controlBoxDataGridHeaderFirstCol" style="font-size: 10px;">Zone</td>
        <td class="controlBoxDataGridHeaderFirstCol" style="font-size: 10px;">ECE</td>
        <td class="controlBoxDataGridHeaderFirstCol" width="15%" style="font-size: 10px;">Directed or systematic Bx</td>
        <td class="controlBoxDataGridHeaderFirstCol" height="12%">&nbsp;</td>
      </tr>
            
      <tr > 
        <td align="center" ><euc:EformSelect LookupCode="ProstateSide" style="width:40px" TABLE="DxImageFindingsProstate"  FIELD="ImgFindSide" DropDownWidth="200" DropDownHeight="auto" Runat="server" ID="ImgFindSide_1" RecordId="1" /></td>
        <td align="center" ><euc:EformSelect style="width:40px" TABLE="DxImageFindingsProstate"  DropDownWidth="200" FIELD="ImgFindLevel" DropDownHeight="auto" Runat="server" ID="ImgFindLevel_1" RecordId="1" LookupCode="ProstateLevel,BiopsyDiagnostic,True"   /></td>
        <td align="center" ><euc:EformSelect style="width:70px" TABLE="DxImageFindingsProstate"  DropDownWidth="100" FIELD="ImgFindLaterality" DropDownHeight="auto" Runat="server" ID="ImgFindLaterality_1" RecordId="1" LookupCode="Laterality"   /></td>
        <td align="center" ><euc:EformSelect style="width:70px" TABLE="DxImageFindingsProstate"  DropDownWidth="100" FIELD="ImgFindAP" DropDownHeight="auto" Runat="server" ID="ImgFindAP_1" RecordId="1" LookupCode="AP"   /></td>
        <td align="center" ><euc:EformSelect style="width:60px" RecordId="1" LookupCode="ProstateZone" DropDownHeight="auto"  TABLE="DxImageFindingsProstate"  DropDownWidth="100" FIELD="ImgFindZone" Runat="server" ID="ImgFindZone_1" /></td>
        <td align="center" ><euc:EformSelect style="width:40px" RecordId="1" LookupCode="Probability"  TABLE="DxImageFindingsProstate"  DropDownWidth="100" FIELD="ImgFindExtension"  DropDownHeight="auto" Runat="server" ID="ImgFindExtension_1" /></td>
        <td align="center" ><euc:EformSelect style="width:70px" RecordId="1" LookupCode="BxCoreType" DropDownHeight="auto"  TABLE="DxImageFindingsProstate" FIELD="ImgNotes" Runat="server" ID="ImgNotes_1" /></td>
        <td><euc:EformDeleteIcon runat="server"/></td>
      </tr>
      
       <tr > 
        <td align="center" ><euc:EformSelect LookupCode="ProstateSide" style="width:40px" TABLE="DxImageFindingsProstate"  FIELD="ImgFindSide" DropDownWidth="200" DropDownHeight="auto" Runat="server" ID="ImgFindSide_2" RecordId="2" /></td>
        <td align="center" ><euc:EformSelect style="width:40px" TABLE="DxImageFindingsProstate"  DropDownWidth="200" FIELD="ImgFindLevel" DropDownHeight="auto" Runat="server" ID="ImgFindLevel_2" RecordId="2" LookupCode="ProstateLevel,BiopsyDiagnostic,True"   /></td>
        <td align="center" ><euc:EformSelect style="width:70px" TABLE="DxImageFindingsProstate"  DropDownWidth="100" FIELD="ImgFindLaterality" DropDownHeight="auto" Runat="server" ID="ImgFindLaterality_2" RecordId="2" LookupCode="Laterality"   /></td>
        <td align="center" ><euc:EformSelect style="width:70px" TABLE="DxImageFindingsProstate"  DropDownWidth="100" FIELD="ImgFindAP" DropDownHeight="auto" Runat="server" ID="ImgFindAP_2" RecordId="2" LookupCode="AP"   /></td>
        <td align="center" ><euc:EformSelect style="width:60px" RecordId="2" LookupCode="ProstateZone" DropDownHeight="auto"  TABLE="DxImageFindingsProstate"  DropDownWidth="100" FIELD="ImgFindZone" Runat="server" ID="ImgFindZone_2" /></td>
        <td align="center" ><euc:EformSelect style="width:40px" RecordId="2" LookupCode="Probability"  TABLE="DxImageFindingsProstate"  DropDownWidth="100" FIELD="ImgFindExtension"  DropDownHeight="auto" Runat="server" ID="ImgFindExtension_2" /></td>
        <td align="center" ><euc:EformSelect style="width:70px" RecordId="2" LookupCode="BxCoreType" DropDownHeight="auto"  TABLE="DxImageFindingsProstate" FIELD="ImgNotes" Runat="server" ID="ImgNotes_2" /></td>
        <td><euc:EformDeleteIcon runat="server"/></td>
      </tr>
      
      <tr > 
        <td align="center" ><euc:EformSelect LookupCode="ProstateSide" style="width:40px" TABLE="DxImageFindingsProstate"  FIELD="ImgFindSide" DropDownWidth="200" DropDownHeight="auto" Runat="server" ID="ImgFindSide_3" RecordId="3" /></td>
        <td align="center" ><euc:EformSelect style="width:40px" TABLE="DxImageFindingsProstate"  DropDownWidth="200" FIELD="ImgFindLevel" DropDownHeight="auto" Runat="server" ID="ImgFindLevel_3" RecordId="3" LookupCode="ProstateLevel,BiopsyDiagnostic,True"   /></td>
        <td align="center" ><euc:EformSelect style="width:70px" TABLE="DxImageFindingsProstate"  DropDownWidth="100" FIELD="ImgFindLaterality" DropDownHeight="auto" Runat="server" ID="ImgFindLaterality_3" RecordId="3" LookupCode="Laterality"   /></td>
        <td align="center" ><euc:EformSelect style="width:70px" TABLE="DxImageFindingsProstate"  DropDownWidth="100" FIELD="ImgFindAP" DropDownHeight="auto" Runat="server" ID="ImgFindAP_3" RecordId="3" LookupCode="AP"   /></td>
        <td align="center" ><euc:EformSelect style="width:60px" RecordId="3" LookupCode="ProstateZone" DropDownHeight="auto"  TABLE="DxImageFindingsProstate"  DropDownWidth="100" FIELD="ImgFindZone" Runat="server" ID="ImgFindZone_3" /></td>
        <td align="center" ><euc:EformSelect style="width:40px" RecordId="3" LookupCode="Probability"  TABLE="DxImageFindingsProstate"  DropDownWidth="100" FIELD="ImgFindExtension"  DropDownHeight="auto" Runat="server" ID="ImgFindExtension_3" /></td>
        <td align="center" ><euc:EformSelect style="width:70px" RecordId="3" LookupCode="BxCoreType" DropDownHeight="auto"  TABLE="DxImageFindingsProstate" FIELD="ImgNotes" Runat="server" ID="ImgNotes_3" /></td>
        <td><euc:EformDeleteIcon runat="server"/></td>
      </tr>
      
       <tr style="DISPLAY: none"> 
        <td align="center" ><euc:EformSelect LookupCode="ProstateSide" style="width:40px" TABLE="DxImageFindingsProstate"  FIELD="ImgFindSide" DropDownWidth="200" DropDownHeight="auto" Runat="server" ID="ImgFindSide_4" RecordId="4" /></td>
        <td align="center" ><euc:EformSelect style="width:40px" TABLE="DxImageFindingsProstate"  DropDownWidth="200" FIELD="ImgFindLevel" DropDownHeight="auto" Runat="server" ID="ImgFindLevel_4" RecordId="4" LookupCode="ProstateLevel,BiopsyDiagnostic,True"   /></td>
        <td align="center" ><euc:EformSelect style="width:70px" TABLE="DxImageFindingsProstate"  DropDownWidth="100" FIELD="ImgFindLaterality" DropDownHeight="auto" Runat="server" ID="ImgFindLaterality_4" RecordId="4" LookupCode="Laterality"   /></td>
        <td align="center" ><euc:EformSelect style="width:70px" TABLE="DxImageFindingsProstate"  DropDownWidth="100" FIELD="ImgFindAP" DropDownHeight="auto" Runat="server" ID="ImgFindAP_4" RecordId="4" LookupCode="AP"   /></td>
        <td align="center" ><euc:EformSelect style="width:60px" RecordId="4" LookupCode="ProstateZone" DropDownHeight="auto" TABLE="DxImageFindingsProstate"  DropDownWidth="100" FIELD="ImgFindZone" Runat="server" ID="ImgFindZone_4" /></td>
        <td align="center" ><euc:EformSelect style="width:40px" RecordId="4" LookupCode="Probability"  TABLE="DxImageFindingsProstate"  DropDownWidth="100" FIELD="ImgFindExtension"  DropDownHeight="auto" Runat="server" ID="ImgFindExtension_4" /></td>
        <td align="center" ><euc:EformSelect style="width:70px" RecordId="4" LookupCode="BxCoreType" DropDownHeight="auto"  TABLE="DxImageFindingsProstate" FIELD="ImgNotes" Runat="server" ID="ImgNotes_4" /></td>
        <td><euc:EformDeleteIcon runat="server"/></td>
      </tr>
      
       <tr style="DISPLAY: none"> 
        <td align="center" ><euc:EformSelect LookupCode="ProstateSide" style="width:40px" TABLE="DxImageFindingsProstate"  FIELD="ImgFindSide" DropDownWidth="200" DropDownHeight="auto" Runat="server" ID="ImgFindSide_5" RecordId="5" /></td>
        <td align="center" ><euc:EformSelect style="width:40px" TABLE="DxImageFindingsProstate"  DropDownWidth="200" FIELD="ImgFindLevel" DropDownHeight="auto" Runat="server" ID="ImgFindLevel_5" RecordId="5" LookupCode="ProstateLevel,BiopsyDiagnostic,True"   /></td>
        <td align="center" ><euc:EformSelect style="width:70px" TABLE="DxImageFindingsProstate"  DropDownWidth="100" FIELD="ImgFindLaterality" DropDownHeight="auto" Runat="server" ID="ImgFindLaterality_5" RecordId="5" LookupCode="Laterality"   /></td>
        <td align="center" ><euc:EformSelect style="width:70px" TABLE="DxImageFindingsProstate"  DropDownWidth="100" FIELD="ImgFindAP" DropDownHeight="auto" Runat="server" ID="ImgFindAP_5" RecordId="5" LookupCode="AP"   /></td>
        <td align="center" ><euc:EformSelect style="width:60px" RecordId="5" LookupCode="ProstateZone" DropDownHeight="auto"  TABLE="DxImageFindingsProstate"  DropDownWidth="100" FIELD="ImgFindZone" Runat="server" ID="ImgFindZone_5" /></td>
        <td align="center" ><euc:EformSelect style="width:40px" RecordId="5" LookupCode="Probability"  TABLE="DxImageFindingsProstate"  DropDownWidth="100" FIELD="ImgFindExtension"  DropDownHeight="auto" Runat="server" ID="ImgFindExtension_5" /></td>
        <td align="center" ><euc:EformSelect style="width:70px" RecordId="5" LookupCode="BxCoreType" DropDownHeight="auto"  TABLE="DxImageFindingsProstate" FIELD="ImgNotes" Runat="server" ID="ImgNotes_5" /></td>
        <td><euc:EformDeleteIcon runat="server"/></td>
      </tr>
</table> 
<img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return ImgFindProstate_showFirstAdditionalRow(this,'ImgFindProstateHtmlTable');" />

<br /><br />