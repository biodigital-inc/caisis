<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Prostate.Eforms.BiopsyOfProstateAntibiotics" CodeFile="BiopsyOfProstateAntibiotics.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<script type="" language="javascript" >
    tableArray.AntibioticsHtmlTable = "AntibioticsHtmlTable";
</script>

<a name="BiopsyOfProstateAntibiotics" id="BiopsyOfProstateAntibiotics" />
<span class="controlBoxTitle ">&nbsp;Antibiotics Taken Prior to Biopsy</span><br />
<table width="650" border="0" cellpadding="0" cellspacing="0" class="controlBoxDataGridTable" id="AntibioticsHtmlTable" style="margin-bottom: 0px; border: solid 1px #cccccc;">
    <tr> 
      <td width="0.3%" valign="top" class="controlBoxDataGridFirstColumn"><img src="../../../Images/EFormControlTopLeft.gif" width="2" height="2" /></td>
      <td width="20%" class="controlBoxDataGridHeaderFirstCol" style="font-size:10px;">Agent</td>
      <td width="0.3%" class="controlBoxDataGridHeader" style="font-size:10px;"><img src="../../../Images/shim.gif" width="10" height="1" /></td>
      <td width="10%" class="controlBoxDataGridHeader" style="font-size:10px;">Dose</td>
      <td width="0.3%" class="controlBoxDataGridHeader">&nbsp;</td>
      <td width="10%" class="controlBoxDataGridHeader" style="font-size:10px;">Unit</td>
      <td width="1%" class="controlBoxDataGridHeader"><img src="../../../Images/shim.gif" width="10" height="1" /></td>
      <td width="15%" class="controlBoxDataGridHeader" style="font-size:10px;">Route</td>
      <td width="0.3%" class="controlBoxDataGridHeader">&nbsp;</td>
      <td width="15%" class="controlBoxDataGridHeader" style="font-size:10px;">Start Date</td>
      <td width="15%" class="controlBoxDataGridHeader" style="font-size:10px;">Stop Date</td>
      <td width="0.2%" align="right" valign="top" class="controlBox">&nbsp;<img src="../../../Images/EFormControlTopRight.gif" width="2" height="2" /></td>
    </tr>
    
    <tr>
      <td class="controlBoxDataGridFirstColumn"><img src="../../../Images/shim.gif" width="1" height="1" /></td>
      <td height="35"  class="controlBoxDataGridFirstColumn"><euc:EformCheckBox runat="server" Field="Medication" RecordId="21" Table="Medications" id="Medication_21" Value="Ciprofloxin" EnableHiddenOnUIEvent="MedType_21,MedDate_21,MedDateText_21,MedStopDate_21,MedStopDateText_21,MedDose_21,MedUnits_21,MedRoute_21,MedDataSource_21,MedQuality_21"/> Ciprofloxin 
      <euc:EformHidden id="MedType_21" runat="server" RecordId="21" Table="Medications" Field="MedType" Value="Antibiotic" Enabled="false"/>
      <euc:EformHidden id="MedDose_21" runat="server" RecordId="21" Table="Medications" Field="MedDose" Value="500" Enabled="false" />
      <euc:EformHidden id="MedUnits_21" Table="Medications" Field="MedUnits" RecordId="21" runat="server" Value="mg" Enabled="false" />
	  <euc:EformHidden id="MedRoute_21" Table="Medications" Field="MedRoute"  RecordId="21" runat="server" Value="Orally" Enabled="false" />
	  <euc:EformHidden id="MedDataSource_21" runat="server" RecordId="21" Table="Medications" Field="MedDataSource" Value="EForm" Enabled="false" />
      <euc:EformHidden id="MedQuality_21" runat="server" RecordId="21" Table="Medications" Field="MedQuality"  Value="STD"  Enabled="false" />
	  </td>
      <td>&nbsp;</td>
      <td height="35" align="center"> 500</td>
      <td>&nbsp;</td>
      <td height="35" align="center"> mg</td>
      <td>&nbsp;</td>
      <td height="35" align="center"> Orally</td>
      <td>&nbsp;</td>
      <td align="center">
	   <euc:EformTextBox Runat="server" RecordId="21"  ID="MedDateText_21" TABLE="Medications" FIELD="MedDateText" style="width:70px;"  ShowCalendar="True" CalcDate="True" />
	   <euc:EformHidden id="MedDate_21" runat="server" RecordId="21" Table="Medications" Field="MedDate" />
	  </td>
      <td align="center">
	   <euc:EformTextBox Runat="server" RecordId="21"  ID="MedStopDateText_21" TABLE="Medications" FIELD="MedStopDateText" style="width:70px;"  ShowCalendar="True" CalcDate="True" />
	   <euc:EformHidden id="MedStopDate_21" runat="server" RecordId="21" Table="Medications" Field="MedStopDate" />
	  </td>       
	  <td>&nbsp;</td>
    </tr>
    
    <tr>
      <td class="controlBoxDataGridFirstColumn"><img src="../../../Images/shim.gif" width="1" height="1" /></td>
      <td height="35"  class="controlBoxDataGridFirstColumn"><euc:EformComboBox runat="server" Field="Medication" RecordId="22" Table="Medications" id="Medication_22" LookupCode="Medication,PercentUsage,Top80" style="width:100;" EnableHiddenOnUIEvent="MedType_22,MedDate_22,MedDateText_22,MedStopDate_22,MedStopDateText_22,MedRoute_22,MedDataSource_22,MedQuality_22"/>  
      <euc:EformHidden id="MedType_22" runat="server" RecordId="22" Table="Medications" Field="MedType" Value="Antibiotic" Enabled="false"/>
	  <euc:EformHidden id="MedRoute_22" Table="Medications" Field="MedRoute"  RecordId="22" runat="server" Value="IV" Enabled="false"/>
	  <euc:EformHidden id="MedDataSource_22" runat="server" RecordId="22" Table="Medications" Field="MedDataSource" Value="EForm" Enabled="false" />
      <euc:EformHidden id="MedQuality_22" runat="server" RecordId="22" Table="Medications" Field="MedQuality"  Value="STD"  Enabled="false" />
      </td>
      <td>&nbsp;</td>
      <td height="35" align="center"><euc:EformTextBox RecordId="22" style="width:60px;" TABLE="Medications" FIELD="MedDose" Runat="server" ID="MedDose_22"/></td>
      <td>&nbsp;</td>
      <td height="35" align="center"><euc:EformSelect RecordId="22" LookupCode="MedUnits" style="width:80;" TABLE="Medications" FIELD="MedUnits" Runat="server" ID="MedUnits_22"/></td>
      <td>&nbsp;</td>
      <td height="35" align="center"> IV</td>
      <td>&nbsp;</td>
      <td align="center">
	   <euc:EformTextBox Runat="server" RecordId="22"  ID="MedDateText_22" TABLE="Medications" FIELD="MedDateText" style="width:70px;"  ShowCalendar="True" CalcDate="True" />
	   <euc:EformHidden id="MedDate_22" runat="server" RecordId="22" Table="Medications" Field="MedDate" />
	  </td>
      <td align="center">
	   <euc:EformTextBox Runat="server" RecordId="22"  ID="MedStopDateText_22" TABLE="Medications" FIELD="MedStopDateText" style="width:70px;"  ShowCalendar="True" CalcDate="True" />
	   <euc:EformHidden id="MedStopDate_22" runat="server" RecordId="22" Table="Medications" Field="MedStopDate" />
	  </td>       
	  <td>&nbsp;</td>
    </tr>
    
    <tr>
      <td class="controlBoxDataGridFirstColumn"><img src="../../../Images/shim.gif" width="1" height="1" /></td>
      <td height="35"  class="controlBoxDataGridFirstColumn"><euc:EformComboBox runat="server" Field="Medication" RecordId="23" Table="Medications" id="Medicaion_23" LookupCode="Medication,PercentUsage,Top80" style="width:100;" EnableHiddenOnUIEvent="MedType_23,MedDate_23,MedDateText_23,MedStopDate_23,MedStopDateText_23,MedDataSource_23,MedQuality_23"/>  
      <euc:EformHidden id="MedType_23" runat="server" RecordId="23" Table="Medications" Field="MedType" Value="Antibiotic" Enabled="false"/>
	  <euc:EformHidden id="MedDataSource_23" runat="server" RecordId="23" Table="Medications" Field="MedDataSource" Value="EForm" Enabled="false" />
      <euc:EformHidden id="MedQuality_23" runat="server" RecordId="23" Table="Medications" Field="MedQuality"  Value="STD"  Enabled="false" />
      </td>
      <td>&nbsp;</td>
      <td height="35" align="center"><euc:EformTextBox RecordId="23" style="width:60px;" TABLE="Medications" FIELD="MedDose" Runat="server" ID="MedDose_23"/></td>
      <td>&nbsp;</td>
      <td height="35" align="center"><euc:EformSelect RecordId="23" LookupCode="MedUnits" style="width:80;" TABLE="Medications" FIELD="MedUnits" Runat="server" ID="MedUnits_23"/></td>
      <td>&nbsp;</td>
      <td height="35" align="center"><euc:EformSelect RecordId="23" LookupCode="MedRoute" style="width:60;" TABLE="Medications" FIELD="MedRoute" Runat="server" ID="MedRoute_23"/></td>
      <td>&nbsp;</td>
      <td align="center">
	   <euc:EformTextBox Runat="server" RecordId="23"  ID="MedDateText_23" TABLE="Medications" FIELD="MedDateText" style="width:70px;"  ShowCalendar="True" CalcDate="True" />
	   <euc:EformHidden id="MedDate_23" runat="server" RecordId="23" Table="Medications" Field="MedDate" />
	  </td>
      <td align="center">
	   <euc:EformTextBox Runat="server" RecordId="23"  ID="MedStopDateText_23" TABLE="Medications" FIELD="MedStopDateText" style="width:70px;"  ShowCalendar="True" CalcDate="True" />
	   <euc:EformHidden id="MedStopDate_23" runat="server" RecordId="23" Table="Medications" Field="MedStopDate" />
	  </td>       
	  <td>&nbsp;</td>
    </tr>
    
     <tr style="display: none;">
      <td class="controlBoxDataGridFirstColumn"><img src="../../../Images/shim.gif" width="1" height="1" /></td>
      <td height="35"  class="controlBoxDataGridFirstColumn"><euc:EformComboBox runat="server" Field="Medication" RecordId="24" Table="Medications" id="Medication_24" LookupCode="Medication,PercentUsage,Top80" style="width:100;" EnableHiddenOnUIEvent="MedType_24,MedDate_24,MedDateText_24,MedStopDate_24,MedStopDateText_24,MedDataSource_24,MedQuality_24"/>  
      <euc:EformHidden id="MedType_24" runat="server" RecordId="24" Table="Medications" Field="MedType" Value="Antibiotic" Enabled="false"/>
	  <euc:EformHidden id="MedDataSource_24" runat="server" RecordId="24" Table="Medications" Field="MedDataSource" Value="EForm" Enabled="false" />
      <euc:EformHidden id="MedQuality_24" runat="server" RecordId="24" Table="Medications" Field="MedQuality"  Value="STD"  Enabled="false" />
      </td>
      <td>&nbsp;</td>
      <td height="35" align="center"><euc:EformTextBox RecordId="24" style="width:60px;" TABLE="Medications" FIELD="MedDose" Runat="server" ID="MedDose_24"/></td>
      <td>&nbsp;</td>
      <td height="35" align="center"><euc:EformSelect RecordId="24" LookupCode="MedUnits" style="width:80;" TABLE="Medications" FIELD="MedUnits" Runat="server" ID="MedUnits_24"/></td>
      <td>&nbsp;</td>
      <td height="35" align="center"><euc:EformSelect RecordId="24" LookupCode="MedRoute" style="width:60;" TABLE="Medications" FIELD="MedRoute" Runat="server" ID="MedRoute_24"/></td>
      <td>&nbsp;</td>
      <td align="center">
	   <euc:EformTextBox Runat="server" RecordId="24"  ID="MedDateText_24" TABLE="Medications" FIELD="MedDateText" style="width:70px;"  ShowCalendar="True" CalcDate="True" />
	   <euc:EformHidden id="MedDate_24" runat="server" RecordId="24" Table="Medications" Field="MedDate" />
	  </td>
      <td align="center">
	   <euc:EformTextBox Runat="server" RecordId="24"  ID="MedStopDateText_24" TABLE="Medications" FIELD="MedStopDateText" style="width:70px;"  ShowCalendar="True" CalcDate="True" />
	   <euc:EformHidden id="MedStopDate_24" runat="server" RecordId="24" Table="Medications" Field="MedStopDate" />
	  </td>       
	  <td>&nbsp;</td>
    </tr>
     
    <tr style="display: none;">
      <td class="controlBoxDataGridFirstColumn"><img src="../../../Images/shim.gif" width="1" height="1" /></td>
      <td height="35"  class="controlBoxDataGridFirstColumn"><euc:EformComboBox runat="server" Field="Medication" RecordId="25" Table="Medications" id="Medication_25" LookupCode="Medication,PercentUsage,Top80" style="width:100;" EnableHiddenOnUIEvent="MedType_25,MedDate_25,MedDateText_25,MedStopDate_25,MedStopDateText_25,MedDataSource_25,MedQuality_25"/>  
      <euc:EformHidden id="MedType_25" runat="server" RecordId="25" Table="Medications" Field="MedType" Value="Antibiotic" Enabled="false"/>
	  <euc:EformHidden id="MedDataSource_25" runat="server" RecordId="25" Table="Medications" Field="MedDataSource" Value="EForm" Enabled="false" />
      <euc:EformHidden id="MedQuality_25" runat="server" RecordId="25" Table="Medications" Field="MedQuality"  Value="STD"  Enabled="false" />
      </td>
      <td>&nbsp;</td>
      <td height="35" align="center"><euc:EformTextBox RecordId="25" style="width:60px;" TABLE="Medications" FIELD="MedDose" Runat="server" ID="MedDose_25"/></td>
      <td>&nbsp;</td>
      <td height="35" align="center"><euc:EformSelect RecordId="25" LookupCode="MedUnits" style="width:80;" TABLE="Medications" FIELD="MedUnits" Runat="server" ID="MedUnits_25"/></td>
      <td>&nbsp;</td>
      <td height="35" align="center"><euc:EformSelect RecordId="25" LookupCode="MedRoute" style="width:60;" TABLE="Medications" FIELD="MedRoute" Runat="server" ID="MedRoute_25"/></td>
      <td>&nbsp;</td>
      <td align="center">
	   <euc:EformTextBox Runat="server" RecordId="25"  ID="MedDateText_25" TABLE="Medications" FIELD="MedDateText" style="width:70px;"  ShowCalendar="True" CalcDate="True" />
	   <euc:EformHidden id="MedDate_25" runat="server" RecordId="25" Table="Medications" Field="MedDate" />
	  </td>
      <td align="center">
	   <euc:EformTextBox Runat="server" RecordId="25"  ID="MedStopDateText_25" TABLE="Medications" FIELD="MedStopDateText" style="width:70px;"  ShowCalendar="True" CalcDate="True" />
	   <euc:EformHidden id="MedStopDate_25" runat="server" RecordId="25" Table="Medications" Field="MedStopDate" />
	  </td>       
	  <td>&nbsp;</td>
    </tr>
    
</table><img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" onclick="return showFirstAdditionalRow(this,'AntibioticsHtmlTable');" style="margin-left: 6px;" /><br/>  
<br /><br />
