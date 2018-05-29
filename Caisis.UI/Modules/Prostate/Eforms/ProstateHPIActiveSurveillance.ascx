<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Prostate.Eforms.ProstateHPIActiveSurveillance" CodeFile="ProstateHPIActiveSurveillance.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<a name="ProstateHPIActiveSurveillance" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="HPI"></asp:Label><br/>
<asp:Literal ID="NoHPIMsg" Runat="server" Visible="False">No history of present illness found for this patient.</asp:Literal>
<table width="600" cellpadding="5" cellspacing="0" class="ClinicalEformTable">
  
   	
  <asp:Repeater ID="hpi" OnItemDataBound="SetHpiItem" runat="server" > 
       <ItemTemplate> 
				
		<tr class="ClinicalEformPopulatedRow" onmouseover="this.className='ClinicalEformHighlightedRow';" onmouseout="this.className='ClinicalEformPopulatedRow';" id="HpiRow" runat="server">  
			<td class="ClinicalEformPopulatedColumn"><asp:Literal id="HpiRowItems" runat="server"/></td>
	    </tr>      

      </ItemTemplate>
      

	  
	  
  </asp:Repeater>
  
  <asp:Repeater ID="HpiProstatectomies" runat="server" > 
       <ItemTemplate> 
				
		<tr class="ClinicalEformPopulatedRow" onmouseover="this.className='ClinicalEformHighlightedRow';" onmouseout="this.className='ClinicalEformPopulatedRow';" onclick="LoadDataEntryForm('ProstatectomyProc', '<%# DataBinder.Eval(Container.DataItem, "ProcedureId") %>', 'ProcStageSystem,ProcStageT', 'ProstateHPI');">  
			<td class="ClinicalEformPopulatedColumn">
			
				<strong><%# DataBinder.Eval(Container.DataItem, "ProcName") %></strong>
				on <%# DataBinder.Eval(Container.DataItem, "ProcDateText") %>
                  <asp:Label ID="CaseSurgeonLabel" Runat="server">by <%# DataBinder.Eval(Container.DataItem, "ProcSurgeon") %></asp:Label>
			
			</td>
	    </tr>      

      </ItemTemplate>
      
</asp:Repeater>

	<tr id="PreTxPotencyTr" runat="server" class="ClinicalEformPopulatedRow" onmouseover="this.className='ClinicalEformHighlightedRow';" onmouseout="this.className='ClinicalEformPopulatedRow';">  
			<td class="ClinicalEformPopulatedColumn"><asp:Label ID="PreTxPot" Runat="server" /></td>
	</tr>      
	

  <asp:Repeater ID="hpiProtocols" runat="server" > 
       <ItemTemplate> 
				
		<tr class="ClinicalEformPopulatedRow" onmouseover="this.className='ClinicalEformHighlightedRow';" onmouseout="this.className='ClinicalEformPopulatedRow';"  onclick="LoadDataEntryForm('PatientProtocols', <%# DataBinder.Eval(Container.DataItem, "PatientProtocolId") %>, 'PtProtocolStatus,PtProtocolNotes,PtProtocolDataSource,PtProtocolQuality', 'ProstateHPI');">  
			<td class="ClinicalEformPopulatedColumn">
				Protocol <%# DataBinder.Eval(Container.DataItem, "ProtocolNum") %>  <%# DataBinder.Eval(Container.DataItem, "ProtocolNotes") %> <%# DataBinder.Eval(Container.DataItem, "PtProtocolStatus") %>			
			</td>
	    </tr>      

      </ItemTemplate>
</asp:Repeater>


 <asp:Repeater ID="hpiBiopsies" runat="server" > 
       <ItemTemplate> 
				
		<tr class="ClinicalEformPopulatedRow" onmouseover="this.className='ClinicalEformHighlightedRow';" onmouseout="this.className='ClinicalEformPopulatedRow';"  onclick="LoadDataEntryForm('<%# DataBinder.Eval(Container.DataItem, "TableName") %>', <%# DataBinder.Eval(Container.DataItem, "PrimaryKey") %>, '', 'ProstateHPI');">  <!-- PathDateText,PathDate,PathSpecimenType,PathSite,PathSubsite,PathSide,PathResult -->
			<td class="ClinicalEformPopulatedColumn">
     				Biopsy:&nbsp; 
                  <%# DataBinder.Eval(Container.DataItem, "ProcDateText") %>
                  &nbsp;&nbsp; 
                  <%# DataBinder.Eval(Container.DataItem, "ProcName") %>
                  &nbsp;&nbsp;Result:&nbsp; 
                  <%# DataBinder.Eval(Container.DataItem, "PathResult") %>
                  &nbsp;&nbsp; 
                  <%# DataBinder.Eval(Container.DataItem, "PathQuality") %>			
            </td>
	    </tr>      

      </ItemTemplate>
</asp:Repeater>


<tr id="NvbLeftTr" runat="server" class="ClinicalEformPopulatedRowNonClickable">  
			<td class="ClinicalEformPopulatedColumn"><asp:Label ID="NVB_Left" Runat="server" /> </td>
	</tr>
	
	<tr id="NvbRightTr" runat="server" class="ClinicalEformPopulatedRowNonClickable" >  
			<td class="ClinicalEformPopulatedColumn"><asp:Label ID="NVB_Right" Runat="server" /> </td>
	</tr>  
<%--	
<tr id="HPIAddedText" class="ClinicalEformPopulatedRowNonClickable">  
			<td class="ClinicalEformPopulatedColumn">
			<strong>HPI / Interval History</strong><br/>
			<euc:EformTextArea TextMode="MultiLine" TABLE="NoTable" FIELD="HPI_AddedText" Rows="4" Cols="70" Runat="server" ID="HPI_AddedText"/>
			
			</td>
</tr>

--%>
</table>



<br/>
<br/>
<br/>



<style type="text/css">
table.ProstateDiagnosisTable
{
    border: solid 1px #cccccc;
}

table.ProstateDiagnosisTable td
{
    padding: 10px 4px 10px 4px;
    font-weight: bold;
}

table.DxClinicalStageTable
{

    border: solid 1px #dddddd;
}

table.DxBiopsyCoresTable td
{
    border-collapse: collapse;
    vertical-align: middle;
    border: solid 1px #dddddd;
}
</style>

<script type="text/javascript">
function setGleasonSum()
{
	var gg1 = $('<% = DiagnosisUICC2002GG1.ClientID %>');
	var gg2 = $('<% = DiagnosisUICC2002GG2.ClientID %>');
	var ggs = $('<% = DiagnosisUICC2002GGS.ClientID %>');
	
	var gg1Val = !isNaN(parseInt(gg1.value)) ? parseInt(gg1.value) : 0;
	var gg2Val = !isNaN(parseInt(gg2.value)) ? parseInt(gg2.value) : 0;
	
	try
	{
		var total = gg1Val + gg2Val; // gg3 not included in sum
		ggs.value = (total > 0) ? total : '';
	}
	catch(err)
	{
		ggs.value = '';
	}
}
</script>

<asp:Label ID="ComponentTitle1" runat="server" CssClass="controlBoxTitle" Text="Diagnosis"></asp:Label>
<table id="ActiveSurveillanceDiagnosisTable" cellspacing="0"   class="ProstateDiagnosisTable eformLargePopulatedTable">
<tr>
<td>Dx Date
<euc:EformTextBox Runat="server" ID="DiagnosisDateText" TABLE="NoTable" FIELD="DiagnosisDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"   />
<euc:EformHidden Runat="server" ID="DiagnosisDate" Table="NoTable" Field="DiagnosisDate"  />
</td>
<td style="padding-left: 50px;">Active Surveillance Date
<euc:EformTextBox Runat="server" ID="ActiveSurveillanceDateText" TABLE="NoTable" FIELD="ActiveSurveillanceDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"   />
<euc:EformHidden Runat="server" ID="ActiveSurveillanceDate" Table="NoTable" Field="ActiveSurveillanceDate"  />
</td>
</tr>
</table>





<table border="0" cellspacing="0" id="NewDiagnosisTable" runat="server"  class="ProstateDiagnosisTable eformLargePopulatedTable">
  
  <tr>
    <td >Biopsy Date 
            </td>
    <td>BxGG1
      <euc:EformDropDownList Runat="server" RecordId="1" ParentRecordId="1" TABLE="ProstateBiopsyPath" FIELD="PathGG1" ID="DiagnosisUICC2002GG1" style="margin-right: 12px; width: 40px;" onchange="setGleasonSum();" >
			<asp:ListItem> </asp:ListItem>
			<asp:ListItem>1</asp:ListItem>
			<asp:ListItem>2</asp:ListItem>
			<asp:ListItem>3</asp:ListItem>
			<asp:ListItem>4</asp:ListItem>
			<asp:ListItem>5</asp:ListItem>
		</euc:EformDropDownList>
		BxGG2
		<euc:EformDropDownList Runat="server" RecordId="1" ParentRecordId="1" TABLE="ProstateBiopsyPath" FIELD="PathGG2" ID="DiagnosisUICC2002GG2" style="margin-right: 12px; width: 40px;" onchange="setGleasonSum();" >
			<asp:ListItem> </asp:ListItem>
			<asp:ListItem>1</asp:ListItem>
			<asp:ListItem>2</asp:ListItem>
			<asp:ListItem>3</asp:ListItem>
			<asp:ListItem>4</asp:ListItem>
			<asp:ListItem>5</asp:ListItem>
		</euc:EformDropDownList>
		<%-- 
		BxGG3
		<euc:EformDropDownList Runat="server" RecordId="1" ParentRecordId="1" TABLE="ProstateBiopsyPath" FIELD="PathGG3" ID="DiagnosisUICC2002GG3" style="margin-right: 12px; width: 40px;" onchange="setGleasonSum();" >
			<asp:ListItem> </asp:ListItem>
			<asp:ListItem>1</asp:ListItem>
			<asp:ListItem>2</asp:ListItem>
			<asp:ListItem>3</asp:ListItem>
			<asp:ListItem>4</asp:ListItem>
			<asp:ListItem>5</asp:ListItem>
		</euc:EformDropDownList>
	--%>
	    BxGGS
    <euc:EformTextBox Runat="server" ID="DiagnosisUICC2002GGS" RecordId="1" ParentRecordId="1" TABLE="ProstateBiopsyPath" FIELD="PathGGS" style="width:40px;"  />    </td>
  </tr>
  <tr>
    <td style="vertical-align: top; padding-right: 30px;" rowspan="2"><strong>2002 Clinical Stage</strong>
    
      <table cellspacing="0" id="DxClinicalStageTable">
        <tr>
          <td style="padding-right: 15px;" >T
            <euc:EformSelect style="width:60px;" DropDownWidth="300" LookupCode="StageClin_Prostate_02_T" TABLE="NoTable" FIELD="DiagnosisUICC2002TStage" Runat="server" ID="ClinStageT"  /></td>
          <td style="padding-right: 15px;">N
            <euc:EformSelect style="width:60px;" DropDownWidth="220" DropDownHeight="auto" LookupCode="StageClin_Prostate_02_N" TABLE="NoTable" FIELD="DiagnosisUICC2002NStage" Runat="server" ID="ClinStageN"   /></td>
          <td  style="padding-right: 15px;">M
            <euc:EformSelect style="width:60px;" DropDownWidth="280" DropDownHeight="auto" LookupCode="StageClin_Prostate_02_M" TABLE="NoTable" FIELD="DiagnosisUICC2002MStage" Runat="server" ID="ClinStageM"    /></td>
        </tr>
      </table></td><td style="vertical-align: top;">PreBxTx PSA 
        <euc:EformTextBox RecordId="30" style="width:40px;" TABLE="LabTests" FIELD="LabResult" Runat="server" ID="LabResult_30" />    </td>
  </tr>
  <tr><td ><table cellspacing="0" id="DxBiopsyCoresTable">
  <tr><td style="border: none;">Biopsy Cores</td><td>Positive<euc:EformTextBox style="width:30px;" TABLE="ProstateBiopsyPath" RecordId="1" ParentRecordId="1" FIELD="PathPosCores" Runat="server" ID="PathPosCores" />
  <span style="margin-left: 16px;">Negative<euc:EformTextBox style="width:30px;" TABLE="ProstateBiopsyPath" RecordId="1" ParentRecordId="1" FIELD="PathNumCores" Runat="server" ID="PathNumCores" /></span></td></tr>
  </table>
  
</td></tr>
</table>

<table border="0" cellspacing="0" id="populatedDiagnosisTable" runat="server" visible="false" class="ProstateDiagnosisTable eformLargePopulatedTable" style="cursor: pointer;" onmouseover="this.style.border='solid 1px #8d2a2c';this.backgroundColor='#ff999999';" onmouseout="this.style.border='solid 1px #cccccc';this.backgroundColor='';">
  <tr>
    <td >Biopsy Date: 
        <asp:Label ID="DxDateLabel" runat="server" style="margin-right: 12px; width: 80px;"></asp:Label></td>
    <td>BxGG1:
      <asp:Label ID="PathGG1Label" runat="server" style="margin-right: 12px; width: 40px;"></asp:Label>
		BxGG2:
      <asp:Label ID="PathGG2Label" runat="server" style="margin-right: 12px; width: 40px;"></asp:Label>
	    BxGGS:
	  <asp:Label ID="PathGGSLabel" runat="server" style="margin-right: 12px; width: 40px;"></asp:Label>
	  </td>
  </tr>
  <tr>
    <td style="vertical-align: top; padding-right: 30px;" rowspan="2"><strong>2002 Path Stage</strong>
    
      <table cellspacing="0" class="DxClinicalStageTable">
        <tr>
          <td style="padding-right: 15px;" >T:
            <asp:Label ID="DiagnosisUICC2002TStageLabel" runat="server" style="width: 60px;"></asp:Label></td>
          <td style="padding-right: 15px;">N:
            <asp:Label ID="DiagnosisUICC2002NStageLabel" runat="server" style="width: 60px;"></asp:Label></td>
          <td  style="padding-right: 15px;">M:
            <asp:Label ID="DiagnosisUICC2002MStageLabel" runat="server" style="width: 60px;"></asp:Label></td>
        </tr>
      </table></td><td style="vertical-align: top;">PreBxTx PSA: 
        <asp:Label ID="PreBxTxPSA" runat="server" ></asp:Label>    </td>
  </tr>
  <tr><td ><table cellspacing="0" class="DxBiopsyCoresTable">
  <tr><td style="border: none;">Biopsy Cores</td><td>Positive: <asp:Label ID="DiagnosisPositiveCoresLabel" runat="server" style="width: 30px;"></asp:Label>
  <span style="margin-left: 16px;">Negative: <asp:Label ID="DiagnosisNegativeCoresLabel" runat="server" style="width: 30px;"></asp:Label></span></td></tr>
  </table>



</td></tr>
</table>
<br/>
<br/>
<br/>
