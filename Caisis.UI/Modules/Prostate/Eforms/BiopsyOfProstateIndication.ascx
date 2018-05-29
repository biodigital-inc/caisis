<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Prostate.Eforms.BiopsyOfProstateIndication" CodeFile="BiopsyOfProstateIndication.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<style type="text/css">
.lastProstateStatusText
{
    font-size: 11px;
    font-weight: bold;
}
</style>


<span class="controlBoxTitle">TRUS Biopsy</span><br/>
<table border="0" cellspacing="0" cellpadding="16" width="600" class="eformLargePopulatedTable">
 <tr >
	<td ><strong>Procedure Date</strong><br/>
		<euc:EformTextBox id="ProcDateText" Table="Procedures" RecordId="1" Field="ProcDateText" ShowCalendar="True" CalcDate="True" Runat="server"/>
		<euc:EformHidden  id="ProcDate" Table="Procedures" RecordId="1" Field="ProcDate"  Runat="server"/>
	</td>
	<td ><strong>Physician</strong><br/>
		<euc:EformComboBox LookupCode="ApptPhysician" id="ProcSurgeon" Table="Procedures" Field="ProcSurgeon" runat="server"/>
<%-- 		<euc:EformHidden id="EncType" Table="Encounters" Field="EncType" runat="server"/>--%>
	</td>
  </tr>
</table>
<br/><br/><br/><table border="0" cellspacing="0" cellpadding="0" width="680">
<tr>
<td width="50%">
<span class="controlBoxTitle">Indication for Biopsy</span><br/>
</td>
<td width="50%">
<span class="controlBoxTitle">Procedure</span><br/>
</td>
</tr>
<tr>
<td valign="top"><a name="BiopsyOfProstateIndication" id="BiopsyOfProstateIndication" />



<table border="0" cellspacing="0" width="95%" class="eformLargePopulatedTable">

 <tr >
	<td>
	
	<table cellspacing="0" id="lastProstateStatusTable" runat="server" visible="false">
	    <tr>
	        <td class="lastProstateStatusText" style="white-space: nowrap; padding-right: 6px; vertical-align: top;">Last Status: </td>
	        <td class="lastProstateStatusText"><asp:Label id="lastProstateStatus" runat="server" /></td>
	    </tr>
	</table>
	
	
	
	<br/>		
		<euc:EformCheckBoxList Table="Procedures" RecordId="1"  Field="ProcIndication" id="ProcIndication" ShowOther="true" RepeatLayout="Table" RepeatDirection="Vertical" runat="server" EnableHiddenOnUIEvent="ProcSite,ProcQuality,ProcDataSource,ProcInstitution,ProcDateText,ProcDate">		
			<asp:ListItem  >Active Surveillance</asp:ListItem>
			<asp:ListItem  >Restaging</asp:ListItem>
		    <asp:ListItem  >Elevated PSA</asp:ListItem>
			<asp:ListItem  >Prostate Nodule/Abnormality</asp:ListItem>
			<asp:ListItem  >Post Radiation</asp:ListItem>
			<asp:ListItem  >Abnormal MRI</asp:ListItem>
	    </euc:EformCheckBoxList>
<%-- 	    <euc:EformHidden Table="Procedures" RecordId="1"  Field="ProcName" id="ProcName"  runat="server" Value="TRUS Biopsy" />--%>
        <euc:EformHidden Table="Procedures" RecordId="1"  Field="ProcSite " id="ProcSite" runat="server" Value="Prostate" />
        <euc:EformHidden Table="Procedures" RecordId="1"  Field="ProcDataSource" id="ProcDataSource" runat="server" Value="EForm" />
        <euc:EformHidden Table="Procedures" RecordId="1"  Field="ProcQuality" id="ProcQuality"  runat="server" Value="STD" />
        <euc:EformHidden Runat="server" ID="ProcInstitution" Table="Procedures" RecordId="1"  Field="ProcInstitution" Value="Memorial Sloan Kettering Cancer Center" />
	</td>
  </tr>
 </table>
</td>
<td valign="top">



<table border="0" cellspacing="0" width="100%" class="eformLargePopulatedTable" style="margin-bottom: 1.5em;">






    <tr>
    <td style="padding: 5px 5px 5px 5px;"><euc:EformRadioButtonList Table="Procedures" RecordId="1" Field="ProcName" id="ProcName" RepeatLayout="Table" RepeatDirection="Vertical" runat="server">		
			<asp:ListItem  >TRUS Biopsy</asp:ListItem>
			<asp:ListItem  >TRUS Fiducial Marker Placement Only</asp:ListItem>
	        </euc:EformRadioButtonList>
    
    </td></tr>
 </table>



<a name="BiopsyOfProstateFiducialMarkers" id="BiopsyOfProstateFiducialMarkers" />
<span class="controlBoxTitle">Fiducial Markers</span><br/>

<table border="0" cellspacing="0" width="100%" class="eformLargePopulatedTable">


 <tr >
	<td style="padding: 12px 5px; font-weight: bold;">
    Subsite</td>
    <td style="padding: 12px 5px;">	
    <euc:EformCheckBox ID="FiducialMarkerSubsite" Table="ProcedureFinding" RecordId="1" ParentRecordId="1" Field="ProcFindSubsite" runat="server" Value="Right Apex, Right Base, Left Base" Text="Right Apex, Right Base, Left Base"/>

    </td>

  </tr>
    <tr>
    <td style="padding: 5px 5px 5px 5px; font-weight: bold;">Type</td>
    <td style="padding: 5px 5px 5px 5px;"><euc:EformRadioButtonList Table="ProcedureFinding" RecordId="1" ParentRecordId="1" Field="ProcFindNotes" id="FiducialMarkerType" RepeatLayout="Table" RepeatDirection="Horizontal" runat="server">		
			<asp:ListItem  >Calypso</asp:ListItem>
			<asp:ListItem  >Gold</asp:ListItem>
	        </euc:EformRadioButtonList>
    
    </td></tr>
 </table>

</td>
</tr>
<tr>
<td style="padding-top: 30px;" >
<span class="controlBoxTitle">Consent Form</span>
</td>
<td style="padding-top: 30px;" >
<span class="controlBoxTitle">Antibiotics Prior to Biopsy</span>
</td></tr>
<tr>
<td valign="top">
<a name="BiopsyOfProstateConsentForm" id="BiopsyOfProstateConsentForm" />


<table border="0" cellspacing="0" width="95%" class="eformLargePopulatedTable">

 <tr >
	<td><br/>		
			<euc:EformRadioButtonList Table="NoTable" Field="ConsentForm" id="ConsentForm" RepeatLayout="Table" RepeatDirection="Vertical" runat="server">		
			<asp:ListItem  >Yes</asp:ListItem>
			<asp:ListItem  >No</asp:ListItem>
	        </euc:EformRadioButtonList>		       
	</td>

  </tr>
 </table>
<br/><br/>
</td>
<td valign="top">
<a name="BiopsyOfProstateAntibioticsPriorBx" id="BiopsyOfProstateAntibioticsPriorBx" />
<table border="0" cellspacing="0" width="100%" class="eformLargePopulatedTable">

 <tr >
	<td colspan="2"><br/>		
			<euc:EformRadioButtonList Table="NoTable" Field="AntibioticPriorToBx" id="AntibioticPriorToBx" RepeatLayout="Table" RepeatDirection="Vertical" runat="server">		
			<asp:ListItem  >Yes</asp:ListItem>
			<asp:ListItem  >No</asp:ListItem>
	        </euc:EformRadioButtonList>		       
	</td>
    <td style="padding: 15px 5px 5px 5px; width: 65%;"><span style="font-weight: bold;"> Type</span>
			<euc:EformComboBox DropDownHeight="auto" Table="Medications" RecordId="1" Field="Medication" id="AntibioticPriorToBxType" LookupCode="Medication,EForm_ProstateTRUS,true" runat="server" ShowEmptyListItem="true" />
    </td></tr>
 </table>
<br/><br/>
</td></tr>
</table>
<br/><br/>