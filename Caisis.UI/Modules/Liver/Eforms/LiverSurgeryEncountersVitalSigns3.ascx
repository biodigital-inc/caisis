<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Liver.Eforms.LiverSurgeryEncountersVitalSigns3" CodeFile="LiverSurgeryEncountersVitalSigns3.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css" />


<a name="LiverSurgeryEncountersVitalSigns3" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Encounter Assessment"></asp:Label><br/>

<br /><br />
<table  border="0" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="Table1">
          
    <asp:Repeater ID="EncounterHx" runat="server"  OnItemDataBound="EFormRepeaterOnDataBound"   > 

	    <HeaderTemplate>
            <tr class="controlBoxDataGridTitleColumn" >
	            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;"  >&nbsp;Date</td>
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;" >Height (cm)</td>
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;" >Weight (kg)</td>
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;" >BMI</td>
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;" >Hospital</td>
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;" >&nbsp;</td>
            </tr>
		    <tr  ><td align="center" colspan="6"><i> <asp:Literal ID="MostRecentMsg" Runat="server" Visible="false" Text="most recent 10" /></i></td></tr>	    
	    </HeaderTemplate>	    
	    <ItemTemplate> 
			 <tr class="ClinicalEformPopulatedRow" onmouseover="this.className='ClinicalEformHighlightedRow';" onmouseout="this.className='ClinicalEformPopulatedRow';"   onclick="LoadDataEntryForm('Encounters',  <%# DataBinder.Eval(Container.DataItem, "EncounterId") %>, 'EncDateText,EncHeight,EncWeight,EncBMI,EncInstitution,EncNotes', 'Encounters');"> 
			   <td align="left" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "EncDateText")%></td>
		       <td align="left" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "EncHeight")%></td>
		       <td align="left" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "EncWeight")%></td>
		       <td align="left" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "EncBMI")%></td>
		       <td align="left" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "EncInstitution")%></td>
			   <td align="left" class="ClinicalEformPopulatedColumn"><img alt="" align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="LockImage" runat="server" title="This record has been locked."/>&nbsp;</td>
		    </tr>    	
    
	</ItemTemplate>
  </asp:Repeater>
  
  <tr id="NoEncHxMsgTr" runat="server"  class="ClinicalEformPopulatedRowNonClickable" > 
			<td colspan="6" class="ClinicalEformPopulatedColumn" align="center" height="40"> No encounter history exists for this patient.</td>
  </tr>  

</table>

<br /><br />

<table width="700" border="0" cellspacing="0" cellpadding="10" style="border: solid 1px #cccccc;">
  <tr>
    <td width="50" align="right" class="ClinicalEformGridColumnOne"><strong>Date</strong></td>
    <td width="120" class="ClinicalEformGridColumnOne"><euc:EformTextBox id="EncDateText" RecordId="1" Table="Encounters" Field="EncDateText" ShowCalendar="True" CalcDate="True" Runat="server" Width="80px"/>
                                               		   <euc:EformHidden id="EncDate" RecordId="1" Table="Encounters" Field="EncDate" Runat="server"/></td>
    <td width="50" align="right" class="ClinicalEformGridColumnTwo"><strong>Height (cm)</strong></td>
    <td width="100"  class="ClinicalEformGridColumnTwo " ><euc:EformTextBox ShowCalendar="False" CalcDate="False" style="width:60px;" RecordId="1" TABLE="Encounters" FIELD="EncHeight" Runat="server" ID="Height" ShowNumberPad="true"/></td>
    <td width="50" align="right" class="ClinicalEformGridColumnTwo"><strong>Weight (kg)</strong></td>
    <td width="100"  class="ClinicalEformGridColumnTwo"><euc:EformTextBox ShowCalendar="False" CalcDate="False" style="width:60px;" RecordId="1" TABLE="Encounters" FIELD="EncWeight" Runat="server" ID="Weight" ShowNumberPad="true"/></td>
    <td width="50" align="right" class="ClinicalEformGridColumnOne"><strong>BMI</strong></td>
    <td width="100" class="ClinicalEformGridColumnOne"><euc:EformTextBox ShowCalendar="False" CalcDate="False" style="width:60px;" RecordId="1" TABLE="Encounters" FIELD="EncBMI" Runat="server" ID="BMI" ShowNumberPad="true" ReadOnly="true"/>

    <euc:EformHidden ShowCalendar="False" CalcDate="False" style="width:1px;" RecordId="1" TABLE="Encounters" FIELD="EncBSA" Runat="server" ID="BSA" ShowNumberPad="true" ReadOnly="true" Enabled="false"/></td>
  </tr>
  <tr>
    <td width="50" align="right"  class="ClinicalEformGridColumnTwo"><strong>Hospital</strong></td>
    <td width="100"  class="ClinicalEformGridColumnTwo"><euc:EformComboBox style="width:80px;" RecordId="1" TABLE="Encounters" FIELD="EncInstitution" Runat="server" ID="EncInstitution" LookupCode="Institution,Disease,@DiseaseView" /></td>
    <td align="right" class="ClinicalEformGridColumnOne"><strong>Notes</strong></td>
    <td width="250"  class="ClinicalEformGridColumnOne " colspan="3" ><euc:EformTextArea TextMode="MultiLine" style="width:220px;" RecordId="1"  TABLE="Encounters" FIELD="EncNotes" Runat="server" ID="EncNotes" ShowTextEditor="true"/></td>
  </tr>
</table>
<br/>
<br/>
<br/>
