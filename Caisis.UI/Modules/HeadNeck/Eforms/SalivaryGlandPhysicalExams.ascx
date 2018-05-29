<%@ Control Language="c#" Inherits="Caisis.UI.Modules.HeadNeck.Eforms.SalivaryGlandPhysicalExams" CodeFile="SalivaryGlandPhysicalExams.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>


<a name="SalivaryGlandPhysicalExams" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text=""></asp:Label><br/>

<table width="200" cellpadding="5" cellspacing="0" class="eformLargePopulatedTableBlue" id="SkinInvolementHtmlTable">
    <tr>
        <td style="white-space: nowrap;">
            <span class="controlBoxTitle">Skin Involvment ?</span></td>
        <td height="28">
            <euc:EformRadioButtonList RecordId="1" ID="SkinInvolvmentRecorded" runat="server" RepeatLayout="Table"
                RepeatDirection="Horizontal" CellSpacing="15" Table="EncExams" Field="ExamResult">
                <asp:ListItem Value="Yes" Text="Yes"></asp:ListItem>
                <asp:ListItem Value="No" Text="No"></asp:ListItem>
            </euc:EformRadioButtonList>
            
           	<euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="1" ParentRecordId="1"  ID="ExamSystem_1" TABLE="EncExams" FIELD="ExamSystem" />  		    
           	<euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="1" ParentRecordId="1"  ID="Exam_1" TABLE="EncExams" FIELD="Exam" />  		    
        </td>
    </tr>
</table>

<br /><br />

<table width="200" cellpadding="5" cellspacing="0" class="eformLargePopulatedTable" id="FacialNerveParalysisHtmlTable">
    <tr>
        <td style="white-space: nowrap;">
            <span class="controlBoxTitle">Facial Nerve Paralysis ?</span></td>
        <td height="28">
            <euc:EformRadioButtonList ID="FacialNerveParalysisRecorded" runat="server" RepeatLayout="Table"
                RepeatDirection="Horizontal" CellSpacing="15" Table="NoTable" Field="FacialNerveParalysisRecorded">
                <asp:ListItem Value="Yes" Text="Yes"></asp:ListItem>
                <asp:ListItem Value="No" Text="No"></asp:ListItem>
            </euc:EformRadioButtonList>
            
           	<euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="2" ParentRecordId="1"  ID="ExamSystem_2" TABLE="EncExams" FIELD="ExamSystem" />  		    
           	<euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="2" ParentRecordId="1"  ID="Exam_2" TABLE="EncExams" FIELD="Exam" />  		    
        </td>
        <td>
            <div id="FacialNerveParalysisDiv" runat="server" style="display: none;">
           	    <euc:EformRadioButtonList Runat="server" Table="NoTable" Field="FacialNerveParalysisResult" ID="FacialNerveParalysisResult" RepeatLayout="Table"
                RepeatDirection="Horizontal" CellSpacing="15" >
                    <asp:ListItem Value="Partial" Text="Partial"></asp:ListItem>
                    <asp:ListItem Value="Complete" Text="Complete"></asp:ListItem>
                    <asp:ListItem Value="Unknown" Text="Unknown"></asp:ListItem>           	    
           	    </euc:EformRadioButtonList>  
           	    		    
           	   <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="2" ParentRecordId="1"  ID="ExamResult_2" TABLE="EncExams" FIELD="ExamResult" />  		    
            </div>
            
        </td>
    </tr>
</table>

<br/><br/><br/>

  <script type="text/javascript">

    addAbsentEvent($('<%= SkinInvolvmentRecorded.ClientID %>'),$('<%= ExamSystem_1.ClientID %>'),$('<%= Exam_1.ClientID %>'));

    function addAbsentEvent(examResult,examSystem,exam)
    {  
        $(examResult).addEvent('click',curry(SetHiddenFields,examResult,examSystem,exam));
    }
	
	function SetHiddenFields(examResult,examSystem,exam)
    {
        var rblRef = examResult.getElementsByTagName('input');
        
        for (var i = 0; i < rblRef.length; i++)
            if (rblRef[i].checked)
            {
                examSystem.value = 'Dermatology/Skin';
                exam.value = 'Skin Involvement';
            }
    }	
    
    /********************************************/
    /********************************************/
    /********************************************/
    
     addAbsentEvent2($('<%= FacialNerveParalysisRecorded.ClientID %>'),$('<%= FacialNerveParalysisDiv.ClientID %>'),$('<%= ExamSystem_2.ClientID %>'),$('<%= Exam_2.ClientID %>'),$('<%= FacialNerveParalysisResult.ClientID %>'),$('<%= ExamResult_2.ClientID %>'));

    function addAbsentEvent2(examRecorded,examRecordedDiv,examSystem,exam,examResult,examResultHidden)
    {  
        $(examRecorded).addEvent('click',curry(SetHiddenFields2,examRecorded,examRecordedDiv,examSystem,exam,examResult,examResultHidden));
        $(examResult).addEvent('click',curry(updateResult,examResult,examResultHidden));
       
        // show on load as well
        SetHiddenFields2(examRecorded,examRecordedDiv,examSystem,exam,examResult,examResultHidden);
    }
    
    function  updateResult(examResult,examResultHidden)
	{
	    var rblRef2 = examResult.getElementsByTagName('input'); 
	    for (var j = 0; j < rblRef2.length; j++)
            if (rblRef2[j].checked)
                examResultHidden.value = rblRef2[j].value;
	}
	
	function SetHiddenFields2(examRecorded,examRecordedDiv,examSystem,exam,examResult,examResultHidden)
    { 
        var rblRef = examRecorded.getElementsByTagName('input');   
        var rblRef2 = examResult.getElementsByTagName('input'); 

        examResultHidden.value = '';
        examSystem.value = '';
        exam.value = '';

        for (var i = 0; i < rblRef.length; i++)
            if (rblRef[i].checked)
            {
               if (rblRef[i].value == "No")
               {
                    examResultHidden.value = 'No';
                    
                    for (var j = 0; j < rblRef2.length; j++)
                        rblRef2[j].checked = false;
                        
                    examRecordedDiv.style.display = 'none';
              }
               else
               {
                    examRecordedDiv.style.display = 'block';
                    
                    for (var j = 0; j < rblRef2.length; j++)
                        if (rblRef2[j].checked)
                            examResultHidden.value = rblRef2[j].value; 
               }
               examSystem.value = 'Neurological';
               exam.value = 'Facial Nerve Paralysis';
            }
     }   
</script>
