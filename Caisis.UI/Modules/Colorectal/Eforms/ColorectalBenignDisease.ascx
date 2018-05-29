<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Colorectal.Eforms.ColorectalBenignDisease" CodeFile="ColorectalBenignDisease.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<a name="ColorectalBenignDisease" />
<span class="controlBoxTitle">Benign Disease</span><br />

<table border="0" cellspacing="0" cellpadding="16" width="600" class="eformLargePopulatedTable">

  <tr>
    <td style="padding-top: 12px;">
	<euc:EformExtendedCheckBoxList ShowOther="true" Table="Encounters" Field="EncChiefComplaint" id="EncChiefComplaint" RepeatLayout="Table" RepeatDirection="Vertical" runat="server">
			<asp:ListItem Value="Abscess" Text="Abscess"  />
            <asp:ListItem Value="Crohn's Disease" Text="Crohn's Disease"  />
            <asp:ListItem Value="Diverticulitis" Text="Diverticulitis"  />
            <asp:ListItem Value="Fissure" Text="Fissure"  />
            <asp:ListItem Value="Fistula" Text="Fistula"  />
            <asp:ListItem Value="Fibrosis" Text="Fibrosis"  />
            <asp:ListItem Value="Hemorrhoids" Text="Hemorrhoids"  />
            <asp:ListItem Value="Radiation Colitis" Text="Radiation Colitis"  />
            <asp:ListItem Value="Ulcerative Colitis" Text="Ulcerative Colitis"  />
		</euc:EformExtendedCheckBoxList>
	
	</td>
  </tr>
  <tr>
    <td style="padding-top: 12px;">
	<strong>Notes on Benign Disease</strong><br />


  		    <euc:EformTextArea TextMode="MultiLine" TABLE="Encounters" FIELD="EncNotes" Rows="12" style="width:550px;" Runat="server" ID="EncNotes"/>	    </td>	

  </tr>  
  
</table>
<br/><br/>