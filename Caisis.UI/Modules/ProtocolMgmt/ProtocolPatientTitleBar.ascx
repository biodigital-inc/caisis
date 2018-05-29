<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ProtocolPatientTitleBar.ascx.cs"
    Inherits="Caisis.UI.Modules.ProtocolMgmt.ProtocolPatientTitleBar" %>
<%@ Register TagPrefix="ajax" Namespace="Caisis.UI.ClientScript.Ajax" %>

<script type="text/javascript">
    /* <![CDATA[ */

    // current study id
    var STUDY_ID = '<%= StudyIdField.Text %>';

    // gets the textbox value of studyid
    function getStudyId() {
        return document.getElementById('<%= StudyIdField.ClientID %>').value;
    }

    // make a call to server to update study id
    function doUpdateStudyId(e) {
        // validate study id field
        var newStudyId = getStudyId();
        // make call to server to update study id
        if (newStudyId != '') {
            if (newStudyId != STUDY_ID) {
                // invoke callback method
                doServerUpdateStudy(newStudyId);
            }
            else {
                deactivateUpdateStudyId();
                // do nothing, study id is active
            }
        }
        else {
            alert('Please enter a valid StudyId.');
        }
        return false;
    }

    // check if update successful, i.e., test update study id = current textbox value
    function onServerUpdateStudyId(message) {
        var studyId = getStudyId();
        // if value "echoed" back, ok
        if (message == studyId) {
            // update active study id
            STUDY_ID = studyId;
            deactivateUpdateStudyId();
            // refresh list on main page to reflect new study id
            if (parent.reloadListAndCalendar) { parent.reloadListAndCalendar(); }
        }
        // othwise a problem
        else {
            alert(message);
            activateUpdateSudyId();
            // focus on field and reset to last active study id
            var field = document.getElementById('<%= StudyIdField.ClientID %>');
            field.focus();
            setStudyIdField(STUDY_ID);
        }
    }

    function setStudyIdField(val) {
        var field = document.getElementById('<%= StudyIdField.ClientID %>');
        field.value = STUDY_ID;
        syncStudyIdFields();
    }

    function syncStudyIdFields() {
        document.getElementById('StudyIdTitle').innerHTML = getStudyId();
    }

    function activateUpdateSudyId() {
        var field = document.getElementById('<%= StudyIdField.ClientID %>');
        var label = document.getElementById('StudyIdTitle');
        field.style.display = '';
        label.style.display = 'none';
    }

    function deactivateUpdateStudyId() {
        var field = document.getElementById('<%= StudyIdField.ClientID %>');
        var label = document.getElementById('StudyIdTitle');
        field.style.display = 'none';
        label.style.display = '';
    }

    /* ]]> */
    </script>

<%-- Ajax helper used for updating study id --%>
<ajax:CaisisAjaxHelper runat="server" DoCallbackScript="doServerUpdateStudy" OnCallbackScript="onServerUpdateStudyId"
    OnProcessCallback="UpdateStudyId">
</ajax:CaisisAjaxHelper>
<div class="PatientTitleBar">
    <div id="CustomProtocolText">
        <asp:Label runat="server" ID="PatientName" Style="font-weight: bold;"></asp:Label>
        <span class="PatientTitleBarLabel" onclick="activateUpdateSudyId(this);"
            onfocus="activateUpdateSudyId(this);" title="Click To Edit">Study ID: 
            <asp:TextBox runat="server" ID="StudyIdField" autocomplete="off"
                onkeyup="syncStudyIdFields();" onkeypress="if(event.keyCode==13) { stopBubble(event); return false; }"
                Style="display: none; vertical-align: text-top; border-style: none; color: #ffffff;
                font-weight: bold; background-color: inherit; width: 50px; background-image: url(Images/PatientTitleBarSeparatorLine.gif);"
                onblur="doUpdateStudyId();"></asp:TextBox>
            <span id="StudyIdTitle" style="width: 50px;">
                <%= StudyIdField.Text %></span></span> <span id="PatientProtocolStatus" class="PatientTitleBarLabel">
                </span><span class="PatientTitleBarLabel">Start Date:
                    <asp:Label runat="server" ID="PatientStartDate"></asp:Label></span>
        <span id="PatientnextVisitDate" class="PatientTitleBarLabel">Next Visit:
            <asp:Label runat="server" ID="NextVisitDate"></asp:Label></span>
        <span class="boldText" style="position: absolute; top: 5px; right: 50px; font-size: 12px;">[Protocol <asp:Label
                    runat="server" ID="ProtocolTitle" />]</span> 
    </div>
</div>
