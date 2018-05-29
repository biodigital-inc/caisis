<%@ Control Language="C#" Inherits="Caisis.UI.Modules.Thoracic.Eforms.PulmonaryThoracic" CodeFile="PulmonaryThoracic.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<script language="javascript" type="text/javascript">
</script>

<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>

<a name="PulmonaryThoracic" /><span class="controlBoxTitle">Pulmonary Test</span> <br/>

<table width="400" cellpadding="5" cellspacing="0" class="eformLargePopulatedTable" id="DxPulmonaryTbl">
    <tr>
        <td>
            <table width="400" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="ParentDxTbl">
              <tr>
		            <td  class="controlBoxDataGridTitleColumn">Date</td>
		            <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Disease</td>
		            <td  class="controlBoxDataGridTitleColumn">&nbsp;</td>
              </tr>
              
              <tr>
	             <td><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:100px;" RecordId="5" TABLE="Diagnostics" FIELD="DxDateText" 
	                Runat="server" ID="DxDateText_5"/>
		                <euc:EformHidden RecordId="5" TABLE="Diagnostics" FIELD="DxDate" Runat="server" ID="DxDate_5"/>
	            </td>
                <td align="center"><euc:EformComboBox RecordId="5" TABLE="Diagnostics" FIELD="DxDisease" Runat="server" ID="DxDisease_5" 
                    LookupCode="Disease" Width="100px" />
                    <euc:EformTextBox RecordId="5" style="width:1px;display:none" TABLE="Diagnostics" FIELD="DxType" Runat="server" ID="DxType_5"/>
                    <euc:EformTextBox RecordId="5" style="width:1px;display:none" TABLE="Diagnostics" FIELD="DxQuality" Runat="server" ID="DxQuality_5"/></td>
	            <td><euc:EformDeleteIcon ID="EformDeleteIcon1" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
              </tr>
            </table><br />
        </td>
    </tr>
    
    <tr>
        <td>
            <table width="650" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="pulmonaryTbl">
              <tr>
	            <td  class="controlBoxDataGridTitleColumn">FEV1 (L)</td>
	            <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">FEV1 (%)</td>
	            <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Diffusion (%)</td>
	            <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">RA O2 Sat</td>
	            <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">%V (aff)</td>
	            <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">%Q (aff)</td>
	            <td  class="controlBoxDataGridTitleColumn">&nbsp;</td>
              </tr>
              <tr>
                <td><euc:EformTextBox RecordId="1" Width="80px" TABLE="DxPulmonaryTest" FIELD="DxFev1L" Runat="server" 
                    ID="DxFev1L_1"/></td>
                <td align="center"><euc:EformTextBox RecordId="1" Width="80px" TABLE="DxPulmonaryTest" FIELD="DxPercFev1" Runat="server" 
                    ID="DxPercFev1_1"/></td>
                <td align="center"><euc:EformTextBox RecordId="1" Width="80px" TABLE="DxPulmonaryTest" FIELD="DxPercDLCO" Runat="server" 
                    ID="DxPercDLCO_1"/></td>
                <td align="center"><euc:EformTextBox RecordId="1" Width="80px" TABLE="DxPulmonaryTest" FIELD="DxPercRA_Sat" Runat="server" 
                    ID="DxPercRA_Sat_1"/></td>
                <td align="center"><euc:EformTextBox RecordId="1" Width="80px" TABLE="DxPulmonaryTest" FIELD="DxPercVentilated" Runat="server" 
                    ID="DxPercVentilated_1"/></td>
                <td align="center"><euc:EformTextBox RecordId="1" Width="80px" TABLE="DxPulmonaryTest" FIELD="DxPercQ_Perfusion" Runat="server" 
                    ID="DxPercQ_Perfusion_1"/></td>
	            <td><euc:EformDeleteIcon ID="EformDeleteIcon2" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
              </tr>
            </table>
        </td>
    </tr>
    
</table><br /><br />


<script type="text/javascript">
    //Adds events to controls
    function addDxEvents(dxDate,dxDisease,dxType,dxQlty)
    { 
        $(dxDate).addEvent('blur',curry(DxAutoPopulates,dxDate,dxDisease,dxType,dxQlty));
    }
 
    addDxEvents($('<%= DxDateText_5.ClientID %>'),$('<%= DxDisease_5.ClientID %>'),$('<%= DxType_5.ClientID %>'),$('<%= DxQuality_5.ClientID %>'));

    function DxAutoPopulates(dxDate,dxDisease,dxType,dxQlty)
    {
       if (dxDate.value != '')
        {
           dxType.value = 'Pulmonary Functions'; 
           dxDisease.value = 'Lung Cancer'
           dxQlty.value = 'STD';
        }
        else
        {
            dxType.value = '';
            dxDisease.value = '';
            dxQlty.value = '';
        }
    }
</script>