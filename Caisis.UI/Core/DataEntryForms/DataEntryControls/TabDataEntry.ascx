<%@ Control Language="C#" AutoEventWireup="true" CodeFile="TabDataEntry.ascx.cs"
    Inherits="Caisis.UI.Core.DataEntry.TabDataEntry" %>
<input type="hidden" id="<%= this.ClientID %>_Index" name="<%= this.ClientID %>_Index" value="" />
<div id="<%= this.ClientID %>" class="EditDataEntryForm_ChildTable PatientDataSubformTabContainer" style="position: relative;" >
    <div class="EditDataEntryForm_ChildTableTitleOuterContainer">
        <%-- TAB Headers --%>
        <asp:PlaceHolder runat="server" ID="TabTitles"></asp:PlaceHolder>
        
        <asp:PlaceHolder runat="server" ID="MoreTabs" Visible="false">
        <div id="MoreTabAndMenuContainer">
        <asp:PlaceHolder runat="server" ID="MoreTabsHeader">
            <span id="<%= this.ClientID %>_MoreTab" style="z-index: 101; position: relative;"
                class="EditDataEntryForm_ChildTableTitleInnerContainer PDMoreTab" title="View/Add subform data" >
                <span id="<%= this.ClientID %>_Text" class="EditDataEntryForm_ChildTableTitle" style="font-size: 11px; padding-left: 8px; padding-right: 3px;">More
                    <img alt="More" src="<%= Page.ResolveUrl("~/Images/MoreMenu_arrowDown.png") %>" />
                </span>                
            </span>
        </asp:PlaceHolder>
        
        
         </div>
        
            <div id="<%= HasTabs ? "moreMenuContainer" : "moreMenuContainerNoTabs"  %>">
                <div id="patientDataMenuContents">
                <div id="patientDataMenuTitleBar" class="PDMoreTabOn" style="font-size: 11px;">More <img alt="More" src="<%= Page.ResolveUrl("~/Images/MoreMenu_arrowDown.png") %>" /></div>
                    <asp:PlaceHolder runat="server" ID="MoreTabsContent">
                        <asp:Panel runat="server" ID="MoreTabsItems">
                        </asp:Panel>
                </asp:PlaceHolder>
                    
                </div>
            </div>
            
        </asp:PlaceHolder>
        
   </div>     
        <%-- TAB Content --%>
        <asp:PlaceHolder runat="server" ID="TabContent"></asp:PlaceHolder>
        
    
</div>
