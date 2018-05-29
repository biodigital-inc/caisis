<%@ Control Language="C#" Inherits="Caisis.UI.Modules.Pancreas.Eforms.Surgery_IPMN" CodeFile="Surgery_IPMN.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl"%>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>


<style type="text/css">
table.Surgery_IPMN_HTMLTable
{
}
table.Surgery_IPMN_HTMLTable td
{
    padding: 8px 4px 4px 8px;
}
td.PancreasRadioButtonCellContainer label
{
    margin-right: 10px;
}
table#FluidsHTMLTable
{
    border: solid 1px #cccccc;
    border-collapse: collapse;
}
table#FluidsHTMLTable th
{
    border: solid 1px #cccccc;
    background-color: #e4e4e4;
    color: #111111;
    padding: 2px 4px 2px 4px;
    font-size: 10px;
    font-weight: bold;
    text-align: center;
}
table#FluidsHTMLTable td
{
    border: solid 1px #cccccc;
    background-color: #ffffff;
    padding: 0px 0px 0px 0px;
    text-align: center;
}
table#AdditionalProceduresHTMLTable
{
}
table#AdditionalProceduresHTMLTable td
{
    padding: 0px 0px 0px 0px;
}


</style>

<a name="Surgery_IPMN" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Surgery"></asp:Label><br/>
<table border="0" cellspacing="0" class="eformLargePopulatedTable Surgery_IPMN_HTMLTable" >

    <tbody id="OpDetails">
    <tr>
        <td >Surgery Date</td>
        <td><euc:EformTextBox Runat="server" RecordId="1"  ID="OpDateText" TABLE="OperatingRoomDetails" FIELD="OpDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"  />
		<euc:EformHidden RecordId="1" Runat="server" ID="OpDate" Table="OperatingRoomDetails" Field="OpDate"></euc:EformHidden></td>
    </tr>
    <tr>
        <td >Procedure</td>
        <td><euc:EformDropDownList  Runat="server" RecordId="1" table="Procedures"  ID="ProcName_1" field="ProcName"   Width="200" >
	        <asp:ListItem Value="">&nbsp;</asp:ListItem>
	        <asp:ListItem Value="Standard PD">Standard PD</asp:ListItem>
	        <asp:ListItem Value="PPPD">PPPD</asp:ListItem>
	        <asp:ListItem Value="Distal Pancreatectomy / Splenectomy">Distal Pancreatectomy / Splenectomy</asp:ListItem>
	        <asp:ListItem Value="Distal Pancreatectomy">Distal Pancreatectomy</asp:ListItem>
	        <asp:ListItem Value="Central Pancreatectomy">Central Pancreatectomy</asp:ListItem>
	        <asp:ListItem Value="Total Pancreatectomy">Total Pancreatectomy</asp:ListItem>
	        <asp:ListItem Value="Enucleation">Enucleation</asp:ListItem>
        </euc:EformDropDownList></td>
    </tr>
    <tr>
        <td >Laparoscopy Performed</td>
        <td class="PancreasRadioButtonCellContainer">
        <euc:EformRadioButtonList RecordId="1" TABLE="Procedures" FIELD="ProcApproach" id="ProcApproach_1" CellSpacing="0" RepeatLayout="Flow" RepeatDirection="Horizontal" runat="server" Uncheckable="true" >
	        <asp:ListItem Value="Laparoscopic">Yes</asp:ListItem>
	        <asp:ListItem Value="">No</asp:ListItem>
        </euc:EformRadioButtonList>
        
        </td>
    </tr><%--
    <tr>
        <td >Intraoperative Fluid Given (mL)</td>
        <td>
            <table cellpadding="0" cellspacing="0" id="FluidsHTMLTable">
                <tr>
                    <th>Total</th>
                    <th>Crystalloid</th>
                    <th>Colloid</th>
                </tr>
                <tr>
                    <td><euc:EformTextBox Runat="server" RecordId="1"  ID="OpFluids" TABLE="OperatingRoomDetails" FIELD="OpFluids" style="width:50px;" /></td>
                    <td><euc:EformTextBox Runat="server" RecordId="1"  ID="OpCrystalloid" TABLE="OperatingRoomDetails" FIELD="OpCrystalloid" style="width:50px;" /></td>
                    <td><euc:EformTextBox Runat="server" RecordId="1"  ID="OpColloid" TABLE="OperatingRoomDetails" FIELD="OpColloid" style="width:50px;" /></td>
                </tr>
            </table></td>
    </tr>
    <tr>
        <td >Estimated Blood Loss</td>
        <td><euc:EformTextBox Runat="server" RecordId="1"  ID="OpEstBloodLoss" TABLE="OperatingRoomDetails" FIELD="OpEstBloodLoss" style="width:60px;" /> mL</td>
    </tr>
    <tr>
        <td >IntraOp RBC Transfused</td>
        <td><euc:EformTextBox Runat="server" RecordId="1"  ID="OpRBC_IntraOp" TABLE="OperatingRoomDetails" FIELD="OpRBC_IntraOp" style="width:60px;" /> mL</td>
    </tr>
    <tr>
        <td >IntraOp FFP Transfused</td>
        <td><euc:EformTextBox Runat="server" RecordId="1"  ID="OpFFP_IntraOp" TABLE="OperatingRoomDetails" FIELD="OpFFP_IntraOp" style="width:60px;" /> mL</td>
    </tr>
    <tr>
        <td >Procedure Duration</td>
        <td><euc:EformTextBox Runat="server" RecordId="1"  ID="OpDuration" TABLE="OperatingRoomDetails" FIELD="OpDuration" style="width:60px;" /> min</td>
    </tr>
    <tr>
        <td >Urine Output, IntraOp</td>
        <td><euc:EformTextBox Runat="server" RecordId="1"  ID="OpUrineOutput" TABLE="OperatingRoomDetails" FIELD="OpUrineOutput" style="width:60px;" /> mL</td>
    </tr> --%>
    <tr>
        <td >Concomitant Major Procedure</td>
        <td id="ConcomitantProcedureToggleContainer">
            <euc:EformRadioButtonList RecordId="1" TABLE="OperatingRoomDetails" FIELD="OpNotes" LookupCode="YesNoUnknown" id="OpNotes" CellSpacing="0" RepeatLayout="Flow" RepeatDirection="Horizontal" runat="server" />
        </td>
    </tr>
    </tbody>
    <tbody id="ConcommittantProcedures" style="display: none;">
    <tr>
        <td style="vertical-align: top;" >Additional Procedures</td>
        <td>
            <table cellspacing="0" id="AdditionalProceduresHTMLTable">
            <tr>
            <td><euc:EformCheckBox runat="server" Table="Procedures" RecordId="2" Field="ProcName" id="ProcName_2" Value="Vein Resection (SMV/PV)"  />Vein Resection (SMV/PV)</td>
            </tr>
            <tr>
            <td><euc:EformCheckBox runat="server" Table="Procedures" RecordId="3" Field="ProcName" id="ProcName_3" Value="Splenectomy"  />Splenectomy</td>
            </tr>
            <tr>
            <td style="padding-top: 10px; font-size: 12px; font-weight: bold;">Other:</td>
            </tr>
            <tr>
            <td > <euc:EformComboBox  runat="server" LookupCode="ProcName" style="width:250px;" Field="ProcName"   RecordId="4" Table="Procedures" id="ProcName_4" /></td>
            </tr>
            <tr>
            <td > <euc:EformComboBox  runat="server" LookupCode="ProcName" style="width:250px;" Field="ProcName"   RecordId="5" Table="Procedures" id="ProcName_5" /></td>
            </tr>
            
            
           
            </table>
        
            
        
        </td>
    </tr>
    </tbody>
    <tbody id="PancreasProcDetails">
    
    <tr>
        <td >Gland Texture</td>
        <td><euc:EformDropDownList  Runat="server" RecordId="1" table="PancreasProc"  ID="ProcGlandTexture" field="ProcGlandTexture"  ShowEmptyListItem="true" Width="150" >
	        <asp:ListItem Value="">&nbsp;</asp:ListItem>
	        <asp:ListItem Value="Hard">Hard</asp:ListItem>
	        <asp:ListItem Value="Soft">Soft</asp:ListItem>
	        <asp:ListItem Value="Unknown">Unknown</asp:ListItem>
        </euc:EformDropDownList></td>
    </tr>
    <tr>
        <td >IntraOp Pancreatic Duct Size</td>
        <td><euc:EformTextBox Runat="server" RecordId="1"  ID="ProcPancreaticDuctSize" TABLE="PancreasProc" FIELD="ProcPancreaticDuctSize" style="width:60px;" /> mm</td>
    </tr>
    <tr>
        <td >IntraOp Bile Duct Size</td>
        <td><euc:EformTextBox Runat="server" RecordId="1"  ID="ProcBileDuctSize" TABLE="PancreasProc" FIELD="ProcBileDuctSize" style="width:60px;" /> mm</td>
    </tr>
    </tbody>
</table>
<br/><br/><br/>



<script type="text/javascript">
    showHideBasedOnRadioToggle($('ConcomitantProcedureToggleContainer'), $('ConcommittantProcedures'), 'Yes');
</script>
