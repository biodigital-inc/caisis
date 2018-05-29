// Contains Various Administative Functions

var AdminCallBackPath = 'AdminLookupCodesCallBack.aspx';
function doAdminServerCallBack(params, callback) {
    AjaxManager.MakeRequest('POST', AdminCallBackPath, params, callback, true);
}

function addLookupCode(lkpField, lkpCode, lkpCodeDesc, callback) {
    // Validate client input, need field and and code, empty desc OK
    if (lkpField != null && lkpField != '' && lkpCode != null && lkpCode != '' && lkpCodeDesc != null) {
        var params = new Param();
        params.add('lookupCodeFieldName', lkpField);
        params.add('lookupCodeValue', lkpCode);
        params.add('lookupCodeDescription', lkpCodeDesc);
        doAdminServerCallBack(params, callback);
    }
    else {
        // Show error message
        var error = 'Invalid LookupFieldName/LookupCode values.\nLookupFieldName: ' + lkpField + '\nLookupCode: ' + lkpCode;
        alert(error);
    }
}

function removeLookupCode(lkpField, lkpCodeId, callback) {
    var params = new Param();
    params.add('lookupCodeFieldName', lkpField);
    params.add('lookupCodeId', lkpCodeId);
    doAdminServerCallBack(params, callback);
}

/* admin init */
$(window).addEvent('load', function(e) {
    // validate jQuery
    if (window.jQuery) {
        jQuery.noConflict();
        // set onload handler
        jQuery(document).ready(function() {
            jQuery.each(['Right', 'Left'], function(index, direction) {
                var trailLink = jQuery('a.slideNav' + direction);
                trailLink.click(function(e) {
                    // get next/previous url
                    var src = jQuery(this).attr('href');
                    // slide out form, and load next url on complete
                    slideOutNavigation(src, direction.toString().toLowerCase());
                    e.stopImmediatePropagation();
                    return false;
                });
            });
        });
    }
});

//
// @tableId: the id of the sortable table
// @orderSuffix: the id substring of the order field
// @rowAClass: the class name of the even rows
// @rowBClass: the class name of the odd rows
function initTableFieldSorting(tableId, orderSuffix, rowAClass, rowBClass) {
    if(window.jQuery==null) {
        return;
    }
    // define local helpers
    var _queryTableRows = function(id) {
        var table = jQuery('#' + id);
        // get all rows, except header
        var rows = table.find('tbody > tr').not('.dataGridHeader');
        // if header inside tbody, exclude first row
        if (rows.find('th').size() > 0) {
            rows = rows.filter(':gt(0)');
        }
        return rows;
    };
    
    var _getSortField = function(row) {
        return jQuery(row).find('input[id*="' + orderSuffix + '"][type="text"]');
    };
    
    var _getSortFieldValue = function(field) {
        var input = jQuery(field);
        var pValue = parseInt(input.val()).toString();
        return pValue == 'NaN' ? '' : pValue;
    };
    var _doFieldOrderSync = function(id) {
        // order indexes
        var rows = _queryTableRows(id);
        var seed = 1;
        // re-order indexes
        rows.each(function(index, row) {
            var rowField = _getSortField(row);
            var rowValue = _getSortFieldValue(rowField);
            // rows without a value, ignore, otherwise, adjust natural row order
            if (rowValue != '') {
                rowField.val(seed++);
            }
        });
        // re-order alternating classes
        rows.each(function(index, row) {
            var rowClass = index % 2 == 0 ? rowAClass : rowBClass;
            jQuery(row).removeClass(rowAClass + ' ' + rowBClass).addClass(rowClass);
        });
    };
    
    var moveRowFieldUp = function(row, targetRow) {
        _moveRowField(row, row.prev(), 'insertBefore');
    };

    var moveRowFieldDown = function(row, targetRow) {
        _moveRowField(row, row.next(), 'insertAfter');
    };

    var _moveRowField = function(row, targetRow, placement) {
        if (targetRow.size() > 0 && !targetRow.hasClass('dataGridHeader')) {
            row[placement](targetRow);
        }
    };
        
    // query rows

    var rows = _queryTableRows(tableId);
    // travers rows
    rows.each(function(index, tr) {
        var row = jQuery(tr);
        var sortField = _getSortField(row);
        var up = row.find('.fieldSortWidgetUp');
        var down = row.find('.fieldSortWidgetDown');
        var callback = function(r, d, p, e) {
            var sibling = row[d]();
            if (sibling.size() > 0 && !sibling.hasClass('dataGridHeader')) {
                row[p](sibling);
            }
            _doFieldOrderSync(tableId);
            
            e.stopImmediatePropagation();
            return false;
        };
        up.click(curry(callback, row, 'prev', 'insertBefore'));
        down.click(curry(callback, row, 'next', 'insertAfter'));
        // validate field order is int
        sortField.keyup(function(e) {
            var input = jQuery(this);
            var sortValue = _getSortFieldValue(input);
            input.val(sortValue);
            if (sortValue == '') {
                e.stopPropagation();
                return false;
            }
        });
        // reorder fields on blur
        var doFieldReorder = function(e) {
            // !important (requery newly ordered rows)
            var newOrderedRows = _queryTableRows(tableId);
            var lastRow = newOrderedRows.size() - 1;
            var targetValue = _getSortFieldValue(sortField);
            var targetIndex = newOrderedRows.index(row);
            if(targetValue=='') {
                return;
            }
            // iterate though "other" rows
            newOrderedRows.each(function(i, r) {
                var swapRow = jQuery(r);
                var otherField = _getSortField(r);
                var otherFieldValue = _getSortFieldValue(otherField);
                // if '' entered
                if (targetIndex == i) {
                    // do nothing
                }
                else if (targetValue == '') {
                    // place before first blank row
                    if (otherFieldValue == '') {
                        _moveRowField(row, swapRow, 'insertBefore');
                        // end iteration
                        return false;
                    }
                }
                else {
                    var targetInt = parseInt(targetValue);
                    if (otherFieldValue != '') {
                        var testInt = parseInt(otherFieldValue);
                        // if row <= test, insert before
                        if (targetInt < testInt) {
                            _moveRowField(row, swapRow, 'insertBefore');
                            return false;
                        }
                        else if (targetInt == testInt) {
                            _moveRowField(row, swapRow, targetInt < (targetIndex + 1) ? 'insertBefore' : 'insertAfter');
                            return false;
                        }
                        // greater, continue to check or add before blank
                        else {
                        }
                    }
                    // place before first empty
                    else {
                        _moveRowField(row, swapRow, 'insertBefore');
                        return false;
                    }
                }
                // default case
                if (lastRow == i) {
                    _moveRowField(row, swapRow, 'insertAfter');
                    return false;
                }
            });
            // adjust classes
            _doFieldOrderSync(tableId);
            // scroll to active row
//            jQuery('#' + tableId).parents('div').each(function(i, p) {
//                var div = jQuery(p);
//                var isOverflow = div.css('overflow') == 'auto';
//                if (isOverflow) {
//                    div.scrollTop(row.position().top);
//                }
//            });            
        }

        // add sort handlers
        sortField.blur(doFieldReorder);
    });
}

function slideOutNavigation(url, direction) {
    if (window.jQuery) {
        jQuery('form').first().hide('slide', { direction: direction }, 500, function() {
            window.location = url;
        });
    }
}