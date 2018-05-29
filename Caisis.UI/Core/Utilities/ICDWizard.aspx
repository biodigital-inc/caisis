<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ICDWizard.aspx.cs" Inherits="Caisis.UI.Core.Utilities.ICDWizard" %>

<%@ Register TagPrefix="cic" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <META HTTP-EQUIV="PRAGMA" CONTENT="NO-CACHE">
    <META HTTP-EQUIV="EXPIRES" CONTENT="Mon, 22 Jul 2002 11:12:01 GMT">
    <META HTTP-EQUIV="CACHE-CONTROL" CONTENT="NO-CACHE">
    <title>ICD Wizard</title>
    <link href="../../StyleSheets/GlobalStyles.css" rel="stylesheet" type="text/css" />

    <script src="../../ClientScripts/utilities.js" type="text/javascript"></script>

    <script type="text/javascript">
    var activeDD;
     
    // Gets called when select fires onchange
    function callServerOnChange(current,target,type)
    {
       var key = getValue($(current)); // get value from dd, helper defined in utilities
       activeDD = $(target);
      // alert(current + 'fs' + key + ' ' + type);
      // alert(activeDD + ' ' + type + ' ' + key);
       callServerWithKey(type,key);
       
       clearSelectsFromPastData(current);
       setFieldValues(current);
    }
    
    // initiates a call to the server with a specially formatted string
    function callServerWithKey(type,key)
    {
        var serverArgs = type + ';' + key;
        // Need to set active dropdown based on type, to popualet when server returns
        // activeDD = $('targetdropdown');
        CallServer(serverArgs,handleServerReturn);
    }
    
    // Get called when server call returns
    // if we have an active select (i.e. target) and return isn't empty string, insert HTML
    function handleServerReturn(val)
    {
       if(activeDD && val!='') 
       { 
          var optionArray = val.split("|");
          var optionArrayLength = optionArray.length;
          
          activeDD.options[0] = new Option("","");
          
          for(var i=0; i < optionArrayLength; i++) 
          {
            var tempArray = optionArray[i].split(":");
            var optionVal = tempArray[0];
            var optionText= tempArray[1];
            if(optionText)
            {
                activeDD.options[i+1] = new Option(optionText,optionVal); 
            }
          }
          
          //  activeDD.innerHTML = val;             
       }       
       activeDD = null;
    }
    
    // if selects were already populated a new value is chosen from select above then clear old values
    function clearSelectsFromPastData(currentSelect)
    {
        
        if(currentSelect == 'a') // b is being populated; clear c and d
        {
            document.getElementById('b').innerHTML = "";
            document.getElementById('c').innerHTML = "";
            document.getElementById('d').innerHTML = "";
            
            document.getElementById('icdButton').disabled = true;
        }
        else if(currentSelect == 'b') // c is being populated; just clear d
        {
            document.getElementById('c').innerHTML = "";
            document.getElementById('d').innerHTML = "";
            document.getElementById('icdButton').disabled = true;
        }
        else if(currentSelect == 'c') // c is being populated; just clear d
        {
            document.getElementById('d').innerHTML = "";
        }
        
    }
    
    // sets the field values that will be used in populating the fields on the parent form
    function  setFieldValues(currentField)
    {
        
        if(currentField == 'b')
        {
            // populate the system
            document.getElementById('system').value = getSelectText($(currentField)).substring(8); // use the subgroup short desc that starts after first 8 chars
        }
        else if(currentField == 'c')
        {
            // populate the comorb
            document.getElementById('comorbidity').value = getSelectText($(currentField)).substring(4); // use category short desc that starts after four characters
            document.getElementById('icdCode').value = getValue($(currentField));
             
            document.getElementById('icdButton').disabled = false;
        }
        else if(currentField == 'd') // a value in d should overwrite a value in c
        {
            var icdLength = getValue($(currentField)).length; // ICD LENGTH MAY VARY
            document.getElementById('comorbidity').value = getSelectText($(currentField)).substring(icdLength+1);
            document.getElementById('icdCode').value = getValue($(currentField)); 
        }
    }
    
    function setIDCFieldValue()
    {
       

       
       
        // THESE ID's ARE GOING TO CHANGE    
        var subGroupVal = document.getElementById('system').value;
        parent.ICDEditor.findAnyFieldBySubString('ComorbSystem',subGroupVal);
        //parent.ICDEditor.setAnyFieldValue('ctl02_ctl06',subGroupVal);
        
        var categoryVal = document.getElementById('comorbidity').value;
        parent.ICDEditor.findAnyFieldBySubString('Comorbidity',categoryVal);
        
       // alert(parent.document.getElementById('ctl02_Comorbidities_ComorbSystem').value);
       // parent.document.getElementById('ctl02_Comorbidities_ComorbSystem').value = subGroupValue;
        
        var field = document.getElementById('icdCode');
        parent.ICDEditor.setFieldValue(field.value);
        
        parent.ICDEditor.close();
  
    }    
    </script>

</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table border="0" style="table-layout: fixed; width: 390px;">
                <tr>
                    <td width="50">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td width="50" align="right">
                        Group
                    </td>
                    <td>
                        <select runat=server id="a" style="width: 330px; font-family:Courier New" onchange="callServerOnChange('a','b','group');">
                      
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td align="right">
                        Subgroup
                    </td>
                    <td>
                        <select id="b"  style="width: 330px; font-family:Courier New" onchange="callServerOnChange('b','c','subgroup');">
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td align="right">
                        Category
                    </td>
                    <td>
                        <select id="c" runat=server style="width: 330px;  font-family:Courier New" onchange="callServerOnChange('c','d','category');">
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td align="right">
                        ICD 10
                    </td>
                    <td>
                        <select id="d" runat=server  style="width: 330px;  font-family:Courier New"  onchange="setFieldValues('d');">
                        </select>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">&nbsp;</td>
                </tr>
                 <tr>
                    <td colspan="2" align="center">
                        <input type="hidden" id="system" />
                        <input type="hidden" id="comorbidity" />
                        <input type="hidden" id="icdCode" />
                        <button id="icdButton" disabled onclick="setIDCFieldValue();">Insert Values</button>        
                    </td>
                </tr>
            </table>
            
        </div>
    </form>
</body>
</html>
