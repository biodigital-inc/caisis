<%@ Control Language="C#" Inherits="Caisis.UI.Modules.Thoracic.Eforms.ClinStagesThoracic" CodeFile="ClinStagesThoracic.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<script language="javascript" type="text/javascript">
    tableArray.ClinStageTbl="ClinStageTbl";
</script>

<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>

<a name="ClinStagesThoracic" /><span class="controlBoxTitle">Clinical Stages</span> <br/>

<table width="600" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="ClinStageTbl">
  <tr> 
    <td class="controlBoxDataGridHeaderFirstCol">Date</td>
    <td class="controlBoxDataGridHeaderFirstCol">System</td>
    <td class="controlBoxDataGridHeaderFirstCol">T</td>
    <td class="controlBoxDataGridHeaderFirstCol">N</td>
    <td class="controlBoxDataGridHeaderFirstCol">M</td>
    <td class="controlBoxDataGridHeaderFirstCol">Stage</td>
    <td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
  </tr>
  
  <tr>
    <td><euc:EformTextBox RecordId="11" TABLE="ClinicalStages" FIELD="ClinStageDateText" ID="ClinStageDateText_11" Runat="server" 
            Width="80px" ShowCalendar="true" CalcDate="true"/>
        <euc:EformHidden  RecordId="11" TABLE="ClinicalStages" FIELD="ClinStageDate" ID="ClinStageDate_11" Runat="server" /></td>
    <td align="center">
        <euc:EformTextBox RecordId="11" TABLE="ClinicalStages" FIELD="ClinStageDisease" Runat="server" Width="1px" 
                style="display:none" ID="ClinStageDisease_11" />
         <euc:EformDropDownList RecordId="11"  TABLE="ClinicalStages" FIELD="ClinStageSystem" ID="ClinStageSystem_11" 
                LookupCode="StagingSystem,Disease,Thoracic" Runat="server"/></td>
    <td align="center">
        <euc:EformComboBox RecordId="11" ID="ClinStageT_11" runat="server" Table="ClinicalStages" Field="ClinStageT" Width="80px" 
            CascadeValuesBasedOn="$ClinStageDisease_11,$ClinStageSystem_11" CascadeFormatString="StageClin_{0}_{n.1}_T"/></td>  
    <td align="center">
        <euc:EformComboBox RecordId="11" ID="ClinStageN_11" runat="server" Table="ClinicalStages" Field="ClinStageN" Width="80px" 
            CascadeValuesBasedOn="$ClinStageDisease_11,$ClinStageSystem_11" CascadeFormatString="StageClin_{0}_{n.1}_N"/></td>
    <td align="center">
        <euc:EformComboBox RecordId="11" ID="ClinStageM_11" runat="server" Table="ClinicalStages" Field="ClinStageM" Width="80px" 
            CascadeValuesBasedOn="$ClinStageDisease_11,$ClinStageSystem_11" CascadeFormatString="StageClin_{0}_{n.1}_M"/>
        <euc:EformTextBox id="ClinStageQuality_11" RecordId="11" Table="ClinicalStages" Field="ClinStageQuality" runat="server" 
            Width="1px" style="display:none"/></td>
    <td align="center">
        <euc:EformComboBox RecordId="11" ID="ClinStageGroup_11" runat="server" Table="ClinicalStages" Field="ClinStageGroup" 
            Width="100px" CascadeValuesBasedOn="$ClinStageDisease_11,$ClinStageSystem_11" 
            CascadeFormatString="StageClin_{0}_{n.1}_Group"/></td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon11" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>
  
  <tr>
    <td><euc:EformTextBox RecordId="12" TABLE="ClinicalStages" FIELD="ClinStageDateText" ID="ClinStageDateText_12" Runat="server" 
        Width="80px" ShowCalendar="true" CalcDate="true"/>
            <euc:EformHidden  RecordId="12" TABLE="ClinicalStages" FIELD="ClinStageDate" ID="ClinStageDate_12" Runat="server" /></td>
    <td align="center">
        <euc:EformTextBox RecordId="12" TABLE="ClinicalStages" FIELD="ClinStageDisease" Runat="server" Width="1px" 
                style="display:none" ID="ClinStageDisease_12" />
         <euc:EformDropDownList RecordId="12"  TABLE="ClinicalStages" FIELD="ClinStageSystem" ID="ClinStageSystem_12" 
                LookupCode="StagingSystem,Disease,Thoracic" Runat="server"/></td>
    <td align="center">
        <euc:EformComboBox RecordId="12" ID="ClinStageT_12" runat="server" Table="ClinicalStages" Field="ClinStageT" Width="80px" 
            CascadeValuesBasedOn="$ClinStageDisease_12,$ClinStageSystem_12" CascadeFormatString="StageClin_{0}_{n.1}_T"/></td>  
    <td align="center">
        <euc:EformComboBox RecordId="12" ID="ClinStageN_12" runat="server" Table="ClinicalStages" Field="ClinStageN" Width="80px" 
            CascadeValuesBasedOn="$ClinStageDisease_12,$ClinStageSystem_12" CascadeFormatString="StageClin_{0}_{n.1}_N"/></td>
    <td align="center">
        <euc:EformComboBox RecordId="12" ID="ClinStageM_12" runat="server" Table="ClinicalStages" Field="ClinStageM" Width="80px" 
            CascadeValuesBasedOn="$ClinStageDisease_12,$ClinStageSystem_12" CascadeFormatString="StageClin_{0}_{n.1}_M"/>
        <euc:EformTextBox id="ClinStageQuality_12" RecordId="12" Table="ClinicalStages" Field="ClinStageQuality" runat="server" 
            Width="1px" style="display:none"/></td>
    <td align="center">
        <euc:EformComboBox RecordId="12" ID="ClinStageGroup_12" runat="server" Table="ClinicalStages" Field="ClinStageGroup" 
            Width="100px" CascadeValuesBasedOn="$ClinStageDisease_12,$ClinStageSystem_12" 
            CascadeFormatString="StageClin_{0}_{n.1}_Group"/></td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon12" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>
  
  <tr style=" display:none;">
    <td><euc:EformTextBox RecordId="13" TABLE="ClinicalStages" FIELD="ClinStageDateText" ID="ClinStageDateText_13" Runat="server" 
        Width="80px" ShowCalendar="true" CalcDate="true"/>
            <euc:EformHidden  RecordId="13" TABLE="ClinicalStages" FIELD="ClinStageDate" ID="ClinStageDate_13" Runat="server" /></td>
    <td align="center">
        <euc:EformTextBox RecordId="13" TABLE="ClinicalStages" FIELD="ClinStageDisease" Runat="server" Width="1px" 
                style="display:none" ID="ClinStageDisease_13" />
         <euc:EformDropDownList RecordId="13"  TABLE="ClinicalStages" FIELD="ClinStageSystem" ID="ClinStageSystem_13" 
                LookupCode="StagingSystem,Disease,Thoracic" Runat="server"/></td>
    <td align="center">
        <euc:EformComboBox RecordId="13" ID="ClinStageT_13" runat="server" Table="ClinicalStages" Field="ClinStageT" Width="80px" 
            CascadeValuesBasedOn="$ClinStageDisease_13,$ClinStageSystem_13" CascadeFormatString="StageClin_{0}_{n.1}_T"/></td>  
    <td align="center">
        <euc:EformComboBox RecordId="13" ID="ClinStageN_13" runat="server" Table="ClinicalStages" Field="ClinStageN" Width="80px" 
            CascadeValuesBasedOn="$ClinStageDisease_13,$ClinStageSystem_13" CascadeFormatString="StageClin_{0}_{n.1}_N"/></td>
    <td align="center">
        <euc:EformComboBox RecordId="13" ID="ClinStageM_13" runat="server" Table="ClinicalStages" Field="ClinStageM" Width="80px" 
            CascadeValuesBasedOn="$ClinStageDisease_13,$ClinStageSystem_13" CascadeFormatString="StageClin_{0}_{n.1}_M"/>
        <euc:EformTextBox id="ClinStageQuality_13" RecordId="13" Table="ClinicalStages" Field="ClinStageQuality" runat="server" 
            Width="1px" style="display:none"/></td>
    <td align="center">
        <euc:EformComboBox RecordId="13" ID="ClinStageGroup_13" runat="server" Table="ClinicalStages" Field="ClinStageGroup" 
            Width="100px" CascadeValuesBasedOn="$ClinStageDisease_13,$ClinStageSystem_13" 
                    CascadeFormatString="StageClin_{0}_{n.1}_Group"/></td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon13" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>
  
  <tr style=" display:none;">
    <td><euc:EformTextBox RecordId="14" TABLE="ClinicalStages" FIELD="ClinStageDateText" ID="ClinStageDateText_14" Runat="server" 
        Width="80px" ShowCalendar="true" CalcDate="true"/>
            <euc:EformHidden  RecordId="14" TABLE="ClinicalStages" FIELD="ClinStageDate" ID="ClinStageDate_14" Runat="server" /></td>
    <td align="center">
        <euc:EformTextBox RecordId="14" TABLE="ClinicalStages" FIELD="ClinStageDisease" Runat="server" Width="1px" 
                style="display:none" ID="ClinStageDisease_14" />
         <euc:EformDropDownList RecordId="14"  TABLE="ClinicalStages" FIELD="ClinStageSystem" ID="ClinStageSystem_14" 
                LookupCode="StagingSystem,Disease,Thoracic" Runat="server"/></td>
    <td align="center">
        <euc:EformComboBox RecordId="14" ID="ClinStageT_14" runat="server" Table="ClinicalStages" Field="ClinStageT" Width="80px" 
            CascadeValuesBasedOn="$ClinStageDisease_14,$ClinStageSystem_14" CascadeFormatString="StageClin_{0}_{n.1}_T"/></td>  
    <td align="center">
        <euc:EformComboBox RecordId="14" ID="ClinStageN_14" runat="server" Table="ClinicalStages" Field="ClinStageN" Width="80px" 
            CascadeValuesBasedOn="$ClinStageDisease_14,$ClinStageSystem_14" CascadeFormatString="StageClin_{0}_{n.1}_N"/></td>
    <td align="center">
        <euc:EformComboBox RecordId="14" ID="ClinStageM_14" runat="server" Table="ClinicalStages" Field="ClinStageM" Width="80px" 
            CascadeValuesBasedOn="$ClinStageDisease_14,$ClinStageSystem_14" CascadeFormatString="StageClin_{0}_{n.1}_M"/>
        <euc:EformTextBox id="ClinStageQuality_14" RecordId="14" Table="ClinicalStages" Field="ClinStageQuality" runat="server" 
            Width="1px" style="display:none"/></td>
    <td align="center">
        <euc:EformComboBox RecordId="14" ID="ClinStageGroup_14" runat="server" Table="ClinicalStages" Field="ClinStageGroup" 
            Width="100px" CascadeValuesBasedOn="$ClinStageDisease_14,$ClinStageSystem_14" 
            CascadeFormatString="StageClin_{0}_{n.1}_Group"/></td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon14" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>
  
  <tr style=" display:none;">
    <td><euc:EformTextBox RecordId="15" TABLE="ClinicalStages" FIELD="ClinStageDateText" ID="ClinStageDateText_15" Runat="server" 
        Width="80px" ShowCalendar="true" CalcDate="true"/>
            <euc:EformHidden  RecordId="15" TABLE="ClinicalStages" FIELD="ClinStageDate" ID="ClinStageDate_15" Runat="server" /></td>
    <td align="center">
        <euc:EformTextBox RecordId="15" TABLE="ClinicalStages" FIELD="ClinStageDisease" Runat="server" Width="1px" 
                style="display:none" ID="ClinStageDisease_15" />
         <euc:EformDropDownList RecordId="15"  TABLE="ClinicalStages" FIELD="ClinStageSystem" ID="ClinStageSystem_15" 
                LookupCode="StagingSystem,Disease,Thoracic" Runat="server"/></td>
    <td align="center">
        <euc:EformComboBox RecordId="15" ID="ClinStageT_15" runat="server" Table="ClinicalStages" Field="ClinStageT" Width="80px" 
            CascadeValuesBasedOn="$ClinStageDisease_15,$ClinStageSystem_15" CascadeFormatString="StageClin_{0}_{n.1}_T"/></td>  
    <td align="center">
        <euc:EformComboBox RecordId="15" ID="ClinStageN_15" runat="server" Table="ClinicalStages" Field="ClinStageN" Width="80px" 
            CascadeValuesBasedOn="$ClinStageDisease_15,$ClinStageSystem_15" CascadeFormatString="StageClin_{0}_{n.1}_N"/></td>
    <td align="center">
        <euc:EformComboBox RecordId="15" ID="ClinStageM_15" runat="server" Table="ClinicalStages" Field="ClinStageM" Width="80px" 
            CascadeValuesBasedOn="$ClinStageDisease_15,$ClinStageSystem_15" CascadeFormatString="StageClin_{0}_{n.1}_M"/>
        <euc:EformTextBox id="ClinStageQuality_15" RecordId="15" Table="ClinicalStages" Field="ClinStageQuality" runat="server" 
            Width="1px" style="display:none"/></td>
    <td align="center">
        <euc:EformComboBox RecordId="15" ID="ClinStageGroup_15" runat="server" Table="ClinicalStages" Field="ClinStageGroup" 
            Width="100px" CascadeValuesBasedOn="$ClinStageDisease_15,$ClinStageSystem_15" 
            CascadeFormatString="StageClin_{0}_{n.1}_Group"/></td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon15" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>
</table>
      <img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'ClinStageTbl');" /><br /><br />


<script type="text/javascript">
    //updates clinstage autopopulates only if clinstagegrade value exists
    function clistageaddEvents(cliStage,cliDisease,cliQlty)
    { 
        $(cliStage).addEvent('blur',curry(updatesCliStage,cliStage,cliDisease,cliQlty));
    } 
    clistageaddEvents($('<%= ClinStageSystem_11.ClientID %>'),$('<%= ClinStageDisease_11.ClientID %>'),$('<%= ClinStageQuality_11.ClientID %>'));
    clistageaddEvents($('<%= ClinStageSystem_12.ClientID %>'),$('<%= ClinStageDisease_12.ClientID %>'),$('<%= ClinStageQuality_12.ClientID %>'));
    clistageaddEvents($('<%= ClinStageSystem_13.ClientID %>'),$('<%= ClinStageDisease_13.ClientID %>'),$('<%= ClinStageQuality_13.ClientID %>'));
    clistageaddEvents($('<%= ClinStageSystem_14.ClientID %>'),$('<%= ClinStageDisease_14.ClientID %>'),$('<%= ClinStageQuality_14.ClientID %>'));
    clistageaddEvents($('<%= ClinStageSystem_15.ClientID %>'),$('<%= ClinStageDisease_15.ClientID %>'),$('<%= ClinStageQuality_15.ClientID %>'));

    function updatesCliStage(cliStage,cliDisease,cliQlty)
    {
       if (cliStage.value != '')
        {
           cliDisease.value = 'Lung';
           cliQlty.value = 'STD';
        }
        else
        {
            cliDisease.value = '';
            cliQlty.value = '';
        }
    }  
    
      
</script>