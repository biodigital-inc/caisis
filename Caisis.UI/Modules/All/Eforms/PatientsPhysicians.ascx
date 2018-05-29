<%@ Control Language="c#" Inherits="Caisis.UI.Modules.All.Eforms.PatientsPhysicians" CodeFile="PatientsPhysicians.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<script type="text/javascript" language="javascript">
	tableArray.PatientsPhysiciansHtmlTable = "PatientsPhysiciansHtmlTable";
</script>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>
<link href="../../../ClientScripts/Admin.js" type="text/jscript" />

<script type="text/javascript">
           
     function setPatientIdPhysicianNameFields(patientID,patientIDvalue,physicianID, physicianNameID)
     {
              
           if(physicianID.value != '' && patientIDvalue.value != '' )
           {
           
            patientID.value = patientIDvalue;
                     
            }else{
            patientID.value = '';
            
           }
           
           if (physicianNameID != '')
           {

                var SelValue = physicianID[physicianID.selectedIndex].text
                physicianNameID.value = SelValue;
            
                     
            }
            else
            {
            physicianNameID.value = '';
           }
     } 
        
    function popupAddEditPhysician(pageName)
    {
        var eformID = document.getElementById('<%= HiddenEformID.ClientID %>').value;
        var eformName = document.getElementById('<%= HiddenEformName.ClientID %>').value;
        var sectionName = document.getElementById('<%= HiddenSectionName.ClientID %>').value;
        
        if (eformID != '' && eformName != '' && sectionName != '')
            saveAndLoad(eformID, eformName, sectionName);

        window.open(pageName, 'Physicians', 'toolbars=no,resize=no,scrollbars=no,width=900,height=480,left=50,top=200');
    } 


</script>

<euc:CaisisTextBox Width="1px" style="display: none;" ID="HiddenEformID" runat="server" />
<euc:CaisisTextBox Width="1px" style="display: none;" ID="HiddenEformName" runat="server" />
<euc:CaisisTextBox Width="1px" style="display: none;" ID="HiddenSectionName" runat="server" />

<table width="550">
<tr>
        <td valign="bottom" align="left">
        <a name="PatientsPhysicians" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Patient Physicians"></asp:Label><br/>       
        </td>

        <td valign="top" align="right">
            <a href="javascript:popupAddEditPhysician('../Utilities/AddEditPhysicians.aspx?newWindow=true');window.close();">
                <img alt="" src="../../images/AddANewPhysicianButton.gif" width="94" height="27" border="0" style="margin-top:10px"/>
            </a>
        </td>
</tr>
</table>
<table width="550" cellpadding="3" cellspacing="0" class="ClinicalEformTable" id="PatientsPhysiciansHtmlTable">
	<tr> 
		<td align="left" style="white-space:nowrap; width: 150px;"  class="controlBoxDataGridTitleColumn">Physician</td>
		<td align="left"  style="white-space:nowrap;"  class="controlBoxDataGridTitleColumn">Role</td>
		<td align="left"  style="white-space:nowrap;"  class="controlBoxDataGridTitleColumn">Notes</td>
		<td align="left"  style="white-space:nowrap;"  class="controlBoxDataGridTitleColumn">&nbsp;</td>
	</tr>
	
	<asp:Repeater ID="PtPhys" runat="server" OnItemDataBound="EFormRepeaterOnDataBound"> 
		<ItemTemplate> 
			<tr class="ClinicalEformPopulatedRow" onmouseover="this.className='ClinicalEformHighlightedRow';" onmouseout="this.className='ClinicalEformPopulatedRow';"  onclick="LoadDataEntryForm('PatientPhysicians', <%# DataBinder.Eval(Container.DataItem, "PatientPhysicianId") %>, 'PhysicianId,PtPhRole,PhSpecialty,PtPhNotes ', 'PatientPhysicians');"> 
				<td class="ClinicalEformPopulatedColumn" style="white-space: nowrap;"><%# DataBinder.Eval(Container.DataItem, "PhFirstName")%>&nbsp;<%# DataBinder.Eval(Container.DataItem, "PhLastName")%>&nbsp;[Specialty:&nbsp;<asp:Literal ID="ResultField" Runat="server" />]</td> 
				<td class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "PtPhRole")%>&nbsp;</td>
				<td class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "PtPhNotes")%>&nbsp;</td>
				<td class="ClinicalEformPopulatedColumn"><img alt="" align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="OtherLockImage" runat="server" title="This record has been locked."/>&nbsp;</td>
			</tr>      
		</ItemTemplate>
	</asp:Repeater>
	
	<tr> 
        <td style="white-space: nowrap;">
                 <euc:EformDropDownList style="width:250px;"  RecordId="1"  ID="PhysicianId_1" TABLE="PatientPhysicians" Field="PhysicianId" LookupDistinct="Physicians;PhysicianId;COALESCE(PhLastName,'') + ', ' + COALESCE(PhFirstName,'') + '&nbsp;&nbsp;&nbsp;[Specialty: ' + COALESCE(PhSpecialty,'Not Specified') + ']'" Runat="server" EnableHiddenOnUIEvent="PatientId_1,PhName_1" />
                 <euc:EformHidden id="PatientId_1" TABLE="PatientPhysicians" Field="PatientId" RecordId="1" runat="server"/>
                 <euc:EformHidden id="PhName_1" TABLE="NoTable" Field="PatientPhysicians_PhName_1" runat="server"/></td>
        <td style="white-space: nowrap;">
                <euc:EformComboBox DropDownWidth="auto"  style="width:80px;"  RecordId="1"  ID="PtPhRole_1"   TABLE="PatientPhysicians" FIELD="PtPhRole" LookupCode="PtPhRole"  Runat="server"  /></td>
        <td style="white-space: nowrap;">
                <euc:EformTextBox   style="width: 80px;" RecordId="1"  ID="PtPhNotes_1"  TABLE="PatientPhysicians" FIELD="PtPhNotes" Runat="server" ShowTextEditor="true" /></td>
        <td><euc:EformDeleteIcon runat="server" /></td>

  </tr>
  <tr style="display: none;" > 
        <td style="white-space: nowrap;">
                 <euc:EformDropDownList style="width:250px;"  RecordId="2"  ID="PhysicianId_2" TABLE="PatientPhysicians" Field="PhysicianId" LookupDistinct="Physicians;PhysicianId;COALESCE(PhLastName,'') + ', ' + COALESCE(PhFirstName,'') + '&nbsp;&nbsp;&nbsp;[Specialty: ' + COALESCE(PhSpecialty,'Not Specified') + ']'" Runat="server" EnableHiddenOnUIEvent="PatientId_2,PhName_2"/>
                 <euc:EformHidden id="PatientId_2" TABLE="PatientPhysicians" Field="PatientId" RecordId="2" runat="server"/>
                 <euc:EformHidden id="PhName_2" TABLE="NoTable" Field="PatientPhysicians_PhName_2" runat="server"/></td>
        <td style="white-space: nowrap;">
                <euc:EformComboBox  style="width:80px;"  RecordId="2"  ID="PtPhRole_2"   TABLE="PatientPhysicians" FIELD="PtPhRole" LookupCode="PtPhRole"  Runat="server"  /></td>
        <td style="white-space: nowrap;">
                <euc:EformTextBox   style="width: 80px;" RecordId="2"  ID="PtPhNotes_2"  TABLE="PatientPhysicians" FIELD="PtPhNotes" Runat="server" ShowTextEditor="true" /></td>
        <td><euc:EformDeleteIcon  runat="server" /></td>
  </tr>
    <tr style="display: none;" > 
        <td style="white-space: nowrap;">
                 <euc:EformDropDownList style="width:250px;"  RecordId="3"  ID="PhysicianId_3" TABLE="PatientPhysicians" Field="PhysicianId" LookupDistinct="Physicians;PhysicianId;COALESCE(PhLastName,'') + ', ' + COALESCE(PhFirstName,'') + '&nbsp;&nbsp;&nbsp;[Specialty: ' + COALESCE(PhSpecialty,'Not Specified') + ']'" Runat="server" EnableHiddenOnUIEvent="PatientId_3,PhName_3"/>
                 <euc:EformHidden id="PatientId_3" TABLE="PatientPhysicians" Field="PatientId" RecordId="3" runat="server"/>
                 <euc:EformHidden id="PhName_3" TABLE="NoTable" Field="PatientPhysicians_PhName_3" runat="server"/></td>
         <td style="white-space: nowrap;">
                <euc:EformComboBox  style="width:80px;"  RecordId="3"  ID="PtPhRole_3"   TABLE="PatientPhysicians" FIELD="PtPhRole" LookupCode="PtPhRole"  Runat="server"  /></td>
        <td style="white-space: nowrap;">
                <euc:EformTextBox   style="width: 80px;" RecordId="3"  ID="PtPhNotes_3"  TABLE="PatientPhysicians" FIELD="PtPhNotes" Runat="server" ShowTextEditor="true" /></td>
        <td><euc:EformDeleteIcon  runat="server" /></td>
  </tr>
  <tr style="display: none;" > 
        <td style="white-space: nowrap;">
                 <euc:EformDropDownList style="width:250px;"  RecordId="4"  ID="PhysicianId_4" TABLE="PatientPhysicians" Field="PhysicianId" LookupDistinct="Physicians;PhysicianId;COALESCE(PhLastName,'') + ', ' + COALESCE(PhFirstName,'') + '&nbsp;&nbsp;&nbsp;[Specialty: ' + COALESCE(PhSpecialty,'Not Specified') + ']'" Runat="server" EnableHiddenOnUIEvent="PatientId_4,PhName_4"/>
                 <euc:EformHidden id="PatientId_4" TABLE="PatientPhysicians" Field="PatientId" RecordId="4" runat="server"/>
                 <euc:EformHidden id="PhName_4" TABLE="NoTable" Field="PatientPhysicians_PhName_4" runat="server"/></td>
        <td style="white-space: nowrap;">
                <euc:EformComboBox  style="width:80px;"  RecordId="4"  ID="PtPhRole_4"   TABLE="PatientPhysicians" FIELD="PtPhRole" LookupCode="PtPhRole"  Runat="server"  /></td>
        <td style="white-space: nowrap;">
                <euc:EformTextBox   style="width: 80px;" RecordId="4"  ID="PtPhNotes_4"  TABLE="PatientPhysicians" FIELD="PtPhNotes" Runat="server" ShowTextEditor="true" /></td>
        <td><euc:EformDeleteIcon  runat="server" /></td>
  </tr>
  <tr style="display: none;" > 
        <td style="white-space: nowrap;">
                 <euc:EformDropDownList style="width:250px;"  RecordId="5"  ID="PhysicianId_5" TABLE="PatientPhysicians" Field="PhysicianId" LookupDistinct="Physicians;PhysicianId;COALESCE(PhLastName,'') + ', ' + COALESCE(PhFirstName,'') + '&nbsp;&nbsp;&nbsp;[Specialty: ' + COALESCE(PhSpecialty,'Not Specified') + ']'" Runat="server" EnableHiddenOnUIEvent="PatientId_5,PhName_5"/>
                 <euc:EformHidden id="PatientId_5" TABLE="PatientPhysicians" Field="PatientId" RecordId="5" runat="server"/>
                 <euc:EformHidden id="PhName_5" TABLE="NoTable" Field="PatientPhysicians_PhName_5" runat="server"/></td>
        <td style="white-space: nowrap;">
                <euc:EformComboBox  style="width:80px;"  RecordId="5"  ID="PtPhRole_5"   TABLE="PatientPhysicians" FIELD="PtPhRole" LookupCode="PtPhRole"  Runat="server"  /></td>
        <td style="white-space: nowrap;">
                <euc:EformTextBox   style="width: 80px;" RecordId="5"  ID="PtPhNotes_5"  TABLE="PatientPhysicians" FIELD="PtPhNotes" Runat="server" ShowTextEditor="true" /></td>
        <td><euc:EformDeleteIcon  runat="server" /></td>
  </tr>
  <tr style="display: none;" > 
        <td style="white-space: nowrap;">
                 <euc:EformDropDownList style="width:250px;"  RecordId="6"  ID="PhysicianId_6" TABLE="PatientPhysicians" Field="PhysicianId" LookupDistinct="Physicians;PhysicianId;COALESCE(PhLastName,'') + ', ' + COALESCE(PhFirstName,'') + '&nbsp;&nbsp;&nbsp;[Specialty: ' + COALESCE(PhSpecialty,'Not Specified') + ']'" Runat="server" EnableHiddenOnUIEvent="PatientId_6,PhName_6"/>
                 <euc:EformHidden id="PatientId_6" TABLE="PatientPhysicians" Field="PatientId" RecordId="6" runat="server"/>
                 <euc:EformHidden id="PhName_6" TABLE="NoTable" Field="PatientPhysicians_PhName_6" runat="server"/></td>
        <td style="white-space: nowrap;">
                <euc:EformComboBox  style="width:80px;"  RecordId="6"  ID="PtPhRole_6"   TABLE="PatientPhysicians" FIELD="PtPhRole" LookupCode="PtPhRole"  Runat="server"  /></td>
        <td style="white-space: nowrap;">
                <euc:EformTextBox   style="width: 80px;" RecordId="6"  ID="PtPhNotes_6"  TABLE="PatientPhysicians" FIELD="PtPhNotes" Runat="server" ShowTextEditor="true" /></td>
        <td><euc:EformDeleteIcon  runat="server" /></td>
  </tr>
  <tr style="display: none;" > 
        <td style="white-space: nowrap;">
                 <euc:EformDropDownList style="width:250px;"  RecordId="7"  ID="PhysicianId_7" TABLE="PatientPhysicians" Field="PhysicianId" LookupDistinct="Physicians;PhysicianId;COALESCE(PhLastName,'') + ', ' + COALESCE(PhFirstName,'') + '&nbsp;&nbsp;&nbsp;[Specialty: ' + COALESCE(PhSpecialty,'Not Specified') + ']'" Runat="server" EnableHiddenOnUIEvent="PatientId_7,PhName_7"/>
                 <euc:EformHidden id="PatientId_7" TABLE="PatientPhysicians" Field="PatientId" RecordId="7" runat="server"/>
                 <euc:EformHidden id="PhName_7" TABLE="NoTable" Field="PatientPhysicians_PhName_7" runat="server"/></td>
        <td style="white-space: nowrap;">
                <euc:EformComboBox  style="width:80px;"  RecordId="7"  ID="PtPhRole_7"   TABLE="PatientPhysicians" FIELD="PtPhRole" LookupCode="PtPhRole"  Runat="server"  /></td>
        <td style="white-space: nowrap;">
                <euc:EformTextBox   style="width: 80px;" RecordId="7"  ID="PtPhNotes_7"  TABLE="PatientPhysicians" FIELD="PtPhNotes" Runat="server" ShowTextEditor="true" /></td>
        <td><euc:EformDeleteIcon  runat="server" /></td>
  </tr>
  <tr style="display: none;" > 
        <td style="white-space: nowrap;">
                 <euc:EformDropDownList style="width:250px;"  RecordId="8"  ID="PhysicianId_8" TABLE="PatientPhysicians" Field="PhysicianId" LookupDistinct="Physicians;PhysicianId;COALESCE(PhLastName,'') + ', ' + COALESCE(PhFirstName,'') + '&nbsp;&nbsp;&nbsp;[Specialty: ' + COALESCE(PhSpecialty,'Not Specified') + ']'" Runat="server" EnableHiddenOnUIEvent="PatientId_8,PhName_8"/>
                 <euc:EformHidden id="PatientId_8" TABLE="PatientPhysicians" Field="PatientId" RecordId="8" runat="server"/>
                 <euc:EformHidden id="PhName_8" TABLE="NoTable" Field="PatientPhysicians_PhName_8" runat="server"/></td>
        <td style="white-space: nowrap;">
                <euc:EformComboBox  style="width:80px;"  RecordId="8"  ID="PtPhRole_8"   TABLE="PatientPhysicians" FIELD="PtPhRole" LookupCode="PtPhRole"  Runat="server"  /></td>
        <td style="white-space: nowrap;">
                <euc:EformTextBox   style="width: 80px;" RecordId="8"  ID="PtPhNotes_8"  TABLE="PatientPhysicians" FIELD="PtPhNotes" Runat="server" ShowTextEditor="true" /></td>
        <td><euc:EformDeleteIcon  runat="server" /></td>
  </tr>
   <tr style="display: none;" > 
        <td style="white-space: nowrap;">
                 <euc:EformDropDownList style="width:250px;"  RecordId="9"  ID="PhysicianId_9" TABLE="PatientPhysicians" Field="PhysicianId" LookupDistinct="Physicians;PhysicianId;COALESCE(PhLastName,'') + ', ' + COALESCE(PhFirstName,'') + '&nbsp;&nbsp;&nbsp;[Specialty: ' + COALESCE(PhSpecialty,'Not Specified') + ']'" Runat="server" EnableHiddenOnUIEvent="PatientId_9,PhName_9"/>
                 <euc:EformHidden id="PatientId_9" TABLE="PatientPhysicians" Field="PatientId" RecordId="9" runat="server"/>
                 <euc:EformHidden id="PhName_9" TABLE="NoTable" Field="PatientPhysicians_PhName_9" runat="server"/></td>
        <td style="white-space: nowrap;">
                <euc:EformComboBox  style="width:80px;"  RecordId="9"  ID="PtPhRole_9"   TABLE="PatientPhysicians" FIELD="PtPhRole" LookupCode="PtPhRole"  Runat="server"  /></td>
        <td style="white-space: nowrap;">
                <euc:EformTextBox   style="width: 80px;" RecordId="9"  ID="PtPhNotes_9"  TABLE="PatientPhysicians" FIELD="PtPhNotes" Runat="server" ShowTextEditor="true" /></td>
        <td><euc:EformDeleteIcon  runat="server" /></td>
  </tr>
  <tr style="display: none;" > 
        <td style="white-space: nowrap;">
                 <euc:EformDropDownList style="width:250px;"  RecordId="10"  ID="PhysicianId_10" TABLE="PatientPhysicians" Field="PhysicianId" LookupDistinct="Physicians;PhysicianId;COALESCE(PhLastName,'') + ', ' + COALESCE(PhFirstName,'') + '&nbsp;&nbsp;&nbsp;[Specialty: ' + COALESCE(PhSpecialty,'Not Specified') + ']'" Runat="server" EnableHiddenOnUIEvent="PatientId_10,PhName_10"/>
                 <euc:EformHidden id="PatientId_10" TABLE="PatientPhysicians" Field="PatientId" RecordId="10" runat="server"/><euc:EformHidden id="PhName_10" TABLE="NoTable" Field="PatientPhysicians_PhName_10" runat="server"/></td>
        <td style="white-space: nowrap;">
                <euc:EformComboBox  style="width:80px;"  RecordId="10"  ID="PtPhRole_10"   TABLE="PatientPhysicians" FIELD="PtPhRole" LookupCode="PtPhRole"  Runat="server"  /></td>
        <td style="white-space: nowrap;">
                <euc:EformTextBox   style="width: 80px;" RecordId="10"  ID="PtPhNotes_10"  TABLE="PatientPhysicians" FIELD="PtPhNotes" Runat="server" ShowTextEditor="true" /></td>
        <td><euc:EformDeleteIcon  runat="server" /></td>
  </tr>
</table>
<img alt="" src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'PatientsPhysiciansHtmlTable');" />
<br/><br/><br />