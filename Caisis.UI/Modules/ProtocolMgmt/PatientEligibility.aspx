<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PatientEligibility.aspx.cs"
    Inherits="Caisis.UI.Modules.ProtocolMgmt.PatientEligibility" %>
    <%@ Register TagPrefix="cic" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>PatientEligibility</title>
    <link rel="stylesheet" type="text/css" href="../../StyleSheets/GlobalStyles.css" />
    <link rel="stylesheet" type="text/css" href="StyleSheets/ProtocolMgmtStyles.css" />
    <script type="text/javascript" src="../../ClientScripts/utilities.js"></script>
    <script type="text/javascript" src="ProtocolMgmtScripts.js"></script>
    <script type="text/javascript" src="../../ClientScripts/jquery.js"></script>
    <script type="text/javascript">
    /* <![CDATA[ */

        jQuery.noConflict();
        
        jQuery(document).ready(function(e) {

        });



        var GRID_OVERFLOW_OFFSET = 135;
        var activeRadio = null;
        var overrideBit = null;
        var overrideReason = null;
        function onWindowResize() { adjustHeaderWidth(); adjustOverflow(); }

        function adjustOverflow() {
            // adjust height of grid overflow div
            var gridOverflow = $('GridOverflow');
            if (gridOverflow==null) { return; }
            var styleHeight = (getHeight(window) - GRID_OVERFLOW_OFFSET) + 'px';
            gridOverflow.style.height = styleHeight;
            // adjust width of cover layer to cover grid
            var coverLayer = $('CoverLayer');
            var grid = $('PatientEligibilityGrid');
            if (coverLayer && grid) {
                coverLayer.style.height = styleHeight;
                coverLayer.style.width = grid.offsetWidth + 'px';
            }
        }

        function adjustHeaderWidth() {
            var header = $('QuestionsHeaderTable');
            var grid = $('PatientEligibilityGrid');
            if (header && grid) {
                header.style.width = grid.offsetWidth + 'px';
            }
        }

        function onResponseSelected(radio, response, e) {
            var _radio = jQuery(radio);
            var _tr = _radio.parents("TR");
            // radios
            var eligible = _tr.find("input[value='Eligible']");
            var ineligible = _tr.find("input[value='Ineligible']");
            var na = _tr.find("input[value='N/A']");
            // override
            var _hidden = _tr.find("input[name*='Hidden']");
            var _reason=  _tr.find("input[name*='Reason']");
            if(response != 'Ineligible') {
                _hidden.val("");
                _reason.val("");
            }
            else if(response == 'Ineligible') {
                jQuery('#PatientIneligiblePopup').show();
                activeRadio = ineligible;
                overrideBit = _hidden;
                overrideReason = _reason;
                // set bit
                _hidden.val("1");
            }
        }

        function resetOverrideFields(radio, supressCheck) {
            var _radio = jQuery(radio);
            var _tr = _radio.parents("TR");
            // radios
            var eligible = _tr.find("input[value='Eligible']");
            var ineligible = _tr.find("input[value='Ineligible']");
            var na = _tr.find("input[value='N/A']");
            // override
            var _hidden = _tr.find("input[name*='Hidden']");
            var _reason=  _tr.find("input[name*='Reason']");
            // uncheck ineligible
            if(ineligible.size() > 0)
                ineligible[0].checked = false;
            // when unchecked ineligible, check default value for row,
            // unless supressed by clicking of other radio
            if (!supressCheck) {
                if(eligible.size() > 0)
                    eligible[0].checked = eligible[0].defaultChecked;
                if(na.size() > 0)
                    na[0].checked = na[0].defaultChecked;
            }
            // bit field set to '', and reason is ''
            _hidden.val("");
            _reason.val("");
        }

        // Resets the override bit and reason
        function resetOverrideBit(cb, name) {
            resetOverrideFields($(cb.id.replace(name, 'InEligibleRadio')), true);
        }

        function closeQuestionnaire() {
            if (confirm('Are you sure you want to end this Questionnaire?')) {
                saveIneligibileAndReload();
            }
            else {
                closeIneligible();
            }
            return false;
        }

        function closeIneligible() {
            jQuery("#PatientIneligiblePopup").hide();
            activeRadio = null;
            overrideBit = null;
            overrideReason = null;
            return false;
        }

        function cancelIneligible() {
            if(activeRadio)
                resetOverrideFields(activeRadio);
            return closeIneligible();
        }

        var ALLOW_NO_OVERRRIDE_REASON = true;

        function closeAndOverrideIneligible() {
            var reasonField = jQuery("#OverrideTextArea");
            var reason = reasonField.val();
            // Active bit field and set reason value
            if(overrideBit)
                overrideBit.val("1");
            if(overrideReason)
                overrideReason.val(reason);
            // Reset text are field for next popup
            reasonField.val("");
            closeIneligible();
            return false;
        }

        function goToRegistration() {
            parent.setActiveTab('PatientRegistration');
            return false;
        }
        
        function goToSummary()
        {
            parent.setActiveTab('PatientSummary');
            return false;
        }

        // marks form as ineligible and updates
        function saveIneligibileAndReload() {
            setInEligibleBit();
            // invoke server save click
            <%= DO_SAVE_INELIGIBLE %>();
            return false;
        }

        // sets hidden field that notifies form should be recorded ineligible after save
        function setInEligibleBit() {
            jQuery("InEligibleBit").val("1");
        }

    /* ]]> */
    </script>
    <style type="text/css">
        html
        {
            height: 100%;
        }
        body
        {
            min-height: 100%;
            padding: 0px;
            margin: 0px;
            background-color: #ffffff;
        }
        #MainContainer
        {
            width: 95%;
            margin: auto auto auto auto;
            clear: both;
        }
        .SurveyLink
        {
            display: block;
            float: left;
            margin-right: 5px;
        }
        #QuestionsHeaderTable
        {
            table-layout: fixed;
            width: 100%;
            margin: 0px;
        }
        #QuestionsHeaderTable tr
        {
            border: 1px solid #cccccc;
        }
        #QuestionsHeaderTable td
        {
            font-weight: bold;
            font-size: 12px;
        }
        .dataGrid
        {
            table-layout: fixed;
            width: 100%;
            margin: 0px;
            padding: 0px;
            border-style: none;
        }
        #GridOverflow
        {
            overflow: auto;
            padding: 5px;
            padding: 0px;
            margin-bottom: 0px;
            border: 1px solid #cccccc;
            overflow-x: hidden;
        }
        #PatientEligibilityGrid td
        {
            text-align: left;
            vertical-align: top;
            padding-top: 2px;
            padding-botton: 2px;
        }
        .QuestionLabel
        {
            display: block;
            white-space: normal;
            font-weight: bold;
        }
        .RadioButtonLabels
        {
            margin: 3px auto;
        }
        .RadioButtonLabel
        {
            display: block;
            width: 100%;
            height: 100%;
            margin: 0px;
        }
        .RadioButtonLabelSmall
        {
            display: block;
            width: 25px;
            height: 100%;
            margin: 0px auto 0px auto;
        }
        .RadioButtonColumn
        {
            text-align: center;
        }
        .RadioButtonNAColumn
        {
            text-align: center;
            border-left: solid 3px #999999;
        }
        .RadioButtonEligibleColumn
        {
            text-align: center;
            border-left: solid 1px #cccccc;
        }
        .RadioButtonIneligibleColumn
        {
            text-align: center;
            border-left: solid 1px #cccccc;
        }
        #UpdateBtn
        {
            float: right;
            margin-top: 5px;
        }
        #CoverLayer
        {
            position: absolute;
            width: 100%;
            height: 100%;
            margin: 0px;
            padding: 0px;
        }
        #CoverLayer div
        {
            position: absolute;
            width: 100%;
            height: 100%;
            margin: 0px;
            padding: 0px;
            background-color: #000000;
            opacity: .65;
            filter: alpha(opacity=65);
            z-index: 10;
        }
        #CoverLayer span
        {
            position: relative;
            top: 100px;
            margin: auto;
            font-weight: bold;
            font-size: 30px;
            color: #ffffff;
            vertical-align: middle;
            text-align: center;
            display: block;
            z-index: 11;
        }
        /* Ineligible Popup */.fullScreenLayer
        {
            width: 100%;
            height: 100%;
        }
        .fullScreenLayerBG
        {
            opacity: 0.6;
            -moz-opacity: 0.6;
            filter: alpha(opacity=60);
            background-color: #333333;
            border: #000000;
        }
        .ineligiblePopupContent
        {
            position: absolute;
            top: 50%;
            left: 50%;
            width: 660px;
            height: 446px;
            z-index: 102;
            margin: -223px auto auto -330px;
            background-image: url(images/IneligiblePopupBG.png);
            background-repeat: no-repeat;
        }
        .popupHeaderText
        {
            color: #ffffff;
            font-family: Arial, Helvetica, sans-serif;
            font-size: 15px;
            padding-left: 16px;
            padding-right: 20px;
            vertical-align: top;
        }
        .popupText
        {
            color: #000000;
            font-family: Arial, Helvetica, sans-serif;
            font-size: 12px;
            padding-left: 16px;
            padding-right: 16px;
            background-image: url(images/popupBullet.png);
            background-position: 0px 3px;
            background-repeat: no-repeat;
            vertical-align: top;
        }
        .popupSeparator
        {
            background-image: url(images/PopupSeparator.png);
            background-position: center;
            background-repeat: no-repeat;
            height: 70px;
        }
        #NoQuestionsLabel
        {
            padding-top: 150px;
        }
        .NoQuestionsLabel
        {
            margin: auto;
            text-align: center;
            font-weight: bold;
            font-size: 14px;
            border: solid 1px #cccccc;
            width: 520px;
        }
        #CurrentStatus
        {
            display: inline-block;
            position: absolute;
            font-weight: bold;
            font-size: 12px;
            top: 20px;
            right: 2.5%;
        }
        #EligibilityStatus
        {
            text-transform: uppercase;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <asp:HiddenField runat="server" ID="InEligibleBit" />
    <!-- Ineligible Popup Layer -->
    <div id="PatientIneligiblePopup" class="fullScreenLayer" style="position: absolute;
        z-index: 100; display: none;">
        <div class="fullScreenLayer fullScreenLayerBG" style="position: absolute; z-index: 101;">
            &nbsp;
        </div>
        <div id="ineligiblePopupContent" class="ineligiblePopupContent">
            <table cellpadding="0" cellspacing="0" style="margin-left: 44px; margin-top: 15px;
                width: 620px; border: 1px;">
                <tr>
                    <td colspan="2" class="popupHeaderText">
                        You have just selected "Inegligble" as a response on this questionnaire, making
                        this patient ineligible for Protocol
                        <%= ProtocolNumberText %>
                        .
                    </td>
                </tr>
                <tr>
                    <td class="popupText" style="font-size: 14px; padding-top: 34px; background-position: 0px 38px;">
                        If the patient is ineligible for the protocol it is not necessary to complete the
                        eligibility questionnaire. You may close out of the questionnaire and move on.
                    </td>
                    <td style="padding-top: 34px;">
                        <a href="#" onclick="return closeQuestionnaire();">
                            <img src="images/Button_CloseQuestionnaire.png" alt="Close Questionnaire" style="margin-right: 30px;
                                border: none;" /></a>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" class="popupSeparator">
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td class="popupText">
                        If you selected the Ineligible response accidentally, you can cancel your selection
                        and continue to entering data into the questionnaire.
                    </td>
                    <td>
                        <a href="#" onclick="return cancelIneligible();">
                            <img src="images/Button_ContinueEnteringData.png" alt="Continue Entering Data" style="margin-right: 30px;
                                border: none;" /></a>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" class="popupSeparator">
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td class="popupText">
                        If instead you would like to override the Ineligible status and continue entering
                        responses, you may do so here.<br />
                        <br />
                        Please provide a reason for the override:<br />
                        <textarea id="OverrideTextArea" rows="3" cols="85" name="textarea" style="width: 85%;
                            height: 40px;"></textarea>
                    </td>
                    <td style="vertical-align: top; padding-top: 10px;">
                        <a href="#" onclick="return closeAndOverrideIneligible();">
                            <img src="images/Button_OverrideIneligibleStatus.png" alt="Override Ineligible Status"
                                style="margin-right: 30px; border: none;" /></a>
                    </td>
                </tr>
            </table>
        </div>
    </div>
    <asp:Panel runat="server" ID="NoQuestionsLabel">
        <div class="NoQuestionsLabel">
            <div>
                Currently there are no questionnaires associated with Protocol
                <%= ProtocolNumberText %>,
                <%= ProtocolVersionText %>.</div>
            <div style="color: #8d2a2c; margin-top: 30px;">
                Please contact your Administrator to associate this protocol with a questionnaire.</div>
        </div>
    </asp:Panel>
    <asp:Panel runat="server" ID="MainContainer" Style="padding-top: 18px;">
        <!-- status -->
        <div id="CurrentStatus">Status: <asp:Label runat="server" ID="EligibilityStatus" Text="" CssClass="dataEntryButtonRed"></asp:Label></div>
        <table id="QuestionsHeaderTable">
            <thead>
                <tr>
                    <td style="width: auto; font-size: 14px; padding-bottom: 14px;">
                        Eligibility for Protocol
                        <%= ProtocolNumberText %>
                        <%= ProtocolVersionText %>
                        <%--    <asp:ImageButton ID="QButton" runat="server" ImageUrl="Images/Button_Questionnaire_on.png"
                            Style="margin-left: 24px;" />
                        <asp:ImageButton ID="TButton" runat="server" ImageUrl="Images/Button_Tests.png" Style="margin-left: 6px;" />
                        --%>
                    </td>
                </tr>
                <tr>
                    <td style="text-align: center;">&nbsp;
                        <asp:Label runat="server" ID="UpdateMessage" Visible="false">
                        The Eligibility Questionnaire has been updated. <a href="#" onclick="return goToRegistration();">Back to Registration.</a>
                        </asp:Label>
                    </td>
                </tr>
            </thead>
        </table>
        <div id="GridOverflow" style="border: none;">
            <div runat="server" id="CoverLayer">
                <div>
                </div>
                <span style="font-size: 15px;">This patient has not yet been registered.<br />
                    <br />
                    The eligibility questionnaire cannot be entered until the patient has been registered.
                    <br />
                    <br />
                    <input type="button" title="Enter Registration Information" value="Register This Patient Now"
                        style="display: block; text-align: center; margin: auto; cursor: pointer;" onclick="return goToRegistration();" />
                </span>
            </div>
            <asp:GridView runat="server" ID="PatientEligibilityGrid" CssClass="dataGrid" RowStyle-CssClass="dataGridItemRowB"
                AlternatingRowStyle-CssClass="dataGridItemRowA" AutoGenerateColumns="false" ShowHeader="false"
                OnRowCreated="SetQuestionnaireResponses" OnRowDataBound="SetQuestionnaireRadio"
                CellPadding="0" CellSpacing="0" GridLines="Horizontal">
                <Columns>
                    <asp:TemplateField ItemStyle-Width="50px" ItemStyle-Font-Size="11px" ItemStyle-ForeColor="#111111">
                        <ItemTemplate>
                            &nbsp;&nbsp;&nbsp;<asp:HiddenField runat="server" ID="RegQuestionIdField" />
                            <asp:Label runat="server" ID="QuestionNumLabel"></asp:Label>.
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-Font-Size="11px" ItemStyle-ForeColor="#111111">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="QuestionLabel" CssClass="QuestionLabel"></asp:Label>
                            <!-- Question Responses -->
                            <div class="RadioButtonLabels">
                                <asp:HiddenField runat="server" ID="MetaQuestionIdField" />
                                <asp:PlaceHolder runat="server" ID="ResponsesContainer"></asp:PlaceHolder>
                                <asp:HiddenField runat="server" ID="InEligibleRadioHidden" Value="" OnValueChanged="SaveCheckRow" />
                                <asp:HiddenField runat="server" ID="InEligibleRadioReason" Value="" OnValueChanged="SaveCheckRow" />
                                <%--<label class="RadioButtonLabel">
                                    <asp:RadioButton ID="EligibleRadio" runat="server" GroupName="QuestionResponseGroup"
                                        onclick="resetOverrideBit(this,'EligibleRadio');" OnCheckedChanged="SaveCheckRow"
                                        Text="Eligible" />
                                </label>
                                <label class="RadioButtonLabel">
                                    <asp:RadioButton ID="InEligibleRadio" runat="server" GroupName="QuestionResponseGroup"
                                        onclick="selectIneligible(this,event);" OnCheckedChanged="SaveCheckRow" Text="Ineligible" />
                                   
                                </label>
                                <label class="RadioButtonLabel">
                                    <asp:RadioButton ID="NARadio" runat="server" GroupName="QuestionResponseGroup" onclick="resetOverrideBit(this,'NARadio');"
                                        OnCheckedChanged="SaveCheckRow" Text="N/A" />
                                </label>--%>
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
        <asp:ImageButton ID="UpdateBtn" runat="server" ImageUrl="Images/Button_Save.png"
            OnClick="UpdateEligibilityClick" OnPreRender="RegisterUpdateScript" Style="margin-right: 10%" />
    </asp:Panel>
    </form>
</body>
</html>
