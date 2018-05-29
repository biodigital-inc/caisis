<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Breast.Eforms.PhysicalExamBreast" CodeFile="PhysicalExamBreast.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css">

<a name="PhysicalExamBreast" />
<asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Physical Exam"></asp:Label><br/>
<table width="300" border="0" cellpadding="6" cellspacing="0"  class="eformLargePopulatedTable" id="OropharynxBiopsyHtmlTable">
    <tr>
        <td><strong>Date</strong><br />
            <euc:EformHidden                       RecordId="1" TABLE="Encounters" FIELD="EncDate" ID="EncDate" Runat="server" />
            <euc:EformTextBox style="width:100px"  RecordId="1" TABLE="Encounters" FIELD="EncDateText" ID="EncDateText" Runat="server" ShowCalendar="True" CalcDate="True"  />  
            <euc:EformTextBox Width="1px" style="display: none;"  RecordId="1" TABLE="Encounters" FIELD="EncQuality"  ID="EncQuality" Runat="server"  ShowCalendar="False" CalcDate="False" /></td>

        <td>


            <table width="400" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td style="width: 301px; vertical-align: top;">
		            <strong>Left Breast</strong>
		            <table border="0" cellspacing="0" cellpadding="0" width="200" >
		            <tr>
		                <td>
		                    <table border="0" cellspacing="0" cellpadding="16" width="200" class="eformLargePopulatedTableBlue"> 
            		      
                                <tr>
                                    <td><strong>Result: </strong></td>
                                     <td>
 		                    <euc:EformTextBox Width="1px" style="display: none;" Table="EncExams" ParentRecordId="1"  RecordId="1" Field="Exam" id="Exam_L" runat="server" />
		                    <euc:EformTextBox Width="1px" style="display: none;" Table="EncExams" ParentRecordId="1"  RecordId="1" Field="ExamSystem" id="ExamSystem_L" runat="server" />

            												

                     	
	                        <euc:EformDropDownList Width="100px"  Table="EncExams" ParentRecordId="1"  RecordId="1" Field="ExamResult" id="ExamResult_L" runat="server" ShowEmptyListItem="true" LookupCode="Result,Disease,Breast" /></td>
                                </tr>

		                    </table>
		                </td>
		                <%--<td style="width: 11px; background-color: #3D556D; padding: 2px;"><img src="../../Images/VerticalSideMarker_Left.gif" /><br /><img src="../../Images/VerticalSideMarker_Left.gif" style="margin-top: 300px;" /></td>--%>
		            </tr>
		            </table>

            		
            		
	            </td>
                <td style="width: 10px;">&nbsp;</td>
                <td style="width: 711px; vertical-align: top;">
            	
            	
            	
		            <strong>Right Breast</strong>
            <table border="0" cellspacing="0" cellpadding="0" width="200">
		            <tr>
		                <%--<td style="width: 11px; background-color: #666666; padding: 2px;"><img src="../../Images/VerticalSideMarker_Right.gif" /><br /><img src="../../Images/VerticalSideMarker_Right.gif" style="margin-top: 300px;" /></td>--%>
		                <td>
		                <table border="0" cellspacing="0" cellpadding="16" width="200" class="eformLargePopulatedTable">

                    <tr>
                        <td><strong>Result: </strong></td>
                        <td>
 		                    <euc:EformTextBox Width="1px" style="display: none;" Table="EncExams" ParentRecordId="1"  RecordId="2" Field="Exam" id="Exam_R" runat="server" />
		                    <euc:EformTextBox Width="1px" style="display: none;" Table="EncExams" ParentRecordId="1"  RecordId="2" Field="ExamSystem" id="ExamSystem_R" runat="server" />

            												

                     	
	                        <euc:EformDropDownList Width="100px"  Table="EncExams" ParentRecordId="1"  RecordId="2" Field="ExamResult" id="ExamResult_R" runat="server" ShowEmptyListItem="true" LookupCode="Result,Disease,Breast" /></td>
                    </tr>

		            </table>
		                </td>
		            </tr>
                </table>
	            </td>
              </tr>
            </table>




      </td>
      
    </tr>
</table><br/><br/>


<script type="text/javascript">

    /* <![CDATA[ */
   
    //Adds events to controls
    function addEvents(encDateTextID,encExamSystemID,encExamID,encExamResultID,encDataQualityID,examValue)
    { 
        $(encDateTextID).addEvent('blur',curry(SetHiddenFields,encDateTextID,encExamSystemID,encExamID,encExamResultID,encDataQualityID,examValue));
        $(encExamResultID).addEvent('blur',curry(SetHiddenFields,encDateTextID,encExamSystemID,encExamID,encExamResultID,encDataQualityID,examValue));
   }

    addEvents($('<%= EncDateText.ClientID %>'),$('<%= ExamSystem_L.ClientID %>'),$('<%= Exam_L.ClientID %>'),$('<%= ExamResult_L.ClientID %>'),$('<%= EncQuality.ClientID %>'),'Left Breast');
    addEvents($('<%= EncDateText.ClientID %>'),$('<%= ExamSystem_R.ClientID %>'),$('<%= Exam_R.ClientID %>'),$('<%= ExamResult_R.ClientID %>'),$('<%= EncQuality.ClientID %>'),'Right Breast');
 
    /* ]]> */
    
function SetHiddenFields(encDateTextID,encExamSystemID,encExamID,encExamResultID,encDataQualityID,examValue)
{
    if (encDateTextID.value != '' || encExamResultID.value != '' )
    {
        encExamSystemID.value = examValue;
        encExamID.value = "Breast Exam";
        encDataQualityID.value = 'STD';
    }
    else
    {
        encExamSystemID.value = '';
        encExamID.value = '';
        encDataQualityID.value = '';    
    }
}
</script>