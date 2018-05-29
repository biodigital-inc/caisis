<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Colorectal.Eforms.ColorectalMalignantDisease" CodeFile="ColorectalMalignantDisease.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>


<script type="text/javascript">
	tableArray.MultipleMetastasesHTMLTable = 'MultipleMetastasesHTMLTable';
</script>


<style type="text/css">
.disabledMalignantDisease
{
    color: #666666;
}
#ColorectalMalignantDiseaseTable input[type='text']
{   
   /* background-color: #cccccc; */
   /* visibility: hidden; */
}
.ColorectalPreviousTreatmentTable
{
    border: solid 1px #dddddd;
    background-color: #efefef;
}
.ColorectalPreviousTreatmentTable td
{
    padding: 4px;
}
</style>

<a name="ColorectalMalignantDisease" />
<span class="controlBoxTitle">Malignant Disease</span>
<euc:EformCheckBox ID="MalignantDisease" Table="NoTable" Field="MalignantDisease" runat="server" Value="None" Text="None" onclick="setMalignantDisease();" style="margin-left: 40px;" />

<br />


<!-- TODO: single create encounter for Malignant Disease -->
<!-- TODO: create Pathology records for each of the available subsections that are shown on radio select -->
<table id="ColorectalMalignantDiseaseTable" border="0" cellspacing="0" cellpadding="16" width="600" class="eformLargePopulatedTable">
  <tr style="display:none">
    <td style="padding-top: 12px;">
    <strong style="color: #111111;">Date</strong>&nbsp;&nbsp;
		<euc:EformTextBox id="StatusDateText" Table="Status" Field="StatusDateText" ShowCalendar="True" CalcDate="True" Runat="server" Width="100px"/>
		<euc:EformHidden id="StatusDate" Table="Status" Field="StatusDate" Runat="server"/>

	 
	</td>
  </tr>
  <tr>
    <td  id="malignantStatusContainer" style="padding-top: 0px;">
    <strong style="color: #111111;">Status</strong><br />
	<euc:EformRadioButtonList RepeatColumns="1" Table="Status" RecordId="1" Field="Status" id="MalignantDiseaseType" RepeatLayout="Table" RepeatDirection="Vertical" runat="server" Field1="StatusDisease" Value1="Colorectal" Field2="StatusQuality" Value2="STD" >
			<asp:ListItem Value="Primary without Metastasis" Text="Primary without Metastasis"  />
<%--             <asp:ListItem Value="Primary with Suspicion of Metastasis" Text="Primary with Suspicion of Metastasis"  />--%>
            <asp:ListItem Value="Primary with Metastasis" Text="Primary with Metastasis"  />
            <asp:ListItem Value="Metastasis (primary already resected)" Text="Metastasis (primary already resected)"  />
<%--            <asp:ListItem Value="Locally Recurrent or Persistent (primary already resected)" Text="Locally Recurrent or Persistent (primary already resected)"  /> --%>
            <asp:ListItem Value="Locally Recurrent or Persistent" Text="Locally Recurrent or Persistent"  />
            <asp:ListItem Value="Locally Recurrent or Persistent with Suspicion of Metastasis" Text="Locally Recurrent or Persistent with Suspicion of Metastasis"  />
<%--            <asp:ListItem Value="Locally Recurrent or Persistent with Metastasis" Text="Locally Recurrent or Persistent with Metastasis"  /> --%>
            <asp:ListItem Value="Other Malignant Disease / Can’t be captured with this form" Text="Other Malignant Disease / Can’t be captured with this form"  />
		</euc:EformRadioButtonList>
	
	</td>
  </tr>
  <tr>
    <td style="padding-top: 12px;">
	<table cellpadding="0" cellspacing="0">
	<tr id="PrimaryDiseasePathContainer">
	    <td style="padding-bottom: 13px;">
	        <strong style="color: #111111;" title="Type UNKNOWN if applicable for any field below">Primary Disease</strong>
<span style="font-size: 12px; color: #666666; margin-left: 20px;">(Information on Primary Lesion)</span>
	        <table cellpadding="0" cellspacing="10" style="background-color: #efefef; border: solid 1px #cccccc;" >
	        <tr>
	        <td title="date of biopsy or resection for new diagnosis">Date of Diagnosis</td>
	        <td><euc:EformTextBox id="PathDateText_1" Table="Pathology" RecordId="1" Field="PathDateText" ShowCalendar="True" CalcDate="True" Runat="server" Width="100px"/>
		        <euc:EformHidden id="PathDate_1" Table="Pathology" RecordId="1" Field="PathDate" Runat="server"/>
		    </td>
	        </tr>
	        <tr>
	        <td title="anatomic site of recurrence">Location of Lesion </td>
	        <td><euc:EformComboBox ID="PathSite_1" Table="Pathology" RecordId="1" Field="PathSite" runat="server" LookupCode="BxSite" Width="140" /></td>
	        </tr>
	        <tr onmouseout="defaultResult(1);">
	        <td title="histology of primary lesion">Histology</td>
	        <td><euc:EformComboBox ID="PathHistology_1" Table="Pathology" RecordId="1" Field="PathHistology" runat="server" LookupCode="PathHistology" Width="200"  /></td>
	        </tr>
<%-- 	        <tr onmouseover="defaultResult(1);">
	        <td title="result of primary disease">Result</td>
	        <td><euc:EformComboBox ID="PathResult_1" Table="Pathology" RecordId="1" Field="PathResult" runat="server" LookupCode="BxResult" Width="200" /></td>
	        </tr>
	        <tr>
	        <td title="disease extent of primary disease">Disease Extent</td>
	        <td><euc:EformComboBox ID="PathDiseaseExtent_1" Table="ColorectalPath" RecordId="1" Field="PathDiseaseExtent" runat="server" LookupCode="ColorectalDiseaseExtent" Width="200" /></td>
	        </tr> --%>
	        <tr>
	        <td title="">Previous Treatment?</td>
	        <td id="Primary_PreviousTreatmentToggleContainer" onclick="togglePreviousTreatmentTable('Primary_SurveyTableInputContainer','Primary_PreviousTreatmentToggleContainer','ColorectalPreviousTreatmentTable_Primary','Primary');" >
	        
	        <euc:EformRadioButtonList Table="NoTable" Field="Malignant_PrimaryPreviousTreatment" id="Malignant_PrimaryPreviousTreatment" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal">
		        <asp:ListItem>Yes</asp:ListItem>
                <asp:ListItem Value="No">No</asp:ListItem>
            </euc:EformRadioButtonList>
	        
	        </td>
	        </tr>
	        <tr>
	        <td id="Primary_SurveyTableInputContainer">&nbsp;
	            <euc:EformTextBox Runat="server" ID="Primary_SurveyDateText" Table="Surveys" RecordId="2" FIELD="SurveyDateText" style="display: none;"  />
	            <euc:EformTextBox Runat="server" ID="Primary_SurveyDate" Table="Surveys" RecordId="2" FIELD="SurveyDate" style="display: none;"  />
	            <euc:EformTextBox Runat="server" ID="Primary_SurveyType" Table="Surveys" RecordId="2" FIELD="SurveyType" style="display: none;"  />
	            <euc:EformTextBox Runat="server" ID="Primary_SurveyQuality" Table="Surveys" RecordId="2" FIELD="SurveyQuality" style="display: none;"  />
	        </td>
	        <td>
	        
		    <table cellspacing="0" class="ColorectalPreviousTreatmentTable" id="ColorectalPreviousTreatmentTable_Primary" style="display: none;" >
		    <tr><%-- dont change the order of inputs or the script will break - jf --%>
		        <td><euc:EformCheckBox Runat="server" Table="SurveyItems" ParentRecordId="2" RecordId="1" Field="SurveyItemResult" ID="Primary_Radiation_Yes" Text="Radiation" Value="Yes" onclick="SetPreviousTreatmentSurveyItem(this,'Radiation');" />
		            <euc:EformTextBox Runat="server" Table="SurveyItems" ParentRecordId="2" RecordId="1" Field="SurveyItem" ID="Primary_Radiation" style="display: none;" />
		        </td>
		        <td>Start Date <euc:EformTextBox Runat="server" Table="SurveyItems" ParentRecordId="2" RecordId="2" Field="SurveyItemResult" ID="Primary_Radiation_DateText"  style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" />
		            <euc:EformTextBox Runat="server" Table="SurveyItems" ParentRecordId="2" RecordId="2" Field="SurveyItem" ID="Primary_Radiation_DateText_Item" style="display: none;" />
		        
		            <euc:EformHidden  Runat="server" Table="SurveyItems" ParentRecordId="2" RecordId="3" Field="SurveyItemResult" ID="Primary_Radiation_Date" ></euc:EformHidden>
		            <euc:EformTextBox Runat="server" Table="SurveyItems" ParentRecordId="2" RecordId="3" Field="SurveyItem" ID="Primary_Radiation_Date_Item" style="display: none;" />
		        </td>
		    </tr>
		    <tr><%-- dont change the order of inputs or the script will break - jf --%>
		        <td style="padding-right: 20px;"><euc:EformCheckBox Runat="server" Table="SurveyItems" ParentRecordId="2" RecordId="4" Field="SurveyItemResult" ID="Primary_Chemotherapy_Yes" Text="Chemotherapy" Value="Yes" onclick="SetPreviousTreatmentSurveyItem(this,'Chemotherapy');" />
		            <euc:EformTextBox Runat="server" Table="SurveyItems" ParentRecordId="2" RecordId="4" Field="SurveyItem" ID="Primary_Chemotherapy" style="display: none;" />
		        </td>
		        <td>Start Date <euc:EformTextBox Runat="server" Table="SurveyItems" ParentRecordId="2" RecordId="5" Field="SurveyItemResult" ID="Primary_Chemotherapy_DateText"  style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" />
		            <euc:EformTextBox Runat="server" Table="SurveyItems" ParentRecordId="2" RecordId="5" Field="SurveyItem" ID="Primary_Chemotherapy_DateText_Item" style="display: none;" />
		        
		            <euc:EformHidden  Runat="server" Table="SurveyItems" ParentRecordId="2" RecordId="6" Field="SurveyItemResult" ID="Primary_Chemotherapy_Date" ></euc:EformHidden>
		            <euc:EformTextBox Runat="server" Table="SurveyItems" ParentRecordId="2" RecordId="6" Field="SurveyItem" ID="Primary_Chemotherapy_Date_Item" style="display: none;" />
		        </td>
		    </tr>
		    <tr><%-- dont change the order of inputs or the script will break - jf --%>
		        <td><euc:EformCheckBox Runat="server" Table="SurveyItems" ParentRecordId="2" RecordId="7" Field="SurveyItemResult" ID="Primary_Surgery_Yes" Text="Surgery" Value="Yes" onclick="SetPreviousTreatmentSurveyItem(this,'Surgery');" />
		            <euc:EformTextBox Runat="server" Table="SurveyItems" ParentRecordId="2" RecordId="7" Field="SurveyItem" ID="Primary_Surgery" style="display: none;" />
		        </td>
		        <td style="text-align: right;">Date <euc:EformTextBox Runat="server" Table="SurveyItems" ParentRecordId="2" RecordId="8" Field="SurveyItemResult" ID="Primary_Surgery_DateText"  style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" />
		            <euc:EformTextBox Runat="server" Table="SurveyItems" ParentRecordId="2" RecordId="8" Field="SurveyItem" ID="Primary_Surgery_DateText_Item" style="display: none;" />
		        
		            <euc:EformHidden  Runat="server" Table="SurveyItems" ParentRecordId="2" RecordId="9" Field="SurveyItemResult" ID="Primary_Surgery_Date" ></euc:EformHidden>
		            <euc:EformTextBox Runat="server" Table="SurveyItems" ParentRecordId="2" RecordId="9" Field="SurveyItem" ID="Primary_Surgery_Date_Item" style="display: none;" />
		        </td>
		    </tr>
		    </table>
	        
	        </td>
	        </tr>
	        </table>
	    
	    
	    
	    </td>
	</tr><tr id="LocallyRecurrentOrPersistentDiseasePathContainer">
	    <td style="padding-bottom: 13px;">
	    
	        <strong style="color: #111111;" title="Type UNKNOWN if applicable for any field below">Locally Recurrent or Persistent Disease</strong>
<span style="font-size: 12px; color: #666666; margin-left: 20px;">(Information on Local Recurrence)</span>
	        <table cellpadding="0" cellspacing="10" style="background-color: #efefef; border: solid 1px #cccccc; width: 530px;" >
	        <tr>
	        <td style="width: 210px;" title="date of diagnosis of recurrence">Date of Diagnosis</td>
	        <td style="width: 320px;"><euc:EformTextBox id="PathDateText_2" Table="Pathology" RecordId="2" Field="PathDateText" ShowCalendar="True" CalcDate="True" Runat="server" Width="100px"/>
		        <euc:EformHidden id="PathDate_2" Table="Pathology" RecordId="2" Field="PathDate" Runat="server"/>
		    </td>
	        </tr>
	        <tr>
	        <td title="anatomic site of recurrence" >Location Recurrence/Persistence</td>
	        <td><euc:EformComboBox ID="PathSite_2" Table="Pathology" RecordId="2" Field="PathSite" runat="server" LookupCode="BxSite" Width="140" /></td>
	        </tr>
	        <tr onmouseout="defaultResult(2);">
	        <td title="histology of recurrent disease">Histology</td>
	        <td><euc:EformComboBox ID="PathHistology_2" Table="Pathology" RecordId="2" Field="PathHistology" runat="server" LookupCode="PathHistology" Width="200" /></td>
	        </tr>
<%--	        <tr onmouseover="defaultResult(2);">
	        <td title="result of persistence/recurrence">Result</td>
	        <td><euc:EformComboBox ID="PathResult_2" Table="Pathology" RecordId="2" Field="PathResult" runat="server" LookupCode="BxResult" Width="200" /></td>
	        </tr>
	        <tr>
	        <td title="disease extent of persistence/recurrence">Disease Extent</td>
	        <td><euc:EformComboBox ID="PathDiseaseExtent_2" Table="ColorectalPath" RecordId="2" Field="PathDiseaseExtent" runat="server" LookupCode="ColorectalDiseaseExtent" Width="200" /></td>
	        </tr> --%>
	        
	        <tr>
	        <td title="Treatment of local recurrence/persistence">Previous Treatment?</td>
	        <td id="LocallyRecurrent_PreviousTreatmentToggleContainer" onclick="togglePreviousTreatmentTable('LocallyRecurrent_SurveyTableInputContainer','LocallyRecurrent_PreviousTreatmentToggleContainer','ColorectalPreviousTreatmentTable_LocallyRecurrent','LocallyRecurrent');" >
	        
	        <euc:EformRadioButtonList Table="NoTable" Field="Malignant_LocallyRecurrentPreviousTreatment" id="Malignant_LocallyRecurrentPreviousTreatment" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal">
		        <asp:ListItem>Yes</asp:ListItem>
                <asp:ListItem Value="No">No</asp:ListItem>
            </euc:EformRadioButtonList>
	        
	        </td>
	        </tr>
	        <tr>
	        <td id="LocallyRecurrent_SurveyTableInputContainer">&nbsp;
	            <euc:EformTextBox Runat="server" ID="LocallyRecurrent_SurveyDateText" Table="Surveys" RecordId="3" FIELD="SurveyDateText" style="display: none;"  />
	            <euc:EformTextBox Runat="server" ID="LocallyRecurrent_SurveyDate" Table="Surveys" RecordId="3" FIELD="SurveyDate" style="display: none;"  />
	            <euc:EformTextBox Runat="server" ID="LocallyRecurrent_SurveyType" Table="Surveys" RecordId="3" FIELD="SurveyType" style="display: none;"  />
	            <euc:EformTextBox Runat="server" ID="LocallyRecurrent_SurveyQuality" Table="Surveys" RecordId="3" FIELD="SurveyQuality" style="display: none;"  />
	        </td>
	        <td>
	        
		    <table cellspacing="0" class="ColorectalPreviousTreatmentTable" id="ColorectalPreviousTreatmentTable_LocallyRecurrent" style="display: none;" >
		    <tr><%-- dont change the order of inputs or the script will break - jf --%>
		        <td><euc:EformCheckBox Runat="server" Table="SurveyItems" ParentRecordId="3" RecordId="1" Field="SurveyItemResult" ID="LocallyRecurrent_Radiation_Yes" Text="Radiation" Value="Yes" onclick="SetPreviousTreatmentSurveyItem(this,'Radiation');" />
		            <euc:EformTextBox Runat="server" Table="SurveyItems" ParentRecordId="3" RecordId="1" Field="SurveyItem" ID="LocallyRecurrent_Radiation" style="display: none;" />
		        </td>
		        <td>Start Date <euc:EformTextBox Runat="server" Table="SurveyItems" ParentRecordId="3" RecordId="2" Field="SurveyItemResult" ID="LocallyRecurrent_Radiation_DateText"  style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" />
		            <euc:EformTextBox Runat="server" Table="SurveyItems" ParentRecordId="3" RecordId="2" Field="SurveyItem" ID="LocallyRecurrent_Radiation_DateText_Item" style="display: none;" />
		        
		            <euc:EformHidden  Runat="server" Table="SurveyItems" ParentRecordId="3" RecordId="3" Field="SurveyItemResult" ID="LocallyRecurrent_Radiation_Date" ></euc:EformHidden>
		            <euc:EformTextBox Runat="server" Table="SurveyItems" ParentRecordId="3" RecordId="3" Field="SurveyItem" ID="LocallyRecurrent_Radiation_Date_Item" style="display: none;" />
		        </td>
		    </tr>
		    <tr><%-- dont change the order of inputs or the script will break - jf --%>
		        <td style="padding-right: 20px;"><euc:EformCheckBox Runat="server" Table="SurveyItems" ParentRecordId="3" RecordId="4" Field="SurveyItemResult" ID="LocallyRecurrent_Chemotherapy_Yes" Text="Chemotherapy" Value="Yes" onclick="SetPreviousTreatmentSurveyItem(this,'Chemotherapy');" />
		            <euc:EformTextBox Runat="server" Table="SurveyItems" ParentRecordId="3" RecordId="4" Field="SurveyItem" ID="LocallyRecurrent_Chemotherapy" style="display: none;" />
		        </td>
		        <td>Start Date <euc:EformTextBox Runat="server" Table="SurveyItems" ParentRecordId="3" RecordId="5" Field="SurveyItemResult" ID="LocallyRecurrent_Chemotherapy_DateText"  style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" />
		            <euc:EformTextBox Runat="server" Table="SurveyItems" ParentRecordId="3" RecordId="5" Field="SurveyItem" ID="LocallyRecurrent_Chemotherapy_DateText_Item" style="display: none;" />
		        
		            <euc:EformHidden  Runat="server" Table="SurveyItems" ParentRecordId="3" RecordId="6" Field="SurveyItemResult" ID="LocallyRecurrent_Chemotherapy_Date" ></euc:EformHidden>
		            <euc:EformTextBox Runat="server" Table="SurveyItems" ParentRecordId="3" RecordId="6" Field="SurveyItem" ID="LocallyRecurrent_Chemotherapy_Date_Item" style="display: none;" />
		        </td>
		    </tr>
		    <tr><%-- dont change the order of inputs or the script will break - jf --%>
		        <td><euc:EformCheckBox Runat="server" Table="SurveyItems" ParentRecordId="3" RecordId="7" Field="SurveyItemResult" ID="LocallyRecurrent_Surgery_Yes" Text="Surgery" Value="Yes" onclick="SetPreviousTreatmentSurveyItem(this,'Surgery');" />
		            <euc:EformTextBox Runat="server" Table="SurveyItems" ParentRecordId="3" RecordId="7" Field="SurveyItem" ID="LocallyRecurrent_Surgery" style="display: none;" />
		        </td>
		        <td style="text-align: right;">Date <euc:EformTextBox Runat="server" Table="SurveyItems" ParentRecordId="3" RecordId="8" Field="SurveyItemResult" ID="LocallyRecurrent_Surgery_DateText"  style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" />
		            <euc:EformTextBox Runat="server" Table="SurveyItems" ParentRecordId="3" RecordId="8" Field="SurveyItem" ID="LocallyRecurrent_Surgery_DateText_Item" style="display: none;" />
		        
		            <euc:EformHidden  Runat="server" Table="SurveyItems" ParentRecordId="3" RecordId="9" Field="SurveyItemResult" ID="LocallyRecurrent_Surgery_Date" ></euc:EformHidden>
		            <euc:EformTextBox Runat="server" Table="SurveyItems" ParentRecordId="3" RecordId="9" Field="SurveyItem" ID="LocallyRecurrent_Surgery_Date_Item" style="display: none;" />
		        </td>
		    </tr>
		    </table>
	        
	        </td>
	        </tr>
	        </table>
	    </td>
	</tr><tr id="MetastasisPathContainer">
	    <td >
	        <strong style="color: #111111;" title="Type UNKNOWN if applicable for any field below">Distant Metastasis</strong>
<span style="font-size: 12px; color: #666666; margin-left: 20px;">(Information on Distant Recurrence)</span>
	        <table cellpadding="0" cellspacing="10" style="background-color: #efefef; border: solid 1px #cccccc;" >
			<tr>
	        <td colspan="2" title="Multiple Metastases"><euc:EformCheckBox ID="MultipleMetastases" Table="NoTable" Field="MultipleMetastases" runat="server" Value="Yes" onclick="setMultipleMetastases();"  /><span style="font-weight: bold; margin-left: 5px;">Multiple Metastases</span>
			</td>
			</tr>
			<tr id="MultipleMetastasesHTMLTableContainer" style="display: none;">
			<td colspan="2" style="padding: 0px 0px 0px 0px;">
			<style type="text/css">
			table#MultipleMetastasesHTMLTable
			{
				border-collapse: collapse;
			}
			table#MultipleMetastasesHTMLTable th
			{
				border: solid 1px #cccccc;
				background-color: #dddddd;
				color: #1f1f1f;
				font-size: 13px;
				font-weight: bold;
			}
			table#MultipleMetastasesHTMLTable td
			{
				border: solid 1px #cccccc;
			}
			</style>
			<table cellspacing="0" id="MultipleMetastasesHTMLTable">
				<tr>
					<th title="date of diagnosis of metastasis">Date of Diagnosis</th>
					<th title="anatomic site of metastasis">Location of Lesion</th>
					<th title="histology of metastasis">Histology</th>
				</tr>
				<tr>
					<td><euc:EformTextBox id="PathDateText_5" Table="Pathology" RecordId="5" Field="PathDateText" ShowCalendar="True" CalcDate="True" Runat="server" Width="100px"/><euc:EformHidden id="PathDate_5" Table="Pathology" RecordId="5" Field="PathDate" Runat="server"/></td>
					<td><euc:EformComboBox ID="PathSite_5" Table="Pathology" RecordId="5" Field="PathSite" runat="server" LookupCode="BxSite" Width="140" /></td>
					<td><euc:EformComboBox ID="PathHistology_5" Table="Pathology" RecordId="5" Field="PathHistology" runat="server" LookupCode="PathHistology" Width="200" /></td>
				</tr>
				<tr>
					<td><euc:EformTextBox id="PathDateText_6" Table="Pathology" RecordId="6" Field="PathDateText" ShowCalendar="True" CalcDate="True" Runat="server" Width="100px"/><euc:EformHidden id="PathDate_6" Table="Pathology" RecordId="6" Field="PathDate" Runat="server"/></td>
					<td><euc:EformComboBox ID="PathSite_6" Table="Pathology" RecordId="6" Field="PathSite" runat="server" LookupCode="BxSite" Width="140" /></td>
					<td><euc:EformComboBox ID="PathHistology_6" Table="Pathology" RecordId="6" Field="PathHistology" runat="server" LookupCode="PathHistology" Width="200" /></td>
				</tr>
				<tr>
					<td><euc:EformTextBox id="PathDateText_7" Table="Pathology" RecordId="7" Field="PathDateText" ShowCalendar="True" CalcDate="True" Runat="server" Width="100px"/><euc:EformHidden id="PathDate_7" Table="Pathology" RecordId="7" Field="PathDate" Runat="server"/></td>
					<td><euc:EformComboBox ID="PathSite_7" Table="Pathology" RecordId="7" Field="PathSite" runat="server" LookupCode="BxSite" Width="140" /></td>
					<td><euc:EformComboBox ID="PathHistology_7" Table="Pathology" RecordId="7" Field="PathHistology" runat="server" LookupCode="PathHistology" Width="200" /></td>
				</tr>
				<tr style="display: none;">
					<td><euc:EformTextBox id="PathDateText_8" Table="Pathology" RecordId="8" Field="PathDateText" ShowCalendar="True" CalcDate="True" Runat="server" Width="100px"/><euc:EformHidden id="PathDate_8" Table="Pathology" RecordId="8" Field="PathDate" Runat="server"/></td>
					<td><euc:EformComboBox ID="PathSite_8" Table="Pathology" RecordId="8" Field="PathSite" runat="server" LookupCode="BxSite" Width="140" /></td>
					<td><euc:EformComboBox ID="PathHistology_8" Table="Pathology" RecordId="8" Field="PathHistology" runat="server" LookupCode="PathHistology" Width="200" /></td>
				</tr>
				<tr style="display: none;">
					<td><euc:EformTextBox id="PathDateText_9" Table="Pathology" RecordId="9" Field="PathDateText" ShowCalendar="True" CalcDate="True" Runat="server" Width="100px"/><euc:EformHidden id="PathDate_9" Table="Pathology" RecordId="9" Field="PathDate" Runat="server"/></td>
					<td><euc:EformComboBox ID="PathSite_9" Table="Pathology" RecordId="9" Field="PathSite" runat="server" LookupCode="BxSite" Width="140" /></td>
					<td><euc:EformComboBox ID="PathHistology_9" Table="Pathology" RecordId="9" Field="PathHistology" runat="server" LookupCode="PathHistology" Width="200" /></td>
				</tr>
				<tr style="display: none;">
					<td><euc:EformTextBox id="PathDateText_10" Table="Pathology" RecordId="10" Field="PathDateText" ShowCalendar="True" CalcDate="True" Runat="server" Width="100px"/><euc:EformHidden id="PathDate_10" Table="Pathology" RecordId="10" Field="PathDate" Runat="server"/></td>
					<td><euc:EformComboBox ID="PathSite_10" Table="Pathology" RecordId="10" Field="PathSite" runat="server" LookupCode="BxSite" Width="140" /></td>
					<td><euc:EformComboBox ID="PathHistology_10" Table="Pathology" RecordId="10" Field="PathHistology" runat="server" LookupCode="PathHistology" Width="200" /></td>
				</tr>
				<tr style="display: none;">
					<td><euc:EformTextBox id="PathDateText_11" Table="Pathology" RecordId="11" Field="PathDateText" ShowCalendar="True" CalcDate="True" Runat="server" Width="100px"/><euc:EformHidden id="PathDate_11" Table="Pathology" RecordId="11" Field="PathDate" Runat="server"/></td>
					<td><euc:EformComboBox ID="PathSite_11" Table="Pathology" RecordId="11" Field="PathSite" runat="server" LookupCode="BxSite" Width="140" /></td>
					<td><euc:EformComboBox ID="PathHistology_11" Table="Pathology" RecordId="11" Field="PathHistology" runat="server" LookupCode="PathHistology" Width="200" /></td>
				</tr>
				<tr style="display: none;">
					<td><euc:EformTextBox id="PathDateText_12" Table="Pathology" RecordId="12" Field="PathDateText" ShowCalendar="True" CalcDate="True" Runat="server" Width="100px"/><euc:EformHidden id="PathDate_12" Table="Pathology" RecordId="12" Field="PathDate" Runat="server"/></td>
					<td><euc:EformComboBox ID="PathSite_12" Table="Pathology" RecordId="12" Field="PathSite" runat="server" LookupCode="BxSite" Width="140" /></td>
					<td><euc:EformComboBox ID="PathHistology_12" Table="Pathology" RecordId="12" Field="PathHistology" runat="server" LookupCode="PathHistology" Width="200" /></td>
				</tr>
				<tr style="display: none;">
					<td><euc:EformTextBox id="PathDateText_13" Table="Pathology" RecordId="13" Field="PathDateText" ShowCalendar="True" CalcDate="True" Runat="server" Width="100px"/><euc:EformHidden id="PathDate_13" Table="Pathology" RecordId="13" Field="PathDate" Runat="server"/></td>
					<td><euc:EformComboBox ID="PathSite_13" Table="Pathology" RecordId="13" Field="PathSite" runat="server" LookupCode="BxSite" Width="140" /></td>
					<td><euc:EformComboBox ID="PathHistology_13" Table="Pathology" RecordId="13" Field="PathHistology" runat="server" LookupCode="PathHistology" Width="200" /></td>
				</tr>
				<tr style="display: none;">
					<td><euc:EformTextBox id="PathDateText_14" Table="Pathology" RecordId="14" Field="PathDateText" ShowCalendar="True" CalcDate="True" Runat="server" Width="100px"/><euc:EformHidden id="PathDate_14" Table="Pathology" RecordId="14" Field="PathDate" Runat="server"/></td>
					<td><euc:EformComboBox ID="PathSite_14" Table="Pathology" RecordId="14" Field="PathSite" runat="server" LookupCode="BxSite" Width="140" /></td>
					<td><euc:EformComboBox ID="PathHistology_14" Table="Pathology" RecordId="14" Field="PathHistology" runat="server" LookupCode="PathHistology" Width="200" /></td>
				</tr>
			</table>
			<img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'MultipleMetastasesHTMLTable');" />
			</td>
	        </tr>
	        <tr id="SingleMetastasisDateHTMLRow">
	        <td title="date of diagnosis of metastasis">Date of Diagnosis</td>
	        <td><euc:EformTextBox id="PathDateText_3" Table="Pathology" RecordId="3" Field="PathDateText" ShowCalendar="True" CalcDate="True" Runat="server" Width="100px"/>
		        <euc:EformHidden id="PathDate_3" Table="Pathology" RecordId="3" Field="PathDate" Runat="server"/>
		    </td>
	        </tr>
	        <tr id="SingleMetastasisSiteHTMLRow">
	        <td title="anatomic site of metastasis">Location of Lesion</td>
	        <td><euc:EformComboBox ID="PathSite_3" Table="Pathology" RecordId="3" Field="PathSite" runat="server" LookupCode="BxSite" Width="140" /></td>
	        </tr>
	        <tr id="SingleMetastasisHistologyHTMLRow" onmouseout="defaultResult(3);">
	        <td title="histology of metastasis">Histology</td>
	        <td><euc:EformComboBox ID="PathHistology_3" Table="Pathology" RecordId="3" Field="PathHistology" runat="server" LookupCode="PathHistology" Width="200" /></td>
	        </tr>
<%--	        <tr onmouseover="defaultResult(3);">
	        <td title="result of metastasis">Result</td>
	        <td><euc:EformComboBox ID="PathResult_3" Table="Pathology" RecordId="3" Field="PathResult" runat="server" LookupCode="BxResult" Width="200" /></td>
	        </tr>
	        <tr>
	        <td title="disease extent of metastasis">Disease Extent</td>
	        <td><euc:EformComboBox ID="PathDiseaseExtent_3" Table="ColorectalPath" RecordId="3" Field="PathDiseaseExtent" runat="server" LookupCode="ColorectalDiseaseExtent" Width="200" /></td>
	        </tr>
--%>	        
	        <tr>
	        <td title="" style="width: 125px;">Previous Treatment?</td>
	        <td style="width: 330px;" id="Metastasis_PreviousTreatmentToggleContainer" onclick="togglePreviousTreatmentTable('Metastasis_SurveyTableInputContainer','Metastasis_PreviousTreatmentToggleContainer','ColorectalPreviousTreatmentTable_Metastasis','Metastasis');" >
	        
	        <euc:EformRadioButtonList Table="NoTable" Field="Malignant_MetastasisPreviousTreatment" id="Malignant_MetastasisPreviousTreatment" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal">
		        <asp:ListItem>Yes</asp:ListItem>
                <asp:ListItem Value="No">No</asp:ListItem>
            </euc:EformRadioButtonList>
	        
	        </td>
	        </tr>
	        <tr>
	        <td id="Metastasis_SurveyTableInputContainer">&nbsp;
	            <euc:EformTextBox Runat="server" ID="Metastasis_SurveyDateText" Table="Surveys" RecordId="4" FIELD="SurveyDateText" style="display: none;"  />
	            <euc:EformTextBox Runat="server" ID="Metastasis_SurveyDate" Table="Surveys" RecordId="4" FIELD="SurveyDate" style="display: none;"  />
	            <euc:EformTextBox Runat="server" ID="Metastasis_SurveyType" Table="Surveys" RecordId="4" FIELD="SurveyType" style="display: none;"  />
	            <euc:EformTextBox Runat="server" ID="Metastasis_SurveyQuality" Table="Surveys" RecordId="4" FIELD="SurveyQuality" style="display: none;"  />
	        </td>
	        <td>
	        
		    <table cellspacing="0" class="ColorectalPreviousTreatmentTable" id="ColorectalPreviousTreatmentTable_Metastasis" style="display: none;" >
		    <tr><%-- dont change the order of inputs or the script will break - jf --%>
		        <td><euc:EformCheckBox Runat="server" Table="SurveyItems" ParentRecordId="4" RecordId="1" Field="SurveyItemResult" ID="Metastasis_Radiation_Yes" Text="Radiation" Value="Yes" onclick="SetPreviousTreatmentSurveyItem(this,'Radiation');" />
		            <euc:EformTextBox Runat="server" Table="SurveyItems" ParentRecordId="4" RecordId="1" Field="SurveyItem" ID="Metastasis_Radiation" style="display: none;" />
		        </td>
		        <td>Start Date <euc:EformTextBox Runat="server" Table="SurveyItems" ParentRecordId="4" RecordId="2" Field="SurveyItemResult" ID="Metastasis_Radiation_DateText"  style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" />
		            <euc:EformTextBox Runat="server" Table="SurveyItems" ParentRecordId="4" RecordId="2" Field="SurveyItem" ID="Metastasis_Radiation_DateText_Item" style="display: none;" />
		        
		            <euc:EformHidden  Runat="server" Table="SurveyItems" ParentRecordId="4" RecordId="3" Field="SurveyItemResult" ID="Metastasis_Radiation_Date" ></euc:EformHidden>
		            <euc:EformTextBox Runat="server" Table="SurveyItems" ParentRecordId="4" RecordId="3" Field="SurveyItem" ID="Metastasis_Radiation_Date_Item" style="display: none;" />
		        </td>
		    </tr>
		    <tr><%-- dont change the order of inputs or the script will break - jf --%>
		        <td style="padding-right: 20px;"><euc:EformCheckBox Runat="server" Table="SurveyItems" ParentRecordId="4" RecordId="4" Field="SurveyItemResult" ID="Metastasis_Chemotherapy_Yes" Text="Chemotherapy" Value="Yes" onclick="SetPreviousTreatmentSurveyItem(this,'Chemotherapy');" />
		            <euc:EformTextBox Runat="server" Table="SurveyItems" ParentRecordId="4" RecordId="4" Field="SurveyItem" ID="Metastasis_Chemotherapy" style="display: none;" />
		        </td>
		        <td>Start Date <euc:EformTextBox Runat="server" Table="SurveyItems" ParentRecordId="4" RecordId="5" Field="SurveyItemResult" ID="Metastasis_Chemotherapy_DateText"  style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" />
		            <euc:EformTextBox Runat="server" Table="SurveyItems" ParentRecordId="4" RecordId="5" Field="SurveyItem" ID="Metastasis_Chemotherapy_DateText_Item" style="display: none;" />
		        
		            <euc:EformHidden  Runat="server" Table="SurveyItems" ParentRecordId="4" RecordId="6" Field="SurveyItemResult" ID="Metastasis_Chemotherapy_Date" ></euc:EformHidden>
		            <euc:EformTextBox Runat="server" Table="SurveyItems" ParentRecordId="4" RecordId="6" Field="SurveyItem" ID="Metastasis_Chemotherapy_Date_Item" style="display: none;" />
		        </td>
		    </tr>
		    <tr><%-- dont change the order of inputs or the script will break - jf --%>
		        <td><euc:EformCheckBox Runat="server" Table="SurveyItems" ParentRecordId="4" RecordId="7" Field="SurveyItemResult" ID="Metastasis_Surgery_Yes" Text="Surgery" Value="Yes" onclick="SetPreviousTreatmentSurveyItem(this,'Surgery');" />
		            <euc:EformTextBox Runat="server" Table="SurveyItems" ParentRecordId="4" RecordId="7" Field="SurveyItem" ID="Metastasis_Surgery" style="display: none;" />
		        </td>
		        <td style="text-align: right;">Date <euc:EformTextBox Runat="server" Table="SurveyItems" ParentRecordId="4" RecordId="8" Field="SurveyItemResult" ID="Metastasis_Surgery_DateText"  style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" />
		            <euc:EformTextBox Runat="server" Table="SurveyItems" ParentRecordId="4" RecordId="8" Field="SurveyItem" ID="Metastasis_Surgery_DateText_Item" style="display: none;" />
		        
		            <euc:EformHidden  Runat="server" Table="SurveyItems" ParentRecordId="4" RecordId="9" Field="SurveyItemResult" ID="Metastasis_Surgery_Date" ></euc:EformHidden>
		            <euc:EformTextBox Runat="server" Table="SurveyItems" ParentRecordId="4" RecordId="9" Field="SurveyItem" ID="Metastasis_Surgery_Date_Item" style="display: none;" />
		        </td>
		    </tr>
		    </table>
	        <img src="../../Images/shim.gif" hspace="0" width="330" height="1" border="0"   />
	        </td>
	        </tr>
	        </table>
	    </td>

	</tr>
	</table>
	</td>	

  </tr>  
</table>
<script type="text/javascript">
function setMalignantDisease()
{
    var ColorectalMalignantDiseaseTable = $('ColorectalMalignantDiseaseTable');
    if ($('<% = MalignantDisease.ClientID %>').checked)
    {
        clearAndDisableAllElementsContainedInNode(ColorectalMalignantDiseaseTable);
        //ColorectalMalignantDiseaseTable.style.opacity = '0.6';
        //ColorectalMalignantDiseaseTable.style.filter = 'alpha(opacity=60)';
        
        clearPathSection($('PrimaryDiseasePathContainer'));
        clearPathSection($('LocallyRecurrentOrPersistentDiseasePathContainer'));
        clearPathSection($('MetastasisPathContainer'));
        
    }
    else
    {
        enableAllElementsContainedInNode(ColorectalMalignantDiseaseTable);
        //ColorectalMalignantDiseaseTable.style.opacity = '1.0';
        //ColorectalMalignantDiseaseTable.style.filter = 'alpha(opacity=100)';
    }
}


function setInitialMalignantDiseaseView()
{
    if ($('<% = MalignantDisease.ClientID %>').checked == false)
    {
        var MalignantDiseaseValueExists = false;

        var MalignantBenignDiseaseTable = $('ColorectalMalignantDiseaseTable');
        
        var inputs = ColorectalMalignantDiseaseTable.getElementsByTagName('input');
	    for (var i=0;i<inputs.length;i++)
	    {
		    type = inputs[i].getAttribute('type');
		    if (type == 'checkbox' || type == 'radio') {
			    if (inputs[i].checked == true) MalignantDiseaseValueExists = true;
		    } else if (inputs[i].value != '')  {
			    MalignantDiseaseValueExists = true; }
   	    }
    	
	    var selects = MalignantBenignDiseaseTable.getElementsByTagName('select');
	    for (var j=0;j<selects.length;j++)
	    {
	        if (selects[j].selectedIndex > 0)  {
			    MalignantDiseaseValueExists = true; }
	    }
    	
	    var textareas = MalignantBenignDiseaseTable.getElementsByTagName('textarea');
	    for (var k=0;k<textareas.length;k++)
	    {
	        if (textareas[k].value != '')  {
			MalignantDiseaseValueExists = true; }
	    }
    }
    
    if (!MalignantDiseaseValueExists) $('<% = MalignantDisease.ClientID %>').checked = true;
    
    setMalignantDisease();
}
setInitialMalignantDiseaseView();







function attachShowHidePathScriptsAndSetInitialPathDisplay()
{
	var malignantStatusContainer = $('malignantStatusContainer');
	var malignantStatusRadios = malignantStatusContainer.getElementsByTagName('input');
	var selectedRadioValue = '';
	
	for (var i=0;i<malignantStatusRadios.length;i++)
	{
		if (malignantStatusRadios[i].type == 'radio')
		{
			malignantStatusRadios[i].onclick = function() {showPathologyFields(this)};
			if (malignantStatusRadios[i].checked)
			{
			    showPathologyFields(malignantStatusRadios[i]);
			}
		}
	}
}
attachShowHidePathScriptsAndSetInitialPathDisplay();

function showPathologyFields(theRadio)
{
    var dateTextVal = '';
    if (typeof(globalDefaultDateText)!= 'undefined')
    {
        dateTextVal = globalDefaultDateText;
    }





	var PrimaryDiseasePathContainer = $('PrimaryDiseasePathContainer');
	var LocallyRecurrentOrPersistentDiseasePathContainer = $('LocallyRecurrentOrPersistentDiseasePathContainer');
	var MetastasisPathContainer = $('MetastasisPathContainer');
	
	var PrimaryDiseaseDateText = $('<% = PathDateText_1.ClientID %>');
	var LocallyRecurrentOrPersistentDiseaseDateText = $('<% = PathDateText_2.ClientID %>');
	var MetastasisDateText = $('<% = PathDateText_3.ClientID %>');
	
	
<%--	var PrimaryDiseasePathResult = $('<% = PathResult_1.ClientID %>'); 
	var LocallyRecurrentOrPersistentDiseasePathResult = $('<% = PathResult_2.ClientID %>');
	var MetastasisPathResult = $('<% = PathResult_3.ClientID %>');
	
	var PrimaryDiseaseDiseaseExtent = $('<% = PathDiseaseExtent_1.ClientID %>');
	var LocallyRecurrentOrPersistentDiseaseDiseaseExtent = $('<% = PathDiseaseExtent_2.ClientID %>');
	var MetastasisDiseaseExtent = $('<% = PathDiseaseExtent_3.ClientID %>');--%>
	
	var showPrimaryDisease = false;
	var showLocallyRecurrentOrPersistentDisease  = false;
	var showMetastasis  = false;
	
	if (theRadio.value.toString().toUpperCase().indexOf('OTHER') < 0)
	{
    		showPrimaryDisease = true;
	}
	if (theRadio.value.toString().toUpperCase().indexOf('LOCALLY RECURRENT') > -1)
	{
    		showLocallyRecurrentOrPersistentDisease = true;
	}
	if (theRadio.value.toString().toUpperCase().indexOf('METASTASIS') > -1 && theRadio.value.toString().toUpperCase().indexOf('WITHOUT') < 0 && theRadio.value.toString().toUpperCase().indexOf('SUSPICION') < 0)
	{
    		showMetastasis = true;
	}

    if (showPrimaryDisease)
    {
        PrimaryDiseasePathContainer.style.display = '';
        if (globalDefaultDateText.toString().length > 0) PrimaryDiseaseDateText.value = dateTextVal;
        if (!PrimaryDiseaseDateText.disabled) {
            PrimaryDiseaseDateText.focus();
            PrimaryDiseaseDateText.blur();
        }
        enableAllElementsContainedInNode(PrimaryDiseasePathContainer);
//        PrimaryDiseaseDiseaseExtent.value = 'Primary';
    }
    else
    {
        clearPathSection(PrimaryDiseasePathContainer);
    }
    
    if (showLocallyRecurrentOrPersistentDisease)
    {
        LocallyRecurrentOrPersistentDiseasePathContainer.style.display = '';
        if (globalDefaultDateText.toString().length > 0) LocallyRecurrentOrPersistentDiseaseDateText.value = dateTextVal;
        if (!LocallyRecurrentOrPersistentDiseaseDateText.disabled) {
            LocallyRecurrentOrPersistentDiseaseDateText.focus();
            LocallyRecurrentOrPersistentDiseaseDateText.blur();
        }
        enableAllElementsContainedInNode(LocallyRecurrentOrPersistentDiseasePathContainer);
//        LocallyRecurrentOrPersistentDiseaseDiseaseExtent.value = 'Locally Recurrent or Persistent Disease';
    }
    else
    {
        clearPathSection(LocallyRecurrentOrPersistentDiseasePathContainer);
    }
    
    if (showMetastasis)
    {
        MetastasisPathContainer.style.display = '';
        if (globalDefaultDateText.toString().length > 0) MetastasisDateText.value = dateTextVal;
        if (!MetastasisDateText.disabled) {
            MetastasisDateText.focus();
            MetastasisDateText.blur();
        }
        enableAllElementsContainedInNode(MetastasisPathContainer);
//        MetastasisDiseaseExtent.value = 'Metastasis';
    }
    else
    {
        clearPathSection(MetastasisPathContainer);
    }

}
function clearPathSection(PathSection)
{
    PathSection.style.display = 'none'
    clearAndDisableAllElementsContainedInNode(PathSection);
}
function populateField(field,val)
{
    field.value = val;
}

function defaultResult(PathRecordId)
{
<%--
    var histologyField;
    var resultField;

    switch (PathRecordId)
    {
        case 1:
            histologyField = $('<% = PathHistology_1.ClientID %>');
            resultField = $('<% = PathResult_1.ClientID %>');
            break;
        case 2:
            histologyField = $('<% = PathHistology_2.ClientID %>');
            resultField = $('<% = PathResult_2.ClientID %>');
            break;
        case 3:
            histologyField = $('<% = PathHistology_3.ClientID %>');
            resultField = $('<% = PathResult_3.ClientID %>');
            break;
        default:
            break;
    }
    
    if (histologyField.value.length > 0)
    {
        if (histologyField.value.toUpperCase().indexOf('ADENOCARCINOMA') > -1) {resultField.value = 'Positive';}
        else {resultField.value = 'Negative';}
    }
--%>
}

function SetPreviousTreatmentSurveyItem(cbox,TreatmentType)
{
    var tr = cbox.parentNode.parentNode;
    if (tr.tagName.toString().toUpperCase() == 'TD') tr = tr.parentNode;
    
    var trInputs = tr.getElementsByTagName('input');
    
    if (trInputs.length > 0)
    {
        if (cbox.checked != true) { clearAllElementsContainedInNode(tr); }
        else {
        
            var TreatmentItem = trInputs[1];
            var DateTextItem = trInputs[3];
            var DateItem = trInputs[5];
            
            TreatmentItem.value = TreatmentType;
            DateTextItem.value = TreatmentType + 'DateText';
            DateItem.value = TreatmentType + 'Date';
        }
    }
}

function togglePreviousTreatmentTable(SurveyTableInputContainerId,toggleContainerId,TreatmentHtmlTableId,TreatmentType)
{
    var SurveyTableInputContainer = document.getElementById(SurveyTableInputContainerId);
    var toggleContainer = document.getElementById(toggleContainerId);
    var TreatmentHtmlTable = document.getElementById(TreatmentHtmlTableId);
    var toggleInputs = toggleContainer.getElementsByTagName('input');
    for (var i=0;i<toggleInputs.length;i++)
	{
	    if (toggleInputs[i].type != null && toggleInputs[i].type == 'radio')
	    {
	        if (toggleInputs[i].checked)
	        {
	            if (toggleInputs[i].value.toString().toUpperCase() == 'YES') {
	                TreatmentHtmlTable.style.display = '';
	                
                    var surveyTableInputs = SurveyTableInputContainer.getElementsByTagName('input');

                    if (surveyTableInputs.length > 0)
                    {
                            var SurveyDateText = surveyTableInputs[0];
                            var SurveyDate = surveyTableInputs[1];
                            var SurveyType = surveyTableInputs[2];
                            var SurveyQuality = surveyTableInputs[3];
                            
                            if (typeof (colorectalAppointmentDateText) != 'undefined') SurveyDateText.value = colorectalAppointmentDateText;
                            if (typeof (colorectalAppointmentDate) != 'undefined') SurveyDate.value = colorectalAppointmentDate;
                            SurveyType.value = 'Colorectal Consult - Previous Treatment for ' + TreatmentType;
                            SurveyQuality.value = 'STD';
                    }
	                
	                
	                
	            }
	            else {
	                clearAllElementsContainedInNode(SurveyTableInputContainer);
	                clearAllElementsContainedInNode(TreatmentHtmlTable);
	                TreatmentHtmlTable.style.display = 'none';
	            }
	        }
	    }
	} 
}
// set up the Previous Treatment Table views onload
togglePreviousTreatmentTable('Primary_SurveyTableInputContainer','Primary_PreviousTreatmentToggleContainer','ColorectalPreviousTreatmentTable_Primary','Primary');
togglePreviousTreatmentTable('LocallyRecurrent_SurveyTableInputContainer','LocallyRecurrent_PreviousTreatmentToggleContainer','ColorectalPreviousTreatmentTable_LocallyRecurrent','LocallyRecurrent');
togglePreviousTreatmentTable('Metastasis_SurveyTableInputContainer','Metastasis_PreviousTreatmentToggleContainer','ColorectalPreviousTreatmentTable_Metastasis','Metastasis');


function setMultipleMetastases()
{
	var MultipleMetastasesCheckbox = $('<% = MultipleMetastases.ClientID %>');
	var MultipleMetastasesHTMLTableContainer = $('MultipleMetastasesHTMLTableContainer');
	var SingleMetastasisDateHTMLRow = $('SingleMetastasisDateHTMLRow');
	var SingleMetastasisSiteHTMLRow = $('SingleMetastasisSiteHTMLRow');
	var SingleMetastasisHistologyHTMLRow = $('SingleMetastasisHistologyHTMLRow');
	
	if (MultipleMetastasesCheckbox.checked == true)
	{
		MultipleMetastasesHTMLTableContainer.style.display = '';
		SingleMetastasisDateHTMLRow.style.display = 'none';
		SingleMetastasisSiteHTMLRow.style.display = 'none';
		SingleMetastasisHistologyHTMLRow.style.display = 'none';
		clearAllElementsContainedInNode(SingleMetastasisDateHTMLRow);
		clearAllElementsContainedInNode(SingleMetastasisSiteHTMLRow);
		clearAllElementsContainedInNode(SingleMetastasisHistologyHTMLRow);
	}
	else
	{
		MultipleMetastasesHTMLTableContainer.style.display = 'none';
		SingleMetastasisDateHTMLRow.style.display = '';
		SingleMetastasisSiteHTMLRow.style.display = '';
		SingleMetastasisHistologyHTMLRow.style.display = '';
		clearAllElementsContainedInNode(MultipleMetastasesHTMLTableContainer);
	}
}
setMultipleMetastases();

</script>
<br/><br/>