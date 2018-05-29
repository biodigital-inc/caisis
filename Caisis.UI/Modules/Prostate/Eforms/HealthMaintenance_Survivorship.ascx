<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Prostate.Eforms.HealthMaintenance_Survivorship" CodeFile="HealthMaintenance_Survivorship.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>



<a name="HealthMaintenance_Survivorship" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Health Maintenance" style="margin-right: 40px;"></asp:Label><br/>
<table width="675" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="HealthMaintenanceHtmlTable">
  <tr> 
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Test</td>
    <td width="12%" class="controlBoxDataGridHeaderFirstCol">&nbsp;Date</td>
    <td width="60%" class="controlBoxDataGridHeaderFirstCol">Results</td>
    <td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
  </tr>
  
  
  
  

  <tr >
    <td style="white-space: nowrap;"><euc:EformDefaultLabel ID="DxType_11" runat="server" DefaultField="Diagnostics.DxType,11" /></td>
    <td height="28" class="ClinicalEformGridColumnOne">
		<euc:EformTextBox Runat="server" RecordId="11"  ID="DxDateText_11" TABLE="Diagnostics" FIELD="DxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"  />
        <euc:EformHidden RecordId="11" Runat="server" ID="DxDate_11" Table="Diagnostics" Field="DxDate"></euc:EformHidden>
    </td> 
    <td align="left" style="white-space: nowrap;">
		<euc:EformComboBox DropDownWidth="auto"   LookupCode="DxResult" style="width:350px;" Field="DxResult" RecordId="11" Table="Diagnostics" Runat="server" id="DxResult_11"  />
	</td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
    <tr >
    <td style="white-space: nowrap;"><euc:EformDefaultLabel ID="DxType_12" runat="server" DefaultField="Diagnostics.DxType,12" /></td>
    <td height="28" class="ClinicalEformGridColumnOne">
		<euc:EformTextBox Runat="server" RecordId="12"  ID="DxDateText_12" TABLE="Diagnostics" FIELD="DxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"   />
        <euc:EformHidden RecordId="12" Runat="server" ID="DxDate_12" Table="Diagnostics" Field="DxDate"></euc:EformHidden>
    </td> 
    <td align="left" style="white-space: nowrap;">
		<euc:EformComboBox DropDownWidth="auto"   LookupCode="DxResult" style="width:350px;" Field="DxResult" RecordId="12" Table="Diagnostics" Runat="server" id="DxResult_12"  />
	</td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
    <tr >
    <td style="white-space: nowrap;"><euc:EformDefaultLabel ID="DxType_13" runat="server" DefaultField="Diagnostics.DxType,13" /></td>
    <td height="28" class="ClinicalEformGridColumnOne">
		<euc:EformTextBox Runat="server" RecordId="13"  ID="DxDateText_13" TABLE="Diagnostics" FIELD="DxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"   />
        <euc:EformHidden RecordId="13" Runat="server" ID="DxDate_13" Table="Diagnostics" Field="DxDate"></euc:EformHidden>
    </td> 
    <td align="left" style="white-space: nowrap;">
		<euc:EformComboBox DropDownWidth="auto"   LookupCode="DxResult" style="width:350px;" Field="DxResult" RecordId="13" Table="Diagnostics" Runat="server" id="DxResult_13"  />
	</td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
    <tr >
    <td style="white-space: nowrap;"><euc:EformDefaultLabel ID="DxType_14" runat="server" DefaultField="Diagnostics.DxType,14" /></td>
    <td height="28" class="ClinicalEformGridColumnOne">
		<euc:EformTextBox Runat="server" RecordId="14"  ID="DxDateText_14" TABLE="Diagnostics" FIELD="DxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"   />
        <euc:EformHidden RecordId="14" Runat="server" ID="DxDate_14" Table="Diagnostics" Field="DxDate"></euc:EformHidden>
    </td> 
    <td align="left" style="white-space: nowrap;">
		<euc:EformComboBox DropDownWidth="auto"   LookupCode="DxResult" style="width:350px;" Field="DxResult" RecordId="14" Table="Diagnostics" Runat="server" id="DxResult_14"  />
	</td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>

    <tr >
    <td style="white-space: nowrap;">Cholesterol</td>
    <td height="28" class="ClinicalEformGridColumnOne">
		<euc:EformTextBox Runat="server" ID="HealthMaintenanceCholesterolDateText" TABLE="NoTable" FIELD="HealthMaintenanceCholesterolDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"   />
        <euc:EformHidden Runat="server" ID="HealthMaintenanceCholesterolDate" Table="NoTable" Field="HealthMaintenanceCholesterolDate"></euc:EformHidden>
    </td> 
    <td align="left" style="white-space: nowrap;">
		<euc:EformTextBox style="width:350px;" Field="HealthMaintenanceCholesterolResult" Table="NoTable" Runat="server" id="HealthMaintenanceCholesterolResult"  />
	</td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  
    <tr >
    <td style="white-space: nowrap;">PSA</td>
    <td height="28" class="ClinicalEformGridColumnOne">
		<euc:EformTextBox Runat="server" ID="HealthMaintenancePSADateText" TABLE="NoTable" FIELD="HealthMaintenancePSADateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"   />
        <euc:EformHidden Runat="server" ID="HealthMaintenancePSADate" Table="NoTable" Field="HealthMaintenancePSADate"></euc:EformHidden>
    </td> 
    <td align="left" style="white-space: nowrap;">
		<euc:EformTextBox style="width:350px;" Field="HealthMaintenancePSAResult" Table="NoTable" Runat="server" id="HealthMaintenancePSAResult"  />
	</td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
    <tr >
    <td style="white-space: nowrap;">Flu Vaccine</td>
    <td height="28" class="ClinicalEformGridColumnOne">
		<euc:EformTextBox Runat="server" ID="HealthMaintenanceFluVaccineDateText" TABLE="NoTable" FIELD="HealthMaintenanceFluVaccineDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"   />
        <euc:EformHidden Runat="server" ID="HealthMaintenanceFluVaccineDate" Table="NoTable" Field="HealthMaintenanceFluVaccineDate"></euc:EformHidden>
    </td> 
    <td align="left" style="white-space: nowrap;">
		<euc:EformTextBox style="width:350px;" Field="HealthMaintenanceFluVaccineResult" Table="NoTable" Runat="server" id="HealthMaintenanceFluVaccineResult"  />
	</td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  
    <tr >
    <td style="white-space: nowrap;">Pneumovax</td>
    <td height="28" class="ClinicalEformGridColumnOne">
		<euc:EformTextBox Runat="server" ID="HealthMaintenancePneumovaxDateText" TABLE="NoTable" FIELD="HealthMaintenancePneumovaxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"   />
        <euc:EformHidden Runat="server" ID="HealthMaintenancePneumovaxDate" Table="NoTable" Field="HealthMaintenancePneumovaxDate"></euc:EformHidden>
    </td> 
    <td align="left" style="white-space: nowrap;">
		<euc:EformTextBox style="width:350px;" Field="HealthMaintenancePneumovaxResult" Table="NoTable" Runat="server" id="HealthMaintenancePneumovaxResult"  />
	</td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>

    <tr >
    <td style="white-space: nowrap;">Shingles Vaccine</td>
    <td height="28" class="ClinicalEformGridColumnOne">
		<euc:EformTextBox Runat="server" ID="HealthMaintenanceShinglesVaccineDateText" TABLE="NoTable" FIELD="HealthMaintenanceShinglesVaccineDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"   />
        <euc:EformHidden Runat="server" ID="HealthMaintenanceShinglesVaccineDate" Table="NoTable" Field="HealthMaintenanceShinglesVaccineDate"></euc:EformHidden>
    </td> 
    <td align="left" style="white-space: nowrap;">
		<euc:EformTextBox style="width:350px;" Field="HealthMaintenanceShinglesVaccineResult" Table="NoTable" Runat="server" id="HealthMaintenanceShinglesVaccineResult"  />
	</td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>

    <tr >
    <td style="white-space: nowrap;">Tdap Vaccine</td>
    <td height="28" class="ClinicalEformGridColumnOne">
		<euc:EformTextBox Runat="server" ID="HealthMaintenanceTdapVaccineDateText" TABLE="NoTable" FIELD="HealthMaintenanceTdapVaccineDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"   />
        <euc:EformHidden Runat="server" ID="HealthMaintenanceTdapVaccineDate" Table="NoTable" Field="HealthMaintenanceTdapVaccineDate"></euc:EformHidden>
    </td> 
    <td align="left" style="white-space: nowrap;">
		<euc:EformTextBox style="width:350px;" Field="HealthMaintenanceTdapVaccineResult" Table="NoTable" Runat="server" id="HealthMaintenanceTdapVaccineResult"  />
	</td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>


</table>
<br/><br/>
<br/>