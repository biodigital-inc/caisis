<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Prostate.Eforms.BiopsyOfProstateMRI" CodeFile="BiopsyOfProstateMRI.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<%-- 
<!-- example table array populator -->
<script type="text/javascript">
	tableArray.TRUSMRIHtmlTable = 'TRUSMRIHtmlTable';
</script>
--%>
<style type="text/css">
table#TRUSMRIHtmlTable
{
    border-collapse: collapse;
}
table#TRUSMRIHtmlTable table
{
    border-collapse: collapse;
    width: 100%;
}
table#TRUSMRIHtmlTable td
{
    border: solid 1px #cccccc;
    padding: 3px 0px 3px 0px;
    text-align: center;
}
table#TRUSMRIHtmlTable td.DateCol { width: 100px; }
table#TRUSMRIHtmlTable td.StudyCol { width: 80px; }
table#TRUSMRIHtmlTable td.VolumeCol { width: 50px; }
table#TRUSMRIHtmlTable td.SideCol { width: 50px; }
table#TRUSMRIHtmlTable td.AreaCol { width: 60px; }
table#TRUSMRIHtmlTable td.LatCol { width: 50px; }
table#TRUSMRIHtmlTable td.APCol { width: 50px; }
table#TRUSMRIHtmlTable td.ZoneCol { width: 50px; }
table#TRUSMRIHtmlTable td.ResultCol { width: 100px; }
table#TRUSMRIHtmlTable td.ECECol { width: 50px; }

table#TRUSMRIHtmlTable td.imageFindingsContainerTd
{
    padding: 0 0 0 0;
}
table#TRUSMRIHtmlTable tr.ClinicalEformPopulatedRow td
{
    text-align: center;
}
table#TRUSMRIHtmlTable tr.ClinicalEformHighlightedRow td
{
    text-align: center;
}
table#TRUSMRIHtmlTable td.no-records
{
    padding: 30px;
    text-align: center;
    font-weight: bold;
}
</style>
<a name="BiopsyOfProstateMRI" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="MRI" style="margin-right: 40px;"></asp:Label><br/>
<table width="700" cellpadding="2" cellspacing="0" class="ClinicalEformTable" id="TRUSMRIHtmlTable">
  <tr> 
    <td class="controlBoxDataGridHeaderFirstCol DateCol">&nbsp;Date</td>
    <td class="controlBoxDataGridHeaderFirstCol StudyCol">Study</td>
    <td class="controlBoxDataGridHeaderFirstCol VolumeCol">Vol</td>
    <td class="controlBoxDataGridHeaderFirstCol SideCol">Side</td>
    <td class="controlBoxDataGridHeaderFirstCol AreaCol">Area</td>
    <td class="controlBoxDataGridHeaderFirstCol LatCol">Lat</td>
    <td class="controlBoxDataGridHeaderFirstCol APCol">AP</td>
    <td class="controlBoxDataGridHeaderFirstCol ZoneCol">Zone</td>
    <td class="controlBoxDataGridHeaderFirstCol ResultCol">Result</td>
    <td class="controlBoxDataGridHeaderFirstCol ECECol">ECE</td>
    <td class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
  </tr>
  <%-- 
  <tr id="NoImagesMsg" runat="server">
  <td class="no-records" colspan="11">No MRI, MRSI, or EMRI Records have been recorded.</td>
  </tr>
  --%>
  
  
  <asp:Repeater ID="images" runat="server" OnItemDataBound="EFormRepeaterOnDataBound"> 
	<ItemTemplate> 
		<tr class="ClinicalEformPopulatedRow" onmouseover="this.className='ClinicalEformHighlightedRow';" onmouseout="this.className='ClinicalEformPopulatedRow';" onclick="LoadDataEntryForm('Diagnostics', <%# DataBinder.Eval(Container.DataItem, "DiagnosticId") %>, 'DxDateText,DxDate,DxType,DxResult,DxNotes', 'Imaging', 'DxImageProstate,DxImageFindingsProstate');"> 
			<td class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "DxDateText") %></td>
		  <td  class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "DxType") %></td>
			<td  class="ClinicalEformPopulatedColumn">&nbsp;<asp:Literal ID="Volume" runat="server" /></td>
		  <td  class="ClinicalEformPopulatedColumn imageFindingsContainerTd" colspan="7">
          
  <asp:Repeater ID="imageFindings" runat="server" >
          <HeaderTemplate><table cellspacing="0"><%-- <tr>
            <td class="controlBoxDataGridHeaderFirstCol SideCol">Side</td>
            <td class="controlBoxDataGridHeaderFirstCol AreaCol">Area</td>
            <td class="controlBoxDataGridHeaderFirstCol LatCol">Lat</td>
            <td class="controlBoxDataGridHeaderFirstCol APCol">AP</td>
            <td class="controlBoxDataGridHeaderFirstCol ZoneCol">Zone</td>
            <td class="controlBoxDataGridHeaderFirstCol ResultCol">Result</td>
            <td class="controlBoxDataGridHeaderFirstCol ECECol">ECE</td>
            </tr>--%></HeaderTemplate>
              <ItemTemplate> 
              <tr> 
                <td class="SideCol"><%# DataBinder.Eval(Container.DataItem, "ImgFindSide") %></td>
                <td class="AreaCol"><%# DataBinder.Eval(Container.DataItem, "ImgFindLevel") %></td>
                <td class="LatCol"><%# DataBinder.Eval(Container.DataItem, "ImgFindLaterality") %></td>
                <td class="APCol"><%# DataBinder.Eval(Container.DataItem, "ImgFindAP") %></td>
                <td class="ZoneCol"><%# DataBinder.Eval(Container.DataItem, "ImgFindZone") %></td>
                <td class="ResultCol"><%# DataBinder.Eval(Container.DataItem, "ImgFindResult") %></td>
                <td class="ECECol"><%# DataBinder.Eval(Container.DataItem, "ImgFindExtension") %></td>
              </tr>
              </ItemTemplate>
        <FooterTemplate></table></FooterTemplate>
  </asp:Repeater>
          </td>
			<td class="ClinicalEformPopulatedColumn"><img align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="LockImage" runat="server" title="This record has been locked.">&nbsp;</td>
		</tr>      
	</ItemTemplate>
  </asp:Repeater>

  
  


  <tr> 
    <td class="ClinicalEformGridColumnOne" style="vertical-align: top;"><euc:EformTextBox Runat="server" RecordId="1"  ID="DxDateText_1" TABLE="Diagnostics" FIELD="DxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  /><euc:EformHidden RecordId="1" Runat="server" ID="DxDate_1" Table="Diagnostics" Field="DxDate"></euc:EformHidden></td><td style="vertical-align: top;"><euc:EformComboBox DropDownWidth="90" DropDownHeight="auto"  RecordId="1" LookupCode="DxType_ProstateBiopsyEform" TABLE="Diagnostics" FIELD="DxType"  style="width: 44px" Runat="server" ID="DxType_1"/></td>
    <td  style="vertical-align: top;"><euc:EformTextBox RecordId="1" style="width:36px;" TABLE="DxImageProstate" FIELD="ImgProstateVolume" Runat="server" ID="ImgProstateVolume_1"/></td>
    <td colspan="7" class="imageFindingsContainerTd">
        <table cellspacing="0">
        <tr>
    <td  style="vertical-align: top;"><euc:EformDropDownList LookupCode="ProstateSide" ParentRecordId="1" RecordId="1" ShowCalendar="False" CalcDate="False" style="width:50px;" TABLE="DxImageFindingsProstate" FIELD="ImgFindSide" Runat="server" ID="ImgFindSide_1_1"/></td>
    <td  style="vertical-align: top;"><euc:EformDropDownList LookupCode="ProstateLevel" ParentRecordId="1" RecordId="1" ShowCalendar="False" CalcDate="False" style="width:50px;" TABLE="DxImageFindingsProstate" FIELD="ImgFindLevel" Runat="server" ID="ImgFindLevel_1_1"/></td>
    <td  style="vertical-align: top;"><euc:EformDropDownList LookupCode="Laterality" ParentRecordId="1" RecordId="1" ShowCalendar="False" CalcDate="False" style="width:50px;" TABLE="DxImageFindingsProstate" FIELD="ImgFindLaterality" Runat="server" ID="ImgFindLaterality_1_1"/></td>
    <td  style="vertical-align: top;"><euc:EformDropDownList LookupCode="AP" ParentRecordId="1" RecordId="1" ShowCalendar="False" CalcDate="False" style="width:50px;" TABLE="DxImageFindingsProstate" FIELD="ImgFindAP" Runat="server" ID="ImgFindAP_1_1"/></td>
    <td  style="vertical-align: top;"><euc:EformDropDownList LookupCode="ProstateZone" ParentRecordId="1" RecordId="1" ShowCalendar="False" CalcDate="False" style="width:50px;" TABLE="DxImageFindingsProstate" FIELD="ImgFindZone" Runat="server" ID="ImgFindZone_1_1"/></td>
    <td style="white-space: nowrap;vertical-align: top;"><euc:EformComboBox DropDownWidth="200" DropDownHeight="auto"  LookupCode="DxResult_ProstateBiopsyEform" style="width:70px;" Field="ImgFindResult" ParentRecordId="1" RecordId="1" Table="DxImageFindingsProstate" Runat="server" id="ImgFindResult_1_1"  /></td>
    <td  style="vertical-align: top;"><euc:EformDropDownList LookupCode="YesNoUnknown" ParentRecordId="1" RecordId="1" ShowCalendar="False" CalcDate="False" style="width:50px;" TABLE="DxImageFindingsProstate" FIELD="ImgFindExtension" Runat="server" ID="ImgFindExtension_1_1"/></td>
    </tr>
        <tr>
    <td  style="vertical-align: top;"><euc:EformDropDownList LookupCode="ProstateSide" ParentRecordId="1" RecordId="2" ShowCalendar="False" CalcDate="False" style="width:50px;" TABLE="DxImageFindingsProstate" FIELD="ImgFindSide" Runat="server" ID="ImgFindSide_1_2"/></td>
    <td  style="vertical-align: top;"><euc:EformDropDownList LookupCode="ProstateLevel" ParentRecordId="1" RecordId="2" ShowCalendar="False" CalcDate="False" style="width:50px;" TABLE="DxImageFindingsProstate" FIELD="ImgFindLevel" Runat="server" ID="ImgFindLevel_1_2"/></td>
    <td  style="vertical-align: top;"><euc:EformDropDownList LookupCode="Laterality" ParentRecordId="1" RecordId="2" ShowCalendar="False" CalcDate="False" style="width:50px;" TABLE="DxImageFindingsProstate" FIELD="ImgFindLaterality" Runat="server" ID="ImgFindLaterality_1_2"/></td>
    <td  style="vertical-align: top;"><euc:EformDropDownList LookupCode="AP" ParentRecordId="1" RecordId="2" ShowCalendar="False" CalcDate="False" style="width:50px;" TABLE="DxImageFindingsProstate" FIELD="ImgFindAP" Runat="server" ID="ImgFindAP_1_2"/></td>
    <td  style="vertical-align: top;"><euc:EformDropDownList LookupCode="ProstateZone" ParentRecordId="1" RecordId="2" ShowCalendar="False" CalcDate="False" style="width:50px;" TABLE="DxImageFindingsProstate" FIELD="ImgFindZone" Runat="server" ID="ImgFindZone_1_2"/></td>
    <td style="white-space: nowrap;vertical-align: top;"><euc:EformComboBox DropDownWidth="200" DropDownHeight="auto"  LookupCode="DxResult_ProstateBiopsyEform" style="width:70px;" Field="ImgFindResult" ParentRecordId="1" RecordId="2" Table="DxImageFindingsProstate" Runat="server" id="ImgFindResult_1_2"  /></td>
    <td  style="vertical-align: top;"><euc:EformDropDownList LookupCode="YesNoUnknown" ParentRecordId="1" RecordId="2" ShowCalendar="False" CalcDate="False" style="width:50px;" TABLE="DxImageFindingsProstate" FIELD="ImgFindExtension" Runat="server" ID="ImgFindExtension_1_2"/></td>
    </tr>
        <tr>
    <td  style="vertical-align: top;"><euc:EformDropDownList LookupCode="ProstateSide" ParentRecordId="1" RecordId="3" ShowCalendar="False" CalcDate="False" style="width:50px;" TABLE="DxImageFindingsProstate" FIELD="ImgFindSide" Runat="server" ID="ImgFindSide_1_3"/></td>
    <td  style="vertical-align: top;"><euc:EformDropDownList LookupCode="ProstateLevel" ParentRecordId="1" RecordId="3" ShowCalendar="False" CalcDate="False" style="width:50px;" TABLE="DxImageFindingsProstate" FIELD="ImgFindLevel" Runat="server" ID="ImgFindLevel_1_3"/></td>
    <td  style="vertical-align: top;"><euc:EformDropDownList LookupCode="Laterality" ParentRecordId="1" RecordId="3" ShowCalendar="False" CalcDate="False" style="width:50px;" TABLE="DxImageFindingsProstate" FIELD="ImgFindLaterality" Runat="server" ID="ImgFindLaterality_1_3"/></td>
    <td  style="vertical-align: top;"><euc:EformDropDownList LookupCode="AP" ParentRecordId="1" RecordId="3" ShowCalendar="False" CalcDate="False" style="width:50px;" TABLE="DxImageFindingsProstate" FIELD="ImgFindAP" Runat="server" ID="ImgFindAP_1_3"/></td>
    <td  style="vertical-align: top;"><euc:EformDropDownList LookupCode="ProstateZone" ParentRecordId="1" RecordId="3" ShowCalendar="False" CalcDate="False" style="width:50px;" TABLE="DxImageFindingsProstate" FIELD="ImgFindZone" Runat="server" ID="ImgFindZone_1_3"/></td>
    <td style="white-space: nowrap;vertical-align: top;"><euc:EformComboBox DropDownWidth="200" DropDownHeight="auto"  LookupCode="DxResult_ProstateBiopsyEform" style="width:70px;" Field="ImgFindResult" ParentRecordId="1" RecordId="3" Table="DxImageFindingsProstate" Runat="server" id="ImgFindResult_1_3"  /></td>
    <td  style="vertical-align: top;"><euc:EformDropDownList LookupCode="YesNoUnknown" ParentRecordId="1" RecordId="3" ShowCalendar="False" CalcDate="False" style="width:50px;" TABLE="DxImageFindingsProstate" FIELD="ImgFindExtension" Runat="server" ID="ImgFindExtension_1_3"/></td>
    </tr>
        <tr>
    <td  style="vertical-align: top;"><euc:EformDropDownList LookupCode="ProstateSide" ParentRecordId="1" RecordId="4" ShowCalendar="False" CalcDate="False" style="width:50px;" TABLE="DxImageFindingsProstate" FIELD="ImgFindSide" Runat="server" ID="ImgFindSide_1_4"/></td>
    <td  style="vertical-align: top;"><euc:EformDropDownList LookupCode="ProstateLevel" ParentRecordId="1" RecordId="4" ShowCalendar="False" CalcDate="False" style="width:50px;" TABLE="DxImageFindingsProstate" FIELD="ImgFindLevel" Runat="server" ID="ImgFindLevel_1_4"/></td>
    <td  style="vertical-align: top;"><euc:EformDropDownList LookupCode="Laterality" ParentRecordId="1" RecordId="4" ShowCalendar="False" CalcDate="False" style="width:50px;" TABLE="DxImageFindingsProstate" FIELD="ImgFindLaterality" Runat="server" ID="ImgFindLaterality_1_4"/></td>
    <td  style="vertical-align: top;"><euc:EformDropDownList LookupCode="AP" ParentRecordId="1" RecordId="4" ShowCalendar="False" CalcDate="False" style="width:50px;" TABLE="DxImageFindingsProstate" FIELD="ImgFindAP" Runat="server" ID="ImgFindAP_1_4"/></td>
    <td  style="vertical-align: top;"><euc:EformDropDownList LookupCode="ProstateZone" ParentRecordId="1" RecordId="4" ShowCalendar="False" CalcDate="False" style="width:50px;" TABLE="DxImageFindingsProstate" FIELD="ImgFindZone" Runat="server" ID="ImgFindZone_1_4"/></td>
    <td style="white-space: nowrap;vertical-align: top;"><euc:EformComboBox DropDownWidth="200" DropDownHeight="auto"  LookupCode="DxResult_ProstateBiopsyEform" style="width:70px;" Field="ImgFindResult" ParentRecordId="1" RecordId="4" Table="DxImageFindingsProstate" Runat="server" id="ImgFindResult_1_4"  /></td>
    <td  style="vertical-align: top;"><euc:EformDropDownList LookupCode="YesNoUnknown" ParentRecordId="1" RecordId="4" ShowCalendar="False" CalcDate="False" style="width:50px;" TABLE="DxImageFindingsProstate" FIELD="ImgFindExtension" Runat="server" ID="ImgFindExtension_1_4"/></td>
    </tr>
        <tr>
    <td  style="vertical-align: top;"><euc:EformDropDownList LookupCode="ProstateSide" ParentRecordId="1" RecordId="5" ShowCalendar="False" CalcDate="False" style="width:50px;" TABLE="DxImageFindingsProstate" FIELD="ImgFindSide" Runat="server" ID="ImgFindSide_1_5"/></td>
    <td  style="vertical-align: top;"><euc:EformDropDownList LookupCode="ProstateLevel" ParentRecordId="1" RecordId="5" ShowCalendar="False" CalcDate="False" style="width:50px;" TABLE="DxImageFindingsProstate" FIELD="ImgFindLevel" Runat="server" ID="ImgFindLevel_1_5"/></td>
    <td  style="vertical-align: top;"><euc:EformDropDownList LookupCode="Laterality" ParentRecordId="1" RecordId="5" ShowCalendar="False" CalcDate="False" style="width:50px;" TABLE="DxImageFindingsProstate" FIELD="ImgFindLaterality" Runat="server" ID="ImgFindLaterality_1_5"/></td>
    <td  style="vertical-align: top;"><euc:EformDropDownList LookupCode="AP" ParentRecordId="1" RecordId="5" ShowCalendar="False" CalcDate="False" style="width:50px;" TABLE="DxImageFindingsProstate" FIELD="ImgFindAP" Runat="server" ID="ImgFindAP_1_5"/></td>
    <td  style="vertical-align: top;"><euc:EformDropDownList LookupCode="ProstateZone" ParentRecordId="1" RecordId="5" ShowCalendar="False" CalcDate="False" style="width:50px;" TABLE="DxImageFindingsProstate" FIELD="ImgFindZone" Runat="server" ID="ImgFindZone_1_5"/></td>
    <td style="white-space: nowrap;vertical-align: top;"><euc:EformComboBox DropDownWidth="200" DropDownHeight="auto"  LookupCode="DxResult_ProstateBiopsyEform" style="width:70px;" Field="ImgFindResult" ParentRecordId="1" RecordId="5" Table="DxImageFindingsProstate" Runat="server" id="ImgFindResult_1_5"  /></td>
    <td  style="vertical-align: top;"><euc:EformDropDownList LookupCode="YesNoUnknown" ParentRecordId="1" RecordId="5" ShowCalendar="False" CalcDate="False" style="width:50px;" TABLE="DxImageFindingsProstate" FIELD="ImgFindExtension" Runat="server" ID="ImgFindExtension_1_5"/></td>
    </tr>
        </table>
    </td>
    <td style="vertical-align: top;"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  
  <tr style="display: none;"> 
    <td class="ClinicalEformGridColumnOne" style="vertical-align: top;"><euc:EformTextBox Runat="server" RecordId="2"  ID="DxDateText_2" TABLE="Diagnostics" FIELD="DxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  /><euc:EformHidden RecordId="2" Runat="server" ID="DxDate_2" Table="Diagnostics" Field="DxDate"></euc:EformHidden></td><td style="vertical-align: top;"><euc:EformComboBox DropDownWidth="90" DropDownHeight="auto"  RecordId="2" LookupCode="DxType_ProstateBiopsyEform" TABLE="Diagnostics" FIELD="DxType"  style="width: 44px" Runat="server" ID="DxType_2"/></td>
    <td  style="vertical-align: top;"><euc:EformTextBox RecordId="2" style="width:36px;" TABLE="DxImageProstate" FIELD="ImgProstateVolume" Runat="server" ID="ImgProstateVolume_2"/></td>
    <td colspan="7" class="imageFindingsContainerTd">
        <table cellspacing="0">
        <tr>
    <td  style="vertical-align: top;"><euc:EformDropDownList LookupCode="ProstateSide" ParentRecordId="2" RecordId="1" ShowCalendar="False" CalcDate="False" style="width:50px;" TABLE="DxImageFindingsProstate" FIELD="ImgFindSide" Runat="server" ID="ImgFindSide_2_1"/></td>
    <td  style="vertical-align: top;"><euc:EformDropDownList LookupCode="ProstateLevel" ParentRecordId="2" RecordId="1" ShowCalendar="False" CalcDate="False" style="width:50px;" TABLE="DxImageFindingsProstate" FIELD="ImgFindLevel" Runat="server" ID="ImgFindLevel_2_1"/></td>
    <td  style="vertical-align: top;"><euc:EformDropDownList LookupCode="Laterality" ParentRecordId="2" RecordId="1" ShowCalendar="False" CalcDate="False" style="width:50px;" TABLE="DxImageFindingsProstate" FIELD="ImgFindLaterality" Runat="server" ID="ImgFindLaterality_2_1"/></td>
    <td  style="vertical-align: top;"><euc:EformDropDownList LookupCode="AP" ParentRecordId="2" RecordId="1" ShowCalendar="False" CalcDate="False" style="width:50px;" TABLE="DxImageFindingsProstate" FIELD="ImgFindAP" Runat="server" ID="ImgFindAP_2_1"/></td>
    <td  style="vertical-align: top;"><euc:EformDropDownList LookupCode="ProstateZone" ParentRecordId="2" RecordId="1" ShowCalendar="False" CalcDate="False" style="width:50px;" TABLE="DxImageFindingsProstate" FIELD="ImgFindZone" Runat="server" ID="ImgFindZone_2_1"/></td>
    <td style="white-space: nowrap;vertical-align: top;"><euc:EformComboBox DropDownWidth="200" DropDownHeight="auto"  LookupCode="DxResult_ProstateBiopsyEform" style="width:70px;" Field="ImgFindResult" ParentRecordId="2" RecordId="1" Table="DxImageFindingsProstate" Runat="server" id="ImgFindResult_2_1"  /></td>
    <td  style="vertical-align: top;"><euc:EformDropDownList LookupCode="YesNoUnknown" ParentRecordId="2" RecordId="1" ShowCalendar="False" CalcDate="False" style="width:50px;" TABLE="DxImageFindingsProstate" FIELD="ImgFindExtension" Runat="server" ID="ImgFindExtension_2_1"/></td>
    </tr>
        <tr>
    <td  style="vertical-align: top;"><euc:EformDropDownList LookupCode="ProstateSide" ParentRecordId="2" RecordId="2" ShowCalendar="False" CalcDate="False" style="width:50px;" TABLE="DxImageFindingsProstate" FIELD="ImgFindSide" Runat="server" ID="ImgFindSide_2_2"/></td>
    <td  style="vertical-align: top;"><euc:EformDropDownList LookupCode="ProstateLevel" ParentRecordId="2" RecordId="2" ShowCalendar="False" CalcDate="False" style="width:50px;" TABLE="DxImageFindingsProstate" FIELD="ImgFindLevel" Runat="server" ID="ImgFindLevel_2_2"/></td>
    <td  style="vertical-align: top;"><euc:EformDropDownList LookupCode="Laterality" ParentRecordId="2" RecordId="2" ShowCalendar="False" CalcDate="False" style="width:50px;" TABLE="DxImageFindingsProstate" FIELD="ImgFindLaterality" Runat="server" ID="ImgFindLaterality_2_2"/></td>
    <td  style="vertical-align: top;"><euc:EformDropDownList LookupCode="AP" ParentRecordId="2" RecordId="2" ShowCalendar="False" CalcDate="False" style="width:50px;" TABLE="DxImageFindingsProstate" FIELD="ImgFindAP" Runat="server" ID="ImgFindAP_2_2"/></td>
    <td  style="vertical-align: top;"><euc:EformDropDownList LookupCode="ProstateZone" ParentRecordId="2" RecordId="2" ShowCalendar="False" CalcDate="False" style="width:50px;" TABLE="DxImageFindingsProstate" FIELD="ImgFindZone" Runat="server" ID="ImgFindZone_2_2"/></td>
    <td style="white-space: nowrap;vertical-align: top;"><euc:EformComboBox DropDownWidth="200" DropDownHeight="auto"  LookupCode="DxResult_ProstateBiopsyEform" style="width:70px;" Field="ImgFindResult" ParentRecordId="2" RecordId="2" Table="DxImageFindingsProstate" Runat="server" id="ImgFindResult_2_2"  /></td>
    <td  style="vertical-align: top;"><euc:EformDropDownList LookupCode="YesNoUnknown" ParentRecordId="2" RecordId="2" ShowCalendar="False" CalcDate="False" style="width:50px;" TABLE="DxImageFindingsProstate" FIELD="ImgFindExtension" Runat="server" ID="ImgFindExtension_2_2"/></td>
    </tr>
        <tr>
    <td  style="vertical-align: top;"><euc:EformDropDownList LookupCode="ProstateSide" ParentRecordId="2" RecordId="3" ShowCalendar="False" CalcDate="False" style="width:50px;" TABLE="DxImageFindingsProstate" FIELD="ImgFindSide" Runat="server" ID="ImgFindSide_2_3"/></td>
    <td  style="vertical-align: top;"><euc:EformDropDownList LookupCode="ProstateLevel" ParentRecordId="2" RecordId="3" ShowCalendar="False" CalcDate="False" style="width:50px;" TABLE="DxImageFindingsProstate" FIELD="ImgFindLevel" Runat="server" ID="ImgFindLevel_2_3"/></td>
    <td  style="vertical-align: top;"><euc:EformDropDownList LookupCode="Laterality" ParentRecordId="2" RecordId="3" ShowCalendar="False" CalcDate="False" style="width:50px;" TABLE="DxImageFindingsProstate" FIELD="ImgFindLaterality" Runat="server" ID="ImgFindLaterality_2_3"/></td>
    <td  style="vertical-align: top;"><euc:EformDropDownList LookupCode="AP" ParentRecordId="2" RecordId="3" ShowCalendar="False" CalcDate="False" style="width:50px;" TABLE="DxImageFindingsProstate" FIELD="ImgFindAP" Runat="server" ID="ImgFindAP_2_3"/></td>
    <td  style="vertical-align: top;"><euc:EformDropDownList LookupCode="ProstateZone" ParentRecordId="2" RecordId="3" ShowCalendar="False" CalcDate="False" style="width:50px;" TABLE="DxImageFindingsProstate" FIELD="ImgFindZone" Runat="server" ID="ImgFindZone_2_3"/></td>
    <td style="white-space: nowrap;vertical-align: top;"><euc:EformComboBox DropDownWidth="200" DropDownHeight="auto"  LookupCode="DxResult_ProstateBiopsyEform" style="width:70px;" Field="ImgFindResult" ParentRecordId="2" RecordId="3" Table="DxImageFindingsProstate" Runat="server" id="ImgFindResult_2_3"  /></td>
    <td  style="vertical-align: top;"><euc:EformDropDownList LookupCode="YesNoUnknown" ParentRecordId="2" RecordId="3" ShowCalendar="False" CalcDate="False" style="width:50px;" TABLE="DxImageFindingsProstate" FIELD="ImgFindExtension" Runat="server" ID="ImgFindExtension_2_3"/></td>
    </tr>
        <tr>
    <td  style="vertical-align: top;"><euc:EformDropDownList LookupCode="ProstateSide" ParentRecordId="2" RecordId="4" ShowCalendar="False" CalcDate="False" style="width:50px;" TABLE="DxImageFindingsProstate" FIELD="ImgFindSide" Runat="server" ID="ImgFindSide_2_4"/></td>
    <td  style="vertical-align: top;"><euc:EformDropDownList LookupCode="ProstateLevel" ParentRecordId="2" RecordId="4" ShowCalendar="False" CalcDate="False" style="width:50px;" TABLE="DxImageFindingsProstate" FIELD="ImgFindLevel" Runat="server" ID="ImgFindLevel_2_4"/></td>
    <td  style="vertical-align: top;"><euc:EformDropDownList LookupCode="Laterality" ParentRecordId="2" RecordId="4" ShowCalendar="False" CalcDate="False" style="width:50px;" TABLE="DxImageFindingsProstate" FIELD="ImgFindLaterality" Runat="server" ID="ImgFindLaterality_2_4"/></td>
    <td  style="vertical-align: top;"><euc:EformDropDownList LookupCode="AP" ParentRecordId="2" RecordId="4" ShowCalendar="False" CalcDate="False" style="width:50px;" TABLE="DxImageFindingsProstate" FIELD="ImgFindAP" Runat="server" ID="ImgFindAP_2_4"/></td>
    <td  style="vertical-align: top;"><euc:EformDropDownList LookupCode="ProstateZone" ParentRecordId="2" RecordId="4" ShowCalendar="False" CalcDate="False" style="width:50px;" TABLE="DxImageFindingsProstate" FIELD="ImgFindZone" Runat="server" ID="ImgFindZone_2_4"/></td>
    <td style="white-space: nowrap;vertical-align: top;"><euc:EformComboBox DropDownWidth="200" DropDownHeight="auto"  LookupCode="DxResult_ProstateBiopsyEform" style="width:70px;" Field="ImgFindResult" ParentRecordId="2" RecordId="4" Table="DxImageFindingsProstate" Runat="server" id="ImgFindResult_2_4"  /></td>
    <td  style="vertical-align: top;"><euc:EformDropDownList LookupCode="YesNoUnknown" ParentRecordId="2" RecordId="4" ShowCalendar="False" CalcDate="False" style="width:50px;" TABLE="DxImageFindingsProstate" FIELD="ImgFindExtension" Runat="server" ID="ImgFindExtension_2_4"/></td>
    </tr>
        <tr>
    <td  style="vertical-align: top;"><euc:EformDropDownList LookupCode="ProstateSide" ParentRecordId="2" RecordId="5" ShowCalendar="False" CalcDate="False" style="width:50px;" TABLE="DxImageFindingsProstate" FIELD="ImgFindSide" Runat="server" ID="ImgFindSide_2_5"/></td>
    <td  style="vertical-align: top;"><euc:EformDropDownList LookupCode="ProstateLevel" ParentRecordId="2" RecordId="5" ShowCalendar="False" CalcDate="False" style="width:50px;" TABLE="DxImageFindingsProstate" FIELD="ImgFindLevel" Runat="server" ID="ImgFindLevel_2_5"/></td>
    <td  style="vertical-align: top;"><euc:EformDropDownList LookupCode="Laterality" ParentRecordId="2" RecordId="5" ShowCalendar="False" CalcDate="False" style="width:50px;" TABLE="DxImageFindingsProstate" FIELD="ImgFindLaterality" Runat="server" ID="ImgFindLaterality_2_5"/></td>
    <td  style="vertical-align: top;"><euc:EformDropDownList LookupCode="AP" ParentRecordId="2" RecordId="5" ShowCalendar="False" CalcDate="False" style="width:50px;" TABLE="DxImageFindingsProstate" FIELD="ImgFindAP" Runat="server" ID="ImgFindAP_2_5"/></td>
    <td  style="vertical-align: top;"><euc:EformDropDownList LookupCode="ProstateZone" ParentRecordId="2" RecordId="5" ShowCalendar="False" CalcDate="False" style="width:50px;" TABLE="DxImageFindingsProstate" FIELD="ImgFindZone" Runat="server" ID="ImgFindZone_2_5"/></td>
    <td style="white-space: nowrap;vertical-align: top;"><euc:EformComboBox DropDownWidth="200" DropDownHeight="auto"  LookupCode="DxResult_ProstateBiopsyEform" style="width:70px;" Field="ImgFindResult" ParentRecordId="2" RecordId="5" Table="DxImageFindingsProstate" Runat="server" id="ImgFindResult_2_5"  /></td>
    <td  style="vertical-align: top;"><euc:EformDropDownList LookupCode="YesNoUnknown" ParentRecordId="2" RecordId="5" ShowCalendar="False" CalcDate="False" style="width:50px;" TABLE="DxImageFindingsProstate" FIELD="ImgFindExtension" Runat="server" ID="ImgFindExtension_2_5"/></td>
    </tr>
        </table>
    </td>
    <td style="vertical-align: top;"><euc:EformDeleteIcon runat="server"/></td>
  </tr>

  
  <tr style="display: none;"> 
    <td class="ClinicalEformGridColumnOne" style="vertical-align: top;"><euc:EformTextBox Runat="server" RecordId="3"  ID="DxDateText_3" TABLE="Diagnostics" FIELD="DxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  /><euc:EformHidden RecordId="3" Runat="server" ID="DxDate_3" Table="Diagnostics" Field="DxDate"></euc:EformHidden></td><td style="vertical-align: top;"><euc:EformComboBox DropDownWidth="90" DropDownHeight="auto"  RecordId="3" LookupCode="DxType_ProstateBiopsyEform" TABLE="Diagnostics" FIELD="DxType"  style="width: 44px" Runat="server" ID="DxType_3"/></td>
    <td  style="vertical-align: top;"><euc:EformTextBox RecordId="3" style="width:36px;" TABLE="DxImageProstate" FIELD="ImgProstateVolume" Runat="server" ID="ImgProstateVolume_3"/></td>
    <td colspan="7" class="imageFindingsContainerTd">
        <table cellspacing="0">
        <tr>
    <td  style="vertical-align: top;"><euc:EformDropDownList LookupCode="ProstateSide" ParentRecordId="3" RecordId="1" ShowCalendar="False" CalcDate="False" style="width:50px;" TABLE="DxImageFindingsProstate" FIELD="ImgFindSide" Runat="server" ID="ImgFindSide_3_1"/></td>
    <td  style="vertical-align: top;"><euc:EformDropDownList LookupCode="ProstateLevel" ParentRecordId="3" RecordId="1" ShowCalendar="False" CalcDate="False" style="width:50px;" TABLE="DxImageFindingsProstate" FIELD="ImgFindLevel" Runat="server" ID="ImgFindLevel_3_1"/></td>
    <td  style="vertical-align: top;"><euc:EformDropDownList LookupCode="Laterality" ParentRecordId="3" RecordId="1" ShowCalendar="False" CalcDate="False" style="width:50px;" TABLE="DxImageFindingsProstate" FIELD="ImgFindLaterality" Runat="server" ID="ImgFindLaterality_3_1"/></td>
    <td  style="vertical-align: top;"><euc:EformDropDownList LookupCode="AP" ParentRecordId="3" RecordId="1" ShowCalendar="False" CalcDate="False" style="width:50px;" TABLE="DxImageFindingsProstate" FIELD="ImgFindAP" Runat="server" ID="ImgFindAP_3_1"/></td>
    <td  style="vertical-align: top;"><euc:EformDropDownList LookupCode="ProstateZone" ParentRecordId="3" RecordId="1" ShowCalendar="False" CalcDate="False" style="width:50px;" TABLE="DxImageFindingsProstate" FIELD="ImgFindZone" Runat="server" ID="ImgFindZone_3_1"/></td>
    <td style="white-space: nowrap;vertical-align: top;"><euc:EformComboBox DropDownWidth="200" DropDownHeight="auto"  LookupCode="DxResult_ProstateBiopsyEform" style="width:70px;" Field="ImgFindResult" ParentRecordId="3" RecordId="1" Table="DxImageFindingsProstate" Runat="server" id="ImgFindResult_3_1"  /></td>
    <td  style="vertical-align: top;"><euc:EformDropDownList LookupCode="YesNoUnknown" ParentRecordId="3" RecordId="1" ShowCalendar="False" CalcDate="False" style="width:50px;" TABLE="DxImageFindingsProstate" FIELD="ImgFindExtension" Runat="server" ID="ImgFindExtension_3_1"/></td>
    </tr>
        <tr>
    <td  style="vertical-align: top;"><euc:EformDropDownList LookupCode="ProstateSide" ParentRecordId="3" RecordId="2" ShowCalendar="False" CalcDate="False" style="width:50px;" TABLE="DxImageFindingsProstate" FIELD="ImgFindSide" Runat="server" ID="ImgFindSide_3_2"/></td>
    <td  style="vertical-align: top;"><euc:EformDropDownList LookupCode="ProstateLevel" ParentRecordId="3" RecordId="2" ShowCalendar="False" CalcDate="False" style="width:50px;" TABLE="DxImageFindingsProstate" FIELD="ImgFindLevel" Runat="server" ID="ImgFindLevel_3_2"/></td>
    <td  style="vertical-align: top;"><euc:EformDropDownList LookupCode="Laterality" ParentRecordId="3" RecordId="2" ShowCalendar="False" CalcDate="False" style="width:50px;" TABLE="DxImageFindingsProstate" FIELD="ImgFindLaterality" Runat="server" ID="ImgFindLaterality_3_2"/></td>
    <td  style="vertical-align: top;"><euc:EformDropDownList LookupCode="AP" ParentRecordId="3" RecordId="2" ShowCalendar="False" CalcDate="False" style="width:50px;" TABLE="DxImageFindingsProstate" FIELD="ImgFindAP" Runat="server" ID="ImgFindAP_3_2"/></td>
    <td  style="vertical-align: top;"><euc:EformDropDownList LookupCode="ProstateZone" ParentRecordId="3" RecordId="2" ShowCalendar="False" CalcDate="False" style="width:50px;" TABLE="DxImageFindingsProstate" FIELD="ImgFindZone" Runat="server" ID="ImgFindZone_3_2"/></td>
    <td style="white-space: nowrap;vertical-align: top;"><euc:EformComboBox DropDownWidth="200" DropDownHeight="auto"  LookupCode="DxResult_ProstateBiopsyEform" style="width:70px;" Field="ImgFindResult" ParentRecordId="3" RecordId="2" Table="DxImageFindingsProstate" Runat="server" id="ImgFindResult_3_2"  /></td>
    <td  style="vertical-align: top;"><euc:EformDropDownList LookupCode="YesNoUnknown" ParentRecordId="3" RecordId="2" ShowCalendar="False" CalcDate="False" style="width:50px;" TABLE="DxImageFindingsProstate" FIELD="ImgFindExtension" Runat="server" ID="ImgFindExtension_3_2"/></td>
    </tr>
        <tr>
    <td  style="vertical-align: top;"><euc:EformDropDownList LookupCode="ProstateSide" ParentRecordId="3" RecordId="3" ShowCalendar="False" CalcDate="False" style="width:50px;" TABLE="DxImageFindingsProstate" FIELD="ImgFindSide" Runat="server" ID="ImgFindSide_3_3"/></td>
    <td  style="vertical-align: top;"><euc:EformDropDownList LookupCode="ProstateLevel" ParentRecordId="3" RecordId="3" ShowCalendar="False" CalcDate="False" style="width:50px;" TABLE="DxImageFindingsProstate" FIELD="ImgFindLevel" Runat="server" ID="ImgFindLevel_3_3"/></td>
    <td  style="vertical-align: top;"><euc:EformDropDownList LookupCode="Laterality" ParentRecordId="3" RecordId="3" ShowCalendar="False" CalcDate="False" style="width:50px;" TABLE="DxImageFindingsProstate" FIELD="ImgFindLaterality" Runat="server" ID="ImgFindLaterality_3_3"/></td>
    <td  style="vertical-align: top;"><euc:EformDropDownList LookupCode="AP" ParentRecordId="3" RecordId="3" ShowCalendar="False" CalcDate="False" style="width:50px;" TABLE="DxImageFindingsProstate" FIELD="ImgFindAP" Runat="server" ID="ImgFindAP_3_3"/></td>
    <td  style="vertical-align: top;"><euc:EformDropDownList LookupCode="ProstateZone" ParentRecordId="3" RecordId="3" ShowCalendar="False" CalcDate="False" style="width:50px;" TABLE="DxImageFindingsProstate" FIELD="ImgFindZone" Runat="server" ID="ImgFindZone_3_3"/></td>
    <td style="white-space: nowrap;vertical-align: top;"><euc:EformComboBox DropDownWidth="200" DropDownHeight="auto"  LookupCode="DxResult_ProstateBiopsyEform" style="width:70px;" Field="ImgFindResult" ParentRecordId="3" RecordId="3" Table="DxImageFindingsProstate" Runat="server" id="ImgFindResult_3_3"  /></td>
    <td  style="vertical-align: top;"><euc:EformDropDownList LookupCode="YesNoUnknown" ParentRecordId="3" RecordId="3" ShowCalendar="False" CalcDate="False" style="width:50px;" TABLE="DxImageFindingsProstate" FIELD="ImgFindExtension" Runat="server" ID="ImgFindExtension_3_3"/></td>
    </tr>
        <tr>
    <td  style="vertical-align: top;"><euc:EformDropDownList LookupCode="ProstateSide" ParentRecordId="3" RecordId="4" ShowCalendar="False" CalcDate="False" style="width:50px;" TABLE="DxImageFindingsProstate" FIELD="ImgFindSide" Runat="server" ID="ImgFindSide_3_4"/></td>
    <td  style="vertical-align: top;"><euc:EformDropDownList LookupCode="ProstateLevel" ParentRecordId="3" RecordId="4" ShowCalendar="False" CalcDate="False" style="width:50px;" TABLE="DxImageFindingsProstate" FIELD="ImgFindLevel" Runat="server" ID="ImgFindLevel_3_4"/></td>
    <td  style="vertical-align: top;"><euc:EformDropDownList LookupCode="Laterality" ParentRecordId="3" RecordId="4" ShowCalendar="False" CalcDate="False" style="width:50px;" TABLE="DxImageFindingsProstate" FIELD="ImgFindLaterality" Runat="server" ID="ImgFindLaterality_3_4"/></td>
    <td  style="vertical-align: top;"><euc:EformDropDownList LookupCode="AP" ParentRecordId="3" RecordId="4" ShowCalendar="False" CalcDate="False" style="width:50px;" TABLE="DxImageFindingsProstate" FIELD="ImgFindAP" Runat="server" ID="ImgFindAP_3_4"/></td>
    <td  style="vertical-align: top;"><euc:EformDropDownList LookupCode="ProstateZone" ParentRecordId="3" RecordId="4" ShowCalendar="False" CalcDate="False" style="width:50px;" TABLE="DxImageFindingsProstate" FIELD="ImgFindZone" Runat="server" ID="ImgFindZone_3_4"/></td>
    <td style="white-space: nowrap;vertical-align: top;"><euc:EformComboBox DropDownWidth="200" DropDownHeight="auto"  LookupCode="DxResult_ProstateBiopsyEform" style="width:70px;" Field="ImgFindResult" ParentRecordId="3" RecordId="4" Table="DxImageFindingsProstate" Runat="server" id="ImgFindResult_3_4"  /></td>
    <td  style="vertical-align: top;"><euc:EformDropDownList LookupCode="YesNoUnknown" ParentRecordId="3" RecordId="4" ShowCalendar="False" CalcDate="False" style="width:50px;" TABLE="DxImageFindingsProstate" FIELD="ImgFindExtension" Runat="server" ID="ImgFindExtension_3_4"/></td>
    </tr>
        <tr>
    <td  style="vertical-align: top;"><euc:EformDropDownList LookupCode="ProstateSide" ParentRecordId="3" RecordId="5" ShowCalendar="False" CalcDate="False" style="width:50px;" TABLE="DxImageFindingsProstate" FIELD="ImgFindSide" Runat="server" ID="ImgFindSide_3_5"/></td>
    <td  style="vertical-align: top;"><euc:EformDropDownList LookupCode="ProstateLevel" ParentRecordId="3" RecordId="5" ShowCalendar="False" CalcDate="False" style="width:50px;" TABLE="DxImageFindingsProstate" FIELD="ImgFindLevel" Runat="server" ID="ImgFindLevel_3_5"/></td>
    <td  style="vertical-align: top;"><euc:EformDropDownList LookupCode="Laterality" ParentRecordId="3" RecordId="5" ShowCalendar="False" CalcDate="False" style="width:50px;" TABLE="DxImageFindingsProstate" FIELD="ImgFindLaterality" Runat="server" ID="ImgFindLaterality_3_5"/></td>
    <td  style="vertical-align: top;"><euc:EformDropDownList LookupCode="AP" ParentRecordId="3" RecordId="5" ShowCalendar="False" CalcDate="False" style="width:50px;" TABLE="DxImageFindingsProstate" FIELD="ImgFindAP" Runat="server" ID="ImgFindAP_3_5"/></td>
    <td  style="vertical-align: top;"><euc:EformDropDownList LookupCode="ProstateZone" ParentRecordId="3" RecordId="5" ShowCalendar="False" CalcDate="False" style="width:50px;" TABLE="DxImageFindingsProstate" FIELD="ImgFindZone" Runat="server" ID="ImgFindZone_3_5"/></td>
    <td style="white-space: nowrap;vertical-align: top;"><euc:EformComboBox DropDownWidth="200" DropDownHeight="auto"  LookupCode="DxResult_ProstateBiopsyEform" style="width:70px;" Field="ImgFindResult" ParentRecordId="3" RecordId="5" Table="DxImageFindingsProstate" Runat="server" id="ImgFindResult_3_5"  /></td>
    <td  style="vertical-align: top;"><euc:EformDropDownList LookupCode="YesNoUnknown" ParentRecordId="3" RecordId="5" ShowCalendar="False" CalcDate="False" style="width:50px;" TABLE="DxImageFindingsProstate" FIELD="ImgFindExtension" Runat="server" ID="ImgFindExtension_3_5"/></td>
    </tr>
        </table>
    </td>
    <td style="vertical-align: top;"><euc:EformDeleteIcon runat="server"/></td>
  </tr>

  
  <tr style="display: none;"> 
    <td class="ClinicalEformGridColumnOne" style="vertical-align: top;"><euc:EformTextBox Runat="server" RecordId="4"  ID="DxDateText_4" TABLE="Diagnostics" FIELD="DxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  /><euc:EformHidden RecordId="4" Runat="server" ID="DxDate_4" Table="Diagnostics" Field="DxDate"></euc:EformHidden></td><td style="vertical-align: top;"><euc:EformComboBox DropDownWidth="90" DropDownHeight="auto"  RecordId="4" LookupCode="DxType_ProstateBiopsyEform" TABLE="Diagnostics" FIELD="DxType"  style="width: 44px" Runat="server" ID="DxType_4"/></td>
    <td  style="vertical-align: top;"><euc:EformTextBox RecordId="4" style="width:36px;" TABLE="DxImageProstate" FIELD="ImgProstateVolume" Runat="server" ID="ImgProstateVolume_4"/></td>
    <td colspan="7" class="imageFindingsContainerTd">
        <table cellspacing="0">
        <tr>
    <td  style="vertical-align: top;"><euc:EformDropDownList LookupCode="ProstateSide" ParentRecordId="4" RecordId="1" ShowCalendar="False" CalcDate="False" style="width:50px;" TABLE="DxImageFindingsProstate" FIELD="ImgFindSide" Runat="server" ID="ImgFindSide_4_1"/></td>
    <td  style="vertical-align: top;"><euc:EformDropDownList LookupCode="ProstateLevel" ParentRecordId="4" RecordId="1" ShowCalendar="False" CalcDate="False" style="width:50px;" TABLE="DxImageFindingsProstate" FIELD="ImgFindLevel" Runat="server" ID="ImgFindLevel_4_1"/></td>
    <td  style="vertical-align: top;"><euc:EformDropDownList LookupCode="Laterality" ParentRecordId="4" RecordId="1" ShowCalendar="False" CalcDate="False" style="width:50px;" TABLE="DxImageFindingsProstate" FIELD="ImgFindLaterality" Runat="server" ID="ImgFindLaterality_4_1"/></td>
    <td  style="vertical-align: top;"><euc:EformDropDownList LookupCode="AP" ParentRecordId="4" RecordId="1" ShowCalendar="False" CalcDate="False" style="width:50px;" TABLE="DxImageFindingsProstate" FIELD="ImgFindAP" Runat="server" ID="ImgFindAP_4_1"/></td>
    <td  style="vertical-align: top;"><euc:EformDropDownList LookupCode="ProstateZone" ParentRecordId="4" RecordId="1" ShowCalendar="False" CalcDate="False" style="width:50px;" TABLE="DxImageFindingsProstate" FIELD="ImgFindZone" Runat="server" ID="ImgFindZone_4_1"/></td>
    <td style="white-space: nowrap;vertical-align: top;"><euc:EformComboBox DropDownWidth="200" DropDownHeight="auto"  LookupCode="DxResult_ProstateBiopsyEform" style="width:70px;" Field="ImgFindResult" ParentRecordId="4" RecordId="1" Table="DxImageFindingsProstate" Runat="server" id="ImgFindResult_4_1"  /></td>
    <td  style="vertical-align: top;"><euc:EformDropDownList LookupCode="YesNoUnknown" ParentRecordId="4" RecordId="1" ShowCalendar="False" CalcDate="False" style="width:50px;" TABLE="DxImageFindingsProstate" FIELD="ImgFindExtension" Runat="server" ID="ImgFindExtension_4_1"/></td>
    </tr>
        <tr>
    <td  style="vertical-align: top;"><euc:EformDropDownList LookupCode="ProstateSide" ParentRecordId="4" RecordId="2" ShowCalendar="False" CalcDate="False" style="width:50px;" TABLE="DxImageFindingsProstate" FIELD="ImgFindSide" Runat="server" ID="ImgFindSide_4_2"/></td>
    <td  style="vertical-align: top;"><euc:EformDropDownList LookupCode="ProstateLevel" ParentRecordId="4" RecordId="2" ShowCalendar="False" CalcDate="False" style="width:50px;" TABLE="DxImageFindingsProstate" FIELD="ImgFindLevel" Runat="server" ID="ImgFindLevel_4_2"/></td>
    <td  style="vertical-align: top;"><euc:EformDropDownList LookupCode="Laterality" ParentRecordId="4" RecordId="2" ShowCalendar="False" CalcDate="False" style="width:50px;" TABLE="DxImageFindingsProstate" FIELD="ImgFindLaterality" Runat="server" ID="ImgFindLaterality_4_2"/></td>
    <td  style="vertical-align: top;"><euc:EformDropDownList LookupCode="AP" ParentRecordId="4" RecordId="2" ShowCalendar="False" CalcDate="False" style="width:50px;" TABLE="DxImageFindingsProstate" FIELD="ImgFindAP" Runat="server" ID="ImgFindAP_4_2"/></td>
    <td  style="vertical-align: top;"><euc:EformDropDownList LookupCode="ProstateZone" ParentRecordId="4" RecordId="2" ShowCalendar="False" CalcDate="False" style="width:50px;" TABLE="DxImageFindingsProstate" FIELD="ImgFindZone" Runat="server" ID="ImgFindZone_4_2"/></td>
    <td style="white-space: nowrap;vertical-align: top;"><euc:EformComboBox DropDownWidth="200" DropDownHeight="auto"  LookupCode="DxResult_ProstateBiopsyEform" style="width:70px;" Field="ImgFindResult" ParentRecordId="4" RecordId="2" Table="DxImageFindingsProstate" Runat="server" id="ImgFindResult_4_2"  /></td>
    <td  style="vertical-align: top;"><euc:EformDropDownList LookupCode="YesNoUnknown" ParentRecordId="4" RecordId="2" ShowCalendar="False" CalcDate="False" style="width:50px;" TABLE="DxImageFindingsProstate" FIELD="ImgFindExtension" Runat="server" ID="ImgFindExtension_4_2"/></td>
    </tr>
        <tr>
    <td  style="vertical-align: top;"><euc:EformDropDownList LookupCode="ProstateSide" ParentRecordId="4" RecordId="3" ShowCalendar="False" CalcDate="False" style="width:50px;" TABLE="DxImageFindingsProstate" FIELD="ImgFindSide" Runat="server" ID="ImgFindSide_4_3"/></td>
    <td  style="vertical-align: top;"><euc:EformDropDownList LookupCode="ProstateLevel" ParentRecordId="4" RecordId="3" ShowCalendar="False" CalcDate="False" style="width:50px;" TABLE="DxImageFindingsProstate" FIELD="ImgFindLevel" Runat="server" ID="ImgFindLevel_4_3"/></td>
    <td  style="vertical-align: top;"><euc:EformDropDownList LookupCode="Laterality" ParentRecordId="4" RecordId="3" ShowCalendar="False" CalcDate="False" style="width:50px;" TABLE="DxImageFindingsProstate" FIELD="ImgFindLaterality" Runat="server" ID="ImgFindLaterality_4_3"/></td>
    <td  style="vertical-align: top;"><euc:EformDropDownList LookupCode="AP" ParentRecordId="4" RecordId="3" ShowCalendar="False" CalcDate="False" style="width:50px;" TABLE="DxImageFindingsProstate" FIELD="ImgFindAP" Runat="server" ID="ImgFindAP_4_3"/></td>
    <td  style="vertical-align: top;"><euc:EformDropDownList LookupCode="ProstateZone" ParentRecordId="4" RecordId="3" ShowCalendar="False" CalcDate="False" style="width:50px;" TABLE="DxImageFindingsProstate" FIELD="ImgFindZone" Runat="server" ID="ImgFindZone_4_3"/></td>
    <td style="white-space: nowrap;vertical-align: top;"><euc:EformComboBox DropDownWidth="200" DropDownHeight="auto"  LookupCode="DxResult_ProstateBiopsyEform" style="width:70px;" Field="ImgFindResult" ParentRecordId="4" RecordId="3" Table="DxImageFindingsProstate" Runat="server" id="ImgFindResult_4_3"  /></td>
    <td  style="vertical-align: top;"><euc:EformDropDownList LookupCode="YesNoUnknown" ParentRecordId="4" RecordId="3" ShowCalendar="False" CalcDate="False" style="width:50px;" TABLE="DxImageFindingsProstate" FIELD="ImgFindExtension" Runat="server" ID="ImgFindExtension_4_3"/></td>
    </tr>
        <tr>
    <td  style="vertical-align: top;"><euc:EformDropDownList LookupCode="ProstateSide" ParentRecordId="4" RecordId="4" ShowCalendar="False" CalcDate="False" style="width:50px;" TABLE="DxImageFindingsProstate" FIELD="ImgFindSide" Runat="server" ID="ImgFindSide_4_4"/></td>
    <td  style="vertical-align: top;"><euc:EformDropDownList LookupCode="ProstateLevel" ParentRecordId="4" RecordId="4" ShowCalendar="False" CalcDate="False" style="width:50px;" TABLE="DxImageFindingsProstate" FIELD="ImgFindLevel" Runat="server" ID="ImgFindLevel_4_4"/></td>
    <td  style="vertical-align: top;"><euc:EformDropDownList LookupCode="Laterality" ParentRecordId="4" RecordId="4" ShowCalendar="False" CalcDate="False" style="width:50px;" TABLE="DxImageFindingsProstate" FIELD="ImgFindLaterality" Runat="server" ID="ImgFindLaterality_4_4"/></td>
    <td  style="vertical-align: top;"><euc:EformDropDownList LookupCode="AP" ParentRecordId="4" RecordId="4" ShowCalendar="False" CalcDate="False" style="width:50px;" TABLE="DxImageFindingsProstate" FIELD="ImgFindAP" Runat="server" ID="ImgFindAP_4_4"/></td>
    <td  style="vertical-align: top;"><euc:EformDropDownList LookupCode="ProstateZone" ParentRecordId="4" RecordId="4" ShowCalendar="False" CalcDate="False" style="width:50px;" TABLE="DxImageFindingsProstate" FIELD="ImgFindZone" Runat="server" ID="ImgFindZone_4_4"/></td>
    <td style="white-space: nowrap;vertical-align: top;"><euc:EformComboBox DropDownWidth="200" DropDownHeight="auto"  LookupCode="DxResult_ProstateBiopsyEform" style="width:70px;" Field="ImgFindResult" ParentRecordId="4" RecordId="4" Table="DxImageFindingsProstate" Runat="server" id="ImgFindResult_4_4"  /></td>
    <td  style="vertical-align: top;"><euc:EformDropDownList LookupCode="YesNoUnknown" ParentRecordId="4" RecordId="4" ShowCalendar="False" CalcDate="False" style="width:50px;" TABLE="DxImageFindingsProstate" FIELD="ImgFindExtension" Runat="server" ID="ImgFindExtension_4_4"/></td>
    </tr>
        <tr>
    <td  style="vertical-align: top;"><euc:EformDropDownList LookupCode="ProstateSide" ParentRecordId="4" RecordId="5" ShowCalendar="False" CalcDate="False" style="width:50px;" TABLE="DxImageFindingsProstate" FIELD="ImgFindSide" Runat="server" ID="ImgFindSide_4_5"/></td>
    <td  style="vertical-align: top;"><euc:EformDropDownList LookupCode="ProstateLevel" ParentRecordId="4" RecordId="5" ShowCalendar="False" CalcDate="False" style="width:50px;" TABLE="DxImageFindingsProstate" FIELD="ImgFindLevel" Runat="server" ID="ImgFindLevel_4_5"/></td>
    <td  style="vertical-align: top;"><euc:EformDropDownList LookupCode="Laterality" ParentRecordId="4" RecordId="5" ShowCalendar="False" CalcDate="False" style="width:50px;" TABLE="DxImageFindingsProstate" FIELD="ImgFindLaterality" Runat="server" ID="ImgFindLaterality_4_5"/></td>
    <td  style="vertical-align: top;"><euc:EformDropDownList LookupCode="AP" ParentRecordId="4" RecordId="5" ShowCalendar="False" CalcDate="False" style="width:50px;" TABLE="DxImageFindingsProstate" FIELD="ImgFindAP" Runat="server" ID="ImgFindAP_4_5"/></td>
    <td  style="vertical-align: top;"><euc:EformDropDownList LookupCode="ProstateZone" ParentRecordId="4" RecordId="5" ShowCalendar="False" CalcDate="False" style="width:50px;" TABLE="DxImageFindingsProstate" FIELD="ImgFindZone" Runat="server" ID="ImgFindZone_4_5"/></td>
    <td style="white-space: nowrap;vertical-align: top;"><euc:EformComboBox DropDownWidth="200" DropDownHeight="auto"  LookupCode="DxResult_ProstateBiopsyEform" style="width:70px;" Field="ImgFindResult" ParentRecordId="4" RecordId="5" Table="DxImageFindingsProstate" Runat="server" id="ImgFindResult_4_5"  /></td>
    <td  style="vertical-align: top;"><euc:EformDropDownList LookupCode="YesNoUnknown" ParentRecordId="4" RecordId="5" ShowCalendar="False" CalcDate="False" style="width:50px;" TABLE="DxImageFindingsProstate" FIELD="ImgFindExtension" Runat="server" ID="ImgFindExtension_4_5"/></td>
    </tr>
        </table>
    </td>
    <td style="vertical-align: top;"><euc:EformDeleteIcon runat="server"/></td>
  </tr>

  
  <tr style="display: none;"> 
    <td class="ClinicalEformGridColumnOne" style="vertical-align: top;"><euc:EformTextBox Runat="server" RecordId="5"  ID="DxDateText_5" TABLE="Diagnostics" FIELD="DxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  /><euc:EformHidden RecordId="5" Runat="server" ID="DxDate_5" Table="Diagnostics" Field="DxDate"></euc:EformHidden></td><td style="vertical-align: top;"><euc:EformComboBox DropDownWidth="90" DropDownHeight="auto"  RecordId="5" LookupCode="DxType_ProstateBiopsyEform" TABLE="Diagnostics" FIELD="DxType"  style="width: 44px" Runat="server" ID="DxType_5"/></td>
    <td  style="vertical-align: top;"><euc:EformTextBox RecordId="5" style="width:36px;" TABLE="DxImageProstate" FIELD="ImgProstateVolume" Runat="server" ID="ImgProstateVolume_5"/></td>
    <td colspan="7" class="imageFindingsContainerTd">
        <table cellspacing="0">
        <tr>
    <td  style="vertical-align: top;"><euc:EformDropDownList LookupCode="ProstateSide" ParentRecordId="5" RecordId="1" ShowCalendar="False" CalcDate="False" style="width:50px;" TABLE="DxImageFindingsProstate" FIELD="ImgFindSide" Runat="server" ID="ImgFindSide_5_1"/></td>
    <td  style="vertical-align: top;"><euc:EformDropDownList LookupCode="ProstateLevel" ParentRecordId="5" RecordId="1" ShowCalendar="False" CalcDate="False" style="width:50px;" TABLE="DxImageFindingsProstate" FIELD="ImgFindLevel" Runat="server" ID="ImgFindLevel_5_1"/></td>
    <td  style="vertical-align: top;"><euc:EformDropDownList LookupCode="Laterality" ParentRecordId="5" RecordId="1" ShowCalendar="False" CalcDate="False" style="width:50px;" TABLE="DxImageFindingsProstate" FIELD="ImgFindLaterality" Runat="server" ID="ImgFindLaterality_5_1"/></td>
    <td  style="vertical-align: top;"><euc:EformDropDownList LookupCode="AP" ParentRecordId="5" RecordId="1" ShowCalendar="False" CalcDate="False" style="width:50px;" TABLE="DxImageFindingsProstate" FIELD="ImgFindAP" Runat="server" ID="ImgFindAP_5_1"/></td>
    <td  style="vertical-align: top;"><euc:EformDropDownList LookupCode="ProstateZone" ParentRecordId="5" RecordId="1" ShowCalendar="False" CalcDate="False" style="width:50px;" TABLE="DxImageFindingsProstate" FIELD="ImgFindZone" Runat="server" ID="ImgFindZone_5_1"/></td>
    <td style="white-space: nowrap;vertical-align: top;"><euc:EformComboBox DropDownWidth="200" DropDownHeight="auto"  LookupCode="DxResult_ProstateBiopsyEform" style="width:70px;" Field="ImgFindResult" ParentRecordId="5" RecordId="1" Table="DxImageFindingsProstate" Runat="server" id="ImgFindResult_5_1"  /></td>
    <td  style="vertical-align: top;"><euc:EformDropDownList LookupCode="YesNoUnknown" ParentRecordId="5" RecordId="1" ShowCalendar="False" CalcDate="False" style="width:50px;" TABLE="DxImageFindingsProstate" FIELD="ImgFindExtension" Runat="server" ID="ImgFindExtension_5_1"/></td>
    </tr>
        <tr>
    <td  style="vertical-align: top;"><euc:EformDropDownList LookupCode="ProstateSide" ParentRecordId="5" RecordId="2" ShowCalendar="False" CalcDate="False" style="width:50px;" TABLE="DxImageFindingsProstate" FIELD="ImgFindSide" Runat="server" ID="ImgFindSide_5_2"/></td>
    <td  style="vertical-align: top;"><euc:EformDropDownList LookupCode="ProstateLevel" ParentRecordId="5" RecordId="2" ShowCalendar="False" CalcDate="False" style="width:50px;" TABLE="DxImageFindingsProstate" FIELD="ImgFindLevel" Runat="server" ID="ImgFindLevel_5_2"/></td>
    <td  style="vertical-align: top;"><euc:EformDropDownList LookupCode="Laterality" ParentRecordId="5" RecordId="2" ShowCalendar="False" CalcDate="False" style="width:50px;" TABLE="DxImageFindingsProstate" FIELD="ImgFindLaterality" Runat="server" ID="ImgFindLaterality_5_2"/></td>
    <td  style="vertical-align: top;"><euc:EformDropDownList LookupCode="AP" ParentRecordId="5" RecordId="2" ShowCalendar="False" CalcDate="False" style="width:50px;" TABLE="DxImageFindingsProstate" FIELD="ImgFindAP" Runat="server" ID="ImgFindAP_5_2"/></td>
    <td  style="vertical-align: top;"><euc:EformDropDownList LookupCode="ProstateZone" ParentRecordId="5" RecordId="2" ShowCalendar="False" CalcDate="False" style="width:50px;" TABLE="DxImageFindingsProstate" FIELD="ImgFindZone" Runat="server" ID="ImgFindZone_5_2"/></td>
    <td style="white-space: nowrap;vertical-align: top;"><euc:EformComboBox DropDownWidth="200" DropDownHeight="auto"  LookupCode="DxResult_ProstateBiopsyEform" style="width:70px;" Field="ImgFindResult" ParentRecordId="5" RecordId="2" Table="DxImageFindingsProstate" Runat="server" id="ImgFindResult_5_2"  /></td>
    <td  style="vertical-align: top;"><euc:EformDropDownList LookupCode="YesNoUnknown" ParentRecordId="5" RecordId="2" ShowCalendar="False" CalcDate="False" style="width:50px;" TABLE="DxImageFindingsProstate" FIELD="ImgFindExtension" Runat="server" ID="ImgFindExtension_5_2"/></td>
    </tr>
        <tr>
    <td  style="vertical-align: top;"><euc:EformDropDownList LookupCode="ProstateSide" ParentRecordId="5" RecordId="3" ShowCalendar="False" CalcDate="False" style="width:50px;" TABLE="DxImageFindingsProstate" FIELD="ImgFindSide" Runat="server" ID="ImgFindSide_5_3"/></td>
    <td  style="vertical-align: top;"><euc:EformDropDownList LookupCode="ProstateLevel" ParentRecordId="5" RecordId="3" ShowCalendar="False" CalcDate="False" style="width:50px;" TABLE="DxImageFindingsProstate" FIELD="ImgFindLevel" Runat="server" ID="ImgFindLevel_5_3"/></td>
    <td  style="vertical-align: top;"><euc:EformDropDownList LookupCode="Laterality" ParentRecordId="5" RecordId="3" ShowCalendar="False" CalcDate="False" style="width:50px;" TABLE="DxImageFindingsProstate" FIELD="ImgFindLaterality" Runat="server" ID="ImgFindLaterality_5_3"/></td>
    <td  style="vertical-align: top;"><euc:EformDropDownList LookupCode="AP" ParentRecordId="5" RecordId="3" ShowCalendar="False" CalcDate="False" style="width:50px;" TABLE="DxImageFindingsProstate" FIELD="ImgFindAP" Runat="server" ID="ImgFindAP_5_3"/></td>
    <td  style="vertical-align: top;"><euc:EformDropDownList LookupCode="ProstateZone" ParentRecordId="5" RecordId="3" ShowCalendar="False" CalcDate="False" style="width:50px;" TABLE="DxImageFindingsProstate" FIELD="ImgFindZone" Runat="server" ID="ImgFindZone_5_3"/></td>
    <td style="white-space: nowrap;vertical-align: top;"><euc:EformComboBox DropDownWidth="200" DropDownHeight="auto"  LookupCode="DxResult_ProstateBiopsyEform" style="width:70px;" Field="ImgFindResult" ParentRecordId="5" RecordId="3" Table="DxImageFindingsProstate" Runat="server" id="ImgFindResult_5_3"  /></td>
    <td  style="vertical-align: top;"><euc:EformDropDownList LookupCode="YesNoUnknown" ParentRecordId="5" RecordId="3" ShowCalendar="False" CalcDate="False" style="width:50px;" TABLE="DxImageFindingsProstate" FIELD="ImgFindExtension" Runat="server" ID="ImgFindExtension_5_3"/></td>
    </tr>
        <tr>
    <td  style="vertical-align: top;"><euc:EformDropDownList LookupCode="ProstateSide" ParentRecordId="5" RecordId="4" ShowCalendar="False" CalcDate="False" style="width:50px;" TABLE="DxImageFindingsProstate" FIELD="ImgFindSide" Runat="server" ID="ImgFindSide_5_4"/></td>
    <td  style="vertical-align: top;"><euc:EformDropDownList LookupCode="ProstateLevel" ParentRecordId="5" RecordId="4" ShowCalendar="False" CalcDate="False" style="width:50px;" TABLE="DxImageFindingsProstate" FIELD="ImgFindLevel" Runat="server" ID="ImgFindLevel_5_4"/></td>
    <td  style="vertical-align: top;"><euc:EformDropDownList LookupCode="Laterality" ParentRecordId="5" RecordId="4" ShowCalendar="False" CalcDate="False" style="width:50px;" TABLE="DxImageFindingsProstate" FIELD="ImgFindLaterality" Runat="server" ID="ImgFindLaterality_5_4"/></td>
    <td  style="vertical-align: top;"><euc:EformDropDownList LookupCode="AP" ParentRecordId="5" RecordId="4" ShowCalendar="False" CalcDate="False" style="width:50px;" TABLE="DxImageFindingsProstate" FIELD="ImgFindAP" Runat="server" ID="ImgFindAP_5_4"/></td>
    <td  style="vertical-align: top;"><euc:EformDropDownList LookupCode="ProstateZone" ParentRecordId="5" RecordId="4" ShowCalendar="False" CalcDate="False" style="width:50px;" TABLE="DxImageFindingsProstate" FIELD="ImgFindZone" Runat="server" ID="ImgFindZone_5_4"/></td>
    <td style="white-space: nowrap;vertical-align: top;"><euc:EformComboBox DropDownWidth="200" DropDownHeight="auto"  LookupCode="DxResult_ProstateBiopsyEform" style="width:70px;" Field="ImgFindResult" ParentRecordId="5" RecordId="4" Table="DxImageFindingsProstate" Runat="server" id="ImgFindResult_5_4"  /></td>
    <td  style="vertical-align: top;"><euc:EformDropDownList LookupCode="YesNoUnknown" ParentRecordId="5" RecordId="4" ShowCalendar="False" CalcDate="False" style="width:50px;" TABLE="DxImageFindingsProstate" FIELD="ImgFindExtension" Runat="server" ID="ImgFindExtension_5_4"/></td>
    </tr>
        <tr>
    <td  style="vertical-align: top;"><euc:EformDropDownList LookupCode="ProstateSide" ParentRecordId="5" RecordId="5" ShowCalendar="False" CalcDate="False" style="width:50px;" TABLE="DxImageFindingsProstate" FIELD="ImgFindSide" Runat="server" ID="ImgFindSide_5_5"/></td>
    <td  style="vertical-align: top;"><euc:EformDropDownList LookupCode="ProstateLevel" ParentRecordId="5" RecordId="5" ShowCalendar="False" CalcDate="False" style="width:50px;" TABLE="DxImageFindingsProstate" FIELD="ImgFindLevel" Runat="server" ID="ImgFindLevel_5_5"/></td>
    <td  style="vertical-align: top;"><euc:EformDropDownList LookupCode="Laterality" ParentRecordId="5" RecordId="5" ShowCalendar="False" CalcDate="False" style="width:50px;" TABLE="DxImageFindingsProstate" FIELD="ImgFindLaterality" Runat="server" ID="ImgFindLaterality_5_5"/></td>
    <td  style="vertical-align: top;"><euc:EformDropDownList LookupCode="AP" ParentRecordId="5" RecordId="5" ShowCalendar="False" CalcDate="False" style="width:50px;" TABLE="DxImageFindingsProstate" FIELD="ImgFindAP" Runat="server" ID="ImgFindAP_5_5"/></td>
    <td  style="vertical-align: top;"><euc:EformDropDownList LookupCode="ProstateZone" ParentRecordId="5" RecordId="5" ShowCalendar="False" CalcDate="False" style="width:50px;" TABLE="DxImageFindingsProstate" FIELD="ImgFindZone" Runat="server" ID="ImgFindZone_5_5"/></td>
    <td style="white-space: nowrap;vertical-align: top;"><euc:EformComboBox DropDownWidth="200" DropDownHeight="auto"  LookupCode="DxResult_ProstateBiopsyEform" style="width:70px;" Field="ImgFindResult" ParentRecordId="5" RecordId="5" Table="DxImageFindingsProstate" Runat="server" id="ImgFindResult_5_5"  /></td>
    <td  style="vertical-align: top;"><euc:EformDropDownList LookupCode="YesNoUnknown" ParentRecordId="5" RecordId="5" ShowCalendar="False" CalcDate="False" style="width:50px;" TABLE="DxImageFindingsProstate" FIELD="ImgFindExtension" Runat="server" ID="ImgFindExtension_5_5"/></td>
    </tr>
        </table>
    </td>
    <td style="vertical-align: top;"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
</table>
<img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'TRUSMRIHtmlTable');" />

<br/><br/><br/>