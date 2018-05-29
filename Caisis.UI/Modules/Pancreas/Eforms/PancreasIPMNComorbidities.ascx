<%@ Control Language="C#" Inherits="Caisis.UI.Modules.Pancreas.Eforms.PancreasIPMNComorbidities" CodeFile="PancreasIPMNComorbidities.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl"%>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<script type="text/javascript" language="javascript">
    tableArray.ComorbiditiesHtmlTable = "ComorbiditiesHtmlTable";
</script>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>

<a name="PancreasIPMNComorbidities" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Comorbidities Conditions"></asp:Label><br/>

<table cellpadding="3" cellspacing="0" class="ClinicalEformTable" id="ComorbiditiesHtmlTable" style="width: 700px;">
  <tr id="ComorbiditiesPopulatedColumnHeadingsRow" runat="server"> 
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; width: 110px;">&nbsp;Date</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Comorbidity</td>
    <td class="controlBoxDataGridHeaderFirstCol">Grade / Severity </td>
    <td class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
  </tr>
  
  <tr id="ComorbidityRow_CoronaryArteryDisease" runat="server"> 
    <td height="28" class="ClinicalEformGridColumnOne">
	
	<euc:EformTextBox Runat="server" RecordId="1"  ID="ComorbDateText_1" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"   />
	<euc:EformHidden RecordId="1" Runat="server" ID="ComorbDate_1" Table="Comorbidities" Field="ComorbDate" />	</td>
    <td ><euc:EformCheckbox TABLE="Comorbidities" FIELD="Comorbidity" Runat="server" ID="Comorbidity_CoronaryArteryDisease" Value="Coronary Artery Disease" RecordId="1"  /> Coronary Artery Disease</td>
    <td align="center"><euc:EformComboBox RecordId="1" style="width:100px;" TABLE="Comorbidities" FIELD="ComorbGrade" LookupCode="ComorbSeverity" Runat="server" ID="ComorbGrade_1"/></td>    
  </tr>

  <tr id="ComorbidityRow_Hypertension" runat="server" > 
    <td height="28" class="ClinicalEformGridColumnOne">
	
	<euc:EformTextBox Runat="server" RecordId="2"  ID="ComorbDateText_2" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"   />
	<euc:EformHidden RecordId="2" Runat="server" ID="ComorbDate_2" Table="Comorbidities" Field="ComorbDate" />	</td>
    <td><euc:EformCheckbox TABLE="Comorbidities" FIELD="Comorbidity" Runat="server" ID="Comorbidity_Hypertension" Value="Hypertension" RecordId="2" />
      Hypertension</td>
    <td align="center"><euc:EformComboBox RecordId="2" style="width:100px;" TABLE="Comorbidities" FIELD="ComorbGrade" LookupCode="ComorbSeverity" Runat="server" ID="ComorbGrade_2"/></td>    
  </tr>
  
  <tr id="ComorbidityRow_Diabetes" runat="server" > 
    <td height="28" class="ClinicalEformGridColumnOne">
	
	<euc:EformTextBox Runat="server" RecordId="3"  ID="ComorbDateText_3" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"   />
	<euc:EformHidden RecordId="3" Runat="server" ID="ComorbDate_3" Table="Comorbidities" Field="ComorbDate" />	</td>
    <td><euc:EformCheckbox TABLE="Comorbidities" FIELD="Comorbidity" Runat="server" ID="Comorbidity_DM" Value="Diabetes" RecordId="3" />
      Diabetes Mellitus</td>
    <td align="center"><euc:EformComboBox RecordId="3" style="width:100px;" TABLE="Comorbidities" FIELD="ComorbGrade" LookupCode="ComorbSeverity" Runat="server" ID="ComorbGrade_3"/></td>
  </tr>
  <tr id="ComorbidityRow_COPD" runat="server" > 
    <td height="28" class="ClinicalEformGridColumnOne">
	
	<euc:EformTextBox Runat="server" RecordId="4"  ID="ComorbDateText_4" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"   />
	<euc:EformHidden RecordId="4" Runat="server" ID="ComorbDate_4" Table="Comorbidities" Field="ComorbDate" />	</td>
    <td><euc:EformCheckbox TABLE="Comorbidities" FIELD="Comorbidity" Runat="server" ID="Comorbidity_COPD" Value="Chronic Obstructive Pulmonary Disease" RecordId="4" />
      Chronic Obstructive Pulmonary Disease</td>
    <td align="center"><euc:EformComboBox RecordId="4" style="width:100px;" TABLE="Comorbidities" FIELD="ComorbGrade" LookupCode="ComorbSeverity" Runat="server" ID="ComorbGrade_4"/></td>
  </tr>
  
  
  <tr id="ComorbidityRow_Hypercholesterolemia" runat="server" > 
    <td height="28" class="ClinicalEformGridColumnOne">

    <euc:EformTextBox RecordId="5" Runat="server" ID="ComorbDateText_5" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"   />
	<euc:EformHidden RecordId="5" Runat="server" ID="ComorbDate_5" Table="Comorbidities" Field="ComorbDate" />	</td>    
    <td><euc:EformCheckbox TABLE="Comorbidities" FIELD="Comorbidity" Runat="server" ID="Comorbidity_Hypercholesterolemia" Value="Hypercholesterolemia" RecordId="5" /> Hypercholesterolemia</td>
    <td align="center"><euc:EformComboBox RecordId="5" Runat="server" ID="ComorbGrade_5" style="width:100px;" TABLE="Comorbidities" FIELD="ComorbGrade" LookupCode="ComorbSeverity" /></td>    
    <td><euc:EformDeleteIcon ID="EformDeleteIcon_5" runat="server"/></td>
  </tr>

  <tr id="ComorbidityRow_Hyperlipidemia" runat="server" > 
    <td height="28" class="ClinicalEformGridColumnOne">

    <euc:EformTextBox RecordId="6" Runat="server" ID="ComorbDateText_6" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"   />
	<euc:EformHidden RecordId="6" Runat="server" ID="ComorbDate_6" Table="Comorbidities" Field="ComorbDate" />	</td>    
    <td><euc:EformCheckbox TABLE="Comorbidities" FIELD="Comorbidity" Runat="server" ID="Comorbidity_Hyperlipidemia" Value="Hyperlipidemia" RecordId="6" /> Hyperlipidemia</td>
    <td align="center"><euc:EformComboBox RecordId="6" Runat="server" ID="ComorbGrade_6" style="width:100px;" TABLE="Comorbidities" FIELD="ComorbGrade" LookupCode="ComorbSeverity" /></td>    
    <td><euc:EformDeleteIcon ID="EformDeleteIcon_6" runat="server"/></td>
  </tr>

  <tr > 
    <td height="28" class="ClinicalEformGridColumnOne">

    <euc:EformTextBox RecordId="7" Runat="server" ID="ComorbDateText_7" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"   />
	<euc:EformHidden RecordId="7" Runat="server" ID="ComorbDate_7" Table="Comorbidities" Field="ComorbDate" />	</td>    
    <td><euc:EformComboBox RecordId="7" Runat="server" ID="Comorbidity_7" Width="200px" LookupCode="Comorbidity" Field="Comorbidity" Table="Comorbidities" /></td>
    <td align="center"><euc:EformComboBox RecordId="7" Runat="server" ID="ComorbGrade_7" style="width:100px;" TABLE="Comorbidities" FIELD="ComorbGrade" LookupCode="ComorbSeverity" /></td>    
    <td><euc:EformDeleteIcon ID="EformDeleteIcon_7" runat="server"/></td>
  </tr>

  <tr > 
    <td height="28" class="ClinicalEformGridColumnOne">

    <euc:EformTextBox RecordId="8" Runat="server" ID="ComorbDateText_8" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"   />
	<euc:EformHidden RecordId="8" Runat="server" ID="ComorbDate_8" Table="Comorbidities" Field="ComorbDate" />	</td>    
    <td><euc:EformComboBox RecordId="8" Runat="server" ID="Comorbidity_8" Width="200px" LookupCode="Comorbidity" Field="Comorbidity" Table="Comorbidities" /></td>
    <td align="center"><euc:EformComboBox RecordId="8" Runat="server" ID="ComorbGrade_8" style="width:100px;" TABLE="Comorbidities" FIELD="ComorbGrade" LookupCode="ComorbSeverity" /></td>    
    <td><euc:EformDeleteIcon ID="EformDeleteIcon_8" runat="server"/></td>
  </tr>

  <tr style="display: none; "> 
    <td height="28" class="ClinicalEformGridColumnOne">

    <euc:EformTextBox RecordId="9" Runat="server" ID="ComorbDateText_9" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"   />
	<euc:EformHidden RecordId="9" Runat="server" ID="ComorbDate_9" Table="Comorbidities" Field="ComorbDate" />	</td>    
    <td><euc:EformComboBox RecordId="9" Runat="server" ID="Comorbidity_9" Width="200px" LookupCode="Comorbidity" Field="Comorbidity" Table="Comorbidities" /></td>
    <td align="center"><euc:EformComboBox RecordId="9" Runat="server" ID="ComorbGrade_9" style="width:100px;" TABLE="Comorbidities" FIELD="ComorbGrade" LookupCode="ComorbSeverity" /></td>    
    <td><euc:EformDeleteIcon ID="EformDeleteIcon_9" runat="server"/></td>
  </tr>
</table>
<img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'ComorbiditiesHtmlTable');" />
<br/><br/><br/>