<%@ Control Language="C#" AutoEventWireup="true" CodeFile="IdentifierValidatorControl.ascx.cs"
    Inherits="Caisis.UI.Plugins.Identifiers.IdentifierValidatorControl" %>
<%@ Register TagPrefix="ajax" Namespace="Caisis.UI.ClientScript.Ajax" %>

<script type="text/javascript">
    /* <![CDATA[ */
    var validationLock = new Lock();

    // When page loads add blur event to list of identifier fields
    function initValidateIdentifierFields(list) {
        for (var i = 0; i < list.length; i++) {
            var fieldId = list[i];
            var field = $(fieldId);
            if(!field.disabled)
            {
                field.addEvent('blur', curry(validateIdentifierField, field));
                $(document.forms[0]).addEvent('submit',function(e)
                {
                    // if validation not yet complete, stop submit
                    if('<%= SaveButtonClientId %>' != '' && $('<%= SaveButtonClientId %>') && validationLock.isLocked())
                    {
                        stopBubble(e);
                    }
                });
            }
        }
    }

    // make callback to validate identifier
    function validateIdentifierField(field,e) {
        // only validate if dirty
        if (isFieldDirty(field)) {
            var target = e && (e.srcElement || e.target);
            var doSave = false;
            // block bubbling if save button was clicked, and mark update on server return
            if(target && '<%= SaveButtonClientId %>' != '' && target==$('<%= SaveButtonClientId %>'))
            {
                doSave = true;
                stopBubble(e);
            }
            
            var idValue = getValue(field);
            var params = new Param();
            params.add('Identifier', idValue);
            params.add('ClientId', field.id);
            params.add('SaveOnValidate', doSave.toString());
            // lock validation from submitting form until server call completes
            validationLock.lock();
            validateIdentifierOnServer(params);
        }
    }

    // when call is returned from server
    function handleValidationReturned(sVal, sObj) {
        // unlock validation
        validationLock.unlock();
        var idField = $(sObj.ClientId);
        var idValidateValue = sObj.Identifier;
        var idValidateType = sObj.IdentifierName;
        var isNew = sObj.IsNew;
        var doSave = sObj.SaveOnValidate == true.toString();
        // if identifier is not new
        if (isNew == false.toString()) {
            var message = 'The ' + idValidateType + ' ' + idValidateValue + ' is already registered in Caisis.\nPlease verify the correct ' + idValidateType + '.';
            alert(message);
            idField.value = idField.defaultValue;
            idField.focus();
        }
        // ok to save
        else {
            // if postback script registered and validation initiated by save button, do postback
            if (doSave && window.<%= SAVE_VALIDATION_SCRIPT %>) {
                window.<%= SAVE_VALIDATION_SCRIPT %>();
            }
        }
    }
    /* ]]> */
</script>
<ajax:CaisisAjaxHelper runat="server" DoCallbackScript="validateIdentifierOnServer"
    OnCallbackScript="handleValidationReturned" OnProcessCallback="HandleValidationCallback">
</ajax:CaisisAjaxHelper>
