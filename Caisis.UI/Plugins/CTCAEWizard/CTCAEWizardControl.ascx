<%@ Control Language="C#" AutoEventWireup="true" CodeFile="CTCAEWizardControl.ascx.cs"
    Inherits="Caisis.UI.Plugins.CTCAEWizard.CTCAEWizardControl" %>

<script type="text/javascript">
    /* <![CDATA[ */

    // lookup hash to  { 'field' : ['field1','field2','field3','field4'] }
    //var CTCAELookup = {};
    function showCTCWizard(key) {
        $('CTCFrame').src = '<%= ResolveUrl("CTCAEWizardPage.aspx") %>?key=' + key;
        $('CTCWizard').show('');
        $('CTCWizard').center();
    }

    function hideCTCWizard() {
        $('CTCWizard').hide('none');
    }

    // populates fields on page with values from CTC Wizard
    function setCTCFields(ToxScaleValue, ToxCategoryValue, ToxNameValue, ToxGradeValue, key) {
        if (CTCAELookup && key != null && key != '') {
            if (CTCAELookup[key] != null) {
                var fields = CTCAELookup[key];
                for (var i = 0; i < fields.length; i++) {
                    var field = $(fields[i]);
                    if (field && arguments[i]) {
                        var argValue = arguments[i];
                        // special case for select
                        if (field.nodeName == 'SELECT') {
                            for (var o = 0; o < field.options.length; o++) {
                                if (field.options[o].value == argValue) {
                                    field.selectedIndex = o;
                                }
                            }
                        }
                        else {
                            field.value = argValue;
                        }
                    }
                }
            }
        }

        // close popup
        hideCTCWizard();
    }

    // when page loaded, insert ctc image in containers
    // and add relevent event handlers
    $(window).addEvent('load', function(e) {
        if (CTCAELookup) {
            // for each CTC list of fields, add event handler
            for (var k in CTCAELookup) {
                // create copy of ctc image
                var img = $($('CTCAEImage').cloneNode(true));
                // add img after tox field and show
                var toxField = $(k);
                if (!toxField.disabled) {
                    toxField.parentNode.appendChild(img);
                    img.style.display = '';
                    // add click event handler to ctc image
                    var showWizardOnClick = curry(showCTCWizard, k);
                    img.addEvent('click', showWizardOnClick);
                }
            }
        }
    });

    /* ]]> */
</script>

<style type="text/css">
    #CTCWizard
    {
        margin: auto;
        position: fixed;
        height: auto;
        width: 90%;
        left: 25%;
        z-index: 1001;
    }
    #CTCFrame
    {
        display: block;
        width: 95%;
        margin: auto;
        height: 270px;
        overflow: hidden;
    }
    #CTCheader
    {
        background-color: #8d2a2c;
        color: #ffffff;
        font-size: 12px;
        font-weight: bold;
        padding-left: 10px;
    }
    
</style>
<%--<img id="CTCAEImage" alt="CTCAEWizard" title="Show CTCAE Wizard" src="<%= ResolveUrl("Button_CTCAE.png") %>"
    style="cursor: pointer; display: none; float: right;" />
--%>
<span id="CTCAEImage" class="dataEntryButtonRed smallButton" title="Show CTCAE Wizard"
    style="cursor: pointer; display: none; margin: auto 3px;">AE</span>
<div id="CTCWizard" class="miniPopupLayer" style="display: none;">
    <div class="miniPopupHeader">
        <span class="miniPopupText">CTCAE Wizard</span>
        <img alt="Close" class="miniPopupClose" src="<%= Page.ResolveUrl("~/Images/Modal_Close.gif") %>" style=" display: none;" />
    </div>
    <div class="miniPopupContent">
        <iframe id="CTCFrame" frameborder="0" scrolling="no"></iframe>
    </div>
</div>
