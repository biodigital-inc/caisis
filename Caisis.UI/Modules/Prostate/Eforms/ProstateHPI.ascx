<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Prostate.Eforms.ProstateHPI" CodeFile="ProstateHPI.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css">
<a name="ProstateHPI" /><span class="controlBoxTitle">HPI</span><br/>
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
<a name="Nomograms" /><span class="controlBoxTitle" style="display: none;">Nomogram Predictions </span><br/>
<table width="600" cellpadding="5" cellspacing="0" class="ClinicalEformTable" style="display: none;">
  <tr >
    <td valign="top" width="20%" height="28" align="right" class="ClinicalEformGridColumnOne"><strong>PreRP 5 Yr</strong></td>
    <td valign="top" style="background-color:#FFFFFF;"><span class="FormInsideTableTopCell">
      
      <asp:Label ID="preRP5Nomo" runat="server" >&nbsp;</asp:Label>     
    </span></td>
  </tr>
  <tr >
    <td valign="top" width="20%" height="28" align="right" class="ClinicalEformGridColumnOne"><strong>PreRP 10 Yr</strong></td>
    <td valign="top" style="background-color:#FFFFFF;"><span class="FormInsideTableTopCell">
      
      <asp:Label ID="preRP10Nomo" runat="server" >&nbsp;</asp:Label>     
    </span></td>
  </tr>
  <tr >
    <td valign="top" height="28" align="right" class="ClinicalEformGridColumnOne"><strong>PreXRT</strong></td>
    <td valign="top" style="background-color:#FFFFFF;"><span class="FormInsideTableTopCell">
      
      <asp:Label ID="preXRTNomo" runat="server" >&nbsp;</asp:Label>  
    </span></td>
  </tr>
  <tr >
    <td valign="top" height="28" align="right" class="ClinicalEformGridColumnOne"><strong>PreBrachy</strong></td>
    <td valign="top" style="background-color:#FFFFFF;"><span class="FormInsideTableTopCell">
      
      <asp:Label ID="preBrachyNomo" runat="server">&nbsp;</asp:Label>
    </span></td>
  </tr>
  <tr >
    <td valign="top" height="28" align="right" class="ClinicalEformGridColumnOne"><strong>Post RP 7 Yr</strong></td>
    <td valign="top" style="background-color:#FFFFFF;"><span class="FormInsideTableTopCell">
      
      <asp:Label ID="postRP7yrNomo" runat="server" >&nbsp;</asp:Label>
    </span></td>
  </tr>
  <tr >
    <td valign="top" height="28" align="right" class="ClinicalEformGridColumnOne"><strong>Post RP 10 Yr</strong></td>
    <td valign="top" style="background-color:#FFFFFF;"><span class="FormInsideTableTopCell">
      
      <asp:Label ID="postRP10yrNomo" runat="server" >&nbsp;</asp:Label>
    </span></td>
  </tr>
</table>
<br/>
<br/>
<br/>
