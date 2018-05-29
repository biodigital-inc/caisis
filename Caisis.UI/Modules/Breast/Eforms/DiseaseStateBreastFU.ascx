<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Breast.Eforms.DiseaseStateBreastFU" CodeFile="DiseaseStateBreastFU.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css" />

<a name="DiseaseStateBreastFU" /><br/>
<table width="650" cellpadding="6" cellspacing="0" class="eformLargePopulatedTable" id="BreastCosmesisTbl">
  <tr>
    <td valign="top" align="left"><strong>Cosmesis</strong></td>
    <td align="left" colspan="2" id="CosmesisTd"><euc:EformRadioButtonList RecordId="2" TABLE="Status" FIELD="Status" Runat="server" ID="Status_2" 
        LookupCode="BreastCosmesis" RepeatLayout="Table" RepeatDirection="Horizontal"/>
        <euc:EformTextBox RecordId="2" TABLE="Status" FIELD="StatusDisease" Runat="server" ID="StatusDisease_2" style="width:1px; display:none"/>
        <euc:EformTextBox RecordId="2" TABLE="Status" FIELD="StatusQuality" Runat="server" ID="StatusQuality_2" style="width:1px;display:none" />
        </td>
    <%--<td><img src="../../Images/EFormDeleteRow.gif" onclick="clearInputFields($('CosmesisTd'));" style="cursor: pointer;" title="Clear Row"/></td>--%>
  </tr>
  
  <%--<tr>
	 <td align="left"><euc:EformTextBox style="width:90px;" RecordId="2" TABLE="Status" FIELD="StatusDateText" Runat="server" ID="StatusDateText_2"/>
		    <euc:EformHidden RecordId="2" TABLE="Status" FIELD="StatusDate" Runat="server" ID="StatusDate_2"/></td>
    <td align="left"><euc:EformTextBox RecordId="2" TABLE="Status" FIELD="StatusDisease" Runat="server" ID="StatusDisease_2" Width="100px"/></td>    
    <td align="left"><euc:EformTextBox RecordId="2" TABLE="Status" FIELD="StatusPhysician" Runat="server" ID="StatusPhysician_2" Width="90px" />
        <euc:EformTextBox RecordId="2" style="width:1px;display:none" TABLE="Status" FIELD="StatusQuality" Runat="server" 
            ID="StatusQuality_2"/></td>
  </tr>--%>
  <tr>
    <td valign="top" align="left"><strong>Disease State</strong></td>
    <td align="left" valign="top" colspan="2" id="DiseaseStTd"><euc:EformRadioButtonList RecordId="3" TABLE="Status" FIELD="Status" Runat="server" 
        ID="Status_3" LookupCode="Status,Disease,Breast" RepeatLayout="Table" RepeatDirection="Horizontal" RepeatColumns="3"/></td>
    <%--<td><img src="../../Images/EFormDeleteRow.gif" onclick="clearInputFields($('DiseaseStTd'));" style="cursor: pointer;" title="Clear Row"/></td>--%>
  </tr>
  <tr><td style="height:10px;"></td></tr>
  <tr>
    <td align="left"><strong>Date </strong><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:90px;" RecordId="3" TABLE="Status" 
        FIELD="StatusDateText" Runat="server" ID="StatusDateText_3"/>
		<euc:EformHidden RecordId="3" TABLE="Status" FIELD="StatusDate" Runat="server" ID="StatusDate_3"/></td>
    <td align="center"><strong>Disease </strong><euc:EformTextBox RecordId="3" TABLE="Status" FIELD="StatusDisease" Runat="server" 
        ID="StatusDisease_3" style="width:100px"/></td>
    <td align="left"><strong>Physician </strong><euc:EformComboBox RecordId="3" TABLE="Status" FIELD="StatusPhysician" Runat="server" 
        ID="StatusPhysician_3" LookupCode="Physician" Width="90px" />        
        <euc:EformTextBox RecordId="3" style="width:1px;display:none" TABLE="Status" FIELD="StatusQuality" Runat="server" ID="StatusQuality_3"/></td>
  </tr>
  <tr>
    <td colspan="3"  valign="middle" style="padding-top:20px;"><strong><asp:Label ID="LastStatus" Runat="server" /></strong>&nbsp;</td>
  </tr>
</table><br /><br />




<script type="text/javascript">
    //Adds events to controls
    function addDiseaseStatusEvents(stDate,stDisease,status,stQlty)
    { 
        $(stDate).addEvent('blur',curry(DiseaseStatusAutoPopulates,stDate,stDisease,status,stQlty));
        $(status).addEvent('click',curry(DiseaseStatusAutoPopulates,stDate,stDisease,status,stQlty));
    }
    
    addDiseaseStatusEvents($('<%= StatusDateText_3.ClientID %>'),$('<%= StatusDisease_3.ClientID %>'),$('<%= Status_3.ClientID %>'),$('<%= StatusQuality_3.ClientID %>'));
    
    function DiseaseStatusAutoPopulates(stDate,stDisease,status,stQlty)
    {
        var status_radio = status.getElementsByTagName("input"); 
        for (var i=0;i<status_radio.length;i++) 
        { 
           if(status_radio[i].value != '' || stDate.value != '')
           {
            stDisease.value = 'Breast Cancer';
            stQlty.value = 'STD';
           }
           else if(status_radio[i].value == '' && stDate.value == '')
           {
            stDisease.value = '';
            stQlty.value = '';
           }
        }
    }    
    
    function addCosmosisStatusEvents(CosmosisDisease,Cosmosisstatus,CosmosisQlty)
    { 
        $(Cosmosisstatus).addEvent('click',curry(CosmosisAutoPopulates,CosmosisDisease,Cosmosisstatus,CosmosisQlty));
    }
    
    addCosmosisStatusEvents($('<%= StatusDisease_2.ClientID %>'),$('<%= Status_2.ClientID %>'),$('<%= StatusQuality_2.ClientID %>'));
    
    function CosmosisAutoPopulates(CosmosisDisease,Cosmosisstatus,CosmosisQlty)
    {
        var Cosmosisstatus_radio = Cosmosisstatus.getElementsByTagName("input"); 
        for (var i=0;i<Cosmosisstatus_radio.length;i++) 
        { 
           if(Cosmosisstatus_radio[i].value != '')
           {
            CosmosisDisease.value = 'Breast Cancer';
            CosmosisQlty.value = 'STD';
           }
           else if(Cosmosisstatus_radio[i].value == '')
           {
            CosmosisDisease.value = '';
            CosmosisQlty.value = '';
           }
        }
    }    
</script>