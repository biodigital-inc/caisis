<%@ Control EnableViewState="false" Language="c#" Inherits="Caisis.UI.Core.PatientLists.PatientListMenus"
    CodeFile="PatientListMenus.ascx.cs" CodeFileBaseClass=" Caisis.UI.Core.Classes.BaseControl" %>
<%@ Register TagPrefix="custom" Namespace="Caisis.UI.Core.Classes" %>
<!-- Patient List Menu -->
<ul id="menu">
    <!-- Clinic Menu -->
    <li title="View all patients scheduled for a physician's clinic."><a>clinic</a>
        <ul style="width: 20em; overflow: auto; height: 40em;">
            <asp:Repeater ID="rptClinicPhysicians" runat="server">
                <ItemTemplate>
                    <li><a href="PatListContent.aspx?listType=Clinic&listCrit=<%# Server.UrlEncode(Eval("ApptPhysician").ToString()) %>"
                        target="patientListContent">
                        <%# Eval("ApptPhysician")%>
                    </a></li>
                </ItemTemplate>
            </asp:Repeater>
            <asp:Repeater ID="rptInPatientServices" runat="server">
                <ItemTemplate>
                    <li><a href="PatListContent.aspx?listType=InPatient&listCrit=<%# Server.UrlEncode(Eval("InPtService").ToString()) %>"
                        target="patientListContent">In Patient:
                        <%# Eval("InPtService")%>
                    </a></li>
                </ItemTemplate>
            </asp:Repeater>
        </ul>
    </li>
    <!-- Patient's Last Name Menu -->
    <li title="View patients listed alphabetically by last name."><a>last name</a>
        <ul style="width: 89px;">
            <li><a href="#" onclick="goToList('lastname','All','');">All</a></li>
            <li><a href="#" onclick="goToList('lastname','A','');">A</a></li>
            <li><a href="#" onclick="goToList('lastname','B','');">B</a></li>
            <li><a href="#" onclick="goToList('lastname','C','');">C</a></li>
            <li><a href="#" onclick="goToList('lastname','D','');">D</a></li>
            <li><a href="#" onclick="goToList('lastname','E','');">E</a></li>
            <li><a href="#" onclick="goToList('lastname','F','');">F</a></li>
            <li><a href="#" onclick="goToList('lastname','G','');">G</a></li>
            <li><a href="#" onclick="goToList('lastname','H','');">H</a></li>
            <li><a href="#" onclick="goToList('lastname','I','');">I</a></li>
            <li><a href="#" onclick="goToList('lastname','J','');">J</a></li>
            <li><a href="#" onclick="goToList('lastname','K','');">K</a></li>
            <li><a href="#" onclick="goToList('lastname','L','');">L</a></li>
            <li><a href="#" onclick="goToList('lastname','M','');">M</a></li>
            <li><a href="#" onclick="goToList('lastname','N','');">N</a></li>
            <li><a href="#" onclick="goToList('lastname','O','');">O</a></li>
            <li><a href="#" onclick="goToList('lastname','P','');">P</a></li>
            <li><a href="#" onclick="goToList('lastname','Q','');">Q</a></li>
            <li><a href="#" onclick="goToList('lastname','R','');">R</a></li>
            <li><a href="#" onclick="goToList('lastname','S','');">S</a></li>
            <li><a href="#" onclick="goToList('lastname','T','');">T</a></li>
            <li><a href="#" onclick="goToList('lastname','U','');">U</a></li>
            <li><a href="#" onclick="goToList('lastname','V','');">V</a></li>
            <li><a href="#" onclick="goToList('lastname','W','');">W</a></li>
            <li><a href="#" onclick="goToList('lastname','X','');">X</a></li>
            <li><a href="#" onclick="goToList('lastname','Y','');">Y</a></li>
            <li><a href="#" onclick="goToList('lastname','Z','');">Z</a></li>
        </ul>
    </li>
    <!-- Contact Status Menu -->
    <li title="List patients by contact status."><a>contact status</a>
        <ul style="width: 15em;">
            <asp:Repeater ID="rptStatus" runat="server">
                <ItemTemplate>
                    <li><a href="PatListContent.aspx?listType=ContactStatus&listCrit=<%# Server.UrlEncode(Eval("PtContactStatus").ToString()) %>"
                        target="patientListContent">
                        <%# Eval("PtContactStatus")%>
                        &nbsp;&nbsp;(<%# Eval("NumberOfPatients")%>)</a></li>
                </ItemTemplate>
            </asp:Repeater>
        </ul>
    </li>
     <!-- Actions Menu -->
    <li title="List patients by assigned Actions."><a>actions</a>
        <ul style="overflow: auto; height: 45em; width: 30em;">
            <asp:Repeater ID="rptActions" runat="server">
                <ItemTemplate>
                    <li><a href="PatListContent.aspx?listType=ActionItem&listCrit=<%# Server.UrlEncode(Eval("ActionItem").ToString()) %>"
                        target="patientListContent">
                        <%# Eval("ActionItem")%>
                        &nbsp;&nbsp;(<%# Eval("ActionCount")%>)</a></li>
                </ItemTemplate>
            </asp:Repeater>
        </ul>
    </li>
    <!-- Categories Menu -->
    <li title="View all patients associated with a user-defined category."><a>category</a>
        <ul style="overflow: auto; height: 45em; width: 19em;">
            <asp:Repeater ID="rptCategories" OnItemDataBound="rptCategoriesOnItemBound" runat="server">
                <ItemTemplate>
                    <li><a href="PatListContent.aspx?listType=Category&listCrit=<%# Server.UrlEncode(Eval("Category").ToString()) %>&listCritName=<%# Server.UrlEncode(Eval("CategoryType").ToString()) %>"
                        target="patientListContent">
                        <%# Eval("Category")%>
                        <asp:Literal ID="CategoryType" runat="server" />
                    </a></li>
                </ItemTemplate>
            </asp:Repeater>
        </ul>
    </li>
    <!-- Protocols Menu (Ajax Based) -->
    <li title="List patients by protocol."><a>protocols</a>
        <ul id="ProtocolsMenu" style="width: 89px;" class="AjaxMenu">
            <li><a href="#" onclick="getMenu(this,'Protocols','0');">0</a></li>
            <li><a href="#" onclick="getMenu(this,'Protocols','1');">1</a></li>
            <li><a href="#" onclick="getMenu(this,'Protocols','2');">2</a></li>
            <li><a href="#" onclick="getMenu(this,'Protocols','3');">3</a></li>
            <li><a href="#" onclick="getMenu(this,'Protocols','4');">4</a></li>
            <li><a href="#" onclick="getMenu(this,'Protocols','5');">5</a></li>
            <li><a href="#" onclick="getMenu(this,'Protocols','6');">6</a></li>
            <li><a href="#" onclick="getMenu(this,'Protocols','7');">7</a></li>
            <li><a href="#" onclick="getMenu(this,'Protocols','8');">8</a></li>
            <li><a href="#" onclick="getMenu(this,'Protocols','9');">9</a></li>
            <li><a href="#" onclick="getMenu(this,'Protocols','A-E');">A - E</a></li>
            <li><a href="#" onclick="getMenu(this,'Protocols','F-J');">F - J</a></li>
            <li><a href="#" onclick="getMenu(this,'Protocols','K-O');">K - O</a></li>
            <li><a href="#" onclick="getMenu(this,'Protocols','P-T');">P - T</a></li>
            <li><a href="#" onclick="getMenu(this,'Protocols','U-Z');">U - Z</a></li>
        </ul>
    </li>
    <!-- Physicians Menu (Ajax Based) -->
    <li title="List patients by referring physician."><a href="#">physicians</a>
        <ul id="PhysiciansMenu" style="width: 89px;" class="AjaxMenu">
            <li><a href="#" onclick="getMenu(this,'Physicians','A');">A</a></li>
            <li><a href="#" onclick="getMenu(this,'Physicians','B');">B</a></li>
            <li><a href="#" onclick="getMenu(this,'Physicians','C');">C</a></li>
            <li><a href="#" onclick="getMenu(this,'Physicians','D');">D</a></li>
            <li><a href="#" onclick="getMenu(this,'Physicians','E');">E</a></li>
            <li><a href="#" onclick="getMenu(this,'Physicians','F');">F</a></li>
            <li><a href="#" onclick="getMenu(this,'Physicians','G');">G</a></li>
            <li><a href="#" onclick="getMenu(this,'Physicians','H');">H</a></li>
            <li><a href="#" onclick="getMenu(this,'Physicians','I');">I</a></li>
            <li><a href="#" onclick="getMenu(this,'Physicians','J');">J</a></li>
            <li><a href="#" onclick="getMenu(this,'Physicians','K');">K</a></li>
            <li><a href="#" onclick="getMenu(this,'Physicians','L');">L</a></li>
            <li><a href="#" onclick="getMenu(this,'Physicians','M');">M</a></li>
            <li><a href="#" onclick="getMenu(this,'Physicians','N');">N</a></li>
            <li><a href="#" onclick="getMenu(this,'Physicians','O');">O</a></li>
            <li><a href="#" onclick="getMenu(this,'Physicians','P');">P</a></li>
            <li><a href="#" onclick="getMenu(this,'Physicians','Q');">Q</a></li>
            <li><a href="#" onclick="getMenu(this,'Physicians','R');">R</a></li>
            <li><a href="#" onclick="getMenu(this,'Physicians','S');">S</a></li>
            <li><a href="#" onclick="getMenu(this,'Physicians','T');">T</a></li>
            <li><a href="#" onclick="getMenu(this,'Physicians','U');">U</a></li>
            <li><a href="#" onclick="getMenu(this,'Physicians','V');">V</a></li>
            <li><a href="#" onclick="getMenu(this,'Physicians','W');">W</a></li>
            <li><a href="#" onclick="getMenu(this,'Physicians','X');">X</a></li>
            <li><a href="#" onclick="getMenu(this,'Physicians','Y');">Y</a></li>
            <li><a href="#" onclick="getMenu(this,'Physicians','Z');">Z</a></li>
        </ul>
    </li>
    <!-- Missing and Pending Items MENU-->
    <li title="View patients with pending or missing items."><a>pending items</a>
        <ul>
            <li><a href="PatListContent.aspx?listType=ItemsMissing&listCrit=all" target="patientListContent">
                Missing Items</a></li>
            <li><a href="PatListContent.aspx?listType=ItemsPending&listCrit=all" target="patientListContent">
                Pending Items</a></li>
        </ul>
    </li>
</ul>
