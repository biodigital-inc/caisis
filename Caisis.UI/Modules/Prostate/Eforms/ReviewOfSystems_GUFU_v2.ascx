<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Prostate.Eforms.ReviewOfSystems_GUFU_v2" CodeFile="ReviewOfSystems_GUFU_v2.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<script type="text/javascript" language="javascript">
	tableArray.ReviewOfSystemsHtmlTable = "ReviewOfSystemsHtmlTable";
	
	
function processROSPopulatedSystemLabels()
{
	var systemLabels = jQuery('.ROSPopulatedCategoryTD');
	var num = systemLabels.size();
	
//	systemLabels.each(function(index) {
//		var next = systemLabels.eq(index+1);
//		if (index < (num-1) && (jQuery(this).text() == jQuery(next).text())) {
//			jQuery(next).html('&nbsp;');
//			jQuery(next).parent().css({'border-top': 'none'});
//			jQuery(this).parent().css({'border-bottom': 'none'});
//		}
//	});
	
	systemLabels.each(function(index) {
	jQuery(this).html(function(index, oldhtml) {
		    var systemDisplayName = '';
			switch(oldhtml)
			{
			case 'General disorders and administration site conditio&nbsp;':
			  systemDisplayName = 'Const';
			  break;
			case 'General disorders and administration site conditions&nbsp;':
			  systemDisplayName = 'Const';
			  break;
			case 'Metabolism and nutrition disorders&nbsp;':
			  systemDisplayName = 'Const';
			  break;
			case 'Skin and subcutaneous tissue disorders&nbsp;':
			  systemDisplayName = 'Skin';
			  break;
			case 'Gastrointestinal disorders&nbsp;':
			  systemDisplayName = 'GI';
			  break;
			case 'Cardiac disorders&nbsp;':
			  systemDisplayName = 'CV';
			  break;
			case 'Nervous system disorders&nbsp;':
			  systemDisplayName = 'Neuro';
			  break;
			case 'Gastrointestinal&nbsp;':
			  systemDisplayName = 'GI';
			  break;
			case 'Renal and urinary disorders&nbsp;':
			  systemDisplayName = 'GU';
			  break;
			case 'Respiratory, thoracic and mediastinal disorders&nbsp;':
			  systemDisplayName = 'Resp';
			  break;
			  
			  
			  
			  
			  
			  
			case 'Psychiatric&nbsp;':
			  systemDisplayName = 'Psych';
			  break;
			case 'Hematological&nbsp;':
			  systemDisplayName = 'Heme';
			  break;
			case 'Endocrine&nbsp;':
			  systemDisplayName = 'Endo';
			  break;
			default:
			  systemDisplayName = oldhtml;
			}
			
			return systemDisplayName;
		});
	});
	
}
	
	
	
</script>

<style type="text/css">
#ReviewOfSystemsHtmlTable td.controlBoxDataGridHeaderFirstCol
{
	font-size: 11px;
}

#ReviewOfSystemsHtmlTable td.ControlBoxLinedRowsShaded
{
	padding-top: 3px;
	padding-bottom: 3px;
}

#ReviewOfSystemsHtmlTable td.ControlBoxLinedRows
{
	border-right: solid 1px #999999;
	border-bottom: solid 1px #999999;
	padding-top: 3px;
	padding-bottom: 3px;
	white-space: nowrap;
}
#ReviewOfSystemsHtmlTable td.ControlBoxLinedRows input[type="text"]
{
    -webkit-border-radius: 0px;

}

#ReviewOfSystemsHtmlTable td.controlBoxDataGridHeaderFirstCol
{
	border-right: solid 1px #999999;
	border-bottom: solid 1px #999999;
	padding-top: 3px;
	padding-bottom: 3px;
}

.priorToxRow td
{	
	background: #F1F3F4; /* for non-css3 browsers */

	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#E0E4E6', endColorstr='#F1F3F4'); /* for IE */
	background-image: -webkit-gradient(
		linear,
		left top,
		left bottom,
		color-stop(0, #E0E4E6),
		color-stop(1, #F1F3F4)
	);
	background-image: -moz-linear-gradient(
		center top,
		#E0E4E6 0%,
		#F1F3F4 100%
	);

	border-bottom: solid 1px #cccccc;
	border-right: solid 1px #cccccc;
	padding: 2px 2px 2px 4px;
	
}
.priorToxRow:hover td
{	
	background: #EED2D9; /* for non-css3 browsers */

	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#DBA5B2', endColorstr='#EED2D9'); /* for IE */
	background-image: -webkit-gradient(
		linear,
		left top,
		left bottom,
		color-stop(0, #D0C9D1),
		color-stop(0.47, #DBA5B2),
		color-stop(1, #EED2D9)
	);
	background-image: -moz-linear-gradient(
		center top,
		#D0C9D1 0%,
		#DBA5B2 47%,
		#EED2D9 100%
	);


	border-bottom: solid 1px #cccccc;
	border-right: solid 1px #cccccc;
	
	cursor: pointer;
	
}
.CTC_Tooltip_Container
{
    display: none;
}
.CTC_Tooltip
{
    max-width: 440px;
    padding: 2px;
}
.CTC_Tooltip td
{
    vertical-align: top;
    text-align: left;
    padding: 0px 7px 4px 0px
}
.CTC_Tooltip_Grade
{
    min-width: 25px;
    font-weight: bold;
}
#CTCHelpOuterContainer
{
    position: absolute;
    top: 0px;
    background-image: url(../../Images/EFormROSWidgetLeft.png);
    background-position: 0px 10px;
    background-repeat: no-repeat;
    padding-left: 10px;
    display: none;
    max-width: 400px;
    margin-left: 380px;
}
#CTCHelpInnerContainer
{
    background-color: #ffffff;
    border-top: solid 1px #B51033;
    border-right: solid 3px #B51033;
    border-bottom: solid 1px #B51033;
    border-left: solid 3px #B51033;
    min-width: 100px;
    min-height: 100px;
}
.ROSDeleteButton
{
    cursor: pointer;
    vertical-align: middle;
}

#ReviewOfSystemsHtmlTable td.ControlBoxLinedRowsShaded
{
    white-space: nowrap;
}

div.EFormInfoBubbleContent table
{
    width: 93%;
    table-layout: auto;
    border-collapse: collapse;
}
div.EFormInfoBubbleContent td
{
    color: #333333;
    border-left: none;
    border-right: none;
    border-top: solid 1px #E0E0D9;
    border-bottom: solid 1px #E0E0D9;
    white-space: normal;
    word-wrap: break-word;
    vertical-align: top;
    font-size: 11px;
    line-height: normal;
}

ul.ExistingRelatedRecords
{
    list-style-type: none;
    padding: 0px;
    margin: 0px;
}
ul.ExistingRelatedRecords li
{
    display: block;
    margin: 0px 0px 0px 0px;
    padding: 0px 4px 0px 15px;
    border: solid 1px #dddddd;
    background-color: #efefef;
    font-size: 10px;
    background-repeat: no-repeat;
    background-position: left center;
}
.populatedRelatedRecord
{
    display: block;
}

span.SAEInfoIcon
{
    display: inline-block;
    height: 12px;
    width: 12px;
    float: right;
    margin: 2px 2px 0px 2px;
    background-image: url(../../Images/icon_info.png);
    background-repeat: no-repeat;
    cursor: help;
}
span.SAEInfoIconClose
{
    display: inline-block;
    height: 12px;
    width: 12px;
    float: right;
    margin: 2px 2px 0px 2px;
    background-image: url(../../Images/icon_infoClose.png);
    background-repeat: no-repeat;
    cursor: help;
}

</style>

<a name="ReviewOfSystems_GUFU_v2" /><span class="controlBoxTitle">Review of Systems&nbsp;&nbsp;<span style="font-weight: normal;">(CTC/AE 4.0)</span></span>
<span style="font-size: 11px; margin-left: 30px;">
Clinician Performing Review:<euc:EformCheckBoxList RepeatLayout="Flow" CellSpacing="4" RepeatDirection="Horizontal" TABLE="NoTable" FIELD="ROS_Clinician" id="ROS_Clinician"  runat="server" >
			<asp:ListItem Value="RN">RN</asp:ListItem>
		    <asp:ListItem  Value="PA/NP">PA/NP</asp:ListItem>
			<asp:ListItem  Value="Fellow">Fellow</asp:ListItem>
			<asp:ListItem  Value="Attending">Attending</asp:ListItem>
</euc:EformCheckBoxList></span>
<br />
<table width="650" border="0" cellspacing="0" cellpadding="0" style="border: solid 1px #cccccc; border-collapse: collapse;" id="ReviewOfSystemsHtmlTable">
  <asp:Repeater ID="PriorToxicities" runat="server" OnItemDataBound="ShowROSComments"> 
       <HeaderTemplate>
       <tr>
        <td class="controlBoxDataGridHeaderFirstCol">System</td>
        <td class="controlBoxDataGridHeaderFirstCol" style="text-align:left;">Symptom</td>
        <td align="center" valign="bottom" class="controlBoxDataGridHeaderFirstCol" style="border-right: none;">&nbsp;</td>
        <td colspan="5" class="controlBoxDataGridHeaderFirstCol">Grade</td>
        <td class="controlBoxDataGridHeaderFirstCol">Start Date </td>
        <td class="controlBoxDataGridHeaderFirstCol">Stop Date </td>
        <td class="controlBoxDataGridHeaderFirstCol">Attribution</td>
        <!--    <td class="controlBoxDataGridHeaderFirstCol">Disease or Therapy </td> -->    
	    <td class="controlBoxDataGridHeaderFirstCol">Intervention </td>
        <td class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
      </tr>
       </HeaderTemplate>
       <ItemTemplate> 
          <tr class="priorToxRow" onclick="LoadDataEntryForm('Toxicities', <%# DataBinder.Eval(Container.DataItem, "ToxicityId") %>, 'ToxCategory,ToxName,ToxGrade,ToxDateText,ToxDate,ToxStopDateText,ToxStopDate,ToxProbability,ToxIntervention,ToxNotes', 'ReviewOfSystems_GUFU_v2');">
            <td class="ROSPopulatedCategoryTD" ><%# DataBinder.Eval(Container.DataItem, "ToxCategory") %>&nbsp;</td>
            <td style="text-align:left;"><%# DataBinder.Eval(Container.DataItem, "ToxName") %>&nbsp;</td>
            <td  style="border-right: none;">&nbsp;</td>
            <td  colspan="5" style="text-align: center;"><%# DataBinder.Eval(Container.DataItem, "ToxGrade") %>&nbsp;</td>
            <td  ><%# DataBinder.Eval(Container.DataItem, "ToxDateText") %>&nbsp;</td>
            <td  >&nbsp;</td>
            <td  ><%# DataBinder.Eval(Container.DataItem, "ToxProbability")%>	            
                    <asp:Repeater runat="server" ID="RelatedRptr" OnItemDataBound="SetRelatedDisplayLabel">
                        <HeaderTemplate><ul class="ExistingRelatedRecords"></HeaderTemplate>
                        <ItemTemplate>
                            <li class="RelatedRecordStrength<%# DataBinder.Eval(Container.DataItem, "RelationStrength")%>">
                                <asp:Label runat="server" ID="DisplayLabel"></asp:Label>
                            </li>
                        </ItemTemplate>
                        <FooterTemplate></ul></FooterTemplate>
                    </asp:Repeater><euc:EformRelatedRecordWidget ID="RelatedRecordWidget" runat="server" RelatedTable="Toxicities" RelatedTablePriKey='<%# Eval("ToxicityId") %>' RelatableTables="MedicalTherapy,RadiationTherapy,BrachyTherapy,Procedures,Comorbidities,Allergies" DefaultTable="MedicalTherapy" DefaultTitle="Add/Edit" Text="Add/Edit" CssClass="eFormRelatedRecordWidget populatedRelatedRecord"></euc:EformRelatedRecordWidget>                </td>
	        <td  ><%# DataBinder.Eval(Container.DataItem, "ToxIntervention")%>&nbsp;	        </td>
            <td style="border-bottom: solid 1px;border-right: solid 1px #cccccc;">&nbsp;</td>
          </tr>
		  <tr id="priorToxCommentsRow" runat="server" Visible="false"  >
            <td style="border-bottom: solid 1px;">&nbsp;</td>
            <td style="text-align:left;border-bottom: solid 1px;">&nbsp;</td>
            <td  colspan="10" style="border-right: none; padding-left: 6px;border-bottom: solid 1px;"><strong>Comments:</strong>&nbsp;<%# DataBinder.Eval(Container.DataItem, "ToxNotes")%></td>
            <td style="border-bottom: solid 1px;border-right: solid 1px #cccccc;">&nbsp;</td>
          </tr>
       </ItemTemplate>
  </asp:Repeater>
  <tr>
    <td class="controlBoxDataGridHeaderFirstCol">System</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align:left;">Symptom</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="border-right: none;" >&nbsp;</td>
    <td class="controlBoxDataGridHeaderFirstCol"><img src="../../Images/EFormCheckAll.gif" width="28" height="11" class="ClickableImage" onclick="checkAllWidgetsInColumn('ReviewOfSystemsHtmlTable', 2, 12);setAllROSNotes();" style="margin-bottom:3px;" /><br/>0</td>
    <td class="controlBoxDataGridHeaderFirstCol"><img src="../../Images/EFormCheckAll.gif" width="28" height="11" class="ClickableImage" onclick="checkAllWidgetsInColumn('ReviewOfSystemsHtmlTable', 3, 12);setAllROSNotes();" style="margin-bottom:3px;" /><br/>1</td>
    <td class="controlBoxDataGridHeaderFirstCol"><img src="../../Images/EFormCheckAll.gif" width="28" height="11" class="ClickableImage" onclick="checkAllWidgetsInColumn('ReviewOfSystemsHtmlTable', 4, 12);setAllROSNotes();" style="margin-bottom:3px;" /><br/>2</td>
    <td class="controlBoxDataGridHeaderFirstCol"><img src="../../Images/EFormCheckAll.gif" width="28" height="11" class="ClickableImage" onclick="checkAllWidgetsInColumn('ReviewOfSystemsHtmlTable', 5, 12);setAllROSNotes();" style="margin-bottom:3px;" /><br/>3</td>
    <td class="controlBoxDataGridHeaderFirstCol"><img src="../../Images/EFormCheckAll.gif" width="28" height="11" class="ClickableImage" onclick="checkAllWidgetsInColumn('ReviewOfSystemsHtmlTable', 6, 12);setAllROSNotes();" style="margin-bottom:3px;" /><br/>4</td>
    <td class="controlBoxDataGridHeaderFirstCol">Start Date </td>
    <td class="controlBoxDataGridHeaderFirstCol">Stop Date </td>
    <td class="controlBoxDataGridHeaderFirstCol">Attribution</td>
    <!--    <td class="controlBoxDataGridHeaderFirstCol">Disease or Therapy </td> -->    
	<td class="controlBoxDataGridHeaderFirstCol">Intervention </td>
    <td class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
  </tr>
  <tr>
    <td valign="top" class="ControlBoxLinedRowsShaded" style="border-bottom: none; border-top: solid 1px;">Const</td>
    <td valign="top" class="ControlBoxLinedRowsShaded"><span class="SAEInfoIcon">&nbsp;</span>Fatigue</td>
            <td class="FormInsideTableRegCell" align="center" style="border-right: none; font-size: 10px; font-weight: bold;">              <asp:Label ID="BaselineGrade_Fatigue" runat="server">&nbsp;</asp:Label>            </td>
    <td class="ControlBoxLinedRows" align="center">

		<euc:EformRadioButtonGroup Table="Toxicities" Field="ToxGrade" id="ToxGrade_Fatigue" RecordId="1" GroupName="Fatigue" runat="server"
			Field1="ToxCategory" Value1="General disorders and administration site conditions"
			Field2="ToxName" Value2="Fatigue" Field3="ToxScale" Value3="CTC/AE 4.0">
			<euc:EformRadioButton Id="Fatigue0" Value="0" runat="server" ExpandClickableArea="False"/>			</td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="Fatigue1" Value="1" runat="server" ExpandClickableArea="False"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="Fatigue2" Value="2" runat="server" ExpandClickableArea="False"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="Fatigue3" Value="3" runat="server" ExpandClickableArea="False"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="Fatigue4" Value="4" runat="server" ExpandClickableArea="False"/></euc:EformRadioButtonGroup></td>
    <td class="ControlBoxLinedRows"><euc:EformHidden RecordId="1"  TABLE="Toxicities" FIELD="ToxDate" Runat="server" ID="ToxDate_Fatigue"/>
        <euc:EformTextBox RecordId="1" ShowCalendar="True" CalcDate="True" style="width:70px;" TABLE="Toxicities" FIELD="ToxDateText" Runat="server" ID="ToxDateText_Fatigue"/>    </td>
    <td class="ControlBoxLinedRows"><euc:EformHidden RecordId="1"  TABLE="Toxicities" FIELD="ToxStopDate" Runat="server" ID="ToxStopDate_Fatigue"/>
        <euc:EformTextBox RecordId="1" ShowCalendar="True" CalcDate="True" style="width:70px;" TABLE="Toxicities" FIELD="ToxStopDateText" Runat="server" ID="ToxStopDateText_Fatigue"/>    </td>
    <td class="ControlBoxLinedRows"><euc:EformTextBox RecordId="1" LookupCode="ToxProbability" DropDownWidth="280" TABLE="Toxicities" FIELD="ToxProbability" Runat="server" ID="ToxProbability_Fatigue" style="width: 52px;"/><euc:EformRelatedRecordWidget runat="server" RelatedTable="Toxicities" RelatedTableRecordId="1" RelatedFieldId="ToxProbability_Fatigue" RelatableTables="MedicalTherapy,RadiationTherapy,BrachyTherapy,Procedures,Comorbidities,Allergies" DefaultTable="MedicalTherapy" DefaultTitle="Fatigue" ></euc:EformRelatedRecordWidget>    </td>
    <!--    <td class="ControlBoxLinedRows"><euc:EformSelect RecordId="1" LookupCode="RelatedTo" TABLE="Toxicities" FIELD="ToxRelatedTo" Runat="server" ID="ToxRelatedTo_Fatigue" style="width: 62px;"/></td>
-->    <td class="ControlBoxLinedRows"><euc:EformComboBox RecordId="1" LookupCode="ToxIntervention" RefBy="ToxIntervention" TABLE="Toxicities" FIELD="ToxIntervention" Runat="server" ID="ToxIntervention_Fatigue" style="width: 70px;"/></td>
    <td class="ControlBoxLinedRows" align="center"><img onclick="clearROSRow(this);" src="../../Images/EFormDeleteRow.gif" class="ROSDeleteButton"  /></td>
  </tr>
  <tr id="ToxNotesRow_1" style="display: none;">
    <td valign="top" class="ControlBoxLinedRowsShaded" style="border-bottom: none;">&nbsp;</td>
    <td valign="top" class="ControlBoxLinedRowsShaded">&nbsp;</td>
    <td colspan="10"  class="FormInsideTableRegCell" style="border-right: none; font-size: 12px; font-weight: bold; padding: 4px 4px 4px 6px;">Comments: <euc:EformTextBox RecordId="1" ShowCalendar="False" CalcDate="False" style="width:405px;" TABLE="Toxicities" FIELD="ToxNotes" ShowTextEditor="true" Runat="server" ID="ToxNotes_Fatigue"/></td>
    <td class="ControlBoxLinedRows" align="center">&nbsp;</td>
  </tr>
  <tr>
    <td valign="top" class="ControlBoxLinedRowsShaded" style="border-bottom: none;">&nbsp;</td>
    <td valign="top" class="ControlBoxLinedRowsShaded"><span class="SAEInfoIcon">&nbsp;</span>Fever</td>
            <td class="FormInsideTableRegCell" align="center" style="border-right: none; font-size: 10px; font-weight: bold;">              <asp:Label ID="BaselineGrade_Fever" runat="server">&nbsp;</asp:Label>            </td>
            
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButtonGroup Table="Toxicities" Field="ToxGrade" id="ToxGrade_Fever" RecordId="2" GroupName="Fever" runat="server"
			Field1="ToxCategory" Value1="General disorders and administration site conditions"
			Field2="ToxName" Value2="Fever"  Field3="ToxScale" Value3="CTC/AE 4.0">
        <euc:EformRadioButton Id="Fever0" Value="0" runat="server" ExpandClickableArea="False"/>    </td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="Fever1" Value="1" runat="server" ExpandClickableArea="False"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="Fever2" Value="2" runat="server" ExpandClickableArea="False"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="Fever3" Value="3" runat="server" ExpandClickableArea="False"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="Fever4" Value="4" runat="server" ExpandClickableArea="False"/>
        </euc:EformRadioButtonGroup></td>
    <td class="ControlBoxLinedRows"><euc:EformHidden RecordId="2"  TABLE="Toxicities" FIELD="ToxDate" Runat="server" ID="ToxDate_Fever"/>
        <euc:EformTextBox RecordId="2" ShowCalendar="True" CalcDate="True" style="width:70px;" TABLE="Toxicities" FIELD="ToxDateText" Runat="server" ID="ToxDateText_Fever"/>    </td>
    <td class="ControlBoxLinedRows"><euc:EformHidden RecordId="2"  TABLE="Toxicities" FIELD="ToxStopDate" Runat="server" ID="ToxStopDate_Fever"/>
        <euc:EformTextBox RecordId="2" ShowCalendar="True" CalcDate="True" style="width:70px;" TABLE="Toxicities" FIELD="ToxStopDateText" Runat="server" ID="ToxStopDateText_Fever"/>    </td>
    <td class="ControlBoxLinedRows"><euc:EformTextBox RecordId="2" LookupCode="ToxProbability" DropDownWidth="280" TABLE="Toxicities" FIELD="ToxProbability" Runat="server" ID="ToxProbability_Fever" style="width: 52px;"/><euc:EformRelatedRecordWidget runat="server" RelatedTable="Toxicities" RelatedTableRecordId="2" RelatedFieldId="ToxProbability_Fever" RelatableTables="MedicalTherapy,RadiationTherapy,BrachyTherapy,Procedures,Comorbidities,Allergies" DefaultTable="MedicalTherapy" DefaultTitle="Fever"></euc:EformRelatedRecordWidget></td>
    <!--    <td class="ControlBoxLinedRows"><euc:EformSelect RecordId="2" LookupCode="RelatedTo" TABLE="Toxicities" FIELD="ToxRelatedTo" Runat="server" ID="ToxRelatedTo_Fever" style="width: 62px;"/></td>
-->    <td class="ControlBoxLinedRows"><euc:EformComboBox RecordId="2" LookupCode="ToxIntervention" RefBy="ToxIntervention" TABLE="Toxicities" FIELD="ToxIntervention" Runat="server" ID="ToxIntervention_Fever" style="width: 70px;"/></td>
    <td class="ControlBoxLinedRows" align="center"><img onclick="clearROSRow(this);" src="../../Images/EFormDeleteRow.gif" class="ROSDeleteButton"  /></td>
  </tr>
  <tr id="ToxNotesRow_2" style="display: none;">
    <td valign="top" class="ControlBoxLinedRowsShaded" style="border-bottom: none;">&nbsp;</td>
    <td valign="top" class="ControlBoxLinedRowsShaded">&nbsp;</td>
    <td colspan="10"  class="FormInsideTableRegCell" style="border-right: none; font-size: 12px; font-weight: bold; padding: 4px 4px 4px 6px;">Comments: <euc:EformTextBox RecordId="2" ShowCalendar="False" CalcDate="False" style="width:405px;" TABLE="Toxicities" FIELD="ToxNotes" ShowTextEditor="true" Runat="server" ID="ToxNotes_Fever"/></td>
    <td class="ControlBoxLinedRows" align="center">&nbsp;</td>
  </tr>
  <tr>
    <td valign="top" class="ControlBoxLinedRowsShaded" style="border-bottom: none;">&nbsp;</td>
    <td valign="top" class="ControlBoxLinedRowsShaded"><span class="SAEInfoIcon">&nbsp;</span>Anorexia</td>
    <td class="FormInsideTableRegCell" align="center" style="border-right: none; font-size: 10px; font-weight: bold;">              <asp:Label ID="BaselineGrade_Anorexia" runat="server">&nbsp;</asp:Label>            </td>
            <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButtonGroup Table="Toxicities" Field="ToxGrade" id="ToxGrade_Anorexia" RecordId="3" GroupName="Anorexia" runat="server"
			Field1="ToxCategory" Value1="Metabolism and nutrition disorders"
			Field2="ToxName" Value2="Anorexia" Field3="ToxScale" Value3="CTC/AE 4.0">
        <euc:EformRadioButton Id="Anorexia0" Value="0" runat="server" ExpandClickableArea="False"/>    </td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="Anorexia1" Value="1" runat="server" ExpandClickableArea="False"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="Anorexia2" Value="2" runat="server" ExpandClickableArea="False"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="Anorexia3" Value="3" runat="server" ExpandClickableArea="False"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="Anorexia4" Value="4" runat="server" ExpandClickableArea="False"/>
        </euc:EformRadioButtonGroup></td>
    <td class="ControlBoxLinedRows"><euc:EformHidden RecordId="3"  TABLE="Toxicities" FIELD="ToxDate" Runat="server" ID="ToxDate_Anorexia"/>
        <euc:EformTextBox RecordId="3" ShowCalendar="True" CalcDate="True" style="width:70px;" TABLE="Toxicities" FIELD="ToxDateText" Runat="server" ID="ToxDateText_Anorexia"/>    </td>
    <td class="ControlBoxLinedRows"><euc:EformHidden RecordId="3"  TABLE="Toxicities" FIELD="ToxStopDate" Runat="server" ID="ToxStopDate_Anorexia"/>
        <euc:EformTextBox RecordId="3" ShowCalendar="True" CalcDate="True" style="width:70px;" TABLE="Toxicities" FIELD="ToxStopDateText" Runat="server" ID="ToxStopDateText_Anorexia"/>    </td>
    <td class="ControlBoxLinedRows"><euc:EformTextBox RecordId="3" LookupCode="ToxProbability" DropDownWidth="280" TABLE="Toxicities" FIELD="ToxProbability" Runat="server" ID="ToxProbability_Anorexia" style="width: 52px;"/><euc:EformRelatedRecordWidget runat="server" RelatedTable="Toxicities" RelatedTableRecordId="3" RelatedFieldId="ToxProbability_Anorexia" RelatableTables="MedicalTherapy,RadiationTherapy,BrachyTherapy,Procedures,Comorbidities,Allergies" DefaultTable="MedicalTherapy" DefaultTitle="Anorexia"></euc:EformRelatedRecordWidget></td>
    <!--    <td class="ControlBoxLinedRows"><euc:EformSelect RecordId="3" LookupCode="RelatedTo" TABLE="Toxicities" FIELD="ToxRelatedTo" Runat="server" ID="ToxRelatedTo_Anorexia" style="width: 62px;"/></td>
-->    <td class="ControlBoxLinedRows"><euc:EformComboBox RecordId="3" LookupCode="ToxIntervention" RefBy="ToxIntervention" TABLE="Toxicities" FIELD="ToxIntervention" Runat="server" ID="ToxIntervention_Anorexia" style="width: 70px;"/></td>
    <td class="ControlBoxLinedRows" align="center"><img onclick="clearROSRow(this);" src="../../Images/EFormDeleteRow.gif" class="ROSDeleteButton"  /></td>
  </tr>
  <tr id="ToxNotesRow_3" style="display: none;">
    <td valign="top" class="ControlBoxLinedRowsShaded" style="border-bottom: none;">&nbsp;</td>
    <td valign="top" class="ControlBoxLinedRowsShaded">&nbsp;</td>
    <td colspan="10"  class="FormInsideTableRegCell" style="border-right: none; font-size: 12px; font-weight: bold; padding: 4px 4px 4px 6px;">Comments: <euc:EformTextBox RecordId="3" ShowCalendar="False" CalcDate="False" style="width:405px;" TABLE="Toxicities" FIELD="ToxNotes" ShowTextEditor="true" Runat="server" ID="ToxNotes_Anorexia"/></td>
    <td class="ControlBoxLinedRows" align="center">&nbsp;</td>
  </tr>
  <tr>
    <td valign="top" class="ControlBoxLinedRowsShaded" style="border-bottom: none; border-top: solid 1px;" >Skin</td>
    <td valign="top" class="ControlBoxLinedRowsShaded"><span class="SAEInfoIcon">&nbsp;</span>Rash</td>
    <td class="ControlBoxLinedRows" style="border-right: none; font-size: 10px; font-weight: bold;" ><asp:Label ID="BaselineGrade_Rash" runat="server">&nbsp;</asp:Label></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButtonGroup Table="Toxicities" Field="ToxGrade" id="ToxGrade_Rash" RecordId="4" GroupName="Rash" runat="server"
			Field1="ToxCategory" Value1="Skin and subcutaneous tissue disorders"
			Field2="ToxName" Value2="Rash acneiform" Field3="ToxScale" Value3="CTC/AE 4.0">
        <euc:EformRadioButton Id="Rashacneiform0" Value="0" runat="server" ExpandClickableArea="False"/>    </td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="Rashacneiform1" Value="1" runat="server" ExpandClickableArea="False"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="Rashacneiform2" Value="2" runat="server" ExpandClickableArea="False"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="Rashacneiform3" Value="3" runat="server" ExpandClickableArea="False"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="Rashacneiform4" Value="4" runat="server" ExpandClickableArea="False"/>
        </euc:EformRadioButtonGroup></td>
    <td class="ControlBoxLinedRows"><euc:EformHidden RecordId="4"  TABLE="Toxicities" FIELD="ToxDate" Runat="server" ID="ToxDate_Rash"/>
        <euc:EformTextBox RecordId="4" ShowCalendar="True" CalcDate="True" style="width:70px;" TABLE="Toxicities" FIELD="ToxDateText" Runat="server" ID="ToxDateText_Rash"/>    </td>
    <td class="ControlBoxLinedRows"><euc:EformHidden RecordId="4"  TABLE="Toxicities" FIELD="ToxStopDate" Runat="server" ID="ToxStopDate_Rash"/>
        <euc:EformTextBox RecordId="4" ShowCalendar="True" CalcDate="True" style="width:70px;" TABLE="Toxicities" FIELD="ToxStopDateText" Runat="server" ID="ToxStopDateText_Rash"/>    </td>
    <td class="ControlBoxLinedRows"><euc:EformTextBox RecordId="4" LookupCode="ToxProbability" DropDownWidth="280" TABLE="Toxicities" FIELD="ToxProbability" Runat="server" ID="ToxProbability_Rash" style="width: 52px;"/><euc:EformRelatedRecordWidget runat="server" RelatedTable="Toxicities" RelatedTableRecordId="4" RelatedFieldId="ToxProbability_Rash" RelatableTables="MedicalTherapy,RadiationTherapy,BrachyTherapy,Procedures,Comorbidities,Allergies" DefaultTable="MedicalTherapy" DefaultTitle="Rash"></euc:EformRelatedRecordWidget></td>
    <!--    <td class="ControlBoxLinedRows"><euc:EformSelect RecordId="4" LookupCode="RelatedTo" TABLE="Toxicities" FIELD="ToxRelatedTo" Runat="server" ID="ToxRelatedTo_Rash" style="width: 62px;"/></td>
-->    <td class="ControlBoxLinedRows"><euc:EformComboBox RecordId="4" LookupCode="ToxIntervention" RefBy="ToxIntervention" TABLE="Toxicities" FIELD="ToxIntervention" Runat="server" ID="ToxIntervention_Rash" style="width: 70px;"/></td>
    <td class="ControlBoxLinedRows" align="center"><img onclick="clearROSRow(this);" src="../../Images/EFormDeleteRow.gif" class="ROSDeleteButton"  /></td>
  </tr>
  <tr id="ToxNotesRow_4" style="display: none;">
    <td valign="top" class="ControlBoxLinedRowsShaded" style="border-bottom: none;">&nbsp;</td>
    <td valign="top" class="ControlBoxLinedRowsShaded">&nbsp;</td>
    <td colspan="10"  class="FormInsideTableRegCell" style="border-right: none; font-size: 12px; font-weight: bold; padding: 4px 4px 4px 6px;">Comments: <euc:EformTextBox RecordId="4" ShowCalendar="False" CalcDate="False" style="width:405px;" TABLE="Toxicities" FIELD="ToxNotes" ShowTextEditor="true" Runat="server" ID="ToxNotes_Rash"/></td>
    <td class="ControlBoxLinedRows" align="center">&nbsp;</td>
  </tr>
  <tr>
    <td valign="top" class="ControlBoxLinedRowsShaded" style="border-bottom: none; border-top: solid 1px;" >ENMT</td>
    <td valign="top" class="ControlBoxLinedRowsShaded"><span class="SAEInfoIcon">&nbsp;</span>Oral Mucositis</td>
    <td class="ControlBoxLinedRows" style="border-right: none; font-size: 10px; font-weight: bold;" ><asp:Label ID="BaselineGrade_OralMucositis" runat="server">&nbsp;</asp:Label></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButtonGroup Table="Toxicities" Field="ToxGrade" id="ToxGrade_Mucositis" RecordId="5" GroupName="Mucositis" runat="server"
			Field1="ToxCategory" Value1="Gastrointestinal disorders"
			Field2="ToxName" Value2="Mucositis oral" Field3="ToxScale" Value3="CTC/AE 4.0">
        <euc:EformRadioButton Id="Mucositisoral0" Value="0" runat="server" ExpandClickableArea="False"/>    </td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="Mucositisoral1" Value="1" runat="server" ExpandClickableArea="False"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="Mucositisoral2" Value="2" runat="server" ExpandClickableArea="False"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="Mucositisoral3" Value="3" runat="server" ExpandClickableArea="False"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="Mucositisoral4" Value="4" runat="server" ExpandClickableArea="False"/>
        </euc:EformRadioButtonGroup></td>
    <td class="ControlBoxLinedRows"><euc:EformHidden RecordId="5"  TABLE="Toxicities" FIELD="ToxDate" Runat="server" ID="ToxDate_Mucositis"/>
        <euc:EformTextBox RecordId="5" ShowCalendar="True" CalcDate="True" style="width:70px;" TABLE="Toxicities" FIELD="ToxDateText" Runat="server" ID="ToxDateText_Mucositis"/>    </td>
    <td class="ControlBoxLinedRows"><euc:EformHidden RecordId="5"  TABLE="Toxicities" FIELD="ToxStopDate" Runat="server" ID="ToxStopDate_Mucositis"/>
        <euc:EformTextBox RecordId="5" ShowCalendar="True" CalcDate="True" style="width:70px;" TABLE="Toxicities" FIELD="ToxStopDateText" Runat="server" ID="ToxStopDateText_Mucositis"/>    </td>
    <td class="ControlBoxLinedRows"><euc:EformTextBox RecordId="5" LookupCode="ToxProbability" DropDownWidth="280" TABLE="Toxicities" FIELD="ToxProbability" Runat="server" ID="ToxProbability_Mucositis" style="width: 52px;"/><euc:EformRelatedRecordWidget runat="server" RelatedTable="Toxicities" RelatedTableRecordId="5" RelatedFieldId="ToxProbability_Mucositis" RelatableTables="MedicalTherapy,RadiationTherapy,BrachyTherapy,Procedures,Comorbidities,Allergies" DefaultTable="MedicalTherapy" DefaultTitle="Mucositis"></euc:EformRelatedRecordWidget></td>
    <!--    <td class="ControlBoxLinedRows"><euc:EformSelect RecordId="5" LookupCode="RelatedTo" TABLE="Toxicities" FIELD="ToxRelatedTo" Runat="server" ID="ToxRelatedTo_Mucositis" style="width: 62px;"/></td>
-->    <td class="ControlBoxLinedRows"><euc:EformComboBox RecordId="5" LookupCode="ToxIntervention" RefBy="ToxIntervention" TABLE="Toxicities" FIELD="ToxIntervention" Runat="server" ID="ToxIntervention_Mucositis" style="width: 70px;"/></td>
    <td class="ControlBoxLinedRows" align="center"><img onclick="clearROSRow(this);" src="../../Images/EFormDeleteRow.gif" class="ROSDeleteButton"  /></td>
  </tr>
  <tr id="ToxNotesRow_5" style="display: none;">
    <td valign="top" class="ControlBoxLinedRowsShaded" style="border-bottom: none;">&nbsp;</td>
    <td valign="top" class="ControlBoxLinedRowsShaded">&nbsp;</td>
    <td colspan="10"  class="FormInsideTableRegCell" style="border-right: none; font-size: 12px; font-weight: bold; padding: 4px 4px 4px 6px;">Comments: <euc:EformTextBox RecordId="5" ShowCalendar="False" CalcDate="False" style="width:405px;" TABLE="Toxicities" FIELD="ToxNotes" ShowTextEditor="true" Runat="server" ID="ToxNotes_Mucositis"/></td>
    <td class="ControlBoxLinedRows" align="center">&nbsp;</td>
  </tr>
  <tr>
    <td valign="top" class="ControlBoxLinedRowsShaded" style="border-bottom: none; border-top: solid 1px;">Resp</td>
    <td valign="top" class="ControlBoxLinedRowsShaded"><span class="SAEInfoIcon">&nbsp;</span>Dyspnea</td>
    <td class="ControlBoxLinedRows" style="border-right: none; font-size: 10px; font-weight: bold;" ><asp:Label ID="BaselineGrade_Dyspnea" runat="server">&nbsp;</asp:Label></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButtonGroup Table="Toxicities" Field="ToxGrade" id="ToxGrade_Dyspnea" RecordId="6" GroupName="Dyspnea" runat="server"
			Field1="ToxCategory" Value1="Respiratory, thoracic and mediastinal disorders"
			Field2="ToxName" Value2="Dyspnea" Field3="ToxScale" Value3="CTC/AE 4.0">
        <euc:EformRadioButton Id="Dyspnea0" Value="0" runat="server" ExpandClickableArea="False"/>    </td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="Dyspnea1" Value="1" runat="server" ExpandClickableArea="False"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="Dyspnea2" Value="2" runat="server" ExpandClickableArea="False"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="Dyspnea3" Value="3" runat="server" ExpandClickableArea="False"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="Dyspnea4" Value="4" runat="server" ExpandClickableArea="False"/>
        </euc:EformRadioButtonGroup></td>
    <td class="ControlBoxLinedRows"><euc:EformHidden RecordId="6"  TABLE="Toxicities" FIELD="ToxDate" Runat="server" ID="ToxDate_Dyspnea"/>
        <euc:EformTextBox RecordId="6" ShowCalendar="True" CalcDate="True" style="width:70px;" TABLE="Toxicities" FIELD="ToxDateText" Runat="server" ID="ToxDateText_Dyspnea"/>    </td>
    <td class="ControlBoxLinedRows"><euc:EformHidden RecordId="6"  TABLE="Toxicities" FIELD="ToxStopDate" Runat="server" ID="ToxStopDate_Dyspnea"/>
        <euc:EformTextBox RecordId="6" ShowCalendar="True" CalcDate="True" style="width:70px;" TABLE="Toxicities" FIELD="ToxStopDateText" Runat="server" ID="ToxStopDateText_Dyspnea"/>    </td>
    <td class="ControlBoxLinedRows"><euc:EformTextBox RecordId="6" LookupCode="ToxProbability" DropDownWidth="280" TABLE="Toxicities" FIELD="ToxProbability" Runat="server" ID="ToxProbability_Dyspnea" style="width: 52px;"/><euc:EformRelatedRecordWidget runat="server" RelatedTable="Toxicities" RelatedTableRecordId="6" RelatedFieldId="ToxProbability_Dyspnea" RelatableTables="MedicalTherapy,RadiationTherapy,BrachyTherapy,Procedures,Comorbidities,Allergies" DefaultTable="MedicalTherapy" DefaultTitle="Dyspnea"></euc:EformRelatedRecordWidget></td>
    <!--    <td class="ControlBoxLinedRows"><euc:EformSelect RecordId="6" LookupCode="RelatedTo" TABLE="Toxicities" FIELD="ToxRelatedTo" Runat="server" ID="ToxRelatedTo_Dyspnea" style="width: 62px;"/></td>
-->    <td class="ControlBoxLinedRows"><euc:EformComboBox RecordId="6" LookupCode="ToxIntervention" RefBy="ToxIntervention" TABLE="Toxicities" FIELD="ToxIntervention" Runat="server" ID="ToxIntervention_Dyspnea" style="width: 70px;"/></td>
    <td class="ControlBoxLinedRows" align="center"><img onclick="clearROSRow(this);" src="../../Images/EFormDeleteRow.gif" class="ROSDeleteButton"  /></td>
  </tr>
  <tr id="ToxNotesRow_6" style="display: none;">
    <td valign="top" class="ControlBoxLinedRowsShaded" style="border-bottom: none;">&nbsp;</td>
    <td valign="top" class="ControlBoxLinedRowsShaded">&nbsp;</td>
    <td colspan="10"  class="FormInsideTableRegCell" style="border-right: none; font-size: 12px; font-weight: bold; padding: 4px 4px 4px 6px;">Comments: <euc:EformTextBox RecordId="6" ShowCalendar="False" CalcDate="False" style="width:405px;" TABLE="Toxicities" FIELD="ToxNotes" ShowTextEditor="true" Runat="server" ID="ToxNotes_Dyspnea"/></td>
    <td class="ControlBoxLinedRows" align="center">&nbsp;</td>
  </tr>
  <tr>
    <td valign="top" class="ControlBoxLinedRowsShaded" style="border-bottom: none; border-top: solid 1px;">CV</td>
    <td valign="top" class="ControlBoxLinedRowsShaded"><span class="SAEInfoIcon">&nbsp;</span>Edema</td>
    <td class="ControlBoxLinedRows" style="border-right: none; font-size: 10px; font-weight: bold;" ><asp:Label ID="BaselineGrade_Edema" runat="server">&nbsp;</asp:Label></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButtonGroup Table="Toxicities" Field="ToxGrade" id="ToxGrade_Edema" RecordId="7" GroupName="Edema" runat="server"
			Field1="ToxCategory" Value1="General disorders and administration site conditions"
			Field2="ToxName" Value2="Edema limbs" Field3="ToxScale" Value3="CTC/AE 4.0">
        <euc:EformRadioButton Id="Edemalimbs0" Value="0" runat="server" ExpandClickableArea="False"/>    </td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="Edemalimbs1" Value="1" runat="server" ExpandClickableArea="False"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="Edemalimbs2" Value="2" runat="server" ExpandClickableArea="False"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="Edemalimbs3" Value="3" runat="server" ExpandClickableArea="False"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="Edemalimbs4" Value="4" runat="server" ExpandClickableArea="False"/>
        </euc:EformRadioButtonGroup></td>
    <td class="ControlBoxLinedRows"><euc:EformHidden RecordId="7"  TABLE="Toxicities" FIELD="ToxDate" Runat="server" ID="ToxDate_Edema"/>
        <euc:EformTextBox RecordId="7" ShowCalendar="True" CalcDate="True" style="width:70px;" TABLE="Toxicities" FIELD="ToxDateText" Runat="server" ID="ToxDateText_Edema"/>    </td>
    <td class="ControlBoxLinedRows"><euc:EformHidden RecordId="7"  TABLE="Toxicities" FIELD="ToxStopDate" Runat="server" ID="ToxStopDate_Edema"/>
        <euc:EformTextBox RecordId="7" ShowCalendar="True" CalcDate="True" style="width:70px;" TABLE="Toxicities" FIELD="ToxStopDateText" Runat="server" ID="ToxStopDateText_Edema"/>    </td>
    <td class="ControlBoxLinedRows"><euc:EformTextBox RecordId="7" LookupCode="ToxProbability" DropDownWidth="280" TABLE="Toxicities" FIELD="ToxProbability" Runat="server" ID="ToxProbability_Edema" style="width: 52px;"/><euc:EformRelatedRecordWidget runat="server" RelatedTable="Toxicities" RelatedTableRecordId="7" RelatedFieldId="ToxProbability_Edema" RelatableTables="MedicalTherapy,RadiationTherapy,BrachyTherapy,Procedures,Comorbidities,Allergies" DefaultTable="MedicalTherapy" DefaultTitle="Edema"></euc:EformRelatedRecordWidget></td>
    <!--    <td class="ControlBoxLinedRows"><euc:EformSelect RecordId="7" LookupCode="RelatedTo" TABLE="Toxicities" FIELD="ToxRelatedTo" Runat="server" ID="ToxRelatedTo_Edema" style="width: 62px;"/></td>
-->    <td class="ControlBoxLinedRows"><euc:EformComboBox RecordId="7" LookupCode="ToxIntervention" RefBy="ToxIntervention" TABLE="Toxicities" FIELD="ToxIntervention" Runat="server" ID="ToxIntervention_Edema" style="width: 70px;"/></td>
    <td class="ControlBoxLinedRows" align="center"><img onclick="clearROSRow(this);" src="../../Images/EFormDeleteRow.gif" class="ROSDeleteButton"  /></td>
  </tr>
  <tr id="ToxNotesRow_7" style="display: none;">
    <td valign="top" class="ControlBoxLinedRowsShaded" style="border-bottom: none;">&nbsp;</td>
    <td valign="top" class="ControlBoxLinedRowsShaded">&nbsp;</td>
    <td colspan="10"  class="FormInsideTableRegCell" style="border-right: none; font-size: 12px; font-weight: bold; padding: 4px 4px 4px 6px;">Comments: <euc:EformTextBox RecordId="7" ShowCalendar="False" CalcDate="False" style="width:405px;" TABLE="Toxicities" FIELD="ToxNotes" ShowTextEditor="true" Runat="server" ID="ToxNotes_Edema"/></td>
    <td class="ControlBoxLinedRows" align="center">&nbsp;</td>
  </tr>
  <tr>
    <td valign="top" class="ControlBoxLinedRowsShaded" style="border-bottom: none;">&nbsp;</td>
    <td valign="top" class="ControlBoxLinedRowsShaded"><span class="SAEInfoIcon">&nbsp;</span>Chest Pain </td>
    <td class="ControlBoxLinedRows" style="border-right: none; font-size: 10px; font-weight: bold;" ><asp:Label ID="BaselineGrade_ChestPain" runat="server">&nbsp;</asp:Label></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButtonGroup Table="Toxicities" Field="ToxGrade" id="ToxGrade_ChestPain" RecordId="8" GroupName="ChestPain" runat="server"
			Field1="ToxCategory" Value1="Cardiac disorders"
			Field2="ToxName" Value2="Chest pain - cardiac" Field3="ToxScale" Value3="CTC/AE 4.0">
        <euc:EformRadioButton Id="Chestpaincardiac0" Value="0" runat="server" ExpandClickableArea="False"/>    </td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="Chestpaincardiac1" Value="1" runat="server" ExpandClickableArea="False"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="Chestpaincardiac2" Value="2" runat="server" ExpandClickableArea="False"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="Chestpaincardiac3" Value="3" runat="server" ExpandClickableArea="False"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="Chestpaincardiac4" Value="4" runat="server" ExpandClickableArea="False"/>
        </euc:EformRadioButtonGroup></td>
    <td class="ControlBoxLinedRows"><euc:EformHidden RecordId="8"  TABLE="Toxicities" FIELD="ToxDate" Runat="server" ID="ToxDate_ChestPain"/>
        <euc:EformTextBox RecordId="8" ShowCalendar="True" CalcDate="True" style="width:70px;" TABLE="Toxicities" FIELD="ToxDateText" Runat="server" ID="ToxDateText_ChestPain"/>    </td>
    <td class="ControlBoxLinedRows"><euc:EformHidden RecordId="8"  TABLE="Toxicities" FIELD="ToxStopDate" Runat="server" ID="ToxStopDate_ChestPain"/>
        <euc:EformTextBox RecordId="8" ShowCalendar="True" CalcDate="True" style="width:70px;" TABLE="Toxicities" FIELD="ToxStopDateText" Runat="server" ID="ToxStopDateText_ChestPain"/>    </td>
    <td class="ControlBoxLinedRows"><euc:EformTextBox RecordId="8" LookupCode="ToxProbability" DropDownWidth="280" TABLE="Toxicities" FIELD="ToxProbability" Runat="server" ID="ToxProbability_ChestPain" style="width: 52px;"/><euc:EformRelatedRecordWidget runat="server" RelatedTable="Toxicities" RelatedTableRecordId="8" RelatedFieldId="ToxProbability_ChestPain" RelatableTables="MedicalTherapy,RadiationTherapy,BrachyTherapy,Procedures,Comorbidities,Allergies" DefaultTable="MedicalTherapy" DefaultTitle="Chest Pain"></euc:EformRelatedRecordWidget></td>
    <!--    <td class="ControlBoxLinedRows"><euc:EformSelect RecordId="8" LookupCode="RelatedTo" TABLE="Toxicities" FIELD="ToxRelatedTo" Runat="server" ID="ToxRelatedTo_ChestPain" style="width: 62px;"/></td>
-->    <td class="ControlBoxLinedRows"><euc:EformComboBox RecordId="8" LookupCode="ToxIntervention" RefBy="ToxIntervention" TABLE="Toxicities" FIELD="ToxIntervention" Runat="server" ID="ToxIntervention_ChestPain" style="width: 70px;"/></td>
    <td class="ControlBoxLinedRows" align="center"><img onclick="clearROSRow(this);" src="../../Images/EFormDeleteRow.gif" class="ROSDeleteButton"  /></td>
  </tr>
  <tr id="ToxNotesRow_8" style="display: none;">
    <td valign="top" class="ControlBoxLinedRowsShaded" style="border-bottom: none;">&nbsp;</td>
    <td valign="top" class="ControlBoxLinedRowsShaded">&nbsp;</td>
    <td colspan="10"  class="FormInsideTableRegCell" style="border-right: none; font-size: 12px; font-weight: bold; padding: 4px 4px 4px 6px;">Comments: <euc:EformTextBox RecordId="8" ShowCalendar="False" CalcDate="False" style="width:405px;" TABLE="Toxicities" FIELD="ToxNotes" ShowTextEditor="true" Runat="server" ID="ToxNotes_ChestPain"/></td>
    <td class="ControlBoxLinedRows" align="center">&nbsp;</td>
  </tr>
  <tr>
    <td valign="top" class="ControlBoxLinedRowsShaded" style="border-bottom: none; border-top: solid 1px;">GI</td>
    <td valign="top" class="ControlBoxLinedRowsShaded"><span class="SAEInfoIcon">&nbsp;</span>Nausea</td>
    <td class="ControlBoxLinedRows" style="border-right: none; font-size: 10px; font-weight: bold;" ><asp:Label ID="BaselineGrade_Nausea" runat="server">&nbsp;</asp:Label></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButtonGroup Table="Toxicities" Field="ToxGrade" id="ToxGrade_Nausea" RecordId="9" GroupName="Nausea" runat="server"
			Field1="ToxCategory" Value1="Gastrointestinal disorders"
			Field2="ToxName" Value2="Nausea" Field3="ToxScale" Value3="CTC/AE 4.0">
        <euc:EformRadioButton Id="Nausea0" Value="0" runat="server" ExpandClickableArea="False"/>    </td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="Nausea1" Value="1" runat="server" ExpandClickableArea="False"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="Nausea2" Value="2" runat="server" ExpandClickableArea="False"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="Nausea3" Value="3" runat="server" ExpandClickableArea="False"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="Nausea4" Value="4" runat="server" ExpandClickableArea="False"/>
        </euc:EformRadioButtonGroup></td>
    <td class="ControlBoxLinedRows"><euc:EformHidden RecordId="9"  TABLE="Toxicities" FIELD="ToxDate" Runat="server" ID="ToxDate_Nausea"/>
        <euc:EformTextBox RecordId="9" ShowCalendar="True" CalcDate="True" style="width:70px;" TABLE="Toxicities" FIELD="ToxDateText" Runat="server" ID="ToxDateText_Nausea"/>    </td>
    <td class="ControlBoxLinedRows"><euc:EformHidden RecordId="9"  TABLE="Toxicities" FIELD="ToxStopDate" Runat="server" ID="ToxStopDate_Nausea"/>
        <euc:EformTextBox RecordId="9" ShowCalendar="True" CalcDate="True" style="width:70px;" TABLE="Toxicities" FIELD="ToxStopDateText" Runat="server" ID="ToxStopDateText_Nausea"/>    </td>
    <td class="ControlBoxLinedRows"><euc:EformTextBox RecordId="9" LookupCode="ToxProbability" DropDownWidth="280" TABLE="Toxicities" FIELD="ToxProbability" Runat="server" ID="ToxProbability_Nausea" style="width: 52px;"/><euc:EformRelatedRecordWidget runat="server" RelatedTable="Toxicities" RelatedTableRecordId="9" RelatedFieldId="ToxProbability_Nausea" RelatableTables="MedicalTherapy,RadiationTherapy,BrachyTherapy,Procedures,Comorbidities,Allergies" DefaultTable="MedicalTherapy" DefaultTitle="Nausea"></euc:EformRelatedRecordWidget></td>
    <!--    <td class="ControlBoxLinedRows"><euc:EformSelect RecordId="9" LookupCode="RelatedTo" TABLE="Toxicities" FIELD="ToxRelatedTo" Runat="server" ID="ToxRelatedTo_Nausea" style="width: 62px;"/></td>
-->    <td class="ControlBoxLinedRows"><euc:EformComboBox RecordId="9" LookupCode="ToxIntervention" RefBy="ToxIntervention" TABLE="Toxicities" FIELD="ToxIntervention" Runat="server" ID="ToxIntervention_Nausea" style="width: 70px;"/></td>
    <td class="ControlBoxLinedRows" align="center"><img onclick="clearROSRow(this);" src="../../Images/EFormDeleteRow.gif" class="ROSDeleteButton"  /></td>
  </tr>
  <tr id="ToxNotesRow_9" style="display: none;">
    <td valign="top" class="ControlBoxLinedRowsShaded" style="border-bottom: none;">&nbsp;</td>
    <td valign="top" class="ControlBoxLinedRowsShaded">&nbsp;</td>
    <td colspan="10"  class="FormInsideTableRegCell" style="border-right: none; font-size: 12px; font-weight: bold; padding: 4px 4px 4px 6px;">Comments: <euc:EformTextBox RecordId="9" ShowCalendar="False" CalcDate="False" style="width:405px;" TABLE="Toxicities" FIELD="ToxNotes" ShowTextEditor="true" Runat="server" ID="ToxNotes_Nausea"/></td>
    <td class="ControlBoxLinedRows" align="center">&nbsp;</td>
  </tr>
  <tr>
    <td valign="top" class="ControlBoxLinedRowsShaded" style="border-bottom: none;">&nbsp;</td>
    <td valign="top" class="ControlBoxLinedRowsShaded"><span class="SAEInfoIcon">&nbsp;</span>Vomiting</td>
    <td class="ControlBoxLinedRows" style="border-right: none; font-size: 10px; font-weight: bold;" ><asp:Label ID="BaselineGrade_Vomiting" runat="server">&nbsp;</asp:Label></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButtonGroup Table="Toxicities" Field="ToxGrade" id="ToxGrade_Vomiting" RecordId="10" GroupName="Vomiting" runat="server"
			Field1="ToxCategory" Value1="Gastrointestinal disorders"
			Field2="ToxName" Value2="Vomiting" Field3="ToxScale" Value3="CTC/AE 4.0">
        <euc:EformRadioButton Id="Vomiting0" Value="0" runat="server" ExpandClickableArea="False"/>    </td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="Vomiting1" Value="1" runat="server" ExpandClickableArea="False"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="Vomiting2" Value="2" runat="server" ExpandClickableArea="False"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="Vomiting3" Value="3" runat="server" ExpandClickableArea="False"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="Vomiting4" Value="4" runat="server" ExpandClickableArea="False"/>
        </euc:EformRadioButtonGroup></td>
    <td class="ControlBoxLinedRows"><euc:EformHidden RecordId="10"  TABLE="Toxicities" FIELD="ToxDate" Runat="server" ID="ToxDate_Vomiting"/>
        <euc:EformTextBox RecordId="10" ShowCalendar="True" CalcDate="True" style="width:70px;" TABLE="Toxicities" FIELD="ToxDateText" Runat="server" ID="ToxDateText_Vomiting"/>    </td>
    <td class="ControlBoxLinedRows"><euc:EformHidden RecordId="10"  TABLE="Toxicities" FIELD="ToxStopDate" Runat="server" ID="ToxStopDate_Vomiting"/>
        <euc:EformTextBox RecordId="10" ShowCalendar="True" CalcDate="True" style="width:70px;" TABLE="Toxicities" FIELD="ToxStopDateText" Runat="server" ID="ToxStopDateText_Vomiting"/>    </td>
    <td class="ControlBoxLinedRows"><euc:EformTextBox RecordId="10" LookupCode="ToxProbability" DropDownWidth="280" TABLE="Toxicities" FIELD="ToxProbability" Runat="server" ID="ToxProbability_Vomiting" style="width: 52px;"/><euc:EformRelatedRecordWidget runat="server" RelatedTable="Toxicities" RelatedTableRecordId="10" RelatedFieldId="ToxProbability_Vomiting" RelatableTables="MedicalTherapy,RadiationTherapy,BrachyTherapy,Procedures,Comorbidities,Allergies" DefaultTable="MedicalTherapy" DefaultTitle="Vomiting"></euc:EformRelatedRecordWidget></td>
    <!--    <td class="ControlBoxLinedRows"><euc:EformSelect RecordId="10" LookupCode="RelatedTo" TABLE="Toxicities" FIELD="ToxRelatedTo" Runat="server" ID="ToxRelatedTo_Vomiting" style="width: 62px;"/></td>
-->    <td class="ControlBoxLinedRows"><euc:EformComboBox RecordId="10" LookupCode="ToxIntervention" RefBy="ToxIntervention" TABLE="Toxicities" FIELD="ToxIntervention" Runat="server" ID="ToxIntervention_Vomiting" style="width: 70px;"/></td>
    <td class="ControlBoxLinedRows" align="center"><img onclick="clearROSRow(this);" src="../../Images/EFormDeleteRow.gif" class="ROSDeleteButton"  /></td>
  </tr>
  <tr id="ToxNotesRow_10" style="display: none;">
    <td valign="top" class="ControlBoxLinedRowsShaded" style="border-bottom: none;">&nbsp;</td>
    <td valign="top" class="ControlBoxLinedRowsShaded">&nbsp;</td>
    <td colspan="10"  class="FormInsideTableRegCell" style="border-right: none; font-size: 12px; font-weight: bold; padding: 4px 4px 4px 6px;">Comments: <euc:EformTextBox RecordId="10" ShowCalendar="False" CalcDate="False" style="width:405px;" TABLE="Toxicities" FIELD="ToxNotes" ShowTextEditor="true" Runat="server" ID="ToxNotes_Vomiting"/></td>
    <td class="ControlBoxLinedRows" align="center">&nbsp;</td>
  </tr>
  <tr>
    <td valign="top" class="ControlBoxLinedRowsShaded" style="border-bottom: none;">&nbsp;</td>
    <td valign="top" class="ControlBoxLinedRowsShaded"><span class="SAEInfoIcon">&nbsp;</span>Diarrhea</td>
    <td class="ControlBoxLinedRows" style="border-right: none; font-size: 10px; font-weight: bold;" ><asp:Label ID="BaselineGrade_Diarrhea" runat="server">&nbsp;</asp:Label></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButtonGroup Table="Toxicities" Field="ToxGrade" id="ToxGrade_Diarrhea" RecordId="11" GroupName="Diarrhea" runat="server"
			Field1="ToxCategory" Value1="Gastrointestinal disorders"
			Field2="ToxName" Value2="Diarrhea" Field3="ToxScale" Value3="CTC/AE 4.0">
        <euc:EformRadioButton Id="Diarrhea0" Value="0" runat="server" ExpandClickableArea="False"/>    </td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="Diarrhea1" Value="1" runat="server" ExpandClickableArea="False"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="Diarrhea2" Value="2" runat="server" ExpandClickableArea="False"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="Diarrhea3" Value="3" runat="server" ExpandClickableArea="False"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="Diarrhea4" Value="4" runat="server" ExpandClickableArea="False"/>
        </euc:EformRadioButtonGroup></td>
    <td class="ControlBoxLinedRows"><euc:EformHidden RecordId="11"  TABLE="Toxicities" FIELD="ToxDate" Runat="server" ID="ToxDate_Diarrhea"/>
        <euc:EformTextBox RecordId="11" ShowCalendar="True" CalcDate="True" style="width:70px;" TABLE="Toxicities" FIELD="ToxDateText" Runat="server" ID="ToxDateText_Diarrhea"/>    </td>
    <td class="ControlBoxLinedRows"><euc:EformHidden RecordId="11"  TABLE="Toxicities" FIELD="ToxStopDate" Runat="server" ID="ToxStopDate_Diarrhea"/>
        <euc:EformTextBox RecordId="11" ShowCalendar="True" CalcDate="True" style="width:70px;" TABLE="Toxicities" FIELD="ToxStopDateText" Runat="server" ID="ToxStopDateText_Diarrhea"/>    </td>
    <td class="ControlBoxLinedRows"><euc:EformTextBox RecordId="11" LookupCode="ToxProbability" DropDownWidth="280" TABLE="Toxicities" FIELD="ToxProbability" Runat="server" ID="ToxProbability_Diarrhea" style="width: 52px;"/><euc:EformRelatedRecordWidget runat="server" RelatedTable="Toxicities" RelatedTableRecordId="11" RelatedFieldId="ToxProbability_Diarrhea" RelatableTables="MedicalTherapy,RadiationTherapy,BrachyTherapy,Procedures,Comorbidities,Allergies" DefaultTable="MedicalTherapy" DefaultTitle="Diarrhea"></euc:EformRelatedRecordWidget></td>
    <!--    <td class="ControlBoxLinedRows"><euc:EformSelect RecordId="11" LookupCode="RelatedTo" TABLE="Toxicities" FIELD="ToxRelatedTo" Runat="server" ID="ToxRelatedTo_Diarrhea" style="width: 62px;"/></td>
-->    <td class="ControlBoxLinedRows"><euc:EformComboBox RecordId="11" LookupCode="ToxIntervention" RefBy="ToxIntervention" TABLE="Toxicities" FIELD="ToxIntervention" Runat="server" ID="ToxIntervention_Diarrhea" style="width: 70px;"/></td>
    <td class="ControlBoxLinedRows" align="center"><img onclick="clearROSRow(this);" src="../../Images/EFormDeleteRow.gif" class="ROSDeleteButton"  /></td>
  </tr>
  <tr id="ToxNotesRow_11" style="display: none;">
    <td valign="top" class="ControlBoxLinedRowsShaded" style="border-bottom: none;">&nbsp;</td>
    <td valign="top" class="ControlBoxLinedRowsShaded">&nbsp;</td>
    <td colspan="10"  class="FormInsideTableRegCell" style="border-right: none; font-size: 12px; font-weight: bold; padding: 4px 4px 4px 6px;">Comments: <euc:EformTextBox RecordId="11" ShowCalendar="False" CalcDate="False" style="width:405px;" TABLE="Toxicities" FIELD="ToxNotes" ShowTextEditor="true" Runat="server" ID="ToxNotes_Diarrhea"/></td>
    <td class="ControlBoxLinedRows" align="center">&nbsp;</td>
  </tr>
  <tr>
    <td valign="top" class="ControlBoxLinedRowsShaded" style="border-bottom: none;">&nbsp;</td>
    <td valign="top" class="ControlBoxLinedRowsShaded"><span class="SAEInfoIcon">&nbsp;</span>Constipation</td>
    <td class="ControlBoxLinedRows" style="border-right: none; font-size: 10px; font-weight: bold;" ><asp:Label ID="BaselineGrade_Constipation" runat="server">&nbsp;</asp:Label></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButtonGroup Table="Toxicities" Field="ToxGrade" id="ToxGrade_Constipation" RecordId="12" GroupName="Constipation" runat="server"
			Field1="ToxCategory" Value1="Gastrointestinal disorders"
			Field2="ToxName" Value2="Constipation" Field3="ToxScale" Value3="CTC/AE 4.0">
        <euc:EformRadioButton Id="Constipation0" Value="0" runat="server" ExpandClickableArea="False"/>    </td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="Constipation1" Value="1" runat="server" ExpandClickableArea="False"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="Constipation2" Value="2" runat="server" ExpandClickableArea="False"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="Constipation3" Value="3" runat="server" ExpandClickableArea="False"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="Constipation4" Value="4" runat="server" ExpandClickableArea="False"/>
        </euc:EformRadioButtonGroup></td>
    <td class="ControlBoxLinedRows"><euc:EformHidden RecordId="12"  TABLE="Toxicities" FIELD="ToxDate" Runat="server" ID="ToxDate_Constipation"/>
        <euc:EformTextBox RecordId="12" ShowCalendar="True" CalcDate="True" style="width:70px;" TABLE="Toxicities" FIELD="ToxDateText" Runat="server" ID="ToxDateText_Constipation"/>    </td>
    <td class="ControlBoxLinedRows"><euc:EformHidden RecordId="12"  TABLE="Toxicities" FIELD="ToxStopDate" Runat="server" ID="ToxStopDate_Constipation"/>
        <euc:EformTextBox RecordId="12" ShowCalendar="True" CalcDate="True" style="width:70px;" TABLE="Toxicities" FIELD="ToxStopDateText" Runat="server" ID="ToxStopDateText_Constipation"/>    </td>
    <td class="ControlBoxLinedRows"><euc:EformTextBox RecordId="12" LookupCode="ToxProbability" DropDownWidth="280" TABLE="Toxicities" FIELD="ToxProbability" Runat="server" ID="ToxProbability_Constipation" style="width: 52px;"/><euc:EformRelatedRecordWidget runat="server" RelatedTable="Toxicities" RelatedTableRecordId="12" RelatedFieldId="ToxProbability_Constipation" RelatableTables="MedicalTherapy,RadiationTherapy,BrachyTherapy,Procedures,Comorbidities,Allergies" DefaultTable="MedicalTherapy" DefaultTitle="Constipation"></euc:EformRelatedRecordWidget></td>
    <!--    <td class="ControlBoxLinedRows"><euc:EformSelect RecordId="12" LookupCode="RelatedTo" TABLE="Toxicities" FIELD="ToxRelatedTo" Runat="server" ID="ToxRelatedTo_Constipation" style="width: 62px;"/></td>
-->    <td class="ControlBoxLinedRows"><euc:EformComboBox RecordId="12" LookupCode="ToxIntervention" RefBy="ToxIntervention" TABLE="Toxicities" FIELD="ToxIntervention" Runat="server" ID="ToxIntervention_Constipation" style="width: 70px;"/></td>
    <td class="ControlBoxLinedRows" align="center"><img onclick="clearROSRow(this);" src="../../Images/EFormDeleteRow.gif" class="ROSDeleteButton"  /></td>
  </tr>
  <tr id="ToxNotesRow_12" style="display: none;">
    <td valign="top" class="ControlBoxLinedRowsShaded" style="border-bottom: none;">&nbsp;</td>
    <td valign="top" class="ControlBoxLinedRowsShaded">&nbsp;</td>
    <td colspan="10"  class="FormInsideTableRegCell" style="border-right: none; font-size: 12px; font-weight: bold; padding: 4px 4px 4px 6px;">Comments: <euc:EformTextBox RecordId="12" ShowCalendar="False" CalcDate="False" style="width:405px;" TABLE="Toxicities" FIELD="ToxNotes" ShowTextEditor="true" Runat="server" ID="ToxNotes_Constipation"/></td>
    <td class="ControlBoxLinedRows" align="center">&nbsp;</td>
  </tr>
  <tr>
    <td class="controlBoxDataGridHeaderFirstCol" style="border-bottom: none;">System</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align:left;">Symptom</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="border-right: none;" >&nbsp;</td>
    <td class="controlBoxDataGridHeaderFirstCol">0</td>
    <td class="controlBoxDataGridHeaderFirstCol">1</td>
    <td class="controlBoxDataGridHeaderFirstCol">2</td>
    <td class="controlBoxDataGridHeaderFirstCol">3</td>
    <td class="controlBoxDataGridHeaderFirstCol">4</td>
    <td class="controlBoxDataGridHeaderFirstCol">Start Date </td>
    <td class="controlBoxDataGridHeaderFirstCol">Stop Date </td>
    <td class="controlBoxDataGridHeaderFirstCol">Attribution</td>
    <!--    <td class="controlBoxDataGridHeaderFirstCol">Disease or Therapy </td> -->    
	<td class="controlBoxDataGridHeaderFirstCol">Intervention </td>
    <td class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
  </tr>
  <tr>
    <td valign="top" class="ControlBoxLinedRowsShaded" style="border-bottom: none; border-top: solid 1px;">Neuro</td>
    <td valign="top" class="ControlBoxLinedRowsShaded"><span class="SAEInfoIcon">&nbsp;</span>Sensory Neuropathy</td>
    <td class="ControlBoxLinedRows" style="border-right: none; font-size: 10px; font-weight: bold;" ><asp:Label ID="BaselineGrade_SensoryNeuropathy" runat="server">&nbsp;</asp:Label></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButtonGroup Table="Toxicities" Field="ToxGrade" id="ToxGrade_SensoryNeuropathy" RecordId="13" GroupName="SensoryNeuropathy" runat="server"
			Field1="ToxCategory" Value1="Nervous system disorders"
			Field2="ToxName" Value2="Peripheral sensory neuropathy" Field3="ToxScale" Value3="CTC/AE 4.0">
        <euc:EformRadioButton Id="Peripheralsensoryneuropathy0" Value="0" runat="server" ExpandClickableArea="False"/>    </td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="Peripheralsensoryneuropathy1" Value="1" runat="server" ExpandClickableArea="False"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="Peripheralsensoryneuropathy2" Value="2" runat="server" ExpandClickableArea="False"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="Peripheralsensoryneuropathy3" Value="3" runat="server" ExpandClickableArea="False"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="Peripheralsensoryneuropathy4" Value="4" runat="server" ExpandClickableArea="False"/>
        </euc:EformRadioButtonGroup></td>
    <td class="ControlBoxLinedRows"><euc:EformHidden RecordId="13"  TABLE="Toxicities" FIELD="ToxDate" Runat="server" ID="ToxDate_SensoryNeuropathy"/>
        <euc:EformTextBox RecordId="13" ShowCalendar="True" CalcDate="True" style="width:70px;" TABLE="Toxicities" FIELD="ToxDateText" Runat="server" ID="ToxDateText_SensoryNeuropathy"/>    </td>
    <td class="ControlBoxLinedRows"><euc:EformHidden RecordId="13"  TABLE="Toxicities" FIELD="ToxStopDate" Runat="server" ID="ToxStopDate_SensoryNeuropathy"/>
        <euc:EformTextBox RecordId="13" ShowCalendar="True" CalcDate="True" style="width:70px;" TABLE="Toxicities" FIELD="ToxStopDateText" Runat="server" ID="ToxStopDateText_SensoryNeuropathy"/>    </td>
    <td class="ControlBoxLinedRows"><euc:EformTextBox RecordId="13" LookupCode="ToxProbability" DropDownWidth="280" TABLE="Toxicities" FIELD="ToxProbability" Runat="server" ID="ToxProbability_SensoryNeuropathy" style="width: 52px;"/><euc:EformRelatedRecordWidget runat="server" RelatedTable="Toxicities" RelatedTableRecordId="13" RelatedFieldId="ToxProbability_SensoryNeuropathy" RelatableTables="MedicalTherapy,RadiationTherapy,BrachyTherapy,Procedures,Comorbidities,Allergies" DefaultTable="MedicalTherapy" DefaultTitle="Sensory Neuropathy"></euc:EformRelatedRecordWidget></td>
    <!--    <td class="ControlBoxLinedRows"><euc:EformSelect RecordId="13" LookupCode="RelatedTo" TABLE="Toxicities" FIELD="ToxRelatedTo" Runat="server" ID="ToxRelatedTo_SensoryNeuropathy" style="width: 62px;"/></td>
-->    <td class="ControlBoxLinedRows"><euc:EformComboBox RecordId="13" LookupCode="ToxIntervention" RefBy="ToxIntervention" TABLE="Toxicities" FIELD="ToxIntervention" Runat="server" ID="ToxIntervention_SensoryNeuropathy" style="width: 70px;"/></td>
    <td class="ControlBoxLinedRows" align="center"><img onclick="clearROSRow(this);" src="../../Images/EFormDeleteRow.gif" class="ROSDeleteButton"  /></td>
  </tr>
  <tr id="ToxNotesRow_13" style="display: none;">
    <td valign="top" class="ControlBoxLinedRowsShaded" style="border-bottom: none;">&nbsp;</td>
    <td valign="top" class="ControlBoxLinedRowsShaded">&nbsp;</td>
    <td colspan="10"  class="FormInsideTableRegCell" style="border-right: none; font-size: 12px; font-weight: bold; padding: 4px 4px 4px 6px;">Comments: <euc:EformTextBox RecordId="13" ShowCalendar="False" CalcDate="False" style="width:405px;" TABLE="Toxicities" FIELD="ToxNotes" ShowTextEditor="true" Runat="server" ID="ToxNotes_SensoryNeuropathy"/></td>
    <td class="ControlBoxLinedRows" align="center">&nbsp;</td>
  </tr>
  <tr>
    <td valign="top" class="ControlBoxLinedRowsShaded" style="border-bottom: none;">&nbsp;</td>
    <td valign="top" class="ControlBoxLinedRowsShaded"><span class="SAEInfoIcon">&nbsp;</span>Motor Neuropathy</td>
    <td class="ControlBoxLinedRows" style="border-right: none; font-size: 10px; font-weight: bold;" ><asp:Label ID="BaselineGrade_MotorNeuropathy" runat="server">&nbsp;</asp:Label></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButtonGroup Table="Toxicities" Field="ToxGrade" id="ToxGrade_MotorNeuropathy" RecordId="14" GroupName="Weakness" runat="server"
			Field1="ToxCategory" Value1="Nervous system disorders"
			Field2="ToxName" Value2="Peripheral motor neuropathy" Field3="ToxScale" Value3="CTC/AE 4.0">
        <euc:EformRadioButton Id="Peripheralmotorneuropathy0" Value="0" runat="server" ExpandClickableArea="False"/>    </td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="Peripheralmotorneuropathy1" Value="1" runat="server" ExpandClickableArea="False"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="Peripheralmotorneuropathy2" Value="2" runat="server" ExpandClickableArea="False"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="Peripheralmotorneuropathy3" Value="3" runat="server" ExpandClickableArea="False"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="Peripheralmotorneuropathy4" Value="4" runat="server" ExpandClickableArea="False"/>
        </euc:EformRadioButtonGroup></td>
    <td class="ControlBoxLinedRows"><euc:EformHidden RecordId="14"  TABLE="Toxicities" FIELD="ToxDate" Runat="server" ID="ToxDate_MotorNeuropathy"/>
        <euc:EformTextBox RecordId="14" ShowCalendar="True" CalcDate="True" style="width:70px;" TABLE="Toxicities" FIELD="ToxDateText" Runat="server" ID="ToxDateText_MotorNeuropathy"/>    </td>
    <td class="ControlBoxLinedRows"><euc:EformHidden RecordId="14"  TABLE="Toxicities" FIELD="ToxStopDate" Runat="server" ID="ToxStopDate_MotorNeuropathy"/>
        <euc:EformTextBox RecordId="14" ShowCalendar="True" CalcDate="True" style="width:70px;" TABLE="Toxicities" FIELD="ToxStopDateText" Runat="server" ID="ToxStopDateText_MotorNeuropathy"/>    </td>
    <td class="ControlBoxLinedRows"><euc:EformTextBox RecordId="14" LookupCode="ToxProbability" DropDownWidth="280" TABLE="Toxicities" FIELD="ToxProbability" Runat="server" ID="ToxProbability_MotorNeuropathy" style="width: 52px;"/><euc:EformRelatedRecordWidget runat="server" RelatedTable="Toxicities" RelatedTableRecordId="14" RelatedFieldId="ToxProbability_MotorNeuropathy" RelatableTables="MedicalTherapy,RadiationTherapy,BrachyTherapy,Procedures,Comorbidities,Allergies" DefaultTable="MedicalTherapy" DefaultTitle="MotorNeuropathy"></euc:EformRelatedRecordWidget></td>
    <!--    <td class="ControlBoxLinedRows"><euc:EformSelect RecordId="14" LookupCode="RelatedTo" TABLE="Toxicities" FIELD="ToxRelatedTo" Runat="server" ID="ToxRelatedTo_MotorNeuropathy" style="width: 62px;"/></td>
-->    <td class="ControlBoxLinedRows"><euc:EformComboBox RecordId="14" LookupCode="ToxIntervention" RefBy="ToxIntervention" TABLE="Toxicities" FIELD="ToxIntervention" Runat="server" ID="ToxIntervention_MotorNeuropathy" style="width: 70px;"/></td>
    <td class="ControlBoxLinedRows" align="center"><img onclick="clearROSRow(this);" src="../../Images/EFormDeleteRow.gif" class="ROSDeleteButton"  /></td>
  </tr>
  <tr id="ToxNotesRow_14" style="display: none;">
    <td valign="top" class="ControlBoxLinedRowsShaded" style="border-bottom: none;">&nbsp;</td>
    <td valign="top" class="ControlBoxLinedRowsShaded">&nbsp;</td>
    <td colspan="10"  class="FormInsideTableRegCell" style="border-right: none; font-size: 12px; font-weight: bold; padding: 4px 4px 4px 6px;">Comments: <euc:EformTextBox RecordId="14" ShowCalendar="False" CalcDate="False" style="width:405px;" TABLE="Toxicities" FIELD="ToxNotes" ShowTextEditor="true" Runat="server" ID="ToxNotes_MotorNeuropathy"/></td>
    <td class="ControlBoxLinedRows" align="center">&nbsp;</td>
  </tr>
  <tr>
    <td valign="top" class="ControlBoxLinedRowsShaded" style="border-bottom: none; border-top: solid 1px;">GU</td>
    <td valign="top" class="ControlBoxLinedRowsShaded"><span class="SAEInfoIcon">&nbsp;</span>Urinary Frequency</td>
    <td class="ControlBoxLinedRows" style="border-right: none; font-size: 10px; font-weight: bold;" ><asp:Label ID="BaselineGrade_UrinaryFrequency" runat="server">&nbsp;</asp:Label></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButtonGroup Table="Toxicities" Field="ToxGrade" id="ToxGrade_UrinaryFrequency" RecordId="15" GroupName="UrinaryFrequency" runat="server"
			Field1="ToxCategory" Value1="Renal and urinary disorders"
			Field2="ToxName" Value2="Urinary frequency" Field3="ToxScale" Value3="CTC/AE 4.0">
        <euc:EformRadioButton Id="Urinaryfrequency0" Value="0" runat="server" ExpandClickableArea="False"/>    </td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="Urinaryfrequency1" Value="1" runat="server" ExpandClickableArea="False"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="Urinaryfrequency2" Value="2" runat="server" ExpandClickableArea="False"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="Urinaryfrequency3" Value="3" runat="server" ExpandClickableArea="False"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="Urinaryfrequency4" Value="4" runat="server" ExpandClickableArea="False"/>
        </euc:EformRadioButtonGroup></td>
    <td class="ControlBoxLinedRows"><euc:EformHidden RecordId="15"  TABLE="Toxicities" FIELD="ToxDate" Runat="server" ID="ToxDate_UrinaryFrequency"/>
        <euc:EformTextBox RecordId="15" ShowCalendar="True" CalcDate="True" style="width:70px;" TABLE="Toxicities" FIELD="ToxDateText" Runat="server" ID="ToxDateText_UrinaryFrequency"/>    </td>
    <td class="ControlBoxLinedRows"><euc:EformHidden RecordId="15"  TABLE="Toxicities" FIELD="ToxStopDate" Runat="server" ID="ToxStopDate_UrinaryFrequency"/>
        <euc:EformTextBox RecordId="15" ShowCalendar="True" CalcDate="True" style="width:70px;" TABLE="Toxicities" FIELD="ToxStopDateText" Runat="server" ID="ToxStopDateText_UrinaryFrequency"/>    </td>
    <td class="ControlBoxLinedRows"><euc:EformTextBox RecordId="15" LookupCode="ToxProbability" DropDownWidth="280" TABLE="Toxicities" FIELD="ToxProbability" Runat="server" ID="ToxProbability_UrinaryFrequency" style="width: 52px;"/><euc:EformRelatedRecordWidget runat="server" RelatedTable="Toxicities" RelatedTableRecordId="15" RelatedFieldId="ToxProbability_UrinaryFrequency" RelatableTables="MedicalTherapy,RadiationTherapy,BrachyTherapy,Procedures,Comorbidities,Allergies" DefaultTable="MedicalTherapy" DefaultTitle="Urinary Frequency"></euc:EformRelatedRecordWidget></td>
    <!--    <td class="ControlBoxLinedRows"><euc:EformSelect RecordId="15" LookupCode="RelatedTo" TABLE="Toxicities" FIELD="ToxRelatedTo" Runat="server" ID="ToxRelatedTo_UrinaryFrequency" style="width: 62px;"/></td>
-->    <td class="ControlBoxLinedRows"><euc:EformComboBox RecordId="15" LookupCode="ToxIntervention" RefBy="ToxIntervention" TABLE="Toxicities" FIELD="ToxIntervention" Runat="server" ID="ToxIntervention_UrinaryFrequency" style="width: 70px;"/></td>
    <td class="ControlBoxLinedRows" align="center"><img onclick="clearROSRow(this);" src="../../Images/EFormDeleteRow.gif" class="ROSDeleteButton"  /></td>
  </tr>
  <tr id="ToxNotesRow_15" style="display: none;">
    <td valign="top" class="ControlBoxLinedRowsShaded" style="border-bottom: none;">&nbsp;</td>
    <td valign="top" class="ControlBoxLinedRowsShaded">&nbsp;</td>
    <td colspan="10"  class="FormInsideTableRegCell" style="border-right: none; font-size: 12px; font-weight: bold; padding: 4px 4px 4px 6px;">Comments: <euc:EformTextBox RecordId="15" ShowCalendar="False" CalcDate="False" style="width:405px;" TABLE="Toxicities" FIELD="ToxNotes" ShowTextEditor="true" Runat="server" ID="ToxNotes_UrinaryFrequency"/></td>
    <td class="ControlBoxLinedRows" align="center">&nbsp;</td>
  </tr>
  <tr>
    <td valign="top" class="ControlBoxLinedRowsShaded" style="border-bottom: none;">&nbsp;</td>
    <td valign="top" class="ControlBoxLinedRowsShaded"><span class="SAEInfoIcon">&nbsp;</span>Hemorrhage - Urinary NOS</td>
    <td class="ControlBoxLinedRows" style="border-right: none; font-size: 10px; font-weight: bold;" ><asp:Label ID="BaselineGrade_HemorrhageUrinaryNOS" runat="server">&nbsp;</asp:Label></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButtonGroup Table="Toxicities" Field="ToxGrade" id="ToxGrade_HemorrhageUrinaryNOS" RecordId="16" GroupName="HemorrhageUrinaryNOS" runat="server"
			Field1="ToxCategory" Value1="Renal and urinary disorders"
			Field2="ToxName" Value2="Hematuria" Field3="ToxScale" Value3="CTC/AE 4.0">
        <euc:EformRadioButton Id="Hematuria0" Value="0" runat="server" ExpandClickableArea="False"/>    </td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="Hematuria1" Value="1" runat="server" ExpandClickableArea="False"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="Hematuria2" Value="2" runat="server" ExpandClickableArea="False"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="Hematuria3" Value="3" runat="server" ExpandClickableArea="False"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="Hematuria4" Value="4" runat="server" ExpandClickableArea="False"/>
        </euc:EformRadioButtonGroup></td>
    <td class="ControlBoxLinedRows"><euc:EformHidden RecordId="16"  TABLE="Toxicities" FIELD="ToxDate" Runat="server" ID="ToxDate_HemorrhageUrinaryNOS"/>
        <euc:EformTextBox RecordId="16" ShowCalendar="True" CalcDate="True" style="width:70px;" TABLE="Toxicities" FIELD="ToxDateText" Runat="server" ID="ToxDateText_HemorrhageUrinaryNOS"/>    </td>
    <td class="ControlBoxLinedRows"><euc:EformHidden RecordId="16"  TABLE="Toxicities" FIELD="ToxStopDate" Runat="server" ID="ToxStopDate_HemorrhageUrinaryNOS"/>
        <euc:EformTextBox RecordId="16" ShowCalendar="True" CalcDate="True" style="width:70px;" TABLE="Toxicities" FIELD="ToxStopDateText" Runat="server" ID="ToxStopDateText_HemorrhageUrinaryNOS"/>    </td>
    <td class="ControlBoxLinedRows"><euc:EformTextBox RecordId="16" LookupCode="ToxProbability" DropDownWidth="280" TABLE="Toxicities" FIELD="ToxProbability" Runat="server" ID="ToxProbability_HemorrhageUrinaryNOS" style="width: 52px;"/><euc:EformRelatedRecordWidget runat="server" RelatedTable="Toxicities" RelatedTableRecordId="16" RelatedFieldId="ToxProbability_HemorrhageUrinaryNOS" RelatableTables="MedicalTherapy,RadiationTherapy,BrachyTherapy,Procedures,Comorbidities,Allergies" DefaultTable="MedicalTherapy" DefaultTitle="Hemorrhage - Urinary NOS"></euc:EformRelatedRecordWidget></td>
    <!--    <td class="ControlBoxLinedRows"><euc:EformSelect RecordId="16" LookupCode="RelatedTo" TABLE="Toxicities" FIELD="ToxRelatedTo" Runat="server" ID="ToxRelatedTo_HemorrhageUrinaryNOS" style="width: 62px;"/></td>
-->    <td class="ControlBoxLinedRows"><euc:EformComboBox RecordId="16" LookupCode="ToxIntervention" RefBy="ToxIntervention" TABLE="Toxicities" FIELD="ToxIntervention" Runat="server" ID="ToxIntervention_HemorrhageUrinaryNOS" style="width: 70px;"/></td>
    <td class="ControlBoxLinedRows" align="center"><img onclick="clearROSRow(this);" src="../../Images/EFormDeleteRow.gif" class="ROSDeleteButton"  /></td>
  </tr>
  <tr id="ToxNotesRow_16" style="display: none;">
    <td valign="top" class="ControlBoxLinedRowsShaded" style="border-bottom: none;">&nbsp;</td>
    <td valign="top" class="ControlBoxLinedRowsShaded">&nbsp;</td>
    <td colspan="10"  class="FormInsideTableRegCell" style="border-right: none; font-size: 12px; font-weight: bold; padding: 4px 4px 4px 6px;">Comments: <euc:EformTextBox RecordId="16" ShowCalendar="False" CalcDate="False" style="width:405px;" TABLE="Toxicities" FIELD="ToxNotes" ShowTextEditor="true" Runat="server" ID="ToxNotes_HemorrhageUrinaryNOS"/></td>
    <td class="ControlBoxLinedRows" align="center">&nbsp;</td>
  </tr>
  <tr>
    <td valign="top" class="ControlBoxLinedRowsShaded" style="border-bottom: none;">&nbsp;</td>
    <td valign="top" class="ControlBoxLinedRowsShaded"><span class="SAEInfoIcon">&nbsp;</span>Pain - Urethra</td>
    <td class="ControlBoxLinedRows" style="border-right: none; font-size: 10px; font-weight: bold;" ><asp:Label ID="BaselineGrade_PainUrethra" runat="server">&nbsp;</asp:Label></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButtonGroup Table="Toxicities" Field="ToxGrade" id="ToxGrade_PainUrethra" RecordId="17" GroupName="PainUrethra" runat="server"
			Field1="ToxCategory" Value1="Renal and urinary disorders"
			Field2="ToxName" Value2="Urinary tract pain" Field3="ToxScale" Value3="CTC/AE 4.0">
        <euc:EformRadioButton Id="Urinarytractpain0" Value="0" runat="server" ExpandClickableArea="False"/>    </td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="Urinarytractpain1" Value="1" runat="server" ExpandClickableArea="False"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="Urinarytractpain2" Value="2" runat="server" ExpandClickableArea="False"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="Urinarytractpain3" Value="3" runat="server" ExpandClickableArea="False"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="Urinarytractpain4" Value="4" runat="server" ExpandClickableArea="False"/>
        </euc:EformRadioButtonGroup></td>
    <td class="ControlBoxLinedRows"><euc:EformHidden RecordId="17"  TABLE="Toxicities" FIELD="ToxDate" Runat="server" ID="ToxDate_PainUrethra"/>
        <euc:EformTextBox RecordId="17" ShowCalendar="True" CalcDate="True" style="width:70px;" TABLE="Toxicities" FIELD="ToxDateText" Runat="server" ID="ToxDateText_PainUrethra"/>    </td>
    <td class="ControlBoxLinedRows"><euc:EformHidden RecordId="17"  TABLE="Toxicities" FIELD="ToxStopDate" Runat="server" ID="ToxStopDate_PainUrethra"/>
        <euc:EformTextBox RecordId="17" ShowCalendar="True" CalcDate="True" style="width:70px;" TABLE="Toxicities" FIELD="ToxStopDateText" Runat="server" ID="ToxStopDateText_PainUrethra"/>    </td>
    <td class="ControlBoxLinedRows"><euc:EformTextBox RecordId="17" LookupCode="ToxProbability" DropDownWidth="280" TABLE="Toxicities" FIELD="ToxProbability" Runat="server" ID="ToxProbability_PainUrethra" style="width: 52px;"/><euc:EformRelatedRecordWidget runat="server" RelatedTable="Toxicities" RelatedTableRecordId="17" RelatedFieldId="ToxProbability_PainUrethra" RelatableTables="MedicalTherapy,RadiationTherapy,BrachyTherapy,Procedures,Comorbidities,Allergies" DefaultTable="MedicalTherapy" DefaultTitle="Pain - Urethra"></euc:EformRelatedRecordWidget></td>
    <!--    <td class="ControlBoxLinedRows"><euc:EformSelect RecordId="17" LookupCode="RelatedTo" TABLE="Toxicities" FIELD="ToxRelatedTo" Runat="server" ID="ToxRelatedTo_PainUrethra" style="width: 62px;"/></td>
-->    <td class="ControlBoxLinedRows"><euc:EformComboBox RecordId="17" LookupCode="ToxIntervention" RefBy="ToxIntervention" TABLE="Toxicities" FIELD="ToxIntervention" Runat="server" ID="ToxIntervention_PainUrethra" style="width: 70px;"/></td>
    <td class="ControlBoxLinedRows" align="center"><img onclick="clearROSRow(this);" src="../../Images/EFormDeleteRow.gif" class="ROSDeleteButton"  /></td>
  </tr>
  <tr id="ToxNotesRow_17" style="display: none;">
    <td valign="top" class="ControlBoxLinedRowsShaded" style="border-bottom: none;">&nbsp;</td>
    <td valign="top" class="ControlBoxLinedRowsShaded">&nbsp;</td>
    <td colspan="10"  class="FormInsideTableRegCell" style="border-right: none; font-size: 12px; font-weight: bold; padding: 4px 4px 4px 6px;">Comments: <euc:EformTextBox RecordId="17" ShowCalendar="False" CalcDate="False" style="width:405px;" TABLE="Toxicities" FIELD="ToxNotes" ShowTextEditor="true" Runat="server" ID="ToxNotes_PainUrethra"/></td>
    <td class="ControlBoxLinedRows" align="center">&nbsp;</td>
  </tr>
  <tr>
    <td valign="top" class="ControlBoxLinedRowsShaded">&nbsp;</td>
    <td valign="top" class="ControlBoxLinedRowsShaded"><span class="SAEInfoIcon">&nbsp;</span>Incontinence</td>
    <td class="ControlBoxLinedRows" style="border-right: none; font-size: 10px; font-weight: bold;" ><asp:Label ID="BaselineGrade_Incontinence" runat="server">&nbsp;</asp:Label></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButtonGroup Table="Toxicities" Field="ToxGrade" id="ToxGrade_Incontinence" RecordId="18" GroupName="Incontinence" runat="server"
			Field1="ToxCategory" Value1="Renal and urinary disorders"
			Field2="ToxName" Value2="Urinary incontinence" Field3="ToxScale" Value3="CTC/AE 4.0">
        <euc:EformRadioButton Id="Urinaryincontinence0" Value="0" runat="server" ExpandClickableArea="False"/>    </td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="Urinaryincontinence1" Value="1" runat="server" ExpandClickableArea="False"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="Urinaryincontinence2" Value="2" runat="server" ExpandClickableArea="False"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="Urinaryincontinence3" Value="3" runat="server" ExpandClickableArea="False"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="Urinaryincontinence4" Value="4" runat="server" ExpandClickableArea="False"/>
        </euc:EformRadioButtonGroup></td>
    <td class="ControlBoxLinedRows"><euc:EformHidden RecordId="18"  TABLE="Toxicities" FIELD="ToxDate" Runat="server" ID="ToxDate_Incontinence"/>
        <euc:EformTextBox RecordId="18" ShowCalendar="True" CalcDate="True" style="width:70px;" TABLE="Toxicities" FIELD="ToxDateText" Runat="server" ID="ToxDateText_Incontinence"/>    </td>
    <td class="ControlBoxLinedRows"><euc:EformHidden RecordId="18"  TABLE="Toxicities" FIELD="ToxStopDate" Runat="server" ID="ToxStopDate_Incontinence"/>
        <euc:EformTextBox RecordId="18" ShowCalendar="True" CalcDate="True" style="width:70px;" TABLE="Toxicities" FIELD="ToxStopDateText" Runat="server" ID="ToxStopDateText_Incontinence"/>    </td>
    <td class="ControlBoxLinedRows"><euc:EformTextBox RecordId="18" LookupCode="ToxProbability" DropDownWidth="280" TABLE="Toxicities" FIELD="ToxProbability" Runat="server" ID="ToxProbability_Incontinence" style="width: 52px;"/><euc:EformRelatedRecordWidget runat="server" RelatedTable="Toxicities" RelatedTableRecordId="18" RelatedFieldId="ToxProbability_Incontinence" RelatableTables="MedicalTherapy,RadiationTherapy,BrachyTherapy,Procedures,Comorbidities,Allergies" DefaultTable="MedicalTherapy" DefaultTitle="Incontinence"></euc:EformRelatedRecordWidget></td>
    <!--    <td class="ControlBoxLinedRows"><euc:EformSelect RecordId="18" LookupCode="RelatedTo" TABLE="Toxicities" FIELD="ToxRelatedTo" Runat="server" ID="ToxRelatedTo_Incontinence" style="width: 62px;"/></td>
-->    <td class="ControlBoxLinedRows"><euc:EformComboBox RecordId="18" LookupCode="ToxIntervention" RefBy="ToxIntervention" TABLE="Toxicities" FIELD="ToxIntervention" Runat="server" ID="ToxIntervention_Incontinence" style="width: 70px;"/></td>
    <td class="ControlBoxLinedRows" align="center"><img onclick="clearROSRow(this);" src="../../Images/EFormDeleteRow.gif" class="ROSDeleteButton"  /></td>
  </tr>
  <tr id="ToxNotesRow_18" style="display: none;">
    <td valign="top" class="ControlBoxLinedRowsShaded" style="border-bottom: none;">&nbsp;</td>
    <td valign="top" class="ControlBoxLinedRowsShaded">&nbsp;</td>
    <td colspan="10"  class="FormInsideTableRegCell" style="border-right: none; font-size: 12px; font-weight: bold; padding: 4px 4px 4px 6px;">Comments: <euc:EformTextBox RecordId="18" ShowCalendar="False" CalcDate="False" style="width:405px;" TABLE="Toxicities" FIELD="ToxNotes" ShowTextEditor="true" Runat="server" ID="ToxNotes_Incontinence"/></td>
    <td class="ControlBoxLinedRows" align="center">&nbsp;</td>
  </tr>
  
  
  
  
  
  <tr>
    <td valign="top" class="ControlBoxLinedRowsShaded">&nbsp;</td>
    <td valign="top" class="ControlBoxLinedRowsShaded">Potency</td>
    <td class="ControlBoxLinedRows" style="border-right: none; font-size: 10px; font-weight: bold;" ><asp:Label ID="BaselineGrade_Potency" runat="server">&nbsp;</asp:Label></td>
    <td class="ControlBoxLinedRows" colspan="2" style="border-right: none;" ><euc:EformRadioButtonGroup Table="Toxicities" Field="ToxNotes" id="ToxNotes_Potency" RecordId="19" GroupName="Potency" runat="server" Field1="ToxCategory" Value1="Reproductive system and breast disorders" Field2="ToxName" Value2="Erectile dysfunction" Field3="ToxScale" Value3="CTC/AE 4.0" >
        <euc:EformRadioButton Id="ToxNotes_Potency_Yes" Value="Yes" runat="server" ExpandClickableArea="False"/>Yes</td>
    <td class="ControlBoxLinedRows"  colspan="7"><euc:EformRadioButton Id="ToxNotes_Potency_No" Value="No" runat="server" ExpandClickableArea="False"/>No</euc:EformRadioButtonGroup></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server"   /></td>
  </tr>
  <%--
  <tr>
    <td valign="top" class="ControlBoxLinedRowsShaded">&nbsp;</td>
    <td valign="top" class="ControlBoxLinedRowsShaded"><span class="SAEInfoIcon">&nbsp;</span>Potency</td>
    <td class="ControlBoxLinedRows" style="border-right: none; font-size: 10px; font-weight: bold;" ><asp:Label ID="BaselineGrade_Potency" runat="server">&nbsp;</asp:Label></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButtonGroup Table="Toxicities" Field="ToxGrade" id="ToxGrade_Potency" RecordId="19" GroupName="Potency" runat="server"
			Field1="ToxCategory" Value1="Reproductive system and breast disorders"
			Field2="ToxName" Value2="Erectile dysfunction" Field3="ToxScale" Value3="CTC/AE 4.0">
        <euc:EformRadioButton Id="Potency0" Value="0" runat="server" ExpandClickableArea="False"/>    </td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="Potency1" Value="1" runat="server" ExpandClickableArea="False"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="Potency2" Value="2" runat="server" ExpandClickableArea="False"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="Potency3" Value="3" runat="server" ExpandClickableArea="False"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="Potency4" Value="4" runat="server" ExpandClickableArea="False"/>
        </euc:EformRadioButtonGroup></td>
    <td class="ControlBoxLinedRows"><euc:EformHidden RecordId="19"  TABLE="Toxicities" FIELD="ToxDate" Runat="server" ID="ToxDate_Potency"/>
        <euc:EformTextBox RecordId="19" ShowCalendar="True" CalcDate="True" style="width:70px;" TABLE="Toxicities" FIELD="ToxDateText" Runat="server" ID="ToxDateText_Potency"/>    </td>
    <td class="ControlBoxLinedRows"><euc:EformHidden RecordId="19"  TABLE="Toxicities" FIELD="ToxStopDate" Runat="server" ID="ToxStopDate_Potency"/>
        <euc:EformTextBox RecordId="19" ShowCalendar="True" CalcDate="True" style="width:70px;" TABLE="Toxicities" FIELD="ToxStopDateText" Runat="server" ID="ToxStopDateText_Potency"/>    </td>
    <td class="ControlBoxLinedRows"><euc:EformTextBox RecordId="19" LookupCode="ToxProbability" DropDownWidth="280" TABLE="Toxicities" FIELD="ToxProbability" Runat="server" ID="ToxProbability_Potency" style="width: 52px;"/><euc:EformRelatedRecordWidget runat="server" RelatedTable="Toxicities" RelatedTableRecordId="19" RelatedFieldId="ToxProbability_Potency" RelatableTables="MedicalTherapy,RadiationTherapy,BrachyTherapy,Procedures,Comorbidities,Allergies" DefaultTable="MedicalTherapy" DefaultTitle="Potency"></euc:EformRelatedRecordWidget></td>
    <!--    <td class="ControlBoxLinedRows"><euc:EformSelect RecordId="19" LookupCode="RelatedTo" TABLE="Toxicities" FIELD="ToxRelatedTo" Runat="server" ID="ToxRelatedTo_Potency" style="width: 62px;"/></td>
-->    <td class="ControlBoxLinedRows"><euc:EformComboBox RecordId="19" LookupCode="ToxIntervention" RefBy="ToxIntervention" TABLE="Toxicities" FIELD="ToxIntervention" Runat="server" ID="ToxIntervention_Potency" style="width: 70px;"/></td>
    <td class="ControlBoxLinedRows" align="center"><img onclick="clearROSRow(this);" src="../../Images/EFormDeleteRow.gif" class="ROSDeleteButton"  /></td>
  </tr>
  <tr id="ToxNotesRow_19" style="display: none;">
    <td valign="top" class="ControlBoxLinedRowsShaded">&nbsp;</td>
    <td valign="top" class="ControlBoxLinedRowsShaded">&nbsp;</td>
    <td colspan="10"  class="FormInsideTableRegCell" style="border-right: none; font-size: 12px; font-weight: bold; padding: 4px 4px 4px 6px;">Comments: <euc:EformTextBox RecordId="19" ShowCalendar="False" CalcDate="False" style="width:405px;" TABLE="Toxicities" FIELD="ToxNotes" ShowTextEditor="true" Runat="server" ID="ToxNotes_Potency"/></td>
    <td class="ControlBoxLinedRows" align="center">&nbsp;</td>
  </tr>
  --%>
  
  
  
  
  
  
  <tr>
    <td valign="top" class="ControlBoxLinedRowsShaded" style="border-top: solid 1px #333333; border-bottom: none;border-right: none; "><strong>Pain</strong></td>
    <td valign="top" class="ControlBoxLinedRowsShaded" style="border-left: none; border-bottom: none;">Site: <euc:EformTextBox style="width:80px;" TABLE="NoTable" FIELD="PainLocation" Runat="server" ID="PainLocation" /></td>
    <td class="ControlBoxLinedRows" style="border-right: none; font-size: 10px; font-weight: bold;border-top: solid 1px #333333;" ><asp:Label ID="BaselineGrade_Pain" runat="server">&nbsp;</asp:Label></td>
    <td class="ControlBoxLinedRows" align="center" style="border-top: solid 1px #333333;"><euc:EformRadioButtonGroup Table="Toxicities" Field="ToxGrade" id="ToxGrade_Pain" RecordId="20" GroupName="Pain" runat="server"
			Field1="ToxCategory" Value1="General disorders and administration site conditions"
			Field2="ToxName" Value2="Pain" Field3="ToxScale" Value3="CTC/AE 4.0">
        <span><span><euc:EformRadioButton Id="Pain0" Value="0" runat="server" ExpandClickableArea="False"/></span></span></td>
    <td class="ControlBoxLinedRows" align="center" style="border-top: solid 1px #333333;"><span><span><euc:EformRadioButton Id="Pain1" Value="1" runat="server" ExpandClickableArea="False"/></span></span></td>
    <td class="ControlBoxLinedRows" align="center" style="border-top: solid 1px #333333;"><span><span><euc:EformRadioButton Id="Pain2" Value="2" runat="server" ExpandClickableArea="False"/></span></span></td>
    <td class="ControlBoxLinedRows" align="center" style="border-top: solid 1px #333333;"><span><span><euc:EformRadioButton Id="Pain3" Value="3" runat="server" ExpandClickableArea="False"/></span></span></td>
    <td class="ControlBoxLinedRows" align="center" style="border-top: solid 1px #333333;"><span><span><euc:EformRadioButton Id="Pain4" Value="4" runat="server" ExpandClickableArea="False"/></span></span>
        </euc:EformRadioButtonGroup></td>
    <td class="ControlBoxLinedRows" style="border-top: solid 1px #333333;"><euc:EformHidden RecordId="20"  TABLE="Toxicities" FIELD="ToxDate" Runat="server" ID="ToxDate_Pain"/>
        <euc:EformTextBox RecordId="20" ShowCalendar="True" CalcDate="True" style="width:70px;" TABLE="Toxicities" FIELD="ToxDateText" Runat="server" ID="ToxDateText_Pain"/>    </td>
    <td class="ControlBoxLinedRows" style="border-top: solid 1px #333333;"><euc:EformHidden RecordId="20"  TABLE="Toxicities" FIELD="ToxStopDate" Runat="server" ID="ToxStopDate_Pain"/>
        <euc:EformTextBox RecordId="20" ShowCalendar="True" CalcDate="True" style="width:70px;" TABLE="Toxicities" FIELD="ToxStopDateText" Runat="server" ID="ToxStopDateText_Pain"/>    </td>
    <td class="ControlBoxLinedRows" style="border-top: solid 1px #333333;"><euc:EformTextBox RecordId="20" LookupCode="ToxProbability" DropDownWidth="280" TABLE="Toxicities" FIELD="ToxProbability" Runat="server" ID="ToxProbability_Pain" style="width: 52px;"/><euc:EformRelatedRecordWidget runat="server" RelatedTable="Toxicities" RelatedTableRecordId="20" RelatedFieldId="ToxProbability_Pain" RelatableTables="MedicalTherapy,RadiationTherapy,BrachyTherapy,Procedures,Comorbidities,Allergies" DefaultTable="MedicalTherapy" DefaultTitle="Pain"></euc:EformRelatedRecordWidget></td>
    <!--    <td class="ControlBoxLinedRows"><euc:EformSelect RecordId="20" LookupCode="RelatedTo" TABLE="Toxicities" FIELD="ToxRelatedTo" Runat="server" ID="ToxRelatedTo_Pain" style="width: 62px;"/></td>
-->    <td class="ControlBoxLinedRows" style="border-top: solid 1px #333333;"><euc:EformComboBox RecordId="20" LookupCode="ToxIntervention" RefBy="ToxIntervention" TABLE="Toxicities" FIELD="ToxIntervention" Runat="server" ID="ToxIntervention_Pain" style="width: 70px;"/></td>
    <td class="ControlBoxLinedRows" align="center" style="border-top: solid 1px #333333;"><img onclick="clearROSPainRow(this);" src="../../Images/EFormDeleteRow.gif" class="ROSDeleteButton"  /></td>
  </tr>
  <tr>
    <td colspan="2" class="ControlBoxLinedRowsShaded" style="border-top: none; border-bottom: none;" >&nbsp;</td>
    <td colspan="10" class="ControlBoxLinedRows" style="border-right: none; font-size:12px;  font-weight: bold;" ><euc:EformCheckBox id="PainOngoing" Table="NoTable" Field="PainOngoing" runat="server" value="Yes" text="Ongoing"  />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Severity <euc:EformSelect LookupCode="PainSeverity" DropDownWidth="60" DropDownHeight="auto" TABLE="NoTable" FIELD="PainSeverity" Runat="server" ID="PainSeverity" style="width: 30px;"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Relief <euc:EformSelect LookupCode="YesNoUnknown" DropDownWidth="70" DropDownHeight="auto" TABLE="NoTable" FIELD="PainRelief" Runat="server" ID="PainRelief" style="width: 62px;"/><br/>	</td>
    <td class="ControlBoxLinedRows" align="center">&nbsp;</td>
  </tr>
  <tr>
    <td colspan="2" class="ControlBoxLinedRowsShaded" style="border-top: none; border-bottom: solid 2px #333333; " >&nbsp;</td>
    <td colspan="10" class="ControlBoxLinedRows" style="border-right: none; font-size:12px;  font-weight: bold;border-bottom: solid 2px #333333;" >&nbsp;Comments <euc:EformTextBox RecordId="20" ShowCalendar="False" CalcDate="False" style="width:405px;" TABLE="Toxicities" FIELD="ToxNotes" ShowTextEditor="true" Runat="server" ID="ToxNotes_Pain"/>	</td>
    <td class="ControlBoxLinedRows" align="center" style="border-bottom: solid 2px #333333;">&nbsp;</td>
  </tr>
  
  
  
  
  
  <tr>
    <td valign="top" class="ControlBoxLinedRowsShaded" style="border-top: solid 1px #333333; border-bottom: none;border-right: none; "><strong>Pain</strong></td>
    <td valign="top" class="ControlBoxLinedRowsShaded" style="border-left: none; border-bottom: none;">Site: <euc:EformTextBox style="width:80px;" TABLE="NoTable" FIELD="PainLocation2" Runat="server" ID="PainLocation2" /></td>
    <td class="ControlBoxLinedRows" style="border-right: none; font-size: 10px; font-weight: bold;border-top: solid 1px #333333;" ><asp:Label ID="BaselineGrade_Pain2" runat="server">&nbsp;</asp:Label></td>
    <td class="ControlBoxLinedRows" align="center" style="border-top: solid 1px #333333;"><euc:EformRadioButtonGroup Table="Toxicities" Field="ToxGrade" id="ToxGrade_Pain2" RecordId="21" GroupName="Pain" runat="server"
			Field1="ToxCategory" Value1="General disorders and administration site conditions"
			Field2="ToxName" Value2="Pain" Field3="ToxScale" Value3="CTC/AE 4.0">
        <span><span><euc:EformRadioButton Id="Pain0_2" Value="0" runat="server" ExpandClickableArea="False"/></span></span></td>
    <td class="ControlBoxLinedRows" align="center" style="border-top: solid 1px #333333;"><span><span><euc:EformRadioButton Id="Pain1_2" Value="1" runat="server" ExpandClickableArea="False"/></span></span></td>
    <td class="ControlBoxLinedRows" align="center" style="border-top: solid 1px #333333;"><span><span><euc:EformRadioButton Id="Pain2_2" Value="2" runat="server" ExpandClickableArea="False"/></span></span></td>
    <td class="ControlBoxLinedRows" align="center" style="border-top: solid 1px #333333;"><span><span><euc:EformRadioButton Id="Pain3_2" Value="3" runat="server" ExpandClickableArea="False"/></span></span></td>
    <td class="ControlBoxLinedRows" align="center" style="border-top: solid 1px #333333;"><span><span><euc:EformRadioButton Id="Pain4_2" Value="4" runat="server" ExpandClickableArea="False"/></span></span>
        </euc:EformRadioButtonGroup></td>
    <td class="ControlBoxLinedRows" style="border-top: solid 1px #333333;"><euc:EformHidden RecordId="21"  TABLE="Toxicities" FIELD="ToxDate" Runat="server" ID="ToxDate_Pain2"/>
        <euc:EformTextBox RecordId="21" ShowCalendar="True" CalcDate="True" style="width:70px;" TABLE="Toxicities" FIELD="ToxDateText" Runat="server" ID="ToxDateText_Pain2"/>    </td>
    <td class="ControlBoxLinedRows" style="border-top: solid 1px #333333;"><euc:EformHidden RecordId="21"  TABLE="Toxicities" FIELD="ToxStopDate" Runat="server" ID="ToxStopDate_Pain2"/>
        <euc:EformTextBox RecordId="21" ShowCalendar="True" CalcDate="True" style="width:70px;" TABLE="Toxicities" FIELD="ToxStopDateText" Runat="server" ID="ToxStopDateText_Pain2"/>    </td>
    <td class="ControlBoxLinedRows" style="border-top: solid 1px #333333;"><euc:EformTextBox RecordId="21" LookupCode="ToxProbability" DropDownWidth="280" TABLE="Toxicities" FIELD="ToxProbability" Runat="server" ID="ToxProbability_Pain2" style="width: 52px;"/><euc:EformRelatedRecordWidget runat="server" RelatedTable="Toxicities" RelatedTableRecordId="21" RelatedFieldId="ToxProbability_Pain" RelatableTables="MedicalTherapy,RadiationTherapy,BrachyTherapy,Procedures,Comorbidities,Allergies" DefaultTable="MedicalTherapy" DefaultTitle="Pain"></euc:EformRelatedRecordWidget></td>
    <!--    <td class="ControlBoxLinedRows"><euc:EformSelect RecordId="21" LookupCode="RelatedTo" TABLE="Toxicities" FIELD="ToxRelatedTo" Runat="server" ID="ToxRelatedTo_Pain2" style="width: 62px;"/></td>
-->    <td class="ControlBoxLinedRows" style="border-top: solid 1px #333333;"><euc:EformComboBox RecordId="21" LookupCode="ToxIntervention" RefBy="ToxIntervention" TABLE="Toxicities" FIELD="ToxIntervention" Runat="server" ID="ToxIntervention_Pain2" style="width: 70px;"/></td>
    <td class="ControlBoxLinedRows" align="center" style="border-top: solid 1px #333333;"><img onclick="clearROSPainRow(this);" src="../../Images/EFormDeleteRow.gif" class="ROSDeleteButton"  /></td>
  </tr>
  <tr>
    <td colspan="2" class="ControlBoxLinedRowsShaded" style="border-top: none; border-bottom: none;" >&nbsp;</td>
    <td colspan="10" class="ControlBoxLinedRows" style="border-right: none; font-size:12px;  font-weight: bold;" ><euc:EformCheckBox id="PainOngoing2" Table="NoTable" Field="PainOngoing2" runat="server" value="Yes" text="Ongoing"  />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Severity <euc:EformSelect LookupCode="PainSeverity" DropDownWidth="60" DropDownHeight="auto" TABLE="NoTable" FIELD="PainSeverity2" Runat="server" ID="PainSeverity2" style="width: 30px;"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Relief <euc:EformSelect LookupCode="YesNoUnknown" DropDownWidth="70" DropDownHeight="auto" TABLE="NoTable" FIELD="PainRelief2" Runat="server" ID="PainRelief2" style="width: 62px;"/><br/>	</td>
    <td class="ControlBoxLinedRows" align="center">&nbsp;</td>
  </tr>
  <tr>
    <td colspan="2" class="ControlBoxLinedRowsShaded" style="border-top: none; border-bottom: solid 2px #333333; " >&nbsp;</td>
    <td colspan="10" class="ControlBoxLinedRows" style="border-right: none; font-size:12px;  font-weight: bold;border-bottom: solid 2px #333333;" >&nbsp;Comments <euc:EformTextBox RecordId="21" ShowCalendar="False" CalcDate="False" style="width:405px;" TABLE="Toxicities" FIELD="ToxNotes" ShowTextEditor="true" Runat="server" ID="ToxNotes_Pain2"/>	</td>
    <td class="ControlBoxLinedRows" align="center" style="border-bottom: solid 2px #333333;">&nbsp;</td>
  </tr>
  
  
  
  
  
  
  
  
  
  <tr>
    <td valign="top" colspan="2" class="ControlBoxLinedRowsShaded" style="border-top: solid 1px;" ><strong>Other:</strong></td>
    <td class="ControlBoxLinedRows" style="border-right: none; font-size: 10px; font-weight: bold;" >&nbsp;</td>
<!--    <td class="ControlBoxLinedRows" align="center">&nbsp;</td>
    <td class="ControlBoxLinedRows" align="center">&nbsp;</td>
    <td class="ControlBoxLinedRows" align="center">&nbsp;</td>
    <td class="ControlBoxLinedRows" align="center">&nbsp;</td>
    <td class="ControlBoxLinedRows" align="center">&nbsp;</td>
    <td class="ControlBoxLinedRows">&nbsp;</td>
    <td class="ControlBoxLinedRows">&nbsp;</td>
    <td class="ControlBoxLinedRows">&nbsp;</td>
        <td class="ControlBoxLinedRows">&nbsp;</td>
-->    <td colspan="9" class="ControlBoxLinedRows">&nbsp;</td>
    <td class="ControlBoxLinedRows" align="center">&nbsp;</td>
  </tr>
  
  
  
  
  
  
  <tr>
    <td valign="top" class="ControlBoxLinedRowsShaded">&nbsp;</td>
    <td valign="top" class="ControlBoxLinedRowsShaded">Fasting</td>
    <td class="ControlBoxLinedRows" style="border-right: none; font-size: 10px; font-weight: bold;" ><asp:Label ID="BaselineGrade_Fasting" runat="server">&nbsp;</asp:Label></td>
    <td class="ControlBoxLinedRows" colspan="2" style="border-right: none;" ><euc:EformRadioButtonGroup Table="Toxicities" Field="ToxNotes" id="ToxNotes_Fasting" RecordId="22" GroupName="Fasting" runat="server" Field1="ToxCategory" Value1="Other" Field2="ToxName" Value2="Fasting" Field3="ToxScale" Value3="CTC/AE 4.0" >
        <euc:EformRadioButton Id="ToxNotes_Fasting_Yes" Value="Yes" runat="server" ExpandClickableArea="False"/>Yes</td>
    <td class="ControlBoxLinedRows"  colspan="7"><euc:EformRadioButton Id="ToxNotes_Fasting_No" Value="No" runat="server" ExpandClickableArea="False"/>No</euc:EformRadioButtonGroup></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server"   /></td>
  </tr>
  
<%--
  <tr>
    <td valign="top" class="ControlBoxLinedRowsShaded" style="border-bottom: none; border-top: solid 1px;" ><euc:EformComboBox  LookupCode="ToxCategory"  RefBy="ToxCategory"  RecordId="22" TABLE="Toxicities" FIELD="ToxCategory" Runat="server" ID="ToxCategory_Other1" style="width: 50px;"/></td>
    <td valign="top" class="ControlBoxLinedRowsShaded"><euc:EformComboBox  LookupCode="Toxicity"  RefBy="Toxicity"  RecordId="22" TABLE="Toxicities" FIELD="ToxName" Runat="server" ID="ToxName_Other1" style="width: 50px;"/></td>
    <td class="ControlBoxLinedRows" style="border-right: none; font-size: 10px; font-weight: bold;" >&nbsp;</td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButtonGroup Table="Toxicities" Field="ToxGrade" id="ToxGrade_Other1" RecordId="22" GroupName="Other1" runat="server">
        <span><span><euc:EformRadioButton Id="Other1_0" Value="0" runat="server" ExpandClickableArea="False"/></span></span>    </td>
    <td class="ControlBoxLinedRows" align="center"><span><span><euc:EformRadioButton Id="Other1_1" Value="1" runat="server" ExpandClickableArea="False"/></span></span></td>
    <td class="ControlBoxLinedRows" align="center"><span><span><euc:EformRadioButton Id="Other1_2" Value="2" runat="server" ExpandClickableArea="False"/></span></span></td>
    <td class="ControlBoxLinedRows" align="center"><span><span><euc:EformRadioButton Id="Other1_3" Value="3" runat="server" ExpandClickableArea="False"/></span></span></td>
    <td class="ControlBoxLinedRows" align="center"><span><span><euc:EformRadioButton Id="Other1_4" Value="4" runat="server" ExpandClickableArea="False"/></span></span>
        </euc:EformRadioButtonGroup></td>
    <td class="ControlBoxLinedRows"><euc:EformHidden RecordId="22"  TABLE="Toxicities" FIELD="ToxDate" Runat="server" ID="ToxDate_Other1"/>
        <euc:EformTextBox RecordId="22" ShowCalendar="True" CalcDate="True" style="width:70px;" TABLE="Toxicities" FIELD="ToxDateText" Runat="server" ID="ToxDateText_Other1"/>    </td>
    <td class="ControlBoxLinedRows"><euc:EformHidden RecordId="22"  TABLE="Toxicities" FIELD="ToxStopDate" Runat="server" ID="ToxStopDate_Other1"/>
        <euc:EformTextBox RecordId="22" ShowCalendar="True" CalcDate="True" style="width:70px;" TABLE="Toxicities" FIELD="ToxStopDateText" Runat="server" ID="ToxStopDateText_Other1"/>    </td>
    <td class="ControlBoxLinedRows"><euc:EformTextBox RecordId="22" LookupCode="ToxProbability" DropDownWidth="280" TABLE="Toxicities" FIELD="ToxProbability" Runat="server" ID="ToxProbability_Other1" style="width: 52px;"/><euc:EformRelatedRecordWidget runat="server" RelatedTable="Toxicities" RelatedTableRecordId="22" RelatedFieldId="ToxProbability_Other1" RelatableTables="MedicalTherapy,RadiationTherapy,BrachyTherapy,Procedures,Comorbidities,Allergies" DefaultTable="MedicalTherapy" DefaultTitle="Toxicity"></euc:EformRelatedRecordWidget></td>
    <!--    <td class="ControlBoxLinedRows"><euc:EformSelect RecordId="22" LookupCode="RelatedTo" TABLE="Toxicities" FIELD="ToxRelatedTo" Runat="server" ID="ToxRelatedTo_Other1" style="width: 62px;"/></td>
-->    <td class="ControlBoxLinedRows"><euc:EformComboBox RecordId="22" LookupCode="ToxIntervention" RefBy="ToxIntervention" TABLE="Toxicities" FIELD="ToxIntervention" Runat="server" ID="ToxIntervention_Other1" style="width: 70px;"/></td>
    <td class="ControlBoxLinedRows" align="center"><img onclick="clearROSRow(this);" src="../../Images/EFormDeleteRow.gif" class="ROSDeleteButton"  /></td>
  </tr>
  <tr id="ToxNotesRow_22" style="display: none;">
    <td valign="top" class="ControlBoxLinedRowsShaded" style="border-bottom: none;">&nbsp;</td>
    <td valign="top" class="ControlBoxLinedRowsShaded">&nbsp;</td>
    <td colspan="10"  class="FormInsideTableRegCell" style="border-right: none; font-size: 12px; font-weight: bold; padding: 4px 4px 4px 6px;">Comments: <euc:EformTextBox RecordId="22" ShowCalendar="False" CalcDate="False" style="width:405px;" TABLE="Toxicities" FIELD="ToxNotes" ShowTextEditor="true" Runat="server" ID="ToxNotes_Other1"/></td>

    <td class="ControlBoxLinedRows" align="center">&nbsp;</td>
  </tr>
 --%>
  
  
  
  
  
  
  
  
  
  
  <tr>
    <td valign="top" class="ControlBoxLinedRowsShaded" style="border-bottom: none; border-top: solid 1px;" ><euc:EformComboBox  LookupCode="ToxCategory"  RefBy="ToxCategory"  RecordId="23" TABLE="Toxicities" FIELD="ToxCategory" Runat="server" ID="ToxCategory_Other2" style="width: 50px;"/></td>
    <td valign="top" class="ControlBoxLinedRowsShaded"><euc:EformComboBox  LookupCode="Toxicity"  RefBy="Toxicity"  RecordId="23" TABLE="Toxicities" FIELD="ToxName" Runat="server" ID="ToxName_Other2" style="width: 50px;"/></td>
    <td class="ControlBoxLinedRows" style="border-right: none; font-size: 10px; font-weight: bold;" >&nbsp;</td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButtonGroup Table="Toxicities" Field="ToxGrade" id="ToxGrade_Other2" RecordId="23" GroupName="Other2" runat="server">
        <span><span><euc:EformRadioButton Id="Other2_0" Value="0" runat="server" ExpandClickableArea="False"/></span></span></td>
    <td class="ControlBoxLinedRows" align="center"><span><span><euc:EformRadioButton Id="Other2_1" Value="1" runat="server" ExpandClickableArea="False"/></span></span></td>
    <td class="ControlBoxLinedRows" align="center"><span><span><euc:EformRadioButton Id="Other2_2" Value="2" runat="server" ExpandClickableArea="False"/></span></span></td>
    <td class="ControlBoxLinedRows" align="center"><span><span><euc:EformRadioButton Id="Other2_3" Value="3" runat="server" ExpandClickableArea="False"/></span></span></td>
    <td class="ControlBoxLinedRows" align="center"><span><span><euc:EformRadioButton Id="Other2_4" Value="4" runat="server" ExpandClickableArea="False"/></span></span>
        </euc:EformRadioButtonGroup></td>
    <td class="ControlBoxLinedRows"><euc:EformHidden RecordId="23"  TABLE="Toxicities" FIELD="ToxDate" Runat="server" ID="ToxDate_Other2"/>
        <euc:EformTextBox RecordId="23" ShowCalendar="True" CalcDate="True" style="width:70px;" TABLE="Toxicities" FIELD="ToxDateText" Runat="server" ID="ToxDateText_Other2"/>    </td>
    <td class="ControlBoxLinedRows"><euc:EformHidden RecordId="23"  TABLE="Toxicities" FIELD="ToxStopDate" Runat="server" ID="ToxStopDate_Other2"/>
        <euc:EformTextBox RecordId="23" ShowCalendar="True" CalcDate="True" style="width:70px;" TABLE="Toxicities" FIELD="ToxStopDateText" Runat="server" ID="ToxStopDateText_Other2"/>    </td>
    <td class="ControlBoxLinedRows"><euc:EformTextBox RecordId="23" LookupCode="ToxProbability" DropDownWidth="280" TABLE="Toxicities" FIELD="ToxProbability" Runat="server" ID="ToxProbability_Other2" style="width: 52px;"/><euc:EformRelatedRecordWidget runat="server" RelatedTable="Toxicities" RelatedTableRecordId="23" RelatedFieldId="ToxProbability_Other2" RelatableTables="MedicalTherapy,RadiationTherapy,BrachyTherapy,Procedures,Comorbidities,Allergies" DefaultTable="MedicalTherapy" DefaultTitle="Toxicity"></euc:EformRelatedRecordWidget></td>
    <!--    <td class="ControlBoxLinedRows"><euc:EformSelect RecordId="23" LookupCode="RelatedTo" TABLE="Toxicities" FIELD="ToxRelatedTo" Runat="server" ID="ToxRelatedTo_Other2" style="width: 62px;"/></td>
-->    <td class="ControlBoxLinedRows"><euc:EformComboBox RecordId="23" LookupCode="ToxIntervention" RefBy="ToxIntervention" TABLE="Toxicities" FIELD="ToxIntervention" Runat="server" ID="ToxIntervention_Other2" style="width: 70px;"/></td>
    <td class="ControlBoxLinedRows" align="center"><img onclick="clearROSRow(this);" src="../../Images/EFormDeleteRow.gif" class="ROSDeleteButton"  /></td>
  </tr>
  <tr id="ToxNotesRow_23" style="display: none;">
    <td valign="top" class="ControlBoxLinedRowsShaded" style="border-bottom: none;">&nbsp;</td>
    <td valign="top" class="ControlBoxLinedRowsShaded">&nbsp;</td>
    <td colspan="10"  class="FormInsideTableRegCell" style="border-right: none; font-size: 12px; font-weight: bold; padding: 4px 4px 4px 6px;">Comments: <euc:EformTextBox RecordId="23" ShowCalendar="False" CalcDate="False" style="width:405px;" TABLE="Toxicities" FIELD="ToxNotes" ShowTextEditor="true" Runat="server" ID="ToxNotes_Other2"/></td>
    <td class="ControlBoxLinedRows" align="center">&nbsp;</td>
  </tr>
  <tr>
    <td valign="top" class="ControlBoxLinedRowsShaded" style="border-bottom: none; border-top: solid 1px;" ><euc:EformComboBox  LookupCode="ToxCategory"  RefBy="ToxCategory"  RecordId="24" TABLE="Toxicities" FIELD="ToxCategory" Runat="server" ID="ToxCategory_Other3" style="width: 50px;"/></td>
    <td valign="top" class="ControlBoxLinedRowsShaded"><euc:EformComboBox  LookupCode="Toxicity"  RefBy="Toxicity"  RecordId="24" TABLE="Toxicities" FIELD="ToxName" Runat="server" ID="ToxName_Other3" style="width: 50px;"/></td>
    <td class="ControlBoxLinedRows" style="border-right: none; font-size: 10px; font-weight: bold;" >&nbsp;</td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButtonGroup Table="Toxicities" Field="ToxGrade" id="ToxGrade_Other3" RecordId="24" GroupName="Other3" runat="server">
        <span><span><euc:EformRadioButton Id="Other3_0" Value="0" runat="server" ExpandClickableArea="False"/></span></span></td>
    <td class="ControlBoxLinedRows" align="center"><span><span><euc:EformRadioButton Id="Other3_1" Value="1" runat="server" ExpandClickableArea="False"/></span></span></td>
    <td class="ControlBoxLinedRows" align="center"><span><span><euc:EformRadioButton Id="Other3_2" Value="2" runat="server" ExpandClickableArea="False"/></span></span></td>
    <td class="ControlBoxLinedRows" align="center"><span><span><euc:EformRadioButton Id="Other3_3" Value="3" runat="server" ExpandClickableArea="False"/></span></span></td>
    <td class="ControlBoxLinedRows" align="center"><span><span><euc:EformRadioButton Id="Other3_4" Value="4" runat="server" ExpandClickableArea="False"/></span></span>
        </euc:EformRadioButtonGroup></td>
    <td class="ControlBoxLinedRows"><euc:EformHidden RecordId="24"  TABLE="Toxicities" FIELD="ToxDate" Runat="server" ID="ToxDate_Other3"/>
        <euc:EformTextBox RecordId="24" ShowCalendar="True" CalcDate="True" style="width:70px;" TABLE="Toxicities" FIELD="ToxDateText" Runat="server" ID="ToxDateText_Other3"/>    </td>
    <td class="ControlBoxLinedRows"><euc:EformHidden RecordId="24"  TABLE="Toxicities" FIELD="ToxStopDate" Runat="server" ID="ToxStopDate_Other3"/>
        <euc:EformTextBox RecordId="24" ShowCalendar="True" CalcDate="True" style="width:70px;" TABLE="Toxicities" FIELD="ToxStopDateText" Runat="server" ID="ToxStopDateText_Other3"/>    </td>
    <td class="ControlBoxLinedRows"><euc:EformTextBox RecordId="24" LookupCode="ToxProbability" DropDownWidth="280" TABLE="Toxicities" FIELD="ToxProbability" Runat="server" ID="ToxProbability_Other3" style="width: 52px;"/><euc:EformRelatedRecordWidget runat="server" RelatedTable="Toxicities" RelatedTableRecordId="24" RelatedFieldId="ToxProbability_Other3" RelatableTables="MedicalTherapy,RadiationTherapy,BrachyTherapy,Procedures,Comorbidities,Allergies" DefaultTable="MedicalTherapy" DefaultTitle="Toxicity"></euc:EformRelatedRecordWidget></td>
    <!--    <td class="ControlBoxLinedRows"><euc:EformSelect RecordId="24" LookupCode="RelatedTo" TABLE="Toxicities" FIELD="ToxRelatedTo" Runat="server" ID="ToxRelatedTo_Other3" style="width: 62px;"/></td>
-->    <td class="ControlBoxLinedRows"><euc:EformComboBox RecordId="24" LookupCode="ToxIntervention" RefBy="ToxIntervention" TABLE="Toxicities" FIELD="ToxIntervention" Runat="server" ID="ToxIntervention_Other3" style="width: 70px;"/></td>
    <td class="ControlBoxLinedRows" align="center"><img onclick="clearROSRow(this);" src="../../Images/EFormDeleteRow.gif" class="ROSDeleteButton"  /></td>
  </tr>
  <tr id="ToxNotesRow_24" style="display: none;">
    <td valign="top" class="ControlBoxLinedRowsShaded" style="border-bottom: none;">&nbsp;</td>
    <td valign="top" class="ControlBoxLinedRowsShaded">&nbsp;</td>
    <td colspan="10"  class="FormInsideTableRegCell" style="border-right: none; font-size: 12px; font-weight: bold; padding: 4px 4px 4px 6px;">Comments: <euc:EformTextBox RecordId="24" ShowCalendar="False" CalcDate="False" style="width:405px;" TABLE="Toxicities" FIELD="ToxNotes" ShowTextEditor="true" Runat="server" ID="ToxNotes_Other3"/></td>
    <td class="ControlBoxLinedRows" align="center">&nbsp;</td>
  </tr>
  <tr>
    <td valign="top" class="ControlBoxLinedRowsShaded" style="border-bottom: none; border-top: solid 1px;" ><euc:EformComboBox  LookupCode="ToxCategory"  RefBy="ToxCategory"  RecordId="25" TABLE="Toxicities" FIELD="ToxCategory" Runat="server" ID="ToxCategory_Other4" style="width: 50px;"/></td>
    <td valign="top" class="ControlBoxLinedRowsShaded"><euc:EformComboBox  LookupCode="Toxicity"  RefBy="Toxicity"  RecordId="25" TABLE="Toxicities" FIELD="ToxName" Runat="server" ID="ToxName_Other4" style="width: 50px;"/></td>
    <td class="ControlBoxLinedRows" style="border-right: none; font-size: 10px; font-weight: bold;" >&nbsp;</td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButtonGroup Table="Toxicities" Field="ToxGrade" id="ToxGrade_Other4" RecordId="25" GroupName="Other4" runat="server">
        <span><span><euc:EformRadioButton Id="Other4_0" Value="0" runat="server" ExpandClickableArea="False"/></span></span></td>
    <td class="ControlBoxLinedRows" align="center"><span><span><euc:EformRadioButton Id="Other4_1" Value="1" runat="server" ExpandClickableArea="False"/></span></span></td>
    <td class="ControlBoxLinedRows" align="center"><span><span><euc:EformRadioButton Id="Other4_2" Value="2" runat="server" ExpandClickableArea="False"/></span></span></td>
    <td class="ControlBoxLinedRows" align="center"><span><span><euc:EformRadioButton Id="Other4_3" Value="3" runat="server" ExpandClickableArea="False"/></span></span></td>
    <td class="ControlBoxLinedRows" align="center"><span><span><euc:EformRadioButton Id="Other4_4" Value="4" runat="server" ExpandClickableArea="False"/></span></span>
        </euc:EformRadioButtonGroup></td>
    <td class="ControlBoxLinedRows"><euc:EformHidden RecordId="25"  TABLE="Toxicities" FIELD="ToxDate" Runat="server" ID="ToxDate_Other4"/>
        <euc:EformTextBox RecordId="25" ShowCalendar="True" CalcDate="True" style="width:70px;" TABLE="Toxicities" FIELD="ToxDateText" Runat="server" ID="ToxDateText_Other4"/>    </td>
    <td class="ControlBoxLinedRows"><euc:EformHidden RecordId="25"  TABLE="Toxicities" FIELD="ToxStopDate" Runat="server" ID="ToxStopDate_Other4"/>
        <euc:EformTextBox RecordId="25" ShowCalendar="True" CalcDate="True" style="width:70px;" TABLE="Toxicities" FIELD="ToxStopDateText" Runat="server" ID="ToxStopDateText_Other4"/>    </td>
    <td class="ControlBoxLinedRows"><euc:EformTextBox RecordId="25" LookupCode="ToxProbability" DropDownWidth="280" TABLE="Toxicities" FIELD="ToxProbability" Runat="server" ID="ToxProbability_Other4" style="width: 52px;"/><euc:EformRelatedRecordWidget runat="server" RelatedTable="Toxicities" RelatedTableRecordId="25" RelatedFieldId="ToxProbability_Other4" RelatableTables="MedicalTherapy,RadiationTherapy,BrachyTherapy,Procedures,Comorbidities,Allergies" DefaultTable="MedicalTherapy" DefaultTitle="Toxicity"></euc:EformRelatedRecordWidget></td>
    <!--    <td class="ControlBoxLinedRows"><euc:EformSelect RecordId="25" LookupCode="RelatedTo" TABLE="Toxicities" FIELD="ToxRelatedTo" Runat="server" ID="ToxRelatedTo_Other4" style="width: 62px;"/></td>
-->    <td class="ControlBoxLinedRows"><euc:EformComboBox RecordId="25" LookupCode="ToxIntervention" RefBy="ToxIntervention" TABLE="Toxicities" FIELD="ToxIntervention" Runat="server" ID="ToxIntervention_Other4" style="width: 70px;"/></td>
    <td class="ControlBoxLinedRows" align="center"><img onclick="clearROSRow(this);" src="../../Images/EFormDeleteRow.gif" class="ROSDeleteButton"  /></td>
  </tr>
  <tr id="ToxNotesRow_25" style="display: none;">
    <td valign="top" class="ControlBoxLinedRowsShaded" style="border-bottom: none;">&nbsp;</td>
    <td valign="top" class="ControlBoxLinedRowsShaded">&nbsp;</td>
    <td colspan="10"  class="FormInsideTableRegCell" style="border-right: none; font-size: 12px; font-weight: bold; padding: 4px 4px 4px 6px;">Comments: <euc:EformTextBox RecordId="25" ShowCalendar="False" CalcDate="False" style="width:405px;" TABLE="Toxicities" FIELD="ToxNotes" ShowTextEditor="true" Runat="server" ID="ToxNotes_Other4"/></td>
    <td class="ControlBoxLinedRows" align="center">&nbsp;</td>
  </tr>
  <tr>
    <td valign="top" class="ControlBoxLinedRowsShaded" style="border-bottom: none; border-top: solid 1px;" ><euc:EformComboBox  LookupCode="ToxCategory"  RefBy="ToxCategory"  RecordId="26" TABLE="Toxicities" FIELD="ToxCategory" Runat="server" ID="ToxCategory_Other5" style="width: 50px;"/></td>
    <td valign="top" class="ControlBoxLinedRowsShaded"><euc:EformComboBox  LookupCode="Toxicity"  RefBy="Toxicity"  RecordId="26" TABLE="Toxicities" FIELD="ToxName" Runat="server" ID="ToxName_Other5" style="width: 50px;"/></td>
    <td class="ControlBoxLinedRows" style="border-right: none; font-size: 10px; font-weight: bold;" >&nbsp;</td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButtonGroup Table="Toxicities" Field="ToxGrade" id="ToxGrade_Other5" RecordId="26" GroupName="Other5" runat="server">
        <span><span><euc:EformRadioButton Id="Other5_0" Value="0" runat="server" ExpandClickableArea="False"/></span></span></td>
    <td class="ControlBoxLinedRows" align="center"><span><span><euc:EformRadioButton Id="Other5_1" Value="1" runat="server" ExpandClickableArea="False"/></span></span></td>
    <td class="ControlBoxLinedRows" align="center"><span><span><euc:EformRadioButton Id="Other5_2" Value="2" runat="server" ExpandClickableArea="False"/></span></span></td>
    <td class="ControlBoxLinedRows" align="center"><span><span><euc:EformRadioButton Id="Other5_3" Value="3" runat="server" ExpandClickableArea="False"/></span></span></td>
    <td class="ControlBoxLinedRows" align="center"><span><span><euc:EformRadioButton Id="Other5_4" Value="4" runat="server" ExpandClickableArea="False"/></span></span>
        </euc:EformRadioButtonGroup></td>
    <td class="ControlBoxLinedRows"><euc:EformHidden RecordId="26"  TABLE="Toxicities" FIELD="ToxDate" Runat="server" ID="ToxDate_Other5"/>
        <euc:EformTextBox RecordId="26" ShowCalendar="True" CalcDate="True" style="width:70px;" TABLE="Toxicities" FIELD="ToxDateText" Runat="server" ID="ToxDateText_Other5"/>    </td>
    <td class="ControlBoxLinedRows"><euc:EformHidden RecordId="26"  TABLE="Toxicities" FIELD="ToxStopDate" Runat="server" ID="ToxStopDate_Other5"/>
        <euc:EformTextBox RecordId="26" ShowCalendar="True" CalcDate="True" style="width:70px;" TABLE="Toxicities" FIELD="ToxStopDateText" Runat="server" ID="ToxStopDateText_Other5"/>    </td>
    <td class="ControlBoxLinedRows"><euc:EformTextBox RecordId="26" LookupCode="ToxProbability" DropDownWidth="280" TABLE="Toxicities" FIELD="ToxProbability" Runat="server" ID="ToxProbability_Other5" style="width: 52px;"/><euc:EformRelatedRecordWidget runat="server" RelatedTable="Toxicities" RelatedTableRecordId="26" RelatedFieldId="ToxProbability_Other5" RelatableTables="MedicalTherapy,RadiationTherapy,BrachyTherapy,Procedures,Comorbidities,Allergies" DefaultTable="MedicalTherapy" DefaultTitle="Toxicity"></euc:EformRelatedRecordWidget></td>
    <!--    <td class="ControlBoxLinedRows"><euc:EformSelect RecordId="26" LookupCode="RelatedTo" TABLE="Toxicities" FIELD="ToxRelatedTo" Runat="server" ID="ToxRelatedTo_Other5" style="width: 62px;"/></td>
-->    <td class="ControlBoxLinedRows"><euc:EformComboBox RecordId="26" LookupCode="ToxIntervention" RefBy="ToxIntervention" TABLE="Toxicities" FIELD="ToxIntervention" Runat="server" ID="ToxIntervention_Other5" style="width: 70px;"/></td>
    <td class="ControlBoxLinedRows" align="center"><img onclick="clearROSRow(this);" src="../../Images/EFormDeleteRow.gif" class="ROSDeleteButton"  /></td>
  </tr>
  <tr id="ToxNotesRow_26" style="display: none;">
    <td valign="top" class="ControlBoxLinedRowsShaded" style="border-bottom: none;">&nbsp;</td>
    <td valign="top" class="ControlBoxLinedRowsShaded">&nbsp;</td>
    <td colspan="10"  class="FormInsideTableRegCell" style="border-right: none; font-size: 12px; font-weight: bold; padding: 4px 4px 4px 6px;">Comments: <euc:EformTextBox RecordId="26" ShowCalendar="False" CalcDate="False" style="width:405px;" TABLE="Toxicities" FIELD="ToxNotes" ShowTextEditor="true" Runat="server" ID="ToxNotes_Other5"/></td>
    <td class="ControlBoxLinedRows" align="center">&nbsp;</td>
  </tr>
</table>
<br/>
<br/>
<br/>

<div id="CTCHelpOuterContainer" >
    <div id="CTCHelpInnerContainer" >
        
    </div>
</div>


<%-- CTCAE Helpers --%>
<script type="text/javascript">

    $(window).addEvent('load', function(e) {
        // check if ctc values registered
        if (window.CTC_GRADE_LOOKUP) {
            for (var toxName in window.CTC_GRADE_LOOKUP) {
                var clientId = window.CTC_GRADE_LOOKUP[toxName];
                // get cell to trigger tooltip
                var cell = document.getElementById(clientId);
                // get div containing tooltip content
                var tooltip = document.getElementById(clientId + '_Tooltip');
                if (tooltip) {
                    // get tooltip text
                    var tooltipHTML = tooltip.innerHTML;
                    var j = 0;
                    // for each radio button in row, add hover event to parent cell
                    while (true) {
                        var radio = document.getElementById(clientId + '_' + toxName + j);
                        if (radio && radio.parentNode) {
                        
                            var cell = radio.parentNode;
                            var row = radio.parentNode.parentNode;
                            var icon = null;
                            
                            if (row.getElementsByTagName('span').length > 0) icon = row.getElementsByTagName('span')[0]
                            
                            if (iPad)
                            {
                                if (icon != null)
                                {
                                    $(icon).addEvent('click', curry(toggleCTCTooltipOnIcon, tooltipHTML, icon));
 //                                   $(icon).addEvent('mouseleave', curry(hideCTCTooltipOnIcon));
                                }
                            }
                            else
                            {
                                if (icon != null) icon.style.display = 'none';
                                $(cell).addEvent('mouseover', curry(showCTCTooltip, tooltipHTML, cell));
                                $(cell).addEvent('mouseleave', curry(hideCTCTooltip, cell));
                            }
                            
                        }
                        else {
                            break;
                        }
                        j++;
                    }
                }
            }
        }
    });

    function showCTCTooltip(text, cell) {
        cell.parentNode.style.backgroundColor = '#E7BDC8';
        

        var dataBubble = $('EFormInfoBubble');
        var dataBubbleContentContainer = $('EFormInfoBubbleContent');
        var parentHtmlTBody = cell.parentNode.parentNode;
        
        
        dataBubbleContentContainer.innerHTML = text;
        
        var scrollAdjustment = 0;
        if ($('PDFormDiv') != null) scrollAdjustment = $('PDFormDiv').scrollTop;
        
        dataBubble.style.top = ((findPos(cell).y - 66 - scrollAdjustment) + 'px');
        dataBubble.style.left = ((findPos(parentHtmlTBody).x - 0) + 'px');
        dataBubble.style.display = 'block';
    }


    function toggleCTCTooltipOnIcon(text, icon) {

        var dataBubble = $('EFormInfoBubble');
        var show = (icon.className != 'SAEInfoIconClose') ? true : false;

        if (show)
        {
            var dataBubbleContentContainer = $('EFormInfoBubbleContent');
            var parentHtmlTBody = icon.parentNode.parentNode.parentNode;
            
            dataBubbleContentContainer.innerHTML = text;
            
            var scrollAdjustment = 0;
            if ($('PDFormDiv') != null) scrollAdjustment = $('PDFormDiv').scrollTop;
            
            dataBubble.style.top = ((findPos(icon).y - 71 - scrollAdjustment) + 'px');
            dataBubble.style.left = ((findPos(parentHtmlTBody).x - 12) + 'px');
            dataBubble.style.display = 'block';
            
            icon.className = 'SAEInfoIconClose';
        }
        else { hideCTCTooltipOnIcon(); }
    }

	function hideCTCTooltipOnIcon()
	{
        var dataBubble = $('EFormInfoBubble');
        dataBubble.style.display = 'none';
        
        var ReviewOfSystemsSpans = ReviewOfSystemsHtmlTable.getElementsByTagName('span');
        
        if (ReviewOfSystemsSpans.length > 0)
        {
                for (var i=0;i<ReviewOfSystemsSpans.length;i++)
                {
                    if (ReviewOfSystemsSpans[i].className == 'SAEInfoIconClose') ReviewOfSystemsSpans[i].className = 'SAEInfoIcon';
                }
        }
	}



    function hideCTCTooltip(cell) {
//        $('CTCHelpOuterContainer').style.display = 'none';
//        $('CTCHelpOuterContainer').style.top = '0px';
        cell.parentNode.style.backgroundColor = '';
        var dataBubble = $('EFormInfoBubble');
        dataBubble.style.display = 'none';
        
        
    }

    
    function getOffsetPos( el ) {
        var _x = 0;
        var _y = 0;
        while( el && !isNaN( el.offsetLeft ) && !isNaN( el.offsetTop ) ) {
            _x += el.offsetLeft - el.scrollLeft;
            _y += el.offsetTop - el.scrollTop;
            el = el.offsetParent;
        }
        return { top: _y, left: _x };
    }
    

function addROSNotesFunctions()
{
    var container = $('ReviewOfSystemsHtmlTable');
    var inputs = container.getElementsByTagName('input');
    for (var i=0;i<inputs.length;i++)
    {
	    var inputType = inputs[i].getAttribute('type');
	    var inputID = inputs[i].getAttribute('id');
	    
	    if (inputType == 'radio' && inputID.indexOf('Potency') < 0)
	    {
             inputs[i].onclick = function() {setROSNotes(this)};
	    } 
    }
    
}
addROSNotesFunctions();

var PainRadioIDs = {'<% = Pain0.ClientID %>':'', '<% = Pain1.ClientID %>':'', '<% = Pain2.ClientID %>':'', '<% = Pain3.ClientID %>':'', '<% = Pain4.ClientID %>':'', '<% = Pain0_2.ClientID %>':'', '<% = Pain1_2.ClientID %>':'', '<% = Pain2_2.ClientID %>':'', '<% = Pain3_2.ClientID %>':'', '<% = Pain4_2.ClientID %>':''};


function setROSNotes(ROSRadio)
{
 var ROSTr = ROSRadio.parentNode.parentNode;
    if (ROSRadio.id.indexOf('Other') > -1) ROSTr = ROSTr.parentNode.parentNode;
    
	var ROSTrIndex = ROSTr.rowIndex;
	var ROSNotesTrIndex = ROSTrIndex+1;
	
	
	if (ROSRadio.id in PainRadioIDs) ROSNotesTrIndex += 1;
	
	var ROSNotesTr = $('ReviewOfSystemsHtmlTable').rows[ROSNotesTrIndex];

    var responseField = null;
    if (ROSNotesTr != null)
    {
        if (ROSRadio.checked == true) {ROSNotesTr.style.display = ''; } //&& ROSRadio.value.indexOf('0') < 0     <-- use this if no notes shown for grade of zero
	    else {clearAllElementsContainedInNode(ROSNotesTr); ROSNotesTr.style.display = 'none'; }    
	}
}
function clearROSRow(element) {
	var ROSTr = element.parentElement.parentElement;
	var ROSNotesTr = $('ReviewOfSystemsHtmlTable').rows[ROSTr.rowIndex+1];
	clearAllElementsContainedInNode(ROSTr);
	clearAllElementsContainedInNode(ROSNotesTr);
	ROSNotesTr.style.display = 'none'; 
}
function clearROSPainRow(element) {
	var ROSTr = element.parentElement.parentElement;
	var ROSNotesTr = $('ReviewOfSystemsHtmlTable').rows[ROSTr.rowIndex+1];
	var ROSNotesTr2 = $('ReviewOfSystemsHtmlTable').rows[ROSTr.rowIndex+2];
	clearAllElementsContainedInNode(ROSTr);
	clearAllElementsContainedInNode(ROSNotesTr);
	clearAllElementsContainedInNode(ROSNotesTr2);
}
function setAllROSNotes()
{
    var container = $('ReviewOfSystemsHtmlTable');
    var inputs = container.getElementsByTagName('input');
    for (var i=0;i<inputs.length;i++)
    {
	    
	    if (inputs[i].getAttribute('type') == 'radio' && inputs[i].checked == true && inputs[i].id.indexOf('Other') < 0)
	    {
	        var ROSTr = inputs[i].parentNode.parentNode;
	        
	        if (inputs[i].id.indexOf('Other') > -1) ROSTr = ROSTr.parentNode.parentNode;
	        
	        var ROSNotesTrIndex = ROSTr.rowIndex+1
	        if (inputs[i].id in PainRadioIDs) ROSNotesTrIndex += 1;
	        var ROSNotesTr = $('ReviewOfSystemsHtmlTable').rows[ROSNotesTrIndex];
	        
/*	        if (inputs[i].value.indexOf('0') < 0)
	        {
	            ROSNotesTr.style.display = '';
	        }
	        else
	        {
	            clearAllElementsContainedInNode(ROSNotesTr);
	            ROSNotesTr.style.display = 'none';
	        }
*/	        
            ROSNotesTr.style.display = '';
	        
	        
	        
	    }
    }
}


function checkRadioInsideNode(thisNode)
{
    var inputs = thisNode.getElementsByTagName('input');
    
    for (var i=0;i<inputs.length;i++)
    {
        if (inputs[i].getAttribute('type') == 'radio') inputs[i].checked = true;
    }
}

function attachCheckFunctionToTableCells()
{
    var ReviewOfSystemsHtmlTable = $('ReviewOfSystemsHtmlTable');
    var cells = ReviewOfSystemsHtmlTable.getElementsByTagName('td');
    
    for (var i=0;i<cells.length;i++)
    {
        var inputs = cells[i].getElementsByTagName('input');
        
        for (var j=0;j<inputs.length;j++)
        {
            if (inputs[j].getAttribute('type') == 'radio')
            {
                cells[i].onclick = function() {checkRadioInsideNode(this);}
                break;
            }
        }
        
    }
}
attachCheckFunctionToTableCells();
processROSPopulatedSystemLabels();
</script>

<asp:HiddenField runat="server" ID="CTCAEVersion" Value="CTC/AE 4.0" />
<asp:Repeater runat="server" ID="CTCAERptr" OnItemDataBound="BuildGradeByRadioGroup">
    <ItemTemplate>
        <div class="CTC_Tooltip_Container" id="<%# Eval("ClientId") %>_Tooltip">
                <table>
                <tr>
                    <td colspan="2" class="HPIRecordDetailsBubbleTitle">
                        <%# Eval("ToxName")%>
                    </td>
                </tr>
                    <asp:Repeater runat="server" ID="CTCAEGradeRptr">
                        <ItemTemplate>
                            <tr>
                                <td class="CTC_Tooltip_Grade">
                                    <%# Eval("Grade") %>
                                </td>
                                <td>
                                    <%# Eval("GradeDesc") %>
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </table>
        </div>
    </ItemTemplate>
</asp:Repeater>
