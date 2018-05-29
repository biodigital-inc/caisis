<%@ Control Language="c#" Inherits="Caisis.UI.Modules.HeadNeck.Eforms.ThyroidFamilyHistory" CodeFile="ThyroidFamilyHistory.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript">
	
	function FamMemCheck(chkbox, chkValue, tb_id, value)
    {
	    if (chkbox.checked == true)
	    {
		    document.getElementById(tb_id).value = value;
	    }
        else
        {
            document.getElementById(tb_id).value = '';
        }
    }
</script>

<a name="ThyroidFamilyHistory" /><span class="controlBoxTitle">Family History for Thyroid Cancer</span> <br/>

<table width="650" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="FamilyHistoryTable">      
  
  <tr> 
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;" colspan="5">&nbsp;Relation</td>
  </tr>
  <tr>    
    <td height="28" align="left" >
        <euc:EformCheckBox TABLE="FamilyMembers" FIELD="FamMemRelation" ID="FamMemRelation_1" RecordID="1"  Runat="server" TabIndex="3" Text="Mother" Value="Mother" /><euc:EformTextBox id="FamMemDiagnosis_1" runat="server" RecordId="1" Table="FamilyMemberDiagnosis" FIELD="FamMemDiagnosis" Width="1px" style="display:none;" />
    </td> 
    <td height="28" valign="top" >
        <euc:EformCheckBox TABLE="FamilyMembers" FIELD="FamMemRelation" ID="FamMemRelation_2" RecordID="2"  Runat="server" TabIndex="4" Text="Father" Value="Father" /><euc:EformTextBox id="FamMemDiagnosis_2" runat="server" RecordId="2" Table="FamilyMemberDiagnosis" FIELD="FamMemDiagnosis" Width="1px" style="display:none;" />
    </td> 
    <td height="28" valign="top" >
        <euc:EformCheckBox TABLE="FamilyMembers" FIELD="FamMemRelation" ID="FamMemRelation_3" RecordID="3"  Runat="server" TabIndex="5" Text="Brother" Value="Brother" /><euc:EformTextBox id="FamMemDiagnosis_3" runat="server" RecordId="3" Table="FamilyMemberDiagnosis" FIELD="FamMemDiagnosis" Width="1px" style="display:none;" />
    </td>
    <td height="28" valign="top" >
        <euc:EformCheckBox TABLE="FamilyMembers" FIELD="FamMemRelation" ID="FamMemRelation_4" RecordID="4"  Runat="server" TabIndex="6" Text="Sister" Value="Sister" /><euc:EformTextBox id="FamMemDiagnosis_4" runat="server" RecordId="4" Table="FamilyMemberDiagnosis" FIELD="FamMemDiagnosis" Width="1px" style="display:none;"/>
    </td>
    <td height="28" valign="top" >
        <euc:EformCheckBox TABLE="NoTable" FIELD="FamMemOther" ID="FamMemOther" Runat="server" TabIndex="7" Text="Other" Value="Other" />&nbsp;&nbsp;
        <euc:EformComboBox TABLE="FamilyMembers" FIELD="FamMemRelation" ID="FamMemRelation_5" RecordID="5"  Runat="server" TabIndex="8" LookupCode="FamHxRelation" />
  <euc:EformTextBox id="FamMemDiagnosis_5" runat="server" RecordId="5" Table="FamilyMemberDiagnosis" FIELD="FamMemDiagnosis" Width="1px" style="display:none;"/>
    </td>    
  </tr>
</table>
<br/><br/>