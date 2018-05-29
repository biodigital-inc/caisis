<%@ Control Language="c#" Inherits="Caisis.UI.Modules.HeadNeck.Eforms.I131UptakeScan" CodeFile="I131UptakeScan.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="../../../ClientScripts/utilities.js"></script>
<script type="text/javascript" src="../../../ClientScripts/EFormScripts.js"></script>

<script type="text/javascript">    
    tableArray.ImgFindingsTable = "ImgFindingsTable";
    tableArray.Other_ImgFindingsTable = "Other_ImgFindingsTable";

    function DiagResultCheck(chkbox, chkValue, DxDtTxtId, DxDateId, tb_id, Dxtype_id, Dxtarget_id, Dxside_id, DxQlty_id, DxIndicationId, DxResult_id)
    {
	    if (chkbox.checked == true)
	    {
		    document.getElementById(tb_id).value = chkValue;
		    document.getElementById(DxDtTxtId).value = $('<%=DiagDateText.ClientID %>').value;;
		    document.getElementById(DxDateId).value = $('<%=DiagDateText.ClientID %>').value;;
		    document.getElementById(Dxtype_id).value = 'RAI Scan';
		    document.getElementById(Dxtarget_id).value = 'Whole Body';
		    document.getElementById(Dxside_id).value = 'Bilateral';
		    document.getElementById(DxQlty_id).value='STD';
		    document.getElementById(DxIndicationId).value='Post Surgical Scan';
            document.getElementById(DxResult_id).value ='Uptake';
		    document.getElementById('<%= ImgFindingsDiv.ClientID %>').style.display='block';
		    
		    if(chkValue == "Outside Thyroid")
		    { 
		        document.getElementById('<%=OutChecksRow.ClientID %>').style.display='block';
		    }
	    }
	    else
	    {
	        if (document.getElementById('<%=chkThyroidBed.ClientID %>').checked == false &&
                    document.getElementById('<%=chkOutsideThyroid.ClientID %>').checked == false &&
                    document.getElementById('<%=chkThyroidLobe.ClientID %>').checked == false) {
	            document.getElementById(tb_id).value = '';
	            document.getElementById(Dxtype_id).value = '';
	            document.getElementById(Dxtarget_id).value = '';
	            document.getElementById(Dxside_id).value = '';
	            document.getElementById(DxQlty_id).value = '';
	            document.getElementById(DxIndicationId).value = '';
	            document.getElementById(DxResult_id).value = '';
	            document.getElementById('<%=DxDateText_1.ClientID %>').value = '';
	            document.getElementById('<%=DxDate_1.ClientID %>').value = '';
	        }

		    if(chkValue == "Thyroid Bed")
		    {
		        $('<%=ImgFindSite_1.ClientID %>').value = ''
		        $('<%=ImgFindSide_1.ClientID %>').value='';$('<%=ImgFindSubsite_1.ClientID %>').value='';
		        $('<%=ImgFindResult_1.ClientID %>').value = ''; $('<%=ImgFindSUV_1.ClientID %>').value = '';
		    }
		    if(chkValue == "Outside Thyroid")
		    {
            		        
		        document.getElementById('<%=OutsideChk1.ClientID %>').checked=false;
		        $('<%=ImgFindSide_2.ClientID %>').value='';$('<%=ImgFindSite_2.ClientID %>').value='';
		        $('<%=ImgFindSubsite_2.ClientID %>').value = ''; $('<%=ImgFindResult_2.ClientID %>').value = '';
		        $('<%=ImgFindSUV_2.ClientID %>').value = '';
		        document.getElementById('<%=OutsideChk2.ClientID %>').checked=false;
		        $('<%=ImgFindSide_3.ClientID %>').value='';$('<%=ImgFindSite_3.ClientID %>').value='';
		        $('<%=ImgFindSubsite_3.ClientID %>').value = ''; $('<%=ImgFindResult_3.ClientID %>').value = '';
		        $('<%=ImgFindSUV_3.ClientID %>').value = '';
		        document.getElementById('<%=OutsideChk3.ClientID %>').checked=false;
		        $('<%=ImgFindSide_4.ClientID %>').value='';$('<%=ImgFindSite_4.ClientID %>').value='';
		        $('<%=ImgFindSubsite_4.ClientID %>').value = ''; $('<%=ImgFindResult_4.ClientID %>').value = '';
		        $('<%=ImgFindSUV_4.ClientID %>').value = '';
		        document.getElementById('<%=OutsideChk4.ClientID %>').checked=false;
		        $('<%=ImgFindSide_5.ClientID %>').value='';$('<%=ImgFindSite_5.ClientID %>').value='';
		        $('<%=ImgFindSubsite_5.ClientID %>').value = ''; $('<%=ImgFindResult_5.ClientID %>').value = '';
		        $('<%=ImgFindSUV_5.ClientID %>').value = '';
		        document.getElementById('<%=OutsideChk5.ClientID %>').checked=false;
		        $('<%=ImgFindSide_6.ClientID %>').value='';$('<%=ImgFindSite_6.ClientID %>').value='';
		        $('<%=ImgFindSubsite_6.ClientID %>').value = ''; $('<%=ImgFindResult_6.ClientID %>').value = '';
		        $('<%=ImgFindSUV_6.ClientID %>').value = '';

		        document.getElementById('<%=OutChecksRow.ClientID %>').style.display = 'none';
		    }
		    if(chkValue == "Thyroid Lobe")
		    {
		        $('<%=ImgFindSite_11.ClientID %>').value = '';
		        $('<%=ImgFindSide_11.ClientID %>').value='';$('<%=ImgFindSubsite_11.ClientID %>').value='';
		        $('<%=ImgFindResult_11.ClientID %>').value = ''; $('<%=ImgFindSUV_11.ClientID %>').value = '';
		    }
	    }
    }
    
    function OutResultCheck(chkboxId, chkValue, Sitetxtbox_id, sideTxt_id, subSite_Id, result_Id, SUV_Id)
    {
        if (chkboxId.checked == true)
	    {
		    document.getElementById(Sitetxtbox_id).value = chkValue;
	    }
	    else
	    {
	        document.getElementById(Sitetxtbox_id).value = '';
	        document.getElementById(sideTxt_id).value = '';
	        document.getElementById(subSite_Id).value = '';
	        document.getElementById(result_Id).value = '';
	        document.getElementById(SUV_Id).value = '';
        }
    }
    
    function showImageFindingsDiv()
    {
        document.getElementById('<%= ImgFindingsDiv.ClientID %>').style.display='block';
    }

    function OtherDiagResultCheck(chkbox, chkValue, DxDtTxtId, DxDateId, tb_id, Dxtype_id, Dxtarget_id, Dxside_id, DxQlty_id, DxIndicationId, DxResult_id)
    {
	    if (chkbox.checked == true) {
	        document.getElementById(tb_id).value = chkValue;
		    document.getElementById(DxDtTxtId).value = $('<%=DiagDateText_Other.ClientID %>').value;;
		    document.getElementById(DxDateId).value = $('<%=DiagDateText_Other.ClientID %>').value;;
		    document.getElementById(Dxtype_id).value = 'RAI Scan';
		    document.getElementById(Dxtarget_id).value = 'Whole Body';
		    document.getElementById(Dxside_id).value = 'Bilateral';
		    document.getElementById(DxQlty_id).value = 'STD';
		    document.getElementById(DxIndicationId).value = 'Other Scan';
		    document.getElementById(DxResult_id).value = 'Uptake';
		    document.getElementById('<%= Other_ImgFindingsDiv.ClientID %>').style.display = 'block';

		    if (chkValue == "Outside Thyroid") {
		        document.getElementById('<%=OutChecksRow_Other.ClientID %>').style.display = 'block';
		    }		    
	    }
	    else
	    {
	        if (document.getElementById('<%=chkThyroidBed_Other.ClientID %>').checked == false &&
                    document.getElementById('<%=chkOutsideThyroid_Other.ClientID %>').checked == false) {
	            document.getElementById(tb_id).value = '';
	            document.getElementById(Dxtype_id).value = '';
	            document.getElementById(Dxtarget_id).value = '';
	            document.getElementById(Dxside_id).value = '';
	            document.getElementById(DxQlty_id).value = '';
	            document.getElementById(DxIndicationId).value = '';
	            document.getElementById(DxResult_id).value = '';
	            document.getElementById('<%=DxDateText_4.ClientID %>').value = '';
	            document.getElementById('<%=DxDate_4.ClientID %>').value = '';
	        }

	        if (chkValue == "Thyroid Bed") {
	            $('<%=Other_ImgFindSite_1.ClientID %>').value = ''
	            $('<%=Other_ImgFindSide_1.ClientID %>').value = ''; $('<%=Other_ImgFindSubsite_1.ClientID %>').value = '';
	            $('<%=Other_ImgFindResult_1.ClientID %>').value = ''; $('<%=Other_ImgFindSUV_1.ClientID %>').value = '';
	        }
	        if (chkValue == "Outside Thyroid") {

	            document.getElementById('<%=Other_OutsideChk1.ClientID %>').checked = false;
	            $('<%=Other_ImgFindSide_2.ClientID %>').value = ''; $('<%=Other_ImgFindSite_2.ClientID %>').value = '';
	            $('<%=Other_ImgFindSubsite_2.ClientID %>').value = ''; $('<%=Other_ImgFindResult_2.ClientID %>').value = '';
	            $('<%=Other_ImgFindSUV_2.ClientID %>').value = '';
	            document.getElementById('<%=Other_OutsideChk2.ClientID %>').checked = false;
	            $('<%=Other_ImgFindSide_3.ClientID %>').value = ''; $('<%=Other_ImgFindSite_3.ClientID %>').value = '';
	            $('<%=Other_ImgFindSubsite_3.ClientID %>').value = ''; $('<%=Other_ImgFindResult_3.ClientID %>').value = '';
	            $('<%=Other_ImgFindSUV_3.ClientID %>').value = '';
	            document.getElementById('<%=Other_OutsideChk3.ClientID %>').checked = false;
	            $('<%=Other_ImgFindSide_4.ClientID %>').value = ''; $('<%=Other_ImgFindSite_4.ClientID %>').value = '';
	            $('<%=Other_ImgFindSubsite_4.ClientID %>').value = ''; $('<%=Other_ImgFindResult_4.ClientID %>').value = '';
	            $('<%=Other_ImgFindSUV_4.ClientID %>').value = '';
	            document.getElementById('<%=Other_OutsideChk4.ClientID %>').checked = false;
	            $('<%=Other_ImgFindSide_5.ClientID %>').value = ''; $('<%=Other_ImgFindSite_5.ClientID %>').value = '';
	            $('<%=Other_ImgFindSubsite_5.ClientID %>').value = ''; $('<%=Other_ImgFindResult_5.ClientID %>').value = '';
	            $('<%=Other_ImgFindSUV_5.ClientID %>').value = '';
	            document.getElementById('<%=Other_OutsideChk5.ClientID %>').checked = false;
	            $('<%=Other_ImgFindSide_6.ClientID %>').value = ''; $('<%=Other_ImgFindSite_6.ClientID %>').value = '';
	            $('<%=Other_ImgFindSubsite_6.ClientID %>').value = ''; $('<%=Other_ImgFindResult_6.ClientID %>').value = '';
	            $('<%=Other_ImgFindSUV_6.ClientID %>').value = '';

	            document.getElementById('<%=OutChecksRow_Other.ClientID %>').style.display = 'none';
	        }
	    }
    } 
</script>

<a name="I131UptakeScan" /><span class="controlBoxTitle">Post-Surgical Uptake Scan</span> <br/>

<table width="650" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="I131UptakeTable">
  <tr > 
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Date</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Result</td>
  </tr>
  <tr>
    <td>
        <euc:EformTextBox Runat="server" TABLE="NoTable" FIELD="DiagDateText" ID="DiagDateText" ShowCalendar="True" CalcDate="True" class="InputText" style="width:100px;" />
        <euc:EformHidden Runat="server" ID="DiagDate" Table="NoTable" Field="DiagDate" />
    
        <euc:EformTextBox Runat="server" RecordId="1" TABLE="Diagnostics" FIELD="DxDateText" ID="DxDateText_1" Width="1px" style="display:none;" />
        <euc:EformHidden Runat="server" RecordId="1" ID="DxDate_1" Table="Diagnostics" Field="DxDate" /> 
        <euc:EformTextBox Runat="server" RecordId="1" ID="DxQuality_1" Table="Diagnostics" Field="DxQuality" Width="1px" style="display:none;"/>     
          
    </td>
    <td height="28" align="center">
        <euc:EformCheckBox Runat="server" TABLE="NoTable" FIELD="ThyroidBed" ID="chkThyroidBed" Value="Thyroid Bed" Text="Thyroid Bed"/>
            <euc:EformTextBox Runat="server" RecordId="1" ID="DxResult_1" Table="Diagnostics" Field="DxResult" Width="1px" style="display:none;"/>
            <euc:EformTextBox Runat="server" RecordId="1" ID="DxIndication_1" Table="Diagnostics" Field="DxIndication" Width="1px" 
                style="display:none;"/>
            <euc:EformTextBox Runat="server" RecordId="1" ID="DxType_1" Table="Diagnostics" Field="DxType" Width="1px" style="display:none;"/>
            <euc:EformTextBox Runat="server" RecordId="1" ID="DxTarget_1" Table="Diagnostics" Field="DxTarget" Width="1px" style="display:none;"/>
            <euc:EformTextBox Runat="server" RecordId="1" ID="DxSide_1" Table="Diagnostics" Field="DxSide" Width="1px" style="display:none;"/>    
        
        <euc:EformCheckBox Runat="server" TABLE="NoTable" FIELD="OutsideThyroid" ID="chkOutsideThyroid" Value="Outside Thyroid" Text="Outside Thyroid"/>           
        <euc:EformTextBox runat="server" ID="HiddenSite" Table="NoTable" Field="HiddenSite" Width="1px" style="display:none;"/>
        <euc:EformCheckBox Runat="server" TABLE="NoTable" FIELD="ThyroidLobe" ID="chkThyroidLobe" Value="Thyroid Lobe" Text="Thyroid Lobe"/>           
    </td>
  </tr>  
  <tr id="OutChecksRow" runat="server" style="display:none;">
    <td align="right" colspan="2">
        <asp:CheckBox ID="OutsideChk1" runat="server" Text="Bone"/>
        <asp:CheckBox ID="OutsideChk2" runat="server" Text="Brain"/>
        <asp:CheckBox ID="OutsideChk3" runat="server" Text="Lateral Neck"/>
        <asp:CheckBox ID="OutsideChk4" runat="server" Text="Liver"/>
        <asp:CheckBox ID="OutsideChk5" runat="server" Text="Lung"/>
    </td>
  </tr>
  </table>
  <br />
  
  <div id="ImgFindingsDiv" runat="server" style="display:none;">  
  <span class="controlBoxTitle">Image Findings</span> <br/>
  <table width="650" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="ImgFindingsTable">  
      <tr> 
        <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Side</td>
        <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Site</td>
        <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">SubSite</td>
        <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Result</td>
        <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Percentage Uptake </td>
        <td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
      </tr>
      
      <tr > 
        <td align="left"><euc:EformDropDownList LookupCode="NodeSide" RecordId="1" ParentRecordId="1" TABLE="DxImageFindings" FIELD="ImgFindSide" ID="ImgFindSide_1" Runat="server"/></td>
        <td align="center"><euc:EformTextBox RecordId="1" ParentRecordId="1" Table="DxImageFindings" Field="ImgFindSite" Runat="server" id="ImgFindSite_1"/></td>
        <td align="center"><euc:EformTextBox  Table="DxImageFindings" Field="ImgFindSubsite" RecordId="1" ParentRecordId="1" Runat="server" id="ImgFindSubsite_1"/></td>
        <td align="center"><euc:EformTextBox  Table="DxImageFindings" Field="ImgFindResult" RecordId="1" ParentRecordId="1" Runat="server" id="ImgFindResult_1"/></td>
        <td align="center"><euc:EformTextBox  Table="DxImageFindings" Field="ImgFindSUV" RecordId="1" ParentRecordId="1" Runat="server" id="ImgFindSUV_1"/></td>
        <td align="center"><euc:EformDeleteIcon runat="server"/></td>
      </tr>  
      
      <tr >
        <td align="left"><euc:EformDropDownList LookupCode="NodeSide" Table="DxImageFindings" Field="ImgFindSide" RecordId="2" ParentRecordId="1" Runat="server" id="ImgFindSide_2"/></td>
        <td align="center"><euc:EformTextBox Table="DxImageFindings" Field="ImgFindSite" RecordId="2" ParentRecordId="1" Runat="server" id="ImgFindSite_2"/></td>
        <td align="center"><euc:EformTextBox Table="DxImageFindings" Field="ImgFindSubsite" RecordId="2" ParentRecordId="1" Runat="server" id="ImgFindSubsite_2"/></td>
        <td align="center"><euc:EformTextBox Table="DxImageFindings" Field="ImgFindResult" RecordId="2" ParentRecordId="1" Runat="server" id="ImgFindResult_2"/></td>
        <td align="center"><euc:EformTextBox  Table="DxImageFindings" Field="ImgFindSUV" RecordId="2" ParentRecordId="1" Runat="server" id="ImgFindSUV_2"/></td>
        <td align="center"><euc:EformDeleteIcon runat="server"/></td>
      </tr>
      
      <tr >
        <td align="left"><euc:EformDropDownList LookupCode="NodeSide" Table="DxImageFindings" Field="ImgFindSide" RecordId="3" ParentRecordId="1" Runat="server" id="ImgFindSide_3" /></td>
        <td align="center"><euc:EformTextBox Table="DxImageFindings" Field="ImgFindSite" RecordId="3" ParentRecordId="1" Runat="server" id="ImgFindSite_3" /></td>
        <td align="center"><euc:EformTextBox Table="DxImageFindings" Field="ImgFindSubsite" RecordId="3" ParentRecordId="1" Runat="server" id="ImgFindSubsite_3" /></td>
        <td align="center"><euc:EformTextBox Table="DxImageFindings" Field="ImgFindResult" RecordId="3" ParentRecordId="1" Runat="server" id="ImgFindResult_3" /></td>
        <td align="center"><euc:EformTextBox  Table="DxImageFindings" Field="ImgFindSUV" RecordId="3" ParentRecordId="1" Runat="server" id="ImgFindSUV_3"/></td>
        <td align="center"><euc:EformDeleteIcon runat="server"/></td>
      </tr>
      
      <tr >
        <td align="left"><euc:EformDropDownList LookupCode="NodeSide" Table="DxImageFindings" Field="ImgFindSide" RecordId="4" ParentRecordId="1" Runat="server" id="ImgFindSide_4" /></td>
        <td align="center"><euc:EformTextBox Table="DxImageFindings" Field="ImgFindSite" RecordId="4" ParentRecordId="1" Runat="server" id="ImgFindSite_4" /></td>
        <td align="center"><euc:EformTextBox Table="DxImageFindings" Field="ImgFindSubsite" RecordId="4" ParentRecordId="1" Runat="server" id="ImgFindSubsite_4" /></td>
        <td align="center"><euc:EformTextBox Table="DxImageFindings" Field="ImgFindResult" RecordId="4" ParentRecordId="1" Runat="server" id="ImgFindResult_4" /></td>
        <td align="center"><euc:EformTextBox  Table="DxImageFindings" Field="ImgFindSUV" RecordId="4" ParentRecordId="1" Runat="server" id="ImgFindSUV_4"/></td>
        <td align="center"><euc:EformDeleteIcon runat="server"/></td>
      </tr>
      
      <tr >
        <td align="left"><euc:EformDropDownList LookupCode="NodeSide" Table="DxImageFindings" Field="ImgFindSide" RecordId="5" ParentRecordId="1" Runat="server" id="ImgFindSide_5" /></td>
        <td align="center"><euc:EformTextBox Table="DxImageFindings" Field="ImgFindSite" RecordId="5" ParentRecordId="1" Runat="server" id="ImgFindSite_5" /></td>
        <td align="center"><euc:EformTextBox Table="DxImageFindings" Field="ImgFindSubsite" RecordId="5" ParentRecordId="1" Runat="server" id="ImgFindSubsite_5" /></td>
        <td align="center"><euc:EformTextBox Table="DxImageFindings" Field="ImgFindResult" RecordId="5" ParentRecordId="1" Runat="server" id="ImgFindResult_5" /></td>
        <td align="center"><euc:EformTextBox  Table="DxImageFindings" Field="ImgFindSUV" RecordId="5" ParentRecordId="1" Runat="server" id="ImgFindSUV_5"/></td>
        <td align="center"><euc:EformDeleteIcon runat="server"/></td>
      </tr>
      
      <tr >
        <td align="left"><euc:EformDropDownList LookupCode="NodeSide" Table="DxImageFindings" Field="ImgFindSide" RecordId="6" ParentRecordId="1" Runat="server" id="ImgFindSide_6" /></td>
        <td align="center"><euc:EformTextBox Table="DxImageFindings" Field="ImgFindSite" RecordId="6" ParentRecordId="1" Runat="server" id="ImgFindSite_6" /></td>
        <td align="center"><euc:EformTextBox Table="DxImageFindings" Field="ImgFindSubsite" RecordId="6" ParentRecordId="1" Runat="server" id="ImgFindSubsite_6" /></td>
        <td align="center"><euc:EformTextBox Table="DxImageFindings" Field="ImgFindResult" RecordId="6" ParentRecordId="1" Runat="server" id="ImgFindResult_6" /></td>
        <td align="center"><euc:EformTextBox  Table="DxImageFindings" Field="ImgFindSUV" RecordId="6" ParentRecordId="1" Runat="server" id="ImgFindSUV_6"/></td>
        <td align="center"><euc:EformDeleteIcon runat="server"/></td>
      </tr>
      
      <tr > 
        <td align="left"><euc:EformDropDownList LookupCode="NodeSide" RecordId="11" ParentRecordId="1" TABLE="DxImageFindings" FIELD="ImgFindSide" ID="ImgFindSide_11" Runat="server" /></td>
        <td align="center"><euc:EformTextBox RecordId="11" ParentRecordId="1" Table="DxImageFindings" Field="ImgFindSite" Runat="server" id="ImgFindSite_11"/></td>
        <td align="center"><euc:EformTextBox Table="DxImageFindings" Field="ImgFindSubsite" RecordId="11" ParentRecordId="1" Runat="server" id="ImgFindSubsite_11"/></td>
        <td align="center"><euc:EformTextBox  Table="DxImageFindings" Field="ImgFindResult" RecordId="11" ParentRecordId="1" Runat="server" id="ImgFindResult_11"/></td>
        <td align="center"><euc:EformTextBox  Table="DxImageFindings" Field="ImgFindSUV" RecordId="11" ParentRecordId="1" Runat="server" id="ImgFindSUV_11"/></td>
        <td align="center"><euc:EformDeleteIcon runat="server"/></td>
      </tr>  
      
      <tr style="DISPLAY: none">
        <td align="left"><euc:EformDropDownList LookupCode="NodeSide" Table="DxImageFindings" Field="ImgFindSide" RecordId="7" ParentRecordId="1" Runat="server" id="ImgFindSide_7" /></td>
        <td align="center"><euc:EformTextBox Table="DxImageFindings" Field="ImgFindSite" RecordId="7" ParentRecordId="1" Runat="server" id="ImgFindSite_7" /></td>
        <td align="center"><euc:EformTextBox Table="DxImageFindings" Field="ImgFindSubsite" RecordId="7" ParentRecordId="1" Runat="server" id="ImgFindSubsite_7" /></td>
        <td align="center"><euc:EformTextBox Table="DxImageFindings" Field="ImgFindResult" RecordId="7" ParentRecordId="1" Runat="server" id="ImgFindResult_7" /></td>
        <td align="center"><euc:EformTextBox  Table="DxImageFindings" Field="ImgFindSUV" RecordId="7" ParentRecordId="1" Runat="server" id="ImgFindSUV_7"/></td>
        <td align="center"><euc:EformDeleteIcon runat="server"/></td>
      </tr>
      
      <tr style="DISPLAY: none">
        <td align="left"><euc:EformDropDownList LookupCode="NodeSide" Table="DxImageFindings" Field="ImgFindSide" RecordId="8" ParentRecordId="1" Runat="server" id="ImgFindSide_8" /></td>
        <td align="center"><euc:EformTextBox Table="DxImageFindings" Field="ImgFindSite" RecordId="8" ParentRecordId="1" Runat="server" id="ImgFindSite_8" /></td>
        <td align="center"><euc:EformTextBox Table="DxImageFindings" Field="ImgFindSubsite" RecordId="8" ParentRecordId="1" Runat="server" id="ImgFindSubsite_8" /></td>
        <td align="center"><euc:EformTextBox Table="DxImageFindings" Field="ImgFindResult" RecordId="8" ParentRecordId="1" Runat="server" id="ImgFindResult_8" /></td>
        <td align="center"><euc:EformTextBox  Table="DxImageFindings" Field="ImgFindSUV" RecordId="8" ParentRecordId="1" Runat="server" id="ImgFindSUV_8"/></td>
        <td align="center"><euc:EformDeleteIcon runat="server"/></td>
      </tr>
      
      <tr style="DISPLAY: none">
        <td align="left"><euc:EformDropDownList LookupCode="NodeSide" Table="DxImageFindings" Field="ImgFindSide" RecordId="9" ParentRecordId="1" Runat="server" id="ImgFindSide_9" /></td>
        <td align="center"><euc:EformTextBox Table="DxImageFindings" Field="ImgFindSite" RecordId="9" ParentRecordId="1" Runat="server" id="ImgFindSite_9" /></td>
        <td align="center"><euc:EformTextBox Table="DxImageFindings" Field="ImgFindSubsite" RecordId="9" ParentRecordId="1" Runat="server" id="ImgFindSubsite_9" /></td>
        <td align="center"><euc:EformTextBox Table="DxImageFindings" Field="ImgFindResult" RecordId="9" ParentRecordId="1" Runat="server" id="ImgFindResult_9" /></td>
        <td align="center"><euc:EformTextBox  Table="DxImageFindings" Field="ImgFindSUV" RecordId="9" ParentRecordId="1" Runat="server" id="ImgFindSUV_9"/></td>
        <td align="center"><euc:EformDeleteIcon runat="server"/></td>
      </tr>
      
      <tr style="DISPLAY: none">
        <td align="left"><euc:EformDropDownList LookupCode="NodeSide" Table="DxImageFindings" Field="ImgFindSide" RecordId="10" ParentRecordId="1" Runat="server" id="ImgFindSide_10" /></td>
        <td align="center"><euc:EformTextBox Table="DxImageFindings" Field="ImgFindSite" RecordId="10" ParentRecordId="1" Runat="server" id="ImgFindSite_10" /></td>
        <td align="center"><euc:EformTextBox Table="DxImageFindings" Field="ImgFindSubsite" RecordId="10" ParentRecordId="1" Runat="server" id="ImgFindSubsite_10" /></td>
        <td align="center"><euc:EformTextBox Table="DxImageFindings" Field="ImgFindResult" RecordId="10" ParentRecordId="1" Runat="server" id="ImgFindResult_10" /></td>
        <td align="center"><euc:EformTextBox  Table="DxImageFindings" Field="ImgFindSUV" RecordId="10" ParentRecordId="1" Runat="server" id="ImgFindSUV_10"/></td>
        <td align="center"><euc:EformDeleteIcon runat="server"/></td>
      </tr>
</table>
<img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'ImgFindingsTable');" />
<br/><br/>
</div>

<a name="I131UptakeScan" /><span class="controlBoxTitle">Other Uptake Scans</span> <br/>

<table width="650" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="OtherScansTbl">
  <tr > 
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Date</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Result</td>
  </tr>
  <tr>
    <td>
        <euc:EformTextBox Runat="server" TABLE="NoTable" FIELD="DiagDateText_Other" ID="DiagDateText_Other" ShowCalendar="True" CalcDate="True" 
            class="InputText" style="width:100px;" />
        <euc:EformHidden Runat="server" ID="DiagDate_Other" Table="NoTable" Field="DiagDate_Other" />
    
        <euc:EformTextBox Runat="server" RecordId="4" TABLE="Diagnostics" FIELD="DxDateText" ID="DxDateText_4" Width="1px" style="display:none;" />
        <euc:EformHidden Runat="server" RecordId="4" ID="DxDate_4" Table="Diagnostics" Field="DxDate" /> 
        <euc:EformTextBox Runat="server" RecordId="4" ID="DxQuality_4" Table="Diagnostics" Field="DxQuality" Width="1px" style="display:none;"/>
              
    </td>
    <td height="28" align="center">
        <euc:EformCheckBox TABLE="NoTable" FIELD="ThyroidBed_Other" Runat="server" ID="chkThyroidBed_Other" Value="Thyroid Bed" Text="Thyroid Bed"/>
             <euc:EformTextBox Runat="server" RecordId="4" ID="DxResult_4" Table="Diagnostics" Field="DxResult" Width="1px" style="display:none;"/>
            <euc:EformTextBox Runat="server" RecordId="4" ID="DxIndication_4" Table="Diagnostics" Field="DxIndication" Width="1px" 
                style="display:none;"/>
            <euc:EformTextBox Runat="server" RecordId="4" ID="DxType_4" Table="Diagnostics" Field="DxType" Width="1px" style="display:none;"/>
            <euc:EformTextBox Runat="server" RecordId="4" ID="DxTarget_4" Table="Diagnostics" Field="DxTarget" Width="1px" style="display:none;"/>
            <euc:EformTextBox Runat="server" RecordId="4" ID="DxSide_4" Table="Diagnostics" Field="DxSide" Width="1px" style="display:none;"/>    
        
        <euc:EformCheckBox TABLE="NoTable" FIELD="OutsideThyroid_Other" Runat="server" ID="chkOutsideThyroid_Other" Value="Outside Thyroid" Text="Outside Thyroid"/>
        <euc:EformTextBox runat="server" ID="HiddenSite_Other" Table="NoTable" Field="HiddenSite_Other" Width="1px" style="display:none;"/>
        
    </td>
  </tr>
  <tr id="OutChecksRow_Other" runat="server" style="display:none;">
    <td align="right" colspan="2">
        <asp:CheckBox ID="Other_OutsideChk1" runat="server" Text="Bone"/>
        <asp:CheckBox ID="Other_OutsideChk2" runat="server" Text="Brain"/>
        <asp:CheckBox ID="Other_OutsideChk3" runat="server" Text="Lateral Neck"/>
        <asp:CheckBox ID="Other_OutsideChk4" runat="server" Text="Liver"/>
        <asp:CheckBox ID="Other_OutsideChk5" runat="server" Text="Lung"/>
    </td>
  </tr>
  </table>
  <div id="Other_ImgFindingsDiv" runat="server" style="display:none;">  
  <span class="controlBoxTitle">Image Findings</span> <br/>
  <table width="650" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="Other_ImgFindingsTable">  
      <tr> 
        <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Side</td>
        <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Site</td>
        <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">SubSite</td>
        <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Result</td>
        <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Percentage Uptake </td>
        <td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
      </tr>

      <tr > 
        <td align="left"><euc:EformDropDownList LookupCode="NodeSide" RecordId="1" ParentRecordId="4" TABLE="DxImageFindings" FIELD="ImgFindSide" ID="Other_ImgFindSide_1" Runat="server"/></td>
        <td align="center"><euc:EformTextBox RecordId="1" ParentRecordId="4" Table="DxImageFindings" Field="ImgFindSite" Runat="server" id="Other_ImgFindSite_1"/></td>
        <td align="center"><euc:EformTextBox  Table="DxImageFindings" Field="ImgFindSubsite" RecordId="1" ParentRecordId="4" Runat="server" id="Other_ImgFindSubsite_1"/></td>
        <td align="center"><euc:EformTextBox  Table="DxImageFindings" Field="ImgFindResult" RecordId="1" ParentRecordId="4" Runat="server" id="Other_ImgFindResult_1"/></td>
        <td align="center"><euc:EformTextBox  Table="DxImageFindings" Field="ImgFindSUV" RecordId="1" ParentRecordId="4" Runat="server" id="Other_ImgFindSUV_1"/></td>
        <td align="center"><euc:EformDeleteIcon runat="server"/></td>
      </tr>
       
      <tr >
        <td align="left"><euc:EformDropDownList LookupCode="NodeSide" Table="DxImageFindings" Field="ImgFindSide" RecordId="2" ParentRecordId="4" Runat="server" id="Other_ImgFindSide_2"/></td>
        <td align="center"><euc:EformTextBox Table="DxImageFindings" Field="ImgFindSite" RecordId="2" ParentRecordId="4" Runat="server" id="Other_ImgFindSite_2"/></td>
        <td align="center"><euc:EformTextBox Table="DxImageFindings" Field="ImgFindSubsite" RecordId="2" ParentRecordId="4" Runat="server" id="Other_ImgFindSubsite_2"/></td>
        <td align="center"><euc:EformTextBox Table="DxImageFindings" Field="ImgFindResult" RecordId="2" ParentRecordId="4" Runat="server" id="Other_ImgFindResult_2"/></td>
        <td align="center"><euc:EformTextBox  Table="DxImageFindings" Field="ImgFindSUV" RecordId="2" ParentRecordId="4" Runat="server" id="Other_ImgFindSUV_2"/></td>
        <td align="center"><euc:EformDeleteIcon runat="server"/></td>
      </tr>

      <tr >
        <td align="left"><euc:EformDropDownList LookupCode="NodeSide" Table="DxImageFindings" Field="ImgFindSide" RecordId="3" ParentRecordId="4" Runat="server" id="Other_ImgFindSide_3" /></td>
        <td align="center"><euc:EformTextBox Table="DxImageFindings" Field="ImgFindSite" RecordId="3" ParentRecordId="4" Runat="server" id="Other_ImgFindSite_3" /></td>
        <td align="center"><euc:EformTextBox Table="DxImageFindings" Field="ImgFindSubsite" RecordId="3" ParentRecordId="4" Runat="server" id="Other_ImgFindSubsite_3" /></td>
        <td align="center"><euc:EformTextBox Table="DxImageFindings" Field="ImgFindResult" RecordId="3" ParentRecordId="4" Runat="server" id="Other_ImgFindResult_3" /></td>
        <td align="center"><euc:EformTextBox  Table="DxImageFindings" Field="ImgFindSUV" RecordId="3" ParentRecordId="4" Runat="server" id="Other_ImgFindSUV_3"/></td>
        <td align="center"><euc:EformDeleteIcon runat="server"/></td>
      </tr>

      <tr >
        <td align="left"><euc:EformDropDownList LookupCode="NodeSide" Table="DxImageFindings" Field="ImgFindSide" RecordId="4" ParentRecordId="4" Runat="server" id="Other_ImgFindSide_4" /></td>
        <td align="center"><euc:EformTextBox Table="DxImageFindings" Field="ImgFindSite" RecordId="4" ParentRecordId="4" Runat="server" id="Other_ImgFindSite_4" /></td>
        <td align="center"><euc:EformTextBox Table="DxImageFindings" Field="ImgFindSubsite" RecordId="4" ParentRecordId="4" Runat="server" id="Other_ImgFindSubsite_4" /></td>
        <td align="center"><euc:EformTextBox Table="DxImageFindings" Field="ImgFindResult" RecordId="4" ParentRecordId="4" Runat="server" id="Other_ImgFindResult_4" /></td>
        <td align="center"><euc:EformTextBox  Table="DxImageFindings" Field="ImgFindSUV" RecordId="4" ParentRecordId="4" Runat="server" id="Other_ImgFindSUV_4"/></td>
        <td align="center"><euc:EformDeleteIcon runat="server"/></td>
      </tr> 

      <tr >
        <td align="left"><euc:EformDropDownList LookupCode="NodeSide" Table="DxImageFindings" Field="ImgFindSide" RecordId="5" ParentRecordId="4" Runat="server" id="Other_ImgFindSide_5" /></td>
        <td align="center"><euc:EformTextBox Table="DxImageFindings" Field="ImgFindSite" RecordId="5" ParentRecordId="4" Runat="server" id="Other_ImgFindSite_5" /></td>
        <td align="center"><euc:EformTextBox Table="DxImageFindings" Field="ImgFindSubsite" RecordId="5" ParentRecordId="4" Runat="server" id="Other_ImgFindSubsite_5" /></td>
        <td align="center"><euc:EformTextBox Table="DxImageFindings" Field="ImgFindResult" RecordId="5" ParentRecordId="4" Runat="server" id="Other_ImgFindResult_5" /></td>
        <td align="center"><euc:EformTextBox  Table="DxImageFindings" Field="ImgFindSUV" RecordId="5" ParentRecordId="4" Runat="server" id="Other_ImgFindSUV_5"/></td>
        <td align="center"><euc:EformDeleteIcon runat="server"/></td>
      </tr>

      <tr >
        <td align="left"><euc:EformDropDownList LookupCode="NodeSide" Table="DxImageFindings" Field="ImgFindSide" RecordId="6" ParentRecordId="4" Runat="server" id="Other_ImgFindSide_6" /></td>
        <td align="center"><euc:EformTextBox Table="DxImageFindings" Field="ImgFindSite" RecordId="6" ParentRecordId="4" Runat="server" id="Other_ImgFindSite_6" /></td>
        <td align="center"><euc:EformTextBox Table="DxImageFindings" Field="ImgFindSubsite" RecordId="6" ParentRecordId="4" Runat="server" id="Other_ImgFindSubsite_6" /></td>
        <td align="center"><euc:EformTextBox Table="DxImageFindings" Field="ImgFindResult" RecordId="6" ParentRecordId="4" Runat="server" id="Other_ImgFindResult_6" /></td>
        <td align="center"><euc:EformTextBox  Table="DxImageFindings" Field="ImgFindSUV" RecordId="6" ParentRecordId="4" Runat="server" id="Other_ImgFindSUV_6"/></td>
        <td align="center"><euc:EformDeleteIcon runat="server"/></td>
      </tr>

       <tr style="DISPLAY: none">
        <td align="left"><euc:EformDropDownList LookupCode="NodeSide" Table="DxImageFindings" Field="ImgFindSide" RecordId="7" ParentRecordId="4" Runat="server" id="Other_ImgFindSide_7" /></td>
        <td align="center"><euc:EformTextBox Table="DxImageFindings" Field="ImgFindSite" RecordId="7" ParentRecordId="4" Runat="server" id="Other_ImgFindSite_7" /></td>
        <td align="center"><euc:EformTextBox Table="DxImageFindings" Field="ImgFindSubsite" RecordId="7" ParentRecordId="4" Runat="server" id="Other_ImgFindSubsite_7" /></td>
        <td align="center"><euc:EformTextBox Table="DxImageFindings" Field="ImgFindResult" RecordId="7" ParentRecordId="4" Runat="server" id="Other_ImgFindResult_7" /></td>
        <td align="center"><euc:EformTextBox  Table="DxImageFindings" Field="ImgFindSUV" RecordId="7" ParentRecordId="4" Runat="server" id="Other_ImgFindSUV_7"/></td>
        <td align="center"><euc:EformDeleteIcon runat="server"/></td>
      </tr>

      <tr style="DISPLAY: none">
        <td align="left"><euc:EformDropDownList LookupCode="NodeSide" Table="DxImageFindings" Field="ImgFindSide" RecordId="8" ParentRecordId="4" Runat="server" id="Other_ImgFindSide_8" /></td>
        <td align="center"><euc:EformTextBox Table="DxImageFindings" Field="ImgFindSite" RecordId="8" ParentRecordId="4" Runat="server" id="Other_ImgFindSite_8" /></td>
        <td align="center"><euc:EformTextBox Table="DxImageFindings" Field="ImgFindSubsite" RecordId="8" ParentRecordId="4" Runat="server" id="Other_ImgFindSubsite_8" /></td>
        <td align="center"><euc:EformTextBox Table="DxImageFindings" Field="ImgFindResult" RecordId="8" ParentRecordId="4" Runat="server" id="Other_ImgFindResult_8" /></td>
        <td align="center"><euc:EformTextBox  Table="DxImageFindings" Field="ImgFindSUV" RecordId="8" ParentRecordId="4" Runat="server" id="Other_ImgFindSUV_8"/></td>
        <td align="center"><euc:EformDeleteIcon runat="server"/></td>
      </tr>

      <tr style="DISPLAY: none">
        <td align="left"><euc:EformDropDownList LookupCode="NodeSide" Table="DxImageFindings" Field="ImgFindSide" RecordId="9" ParentRecordId="4" Runat="server" id="Other_ImgFindSide_9" /></td>
        <td align="center"><euc:EformTextBox Table="DxImageFindings" Field="ImgFindSite" RecordId="9" ParentRecordId="4" Runat="server" id="Other_ImgFindSite_9" /></td>
        <td align="center"><euc:EformTextBox Table="DxImageFindings" Field="ImgFindSubsite" RecordId="9" ParentRecordId="4" Runat="server" id="Other_ImgFindSubsite_9" /></td>
        <td align="center"><euc:EformTextBox Table="DxImageFindings" Field="ImgFindResult" RecordId="9" ParentRecordId="4" Runat="server" id="Other_ImgFindResult_9" /></td>
        <td align="center"><euc:EformTextBox  Table="DxImageFindings" Field="ImgFindSUV" RecordId="9" ParentRecordId="4" Runat="server" id="Other_ImgFindSUV_9"/></td>
        <td align="center"><euc:EformDeleteIcon runat="server"/></td>
      </tr>
      
      <tr style="DISPLAY: none">
        <td align="left"><euc:EformDropDownList LookupCode="NodeSide" Table="DxImageFindings" Field="ImgFindSide" RecordId="10" ParentRecordId="4" Runat="server" id="Other_ImgFindSide_10" /></td>
        <td align="center"><euc:EformTextBox Table="DxImageFindings" Field="ImgFindSite" RecordId="10" ParentRecordId="4" Runat="server" id="Other_ImgFindSite_10" /></td>
        <td align="center"><euc:EformTextBox Table="DxImageFindings" Field="ImgFindSubsite" RecordId="10" ParentRecordId="4" Runat="server" id="Other_ImgFindSubsite_10" /></td>
        <td align="center"><euc:EformTextBox Table="DxImageFindings" Field="ImgFindResult" RecordId="10" ParentRecordId="4" Runat="server" id="Other_ImgFindResult_10" /></td>
        <td align="center"><euc:EformTextBox  Table="DxImageFindings" Field="ImgFindSUV" RecordId="10" ParentRecordId="4" Runat="server" id="Other_ImgFindSUV_10"/></td>
        <td align="center"><euc:EformDeleteIcon runat="server"/></td>
      </tr>
  </table>
  <img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'Other_ImgFindingsTable');" />  
  
  </div>