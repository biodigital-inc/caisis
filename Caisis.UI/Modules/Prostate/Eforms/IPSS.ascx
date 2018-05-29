<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Prostate.Eforms.IPSS" CodeFile="IPSS.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css">
<a name="IPSS" /><span class="controlBoxTitle" style="margin-right: 15px;">IPSS</span>
<style type="text/css">
table#IPSSHTMLTable
{
    width: 650px;
    border: solid 1px #cccccc;
    border-collapse: collapse;
}
table#IPSSHTMLTable td
{
    padding: 5px;
    border: solid 1px #666666;
    text-align: center;
}
table#IPSSHTMLTable td:nth-child(2)
{
    font-size: 12px;
    width: 40%;
    text-align: left;
}
table#IPSSHTMLTable th
{
    background-color: #666666;
    color: #ffffff;
    font-size: 10px;
    border: solid 1px #666666;
}
</style>
<table id="IPSSHTMLTable" cellspacing="0" >
  <tr>
    <th colspan="2" rowspan="2" style="font-size: 13px; text-align: left; padding: 5px;">In the past month:</th>
    <th>Not at All</th>
    <th>Less than 1 in 5 Times</th>
    <th>Less than Half the Time</th>
    <th>About Half the Time</th>
    <th>More than Half the Time</th>
    <th>Almost Always</th>
    <th>&nbsp;</th>
  </tr>
  <tr>
    <th>0</th>
    <th>1</th>
    <th>2</th>
    <th>3</th>
    <th>4</th>
    <th>5</th>
    <th>&nbsp;</th>
  </tr>
  <tr>
    <td><euc:EformDefaultLabel ID="SurveyItemNum101" runat="server" DefaultField="SurveyItems.SurveyItemNum,101" /></td>
    <td style="font-size: 12px; width: 40%; text-align: left;"><euc:EformDefaultLabel ID="SurveyItem101" runat="server" DefaultField="SurveyItems.SurveyItem,101" /></td>
    <td><euc:EformRadioButton runat="server" Table="SurveyItems" RecordId="101" Field="SurveyItemResult" GroupName="SurveyItemResult101" ID="SurveyItemResult101_0" Value="0" data-survey-item-result="0" Text="" ShowLabel="false" /></td>
    <td><euc:EformRadioButton runat="server" Table="SurveyItems" RecordId="101" Field="SurveyItemResult" GroupName="SurveyItemResult101" ID="SurveyItemResult101_1" Value="1" data-survey-item-result="1" Text="" ShowLabel="false" /></td>
    <td><euc:EformRadioButton runat="server" Table="SurveyItems" RecordId="101" Field="SurveyItemResult" GroupName="SurveyItemResult101" ID="SurveyItemResult101_2" Value="2" data-survey-item-result="2" Text="" ShowLabel="false" /></td>
    <td><euc:EformRadioButton runat="server" Table="SurveyItems" RecordId="101" Field="SurveyItemResult" GroupName="SurveyItemResult101" ID="SurveyItemResult101_3" Value="3" data-survey-item-result="3" Text="" ShowLabel="false" /></td>
    <td><euc:EformRadioButton runat="server" Table="SurveyItems" RecordId="101" Field="SurveyItemResult" GroupName="SurveyItemResult101" ID="SurveyItemResult101_4" Value="4" data-survey-item-result="4" Text="" ShowLabel="false" /></td>
    <td><euc:EformRadioButton runat="server" Table="SurveyItems" RecordId="101" Field="SurveyItemResult" GroupName="SurveyItemResult101" ID="SurveyItemResult101_5" Value="5" data-survey-item-result="5" Text="" ShowLabel="false" /></td>
    <td><euc:EformDeleteIcon runat="server" /></td>
  </tr>
  <tr>
    <td><euc:EformDefaultLabel ID="SurveyItemNum102" runat="server" DefaultField="SurveyItems.SurveyItemNum,102" /></td>
    <td style="font-size: 12px; text-align: left;"><euc:EformDefaultLabel ID="SurveyItem102" runat="server" DefaultField="SurveyItems.SurveyItem,102" /></td>
    <td><euc:EformRadioButton runat="server" Table="SurveyItems" RecordId="102" Field="SurveyItemResult" GroupName="SurveyItemResult102" ID="SurveyItemResult102_0" Value="0" data-survey-item-result="0" Text="" ShowLabel="false" /></td>
    <td><euc:EformRadioButton runat="server" Table="SurveyItems" RecordId="102" Field="SurveyItemResult" GroupName="SurveyItemResult102" ID="SurveyItemResult102_1" Value="1" data-survey-item-result="1" Text="" ShowLabel="false" /></td>
    <td><euc:EformRadioButton runat="server" Table="SurveyItems" RecordId="102" Field="SurveyItemResult" GroupName="SurveyItemResult102" ID="SurveyItemResult102_2" Value="2" data-survey-item-result="2" Text="" ShowLabel="false" /></td>
    <td><euc:EformRadioButton runat="server" Table="SurveyItems" RecordId="102" Field="SurveyItemResult" GroupName="SurveyItemResult102" ID="SurveyItemResult102_3" Value="3" data-survey-item-result="3" Text="" ShowLabel="false" /></td>
    <td><euc:EformRadioButton runat="server" Table="SurveyItems" RecordId="102" Field="SurveyItemResult" GroupName="SurveyItemResult102" ID="SurveyItemResult102_4" Value="4" data-survey-item-result="4" Text="" ShowLabel="false" /></td>
    <td><euc:EformRadioButton runat="server" Table="SurveyItems" RecordId="102" Field="SurveyItemResult" GroupName="SurveyItemResult102" ID="SurveyItemResult102_5" Value="5" data-survey-item-result="5" Text="" ShowLabel="false" /></td>
    <td><euc:EformDeleteIcon runat="server" /></td>
  </tr>
  <tr>
    <td><euc:EformDefaultLabel ID="SurveyItemNum103" runat="server" DefaultField="SurveyItems.SurveyItemNum,103" /></td>
    <td style="font-size: 12px; text-align: left;"><euc:EformDefaultLabel ID="SurveyItem103" runat="server" DefaultField="SurveyItems.SurveyItem,103" /></td>
    <td><euc:EformRadioButton runat="server" Table="SurveyItems" RecordId="103" Field="SurveyItemResult" GroupName="SurveyItemResult103" ID="SurveyItemResult103_0" Value="0" data-survey-item-result="0" Text="" ShowLabel="false" /></td>
    <td><euc:EformRadioButton runat="server" Table="SurveyItems" RecordId="103" Field="SurveyItemResult" GroupName="SurveyItemResult103" ID="SurveyItemResult103_1" Value="1" data-survey-item-result="1" Text="" ShowLabel="false" /></td>
    <td><euc:EformRadioButton runat="server" Table="SurveyItems" RecordId="103" Field="SurveyItemResult" GroupName="SurveyItemResult103" ID="SurveyItemResult103_2" Value="2" data-survey-item-result="2" Text="" ShowLabel="false" /></td>
    <td><euc:EformRadioButton runat="server" Table="SurveyItems" RecordId="103" Field="SurveyItemResult" GroupName="SurveyItemResult103" ID="SurveyItemResult103_3" Value="3" data-survey-item-result="3" Text="" ShowLabel="false" /></td>
    <td><euc:EformRadioButton runat="server" Table="SurveyItems" RecordId="103" Field="SurveyItemResult" GroupName="SurveyItemResult103" ID="SurveyItemResult103_4" Value="4" data-survey-item-result="4" Text="" ShowLabel="false" /></td>
    <td><euc:EformRadioButton runat="server" Table="SurveyItems" RecordId="103" Field="SurveyItemResult" GroupName="SurveyItemResult103" ID="SurveyItemResult103_5" Value="5" data-survey-item-result="5" Text="" ShowLabel="false" /></td>
    <td><euc:EformDeleteIcon runat="server" /></td>
  </tr>
  <tr>
    <td><euc:EformDefaultLabel ID="SurveyItemNum104" runat="server" DefaultField="SurveyItems.SurveyItemNum,104" /></td>
    <td style="font-size: 12px; text-align: left;"><euc:EformDefaultLabel ID="SurveyItem104" runat="server" DefaultField="SurveyItems.SurveyItem,104" /></td>
    <td><euc:EformRadioButton runat="server" Table="SurveyItems" RecordId="104" Field="SurveyItemResult" GroupName="SurveyItemResult104" ID="SurveyItemResult104_0" Value="0" data-survey-item-result="0" Text="" ShowLabel="false" /></td>
    <td><euc:EformRadioButton runat="server" Table="SurveyItems" RecordId="104" Field="SurveyItemResult" GroupName="SurveyItemResult104" ID="SurveyItemResult104_1" Value="1" data-survey-item-result="1" Text="" ShowLabel="false" /></td>
    <td><euc:EformRadioButton runat="server" Table="SurveyItems" RecordId="104" Field="SurveyItemResult" GroupName="SurveyItemResult104" ID="SurveyItemResult104_2" Value="2" data-survey-item-result="2" Text="" ShowLabel="false" /></td>
    <td><euc:EformRadioButton runat="server" Table="SurveyItems" RecordId="104" Field="SurveyItemResult" GroupName="SurveyItemResult104" ID="SurveyItemResult104_3" Value="3" data-survey-item-result="3" Text="" ShowLabel="false" /></td>
    <td><euc:EformRadioButton runat="server" Table="SurveyItems" RecordId="104" Field="SurveyItemResult" GroupName="SurveyItemResult104" ID="SurveyItemResult104_4" Value="4" data-survey-item-result="4" Text="" ShowLabel="false" /></td>
    <td><euc:EformRadioButton runat="server" Table="SurveyItems" RecordId="104" Field="SurveyItemResult" GroupName="SurveyItemResult104" ID="SurveyItemResult104_5" Value="5" data-survey-item-result="5" Text="" ShowLabel="false" /></td>
    <td><euc:EformDeleteIcon runat="server" /></td>
  </tr>
  <tr>
    <td><euc:EformDefaultLabel ID="SurveyItemNum105" runat="server" DefaultField="SurveyItems.SurveyItemNum,105" /></td>
    <td style="font-size: 12px; text-align: left;"><euc:EformDefaultLabel ID="SurveyItem105" runat="server" DefaultField="SurveyItems.SurveyItem,105" /></td>
    <td><euc:EformRadioButton runat="server" Table="SurveyItems" RecordId="105" Field="SurveyItemResult" GroupName="SurveyItemResult105" ID="SurveyItemResult105_0" Value="0" data-survey-item-result="0" Text="" ShowLabel="false" /></td>
    <td><euc:EformRadioButton runat="server" Table="SurveyItems" RecordId="105" Field="SurveyItemResult" GroupName="SurveyItemResult105" ID="SurveyItemResult105_1" Value="1" data-survey-item-result="1" Text="" ShowLabel="false" /></td>
    <td><euc:EformRadioButton runat="server" Table="SurveyItems" RecordId="105" Field="SurveyItemResult" GroupName="SurveyItemResult105" ID="SurveyItemResult105_2" Value="2" data-survey-item-result="2" Text="" ShowLabel="false" /></td>
    <td><euc:EformRadioButton runat="server" Table="SurveyItems" RecordId="105" Field="SurveyItemResult" GroupName="SurveyItemResult105" ID="SurveyItemResult105_3" Value="3" data-survey-item-result="3" Text="" ShowLabel="false" /></td>
    <td><euc:EformRadioButton runat="server" Table="SurveyItems" RecordId="105" Field="SurveyItemResult" GroupName="SurveyItemResult105" ID="SurveyItemResult105_4" Value="4" data-survey-item-result="4" Text="" ShowLabel="false" /></td>
    <td><euc:EformRadioButton runat="server" Table="SurveyItems" RecordId="105" Field="SurveyItemResult" GroupName="SurveyItemResult105" ID="SurveyItemResult105_5" Value="5" data-survey-item-result="5" Text="" ShowLabel="false" /></td>
    <td><euc:EformDeleteIcon runat="server" /></td>
  </tr>
  <tr>
    <td><euc:EformDefaultLabel ID="SurveyItemNum106" runat="server" DefaultField="SurveyItems.SurveyItemNum,106" /></td>
    <td style="font-size: 12px; text-align: left;"><euc:EformDefaultLabel ID="SurveyItem106" runat="server" DefaultField="SurveyItems.SurveyItem,106" /></td>
    <td><euc:EformRadioButton runat="server" Table="SurveyItems" RecordId="106" Field="SurveyItemResult" GroupName="SurveyItemResult106" ID="SurveyItemResult106_0" Value="0" data-survey-item-result="0" Text="" ShowLabel="false" /></td>
    <td><euc:EformRadioButton runat="server" Table="SurveyItems" RecordId="106" Field="SurveyItemResult" GroupName="SurveyItemResult106" ID="SurveyItemResult106_1" Value="1" data-survey-item-result="1" Text="" ShowLabel="false" /></td>
    <td><euc:EformRadioButton runat="server" Table="SurveyItems" RecordId="106" Field="SurveyItemResult" GroupName="SurveyItemResult106" ID="SurveyItemResult106_2" Value="2" data-survey-item-result="2" Text="" ShowLabel="false" /></td>
    <td><euc:EformRadioButton runat="server" Table="SurveyItems" RecordId="106" Field="SurveyItemResult" GroupName="SurveyItemResult106" ID="SurveyItemResult106_3" Value="3" data-survey-item-result="3" Text="" ShowLabel="false" /></td>
    <td><euc:EformRadioButton runat="server" Table="SurveyItems" RecordId="106" Field="SurveyItemResult" GroupName="SurveyItemResult106" ID="SurveyItemResult106_4" Value="4" data-survey-item-result="4" Text="" ShowLabel="false" /></td>
    <td><euc:EformRadioButton runat="server" Table="SurveyItems" RecordId="106" Field="SurveyItemResult" GroupName="SurveyItemResult106" ID="SurveyItemResult106_5" Value="5" data-survey-item-result="5" Text="" ShowLabel="false" /></td>
    <td><euc:EformDeleteIcon runat="server" /></td>
  </tr>
  <tr>
    <td><euc:EformDefaultLabel ID="SurveyItemNum107" runat="server" DefaultField="SurveyItems.SurveyItemNum,107" /></td>
    <td style="font-size: 12px; text-align: left;"><euc:EformDefaultLabel ID="SurveyItem107" runat="server" DefaultField="SurveyItems.SurveyItem,107" /></td>
    <td><euc:EformRadioButton runat="server" Table="SurveyItems" RecordId="107" Field="SurveyItemResult" GroupName="SurveyItemResult107" ID="SurveyItemResult107_0" Value="0" data-survey-item-result="0" Text="" ShowLabel="false" /></td>
    <td><euc:EformRadioButton runat="server" Table="SurveyItems" RecordId="107" Field="SurveyItemResult" GroupName="SurveyItemResult107" ID="SurveyItemResult107_1" Value="1" data-survey-item-result="1" Text="" ShowLabel="false" /></td>
    <td><euc:EformRadioButton runat="server" Table="SurveyItems" RecordId="107" Field="SurveyItemResult" GroupName="SurveyItemResult107" ID="SurveyItemResult107_2" Value="2" data-survey-item-result="2" Text="" ShowLabel="false" /></td>
    <td><euc:EformRadioButton runat="server" Table="SurveyItems" RecordId="107" Field="SurveyItemResult" GroupName="SurveyItemResult107" ID="SurveyItemResult107_3" Value="3" data-survey-item-result="3" Text="" ShowLabel="false" /></td>
    <td><euc:EformRadioButton runat="server" Table="SurveyItems" RecordId="107" Field="SurveyItemResult" GroupName="SurveyItemResult107" ID="SurveyItemResult107_4" Value="4" data-survey-item-result="4" Text="" ShowLabel="false" /></td>
    <td><euc:EformRadioButton runat="server" Table="SurveyItems" RecordId="107" Field="SurveyItemResult" GroupName="SurveyItemResult107" ID="SurveyItemResult107_5" Value="5" data-survey-item-result="5" Text="" ShowLabel="false" /></td>
    <td><euc:EformDeleteIcon runat="server" /></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td style="font-size: 13px; text-align: left;">Total Score</td>
    <td colspan="6" style="text-align: center; font-size: 13px;"><euc:EformTextBox runat="server" ID="SurveyResult" name="IPSSTotal" RecordId="101" Table="Surveys" Field="SurveyResult" style="width: 40px;" /></td>
    <td><euc:EformDeleteIcon runat="server" /></td>
  </tr>
</table>
<br/>
<br/>
<br/>
<script type="text/javascript">
    jQuery('#IPSSHTMLTable input:radio').click(function () {

        var total = 0;

        jQuery('#IPSSHTMLTable input:checked').each(function () {

            if (jQuery(this).parent().attr('data-survey-item-result')) total += parseInt(jQuery(this).parent().attr('data-survey-item-result'), 10);
        });



        if (total != 0) jQuery('#<% =SurveyResult.ClientID %>').val(total);
        else jQuery('#<% =SurveyResult.ClientID %>').val('');

    });

</script>