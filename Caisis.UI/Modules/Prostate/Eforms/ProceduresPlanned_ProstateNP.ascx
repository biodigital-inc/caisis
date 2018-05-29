<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Prostate.Eforms.ProceduresPlanned_ProstateNP" CodeFile="ProceduresPlanned_ProstateNP.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<style type="text/css">
.ProceduresPlannedTable td
{
    padding: 0px 0px 0px 0px;
}
td.ProceduresPlannedOuterRow
{
    border-bottom: solid 1px #cccccc;
}
</style>

<a name="ProceduresPlanned_ProstateNP"  />
<asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Procedures Planned" /><br/>
<table border="0" cellspacing="0"  width="650"  class="eformLargePopulatedTable" >
  <tr>
    <td class="ProceduresPlannedOuterRow" >
    
        <table id="ProstatectomyRow" class="ProceduresPlannedTable" cellspacing="0">
            <tr>
                <td id="PlannedProstatectomyToggleContainer">
                <euc:EformCheckBox runat="server" Table="ProceduresPlanned" RecordId="1" Field="ProcNotes" id="ProcNotes" Value="Radical Prostatectomy"   />Radical Prostatectomy
                </td>
                <td id="PlannedProstatectomyDetailsContainer" style="padding-left: 20px;">
                    <table class="ProceduresPlannedTable" cellspacing="0">
                        <tr>
                            <td>
                             <strong>Date</strong>
                                <euc:EformTextBox  Width="80px" RecordId="1"  TABLE="ProceduresPlanned" FIELD="ProcDateText" ID="ProcDateText_1" Runat="server" TabIndex="1"  ShowCalendar="true" CalcDate="true"  />
                                <euc:EformHidden RecordId="1"  TABLE="ProceduresPlanned" FIELD="ProcDate" ID="ProcDate_1" Runat="server"/>
                            </td>
                            <td style="padding-left: 20px;" >
                            
                             <strong>Type</strong>
                                <euc:EformRadioButtonList RepeatLayout="Flow" RepeatDirection="Horizontal" TABLE="ProceduresPlanned" FIELD="ProcName" id="ProcName_1" runat="server">
				                            <asp:ListItem  Value="RP">Open&nbsp;&nbsp;</asp:ListItem>
				                            <asp:ListItem  Value="LP">Laparoscopic&nbsp;&nbsp;</asp:ListItem>
				                            <asp:ListItem Value="RALP">Robot Assisted</asp:ListItem>
	                            </euc:EformRadioButtonList>
                            
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    
	</td>
  </tr>
  
  <tr>
    <td class="ProceduresPlannedOuterRow" >
        <euc:EformCheckBox runat="server" Table="ProceduresPlanned" RecordId="2" Field="ProcName" id="ProcName_2" Value="PLND"  />PLND
    </td>
    </tr>
  
  <tr>
    <td class="ProceduresPlannedOuterRow" >
        <euc:EformCheckBox runat="server" Table="ProceduresPlanned" RecordId="3" Field="ProcName" id="ProcName_3" Value="Nerve Graft"  />Nerve Graft
    </td>
    </tr>
    
  
  
    <td class="ProceduresPlannedOuterRow" >
    
        <table id="ProstatectomyRow" class="ProceduresPlannedTable" cellspacing="0">
            <tr>
                <td id="PlannedOtherProcToggleContainer">
                <euc:EformCheckBox runat="server" Table="ProceduresPlanned" RecordId="4" Field="ProcNotes" id="ProcNotes_4" Value="Other"   />Other
                </td>
                <td id="PlannedOtherProcDetailsContainer">:&nbsp;&nbsp;
                
                    <euc:EformComboBox runat="server" style="width:400px;" LookupCode="ProcName" Field="ProcName" DropDownWidth="400" RecordId="4" Table="ProceduresPlanned" MaxLength="50" id="ProcName_4"  />
                
                
                </td>
            </tr>
        </table>
    
	</td>
  </tr>
</table>
<br/><br/><br/>

<script type="text/javascript">
showHideBasedOnCheckboxToggle($('PlannedProstatectomyToggleContainer'), $('PlannedProstatectomyDetailsContainer'));
showHideBasedOnCheckboxToggle($('PlannedOtherProcToggleContainer'), $('PlannedOtherProcDetailsContainer'));
</script>