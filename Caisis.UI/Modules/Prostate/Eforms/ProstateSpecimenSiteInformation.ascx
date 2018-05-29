<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Prostate.Eforms.ProstateSpecimenSiteInformation" CodeFile="ProstateSpecimenSiteInformation.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>
 <script type="text/javascript" src="../../../ClientScripts/utilities.js"></script>
 
<a name="ProstateSpecimenSiteInformation" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Site Collection Information"></asp:Label><br/>

<euc:EformTextBox Width="1px" style="display: none;"  ID="PathInstitution_1" runat="server" RecordId="1" Table="Pathology" Field="PathInstitution"></euc:EformTextBox>

<asp:Panel ID="ShowExistingSitesPNL" runat="server" style="display: none;">
    <table border="0" cellpadding="6" cellspacing="0" class="eformLargePopulatedTable" id="Table1" >
        <tr id="ShowSitesDIV" runat="server">
            <td style="white-space: nowrap;" ><strong>Select the Collection Site: </strong>
                <euc:EformDropDownList Width="300px"  ID="SpecimenCollectionSitesDDL" runat="server" Table="NoTable" Field="ExistingCollectionSiteName" LookupDistinct="ProjectOrganization;Name;Name"   />        	
            </td>    
        </tr>
        <tr id="NoSitesDIV" runat="server" style="display: none;">
            <td style="white-space: nowrap;" >
                <span  class="ClinicalEformPopulatedColumn" > No Specimen Collection Sites exist.</span>             	

            </td>    
        </tr>
    </table>
</asp:Panel>

<asp:Panel ID="ShowCreateSitePNL" runat="server" style="display: none;">
    <table border="0" cellpadding="6" cellspacing="0" class="eformLargePopulatedTable" id="HtmlTable" > 
        <tr>
        <td align="left" valign="top" style="white-space: nowrap;"><strong>Name of Collection Site: </strong></td>
        <td  align="left" valign="top" style="white-space: nowrap;">
            <euc:EformTextBox Width="300px" ID="SitePathInstitution1_1" runat="server" Table="NoTable" Field="ExistingCollectionSiteName" ></euc:EformTextBox></td>
        </tr>

        <tr><td align="left" valign="top" style="white-space: nowrap;"><strong>Address Line 1: </strong></td><td  align="left" valign="top" style="white-space: nowrap;">
            <euc:EformTextBox ID="SiteAddress1_1" runat="server" Table="NoTable" Field="SiteAddress1" Width="300px" MaxLength="100"></euc:EformTextBox>
        </td></tr>
        <tr><td align="left" valign="top" style="white-space: nowrap;"><strong>Address Line 2: </strong></td><td  align="left" valign="top" style="white-space: nowrap;">
            <euc:EformTextBox ID="SiteAddress2_1" runat="server" Table="NoTable" Field="SiteAddress2" Width="300px" MaxLength="100"></euc:EformTextBox>
        </td></tr>
        <tr><td align="left" valign="top" style="white-space: nowrap;"><strong>City/State: </strong></td><td  align="left" valign="top" style="white-space: nowrap;">
            <euc:EformTextBox ID="SiteCity_1" runat="server" Table="NoTable" Field="SiteCity" Width="200px" MaxLength="50"></euc:EformTextBox>
            <euc:EformComboBox DropDownWidth="auto" ID="SiteState_1" runat="server" Table="NoTable" Field="SiteState" Width="50px" MaxLength="50" LookupCode="State"></euc:EformComboBox>
        </td></tr>
        <tr><td align="left" valign="top" style="white-space: nowrap;"><strong>Postal Code/Country: </strong></td><td  align="left" valign="top" style="white-space: nowrap;">
            <euc:EformTextBox ID="SitePostalCode_1" runat="server" Table="NoTable" Field="SitePostalCode" Width="80px" MaxLength="20"></euc:EformTextBox>
            <euc:EformComboBox DropDownWidth="auto" ID="SiteCountry_1" runat="server" Table="NoTable" Field="SiteCountry" Width="100px" MaxLength="50" LookupCode="Country"></euc:EformComboBox>

            <euc:EformTextBox Width="1px" style="display: none;" ID="PathNotes_1" runat="server" RecordId="1" Table="Pathology" Field="PathNotes" ></euc:EformTextBox>

            <euc:EformTextBox Width="1px" style="display: none;" ID="ShortName_1" runat="server" RecordId="1" Table="ProjectOrganization" Field="ShortName" ></euc:EformTextBox>
            <euc:EformTextBox Width="1px" style="display: none;" ID="Name_1" runat="server" RecordId="1" Table="ProjectOrganization" Field="Name" ></euc:EformTextBox>
            <euc:EformTextBox Width="1px" style="display: none;" ID="Address1_1" runat="server" RecordId="1" Table="ProjectOrganization" Field="Address1" ></euc:EformTextBox>
            <euc:EformTextBox Width="1px" style="display: none;" ID="Address2_1" runat="server" RecordId="1" Table="ProjectOrganization" Field="Address2" ></euc:EformTextBox>
            <euc:EformTextBox Width="1px" style="display: none;" ID="City_1" runat="server" RecordId="1" Table="ProjectOrganization" Field="City" ></euc:EformTextBox>
            <euc:EformTextBox Width="1px" style="display: none;" ID="State_1" runat="server" RecordId="1" Table="ProjectOrganization" Field="State" ></euc:EformTextBox>
            <euc:EformTextBox Width="1px" style="display: none;" ID="Country_1" runat="server" RecordId="1" Table="ProjectOrganization" Field="Country" ></euc:EformTextBox>
            <euc:EformTextBox Width="1px" style="display: none;" ID="PostalCode_1" runat="server" RecordId="1" Table="ProjectOrganization" Field="PostalCode" ></euc:EformTextBox>

              
                      
        <%--                <euc:EformTextBox Width="1px" style="display: none;" ID="UserId_1" runat="server" RecordId="1" Table="ProjectOrganization" Field="UserId" ></euc:EformTextBox>
            <euc:CaisisTextBox Width="1px" style="display: none;" ID="HiddenUserID" runat="server" ></euc:CaisisTextBox>
        --%>

        </td></tr>
              

    </table>
</asp:Panel>

<br /><br /><br />

<script type="text/javascript">
     addAbsentEvent($('<%= SitePathInstitution1_1.ClientID %>'),$('<%= SiteAddress1_1.ClientID %>'),$('<%= SiteAddress2_1.ClientID %>'),$('<%= SiteCity_1.ClientID %>'),$('<%= SiteState_1.ClientID %>'),$('<%= SiteCountry_1.ClientID %>'),$('<%= SitePostalCode_1.ClientID %>'),$('<%= PathNotes_1.ClientID %>'));
   
    function addAbsentEvent(institution,address1,address2,city,state,country,zip,notes)
    {          
        $(institution).addEvent('blur',curry(SetHiddenFields,institution,address1,address2,city,state,country,zip,notes));
        $(address1).addEvent('blur',curry(SetHiddenFields,institution,address1,address2,city,state,country,zip,notes));
        $(address2).addEvent('blur',curry(SetHiddenFields,institution,address1,address2,city,state,country,zip,notes));
        $(city).addEvent('blur',curry(SetHiddenFields,institution,address1,address2,city,state,country,zip,notes));
        $(state).addEvent('blur',curry(SetHiddenFields,institution,address1,address2,city,state,country,zip,notes));
        $(country).addEvent('blur',curry(SetHiddenFields,institution,address1,address2,city,state,country,zip,notes));
        $(zip).addEvent('blur',curry(SetHiddenFields,institution,address1,address2,city,state,country,zip,notes));
        
        $('<%= SpecimenCollectionSitesDDL.ClientID %>').addEvent('blur',curry(SetHiddenFields,institution,address1,address2,city,state,country,zip,notes));

        ShowOnLoad(institution,address1,address2,city,state,country,zip,notes);
    }

   
    /* ]]> */
    
    
    function ShowOnLoad(institution,address1,address2,city,state,country,zip,notes)
    {
        var existingSiteDDL =  document.getElementById('<%= SpecimenCollectionSitesDDL.ClientID %>');
        var value = document.getElementById('<%= PathInstitution_1.ClientID %>').value;
        
         // set value as selected if already in ddl
        for ( var i = 0; i < existingSiteDDL.options.length; i++ ) 
        {
            if ( existingSiteDDL.options[i].value == value ) 
            {
                existingSiteDDL.options[i].selected = true;    
                break;               
            }
        }           

    }
    
    function SetHiddenFields(institution,address1,address2,city,state,country,zip,notes)
	{
        var newSitePNL =  document.getElementById('<%= ShowCreateSitePNL.ClientID %>');
        var existingSitePNL =  document.getElementById('<%= ShowExistingSitesPNL.ClientID %>');
        var existingSiteDDL =  document.getElementById('<%= SpecimenCollectionSitesDDL.ClientID %>');

	    if (newSitePNL.style.display == '' && (institution.value != '' || address1.value != '' || address2.value != '' || city.value != '' || state.value != '' || country.value != '' || zip.value != '') )
	    {   
	        notes.value = "Specimen Collection Site Address: ";
	        document.getElementById('<%= Name_1.ClientID %>').value = institution.value;   
	        document.getElementById('<%= ShortName_1.ClientID %>').value = "Specimen Collection Site Address";
	        
	        if (address1.value != '')
	        {
	            notes.value = notes.value + address1.value + " ";	
	            document.getElementById('<%= Address1_1.ClientID %>').value = address1.value;      
	        }      
	        if (address2.value != '')
	        {
	            notes.value = notes.value + address2.value + " ";
	            document.getElementById('<%= Address2_1.ClientID %>').value = address2.value;
	        }
	        if (city.value != '')
	        {
	            notes.value = notes.value + city.value;
	            document.getElementById('<%= City_1.ClientID %>').value = city.value;
	            
	            if (state.value != '')
	            {
	                notes.value = notes.value + ", " + state.value;
	                document.getElementById('<%= State_1.ClientID %>').value = state.value;
	            }
	        }
	        else
	        {
	            if (state.value != '')
	            {
	                notes.value = notes.value + state.value;
	                document.getElementById('<%= State_1.ClientID %>').value = state.value;
	            }	        
	        }
	        if (zip.value != '')
	        {
	            notes.value = notes.value + " " + zip.value;
	            document.getElementById('<%= PostalCode_1.ClientID %>').value = zip.value;
	        }
	        if (country.value != '')
	        {
	            notes.value = notes.value + " " + country.value;
	            document.getElementById('<%= Country_1.ClientID %>').value = country.value;
	        }
	            	    	    
	    }
	    else if (existingSitePNL.style.display == '')
	    {	        
	        document.getElementById('<%= PathInstitution_1.ClientID %>').value = existingSiteDDL.options[existingSiteDDL.selectedIndex].value;	        	        
	    }

	}
	
</script>


