<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PatientImagingBone.aspx.cs"
    Inherits="Caisis.UI.Modules.ProtocolMgmt.PatientImagingBone" %>

<%@ Register TagPrefix="cic" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Bone Imaging</title>
    <link rel="stylesheet" type="text/css" href="../../StyleSheets/GlobalStyles.css" />
    <link rel="stylesheet" type="text/css" href="StyleSheets/ProtocolMgmtStyles.css" />

    <script type="text/javascript" src="../../ClientScripts/utilities.js"></script>

    <script type="text/javascript" src="../../ClientScripts/DynamicControls.js"></script>

    <script type="text/javascript" src="ProtocolMgmtScripts.js"></script>

    <script type="text/javascript">
        /* <![CDATA[ */

        // loads a diagnostic recrod from chron list
        function loadDiagnosticRecord(diagId) {
            var url = '<%= GetQueryString("PatientImagingBone.aspx") %>&diagnosticId=' + diagId;
            window.location = url;
        }

        // add click event to sync baseline checkboxes
        function addEventsToBaseline() {
            var baseline = $('<%= ImgBaseline.ClientID %>');
            if (baseline) {
                baseline.addEvent('click', curry(syncBaselineCheckboxes, baseline));
            }
        }

        // sync checkboxes by setting check state of src to match target
        function syncBaselineCheckboxes(src) {
            var isBaseline = src.checked;
            // adjust panels
            toggleBaselinePanels(isBaseline);
        }

        // toggles baseline panels
        // @baselineOn: show baseline panel and allow entry of fields
        function toggleBaselinePanels(baselineOn) {
            var followUpPanel = $('<%= FollowUpPanel.ClientID %>');
            followUpPanel.style.display = baselineOn ? 'none' : '';
            var clinicalImpressionPanel = $('<%= ClinicalImpressionPanel.ClientID %>');
            clinicalImpressionPanel.style.display = baselineOn ? 'none' : '';
            
            var baselinePanel = $('<%= BaselinePanel.ClientID %>');
            baselinePanel.style.display = baselineOn ? '' : 'none';
        }

        // contains a list of checkboxes which represent each subsite, i.e, Skull, Thorax, etc...
        var MatrixMap = new Array();

        // Main initalization method which adds relevant event handlers to
        // checkboxes, textboxes and their related overlays
        function addEventsToSkeleton() {
            var subSites = ['<%= string.Join("', '", IMG_FIND_SUBSITES) %>'];
            var findAPs = ['<%= string.Join("', '", IMG_FIND_AP) %>'];
            var imgFindSides = ['<%= string.Join("', '", IMG_FIND_SIDES) %>'];

            for (var i = 0; i < subSites.length; i++) {
                // find subsite, ex: 'Skull'
                var subSite = subSites[i];
                // checkbox reprenting basic find site (body part), id: 'Skull_Check'
                var cb = $(subSite + '_Check');
                // simple lookup object used for retrieveing cb's assocaite subSite
                cb.lookup = { 'subSite': subSite };
                // a list of textbox fields which are used to set checkbox state
                cb.fields = new Array();
                cb.overlays = new Array();
                // create an event handler which syncs textbox values and checkbox check state
                var cbFieldValidator = curry(handleCheckBox, cb, cb.fields);
                var updateBasicOverlay = curry(setOverlayBasic, cb, cb.overlays);
                cb.setOverlay = updateBasicOverlay;
                for (var j = 0; j < findAPs.length; j++) {
                    // Anterior or Posterior
                    var findAP = findAPs[j];

                    // overlay for basic find site, id: 'Skull_Overlay'
                    var basicOverlay = $(findAP + '_' + subSite + '_Overlay');
                    if (basicOverlay) {
                        cb.overlays.push(basicOverlay);
                        basicOverlay.addEvent('mouseover', curry(highlightArea, cb, cb.overlays));
                        basicOverlay.addEvent('mouseout', curry(removeHighlightArea, cb, cb.overlays));
                        basicOverlay.addEvent('click', curry(onOverlayClick, cb, cb.overlays));
                    }

                    // locate textbox for each AP side, i.e., Anterior Skull Left
                    for (var k = 0; k < imgFindSides.length; k++) {
                        var imgFindSide = imgFindSides[k];
                        // text-box representing detailed info, id: 'Anterior_Skull_Left'
                        var tb = $(findAP + '_' + subSite + '_' + imgFindSide);
                        // overlay for detailed text-box, id: 'Anterior_Skull_Left_Overlay'
                        var detailedOverlay = $(findAP + '_' + subSite + '_' + imgFindSide + '_Overlay');
                        tb.overlays = [detailedOverlay];
                    
                        // method which updates detailed overlay
                        var updateDetailedOverlay = curry(setOverlayDetailed, tb, tb.overlays);
                        tb.setOverlay = updateDetailedOverlay;

                        if (detailedOverlay) {
                            detailedOverlay.addEvent('mouseover', curry(highlightArea, tb, tb.overlays));
                            detailedOverlay.addEvent('mouseout', curry(removeHighlightArea, tb, tb.overlays));
                            detailedOverlay.addEvent('click', curry(onDetailedOverlayClick,cb, tb, tb.overlays));
                        }
                        
                        //detailedOverlay.setOverlay = updateDetailedOverlay;
                        // lookup object for easily identify properties of input or cell, such as side and subsite
                        var lookup = { 'ap': findAP, 'subSite': subSite, 'findSide': imgFindSide };
                        tb.lookup = lookup;
                        // for current checkbox, add field to list of existing fields
                        cb.fields.push(tb);
                        // for each textbox event, fire validator
                        var eNames = ['keyup', 'change'];
                        for (var eIndex = 0; eIndex < eNames.length; eIndex++) {
                            tb.addEvent(eNames[eIndex], cbFieldValidator);
                        }
                        // check overlay
                        tb.setOverlay();
                    }
                }
                // fire validator on checkbox click
                cb.addEvent('click', cbFieldValidator);
                cb.validate = cbFieldValidator;
                // finally add checkbox to master array of cb fields
                MatrixMap.push(cb);

                // check overlay
                cb.setOverlay();
            }
            collectMore();
        }

        // Sets the overlay for a basic subsite, such as Skull
        function setOverlayBasic(cb, overlays) {
            if (overlays.length > 0) {
                var isDetailed = isDetailedMode();
                var fieldsHaveValue = false;
                ForEach(cb.fields, function(field) { if (field.value != '') { field.setOverlay(); fieldsHaveValue = true; } });
                // active in basic mode if checked or detailed mode with no field values
                var doHilight = (!isDetailed && cb.checked) || (isDetailed && !fieldsHaveValue && cb.checked);
                ForEach(overlays, function(o) {
                    if (doHilight) { o.className = o.id; }
                    else { removeHighlightArea(cb, overlays); }
                });
            }
        }

        // sets the overlay for a detailed subsite, such as Anterior Left Skill
        function setOverlayDetailed(field, overlays) {
            if (field.value != '') { highlightArea(field, overlays); }
            else {
                removeHighlightArea(field, overlays);
            }
        }

        function onOverlayClick(cb, overlays, e) {
            cb.checked = !cb.checked;
            if (cb.checked) { highlightArea(cb, overlays, e); }
            else { removeHighlightArea(cb, overlays, e); }
            // when clicking, prevent event bubbling
            stopBubble(e); return false;
        }

        function onDetailedOverlayClick(cb, tb, overlays, e) {
            cb.checked = true;
            highlightArea(tb, overlays,e); 
        }

        // if a textbox in row has a value, box needs to be checked, otherwise unchecked
        function handleCheckBox(cb, fields, e) {
            var isCollectMore = isDetailedMode();
            var doCheck = false;
            var isCheckBoxClick = (e ? (e.srcElement || e.target) : null) == $(cb);
            for (var i = 0; i < fields.length; i++) {
                var field = fields[i];
                field.setOverlay();
                if (field.value != '') {
                    doCheck = true;
                }
            }
            if (isCheckBoxClick) {
                if (doCheck && cb.checked == false) {
                    cb.checked = true;
                    var doClear = confirm('You have chosen to uncheck the boxes, are you sure you want clear the selected input fields.');
                    cb.checked = !doClear;
                    if (doClear) {
                        clearSubSiteFields(fields);
                    }
                }
            }
            else {
                cb.checked = doCheck;
            }
            cb.setOverlay();
        }

        function clearSubSiteFields(cbFields) { ForEach(cbFields, clearField); }

        function showBoneScanType(isDetailed) {
            $('DetailedOptionsDiv').style.display = isDetailed ? 'block' : 'none';
            $('BasicOverlay').style.visibility = isDetailed ? 'hidden' : 'visible';
            $('DetailedOverlay').style.visibility = isDetailed ? 'visible' : 'hidden';
            $('DetailedLocationTR').style.display = isDetailed ? 'block' : 'none';
        }

        function highlightArea(field, overlays, e) {
            ForEach(overlays, function(o) { o.className = o.id; });
        }

        function removeHighlightArea(field, overlays, e) {
            var doClear = field.type == 'checkbox' ? field.checked==false : field.value == '';
            if (doClear) {
                ForEach(overlays, function(o) { o.className = ''; });
            }
        }


        function isDetailedMode() { return $('CollectMore').checked; }

        function collectMore(e) {
            var cb = $('CollectMore');
            // if unchecking collect more, verify that fields will be cleared
            if (e && (e.srcElement || e.target == cb) && cb.checked == false) {
                var doClear = confirm('You have chosen not to collect more, you will loose all changes to selected sub sites. Continue?');
                if (doClear) { ForEach(MatrixMap, function(c) { clearSubSiteFields(c.fields); }); }
                cb.checked = !doClear;
            }
            // update visible layers
            showBoneScanType(cb.checked);
        }

        function validateallSubSiteFields(e) {
            return true;
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
            padding: 0px;
            margin: 0px;
            background-color: #ffffff;
        }
        .GrayRoundedBox_TopLeft
        {
            background-image: url(images/GrayRoundedBoxBG_TopLeft.gif);
            background-repeat: no-repeat;
            font-family: Arial, Helvetica, sans-serif;
        }
        .GrayRoundedBox_TopRight
        {
            background-image: url(images/GrayRoundedBoxBG_TopRight.gif);
            background-repeat: no-repeat;
            background-position: top right;
            width: 12px;
        }
        .GrayRoundedBox_Middle
        {
            background-color: #efefef;
            font: Arial, Helvetica, sans-serif;
            color: #111111;
            font-size: 12px;
        }
        .GrayRoundedBox_BottomLeft
        {
            background-image: url(images/GrayRoundedBoxBG_BottomLeft.gif);
            background-repeat: no-repeat;
            height: 12px;
        }
        .GrayRoundedBox_BottomRight
        {
            background-image: url(images/GrayRoundedBoxBG_BottomRight.gif);
            background-repeat: no-repeat;
            background-position: bottom right;
            width: 12px;
            height: 12px;
        }
        .DoubleGrayRoundedBox_TopLeft
        {
            background-image: url(images/DoubleGrayRoundedBoxBG_TopLeft.png);
            background-repeat: no-repeat;
            font-family: Arial, Helvetica, sans-serif;
        }
        .DoubleGrayRoundedBox_TopRight
        {
            background-image: url(images/DoubleGrayRoundedBoxBG_TopRight.png);
            background-repeat: no-repeat;
            background-position: top right;
            width: 17px;
        }
        .DoubleGrayRoundedBox_BottomLeft
        {
            background-image: url(images/DoubleGrayRoundedBoxBG_BottomLeft.png);
            background-repeat: no-repeat;
            height: 17px;
        }
        .DoubleGrayRoundedBox_BottomRight
        {
            background-image: url(images/DoubleGrayRoundedBoxBG_BottomRight.png);
            background-repeat: no-repeat;
            background-position: bottom right;
            width: 17px;
            height: 17px;
        }
        .PastScansHeader
        {
            width: 93%;
            font-family: Arial, Helvetica, sans-serif;
            font-size: 13px;
            margin: 0px auto 0px auto;
            font-weight: bold;
        }
        .PastScansDiv
        {
            width: 93%;
            margin: 0px auto 0px auto;
            height: 373px;
            border: solid 1px #DDDDDD;
            background-color: #F8FAFC;
            overflow: auto;
            overflow-x: hidden;
        }
        .PastScansTable
        {
            width: 100%;
            font-family: Arial, Helvetica, sans-serif;
            font-size: 11px;
            margin: 0px auto 0px auto;
        }
        .PastScansA
        {
            background-color: #E0EBF1;
            text-align: left;
            padding-left: 8%;
            vertical-align: middle;
            font-size: 12px;
            font-family: Arial, Helvetica, sans-serif;
            color: #1C3B68;
            height: 31px;
            cursor: pointer;
        }
        .PastScansB
        {
            background-color: #F8FAFC;
            text-align: left;
            padding-left: 8%;
            vertical-align: middle;
            font-size: 12px;
            font-family: Arial, Helvetica, sans-serif;
            color: #1C3B68;
            height: 31px;
            cursor: pointer;
        }
        .PastScansHightlight
        {
            background-color: #E3D1D3;
            text-align: left;
            padding-left: 8%;
            vertical-align: middle;
            font-size: 12px;
            font-family: Arial, Helvetica, sans-serif;
            color: #000000;
            height: 31px;
            cursor: pointer;
        }
        .PastScansTD
        {
            padding-left: 8%;
        }
        .PastScansDiv1
        {
            width: 93%;
            margin: 0px auto 0px auto;
            height: 400px;
            border: solid 1px #DDDDDD;
            background-color: #F8FAFC;
            overflow: auto;
            overflow-x: hidden;
        }
        .BoneScanDataDiv
        {
            font-family: Arial, Helvetica, sans-serif;
            color: #000000;
            font-size: 13px;
        }
        .descriptionText
        {
            font-size: 11px;
            color: #333333;
        }
        .boneScanDiagramBG
        {
            background-image: url(images/BoneScanDiagram/BoneScan_BG.png);
            background-repeat: no-repeat;
            width: 359px;
            height: 295px;
            vertical-align: top;
        }
        #TotalNewLesionsDiv
        {
            font-size: 11px;
            color: #000000;
        }
        #DetailedOptionsDiv
        {
            overflow: auto;
            position: absolute;
            z-index: 2001;
        }
        .PosteriorFindingsA
        {
            background-color: #F0E9DF;
            text-align: center;
            vertical-align: middle;
            font-size: 12px;
            font-family: Arial, Helvetica, sans-serif;
            color: #1C3B68;
            height: 31px;
            border-right: solid 1px #666666;
        }
        .PosteriorFindingsB
        {
            background-color: #FCFAF7;
            text-align: center;
            vertical-align: middle;
            font-size: 12px;
            font-family: Arial, Helvetica, sans-serif;
            color: #1C3B68;
            height: 31px;
            border-right: solid 1px #666666;
        }
        .BoneScanFIndingTextbox
        {
            width: 28px;
            height: 19px;
            border: solid 1px #999999;
        }
        #BasicOverlay
        {
            visibility: visible;
            position: absolute;
            z-index: 3000;
        }
        #DetailedOverlay
        {
            visibility: hidden;
            position: absolute;
            z-index: 4000;
        }
        #Anterior_Skull_Overlay
        {
            position: absolute;
            z-index: 3001;
            top: 11px;
            left: 70px;
            height: 37px;
            width: 29px;
        }
        #Posterior_Skull_Overlay
        {
            position: absolute;
            z-index: 3002;
            top: 11px;
            left: 236px;
            height: 37px;
            width: 29px;
        }
        #Anterior_Spine_Overlay
        {
            position: absolute;
            z-index: 3010;
            top: 48px;
            left: 79px;
            height: 66px;
            width: 11px;
        }
        #Posterior_Spine_Overlay
        {
            position: absolute;
            z-index: 3010;
            top: 48px;
            left: 245px;
            height: 66px;
            width: 11px;
        }
        #Anterior_Pelvis_Overlay
        {
            position: absolute;
            z-index: 3005;
            top: 114px;
            left: 58px;
            height: 34px;
            width: 52px;
        }
        #Posterior_Pelvis_Overlay
        {
            position: absolute;
            z-index: 3006;
            top: 114px;
            left: 225px;
            height: 34px;
            width: 52px;
        }
        #Anterior_Thorax_Overlay
        {
            position: absolute;
            z-index: 3005;
            top: 52px;
            left: 60px;
            height: 51px;
            width: 49px;
        }
        #Posterior_Thorax_Overlay
        {
            position: absolute;
            z-index: 3006;
            top: 52px;
            left: 226px;
            height: 51px;
            width: 49px;
        }
        #Anterior_Extremities_Overlay
        {
            position: absolute;
            z-index: 3003;
            top: 52px;
            left: 2px;
            height: 233px;
            width: 165px;
        }
        #Posterior_Extremities_Overlay
        {
            position: absolute;
            z-index: 3004;
            top: 52px;
            left: 169px;
            height: 233px;
            width: 164px;
        }
        #Anterior_Thorax_Left_Overlay
        {
            position: absolute;
            z-index: 3005;
            top: 52px;
            left: 90px;
            height: 51px;
            width: 19px;
        }
        #Anterior_Thorax_Right_Overlay
        {
            position: absolute;
            z-index: 3005;
            top: 52px;
            left: 60px;
            height: 51px;
            width: 19px;
        }
        #Posterior_Thorax_Right_Overlay
        {
            position: absolute;
            z-index: 3005;
            top: 52px;
            left: 256px;
            height: 51px;
            width: 19px;
        }
        #Posterior_Thorax_Left_Overlay
        {
            position: absolute;
            z-index: 3005;
            top: 52px;
            left: 226px;
            height: 51px;
            width: 19px;
        }
        #Anterior_Skull_Left_Overlay
        {
            background-position: -14px 0px;
            position: absolute;
            z-index: 3001;
            top: 11px;
            left: 84px;
            height: 37px;
            width: 15px;
        }
        #Anterior_Skull_Right_Overlay
        {
            background-position: 0px 0px;
            position: absolute;
            z-index: 3001;
            top: 11px;
            left: 70px;
            height: 37px;
            width: 14px;
        }
        #Posterior_Skull_Left_Overlay
        {
            background-position: 0px 0px;
            position: absolute;
            z-index: 3002;
            top: 11px;
            left: 236px;
            height: 37px;
            width: 15px;
        }
        #Posterior_Skull_Right_Overlay
        {
            background-position: -15px 0px;
            position: absolute;
            z-index: 3002;
            top: 11px;
            left: 251px;
            height: 37px;
            width: 14px;
        }
        #Anterior_Spine_Left_Overlay
        {
            position: absolute;
            background-position: -6px 0px;
            z-index: 3010;
            top: 48px;
            left: 85px;
            height: 66px;
            width: 5px;
        }
        #Anterior_Spine_Right_Overlay
        {
            position: absolute;
            z-index: 3010;
            top: 48px;
            left: 79px;
            height: 66px;
            width: 6px;
        }
        #Posterior_Spine_Left_Overlay
        {
            position: absolute;
            z-index: 3010;
            top: 48px;
            left: 245px;
            height: 66px;
            width: 6px;
        }
        #Posterior_Spine_Right_Overlay
        {
            position: absolute;
            background-position: -6px 0px;
            z-index: 3010;
            top: 48px;
            left: 250px;
            height: 66px;
            width: 5px;
        }
        #Anterior_Pelvis_Left_Overlay
        {
            position: absolute;
            background-position: -26px 0px;
            z-index: 3005;
            top: 114px;
            left: 84px;
            height: 34px;
            width: 26px;
        }
        #Anterior_Pelvis_Right_Overlay
        {
            position: absolute;
            z-index: 3005;
            top: 114px;
            left: 58px;
            height: 34px;
            width: 26px;
        }
        #Posterior_Pelvis_Left_Overlay
        {
            position: absolute;
            z-index: 3006;
            top: 114px;
            left: 225px;
            height: 34px;
            width: 26px;
        }
        #Posterior_Pelvis_Right_Overlay
        {
            position: absolute;
            background-position: -26px 0px;
            z-index: 3006;
            top: 114px;
            left: 251px;
            height: 34px;
            width: 26px;
        }
        #Anterior_Extremities_Left_Overlay
        {
            position: absolute;
            background-position: -83px 0px;
            z-index: 3003;
            top: 52px;
            left: 85px;
            height: 233px;
            width: 82px;
        }
        #Anterior_Extremities_Right_Overlay
        {
            position: absolute;
            z-index: 3003;
            top: 52px;
            left: 2px;
            height: 233px;
            width: 83px;
        }
        #Posterior_Extremities_Left_Overlay
        {
            position: absolute;
            z-index: 3004;
            top: 52px;
            left: 169px;
            height: 233px;
            width: 82px;
        }
        #Posterior_Extremities_Right_Overlay
        {
            position: absolute;
            background-position: -82px 0px;
            z-index: 3004;
            top: 52px;
            left: 251px;
            height: 233px;
            width: 82px;
        }
        .Anterior_Skull_Overlay
        {
            background-image: url(images/BoneScanDiagram/OverlayAnteriorScull.gif);
            background-repeat: no-repeat;
            cursor: pointer;
        }
        .Posterior_Skull_Overlay
        {
            background-image: url(images/BoneScanDiagram/OverlayPosteriorScull.gif);
            background-repeat: no-repeat;
            cursor: pointer;
        }
        .Anterior_Spine_Overlay
        {
            background-image: url(images/BoneScanDiagram/OverlayAnteriorSpine.gif);
            background-repeat: no-repeat;
            cursor: pointer;
        }
        .Posterior_Spine_Overlay
        {
            background-image: url(images/BoneScanDiagram/OverlayPosteriorSpine.gif);
            background-repeat: no-repeat;
            cursor: pointer;
        }
        .Anterior_Pelvis_Overlay
        {
            background-image: url(images/BoneScanDiagram/OverlayAnteriorPelvis.gif);
            background-repeat: no-repeat;
            cursor: pointer;
        }
        .Posterior_Pelvis_Overlay
        {
            background-image: url(images/BoneScanDiagram/OverlayPosteriorPelvis.gif);
            background-repeat: no-repeat;
            cursor: pointer;
        }
        .Anterior_Thorax_Overlay
        {
            background-image: url(images/BoneScanDiagram/OverlayAnteriorThorax.gif);
            background-repeat: no-repeat;
            cursor: pointer;
        }
        .Posterior_Thorax_Overlay
        {
            background-image: url(images/BoneScanDiagram/OverlayPosteriorThorax.gif);
            background-repeat: no-repeat;
            cursor: pointer;
        }
        .Anterior_Extremities_Overlay
        {
            background-image: url(images/BoneScanDiagram/OverlayAnteriorExtremities.gif);
            background-repeat: no-repeat;
            cursor: pointer;
        }
        .Posterior_Extremities_Overlay
        {
            background-image: url(images/BoneScanDiagram/OverlayPosteriorExtremities.gif);
            background-repeat: no-repeat;
            cursor: pointer;
        }
        .Anterior_Thorax_Left_Overlay
        {
            background-image: url(images/BoneScanDiagram/OverlayAnteriorThorax.gif);
            background-position: -30px 0px;
            background-repeat: no-repeat;
            cursor: pointer;
        }
        .Anterior_Thorax_Right_Overlay
        {
            background-image: url(images/BoneScanDiagram/OverlayAnteriorThorax.gif);
            background-repeat: no-repeat;
            cursor: pointer;
        }
        .Posterior_Thorax_Left_Overlay
        {
            background-image: url(images/BoneScanDiagram/OverlayPosteriorThorax.gif);
            background-position: 0px 0px;
            background-repeat: no-repeat;
            cursor: pointer;
        }
        .Posterior_Thorax_Right_Overlay
        {
            background-image: url(images/BoneScanDiagram/OverlayPosteriorThorax.gif);
            background-position: -30px 0px;
            background-repeat: no-repeat;
            cursor: pointer;
        }
        .Anterior_Skull_Left_Overlay
        {
            background-image: url(images/BoneScanDiagram/OverlayAnteriorScull.gif);
            background-repeat: no-repeat;
            cursor: pointer;
        }
        .Anterior_Skull_Right_Overlay
        {
            background-image: url(images/BoneScanDiagram/OverlayAnteriorScull.gif);
            background-repeat: no-repeat;
            cursor: pointer;
        }
        .Posterior_Skull_Left_Overlay
        {
            background-image: url(images/BoneScanDiagram/OverlayPosteriorScull.gif);
            background-repeat: no-repeat;
            cursor: pointer;
        }
        .Posterior_Skull_Right_Overlay
        {
            background-image: url(images/BoneScanDiagram/OverlayPosteriorScull.gif);
            background-repeat: no-repeat;
            cursor: pointer;
        }
        .Anterior_Spine_Left_Overlay
        {
            background-image: url(images/BoneScanDiagram/OverlayAnteriorSpine.gif);
            background-repeat: no-repeat;
            cursor: pointer;
        }
        .Posterior_Spine_Left_Overlay
        {
            background-image: url(images/BoneScanDiagram/OverlayPosteriorSpine.gif);
            background-repeat: no-repeat;
            cursor: pointer;
        }
        .Anterior_Spine_Right_Overlay
        {
            background-image: url(images/BoneScanDiagram/OverlayAnteriorSpine.gif);
            background-repeat: no-repeat;
            cursor: pointer;
        }
        .Posterior_Spine_Right_Overlay
        {
            background-image: url(images/BoneScanDiagram/OverlayPosteriorSpine.gif);
            background-repeat: no-repeat;
            cursor: pointer;
        }
        .Anterior_Pelvis_Left_Overlay
        {
            background-image: url(images/BoneScanDiagram/OverlayAnteriorPelvis.gif);
            background-repeat: no-repeat;
            cursor: pointer;
        }
        .Anterior_Pelvis_Right_Overlay
        {
            background-image: url(images/BoneScanDiagram/OverlayAnteriorPelvis.gif);
            background-repeat: no-repeat;
            cursor: pointer;
        }
        .Posterior_Pelvis_Left_Overlay
        {
            background-image: url(images/BoneScanDiagram/OverlayPosteriorPelvis.gif);
            background-repeat: no-repeat;
            cursor: pointer;
        }
        .Posterior_Pelvis_Right_Overlay
        {
            background-image: url(images/BoneScanDiagram/OverlayPosteriorPelvis.gif);
            background-repeat: no-repeat;
            cursor: pointer;
        }
        .Anterior_Extremities_Left_Overlay
        {
            background-image: url(images/BoneScanDiagram/OverlayAnteriorExtremities.gif);
            background-repeat: no-repeat;
            cursor: pointer;
        }
        .Anterior_Extremities_Right_Overlay
        {
            background-image: url(images/BoneScanDiagram/OverlayAnteriorExtremities.gif);
            background-repeat: no-repeat;
            cursor: pointer;
        }
        .Posterior_Extremities_Left_Overlay
        {
            background-image: url(images/BoneScanDiagram/OverlayPosteriorExtremities.gif);
            background-repeat: no-repeat;
            cursor: pointer;
        }
        .Posterior_Extremities_Right_Overlay
        {
            background-image: url(images/BoneScanDiagram/OverlayPosteriorExtremities.gif);
            background-repeat: no-repeat;
            cursor: pointer;
        }
        #DiagnosticInfo td
        {
            font-size: 13px;
            height: 24px;
            padding-right: 8px;
        }
        .Skull_Overlay_Hilight
        {
            background-color: Red;
            border: 2px solid green;
        }
    </style>
    <style type="text/css">
        #LegionTable
        {
            table-layout: fixed;
            width: 100%;
            text-align: center;
        }
        #LegionTable label
        {
            font-weight: bold;
            text-align: left;
            display: block;
        }
        #DataEntryColumn
        {
            width: 250px;
            vertical-align: top;
        }
        .LegionField
        {
            width: 20px;
            margin: auto 5px auto 5px;
        }
        .InActiveMode
        {
            color: #cccccc;
        }
        .ActiveMode
        {
            color: Red;
        }
        .baselineDisplayColumn
        {
            text-align: right;
            width: 150px;
        }
    </style>
</head>
<body>

    <script type="text/javascript" src="../../ClientScripts/popcalendar.js"></script>

    <div style="margin-top: 10px;">
        <table style="width: 100%;" border="0" cellspacing="0" cellpadding="0">
            <tr>
                <td style="width: 232px; vertical-align: top;">
                    <table style="width: 220px;" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                            <td class="GrayRoundedBox_TopLeft"><img src="images/shim.gif" style="width: 208px; height: 1px;" /></td>
                            <td class="GrayRoundedBox_TopRight">
                                <img src="images/shim.gif" style="width: 12px; height: 1px;" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" class="GrayRoundedBox_Middle">
                                <table class="PastScansHeader" border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                        <td style="width: 50%; padding-left: 8%;">
                                            Date
                                        </td>
                                        <td style="width: 50%; padding-left: 0%;">
                                            New Lesions
                                        </td>
                                    </tr>
                                </table>
                                <div class="PastScansDiv">
                                    <table id="DiagnosticsTable" class="PastScansTable" border="0" cellspacing="0" cellpadding="0">
                                        <asp:Repeater runat="server" ID="DiagnosticsRptr">
                                            <ItemTemplate>
                                                <tr id="Diagnostic_<%# Eval("DiagnosticId") %>" class="<%# Container.ItemIndex % 2==0? "PastScansA" : "PastScansB" %>"
                                                    onmouseover="this.className='PastScansHightlight';" onmouseout="this.className='PastScansA';"
                                                    onclick="loadDiagnosticRecord('<%# Eval("DiagnosticId") %>');">
                                                    <td class="PastScansTD" style="width: 50%;">
                                                        <%# Eval("DxDate","{0:d}") %>
                                                    </td>
                                                    <td class="PastScansTD">
                                                        <%# Eval("DxNumNewTumors")%>
                                                    </td>
                                                </tr>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </table>

                                    <script type="text/javascript">
                                        /* <![CDATA[ */
                                        // init chron hover
                                        CHRON_ACTIVE_ROW_CLASS = 'PastScansHightlight';
                                        CHRON_HOVER_ROW_CLASS = 'PastScansHightlight';
                                        initDataEntryChronList('DiagnosticsTable', 'Diagnostic_<%= QueryDiagnosticId %>');
                                        /* ]]> */
                                    </script>

                                </div>
                                <!-- add new scan btn -->
                               <%-- <a href="<%= GetQueryString("PatientImagingBone.aspx") %>&diagnosticId=&new=true">
                                    <img src="images/Button_AddNewBoneScan.gif" alt="Add New Bone Scan" style="margin-left: 10px;
                                        margin-top: 3px; cursor: pointer;" />
                                </a>--%>
                            </td>
                        </tr>
                        <tr>
                            <td class="GrayRoundedBox_BottomLeft"><img src="images/shim.gif" style="width: 1px; height: 1px;"></td>
                            <td class="GrayRoundedBox_BottomRight"><img src="images/shim.gif" style="width: 12px; height: 1px;"></td>
                        </tr>
                    </table>
                </td>
                <td style="vertical-align: top;">
                    <form id="form1" runat="server">
                    <table style="width: 100%;" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                            <td class="DoubleGrayRoundedBox_TopLeft" style="height: 45px; padding-left: 17px; color: #8d2a2c; font-size: 15px; font-weight: bold;">
                                Bone Scan <asp:Label runat="server" ID="DxTargetLabel"></asp:Label> on
                                <asp:Label runat="server" ID="DxDateLabel"></asp:Label>
                                <label for="ImgBaseline">
                                    Baseline</label>
                                <cic:CaisisCheckBox runat="server" ID="ImgBaseline" ShowLabel="false" Table="Diagnostics"
                                    Field="ImgBaseline"></cic:CaisisCheckBox>
                            </td>
                            <td class="DoubleGrayRoundedBox_TopRight"><img src="images/shim.gif" style="width: 12px; height: 1px;"></td>
                        </tr>
                        <tr>
                            <td class="DoubleGrayRoundedBox_TopLeft" style="background-position: 0px -45px; padding-left: 17px; padding-right: 17px;">
                            <div id="FindingsPanel">
                                <div class="BoneScanDataDiv">
                                    <strong>Is tracer uptake related to metatastic disease?</strong>
                                    <cic:CaisisRadioButtonList ID="TracerUptake" runat="server" Table="Diagnostics" Field="DxTracer"
                                        ShowLabel="false" RepeatLayout="Flow" RepeatDirection="Horizontal">
                                        <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="No" Value="0"></asp:ListItem>
                                    </cic:CaisisRadioButtonList>
                                    <span class="descriptionText" style="margin-left: 24px; display: block;">If "No", do
                                        not fill out the rest of this form.</span>
                                </div>
                                <div id="BoneScanPanel" class="BoneScanDataDiv" style="margin: 13px 0px 10px 2px;">
                                    <table cellpadding="0" cellspacing="0" style="width: 100%;">
                                        <tr>
                                            <td class="boneScanDiagramBG" style=" padding-right: 5px;">
                                                <div id="BasicOverlay">
                                                    <div id="BasicSkull">
                                                        <div id="Anterior_Skull_Overlay"  >&nbsp;</div>
                                                        <div id="Posterior_Skull_Overlay"  >&nbsp;</div>
                                                    </div>
                                                    <div id="BasicSpine">
                                                        <div id="Anterior_Spine_Overlay"  >&nbsp;</div>
                                                        <div id="Posterior_Spine_Overlay"  >&nbsp;</div>
                                                    </div>
                                                    <div id="BasicPelvis">
                                                        <div id="Anterior_Pelvis_Overlay" >&nbsp;</div>
                                                        <div id="Posterior_Pelvis_Overlay"  >&nbsp;</div>
                                                    </div>
                                                    <div id="BasicThorax">
                                                        <div id="Anterior_Thorax_Overlay">&nbsp;</div>
                                                        <div id="Posterior_Thorax_Overlay">&nbsp;</div>
                                                    </div>
                                                    <div id="BasicExtremities">
                                                        <div id="Anterior_Extremities_Overlay">&nbsp;</div>
                                                        <div id="Posterior_Extremities_Overlay">&nbsp;</div>
                                                    </div>
                                                </div>
                                                <div id="DetailedOverlay">
                                                    <div id="Anterior_Thorax_Right_Overlay">&nbsp;</div>
                                                    <div id="Anterior_Thorax_Left_Overlay">&nbsp;</div>
                                                    <div id="Posterior_Thorax_Right_Overlay">&nbsp;</div>
                                                    <div id="Posterior_Thorax_Left_Overlay">&nbsp;</div>
                                                    
                                                    <div id="Anterior_Skull_Right_Overlay">&nbsp;</div>
                                                    <div id="Anterior_Skull_Left_Overlay">&nbsp;</div>
                                                    <div id="Posterior_Skull_Right_Overlay">&nbsp;</div>
                                                    <div id="Posterior_Skull_Left_Overlay">&nbsp;</div>
                                                    
                                                    <div id="Anterior_Spine_Right_Overlay">&nbsp;</div>
                                                    <div id="Anterior_Spine_Left_Overlay">&nbsp;</div>
                                                    <div id="Posterior_Spine_Right_Overlay">&nbsp;</div>
                                                    <div id="Posterior_Spine_Left_Overlay">&nbsp;</div>
                                                    
                                                    <div id="Anterior_Pelvis_Right_Overlay">&nbsp;</div>
                                                    <div id="Anterior_Pelvis_Left_Overlay">&nbsp;</div>
                                                    <div id="Posterior_Pelvis_Right_Overlay">&nbsp;</div>
                                                    <div id="Posterior_Pelvis_Left_Overlay">&nbsp;</div>
                                                    
                                                    <div id="Anterior_Extremities_Right_Overlay">&nbsp;</div>
                                                    <div id="Anterior_Extremities_Left_Overlay">&nbsp;</div>
                                                    <div id="Posterior_Extremities_Right_Overlay">&nbsp;</div>
                                                    <div id="Posterior_Extremities_Left_Overlay">&nbsp;</div>
                                                </div>
                                            </td>
                                            <td style="vertical-align: top; white-space: nowrap;">
                                                <div id="BaselineTogglePanels" style=" margin-bottom: 10px; width: auto; max-width: 300px; min-height: 100px;">
                                                    <table runat="server" id="BaselinePanel" style="display: none; margin: auto; text-align: center; width: 75%;">
                                                        <tr>
                                                            <td>
                                                                <label for="DxTotalNumTumorsBaseline" class="descriptionText">
                                                                    Total # of lesions related<br />
                                                                    to metastatic disease
                                                                </label>
                                                            </td>
                                                            <td style="width: 60px;">
                                                                <%-- !!! DxNumNewTumors is stored, instead of DxTotalNumTumors--%>
                                                                <cic:CaisisSelect ID="DxTotalNumTumorsBaseline" runat="server" Table="Diagnostics"
                                                                    Field="DxNumNewTumors" ShowLabel="false" RepeatLayout="Table" RepeatDirection="Horizontal"
                                                                    Width="50px">
                                                                    <asp:ListItem Text="" Value=""></asp:ListItem>
                                                                    <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                                                    <asp:ListItem Text="2-4" Value="2-4"></asp:ListItem>
                                                                    <asp:ListItem Text="5-9" Value="5-9"></asp:ListItem>
                                                                    <asp:ListItem Text="10-20" Value="10-20"></asp:ListItem>
                                                                    <asp:ListItem Text=">20" Value=">20"></asp:ListItem>
                                                                </cic:CaisisSelect>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    <table runat="server" id="FollowUpPanel" style=" width: 100%;">
                                                        <tr>
                                                            <td class="baselineDisplayColumn">
                                                                <label for="DxTotalNumTumorsFollowUp" class="descriptionText">
                                                                    Total # of Lesions
                                                                </label>
                                                            </td>
                                                            <td>
                                                                <cic:CaisisTextBox runat="server" ID="DxTotalNumTumorsFollowUp" ShowLabel="false"
                                                                    Table="Diagnostics" Field="DxTotalNumTumors" Width="50px"></cic:CaisisTextBox>
                                                                (if available)
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="baselineDisplayColumn">
                                                                <label for="DxNumNewTumors" class="descriptionText">
                                                                    Total # of New Lesions
                                                                </label>
                                                            </td>
                                                            <td>
                                                                <cic:CaisisSelect ID="DxNumNewTumors" runat="server" Table="Diagnostics" Field="DxNumNewTumors"
                                                                    ShowLabel="false" RepeatLayout="Table" RepeatDirection="Horizontal" Width="50px">
                                                                    <asp:ListItem Text="" Value=""></asp:ListItem>
                                                                    <asp:ListItem Text="0" Value="0"></asp:ListItem>
                                                                    <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                                                    <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                                                    <asp:ListItem Text="3" Value="3"></asp:ListItem>
                                                                    <asp:ListItem Text="4" Value="4"></asp:ListItem>
                                                                    <asp:ListItem Text="5" Value="5"></asp:ListItem>
                                                                    <asp:ListItem Text=">5" Value=">5"></asp:ListItem>
                                                                </cic:CaisisSelect>
                                                                <%--<cic:CaisisHidden runat="server" ID="TotalNewLesionsId">
                                                                        </cic:CaisisHidden>--%>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="baselineDisplayColumn">
                                                                <label for="PrevScans" class="descriptionText">
                                                                    Compared to</label>
                                                            </td>
                                                            <td>
                                                                <cic:CaisisSelect runat="server" ID="PrevScans" ShowLabel="false" DataTextField="DiagnosticText"
                                                                    DataValueField="DiagnosticId" ShowEmptyListItem="true" Width="150px">
                                                                </cic:CaisisSelect>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </div>
                                                <strong style="font-size: 11px; color: #000000;">Location of New Lesions</strong><asp:CheckBox
                                                    runat="server" ID="CollectMore" onclick="collectMore(event);" Text="Add more details"
                                                    Style="margin-left: 25px;" /><br />
                                                <table cellpadding="0" cellspacing="0" style="width: 280px;">
                                                    <tr id="DetailedLocationTR" style="display: none;">
                                                        <td style="height: 29px; width: 94px; vertical-align: top;">&nbsp;</td>
                                                        <td style="vertical-align: top;"><div id="DetailedOptionsDiv" style="display: none;">
                                                                <table border="0" cellspacing="0" cellpadding="0" style="margin-top: 0px; border-bottom: solid 1px #666666;">
                                                                    <tr>
                                                                        <td style="width: 25%;"><img src="images/shim.gif" style="width: 12px; height: 1px;"></td>
                                                                        <td style="width: 25%;"><img src="images/shim.gif" style="width: 12px; height: 1px;"></td>
                                                                        <td style="width: 25%;"><img src="images/shim.gif" style="width: 12px; height: 1px;"></td>
                                                                        <td style="width: 25%;"><img src="images/shim.gif" style="width: 12px; height: 1px;"></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td colspan="4" style="vertical-align: top; text-align: right;"><img src="images/BoneScanDiagram/DetailedDataEntryTableHeader.png"></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="PastScansA" style="border-right: solid 1px #cccccc; padding-left: 0px;
                                                                            text-align: center;">
                                                                            <cic:CaisisHidden runat="server" ID="Anterior_Skull_Left_Id" />
                                                                            <cic:CaisisTextBox runat="server" ID="Anterior_Skull_Left" CssClass="LegionField"
                                                                                ShowLabel="false"></cic:CaisisTextBox>
                                                                        </td>
                                                                        <td class="PastScansA" style="border-right: solid 1px #cccccc; padding-left: 0px;
                                                                            text-align: center;">
                                                                            <cic:CaisisHidden runat="server" ID="Anterior_Skull_Right_Id" />
                                                                            <cic:CaisisTextBox runat="server" ID="Anterior_Skull_Right" CssClass="LegionField"
                                                                                ShowLabel="false"></cic:CaisisTextBox>
                                                                        </td>
                                                                        <td class="PosteriorFindingsA" style="border-right-color: #cccccc;">
                                                                            <cic:CaisisHidden runat="server" ID="Posterior_Skull_Left_Id" />
                                                                            <cic:CaisisTextBox runat="server" ID="Posterior_Skull_Left" CssClass="LegionField"
                                                                                ShowLabel="false"></cic:CaisisTextBox>
                                                                        </td>
                                                                        <td class="PosteriorFindingsA">
                                                                            <cic:CaisisHidden runat="server" ID="Posterior_Skull_Right_Id" />
                                                                            <cic:CaisisTextBox runat="server" ID="Posterior_Skull_Right" CssClass="LegionField"
                                                                                ShowLabel="false"></cic:CaisisTextBox>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="PastScansB" style="border-right: solid 1px #cccccc; padding-left: 0px;
                                                                            text-align: center;">
                                                                            <cic:CaisisHidden runat="server" ID="Anterior_Thorax_Left_Id" />
                                                                            <cic:CaisisTextBox runat="server" ID="Anterior_Thorax_Left" CssClass="LegionField"
                                                                                ShowLabel="false"></cic:CaisisTextBox>
                                                                        </td>
                                                                        <td class="PastScansB" style="border-right: solid 1px #cccccc; padding-left: 0px;
                                                                            text-align: center;">
                                                                            <cic:CaisisHidden runat="server" ID="Anterior_Thorax_Right_Id" />
                                                                            <cic:CaisisTextBox runat="server" ID="Anterior_Thorax_Right" CssClass="LegionField"
                                                                                ShowLabel="false"></cic:CaisisTextBox>
                                                                        </td>
                                                                        <td class="PosteriorFindingsB" style="border-right-color: #cccccc;">
                                                                            <cic:CaisisHidden runat="server" ID="Posterior_Thorax_Left_Id" />
                                                                            <cic:CaisisTextBox runat="server" ID="Posterior_Thorax_Left" CssClass="LegionField"
                                                                                ShowLabel="false"></cic:CaisisTextBox>
                                                                        </td>
                                                                        <td class="PosteriorFindingsB">
                                                                            <cic:CaisisHidden runat="server" ID="Posterior_Thorax_Right_Id" />
                                                                            <cic:CaisisTextBox runat="server" ID="Posterior_Thorax_Right" CssClass="LegionField"
                                                                                ShowLabel="false"></cic:CaisisTextBox>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="PastScansA" style="border-right: solid 1px #cccccc; padding-left: 0px;
                                                                            text-align: center;">
                                                                            <cic:CaisisHidden runat="server" ID="Anterior_Spine_Left_Id" />
                                                                            <cic:CaisisTextBox runat="server" ID="Anterior_Spine_Left" CssClass="LegionField"
                                                                                ShowLabel="false"></cic:CaisisTextBox>
                                                                        </td>
                                                                        <td class="PastScansA" style="border-right: solid 1px #cccccc; padding-left: 0px;
                                                                            text-align: center;">
                                                                            <cic:CaisisHidden runat="server" ID="Anterior_Spine_Right_Id" />
                                                                            <cic:CaisisTextBox runat="server" ID="Anterior_Spine_Right" CssClass="LegionField"
                                                                                ShowLabel="false"></cic:CaisisTextBox>
                                                                        </td>
                                                                        <td class="PosteriorFindingsA" style="border-right-color: #cccccc;">
                                                                            <cic:CaisisHidden runat="server" ID="Posterior_Spine_Left_Id" />
                                                                            <cic:CaisisTextBox runat="server" ID="Posterior_Spine_Left" CssClass="LegionField"
                                                                                ShowLabel="false"></cic:CaisisTextBox>
                                                                        </td>
                                                                        <td class="PosteriorFindingsA">
                                                                            <cic:CaisisHidden runat="server" ID="Posterior_Spine_Right_Id" />
                                                                            <cic:CaisisTextBox runat="server" ID="Posterior_Spine_Right" CssClass="LegionField"
                                                                                ShowLabel="false"></cic:CaisisTextBox>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="PastScansB" style="border-right: solid 1px #cccccc; padding-left: 0px;
                                                                            text-align: center;">
                                                                            <cic:CaisisHidden runat="server" ID="Anterior_Pelvis_Left_Id" />
                                                                            <cic:CaisisTextBox runat="server" ID="Anterior_Pelvis_Left" CssClass="LegionField"
                                                                                ShowLabel="false"></cic:CaisisTextBox>
                                                                        </td>
                                                                        <td class="PastScansB" style="border-right: solid 1px #cccccc; padding-left: 0px;
                                                                            text-align: center;">
                                                                            <cic:CaisisHidden runat="server" ID="Anterior_Pelvis_Right_Id" />
                                                                            <cic:CaisisTextBox runat="server" ID="Anterior_Pelvis_Right" CssClass="LegionField"
                                                                                ShowLabel="false"></cic:CaisisTextBox>
                                                                        </td>
                                                                        <td class="PosteriorFindingsB" style="border-right-color: #cccccc;">
                                                                            <cic:CaisisHidden runat="server" ID="Posterior_Pelvis_Left_Id" />
                                                                            <cic:CaisisTextBox runat="server" ID="Posterior_Pelvis_Left" CssClass="LegionField"
                                                                                ShowLabel="false"></cic:CaisisTextBox>
                                                                        </td>
                                                                        <td class="PosteriorFindingsB">
                                                                            <cic:CaisisHidden runat="server" ID="Posterior_Pelvis_Right_Id" />
                                                                            <cic:CaisisTextBox runat="server" ID="Posterior_Pelvis_Right" CssClass="LegionField"
                                                                                ShowLabel="false"></cic:CaisisTextBox>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="PastScansA" style="border-right: solid 1px #cccccc; padding-left: 0px;
                                                                            text-align: center;">
                                                                            <cic:CaisisHidden runat="server" ID="Anterior_Extremities_Left_Id" />
                                                                            <cic:CaisisTextBox runat="server" ID="Anterior_Extremities_Left" CssClass="LegionField"
                                                                                ShowLabel="false"></cic:CaisisTextBox>
                                                                        </td>
                                                                        <td class="PastScansA" style="border-right: solid 1px #cccccc; padding-left: 0px;
                                                                            text-align: center;">
                                                                            <cic:CaisisHidden runat="server" ID="Anterior_Extremities_Right_Id" />
                                                                            <cic:CaisisTextBox runat="server" ID="Anterior_Extremities_Right" CssClass="LegionField"
                                                                                ShowLabel="false"></cic:CaisisTextBox>
                                                                        </td>
                                                                        <td class="PosteriorFindingsA" style="border-right-color: #cccccc;">
                                                                            <cic:CaisisHidden runat="server" ID="Posterior_Extremities_Left_Id" />
                                                                            <cic:CaisisTextBox runat="server" ID="Posterior_Extremities_Left" CssClass="LegionField"
                                                                                ShowLabel="false"></cic:CaisisTextBox>
                                                                        </td>
                                                                        <td class="PosteriorFindingsA" style="border-right-color: #cccccc;">
                                                                            <cic:CaisisHidden runat="server" ID="Posterior_Extremities_Right_Id" />
                                                                            <cic:CaisisTextBox runat="server" ID="Posterior_Extremities_Right" CssClass="LegionField"
                                                                                ShowLabel="false"></cic:CaisisTextBox>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width: 94px;">
                                                            <table style="width: 100%; border: solid 1px #666666; border-right: none;" border="0"
                                                                cellspacing="0" cellpadding="0">
                                                                <tr>
                                                                    <td class="PastScansA" style="font-size: 11; font-weight: bold; color: #000000; padding-left: 3px;">
                                                                        <cic:CaisisHidden runat="server" ID="Skull_BasicId" />
                                                                        <label for="Skull_Check">
                                                                            <cic:CaisisCheckBox runat="server" ID="Skull_Check" ShowLabel="false" />
                                                                            Skull</label>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="PastScansB" style="font-size: 11; font-weight: bold; color: #000000; padding-left: 3px;">
                                                                        <cic:CaisisHidden runat="server" ID="Thorax_BasicId" />
                                                                        <label for="Thorax_Check">
                                                                            <cic:CaisisCheckBox runat="server" ID="Thorax_Check" ShowLabel="false" />
                                                                            Thorax</label>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="PastScansA" style="font-size: 11; font-weight: bold; color: #000000; padding-left: 3px;">
                                                                        <cic:CaisisHidden runat="server" ID="Spine_BasicId" />
                                                                        <label for="Spine_Check">
                                                                            <cic:CaisisCheckBox runat="server" ID="Spine_Check" ShowLabel="false" />
                                                                            Spine</label>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="PastScansB" style="font-size: 11; font-weight: bold; color: #000000; padding-left: 3px;">
                                                                        <cic:CaisisHidden runat="server" ID="Pelvis_BasicId" />
                                                                        <label for="Pelvis_Check">
                                                                            <cic:CaisisCheckBox runat="server" ID="Pelvis_Check" ShowLabel="false" />
                                                                            Pelvis</label>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="PastScansA" style="font-size: 11; font-weight: bold; color: #000000; padding-left: 3px;">
                                                                        <cic:CaisisHidden runat="server" ID="Extremities_BasicId" />
                                                                        <label for="Extremities_Check">
                                                                            <cic:CaisisCheckBox runat="server" ID="Extremities_Check" ShowLabel="false" />
                                                                            Extremities</label>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                        <td style="border-left: solid 1px #666666;">
                                                            &nbsp;
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                                <asp:Panel runat="server" ID="ClinicalImpressionPanel" CssClass="BoneScanDataDiv">
                                    <strong>Clinical Impression</strong><cic:CaisisCheckBoxList runat="server" ID="DxStatus"
                                        Table="Diagnostics" Field="DxStatus" ShowLabel="false" RepeatLayout="Flow" RepeatDirection="Horizontal"
                                        MutuallyExclusive="true">
                                        <asp:ListItem Text="Improved" Value="Improved" style="margin-left: 10px;"></asp:ListItem>
                                        <asp:ListItem Text="Stable" Value="Stable" style="margin-left: 10px;"></asp:ListItem>
                                        <asp:ListItem Text="Progression" Value="Progression" style="margin-left: 10px;"></asp:ListItem>
                                    </cic:CaisisCheckBoxList>
                                    <br />
                                    <span class="descriptionText" style="margin-left: 24px;">For Follow Up scans only, as
                                        compared to Baseline Scan</span>
                                </asp:Panel>
                                <asp:ImageButton runat="server" ID="SaveBtn" ImageUrl="Images/Button_Save.png" ToolTip="Save"
                                        OnClick="SaveClick" OnClientClick="return validateallSubSiteFields(event);" Style="cursor: pointer;
                                        float: right;" />
                            </div>                    
                            </td>
                            <td class="DoubleGrayRoundedBox_TopRight" style="background-position: bottom right;" >&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="DoubleGrayRoundedBox_BottomLeft">
                                <img src="images/shim.gif" style="width: 1px; height: 1px;">
                            </td>
                            <td class="DoubleGrayRoundedBox_BottomRight">
                                <img src="images/shim.gif" style="width: 12px; height: 1px;">
                            </td>
                        </tr>
                    </table>

                    </form>
                </td>
            </tr>
        </table>
    </div>

    <script type="text/javascript">
    /* <![CDATA[ */ 
    if (document.forms.length > 0)       
    {      
        // Initalize Client Scrip Events
        addEventsToSkeleton();
        
        // setup baseline toggle
        addEventsToBaseline();
    }
    /* ]]> */
    </script>

</body>
</html>
