<%@ Control Language="c#" Inherits="Caisis.UI.Modules.HeadNeck.Eforms.OropharynxIntentionToTreat" CodeFile="OropharynxIntentionToTreat.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>

<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>

<a name="OropharynxIntentionToTreat" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Treatment Plan"></asp:Label><br/>
<table cellpadding="5" cellspacing="0" class="eformLargePopulatedTable">
          <tr>
			
				<td valign="top" style="white-space: nowrap; display: none;"><strong>Date</strong><br />								
					<euc:EformTextBox style="width:100px"  TABLE="NoTable" FIELD="IntentionToTreatDateText" Runat="server" ShowCalendar="True" CalcDate="True" ID="IntentionToTreatDateText" />
					<euc:EformTextBox Width="1px" style="display: none;" RecordId="1" TABLE="Encounters" FIELD="EncNotes" Runat="server" ID="EncNotes" />

   			    </td>
              <td valign="top">
                    <euc:EformExtendedRadioButtonList style="white-space: nowrap;" TABLE="NoTable" FIELD="IntentionToTreatValues" Runat="server" ID="IntentionToTreatValues" RepeatDirection="Vertical" RepeatColumns="2" ShowOther="true" RepeatLayout="Table" >
                        <asp:ListItem Value="None" Text="None"></asp:ListItem>
                        <asp:ListItem Value="Surgery alone" Text="Surgery alone"></asp:ListItem>
                        <asp:ListItem Value="RT alone" Text="RT alone"></asp:ListItem>
                        <asp:ListItem Value="Chemo alone" Text="Chemo alone"></asp:ListItem>
                        <asp:ListItem Value="Sequential Chemo-RT" Text="Sequential Chemo-RT"></asp:ListItem>
                        <asp:ListItem Value="Concurrent Chemo-RT" Text="Concurrent Chemo-RT"></asp:ListItem>
                        <asp:ListItem Value="Surgery, then post-op RT" Text="Surgery, then post-op RT"></asp:ListItem>
                        <asp:ListItem Value="Surgery, then post-op CCRT" Text="Surgery, then post-op CCRT"></asp:ListItem>
                        <asp:ListItem Value="Neo-adjuvant chem then surgery" Text="Neo-adjuvant chem then surgery"></asp:ListItem>
                        <asp:ListItem Value="Neo-adjuvant chem then surgery + RT" Text="Neo-adjuvant chem then surgery + RT"></asp:ListItem>                   
                    </euc:EformExtendedRadioButtonList>
              </td>

              
          </tr>            		  
</table>
<br/><br/><br/>

<script type="text/javascript">
    /* <![CDATA[ */

    addBlur($('<%= IntentionToTreatDateText.ClientID %>'),$('<%= IntentionToTreatValues.ClientID %>'),$('<%= EncNotes.ClientID %>'));
   
    //Adds blur event to combo
    function addBlur(date,values,notes)
    {  
        $(date).addEvent('blur',curry(SetHiddenFields,date,values,notes));
       
        var rbl = values.getElementsByTagName('input');
        for (var j = 0; j < rbl.length; j++)
        {
            var rblRef = rbl[j];
            if (rblRef.type == 'radio')
                  $(rblRef).addEvent('click',curry(SetHiddenFields,date,values,notes));
            else if (rblRef.type == 'text')
                  $(rblRef).addEvent('blur',curry(SetHiddenFields,date,values,notes));
        } 
        
        ShowOnLoad(date,values,notes);
    }

    /* ]]> */
    function ShowOnLoad(date,values,notes)
    {
         // show on load
        if (notes.value != '')
        {   
            var notesValue = new String(notes.value);
            var selectedValue = new String();
            
            var selectedValue = notesValue.substring(notesValue.indexOf(':  ')+1);
            selectedValue = TrimString(selectedValue);
            
            // if selectedValue is not a rb list item, it must be an "Other" value; insert in "Other" textbox
            var isOtherValue = true;
            var rbl = values.getElementsByTagName('input');
            for (var j = 0; j < rbl.length; j++)
            {               
                var rblRef = rbl[j];                                
                if (rblRef.type == 'radio' && rblRef.value == selectedValue)
                {
                    isOtherValue = false;
                    rbl[j].checked = true;                    
                }               
            } 
            
            for (var k = 0; k < rbl.length; k++)
            {               
                var rblRef2 = rbl[k];                                                
                if (rblRef2.type == 'text')
                {
                      if (isOtherValue)
                      {
                          rbl[k-1].checked = true;
                          rblRef2.value = selectedValue;
                      }
                      else
                      {
                          rbl[k-1].checked = false;
                          rblRef2.value = '';
                      }
                }
            } 

            
        }   
    }
    
    function SetHiddenFields(date,values,notes)
    {
        var valuesString = RetrieveRadioBtnListSelectedValues (values,"TABLE");     
        
        notes.value = '';
        if (date.value != '' || valuesString != '')
        {
            notes.value = "Intention to Treat ";
            
            if (date.value != '')
                notes.value = notes.value + "[" + date.value + "]:  ";
            else
                notes.value = notes.value + ":  ";
                
            if (valuesString != '')
                notes.value = notes.value + valuesString;            
        }
    }
    
    
		
</script>

