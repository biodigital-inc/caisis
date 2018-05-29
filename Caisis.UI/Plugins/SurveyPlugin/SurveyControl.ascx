<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SurveyControl.ascx.cs"
    Inherits="Caisis.UI.Plugins.SurveyPlugin.SurveyControl" %>

<script type="text/javascript">
/* <![CDATA[ */
  
    // array generated server side containing a list of all possible surveys
    var MetaSurveyList = [<%= ClientMetaSurveyList %>];
    var SurveyTypeClientId = '<%= SurveyTypeClientId %>';
    var SURVEY_UNAVAILABLE_MESSAGE = 'Survey Not Available';
    var ShowSurveyPluginNextToField = <%= showNextToField.ToString().ToLower() %>;
    var SurveyFieldLookup = [ <%= ClientSurveyFieldsLookup %> ];
    var ActiveSurveyType = '<%= ActiveSurveyType %>';

    function startNewSurvey()
    {
        var sTypeSelect = $(SurveyTypeClientId);
        if(sTypeSelect)
        {
            var selectedSurvey = getSelectValue(sTypeSelect);
            if(selectedSurvey != '' && isMetaSurvey(selectedSurvey))
            {
                // build url params as key value pairs, field1=value1&field2=value2...etc...
                var urlParams = getSurveyPersistedParams();
                var url = '<%= Page.ResolveUrl("~/Plugins/SurveyPlugin/SurveyWizardPage.aspx?surveyType=") %>' + escape(selectedSurvey) + '&' + urlParams;
                var title = 'Enter A New Survey : ' + selectedSurvey;

                loadSurveyPageInModal(url,title);
            }
            else
            {
                alert(SURVEY_UNAVAILABLE_MESSAGE);
            }
         }
         return false;
    }
    
    function loadExistingSurvey() {
        var sid = $('<%= SurveyIdField.ClientID %>').value;
        if(sid!='')
        {
            var urlParams = getSurveyPersistedParams();
            var url = '<%= Page.ResolveUrl("~/Plugins/SurveyPlugin/SurveyWizardPage.aspx?surveyId=") %>' + sid + '&scoring=false' + '&' + urlParams;
            var title = 'Edit Survey'+ (ActiveSurveyType!=''? ': ' + ActiveSurveyType : '');
            loadSurveyPageInModal(url,title);
        }
        return false;
    }
    
    // loads a printable version of the current survey
    function loadPrintableSurvey()
    {
        var sid = $('<%= SurveyIdField.ClientID %>').value;
        if(sid!='')
        {
            var urlParams = getSurveyPersistedParams();
            var url = '<%= Page.ResolveUrl("~/Plugins/SurveyPlugin/SurveyPrintablePage.aspx?surveyId=") %>' + sid + '&scoring=false' + '&' + urlParams;
            var title = 'Edit Survey'+ (ActiveSurveyType!=''? ': ' + ActiveSurveyType : '');
            loadSurveyPageInModal(url,title);
        }
        return false;
    }

    // initalizes survey type field for onchange event to trigger showing/hiding of start survey btn
    function initSurveyField()
    {
        var sTypeNode = $(SurveyTypeClientId);
        var aNode = $('<%= NewSurveyLink.ClientID %>');
        var printSurveyNode = $('<%= PrintSurveyLink.ClientID %>');
        if(sTypeNode)
        {
            if(aNode)
            {
                var onSurveySelected = function()
                {
                    var selectedSurvey = getSelectedSurveyType();
                    // Determine if selected survey exits in MetaSurveyList
                    if(selectedSurvey != '' && isMetaSurvey(selectedSurvey))
                    {
                        aNode.style.visibility = 'visible';
                    }
                    // Otherwise hide node
                    else
                    {
                        aNode.style.visibility = 'hidden';
                    }
                };
                // attach event handler to show/hide button when survey type changes
                sTypeNode.addEvent('change',onSurveySelected);
                // run on change function
                onSurveySelected();
            }
            // place icon next to field if applicable
            var nodeToMove = aNode ? aNode : printSurveyNode;
            if(ShowSurveyPluginNextToField)
            {
                if(nodeToMove)
                {
			        nodeToMove.parentNode.removeChild(nodeToMove);
			        sTypeNode.parentNode.insertBefore(nodeToMove,sTypeNode);
			        sTypeNode.parentNode.insertBefore(nodeToMove, sTypeNode.nextSibling);
                }
            }
            else
            {
                 if(nodeToMove)
                 {
                    nodeToMove.style.display = "inline-block";
                    nodeToMove.style.marginRight = "10px";
                    nodeToMove.style.marginBottom = "10px";
                 }
            }
             

            // supress edit node on disabled
            if(printSurveyNode && sTypeNode.disabled==true)
            {
                printSurveyNode.style.display = 'none';
            }
        }
    }
    
    // return selected survey type
    function getSelectedSurveyType()
    {
        var surveyType = '';
        var sTypeNode = $(SurveyTypeClientId);
        if(sTypeNode)
        {
            surveyType = getValue(sTypeNode);
        }
        return surveyType ? surveyType : '';
    }

    // returns a list of url encoded key value pairs ("key1=val1&key2=val2") for passing in url
    function getSurveyPersistedParams()
    {
        var fields = new Array();
        for(var i=0;i<SurveyFieldLookup.length;i++)
        {
            var fieldName = SurveyFieldLookup[i][0];
            var fieldId = SurveyFieldLookup[i][1];
            var fieldValue = getValue(document.getElementById(fieldId));
            fields.push(fieldName + '=' + escape(fieldValue));
        }
        // build url params as key value pairs, field1=value1&field2=value2...etc...
        var urlParams = fields.join('&');
        return urlParams;
    }
    
    // gets activated from survey wizard page when saving survey
    // determine if to overwrite current
    if(window.onSurveySave==null)
    {
        window.onSurveySave = function(sId)
        {
            if(sId && sId != '')
            {
                if(top.refreshChronList && top.loadDataEntryForm)
                {
                    var doReload = true;//confirm('You have entered a new Survey Record, would you like to reload the page to prevent entering a duplicate?');
                    if(doReload)
                    {
                        if(window.disIsDirty) { window.disIsDirty(); }
                        if(window.loadDataEntryForm) { window.loadDataEntryForm('Surveys', sId, ''); }
                        if(window.refreshChronList) { window.refreshChronList('Surveys'); }
                        return true;
                    }
                }
            }
        }
    }
    
    // loads a survey related page into a modal
    function loadSurveyPageInModal(url,title)
    {
        top.showModalWithConfig(url, title, { height: '90%', width: '800px', showPrint : false, context : window });
    }
    
    // returns if a survey type is containted in meta survey list
    function isMetaSurvey(type)
    {
        for(var i=0;i<MetaSurveyList.length;i++) { if(MetaSurveyList[i]==type) { return true; } }
        return false;
    }
        
/* ]]> */
</script>

<asp:HiddenField runat="server" ID="SurveyIdField" />
<a runat="server" id="NewSurveyLink" href="#" onclick="return startNewSurvey();"
    title="Quick Survey Entry" style="visibility: hidden;">
    <img alt="Quick Survey Entry" src="<%= ResolveUrl("Images/QuickSurveyEntry.gif") %>"
        style="cursor: pointer; border-style: none;" /></a>
<a runat="server" id="PrintSurveyLink" href="#" target="_blank" onclick="return loadExistingSurvey();"
    title="View Printable Survey">
    <img alt="View Printable Survey" src="<%= ResolveUrl("Images/ViewEditSurvey.gif") %>"
        style="cursor: pointer; border-style: none;" /></a>