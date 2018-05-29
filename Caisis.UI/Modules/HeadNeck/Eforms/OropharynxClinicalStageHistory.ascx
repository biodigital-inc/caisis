<%@ Control Language="c#" Inherits="Caisis.UI.Modules.HeadNeck.Eforms.OropharynxClinicalStageHistory" CodeFile="OropharynxClinicalStageHistory.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<!-- example table array populator -->
<script language="javascript">
	tableArray.ClinicalStagesHtmlTable = "ClinicalStagesHtmlTable";
</script>

<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css">
<a name="OropharynxClinicalStageHistory" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Clinical Stage History (Oropharynx)"></asp:Label><br/>
<table  cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="ClinicalStagesHtmlTable">
  <tr> 
    <td  class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Date</td>
    <td class="controlBoxDataGridHeaderFirstCol">System</td>
    <td class="controlBoxDataGridHeaderFirstCol">T</td>
    <td class="controlBoxDataGridHeaderFirstCol">N</td>
    <td class="controlBoxDataGridHeaderFirstCol">M</td>
    <td class="controlBoxDataGridHeaderFirstCol">Physician</td>
    <td class="controlBoxDataGridHeaderFirstCol">Quality</td>
    <td class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
  </tr>
  
  
  
  <asp:Repeater ID="clinicalStages" runat="server" OnItemDataBound="EFormRepeaterOnDataBound"> 
	<ItemTemplate> 
		<tr title="<%# DataBinder.Eval(Container.DataItem, "ClinStageNotes")%>" class="ClinicalEformPopulatedRow" onmouseover="this.className='ClinicalEformHighlightedRow';" onmouseout="this.className='ClinicalEformPopulatedRow';" onclick="LoadDataEntryForm('ClinicalStages', <%# DataBinder.Eval(Container.DataItem, "ClinicalStageId") %>, 'ClinStageDateText,ClinStageDate,ClinStageDisease,ClinStageSystem,ClinStageT,ClinStageN,ClinStageM,ClinStagePhysician,ClinStageQuality', 'ClinicalStageGTD');"> 
			<td class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "ClinStageDateText")%></td>
			<td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "ClinStageSystem")%></td>
			<td align="center" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "ClinStageT")%></td>
		  <td align="center" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "ClinStageN")%></td>
			<td align="center" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "ClinStageM")%></td>
			<td align="center" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "ClinStagePhysician")%></td>
			<td align="center" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "ClinStageQuality")%></td>
			<td class="ClinicalEformPopulatedColumn"><img align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="LockImage" runat="server" title="This record has been locked.">&nbsp;</td>
		</tr>      
	</ItemTemplate>
  </asp:Repeater>
    <tr> 
    <td height="28" class="ClinicalEformGridColumnOne">
		<euc:EformTextBox Runat="server" RecordId="2"  ID="ClinStageDateText_2" TABLE="ClinicalStages" FIELD="ClinStageDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"    />
		<euc:EformHidden RecordId="2" Runat="server" ID="ClinStageDate_2" Table="ClinicalStages" Field="ClinStageDate"></euc:EformHidden></td>
    <td style="white-space: nowrap;" ><euc:EformDropDownList style="width:80px" LookupDistinct="ClinicalStages;ClinStageSystem;ClinStageSystem" TABLE="ClinicalStages" FIELD="ClinStageSystem" Runat="server" ID="ClinStageSystem_2" RecordId="2"/></td>
    <td style="white-space: nowrap;" ><euc:EformDropDownList style="width:60px"  LookupCode="StageClin_Oropharynx_02_T" TABLE="ClinicalStages" FIELD="ClinStageT" Runat="server" ID="ClinStageT_2" RecordId="2"/></td>
    <td style="white-space: nowrap;" >
					<euc:EformDropDownList style="width:60px" TABLE="ClinicalStages" FIELD="ClinStageN" Runat="server" ID="ClinStageN_2" RecordId="2">
                    <asp:ListItem Text=" " Value=""/>
                    <asp:ListItem Text="N0" Value="N0"/>
                    <asp:ListItem Text="N1" Value="N1"/>
                    <asp:ListItem Text="N2a" Value="N2a"/>
                    <asp:ListItem Text="N2b" Value="N2b"/>
                    <asp:ListItem Text="N2c" Value="N2c"/>
                    <asp:ListItem Text="N3" Value="N3"/>
                    </euc:EformDropDownList></td>
    <td style="white-space: nowrap;" ><euc:EformDropDownList style="width:60px"  LookupCode="StageClin_Oropharynx_02_M" TABLE="ClinicalStages" FIELD="ClinStageM" Runat="server" ID="ClinStageM_2" RecordId="2"/></td>
    <td><euc:EformComboBox style="width:100px"  TABLE="ClinicalStages" FIELD="ClinStagePhysician" DropDownWidth="300" LookupCode="Physician" Runat="server" ID="ClinStagePhysician_2" RecordId="2"/></td>
    <td><euc:EformSelect RecordId="2" LookupCode="DataQuality" TABLE="ClinicalStages" FIELD="ClinStageQuality" DropDownWidth="350" DropDownHeight="auto" Runat="server" ID="ClinStageQuality_2" style="width: 35px;"/></td>
    <td><euc:EformDeleteIcon  runat="server"/></td>
  </tr>
    <tr style="display: none;"> 
    <td height="28" class="ClinicalEformGridColumnOne">
		<euc:EformTextBox Runat="server" RecordId="3"  ID="ClinStageDateText_3" TABLE="ClinicalStages" FIELD="ClinStageDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"    />
		<euc:EformHidden RecordId="3" Runat="server" ID="ClinStageDate_3" Table="ClinicalStages" Field="ClinStageDate"></euc:EformHidden></td>
    <td style="white-space: nowrap;" ><euc:EformDropDownList style="width:80px" LookupDistinct="ClinicalStages;ClinStageSystem;ClinStageSystem" TABLE="ClinicalStages" FIELD="ClinStageSystem" Runat="server" ID="ClinStageSystem_3" RecordId="3"/></td>
    <td style="white-space: nowrap;" ><euc:EformDropDownList style="width:60px"  LookupCode="StageClin_Oropharynx_02_T" TABLE="ClinicalStages" FIELD="ClinStageT" Runat="server" ID="ClinStageT_3" RecordId="3"/></td>
    <td style="white-space: nowrap;" >
					<euc:EformDropDownList style="width:60px" TABLE="ClinicalStages" FIELD="ClinStageN" Runat="server" ID="ClinStageN_3" RecordId="3">
                    <asp:ListItem Text=" " Value=""/>
                    <asp:ListItem Text="N0" Value="N0"/>
                    <asp:ListItem Text="N1" Value="N1"/>
                    <asp:ListItem Text="N2a" Value="N2a"/>
                    <asp:ListItem Text="N2b" Value="N2b"/>
                    <asp:ListItem Text="N2c" Value="N2c"/>
                    <asp:ListItem Text="N3" Value="N3"/>
                    </euc:EformDropDownList></td>
    <td style="white-space: nowrap;" ><euc:EformDropDownList style="width:60px"  LookupCode="StageClin_Oropharynx_02_M" TABLE="ClinicalStages" FIELD="ClinStageM" Runat="server" ID="ClinStageM_3" RecordId="3"/></td>
    <td><euc:EformComboBox style="width:100px"  TABLE="ClinicalStages" FIELD="ClinStagePhysician" DropDownWidth="300" LookupCode="Physician" Runat="server" ID="ClinStagePhysician_3" RecordId="3"/></td>
    <td><euc:EformSelect RecordId="3" LookupCode="DataQuality" TABLE="ClinicalStages" FIELD="ClinStageQuality" DropDownWidth="350" DropDownHeight="auto" Runat="server" ID="ClinStageQuality_3" style="width: 35px;"/></td>
    <td><euc:EformDeleteIcon  runat="server"/></td>
  </tr>

    <tr style="display: none;"> 
    <td height="28" class="ClinicalEformGridColumnOne">
		<euc:EformTextBox Runat="server" RecordId="4"  ID="ClinStageDateText_4" TABLE="ClinicalStages" FIELD="ClinStageDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"    />
		<euc:EformHidden RecordId="4" Runat="server" ID="ClinStageDate_4" Table="ClinicalStages" Field="ClinStageDate"></euc:EformHidden></td>
    <td style="white-space: nowrap;" ><euc:EformDropDownList style="width:80px" LookupDistinct="ClinicalStages;ClinStageSystem;ClinStageSystem" TABLE="ClinicalStages" FIELD="ClinStageSystem" Runat="server" ID="ClinStageSystem_4" RecordId="4"/></td>
    <td style="white-space: nowrap;" ><euc:EformDropDownList style="width:60px"  LookupCode="StageClin_Oropharynx_02_T" TABLE="ClinicalStages" FIELD="ClinStageT" Runat="server" ID="ClinStageT_4" RecordId="4"/></td>
    <td style="white-space: nowrap;" >
					<euc:EformDropDownList style="width:60px" TABLE="ClinicalStages" FIELD="ClinStageN" Runat="server" ID="ClinStageN_4" RecordId="4">
                    <asp:ListItem Text=" " Value=""/>
                    <asp:ListItem Text="N0" Value="N0"/>
                    <asp:ListItem Text="N1" Value="N1"/>
                    <asp:ListItem Text="N2a" Value="N2a"/>
                    <asp:ListItem Text="N2b" Value="N2b"/>
                    <asp:ListItem Text="N2c" Value="N2c"/>
                    <asp:ListItem Text="N3" Value="N3"/>
                    </euc:EformDropDownList></td>
    <td style="white-space: nowrap;" ><euc:EformDropDownList style="width:60px"  LookupCode="StageClin_Oropharynx_02_M" TABLE="ClinicalStages" FIELD="ClinStageM" Runat="server" ID="ClinStageM_4" RecordId="4"/></td>
    <td><euc:EformComboBox style="width:100px"  TABLE="ClinicalStages" FIELD="ClinStagePhysician" DropDownWidth="300" LookupCode="Physician" Runat="server" ID="ClinStagePhysician_4" RecordId="4"/></td>
    <td><euc:EformSelect RecordId="4" LookupCode="DataQuality" TABLE="ClinicalStages" FIELD="ClinStageQuality" DropDownWidth="350" DropDownHeight="auto" Runat="server" ID="ClinStageQuality_4" style="width: 35px;"/></td>
    <td><euc:EformDeleteIcon  runat="server"/></td>
  </tr>

    <tr style="display: none;"> 
    <td height="28" class="ClinicalEformGridColumnOne">
		<euc:EformTextBox Runat="server" RecordId="5"  ID="ClinStageDateText_5" TABLE="ClinicalStages" FIELD="ClinStageDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"    />
		<euc:EformHidden RecordId="5" Runat="server" ID="ClinStageDate_5" Table="ClinicalStages" Field="ClinStageDate"></euc:EformHidden></td>
    <td style="white-space: nowrap;" ><euc:EformDropDownList style="width:80px" LookupDistinct="ClinicalStages;ClinStageSystem;ClinStageSystem" TABLE="ClinicalStages" FIELD="ClinStageSystem" Runat="server" ID="ClinStageSystem_5" RecordId="5"/></td>
    <td style="white-space: nowrap;" ><euc:EformDropDownList style="width:60px"  LookupCode="StageClin_Oropharynx_02_T" TABLE="ClinicalStages" FIELD="ClinStageT" Runat="server" ID="ClinStageT_5" RecordId="5"/></td>
    <td style="white-space: nowrap;" >
					<euc:EformDropDownList style="width:60px" TABLE="ClinicalStages" FIELD="ClinStageN" Runat="server" ID="ClinStageN_5" RecordId="5">
                    <asp:ListItem Text=" " Value=""/>
                    <asp:ListItem Text="N0" Value="N0"/>
                    <asp:ListItem Text="N1" Value="N1"/>
                    <asp:ListItem Text="N2a" Value="N2a"/>
                    <asp:ListItem Text="N2b" Value="N2b"/>
                    <asp:ListItem Text="N2c" Value="N2c"/>
                    <asp:ListItem Text="N3" Value="N3"/>
                    </euc:EformDropDownList></td>
    <td style="white-space: nowrap;" ><euc:EformDropDownList style="width:60px"  LookupCode="StageClin_Oropharynx_02_M" TABLE="ClinicalStages" FIELD="ClinStageM" Runat="server" ID="ClinStageM_5" RecordId="5"/></td>
    <td><euc:EformComboBox style="width:100px"  TABLE="ClinicalStages" FIELD="ClinStagePhysician" DropDownWidth="300" LookupCode="Physician" Runat="server" ID="ClinStagePhysician_5" RecordId="5"/></td>
    <td><euc:EformSelect RecordId="5" LookupCode="DataQuality" TABLE="ClinicalStages" FIELD="ClinStageQuality" DropDownWidth="350" DropDownHeight="auto" Runat="server" ID="ClinStageQuality_5" style="width: 35px;"/></td>
    <td><euc:EformDeleteIcon  runat="server"/></td>
  </tr>


  <%-- 
    <tr align="left" style="display: none;"> 
    <td height="28" class="ClinicalEformGridColumnOne">
		<euc:EformTextBox Runat="server" RecordId="6"  ID="ClinStageDateText_6" TABLE="ClinicalStages" FIELD="ClinStageDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"    />
		<euc:EformHidden RecordId="6" Runat="server" ID="ClinStageDate_6" Table="ClinicalStages" Field="ClinStageDate"></euc:EformHidden></td>
    <td style="white-space: nowrap;" >
    <euc:EformSelect DropDownWidth="550" DropDownHeight="auto" style="width: 60px;"  RecordId="6" LookupCode="StageClin_GTD_FIGO" TABLE="ClinicalStages" FIELD="ClinStageGroup" Runat="server" ID="ClinStageGroup_6"/>
    </td>
    <td><euc:EformComboBox LookupCode="Disease" id="ClinStageDisease_6" Table="ClinicalStages" RecordId="6" Field="ClinStageDisease" runat="server" Width="210" />
        <euc:EformTextBox style="display: none;" TABLE="ClinicalStages"  RecordId="6"  FIELD="ClinStageSystem" Runat="server" ID="ClinStageSystem_6" />
        <euc:EformTextBox style="display: none;" TABLE="ClinicalStages"  RecordId="6"  FIELD="ClinStageT" Runat="server" ID="ClinStageT_6" />
    </td>
    <td><euc:EformSelect RecordId="6" LookupCode="DataQuality" TABLE="ClinicalStages" FIELD="ClinStageQuality" DropDownWidth="350" DropDownHeight="auto" Runat="server" ID="ClinStageQuality_6" style="width: 35px;"/></td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon5" runat="server"/></td>
  </tr>
    <tr align="left" style="display: none;"> 
    <td height="28" class="ClinicalEformGridColumnOne">
		<euc:EformTextBox Runat="server" RecordId="7"  ID="ClinStageDateText_7" TABLE="ClinicalStages" FIELD="ClinStageDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"    />
		<euc:EformHidden RecordId="7" Runat="server" ID="ClinStageDate_7" Table="ClinicalStages" Field="ClinStageDate"></euc:EformHidden></td>
    <td style="white-space: nowrap;" >
    <euc:EformSelect DropDownWidth="550" DropDownHeight="auto" style="width: 60px;"  RecordId="7" LookupCode="StageClin_GTD_FIGO" TABLE="ClinicalStages" FIELD="ClinStageGroup" Runat="server" ID="ClinStageGroup_7"/>
    </td>
    <td><euc:EformComboBox LookupCode="Disease" id="ClinStageDisease_7" Table="ClinicalStages" RecordId="7" Field="ClinStageDisease" runat="server" Width="210" />
        <euc:EformTextBox style="display: none;" TABLE="ClinicalStages"  RecordId="7"  FIELD="ClinStageSystem" Runat="server" ID="ClinStageSystem_7" />
        <euc:EformTextBox style="display: none;" TABLE="ClinicalStages"  RecordId="7"  FIELD="ClinStageT" Runat="server" ID="ClinStageT_7" />
    </td>
    <td><euc:EformSelect RecordId="7" LookupCode="DataQuality" TABLE="ClinicalStages" FIELD="ClinStageQuality" DropDownWidth="350" DropDownHeight="auto" Runat="server" ID="ClinStageQuality_7" style="width: 35px;"/></td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon6" runat="server"/></td>
  </tr>
    <tr align="left" style="display: none;"> 
    <td height="28" class="ClinicalEformGridColumnOne">
		<euc:EformTextBox Runat="server" RecordId="8"  ID="ClinStageDateText_8" TABLE="ClinicalStages" FIELD="ClinStageDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"    />
		<euc:EformHidden RecordId="8" Runat="server" ID="ClinStageDate_8" Table="ClinicalStages" Field="ClinStageDate"></euc:EformHidden></td>
    <td style="white-space: nowrap;" >
    <euc:EformSelect DropDownWidth="550" DropDownHeight="auto" style="width: 60px;"  RecordId="8" LookupCode="StageClin_GTD_FIGO" TABLE="ClinicalStages" FIELD="ClinStageGroup" Runat="server" ID="ClinStageGroup_8"/>
    </td>
    <td><euc:EformComboBox LookupCode="Disease" id="ClinStageDisease_8" Table="ClinicalStages" RecordId="8" Field="ClinStageDisease" runat="server" Width="210" />
        <euc:EformTextBox style="display: none;" TABLE="ClinicalStages"  RecordId="8"  FIELD="ClinStageSystem" Runat="server" ID="ClinStageSystem_8" />
        <euc:EformTextBox style="display: none;" TABLE="ClinicalStages"  RecordId="8"  FIELD="ClinStageT" Runat="server" ID="ClinStageT_8" />
    </td>
    <td><euc:EformSelect RecordId="8" LookupCode="DataQuality" TABLE="ClinicalStages" FIELD="ClinStageQuality" DropDownWidth="350" DropDownHeight="auto" Runat="server" ID="ClinStageQuality_8" style="width: 35px;"/></td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon7" runat="server"/></td>
  </tr>
 
 --%>
</table>
<img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'ClinicalStagesHtmlTable');" />
<br/><br/>
<br/>
