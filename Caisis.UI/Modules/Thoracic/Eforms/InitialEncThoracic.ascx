<%@ Control Language="C#" Inherits="Caisis.UI.Modules.Thoracic.Eforms.InitialEncThoracic" CodeFile="InitialEncThoracic.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<script language="javascript" type="text/javascript">
</script>

<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>

<a name="InitialEncThoracic" /><span class="controlBoxTitle">Initial Encounter</span> <br/>

<table width="450" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="EncTable">
  <tr>
		<td  class="controlBoxDataGridTitleColumn">Date</td>
		<td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Presentation</td>
		<td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Zubrod Score</td>
		<td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
  </tr>
  
  <asp:Repeater ID="EncountersRpt" runat="server" OnItemDataBound="EFormRepeaterOnDataBound"> 
	<ItemTemplate> 
		<tr class="ClinicalEformPopulatedRow" onmouseover="this.className='ClinicalEformHighlightedRow';" onmouseout="this.className='ClinicalEformPopulatedRow';"  onclick="LoadDataEntryForm('Encounters', <%# DataBinder.Eval(Container.DataItem, "EncounterId") %>, 'EncDateText,EncDate,EncPresentation,EncZubrod_Score,EncQuality', 'Encounters');"> 
			<td class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "EncDateText")%>&nbsp;</td>
			<td class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "EncPresentation")%>&nbsp;</td>
			<td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "EncZubrod_Score")%>&nbsp;</td>
			<td class="ClinicalEformPopulatedColumn"><img alt="" align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="LockImage" runat="server" title="This record has been locked."/>&nbsp;</td>
		</tr>      
	</ItemTemplate>
  </asp:Repeater>
  
  <tr>
	 <td><euc:EformTextBox RecordId="1" ShowCalendar="True" CalcDate="True" Width="100px" TABLE="Encounters" FIELD="EncDateText" 
	    Runat="server" ID="EncDateText_1"/>
		    <euc:EformHidden RecordId="1" TABLE="Encounters" FIELD="EncDate" Runat="server" ID="EncDate_1"/>
	    </td>
    <td><euc:EformDropDownList RecordId="1" Width="100px" TABLE="Encounters" FIELD="EncPresentation" Runat="server" ID="EncPresentation_1" 
        LookupCode="EncPresentation,Disease,Thoracic"/></td>
	<td><euc:EformTextBox RecordId="1" Width="150px" TABLE="Encounters" FIELD="EncZubrod_Score" Runat="server" ID="EncZubrod_Score_1"/>
	    <euc:EformTextBox RecordId="1" Width="1px" style="display:none" TABLE="Encounters" FIELD="EncQuality" Runat="server" ID="EncQuality_1"/></td>
	<td><euc:EformDeleteIcon runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>
</table><br /><br />

<script type="text/javascript">
    //Adds events to controls
    function addEvents(encDateText,encPresentation,encZubrod,encQlty)
    { 
        $(encDateText).addEvent('blur',curry(AutoPopulates,encDateText,encPresentation,encZubrod,encQlty));
        $(encPresentation).addEvent('blur',curry(AutoPopulates,encDateText,encPresentation,encZubrod,encQlty));
        $(encZubrod).addEvent('blur',curry(AutoPopulates,encDateText,encPresentation,encZubrod,encQlty));
    }
 
    addEvents($('<%= EncDateText_1.ClientID %>'),$('<%= EncPresentation_1.ClientID %>'),$('<%= EncZubrod_Score_1.ClientID %>'),$('<%= EncQuality_1.ClientID %>'));


    function AutoPopulates(encDateText,encPresentation,encZubrod,encQlty)
    {
       if (encDateText.value != '' || encPresentation.value != '' || encZubrod.value != '' )
        {
           encQlty.value = 'STD';
        }
        else
        {
            encQlty.value = '';
        }
    }

</script>
