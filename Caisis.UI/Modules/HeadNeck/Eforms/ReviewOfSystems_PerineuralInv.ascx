<%@ Control Language="c#" Inherits="Caisis.UI.Modules.HeadNeck.Eforms.ReviewOfSystems_PerineuralInv" CodeFile="ReviewOfSystems_PerineuralInv.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<script type="text/javascript">
function processROSSystemLabels()
{
	var systemLabels = jQuery('span[id*="ROS_System"]');
	var num = systemLabels.size();
	
	systemLabels.each(function(index) {
		var next = systemLabels.eq(index+1);
		if (index < (num-1) && (jQuery(this).text() == jQuery(next).text())) {
			jQuery(next).css('display','none');
			jQuery(next).parent().css({'border-top': 'none'});
			jQuery(this).parent().css({'border-bottom': 'none'});
		}
	});
	
	
	systemLabels.each(function(index) {
	jQuery(this).text(function(index, text) {
		    var systemDisplayName = '';
			switch(text)
			{
			case 'Constitution':
			  systemDisplayName = 'General';
			  break;
			case 'Neurology':
			  systemDisplayName = 'Neuro';
			  break;
			case 'Cardiovascular (General)':
			  systemDisplayName = 'CV';
			  break;
			case 'Musculoskeletal':
			  systemDisplayName = 'MS';
			  break;
			case 'Pulmonary':
			  systemDisplayName = 'Resp';
			  break;
			case 'Gastrointestinal':
			  systemDisplayName = 'GI';
			  break;
			case 'Genitourinary':
			  systemDisplayName = 'GU';
			  break;
			case 'Psychiatric':
			  systemDisplayName = 'Psych';
			  break;
			case 'Hematological':
			  systemDisplayName = 'Heme';
			  break;
			case 'Endocrine':
			  systemDisplayName = 'Endo';
			  break;
			default:
			  systemDisplayName = text;
			}
			
			return systemDisplayName;
		});
	});
	
}


    
</script>

<style type="text/css">
tr.ROS_DefaultDataEntryRow td
{
	empty-cells:show;
	padding: 4px 10px;
}
tr.ROS_DefaultDataEntryRow td.ControlBoxLinedRowsShaded
{
	font-weight: bold;
}
tr.ROS_DefaultDataEntryRow.PainSubRow td.ControlBoxLinedRowsShaded
{
	font-weight: normal;
}
</style>
<div id="ReviewOfSystemsPNI_HTMLContainer">
<a name="ReviewOfSystems_PerineuralInv" /><span class="controlBoxTitle">Review of Systems</span><br />
<table border="0" cellspacing="0" cellpadding="3" style="border: solid 1px #cccccc;" id="ReviewOfSystemsHtmlTable">
<tbody>
  <tr>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align:left;">Symptom</td>
    <td class="controlBoxDataGridHeaderFirstCol">Result</td>
    <td class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
  </tr>
  <tr class="ROS_DefaultDataEntryRow">
    <td class="ControlBoxLinedRowsShaded"><euc:EformDefaultLabel ID="ROS_Symptom_1" runat="server" DefaultField="EncReviewOfSystems.ROS_Symptom,1" /></td>
		<td  class="ControlBoxLinedRows" id="HeadNeckPNIPainToggleContainer">
        <euc:EformRadioButtonList RecordId="1" Table="EncReviewOfSystems" Field="ROS_Result" Id="ROS_Result_1" LookupCode="YesNoUnknown" runat="server" RepeatLayout="Table" RepeatDirection="Horizontal"  /></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
</tbody>
<tbody id="HeadNeckPNIPainDetails" style="display: none;">
  <tr class="ROS_DefaultDataEntryRow PainSubRow">
    <td class="ControlBoxLinedRowsShaded" style="padding-left: 26px;"><euc:EformDefaultLabel ID="ROS_Symptom_2" runat="server" DefaultField="EncReviewOfSystems.ROS_Symptom,2" /></td>
		<td  class="ControlBoxLinedRows">
        <euc:EformRadioButtonList RepeatLayout="Table" RepeatDirection="Horizontal" RecordId="2" TABLE="EncReviewOfSystems" FIELD="ROS_Result" Runat="server" ID="ROS_Result_2">
	        <asp:ListItem Value="Local" Text="Local" />
	        <asp:ListItem Value="Referred" Text="Referred" />
	        <asp:ListItem Value="Unknown" Text="Unknown" />
        </euc:EformRadioButtonList></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr class="ROS_DefaultDataEntryRow PainSubRow">
    <td class="ControlBoxLinedRowsShaded" style="padding-left: 26px;"><euc:EformDefaultLabel ID="ROS_Symptom_3" runat="server" DefaultField="EncReviewOfSystems.ROS_Symptom,3" /></td>
		<td  class="ControlBoxLinedRows"><euc:EformRadioButtonList RepeatLayout="Table" RepeatDirection="Horizontal" RecordId="3" TABLE="EncReviewOfSystems" FIELD="ROS_Result" Runat="server" ID="ROS_Result_3">
	        <asp:ListItem Value="Sharp" Text="Sharp" />
	        <asp:ListItem Value="Dull" Text="Dull" />
	        <asp:ListItem Value="Neuropathic" Text="Neuropathic" />
        </euc:EformRadioButtonList></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  
  <tr class="ROS_DefaultDataEntryRow PainSubRow">
    <td class="ControlBoxLinedRowsShaded" style="padding-left: 26px; border-bottom: solid 1px #666666;"><euc:EformDefaultLabel ID="ROS_Symptom_4" runat="server" DefaultField="EncReviewOfSystems.ROS_Symptom,4" /></td>
		<td  class="ControlBoxLinedRows" style="border-bottom: solid 1px #666666;"><euc:EformRadioButtonList RepeatLayout="Table" RepeatDirection="Horizontal" RecordId="4" TABLE="EncReviewOfSystems" FIELD="ROS_Result" Runat="server" ID="ROS_Result_4">
	        <asp:ListItem Value="Mild" Text="Mild" />
	        <asp:ListItem Value="Moderate" Text="Moderate" />
	        <asp:ListItem Value="Severe" Text="Severe" />
        </euc:EformRadioButtonList></td>
    <td class="ControlBoxLinedRows" align="center" style="border-bottom: solid 1px #666666;"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
</tbody>
<tbody>
  <tr class="ROS_DefaultDataEntryRow">
    <td class="ControlBoxLinedRowsShaded"><euc:EformDefaultLabel ID="ROS_Symptom_5" runat="server" DefaultField="EncReviewOfSystems.ROS_Symptom,5" /></td>
		<td  class="ControlBoxLinedRows"><euc:EformRadioButtonList RepeatLayout="Table" RepeatDirection="Horizontal" RecordId="5" LookupCode="PresentAbsentUnknown" TABLE="EncReviewOfSystems" FIELD="ROS_Result" Runat="server" ID="ROS_Result_5"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr class="ROS_DefaultDataEntryRow">
    <td class="ControlBoxLinedRowsShaded"><euc:EformDefaultLabel ID="ROS_Symptom_6" runat="server" DefaultField="EncReviewOfSystems.ROS_Symptom,6" /></td>
		<td  class="ControlBoxLinedRows"><euc:EformRadioButtonList RepeatLayout="Table" RepeatDirection="Horizontal" RecordId="6" LookupCode="PresentAbsentUnknown" TABLE="EncReviewOfSystems" FIELD="ROS_Result" Runat="server" ID="ROS_Result_6"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr class="ROS_DefaultDataEntryRow">
    <td class="ControlBoxLinedRowsShaded"><euc:EformDefaultLabel ID="ROS_Symptom_7" runat="server" DefaultField="EncReviewOfSystems.ROS_Symptom,7" /></td>
		<td  class="ControlBoxLinedRows"><euc:EformRadioButtonList RepeatLayout="Table" RepeatDirection="Horizontal" RecordId="7" LookupCode="PresentAbsentUnknown" TABLE="EncReviewOfSystems" FIELD="ROS_Result" Runat="server" ID="ROS_Result_7"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr class="ROS_DefaultDataEntryRow">
    <td class="ControlBoxLinedRowsShaded"><euc:EformDefaultLabel ID="ROS_Symptom_8" runat="server" DefaultField="EncReviewOfSystems.ROS_Symptom,8" /></td>
		<td  class="ControlBoxLinedRows"><euc:EformRadioButtonList RepeatLayout="Table" RepeatDirection="Horizontal" RecordId="8" LookupCode="PresentAbsentUnknown" TABLE="EncReviewOfSystems" FIELD="ROS_Result" Runat="server" ID="ROS_Result_8"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr class="ROS_DefaultDataEntryRow">
    <td height="30" class="ControlBoxLinedRowsShaded"><euc:EformDefaultLabel ID="ROS_Symptom_9" runat="server" DefaultField="EncReviewOfSystems.ROS_Symptom,9" /></td>
		<td  class="ControlBoxLinedRows"><euc:EformRadioButtonList RepeatLayout="Table" RepeatDirection="Horizontal" RecordId="9" LookupCode="PresentAbsentUnknown" TABLE="EncReviewOfSystems" FIELD="ROS_Result" Runat="server" ID="ROS_Result_9"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr class="ROS_DefaultDataEntryRow">
    <td class="ControlBoxLinedRowsShaded"><euc:EformDefaultLabel ID="ROS_Symptom_10" runat="server" DefaultField="EncReviewOfSystems.ROS_Symptom,10" /></td>
		<td  class="ControlBoxLinedRows"><euc:EformRadioButtonList RepeatLayout="Table" RepeatDirection="Horizontal" RecordId="10" LookupCode="PresentAbsentUnknown" TABLE="EncReviewOfSystems" FIELD="ROS_Result" Runat="server" ID="ROS_Result_10"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr class="ROS_DefaultDataEntryRow">
    <td class="ControlBoxLinedRowsShaded"><euc:EformDefaultLabel ID="ROS_Symptom_11" runat="server" DefaultField="EncReviewOfSystems.ROS_Symptom,11" /></td>
		<td  class="ControlBoxLinedRows"><euc:EformRadioButtonList RepeatLayout="Table" RepeatDirection="Horizontal" RecordId="11" LookupCode="PresentAbsentUnknown" TABLE="EncReviewOfSystems" FIELD="ROS_Result" Runat="server" ID="ROS_Result_11"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr class="ROS_DefaultDataEntryRow">
    <td class="ControlBoxLinedRowsShaded"><euc:EformDefaultLabel ID="ROS_Symptom_12" runat="server" DefaultField="EncReviewOfSystems.ROS_Symptom,12" /></td>
		<td  class="ControlBoxLinedRows"><euc:EformRadioButtonList RepeatLayout="Table" RepeatDirection="Horizontal" RecordId="12" LookupCode="PresentAbsentUnknown" TABLE="EncReviewOfSystems" FIELD="ROS_Result" Runat="server" ID="ROS_Result_12"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr class="ROS_DefaultDataEntryRow">
    <td class="ControlBoxLinedRowsShaded"><euc:EformDefaultLabel ID="ROS_Symptom_13" runat="server" DefaultField="EncReviewOfSystems.ROS_Symptom,13" /></td>
		<td  class="ControlBoxLinedRows"><euc:EformRadioButtonList RepeatLayout="Table" RepeatDirection="Horizontal" RecordId="13" LookupCode="PresentAbsentUnknown" TABLE="EncReviewOfSystems" FIELD="ROS_Result" Runat="server" ID="ROS_Result_13"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr class="ROS_DefaultDataEntryRow">
    <td class="ControlBoxLinedRowsShaded"><euc:EformDefaultLabel ID="ROS_Symptom_14" runat="server" DefaultField="EncReviewOfSystems.ROS_Symptom,14" /></td>
		<td  class="ControlBoxLinedRows"><euc:EformRadioButtonList RepeatLayout="Table" RepeatDirection="Horizontal" RecordId="14" LookupCode="PresentAbsentUnknown" TABLE="EncReviewOfSystems" FIELD="ROS_Result" Runat="server" ID="ROS_Result_14"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr class="ROS_DefaultDataEntryRow">
    <td class="ControlBoxLinedRowsShaded"><euc:EformDefaultLabel ID="ROS_Symptom_15" runat="server" DefaultField="EncReviewOfSystems.ROS_Symptom,15" /></td>
		<td  class="ControlBoxLinedRows"><euc:EformRadioButtonList RepeatLayout="Table" RepeatDirection="Horizontal" RecordId="15" LookupCode="PresentAbsentUnknown" TABLE="EncReviewOfSystems" FIELD="ROS_Result" Runat="server" ID="ROS_Result_15"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr class="ROS_DefaultDataEntryRow">
    <td  class="ControlBoxLinedRowsShaded" style="border-bottom: none; padding-bottom: 0px;">
    <span style="display:block;">Other:</span></td>
		<td  class="ControlBoxLinedRows" style="border-bottom: none; padding-bottom: 0px;">&nbsp;</td>
		<td  class="ControlBoxLinedRows" style="border-bottom: none; padding-bottom: 0px;">&nbsp;</td>
  </tr>
  <tr class="ROS_DefaultDataEntryRow">
    <td  class="ControlBoxLinedRowsShaded" style="padding-top: 0px;">
    <euc:EFormComboBox RecordId="16" LookupCode="ROS_Symptom" TABLE="EncReviewOfSystems" FIELD="ROS_Symptom" Runat="server" ID="ROS_Symptom_16" style="width: 130px;" DropDownWidth="290" /></td>
		<td  class="ControlBoxLinedRows" style="padding-top: 0px;"><euc:EformRadioButtonList RepeatLayout="Table" RepeatDirection="Horizontal" RecordId="16" LookupCode="PresentAbsentUnknown" TABLE="EncReviewOfSystems" FIELD="ROS_Result" Runat="server" ID="ROS_Result_16"/></td>
    <td class="ControlBoxLinedRows" align="center" style="padding-top: 0px;"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr class="ROS_DefaultDataEntryRow">
    <td class="ControlBoxLinedRowsShaded"><euc:EformDefaultLabel ID="ROS_Symptom_17" runat="server" DefaultField="EncReviewOfSystems.ROS_Symptom,17" /></td>
		<td  class="ControlBoxLinedRows"><euc:EformRadioButtonList RepeatLayout="Table" RepeatDirection="Horizontal" RepeatColumns="4" RecordId="17" TABLE="EncReviewOfSystems" FIELD="ROS_Result" Runat="server" ID="ROS_Result_17">
	        <asp:ListItem Value="Absent" Text="Absent" />
	        <asp:ListItem Value="Complete" Text="Complete" />
	        <asp:ListItem Value="Moderate" Text="Moderate" />
	        <asp:ListItem Value="Mild" Text="Mild" />
	        <asp:ListItem Value="Twitching" Text="Twitching" />
	        <asp:ListItem Value="Unknown" Text="Unknown" />
        </euc:EformRadioButtonList>
        </td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
</tbody>
</table>
<br/>
<br/>
<br/>
</div>
<script type="text/javascript">
    showHideBasedOnRadioToggle($('HeadNeckPNIPainToggleContainer'), $('HeadNeckPNIPainDetails'), 'Yes');

    var ReviewOfSystemsPNI_HTMLContainer = $('ReviewOfSystemsPNI_HTMLContainer');
    if (typeof ExistingEncounterIdField != 'undefined' && (ExistingEncounterIdField.options.length == 0 || jQuery(ExistingEncounterIdField).val().length < 1)) {
        ReviewOfSystemsPNI_HTMLContainer.style.display = 'none';
    }

    var PNI_ROSRadiosWithUnknownValue = jQuery('input[value=Unknown][type=radio]', ReviewOfSystemsPNI_HTMLContainer);

    PNI_ROSRadiosWithUnknownValue.each(function () {
        var c = jQuery(this).closest('td').parent().closest('td');
        var selectedRadios = jQuery('input:checked', c);
        if (selectedRadios.length < 1) {
            jQuery(this).attr('checked', 'checked');
        }

    });


</script>