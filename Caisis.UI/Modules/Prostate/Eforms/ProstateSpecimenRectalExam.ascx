<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Prostate.Eforms.ProstateSpecimenRectalExam" CodeFile="ProstateSpecimenRectalExam.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css">

<a name="ProstateSpecimenRectalExam" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text=""></asp:Label><br/>
   <table border="0" cellspacing="0" cellpadding="5" class="eformLargePopulatedTableBlue" >
      <tr>
        <td align="left" style="white-space: nowrap;">
            <strong>Date: </strong> 
                <euc:EformTextBox Width="100px"  Runat="server" RecordId="1" ID="EncDateText_1" TABLE="Encounters" FIELD="EncDateText" ShowCalendar="true" CalcDate="true" />  		    
                <euc:EformHidden Runat="server" RecordId="1" ID="EncDate_1" TABLE="Encounters" FIELD="EncDate" />
        </td>
        <td align="left" style="white-space: nowrap;">
            <strong>Result at Initial Diagnosis: </strong> 
              <euc:EformDropDownList  DropDownHeight="auto" Width="100px" RecordId="1" ParentRecordId="1" Table="EncRectalExams" Field="DRE_Result" ID="DRE_Result" Runat="server" ShowEmptyListItem="true" >
                <asp:ListItem></asp:ListItem>
                <asp:ListItem Value="Normal" Text="Normal"></asp:ListItem>
                <asp:ListItem Value="Enlarged" Text="Enlarged"></asp:ListItem>
                <asp:ListItem Value="Nodule" Text="Nodule"></asp:ListItem>
                <asp:ListItem Value="Assymetry" Text="Assymetry"></asp:ListItem>
                <asp:ListItem Value="Induration" Text="Induration"></asp:ListItem>
              </euc:EformDropDownList>    
              
              <euc:EformTextBox Width="1px" style="display: none;"  Runat="server" RecordId="1" ID="EncNotes_1" TABLE="Encounters" FIELD="EncNotes"  />  		    
   
        </td>
      </tr>
    </table>
<br/><br/><br/>
<script type="text/javascript">

    addAbsentEvent($('<%= EncDateText_1.ClientID %>'),$('<%= DRE_Result.ClientID %>'),$('<%= EncNotes_1.ClientID %>'));

    function addAbsentEvent(encDateText,dreResult,encNotes)
    {  
        $(dreResult).addEvent('blur',curry(SetHiddenFields,encDateText,dreResult,encNotes));
        $(encDateText).addEvent('blur',curry(SetHiddenFields,encDateText,dreResult,encNotes));
    }
    
    function SetHiddenFields(encDateText,dreResult,encNotes)
    {
        if (dreResult.value != '')
        {
            if (encDateText.value == '')
            {
                encDateText.value = 'Not Collected';
                encNotes.value = 'Encounter record needed for storing DRE child record';
            }
            
            if (encDateText.value == 'Not Collected')
                encNotes.value = 'Encounter record needed for storing DRE child record';
            else
                encNotes.value = '';
            
        
        }
    }
    

</script>