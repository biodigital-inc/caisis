<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Liver.Eforms.LiverSurgeryInterventionalRadiology" CodeFile="LiverSurgeryInterventionalRadiology.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" language="javascript">
	tableArray.InterventionalRadiologyLiverTable = "InterventionalRadiologyLiverTable";
	tableArray.InterventionalRadiologyLiverTable2 = "InterventionalRadiologyLiverTable2";
	tableArray.InterventionalRadiologyLiverTable3 = "InterventionalRadiologyLiverTable3";
	   
</script>
<style type="text/css">

.LocationDropDown
{
    width: 100px;
}

</style>

<a name="LiverSurgeryInterventionalRadiology" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Interventional Radiology"></asp:Label><br/>

<br /><br />
<strong>TACE </strong>
<table width="400" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="InterventionalRadiologyLiverTable">

    <tr>
        <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Date</td>
        <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Location</td>
        <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Notes</td>
        <td class="controlBoxDataGridHeaderFirstCol" height="28">&nbsp;</td>
    </tr>
 
    <asp:Repeater ID="TaceHx" runat="server"  OnItemDataBound="EFormRepeaterOnDataBoundTace"   > 

	    <HeaderTemplate>
		    <tr  ><td align="center" colspan="4"><i> <asp:Literal ID="MostRecentMsg" Runat="server" Visible="false" Text="most recent 10" /></i></td></tr>	    
	    </HeaderTemplate>	    
	    <ItemTemplate> 
			 <tr class="ClinicalEformPopulatedRow" onmouseover="this.className='ClinicalEformHighlightedRow';" onmouseout="this.className='ClinicalEformPopulatedRow';"   onclick="LoadDataEntryForm('Procedures',  <%# DataBinder.Eval(Container.DataItem, "ProcedureId") %>, 'ProcDateText,ProcDate,ProcName,ProcSite,ProcSubsite,ProcNotes', 'Procedures');"> 
			   <td align="left" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "ProcDateText")%></td>
		       <td align="left" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "ProcSubsite")%></td>
		       <td align="left" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "ProcNotes")%></td>
			   <td align="left" class="ClinicalEformPopulatedColumn"><img alt="" align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="LockImage" runat="server" title="This record has been locked."/>&nbsp;</td>
		    </tr>    	
    
	</ItemTemplate>
  </asp:Repeater>
    
    <tr>
         <td style="white-space: nowrap;" class="ClinicalEformGridColumnOne" >
		    <euc:EformHidden                    TABLE="Procedures"  FIELD="ProcName" ID="ProcName_21" RecordID="21"  Runat="server" Value="TACE" />
		    <euc:EformHidden                      TABLE="Procedures"  FIELD="ProcSite" ID="ProcSite_21" RecordID="21"  Runat="server" Value="Liver" />
            
            <euc:EformTextBox style="width:80px;" TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_21" RecordId="21" Runat="server"   ShowCalendar="True" CalcDate="True" class="InputText" EnableHiddenOnUIEvent="ProcSite_21,ProcName_21"  />
            <euc:EformHidden                       Table="Procedures" Field="ProcDate" ID="ProcDate_21"  RecordId="21" Runat="server" ></euc:EformHidden>	</td>

	    
        <td style="white-space: nowrap;" >

		    <euc:EformDropDownList style="width: 110px;" TABLE="Procedures"  FIELD="ProcSubsite" ID="ProcSubsite_21" RecordID="21" Runat="server" ShowEmptyListItem="true" EnableHiddenOnUIEvent="ProcSite_21,ProcName_21">
		        <asp:ListItem ></asp:ListItem>
		        <asp:ListItem Value="Right Lobe" Text="Right Lobe"></asp:ListItem>
		        <asp:ListItem Value="Left Lobe" Text="Left Lobe"></asp:ListItem>
		    </euc:EformDropDownList> </td>

       
         <td style="white-space: nowrap;" >
		    <euc:EformTextBox style="width: 80px;" TABLE="Procedures"  FIELD="ProcNotes" ID="ProcNotes_21" RecordID="21" Runat="server" ShowTextEditor="true" EnableHiddenOnUIEvent="ProcSite_21,ProcName_21"/></td>
  
         <td><euc:EformDeleteIcon ID="EformDeleteIcon2" runat="server" /></td>
   </tr>
   
    <tr style="display: none;">
         <td style="white-space: nowrap;" class="ClinicalEformGridColumnOne" >
		    <euc:EformHidden                    TABLE="Procedures"  FIELD="ProcName" ID="ProcName_22" RecordID="22"  Runat="server"  Value="TACE" />
		    <euc:EformHidden                      TABLE="Procedures"  FIELD="ProcSite" ID="ProcSite_22" RecordID="22"  Runat="server" Value="Liver" />
		    
            <euc:EformTextBox style="width:80px;" TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_22" RecordId="22" Runat="server"   ShowCalendar="True" CalcDate="True" class="InputText" EnableHiddenOnUIEvent="ProcSite_22,ProcName_22"  />
            <euc:EformHidden                       Table="Procedures" Field="ProcDate" ID="ProcDate_22"  RecordId="22" Runat="server" ></euc:EformHidden>	</td>
   
        <td style="white-space: nowrap;" >

		    <euc:EformDropDownList style="width: 110px;" TABLE="Procedures"  FIELD="ProcSubsite" ID="ProcSubsite_22" RecordID="22" Runat="server" ShowEmptyListItem="true" EnableHiddenOnUIEvent="ProcSite_22,ProcName_22">
		        <asp:ListItem ></asp:ListItem>
		        <asp:ListItem Value="Right Lobe" Text="Right Lobe"></asp:ListItem>
		        <asp:ListItem Value="Left Lobe" Text="Left Lobe"></asp:ListItem>
		    </euc:EformDropDownList> </td>

         <td style="white-space: nowrap;" >
		    <euc:EformTextBox style="width: 80px;" TABLE="Procedures"  FIELD="ProcNotes" ID="ProcNotes_22" RecordID="22" Runat="server" ShowTextEditor="true" EnableHiddenOnUIEvent="ProcSite_22,ProcName_22"/></td>
  
         <td><euc:EformDeleteIcon ID="EformDeleteIcon3" runat="server" /></td>
   </tr>
   
    <tr style="display: none;">
         <td style="white-space: nowrap;" class="ClinicalEformGridColumnOne" >
		    <euc:EformHidden                    TABLE="Procedures"  FIELD="ProcName" ID="ProcName_23" RecordID="23"  Runat="server"  Value="TACE" />
		    <euc:EformHidden                      TABLE="Procedures"  FIELD="ProcSite" ID="ProcSite_23" RecordID="23"  Runat="server" Value="Liver" />
		    
            <euc:EformTextBox style="width:80px;" TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_23" RecordID="23" Runat="server"   ShowCalendar="True" CalcDate="True" class="InputText" EnableHiddenOnUIEvent="ProcSite_23,ProcName_23" />
            <euc:EformHidden                       Table="Procedures" Field="ProcDate" ID="ProcDate_23"  RecordID="23" Runat="server" ></euc:EformHidden>	</td>
    
        <td style="white-space: nowrap;" >

		    <euc:EformDropDownList style="width: 110px;" TABLE="Procedures"  FIELD="ProcSubsite" ID="ProcSubsite_23" RecordID="23" Runat="server" ShowEmptyListItem="true" EnableHiddenOnUIEvent="ProcSite_23,ProcName_23">
		        <asp:ListItem ></asp:ListItem>
		        <asp:ListItem Value="Right Lobe" Text="Right Lobe"></asp:ListItem>
		        <asp:ListItem Value="Left Lobe" Text="Left Lobe"></asp:ListItem>
		    </euc:EformDropDownList> </td>

         <td style="white-space: nowrap;" >
		    <euc:EformTextBox style="width: 80px;" TABLE="Procedures"  FIELD="ProcNotes" ID="ProcNotes_23" RecordID="23" Runat="server" ShowTextEditor="true" EnableHiddenOnUIEvent="ProcSite_23,ProcName_23"/></td>
  
         <td><euc:EformDeleteIcon ID="EformDeleteIcon4" runat="server" /></td>
   </tr>    
     <tr style="display: none;">
         <td style="white-space: nowrap;" class="ClinicalEformGridColumnOne" >
		    <euc:EformHidden                    TABLE="Procedures"  FIELD="ProcName" ID="ProcName_24" RecordID="24"  Runat="server"  Value="TACE" />
		    <euc:EformHidden                      TABLE="Procedures"  FIELD="ProcSite" ID="ProcSite_24" RecordID="24"  Runat="server" Value="Liver" />
		    
            <euc:EformTextBox style="width:80px;" TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_24" RecordID="24" Runat="server"   ShowCalendar="True" CalcDate="True" class="InputText" EnableHiddenOnUIEvent="ProcSite_24,ProcName_24" />
            <euc:EformHidden                       Table="Procedures" Field="ProcDate" ID="ProcDate_24"  RecordID="24" Runat="server" ></euc:EformHidden>	</td>
    
        <td style="white-space: nowrap;" >

		    <euc:EformDropDownList style="width: 110px;" TABLE="Procedures"  FIELD="ProcSubsite" ID="ProcSubsite_24" RecordID="24" Runat="server" ShowEmptyListItem="true" EnableHiddenOnUIEvent="ProcSite_24,ProcName_24">
		        <asp:ListItem ></asp:ListItem>
		        <asp:ListItem Value="Right Lobe" Text="Right Lobe"></asp:ListItem>
		        <asp:ListItem Value="Left Lobe" Text="Left Lobe"></asp:ListItem>
		    </euc:EformDropDownList> </td>

         <td style="white-space: nowrap;" >
		    <euc:EformTextBox style="width: 80px;" TABLE="Procedures"  FIELD="ProcNotes" ID="ProcNotes_24" RecordID="24" Runat="server" ShowTextEditor="true" EnableHiddenOnUIEvent="ProcSite_24,ProcName_24" /></td>
  
         <td><euc:EformDeleteIcon ID="EformDeleteIcon5" runat="server" /></td>
   </tr> 
    
   <tr style="display: none;">
         <td style="white-space: nowrap;" class="ClinicalEformGridColumnOne" >
		    <euc:EformHidden                    TABLE="Procedures"  FIELD="ProcName" ID="ProcName_25" RecordID="25"  Runat="server"  Value="TACE" />
		    <euc:EformHidden                      TABLE="Procedures"  FIELD="ProcSite" ID="ProcSite_25" RecordID="25"  Runat="server" Value="Liver" />
		    
            <euc:EformTextBox style="width:80px;" TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_25" RecordID="25" Runat="server"   ShowCalendar="True" CalcDate="True" class="InputText" EnableHiddenOnUIEvent="ProcSite_25,ProcName_25" />
            <euc:EformHidden                       Table="Procedures" Field="ProcDate" ID="ProcDate_25"  RecordID="25" Runat="server" ></euc:EformHidden>	</td>
    
        <td style="white-space: nowrap;" >

		    <euc:EformDropDownList style="width: 110px;" TABLE="Procedures"  FIELD="ProcSubsite" ID="ProcSubsite_25" RecordID="25" Runat="server" ShowEmptyListItem="true" EnableHiddenOnUIEvent="ProcSite_25,ProcName_25" >
		        <asp:ListItem ></asp:ListItem>
		        <asp:ListItem Value="Right Lobe" Text="Right Lobe"></asp:ListItem>
		        <asp:ListItem Value="Left Lobe" Text="Left Lobe"></asp:ListItem>
		    </euc:EformDropDownList> </td>

         <td style="white-space: nowrap;" >
		    <euc:EformTextBox style="width: 80px;" TABLE="Procedures"  FIELD="ProcNotes" ID="ProcNotes_25" RecordID="25" Runat="server" ShowTextEditor="true" EnableHiddenOnUIEvent="ProcSite_25,ProcName_25" /></td>
  
         <td><euc:EformDeleteIcon ID="EformDeleteIcon6" runat="server" /></td>
   </tr>         
     
</table>
<img alt="" src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'InterventionalRadiologyLiverTable');" />
<br /><br />

<strong>PVE </strong>
<table width="400" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="InterventionalRadiologyLiverTable2">
    <tr>
        <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Date</td>
        <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Location</td>
        <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Notes</td>
        <td class="controlBoxDataGridHeaderFirstCol" height="28">&nbsp;</td>
    </tr>

    <asp:Repeater ID="PveHx" runat="server"  OnItemDataBound="EFormRepeaterOnDataBoundPve"   > 

	    <HeaderTemplate>
		    <tr  ><td align="center" colspan="4"><i> <asp:Literal ID="MostRecentMsg" Runat="server" Visible="false" Text="most recent 10" /></i></td></tr>	    
	    </HeaderTemplate>	    
	    <ItemTemplate> 
			 <tr class="ClinicalEformPopulatedRow" onmouseover="this.className='ClinicalEformHighlightedRow';" onmouseout="this.className='ClinicalEformPopulatedRow';"   onclick="LoadDataEntryForm('Procedures',  <%# DataBinder.Eval(Container.DataItem, "ProcedureId") %>, 'ProcDateText,ProcDate,ProcName,ProcSite,ProcSubsite,ProcNotes', 'Procedures');"> 
			   <td align="left" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "ProcDateText")%></td>
		       <td align="left" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "ProcSubsite")%></td>
		       <td align="left" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "ProcNotes")%></td>
			   <td align="left" class="ClinicalEformPopulatedColumn"><img alt="" align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="LockImage" runat="server" title="This record has been locked."/>&nbsp;</td>
		    </tr>    	
    
	</ItemTemplate>
  </asp:Repeater>

   <tr>
         <td style="white-space: nowrap;" class="ClinicalEformGridColumnOne" >
		    <euc:EformHidden                    TABLE="Procedures"  FIELD="ProcName" ID="ProcName_26" RecordID="26"  Runat="server" Value="PVE" />
		    <euc:EformHidden                      TABLE="Procedures"  FIELD="ProcSite" ID="ProcSite_26" RecordID="26"  Runat="server" Value="Liver" />
		    
            <euc:EformTextBox style="width:80px;" TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_26" RecordID="26" Runat="server"   ShowCalendar="True" CalcDate="True" class="InputText" EnableHiddenOnUIEvent="ProcSite_26,ProcName_26"  />
            <euc:EformHidden                       Table="Procedures" Field="ProcDate" ID="ProcDate_26"  RecordID="26" Runat="server" ></euc:EformHidden>	</td>
	    
        <td style="white-space: nowrap;" >

		    <euc:EformDropDownList style="width: 110px;" TABLE="Procedures"  FIELD="ProcSubsite" ID="ProcSubsite_26" RecordID="26" Runat="server" ShowEmptyListItem="true" EnableHiddenOnUIEvent="ProcSite_26,ProcName_26">
		        <asp:ListItem ></asp:ListItem>
		        <asp:ListItem Value="Right Lobe" Text="Right Lobe"></asp:ListItem>
		        <asp:ListItem Value="Left Lobe" Text="Left Lobe"></asp:ListItem>
		    </euc:EformDropDownList> </td>

         <td style="white-space: nowrap;" >
		    <euc:EformTextBox style="width: 80px;" TABLE="Procedures"  FIELD="ProcNotes" ID="ProcNotes_26" RecordID="26" Runat="server" ShowTextEditor="true" EnableHiddenOnUIEvent="ProcSite_26,ProcName_26"/></td>
  
         <td><euc:EformDeleteIcon ID="EformDeleteIcon7" runat="server" /></td>
   </tr> 

   <tr style="display: none;">
         <td style="white-space: nowrap;" class="ClinicalEformGridColumnOne" >
		    <euc:EformHidden                    TABLE="Procedures"  FIELD="ProcName" ID="ProcName_27" RecordID="27"  Runat="server" Value="PVE" />
		    <euc:EformHidden                      TABLE="Procedures"  FIELD="ProcSite" ID="ProcSite_27" RecordID="27"  Runat="server" Value="Liver" />
		    
            <euc:EformTextBox style="width:80px;" TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_27" RecordID="27" Runat="server"   ShowCalendar="True" CalcDate="True" class="InputText" EnableHiddenOnUIEvent="ProcSite_27,ProcName_27"  />
            <euc:EformHidden                       Table="Procedures" Field="ProcDate" ID="ProcDate_27"  RecordID="27" Runat="server" ></euc:EformHidden>	</td>
	    
        <td style="white-space: nowrap;" >

		    <euc:EformDropDownList style="width: 110px;" TABLE="Procedures"  FIELD="ProcSubsite" ID="ProcSubsite_27" RecordID="27" Runat="server" ShowEmptyListItem="true" EnableHiddenOnUIEvent="ProcSite_27,ProcName_27">
		        <asp:ListItem ></asp:ListItem>
		        <asp:ListItem Value="Right Lobe" Text="Right Lobe"></asp:ListItem>
		        <asp:ListItem Value="Left Lobe" Text="Left Lobe"></asp:ListItem>
		    </euc:EformDropDownList> </td>

         <td style="white-space: nowrap;" >
		    <euc:EformTextBox style="width: 80px;" TABLE="Procedures"  FIELD="ProcNotes" ID="ProcNotes_27" RecordID="27" Runat="server" ShowTextEditor="true" EnableHiddenOnUIEvent="ProcSite_27,ProcName_27"/></td>
  
         <td><euc:EformDeleteIcon ID="EformDeleteIcon8" runat="server" /></td>
   </tr> 

   <tr style="display: none;">
         <td style="white-space: nowrap;" class="ClinicalEformGridColumnOne" >
		    <euc:EformHidden                    TABLE="Procedures"  FIELD="ProcName" ID="ProcName_28" RecordID="28"  Runat="server" Value="PVE" />
		    <euc:EformHidden                      TABLE="Procedures"  FIELD="ProcSite" ID="ProcSite_28" RecordID="28"  Runat="server" Value="Liver" />
		    
            <euc:EformTextBox style="width:80px;" TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_28" RecordID="28" Runat="server"   ShowCalendar="True" CalcDate="True" class="InputText" EnableHiddenOnUIEvent="ProcSite_28,ProcName_28"  />
            <euc:EformHidden                       Table="Procedures" Field="ProcDate" ID="ProcDate_28"  RecordID="28" Runat="server" ></euc:EformHidden>	</td>
	    
        <td style="white-space: nowrap;" >

		    <euc:EformDropDownList style="width: 110px;" TABLE="Procedures"  FIELD="ProcSubsite" ID="ProcSubsite_28" RecordID="28" Runat="server" ShowEmptyListItem="true" EnableHiddenOnUIEvent="ProcSite_28,ProcName_28">
		        <asp:ListItem ></asp:ListItem>
		        <asp:ListItem Value="Right Lobe" Text="Right Lobe"></asp:ListItem>
		        <asp:ListItem Value="Left Lobe" Text="Left Lobe"></asp:ListItem>
		    </euc:EformDropDownList> </td>

         <td style="white-space: nowrap;" >
		    <euc:EformTextBox style="width: 80px;" TABLE="Procedures"  FIELD="ProcNotes" ID="ProcNotes_28" RecordID="28" Runat="server" ShowTextEditor="true" EnableHiddenOnUIEvent="ProcSite_28,ProcName_28"/></td>
  
         <td><euc:EformDeleteIcon ID="EformDeleteIcon9" runat="server" /></td>
   </tr> 
 
 
   <tr style="display: none;">
         <td style="white-space: nowrap;" class="ClinicalEformGridColumnOne" >
		    <euc:EformHidden                    TABLE="Procedures"  FIELD="ProcName" ID="ProcName_29" RecordID="29"  Runat="server" Value="PVE" />
		    <euc:EformHidden                      TABLE="Procedures"  FIELD="ProcSite" ID="ProcSite_29" RecordID="29"  Runat="server" Value="Liver" />
		    
            <euc:EformTextBox style="width:80px;" TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_29" RecordID="29" Runat="server"   ShowCalendar="True" CalcDate="True" class="InputText" EnableHiddenOnUIEvent="ProcSite_29,ProcName_29"  />
            <euc:EformHidden                       Table="Procedures" Field="ProcDate" ID="ProcDate_29"  RecordID="29" Runat="server" ></euc:EformHidden>	</td>
	    
        <td style="white-space: nowrap;" >

		    <euc:EformDropDownList style="width: 110px;" TABLE="Procedures"  FIELD="ProcSubsite" ID="ProcSubsite_29" RecordID="29" Runat="server" ShowEmptyListItem="true" EnableHiddenOnUIEvent="ProcSite_29,ProcName_29">
		        <asp:ListItem ></asp:ListItem>
		        <asp:ListItem Value="Right Lobe" Text="Right Lobe"></asp:ListItem>
		        <asp:ListItem Value="Left Lobe" Text="Left Lobe"></asp:ListItem>
		    </euc:EformDropDownList> </td>

         <td style="white-space: nowrap;" >
		    <euc:EformTextBox style="width: 80px;" TABLE="Procedures"  FIELD="ProcNotes" ID="ProcNotes_29" RecordID="29" Runat="server" ShowTextEditor="true" EnableHiddenOnUIEvent="ProcSite_29,ProcName_29"/></td>
  
         <td><euc:EformDeleteIcon ID="EformDeleteIcon10" runat="server" /></td>
   </tr>

   <tr style="display: none;">
         <td style="white-space: nowrap;" class="ClinicalEformGridColumnOne" >
		    <euc:EformHidden                    TABLE="Procedures"  FIELD="ProcName" ID="ProcName_30" RecordID="30"  Runat="server" Value="PVE" />
		    <euc:EformHidden                      TABLE="Procedures"  FIELD="ProcSite" ID="ProcSite_30" RecordID="30"  Runat="server" Value="Liver" />
		    
            <euc:EformTextBox style="width:80px;" TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_30" RecordID="30" Runat="server"   ShowCalendar="True" CalcDate="True" class="InputText" EnableHiddenOnUIEvent="ProcSite_30,ProcName_30"  />
            <euc:EformHidden                       Table="Procedures" Field="ProcDate" ID="ProcDate_30"  RecordID="30" Runat="server" ></euc:EformHidden>	</td>
	    
        <td style="white-space: nowrap;" >

		    <euc:EformDropDownList style="width: 110px;" TABLE="Procedures"  FIELD="ProcSubsite" ID="ProcSubsite_30" RecordID="30" Runat="server" ShowEmptyListItem="true" EnableHiddenOnUIEvent="ProcSite_30,ProcName_30">
		        <asp:ListItem ></asp:ListItem>
		        <asp:ListItem Value="Right Lobe" Text="Right Lobe"></asp:ListItem>
		        <asp:ListItem Value="Left Lobe" Text="Left Lobe"></asp:ListItem>
		    </euc:EformDropDownList> </td>

         <td style="white-space: nowrap;" >
		    <euc:EformTextBox style="width: 80px;" TABLE="Procedures"  FIELD="ProcNotes" ID="ProcNotes_30" RecordID="30" Runat="server" ShowTextEditor="true" EnableHiddenOnUIEvent="ProcSite_30,ProcName_30"/></td>
  
         <td><euc:EformDeleteIcon ID="EformDeleteIcon12" runat="server" /></td>
   </tr>   
      
</table>
<img alt="" src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'InterventionalRadiologyLiverTable2');" />
<br /><br />

<strong>RFA </strong>
<table width="550" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="InterventionalRadiologyLiverTable3">

    <tr>
        <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Date</td>
        <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Surgeon</td>
        <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Location</td>
        <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Approach</td>
        <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Notes</td>
        <td class="controlBoxDataGridHeaderFirstCol" height="28">&nbsp;</td>
    </tr>
 
     <asp:Repeater ID="RfaHx" runat="server"  OnItemDataBound="EFormRepeaterOnDataBoundRfa"   > 

	    <HeaderTemplate>
		    <tr  ><td align="center" colspan="6"><i> <asp:Literal ID="MostRecentMsg" Runat="server" Visible="false" Text="most recent 10" /></i></td></tr>	    
	    </HeaderTemplate>	    
	    <ItemTemplate> 
			 <tr class="ClinicalEformPopulatedRow" onmouseover="this.className='ClinicalEformHighlightedRow';" onmouseout="this.className='ClinicalEformPopulatedRow';"   onclick="LoadDataEntryForm('Procedures',  <%# DataBinder.Eval(Container.DataItem, "ProcedureId") %>, 'ProcDateText,ProcDate,ProcName,ProcSurgeon,ProcSite,ProcSubsite,ProcApproach,ProcNotes', 'Procedures');"> 
			   <td align="left" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "ProcDateText")%></td>
		       <td align="left" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "ProcSurgeon")%></td>
		       <td align="left" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "ProcSubsite")%></td>
		       <td align="left" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "ProcApproach")%></td>
		       <td align="left" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "ProcNotes")%></td>
			   <td align="left" class="ClinicalEformPopulatedColumn"><img alt="" align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="LockImage" runat="server" title="This record has been locked."/>&nbsp;</td>
		    </tr>    	
    
	</ItemTemplate>
  </asp:Repeater>

     <tr>
         <td style="white-space: nowrap;" class="ClinicalEformGridColumnOne" valign="top" >
		    <euc:EformHidden                    TABLE="Procedures"  FIELD="ProcName" ID="ProcName_31" RecordID="31"  Runat="server" EnableHiddenOnUIEvent="ProcSite_31" Value="RFA" />
		    <euc:EformHidden                      TABLE="Procedures"  FIELD="ProcSite" ID="ProcSite_31" RecordID="31"  Runat="server" Value="Liver" />
		    
            <euc:EformTextBox style="width:80px;" TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_31" RecordID="31" Runat="server"   ShowCalendar="True" CalcDate="True" class="InputText" EnableHiddenOnUIEvent="ProcSite_31,ProcName_31" />
            <euc:EformHidden                       Table="Procedures" Field="ProcDate" ID="ProcDate_31"  RecordID="31" Runat="server" ></euc:EformHidden>	</td>

         <td style="white-space: nowrap;" valign="top" >
		    <euc:EformComboBox style="width: 80px;" TABLE="Procedures"  FIELD="ProcSurgeon" ID="ProcSurgeon_31" RecordID="31" LookupCode="Physician"  Runat="server" EnableHiddenOnUIEvent="ProcSite_31,ProcName_31"/></td>

	    
        <td style="white-space: nowrap;" valign="top" >
   
		    <euc:EformExtendedCheckBoxList DropDown="true" DropDownTextCssClass="LocationDropDown" ShowOther="false"   LookupCode="SegmentSubSite,Disease,Liver" TABLE="Procedures"  FIELD="ProcSubsite" ID="ProcSubsite_31" RecordID="31" Runat="server" RepeatColumns="1" RepeatDirection="Vertical" RepeatLayout="Table" EnableHiddenOnUIEvent="ProcSite_31,ProcName_31" /></td>
            
         <td style="white-space: nowrap;" valign="top" >
		    <euc:EformComboBox style="width: 80px;" TABLE="Procedures"  FIELD="ProcApproach" ID="ProcApproach_31" LookupCode="OpApproach"  RecordID="31" Runat="server" DropDownWidth="200px"  EnableHiddenOnUIEvent="ProcSite_31,ProcName_31"/></td>

         <td style="white-space: nowrap;" valign="top" >
		    <euc:EformTextBox style="width: 80px;" TABLE="Procedures"  FIELD="ProcNotes" ID="ProcNotes_31" RecordID="31" Runat="server" ShowTextEditor="true" EnableHiddenOnUIEvent="ProcSite_31,ProcName_31"/></td>
  
         <td valign="top"><euc:EformDeleteIcon ID="EformDeleteIcon1" runat="server" /></td>
   </tr>
   <tr style="display: none;">
         <td style="white-space: nowrap;" class="ClinicalEformGridColumnOne" valign="top" >
		    <euc:EformHidden                    TABLE="Procedures"  FIELD="ProcName" ID="ProcName_32" RecordID="32"  Runat="server"  Value="RFA" />
		    <euc:EformHidden                      TABLE="Procedures"  FIELD="ProcSite" ID="ProcSite_32" RecordID="32"  Runat="server" Value="Liver" />
		    
            <euc:EformTextBox style="width:80px;" TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_32" RecordID="32" Runat="server"   ShowCalendar="True" CalcDate="True" class="InputText" EnableHiddenOnUIEvent="ProcSite_32,ProcName_32" />
            <euc:EformHidden                       Table="Procedures" Field="ProcDate" ID="ProcDate_32"  RecordID="32" Runat="server" ></euc:EformHidden>	</td>

         <td style="white-space: nowrap;" valign="top" >
		    <euc:EformComboBox style="width: 80px;" TABLE="Procedures"  FIELD="ProcSurgeon" ID="ProcSurgeon_32" RecordID="32" LookupCode="Physician"  Runat="server" EnableHiddenOnUIEvent="ProcSite_32,ProcName_32" /></td>

	    
        <td style="white-space: nowrap;" valign="top" >
		    <euc:EformExtendedCheckBoxList DropDown="true" DropDownTextCssClass="LocationDropDown" ShowOther="false"   LookupCode="SegmentSubSite,Disease,Liver" TABLE="Procedures"  FIELD="ProcSubsite" ID="ProcSubsite_32" RecordID="32" Runat="server" RepeatColumns="1" RepeatDirection="Vertical" RepeatLayout="Table" EnableHiddenOnUIEvent="ProcSite_32,ProcName_32" /></td>
         <td style="white-space: nowrap;" valign="top" >
		    <euc:EformComboBox style="width: 80px;" TABLE="Procedures"  FIELD="ProcApproach" ID="ProcApproach_32" LookupCode="OpApproach"  RecordID="32" Runat="server" DropDownWidth="200px"  EnableHiddenOnUIEvent="ProcSite_32,ProcName_32"/></td>

         <td style="white-space: nowrap;" valign="top" >
		    <euc:EformTextBox style="width: 80px;" TABLE="Procedures"  FIELD="ProcNotes" ID="EformTextBox2" RecordID="32" Runat="server" ShowTextEditor="true" EnableHiddenOnUIEvent="ProcSite_32,ProcName_32" /></td>
  
         <td valign="top"><euc:EformDeleteIcon runat="server" /></td>
   </tr>    

   <tr style="display: none;">
         <td style="white-space: nowrap;" class="ClinicalEformGridColumnOne" valign="top" >
		    <euc:EformHidden                    TABLE="Procedures"  FIELD="ProcName" ID="ProcName_33" RecordID="33"  Runat="server"  Value="RFA" />
		    <euc:EformHidden                      TABLE="Procedures"  FIELD="ProcSite" ID="ProcSite_33" RecordID="33"  Runat="server" Value="Liver" />
		    
            <euc:EformTextBox style="width:80px;" TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_33" RecordID="33" Runat="server"   ShowCalendar="True" CalcDate="True" class="InputText" EnableHiddenOnUIEvent="ProcSite_33,ProcName_33" />
            <euc:EformHidden                       Table="Procedures" Field="ProcDate" ID="ProcDate_33"  RecordID="33" Runat="server" ></euc:EformHidden>	</td>

         <td style="white-space: nowrap;" valign="top" >
		    <euc:EformComboBox style="width: 80px;" TABLE="Procedures"  FIELD="ProcSurgeon" ID="ProcSurgeon_33" RecordID="33" LookupCode="Physician"  Runat="server" EnableHiddenOnUIEvent="ProcSite_33,ProcName_33"/></td>

	    
        <td style="white-space: nowrap;" valign="top" >
		    <euc:EformExtendedCheckBoxList DropDown="true" DropDownTextCssClass="LocationDropDown" ShowOther="false"   LookupCode="SegmentSubSite,Disease,Liver" TABLE="Procedures"  FIELD="ProcSubsite" ID="ProcSubsite_33" RecordID="33" Runat="server" RepeatColumns="1" RepeatDirection="Vertical" RepeatLayout="Table" EnableHiddenOnUIEvent="ProcSite_33,ProcName_33" /></td>
         <td style="white-space: nowrap;" valign="top" >
		    <euc:EformComboBox style="width: 80px;" TABLE="Procedures"  FIELD="ProcApproach" ID="ProcApproach_33" LookupCode="OpApproach"  RecordID="33" Runat="server" DropDownWidth="200px" EnableHiddenOnUIEvent="ProcSite_33,ProcName_33" /></td>

         <td style="white-space: nowrap;" valign="top" >
		    <euc:EformTextBox style="width: 80px;" TABLE="Procedures"  FIELD="ProcNotes" ID="ProcNotes_33" RecordID="33" Runat="server" ShowTextEditor="true" EnableHiddenOnUIEvent="ProcSite_33,ProcName_33"/></td>
  
         <td valign="top"><euc:EformDeleteIcon ID="EformDeleteIcon11" runat="server" /></td>
   </tr>    

   <tr style="display: none;">
         <td style="white-space: nowrap;" class="ClinicalEformGridColumnOne" valign="top" >
		    <euc:EformHidden                    TABLE="Procedures"  FIELD="ProcName" ID="ProcName_34" RecordID="34"  Runat="server"  Value="RFA" />
		    <euc:EformHidden                      TABLE="Procedures"  FIELD="ProcSite" ID="ProcSite_34" RecordID="34"  Runat="server" Value="Liver" />
		    
            <euc:EformTextBox style="width:80px;" TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_34" RecordID="34" Runat="server"   ShowCalendar="True" CalcDate="True" class="InputText" EnableHiddenOnUIEvent="ProcSite_34,ProcName_34" />
            <euc:EformHidden                       Table="Procedures" Field="ProcDate" ID="ProcDate_34"  RecordID="34" Runat="server" ></euc:EformHidden>	</td>

         <td style="white-space: nowrap;" valign="top" >
		    <euc:EformComboBox style="width: 80px;" TABLE="Procedures"  FIELD="ProcSurgeon" ID="ProcSurgeon_34" RecordID="34" LookupCode="Physician"  Runat="server" EnableHiddenOnUIEvent="ProcSite_34,ProcName_34" /></td>

	    
        <td style="white-space: nowrap;" valign="top" >
		    <euc:EformExtendedCheckBoxList DropDown="true" DropDownTextCssClass="LocationDropDown" ShowOther="false"   LookupCode="SegmentSubSite,Disease,Liver" TABLE="Procedures"  FIELD="ProcSubsite" ID="ProcSubsite_34" RecordID="34" Runat="server" RepeatColumns="1" RepeatDirection="Vertical" RepeatLayout="Table" EnableHiddenOnUIEvent="ProcSite_34,ProcName_34" /></td>
         <td style="white-space: nowrap;" valign="top" >
		    <euc:EformComboBox style="width: 80px;" TABLE="Procedures"  FIELD="ProcApproach" ID="ProcApproach_34" LookupCode="OpApproach"  RecordID="34" Runat="server" DropDownWidth="200px" EnableHiddenOnUIEvent="ProcSite_34,ProcName_34" /></td>

         <td style="white-space: nowrap;" valign="top" >
		    <euc:EformTextBox style="width: 80px;" TABLE="Procedures"  FIELD="ProcNotes" ID="ProcNotes_34" RecordID="34" Runat="server" ShowTextEditor="true" EnableHiddenOnUIEvent="ProcSite_34,ProcName_34"/></td>
  
         <td valign="top"><euc:EformDeleteIcon ID="EformDeleteIcon13" runat="server" /></td>
   </tr>    

   <tr style="display: none;">
         <td style="white-space: nowrap;" class="ClinicalEformGridColumnOne" valign="top" >
		    <euc:EformHidden                    TABLE="Procedures"  FIELD="ProcName" ID="ProcName_35" RecordID="35"  Runat="server"  Value="RFA" />
		    <euc:EformHidden                      TABLE="Procedures"  FIELD="ProcSite" ID="ProcSite_35" RecordID="35"  Runat="server" Value="Liver" />
		    
            <euc:EformTextBox style="width:80px;" TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_35" RecordID="35" Runat="server"   ShowCalendar="True" CalcDate="True" class="InputText" EnableHiddenOnUIEvent="ProcSite_35,ProcName_35" />
            <euc:EformHidden                       Table="Procedures" Field="ProcDate" ID="ProcDate_35"  RecordID="35" Runat="server" ></euc:EformHidden>	</td>

         <td style="white-space: nowrap;" valign="top" >
		    <euc:EformComboBox style="width: 80px;" TABLE="Procedures"  FIELD="ProcSurgeon" ID="ProcSurgeon_35" RecordID="35" LookupCode="Physician"  Runat="server" EnableHiddenOnUIEvent="ProcSite_35,ProcName_35"/></td>

	    
        <td style="white-space: nowrap;" valign="top" >
		    <euc:EformExtendedCheckBoxList DropDown="true" DropDownTextCssClass="LocationDropDown" ShowOther="false"   LookupCode="SegmentSubSite,Disease,Liver" TABLE="Procedures"  FIELD="ProcSubsite" ID="ProcSubsite_35" RecordID="35" Runat="server" RepeatColumns="1" RepeatDirection="Vertical" RepeatLayout="Table" EnableHiddenOnUIEvent="ProcSite_35,ProcName_35" /></td>
         <td style="white-space: nowrap;" valign="top" >
		    <euc:EformComboBox style="width: 80px;" TABLE="Procedures"  FIELD="ProcApproach" ID="ProcApproach_35" LookupCode="OpApproach"  RecordID="35" Runat="server" DropDownWidth="200px"  EnableHiddenOnUIEvent="ProcSite_35,ProcName_35"/></td>

         <td style="white-space: nowrap;" valign="top" >
		    <euc:EformTextBox style="width: 80px;" TABLE="Procedures"  FIELD="ProcNotes" ID="ProcNotes_35" RecordID="35" Runat="server" ShowTextEditor="true" EnableHiddenOnUIEvent="ProcSite_35,ProcName_35"/></td>
  
         <td valign="top"><euc:EformDeleteIcon ID="EformDeleteIcon14" runat="server" /></td>
   </tr>  
</table>
<img alt="" src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'InterventionalRadiologyLiverTable3');" />
<br/><br/><br />
