<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Prostate.Eforms.PeyronieDisease" CodeFile="PeyronieDisease.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<a name="PeyronieDisease" /><span class="controlBoxTitle">Peyronie's Disease</span>
<euc:EformRadioButtonList RecordId="100" TABLE="SurveyItems" FIELD="SurveyItemResult" Runat="server" ID="SurveyItemResult_100" RepeatLayout="Flow" RepeatDirection="Horizontal" ShowOther="true" style="margin-left: 10px;">
<asp:ListItem Value="None" Text="None&nbsp;&nbsp;&nbsp;" />
<asp:ListItem Value="Curvature" Text="Curvature&nbsp;&nbsp;&nbsp;" />
</euc:EformRadioButtonList>
<br />
<table width="700" cellpadding="3" cellspacing="0" class="ClinicalEformTable" id="PeyronieDiseaseTbl">
    <tr> 
        <td style="padding-top:10px;"><strong>Status</strong></td>
        <td style="padding-top:10px;"><euc:EformCheckBox  RecordId="101" TABLE="SurveyItems" FIELD="SurveyItemResult" Runat="server" ID="SurveyItemResult_101" Value="true" Text="New" style="margin-right: 20px;" />
        First noted <euc:EformTextBox RecordId="102" TABLE="SurveyItems" FIELD="SurveyItemResult" Runat="server" ID="SurveyItemResult_102" Width="30px" /> months postop 
        
        <span style="margin-left: 30px;">
            <euc:EformRadioButtonList RecordId="103" TABLE="SurveyItems" FIELD="SurveyItemResult" Runat="server" ID="SurveyItemResult_103" RepeatLayout="Flow" CellSpacing="5" RepeatDirection="Horizontal"  >
            <asp:ListItem Value="Stable" Text="Stable&nbsp;&nbsp;&nbsp;" />
            <asp:ListItem Value="Improved" Text="Improved&nbsp;&nbsp;&nbsp;" />
            <asp:ListItem Value="Worsened" Text="Worsened" />
            </euc:EformRadioButtonList>
        </span>
        
        </td>
    </tr>
    <tr> 
        <td style="padding-top:10px;"><strong>Degree</strong></td>
        <td style="padding-top:10px;">
            <euc:EformRadioButtonList RecordId="104" TABLE="SurveyItems" FIELD="SurveyItemResult" Runat="server" ID="SurveyItemResult_104" RepeatLayout="Flow" CellSpacing="5" RepeatDirection="Horizontal"  >
                <asp:ListItem  Value="10-20">10-20</asp:ListItem>
			    <asp:ListItem  Value="21-30">21-30</asp:ListItem>
			    <asp:ListItem  Value="31-40">31-40</asp:ListItem>
			    <asp:ListItem  Value="41-50">41-50</asp:ListItem>
			    <asp:ListItem  Value="51-60">51-60</asp:ListItem>
			    <asp:ListItem  Value="61-70">61-70</asp:ListItem>
			    <asp:ListItem  Value="71-80">71-80</asp:ListItem>
			    <asp:ListItem  Value="81-90">81-90</asp:ListItem>
			    <asp:ListItem  Value=">90">>90</asp:ListItem>
            </euc:EformRadioButtonList></td>
    </tr>
    <tr> 
        <td style="padding-top:10px;"><strong>Direction</strong></td>
        <td style="padding-top:10px;">
            <euc:EformRadioButtonList RecordId="105" TABLE="SurveyItems" FIELD="SurveyItemResult" Runat="server" ID="SurveyItemResult_105" RepeatLayout="Flow" CellSpacing="5" RepeatDirection="Horizontal">
                <asp:ListItem  Value="Dorsal">Dorsal</asp:ListItem>
			    <asp:ListItem  Value="Ventral">Ventral</asp:ListItem>
			    <asp:ListItem  Value="Right">Right</asp:ListItem>
			    <asp:ListItem  Value="Left">Left</asp:ListItem>
			    <asp:ListItem  Value="Combined">Combined:</asp:ListItem>
            </euc:EformRadioButtonList>
            <euc:EformTextBox RecordId="106" TABLE="SurveyItems" FIELD="SurveyItemResult" Runat="server" ID="SurveyItemResult_106" Width="150px" />
            
            </td>
    </tr>
    <tr> 
        <td style="padding-top:10px;"><strong>Pain</strong></td>
        <td style="padding-top:10px;">
            <euc:EformRadioButtonList RecordId="107" TABLE="SurveyItems" FIELD="SurveyItemResult" Runat="server" ID="SurveyItemResult_107" RepeatLayout="Flow" CellSpacing="5" RepeatDirection="Horizontal" >
                <asp:ListItem  Value="Yes">Yes</asp:ListItem>
			    <asp:ListItem  Value="No">No</asp:ListItem>
            </euc:EformRadioButtonList>
            
            
            <euc:EformRadioButtonList RecordId="108" TABLE="SurveyItems" FIELD="SurveyItemResult" Runat="server" ID="SurveyItemResult_108" RepeatLayout="Flow" CellSpacing="5" RepeatDirection="Horizontal" style="margin-left: 20px;" >
                <asp:ListItem  Value="Flaccid">Flaccid</asp:ListItem>
			    <asp:ListItem  Value="Erect">Erect</asp:ListItem>
            </euc:EformRadioButtonList>
            
            </td>
    </tr>
    <tr> 
        <td style="padding-top:10px;"><strong>Penetration Ability</strong></td>
        <td style="padding-top:10px;">
            <euc:EformRadioButtonList RecordId="109" TABLE="SurveyItems" FIELD="SurveyItemResult" Runat="server" ID="SurveyItemResult_109" 
                RepeatLayout="Flow" CellSpacing="5" RepeatDirection="Horizontal" >
                <asp:ListItem  Value="Yes">Yes</asp:ListItem>
			    <asp:ListItem  Value="No">No</asp:ListItem>
            </euc:EformRadioButtonList></td>
    </tr>
    <tr> 
        <td style="padding-top:10px;"><strong>Instability</strong></td>
        <td style="padding-top:10px;">
            <euc:EformRadioButtonList RecordId="110" TABLE="SurveyItems" FIELD="SurveyItemResult" Runat="server" ID="SurveyItemResult_110" 
                RepeatLayout="Flow" CellSpacing="5" RepeatDirection="Horizontal" >
                <asp:ListItem  Value="Yes">Yes</asp:ListItem>
			    <asp:ListItem  Value="No">No</asp:ListItem>
            </euc:EformRadioButtonList></td>
    </tr>
    <tr> 
        <td style="padding-top:10px;"><strong>First Sign</strong></td>
        <td style="padding-top:10px;">
            <euc:EformRadioButtonList RecordId="111" TABLE="SurveyItems" FIELD="SurveyItemResult" Runat="server" ID="SurveyItemResult_111" 
                RepeatLayout="Flow" CellSpacing="5" RepeatDirection="Horizontal" >
                <asp:ListItem  Value="Pain">Pain</asp:ListItem>
			    <asp:ListItem  Value="Nodule">Nodule</asp:ListItem>
			    <asp:ListItem  Value="Deformity">Deformity</asp:ListItem>
            </euc:EformRadioButtonList></td>
    </tr>
    <tr> 
        <td style="padding-top:10px; vertical-align: top;"><strong>Treaments to Date</strong></td>
        <td style="padding-top:10px; padding-bottom: 0px;">
            <euc:EformCheckBoxList ShowOther="true" RecordId="112" TABLE="SurveyItems" FIELD="SurveyItemResult" Runat="server" ID="SurveyItemResult_112" 
                RepeatLayout="Flow" CellSpacing="5" RepeatDirection="Vertical" >
                <asp:ListItem  Value="Oral">Oral</asp:ListItem>
			    <asp:ListItem  Value="ILV">ILV</asp:ListItem>
            </euc:EformCheckBoxList></td>
    </tr>
    <tr> 
        <td>&nbsp;</td>
        <td style="padding-top:5px;">Operative:&nbsp;
            <euc:EformCheckBoxList RecordId="113" TABLE="SurveyItems" FIELD="SurveyItemResult" Runat="server" ID="SurveyItemResult_113" 
                RepeatLayout="Flow" CellSpacing="5" RepeatDirection="Horizontal" >
                <asp:ListItem  Value="Nesbit">Nesbit&nbsp;</asp:ListItem>
			    <asp:ListItem  Value="PIG">PIG&nbsp;</asp:ListItem>
			    <asp:ListItem  Value="IPP">IPP&nbsp;</asp:ListItem>
            </euc:EformCheckBoxList></td>
    </tr><%--
    <tr>
        <td style="padding-top:14px;"><strong>Comments</strong></td>
        <td style="padding-top:14px;"><euc:EformTextArea TextMode="MultiLine" RecordId="6" Table="Surveys" Field="SurveyNotes" ID="SurveyNotes_6" runat="server" Width="450px" /></td>
    </tr> --%>
</table><br /><br />