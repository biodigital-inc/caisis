<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Bladder.Eforms.EndoProcedures" CodeFile="EndoProcedures.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>



<script type="text/javascript" language="javascript">



</script>

<a name="EndoProcedures" />

<!--Additional Procedures begin-->
<span class="controlBoxTitle">&nbsp;&nbsp;Procedures</span><br />
  <table width="650" border="0" cellpadding="0" cellspacing="0" class="eformLargePopulatedTable" id="EndoProceduresTable"  style="margin-bottom: 0px; border: solid 1px #cccccc;">
    
    <tr> 
      <td  style="width: 5px;">&nbsp;</td>
      <td height="35">
	  
	  
	  <euc:EformCheckBox runat="server" Field="ProcName" RecordId="1" Table="Procedures" id="ProcName_1" Value="Cystoscopy" />Cystoscopy      </td>
      <td><euc:EformCheckBox runat="server" Field="ProcName" RecordId="4" Table="Procedures" id="ProcName_4" Value="Transurethral Fulguration Tumor" />Transurethral Fulguration Tumor </td>
      <td><euc:EformCheckBox runat="server" Field="ProcName" RecordId="7" Table="Procedures" id="ProcName_7" Value="Cytogram" />Cytogram </td>
    </tr>
    <tr> 
      <td>&nbsp;</td>
      <td height="35"><euc:EformCheckBox runat="server" Field="ProcName" RecordId="2" Table="Procedures" id="ProcName_2" Value="Stent Removal" />Stent Removal&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong style="font-size: 11px;">Side:</strong><euc:EFormSelect style="width:60px;" LookupCode="OpSide" runat="server"  Field="ProcSide" RecordId="2" Table="Procedures" id="ProcSide_2" /> </td>
      <td><euc:EformCheckBox runat="server" Field="ProcName" RecordId="5" Table="Procedures" id="ProcName_5" Value="Transurethral Biopsy" />Transurethral Biopsy</td>
      <td><euc:EformCheckBox runat="server" Field="ProcName" RecordId="8" Table="Procedures" id="ProcName_8" Value="Loopogram" />Loopogram</td>
    </tr>
    <tr> 
      <td>&nbsp;</td>
      <td height="35"><euc:EformCheckBox runat="server" Field="ProcName" RecordId="3" Table="Procedures" id="ProcName_3" Value="Difficult Catheterization" />Difficult Catheterization </td>
      <td><euc:EformCheckBox runat="server" Field="ProcName" RecordId="6" Table="Procedures" id="ProcName_6" Value="Dilation of Urethral Stricture" />Dilation of Urethral Stricture </td>
      <td><euc:EformCheckBox runat="server" Field="ProcName" RecordId="9" Table="Procedures" id="ProcName_9" Value="Urethrogram" />Urethrogram </td>
    </tr>     
    
    <tr>
      <td >&nbsp;</td>
      <td height="35"><strong style="font-size: 10px;">Enter Others Below: </strong></td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr> 
      <td >&nbsp;</td>
      <td height="35">
      <euc:EformComboBox style="width:200px;" LookupCode="ProcName" RefBy="OpName"  Field="ProcName" RecordId="10" Table="Procedures" MaxLength="50" runat="server" id="ProcName_10" />      </td>
      <td height="35" colspan="2"><euc:EformComboBox style="width:200px;" LookupCode="ProcName" RefBy="OpName"  Field="ProcName" MaxLength="50" RecordId="11" Table="Procedures" runat="server" id="ProcName_11" />  </td>
    </tr>
	
	<tr> 
      <td>&nbsp;</td>
      <td align="right" valign="bottom">&nbsp;</td>
      <td align="center">&nbsp;</td>
      <td align="center">&nbsp;</td>
    </tr>
</table>
<%--  <img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" onclick="return showFirstAdditionalRow(this,'AdditionalProceduresHtmlTable');" style="margin-left: 6px;" /><br/>--%>
  <br/> <br/> <br/>