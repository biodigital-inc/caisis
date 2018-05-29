<%@ Control Language="c#" Inherits="Caisis.UI.Modules.HeadNeck.Eforms.SalivaryGlandReviewOfSystems" CodeFile="SalivaryGlandReviewOfSystems.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>


<a name="SalivaryGlandReviewOfSystems" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text=""></asp:Label><br/>

<span class="controlBoxTitle">History</span>
<table cellpadding="5" cellspacing="2" class="eformLargePopulatedTableBlue" id="SkinInvolementHtmlTable">
    <tr>
        <td height="28" style="white-space: nowrap;" valign="top">
            <input type="checkbox" id="ROS_Symptom_1" value="Painless mass" runat="server"   />&nbsp;Painless mass
            <euc:EformTextBox Width="1px" style="display: none;" ID="ROS_Symptom_1_Text" runat="server" RecordId="1" ParentRecordId="1"  TABLE="EncReviewOfSystems" FIELD="ROS_Symptom"/>             
            <euc:EformTextBox Width="1px" style="display: none;"   RecordId="1" ParentRecordId="1" TABLE="EncReviewOfSystems" FIELD="ROS_System" ID="ROS_System_1" Runat="server" /></td>
        <td style="white-space: nowrap;" valign="top">
            <div id="PresentingDiv_1" runat="server" style="display: none;">
                <strong>Presenting:</strong>&nbsp;&nbsp;
                <euc:EformSelect Width="80px" RecordId="1" ParentRecordId="1"  TABLE="EncReviewOfSystems" FIELD="ROS_Presenting" ID="ROS_Presenting_1" LookupCode="ROS_Presenting" Runat="server"/>           
            </div>
        </td>
   </tr>
   <tr>
        <td height="28" style="white-space: nowrap;" valign="top">
            <input type="checkbox" id="ROS_Symptom_2" value="Pain" runat="server"   />&nbsp;Pain
            <euc:EformTextBox Width="1px" style="display: none;" ID="ROS_Symptom_2_Text" runat="server" RecordId="2" ParentRecordId="1"  TABLE="EncReviewOfSystems" FIELD="ROS_Symptom"/>             
            <euc:EformTextBox Width="1px" style="display: none;"   RecordId="2" ParentRecordId="1" TABLE="EncReviewOfSystems" FIELD="ROS_System" ID="ROS_System_2" Runat="server" /></td>
        <td style="white-space: nowrap;" valign="top">
            <div id="PresentingDiv_2" runat="server" style="display: none;">
                <strong>Presenting:</strong>&nbsp;&nbsp;
                <euc:EformSelect Width="80px" RecordId="2" ParentRecordId="1"  TABLE="EncReviewOfSystems" FIELD="ROS_Presenting" ID="ROS_Presenting_2" LookupCode="ROS_Presenting" Runat="server"/>           
            </div>
        </td>
   
   </tr>
    <tr>
        <td height="28" style="white-space: nowrap;" valign="top">
            <input type="checkbox" id="ROS_Symptom_3" value="Nerve Paralysis" runat="server"   />&nbsp;Nerve Paralysis
            <euc:EformTextBox Width="1px" style="display: none;" ID="ROS_Symptom_3_Text" runat="server" RecordId="3" ParentRecordId="1"  TABLE="EncReviewOfSystems" FIELD="ROS_Symptom"/>             
            <euc:EformTextBox Width="1px" style="display: none;"   RecordId="3" ParentRecordId="1" TABLE="EncReviewOfSystems" FIELD="ROS_System" ID="ROS_System_3" Runat="server" /></td>
        <td style="white-space: nowrap;" valign="top">
            <div id="PresentingDiv_3" runat="server" style="display: none;">
                <strong>Presenting:</strong>&nbsp;&nbsp;
                <euc:EformSelect Width="80px" RecordId="3" ParentRecordId="1"  TABLE="EncReviewOfSystems" FIELD="ROS_Presenting" ID="ROS_Presenting_3" LookupCode="ROS_Presenting" Runat="server"/>           
            </div>
        </td>
   </tr>
   <tr>
        <td height="28" style="white-space: nowrap;" valign="top">
            <input type="checkbox" id="ROS_Symptom_4" value="Nerve Paresis" runat="server"   />&nbsp;Nerve Paresis
            <euc:EformTextBox Width="1px" style="display: none;" ID="ROS_Symptom_4_Text" runat="server" RecordId="4" ParentRecordId="1"  TABLE="EncReviewOfSystems" FIELD="ROS_Symptom"/>             
            <euc:EformTextBox Width="1px" style="display: none;"   RecordId="4" ParentRecordId="1" TABLE="EncReviewOfSystems" FIELD="ROS_System" ID="ROS_System_4" Runat="server" /></td>
        <td style="white-space: nowrap;" valign="top">
            <div id="PresentingDiv_4" runat="server" style="display: none;">
                <strong>Presenting:</strong>&nbsp;&nbsp;
                <euc:EformSelect Width="80px" RecordId="4" ParentRecordId="1"  TABLE="EncReviewOfSystems" FIELD="ROS_Presenting" ID="ROS_Presenting_4" LookupCode="ROS_Presenting" Runat="server"/>           
            </div>
        </td>
   </tr>
   <tr>
        <td height="28" style="white-space: nowrap;" valign="top">
            <input type="checkbox" id="ROS_Symptom_5" value="Not Documented " runat="server"   />&nbsp;Not Documented 
            <euc:EformTextBox Width="1px" style="display: none;" ID="ROS_Symptom_5_Text" runat="server" RecordId="5" ParentRecordId="1"  TABLE="EncReviewOfSystems" FIELD="ROS_Symptom"/>             
            <euc:EformTextBox Width="1px" style="display: none;"   RecordId="5" ParentRecordId="1" TABLE="EncReviewOfSystems" FIELD="ROS_System" ID="ROS_System_5" Runat="server" /></td>
        <td style="white-space: nowrap;" valign="top">
            <div id="PresentingDiv_5" runat="server" style="display: none;">
                <strong>Presenting:</strong>&nbsp;&nbsp;
                <euc:EformSelect Width="80px" RecordId="5" ParentRecordId="1"  TABLE="EncReviewOfSystems" FIELD="ROS_Presenting" ID="ROS_Presenting_5" LookupCode="ROS_Presenting" Runat="server"/>           
            </div>
        </td>
   </tr>
   <tr>
        <td height="28" style="white-space: nowrap;" valign="top">
            <strong>Other:&nbsp;</strong>
            <input type="text" id="ROS_Symptom_6"     runat="server"   />
            <euc:EformTextBox Width="1px" style="display: none;" ID="ROS_Symptom_6_Text" runat="server" RecordId="6" ParentRecordId="1"  TABLE="EncReviewOfSystems" FIELD="ROS_Symptom"/>             
            <euc:EformTextBox Width="1px" style="display: none;"   RecordId="6" ParentRecordId="1" TABLE="EncReviewOfSystems" FIELD="ROS_System" ID="ROS_System_6" Runat="server" /></td>
        <td style="white-space: nowrap;" valign="top">
            <div id="PresentingDiv_6" runat="server" style="display: none;">
                <strong>Presenting:</strong>&nbsp;&nbsp;
                <euc:EformSelect Width="80px" RecordId="6" ParentRecordId="1"  TABLE="EncReviewOfSystems" FIELD="ROS_Presenting" ID="ROS_Presenting_6" LookupCode="ROS_Presenting" Runat="server"/>           
            </div>
        </td>
   </tr>


</table>

<br /><br />

<table  cellpadding="5" cellspacing="0" class="eformLargePopulatedTable" id="FacialNerveParalysisHtmlTable">
    <tr>
        <td style="white-space: nowrap;">
            <span class="controlBoxTitle">Indication</span></td>
        <td height="28" style="white-space: nowrap;">
            <euc:EformRadioButtonList style="white-space: nowrap;" RecordId="1" Table="Encounters" Field="EncType" ID="EncType_1" runat="server" RepeatLayout="Table"
                RepeatDirection="Horizontal" CellSpacing="15" >
                <asp:ListItem Value="Primary" Text="Primary"></asp:ListItem>
                <asp:ListItem Value="Recurrence" Text="Recurrence"></asp:ListItem>
                <asp:ListItem Value="Post-Excisional" Text="Post-Excisional"></asp:ListItem>
            </euc:EformRadioButtonList>
        </td>

    </tr>
</table>

<br/><br/><br/>

  <script type="text/javascript">

    addAbsentEvent($('<%= ROS_Symptom_1.ClientID %>'),$('<%= ROS_Symptom_1_Text.ClientID %>'),$('<%= ROS_System_1.ClientID %>'),$('<%= PresentingDiv_1.ClientID %>'),$('<%= ROS_Presenting_1.ClientID %>'));
    addAbsentEvent($('<%= ROS_Symptom_2.ClientID %>'),$('<%= ROS_Symptom_2_Text.ClientID %>'),$('<%= ROS_System_2.ClientID %>'),$('<%= PresentingDiv_2.ClientID %>'),$('<%= ROS_Presenting_2.ClientID %>'));
    addAbsentEvent($('<%= ROS_Symptom_3.ClientID %>'),$('<%= ROS_Symptom_3_Text.ClientID %>'),$('<%= ROS_System_3.ClientID %>'),$('<%= PresentingDiv_3.ClientID %>'),$('<%= ROS_Presenting_3.ClientID %>'));
    addAbsentEvent($('<%= ROS_Symptom_4.ClientID %>'),$('<%= ROS_Symptom_4_Text.ClientID %>'),$('<%= ROS_System_4.ClientID %>'),$('<%= PresentingDiv_4.ClientID %>'),$('<%= ROS_Presenting_4.ClientID %>'));
    addAbsentEvent($('<%= ROS_Symptom_5.ClientID %>'),$('<%= ROS_Symptom_5_Text.ClientID %>'),$('<%= ROS_System_5.ClientID %>'),$('<%= PresentingDiv_5.ClientID %>'),$('<%= ROS_Presenting_5.ClientID %>'));
    addAbsentEvent($('<%= ROS_Symptom_6.ClientID %>'),$('<%= ROS_Symptom_6_Text.ClientID %>'),$('<%= ROS_System_6.ClientID %>'),$('<%= PresentingDiv_6.ClientID %>'),$('<%= ROS_Presenting_6.ClientID %>'));

    function addAbsentEvent(symptomCB,symptomHidden,system,presentingDiv,presenting)
    {  
        if (symptomCB.type == 'checkbox')
            $(symptomCB).addEvent('click',curry(SetHiddenFields,symptomCB,symptomHidden,system,presentingDiv,presenting));
        if (symptomCB.type == 'text')
            $(symptomCB).addEvent('blur',curry(SetHiddenFields,symptomCB,symptomHidden,system,presentingDiv,presenting));
        
        ShowOnLoad(symptomCB,symptomHidden,system,presentingDiv,presenting);
    }
    
    function ShowOnLoad(symptomCB,symptomHidden,system,presentingDiv,presenting)
    {
        if (symptomHidden.value != '')
        { 
            if (symptomCB.type == 'checkbox')
            {
                if (symptomHidden.value == symptomCB.value)
                    symptomCB.checked = true;
            }
            else if (symptomCB.type == 'text') 
                symptomCB.value = symptomHidden.value;
         }
                
        SetHiddenFields(symptomCB,symptomHidden,system,presentingDiv,presenting);
    }
	
	function SetHiddenFields(symptomCB,symptomHidden,system,presentingDiv,presenting)
    {
        if (symptomCB.type == 'checkbox')
        {
            if (symptomCB.checked)
            {
//                ResetOptions(symptomCB); 
                symptomHidden.value = symptomCB.value;
                system.value = 'Head and Neck';
                presentingDiv.style.display = 'block';
            }
            else
            {
                symptomHidden.value = '';
                system.value = '';
                presenting.value = '';
                presentingDiv.style.display = 'none';
            }        
        }
        else if (symptomCB.type == 'text')
        {
             if (symptomCB.value != '')
            {
//                ResetOptions(symptomCB); 
                symptomHidden.value = symptomCB.value;
                system.value = 'Head and Neck';
                presentingDiv.style.display = 'block';
            }
            else
            {
                symptomHidden.value = '';
                system.value = '';
                presenting.value = '';
                presentingDiv.style.display = 'none';
            }        
        }
    }	
    
    function ResetOptions(option)
    {
        var RB1 = document.getElementById('<%= ROS_Symptom_1.ClientID %>');
        var RBValue1 = document.getElementById('<%= ROS_Symptom_1_Text.ClientID %>');
        var PDiv1 = document.getElementById('<%= PresentingDiv_1.ClientID %>');
        var PValue1 = document.getElementById('<%= ROS_Presenting_1.ClientID %>');
        var SValue1 = document.getElementById('<%= ROS_System_1.ClientID %>');
        
        var RB2 = document.getElementById('<%= ROS_Symptom_2.ClientID %>');
        var RBValue2 = document.getElementById('<%= ROS_Symptom_2_Text.ClientID %>');
        var PDiv2 = document.getElementById('<%= PresentingDiv_2.ClientID %>');
        var PValue2 = document.getElementById('<%= ROS_Presenting_2.ClientID %>');
        var SValue2= document.getElementById('<%= ROS_System_2.ClientID %>');
        
        var RB3 = document.getElementById('<%= ROS_Symptom_3.ClientID %>');
        var RBValue3 = document.getElementById('<%= ROS_Symptom_3_Text.ClientID %>');
        var PDiv3 = document.getElementById('<%= PresentingDiv_3.ClientID %>');
        var PValue3 = document.getElementById('<%= ROS_Presenting_3.ClientID %>');
        var SValue3 = document.getElementById('<%= ROS_System_1.ClientID %>');
        
        var RB4 = document.getElementById('<%= ROS_Symptom_4.ClientID %>');
        var RBValue4 = document.getElementById('<%= ROS_Symptom_4_Text.ClientID %>');
        var PDiv4 = document.getElementById('<%= PresentingDiv_4.ClientID %>');
        var PValue4 = document.getElementById('<%= ROS_Presenting_4.ClientID %>');
        var SValue4 = document.getElementById('<%= ROS_System_4.ClientID %>');
        
        var RB5 = document.getElementById('<%= ROS_Symptom_5.ClientID %>');
        var RBValue5 = document.getElementById('<%= ROS_Symptom_5_Text.ClientID %>');
        var PDiv5 = document.getElementById('<%= PresentingDiv_5.ClientID %>');
        var PValue5 = document.getElementById('<%= ROS_Presenting_5.ClientID %>');
        var SValue5 = document.getElementById('<%= ROS_System_5.ClientID %>');
        
        var TB6 = document.getElementById('<%= ROS_Symptom_6.ClientID %>');
        var TBValue6 = document.getElementById('<%= ROS_Symptom_6_Text.ClientID %>');
        var PDiv6 = document.getElementById('<%= PresentingDiv_6.ClientID %>');
        var PValue6 = document.getElementById('<%= ROS_Presenting_6.ClientID %>');
        var SValue6 = document.getElementById('<%= ROS_System_6.ClientID %>');
        
        // make the radio options mutually exclusive
        if (option.id.indexOf("_1") > -1) 
        { 
            RB2.checked = false; RBValue2.value = ''; PDiv2.style.display = 'none'; PValue2.value = ''; SValue2.value = '';
            RB3.checked = false; RBValue3.value = ''; PDiv3.style.display = 'none'; PValue3.value = ''; SValue3.value = ''; 
            RB4.checked = false; RBValue4.value = ''; PDiv4.style.display = 'none'; PValue4.value = ''; SValue4.value = '';
            RB5.checked = false; RBValue5.value = ''; PDiv5.style.display = 'none'; PValue5.value = ''; SValue5.value = '';
            TB6.value = ''; TBValue6.value = ''; PDiv6.style.display = 'none'; PValue6.value = ''; SValue6.value = '';  
        }
        if (option.id.indexOf("_2") > -1) 
        {         
            RB1.checked = false; RBValue1.value = ''; PDiv1.style.display = 'none'; PValue1.value = ''; SValue1.value = '';
            RB3.checked = false; RBValue3.value = ''; PDiv3.style.display = 'none'; PValue3.value = ''; SValue3.value = '';
            RB4.checked = false; RBValue4.value = ''; PDiv4.style.display = 'none'; PValue4.value = ''; SValue4.value = '';
            RB5.checked = false; RBValue5.value = ''; PDiv5.style.display = 'none'; PValue5.value = ''; SValue5.value = '';
            TB6.value = ''; TBValue6.value = ''; PDiv6.style.display = 'none'; PValue6.value = ''; SValue6.value = '';  
        }
        if (option.id.indexOf("_3") > -1) 
        { 
            RB2.checked = false; RBValue2.value = ''; PDiv2.style.display = 'none'; PValue2.value = ''; SValue2.value = '';
            RB1.checked = false; RBValue1.value = ''; PDiv1.style.display = 'none'; PValue1.value = ''; SValue1.value = '';
            RB4.checked = false; RBValue4.value = ''; PDiv4.style.display = 'none'; PValue4.value = ''; SValue4.value = '';
            RB5.checked = false; RBValue5.value = ''; PDiv5.style.display = 'none'; PValue5.value = ''; SValue5.value = '';
            TB6.value = ''; TBValue6.value = ''; PDiv6.style.display = 'none'; PValue6.value = ''; SValue6.value = '';  
        }
        if (option.id.indexOf("_4") > -1) 
        { 
            RB2.checked = false; RBValue2.value = ''; PDiv2.style.display = 'none'; PValue2.value = ''; SValue2.value = '';
            RB3.checked = false; RBValue3.value = ''; PDiv3.style.display = 'none'; PValue3.value = ''; SValue3.value = '';
            RB1.checked = false; RBValue1.value = ''; PDiv1.style.display = 'none'; PValue1.value = ''; SValue1.value = '';
            RB5.checked = false; RBValue5.value = ''; PDiv5.style.display = 'none'; PValue5.value = ''; SValue5.value = '';
            TB6.value = ''; TBValue6.value = ''; PDiv6.style.display = 'none'; PValue6.value = ''; SValue6.value = '';  
        }
        if (option.id.indexOf("_5") > -1) 
        { 
            RB2.checked = false; RBValue2.value = ''; PDiv2.style.display = 'none'; PValue2.value = ''; SValue2.value = '';
            RB3.checked = false; RBValue3.value = ''; PDiv3.style.display = 'none'; PValue3.value = ''; SValue3.value = '';
            RB4.checked = false; RBValue4.value = ''; PDiv4.style.display = 'none'; PValue4.value = ''; SValue4.value = '';
            RB1.checked = false; RBValue1.value = ''; PDiv1.style.display = 'none'; PValue1.value = ''; SValue1.value = '';
            TB6.value = ''; TBValue6.value = ''; PDiv6.style.display = 'none'; PValue6.value = ''; SValue6.value = ''; 
        }
        if (option.id.indexOf("_6") > -1) 
        { 
            RB2.checked = false; RBValue2.value = ''; PDiv2.style.display = 'none'; PValue2.value = ''; SValue2.value = '';
            RB3.checked = false; RBValue3.value = ''; PDiv3.style.display = 'none'; PValue3.value = ''; SValue3.value = '';
            RB4.checked = false; RBValue4.value = ''; PDiv4.style.display = 'none'; PValue4.value = ''; SValue4.value = '';
            RB5.checked = false; RBValue5.value = ''; PDiv5.style.display = 'none'; PValue5.value = ''; SValue5.value = '';
            RB1.checked = false; RBValue1.value = ''; PDiv1.style.display = 'none'; PValue1.value = ''; SValue1.value = '';
        }
    }
 
     
</script>
