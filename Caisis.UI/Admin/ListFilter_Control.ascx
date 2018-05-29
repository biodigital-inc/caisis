<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ListFilter_Control.ascx.cs"
    Inherits="Caisis.UI.Admin.ListFilter_Control" %>

<script type="text/javascript">
    /* <![CDATA[ */

    jQuery.noConflict();

    jQuery(document).ready(function(e) {
        if ('<%= ListId %>' == '') {
            return;
        }

        var filterField = jQuery('#<%= FilterTextBox.ClientID %>');
        var filterFieldIcon = jQuery('#<%= FilterTextBox.ClientID %>Icon');
        var defaultFieldText = '<%= DEFAULT_SEARCH_MESSAGE %>';
        var doLiveSearch = <%= LiveSearch.ToString().ToLower() %>;
        var list = jQuery('#<%= ListId %>');
        var dataSource = getListDataSource(list);

        // create client side combo filter
        if(doLiveSearch) {
            filterField.autocomplete({
                delay: 500,
                minLength: 0,
                source: dataSource,
                search: function(event, ui) {
                    // filter by user entered value
                    filterListValues(this.value);
                    if (this.value == '') {
                        filterFieldIcon.removeClass("FilterSearchBoxIconClose");
                    }
                    else {
                        filterFieldIcon.addClass("FilterSearchBoxIconClose");
                    }
                    // supress built in search
                    return false;
                }
            });
        }
        filterField.focus(function() {
            jQuery(this).val('').addClass('FilterSearchBoxActive');
        });
        filterField.blur(function() {
            if(jQuery(this).val()=='') {
                jQuery(this).val(defaultFieldText).removeClass('FilterSearchBoxActive');
            }
            //clearListValues();
        });
        filterField.keypress(function(event) {
            // supress submit action if filtering client side
            if (event.keyCode == 13) {
                if(!doLiveSearch && window.doClientSearchPostback) {
                     window.doClientSearchPostback();
                }
                event.stopPropagation();
                return false;
            }
        });
        // clear results when clicking X
        filterFieldIcon.click(function(e) {
            var currentSearch = filterField.val();
            if (currentSearch == "" || filterFieldIcon.hasClass('FilterSearchBoxIconClose')) {
                filterFieldIcon.removeClass('FilterSearchBoxIconClose');
                filterField.val('');
                filterField.blur();
                clearListValues();
            }
            else if(currentSearch != '' && currentSearch != defaultFieldText) {
                filterListValues(currentSearch);
                filterFieldIcon.addClass('FilterSearchBoxIconClose');
            }
        });
        // run inital search
        //filterField.autocomplete('search', filterField.val());
    });

    // returns a data source containing the search text for each item
    function getListDataSource(list) {
        var items = jQuery(list).find('li');
        var dataSource = jQuery.map(items, function(item, index) {
            var text = jQuery(item).text();
            var cleanText = jQuery.trim(text);
            return { label: cleanText, value: cleanText };
        });
        return dataSource;
    }

    // resets the list of lookup code filter
    function clearListValues() {
        filterListValues('');
    }

    // filters the current list of lkp fields by name
    // @filter: filter to lkp field names which contain filter
    function filterListValues(filter) {
        var list = jQuery('#<%= ListId %>');
        var listItems = list.find('li');
        var visibleIndex = 0;
        listItems.each(function(index, li) {
            var doShow = true;
            var item = jQuery(li);
            if (filter != '') {
                // if LI contains A,SPAN, search each item
                var searchContent = item.find('a,span');
                // if no content found, search LI
                if (searchContent.size() == 0) {
                    searchContent = item;
                }
                // seach each DOM item's text and title for a match
                searchContent.each(function(sIndex, sItem) {
                    var searchItem = jQuery(sItem);
                    var itemValue = jQuery.trim(searchItem.text());
                    var itemTitle = jQuery.trim(searchItem.attr('title'));

                    // match item text or tooltip
                    doShow = isListFilterMatch(itemValue, filter) || (itemTitle != '' && isListFilterMatch(itemTitle, filter));

                    // end loop once match found
                    if (doShow) {
                        return false;
                    }
                });
            }
            if (doShow) {
                item.show();
                // ajdust row class
                if (!item.hasClass("selected")) {
                    item.attr("class", visibleIndex % 2 == 0 ? "alternate" : "");
                }
                // increment visible index
                visibleIndex++;
            }
            else {
                item.hide();
            }

        });
    }

    function isListFilterMatch(source, test) {
        // single character, match first letter, else search inside
        if (test.length == 1) {
            return source.toLowerCase().indexOf(test.toLowerCase()) == 0;
        }
        else {
            return source.toLowerCase().indexOf(test.toLowerCase()) > -1;
        }
    }

    /* ]]> */
</script>


<div class="FilterSearchBoxWrapper">
    <asp:TextBox runat="server" ID="FilterTextBox" CssClass="FilterSearchBox" OnTextChanged="InvokeClientSearch"></asp:TextBox>
    <span id="<%= FilterTextBox.ClientID %>Icon" class="FilterSearchBoxIcon">
        <img alt="Search" title="Search" src="<%= Page.ResolveUrl("~/Images/Header/SearchBoxBG.png") %>" />
        <span title="Reset" class="HeaderSearchButtonCancel"></span>
    </span>
</div>
