<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Prostate.Eforms.ProstateSpecimenIdentifiers" CodeFile="ProstateSpecimenIdentifiers.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>

<a name="ProstateSpecimenIdentifiers" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text=""></asp:Label><br/>


<table width="400" cellpadding="5" cellspacing="5" class="eformLargePopulatedTableBlue" >

   <tr id="NoCaseNumMsgTr" runat="server"  class="ClinicalEformPopulatedRowNonClickable" > 
			<td colspan="6" class="ClinicalEformPopulatedColumn" align="center" height="40"> No CASE ID NUMBER has been recorded for this patient.</td>
  </tr>  
  <tr id="HasCaseNumMsgTr" runat="server"  class="ClinicalEformPopulatedRowNonClickable"  > 
		<td colspan="6" class="ClinicalEformPopulatedColumn" align="center" height="40"> The CASE ID NUMBER recorded for this patient has been populated below.</td>            
  </tr>  


   <tr><td><br /></td></tr>
   
   <asp:Repeater ID="HasCaseNumTr" runat="server"  OnItemDataBound="EFormRepeaterOnDataBound" > 
                <ItemTemplate>
	                <tr class="ClinicalEformPopulatedRow" onmouseover="this.className='ClinicalEformHighlightedRow';" onmouseout="this.className='ClinicalEformPopulatedRow';"   onclick="LoadDataEntryForm('Identifiers',  <%# DataBinder.Eval(Container.DataItem, "IdentifierId") %>, 'IdType,Identifier', 'Identifiers');"> 
		               <td style="white-space: nowrap;"><span class="controlBoxTitle">CASE ID NUMBER: </span></td>
		               <td class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "Identifier")%></td>
	                   <td class="ClinicalEformPopulatedColumn"><img alt="" align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="LockImage" runat="server" title="This record has been locked."/>&nbsp;</td>
	                </tr>    
	            </ItemTemplate>
	</asp:Repeater>
   
    <tr ID="NoCaseNumTr" runat="server">
        <td style="white-space: nowrap;">
            <span class="controlBoxTitle">CASE ID NUMBER: </span></td>
        <td height="28">
            <euc:EformTextBox Width="150" RecordId="1"  Table="Identifiers" Field="Identifier" ID="Identifier_1" runat="server" />
            <euc:EformTextBox Width="1px" style="display: none;" RecordId="1"  Table="Identifiers" Field="IdType" ID="IdType_1" runat="server"   />            
        </td>
    </tr>
</table>

<br /><br />

<table width="400" cellpadding="5" cellspacing="5" class="eformLargePopulatedTable">

   <tr id="NoCarisCaseNumMsgTr" runat="server"  class="ClinicalEformPopulatedRowNonClickable" > 
			<td colspan="6" class="ClinicalEformPopulatedColumn" align="center" height="40"> No CARIS CASE ID NUMBER has been recorded for this patient.</td>
  </tr>  
  <tr id="HasCarisCaseNumMsgTr" runat="server"  class="ClinicalEformPopulatedRowNonClickable"  > 
		<td colspan="6" class="ClinicalEformPopulatedColumn" align="center" height="40"> The CARIS CASE ID NUMBER recorded for this patient has been populated below.</td>            
  </tr>  


   <tr><td><br /></td></tr>
   
      <asp:Repeater ID="HasCarisCaseNumTr" runat="server"  OnItemDataBound="EFormRepeaterOnDataBound" > 
                <ItemTemplate>
	                <tr class="ClinicalEformPopulatedRow" onmouseover="this.className='ClinicalEformHighlightedRow';" onmouseout="this.className='ClinicalEformPopulatedRow';"   onclick="LoadDataEntryForm('Identifiers',  <%# DataBinder.Eval(Container.DataItem, "IdentifierId") %>, 'IdType,Identifier', 'Identifiers');"> 
		               <td style="white-space: nowrap;"><span class="controlBoxTitle">CARIS CASE ID NUMBER: </span></td>
		               <td class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "Identifier")%></td>
	                   <td class="ClinicalEformPopulatedColumn"><img alt="" align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="LockImage" runat="server" title="This record has been locked."/>&nbsp;</td>
	                </tr>    
	            </ItemTemplate>
	</asp:Repeater>
	
    <tr ID="NoCarisCaseNumTr" runat="server">
        <td style="white-space: nowrap;">
            <span class="controlBoxTitle">CARIS CASE ID NUMBER: </span></td>
        <td height="28">
            <euc:EformTextBox Width="150" RecordId="2"  Table="Identifiers" Field="Identifier" ID="Identifier_2" runat="server"  />
            <euc:EformTextBox Width="1px" style="display: none;" RecordId="2"  Table="Identifiers" Field="IdType" ID="IdType_2" runat="server"   />            
        </td>
    </tr>
</table>

<br/><br/><br/>

  <script type="text/javascript">

    addAbsentEvent($('<%= Identifier_1.ClientID %>'),$('<%= IdType_1.ClientID %>'),'CASE ID NUMBER');
    addAbsentEvent($('<%= Identifier_2.ClientID %>'),$('<%= IdType_2.ClientID %>'),'CARIS CASE ID NUMBER');

    function addAbsentEvent(identifier,idType,idTypeValue)
    {  
        if (identifier != null)
            $(identifier).addEvent('blur',curry(SetHiddenFields,identifier,idType,idTypeValue));
    }
	
	function SetHiddenFields(identifier,idType,idTypeValue)
    {        
        if (identifier.value != '' )
        { 
            idType.value = idTypeValue;
        }
        else
        {
            idType.value = '';    
        }
    }	
    
  
</script>
