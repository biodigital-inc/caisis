using System;
using System.Collections;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Data;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;
using System.Configuration;
using System.Xml;
using System.Text;
using System.Linq;

using System.Web.Security;
using System.Security;


using System.Web.Caching;


using Caisis.UI.Core.Classes.CustomControls;

namespace Caisis.UI.Core.Classes
{
    //  Session Key moved to its own file (Classes/SessionKey.cs)

    /// <summary>
    /// Common static helper methods used by UI for creating HTML
    /// </summary>
    public class PageUtil
    {

        public static readonly string BASE_JQUERY_SCRIPT = "~/ClientScripts/jquery.js";

        public static readonly string BASE_JQUERY_UI_SCRIPT = "~/ClientScripts/jquery-ui.js";

        /// <summary>
        /// Private variable for highlight color in dropdown list
        /// </summary>
        private const string _HIGHLIGHTCOLOR = "#ff3300";


        /// <summary>
        /// Adds HtmlSelect selected item value to ViewState.  Implemented so that we could turn off
        /// ViewState for select boxes to minimize page size.
        /// </summary>
        /// <param name="vs"></param>
        /// <param name="sel"></param>
        public static void AddSelectToViewState(StateBag vs, HtmlSelect sel)
        {
            vs[sel.UniqueID] = sel.Value;
        }

        ///// <summary>
        ///// Add combo box data to view state. By default view state is disabled to increase page load performance.
        ///// </summary>
        ///// <param name="vs"></param>
        ///// <param name="combo"></param>
        //public static void AddComboToViewState(StateBag vs, ComboBox combo)  
        //{
        //    vs[combo.UniqueID] = combo.Value;
        //}

        /// <summary>
        /// Takes the names required form fields and creates a JS function to valid that they are not blank.
        /// </summary>
        /// <param name="valFields"></param>
        /// <returns></returns>
        public static string CreateValidationScript(string valFields)
        {
            //string[] reqFields = valFields.Split(,);

            string strJScript = "<SCRIPT LANGUAGE=javascript>\n";
            strJScript += "<!-- \n";

            //for(int i=0; i < reqFields.Length; i++)
            //{
            strJScript += "var requiredFieldArray = new Array(" + valFields + ");";
            //}

            strJScript += "\n//--></SCRIPT>";

            return strJScript;
        }




        /// <summary>
        /// Select an item in the drop down list. 
        /// </summary>
        /// <param name="listName"></param>
        /// <param name="fieldValue"></param>
        public static void SelectDropDownItem(HtmlSelect listName, object fieldValue)
        {
            if (fieldValue != System.DBNull.Value && fieldValue != null)
            {
                string fieldText = fieldValue.ToString();
                if (null != listName.Items.FindByValue(fieldText))
                {
                    if (listName.SelectedIndex != -1)
                    {
                        listName.Items[listName.SelectedIndex].Selected = false;
                    }
                    listName.Items.FindByValue(fieldText).Selected = true;

                }
                else
                {
                    //if (listName.SelectedIndex != -1)  
                    //added for Clin Stage 
                    if (listName.SelectedIndex > -1 && listName.SelectedIndex < listName.Items.Count)
                    {
                        listName.Items[listName.SelectedIndex].Selected = false;
                    }
                    HighlightDropDownListItem(listName, fieldText);
                }
            }
        }


        /// <summary>
        /// Select an item in the drop down list. 
        /// </summary>
        /// <param name="listName"></param>
        /// <param name="fieldValue"></param>
        public static void SelectDropDownItem(DropDownList listName, object fieldValue)
        {
            if (fieldValue != System.DBNull.Value && fieldValue != null)
            {
                string fieldText = fieldValue.ToString();
                if (null != listName.Items.FindByValue(fieldText))
                {
                    if (listName.SelectedIndex != -1)
                    {
                        listName.Items[listName.SelectedIndex].Selected = false;
                    }
                    listName.Items.FindByValue(fieldText).Selected = true;

                }
                else
                {
                    //if (listName.SelectedIndex != -1)  
                    //added for Clin Stage 
                    if (listName.SelectedIndex > -1 && listName.SelectedIndex < listName.Items.Count)
                    {
                        listName.Items[listName.SelectedIndex].Selected = false;
                    }
                    HighlightDropDownListItem(listName, fieldText);
                }
            }
        }


        /// <summary>
        /// Add the item to the drop down list and highlight it to signify that it is not one of the lookup codes.
        /// </summary>
        /// <param name="listName"></param>
        /// <param name="fieldText"></param>
        public static void HighlightDropDownListItem(HtmlSelect listName, string fieldText)
        {
            ListItem li = new ListItem(fieldText, fieldText);
            listName.Items.Add(li);
            li.Attributes.Add("style", "color:" + _HIGHLIGHTCOLOR + ";");
            li.Selected = true;
        }


        /// <summary>
        /// Add the item to the drop down list and highlight it to signify that it is not one of the lookup codes.
        /// </summary>
        /// <param name="listName"></param>
        /// <param name="fieldText"></param>
        public static void HighlightDropDownListItem(DropDownList listName, string fieldText)
        {
            ListItem li;
            // ac - insert non-empty values into end of list and empty to beginning
            if (!string.IsNullOrEmpty(fieldText))
            {
                li = new ListItem(fieldText, fieldText);
                listName.Items.Add(li);

            }
            else
            {
                li = new ListItem("", "");
                listName.Items.Insert(0, li);
            }
            li.Attributes.Add("style", "color:" + _HIGHLIGHTCOLOR + ";");
            li.Selected = true;
        }


        /// <summary>
        /// Returns the text from the selected option in a HtmlSelect box.  
        /// </summary>
        /// <param name="ddList">The dropdown list from which data needs to be retrieved.</param>
        /// <returns>String representing the selected value in a dropdown box.  If the value
        /// is null, returns empty string.</returns>
        public static string GetSelectedText(HtmlSelect ddList)
        {
            if (ddList.SelectedIndex == -1 || (ddList.SelectedIndex + 1) > ddList.Items.Count)
            {
                return "";

            }
            return ddList.Items[ddList.SelectedIndex].Text;
        }


        /// <summary>
        /// Returns the text from the selected option in a DropDownList.  
        /// </summary>
        /// <param name="ddList">The dropdown list from which data needs to be retrieved.</param>
        /// <returns>String representing the selected value in a dropdown box.  If the value
        /// is null, returns empty string.</returns>
        public static string GetSelectedText(DropDownList ddList)
        {
            if (ddList.SelectedIndex == -1)
            {
                return "";
            }
            return ddList.Items[ddList.SelectedIndex].Text;
        }





        /// <summary>
        /// Replaces double quotes with HTML friendly escape characters.
        /// </summary>
        /// <param name="s">String which contains double quotes.</param>
        /// <returns>String with double quotes replaced by escapeed characters.</returns>
        public static string EscapeDoubleQuotes(string s)
        {
            if (s == null)
            {
                return "";
            }
            return Regex.Replace(s, "\"", "\\\"");
        }

        /// <summary>
        /// Replaces single quotes with HTML friendly escape characters.
        /// </summary>
        /// <param name="s">String which contains single quotes.</param>
        /// <returns>String with single quotes replaced by escapeed characters.</returns>
        public static string EscapeSingleQuotes(string s)
        {
            if (s == null)
            {
                return "";
            }
            return Regex.Replace(s, "\'", "\\'");
        }

        /// <summary>
        /// Replaces single quotes with SQL friendly escape characters.
        /// </summary>
        /// <param name="s">String which contains single quotes.</param>
        /// <returns>String with single quotes replaced by escapeed characters.</returns>
        public static string EscapeSingleQuotesForSql(string s)
        {
            if (s == null)
            {
                return "";
            }
            return Regex.Replace(s, "'", "''");
        }

        /// <summary>
        /// Take DropDownList and database field name to populate lkp codes.
        /// </summary>
        /// <param name="listName"></param>
        /// <param name="fieldName"></param>
        public static void FillLkpDropDown(HtmlSelect listName, string fieldName)
        {
            listName.DataSource = CacheManager.GetLookupCodeList(fieldName).DefaultView;
            listName.DataTextField = "LkpCode";
            listName.DataValueField = "LkpCode";
            listName.DataBind();

            //insert must come after DataBind
            listName.Items.Insert(0, new ListItem(""));
            listName.EnableViewState = false;
        }
        public static void FillLkpDropDown(DropDownList listName, string fieldName)
        {

            try
            {
                string selectValue = listName.SelectedValue;
                //DataTable dt = CacheManager.GetLookupCodeList(fieldName);//.DefaultView;
                // DataRow dr = dt.NewRow();
                //dr[0] = "";
                // dt.AcceptChanges();
                listName.DataSource = CacheManager.GetLookupCodeList(fieldName).DefaultView;
                listName.DataTextField = "LkpCode";
                listName.DataValueField = "LkpCode";
                listName.DataBind();

                //insert must come after DataBind
                listName.Items.Insert(0, new ListItem(""));
                listName.EnableViewState = true;

                if (selectValue != null && selectValue.Length > 0)
                {
                    SelectDropDownItem(listName, selectValue);
                }
            }
            catch (System.ArgumentOutOfRangeException)
            {
                // TODO v4: must be a better way to do this; exception based on get/set of value in CaisisSelect
                SelectDropDownItem(listName, "");
            }
        }

        /// <summary>
        /// Creates JavaScript array to populate combo box for a given data entry field. 
        /// </summary>
        /// <param name="refById"></param>
        /// <param name="fieldName"></param>
        /// <returns></returns>
        public static string FillComboDropDown(string refById, string fieldName)
        {
            DataTable dt = new DataTable();
            dt = CacheManager.GetLookupCodeList(fieldName);

            /*
            string strJScript	 = "<SCRIPT LANGUAGE=javascript>\n";
            strJScript			+= "<!-- \n";
            strJScript			+= "var "+refById+"OptionsArray = new Array();\n";
			
            int i = 0;
            foreach(DataRow myRow in dt.Rows)
            {
                strJScript	+= refById+"OptionsArray["+i+"] = new Array('"+EscapeSingleQuotes(myRow["LkpCode"].ToString())+"', '"+EscapeSingleQuotes(myRow["LkpDescription"].ToString())+"');\n";
                i++;
            }
			
            strJScript			+= "var "+refById+"OptionsArrayLength = "+refById+"OptionsArray.length;";
            strJScript			+= "\n//--></SCRIPT>";

            return strJScript;
            */


            // let's try this with stringbuilders
            // we could review the whole app for optimizable concatenations, but tweaking the "heavy hitters"
            // (e.g. lookup code js arrays) will give us a win

            System.Text.StringBuilder b = new System.Text.StringBuilder();
            b.Append("<SCRIPT LANGUAGE=javascript>\n<!-- \nvar ");
            b.Append(refById);
            b.Append("OptionsArray = new Array();\n");

            // loop
            int i = 0;
            foreach (DataRow myRow in dt.Rows)
            {
                b.Append(refById);
                b.Append("OptionsArray[");
                b.Append(i.ToString());
                b.Append("] = new Array('");
                b.Append(EscapeSingleQuotes(myRow["LkpCode"].ToString()));
                b.Append("', '");
                b.Append(EscapeSingleQuotes(myRow["LkpDescription"].ToString()));
                b.Append("');\n");
                i++;
            }

            b.Append("var ");
            b.Append(refById);
            b.Append("OptionsArrayLength = ");
            b.Append(refById);
            b.Append("OptionsArray.length;\n//--></SCRIPT>");


            return b.ToString();

        }

        public static string FillComboDropDown(string refById, System.Data.DataView datasource, string valueField, string textField)
        {
            /*
            string strJScript	 = "<SCRIPT LANGUAGE=javascript>\n";
            strJScript			+= "<!-- \n";
            strJScript			+= "var "+refById+"OptionsArray = new Array();\n";

            int i = 0;

            foreach (DataRow row in datasource.Table.Rows)
            {
                strJScript	+= refById+"OptionsArray["+i+"] = new Array('"+EscapeSingleQuotes(row[valueField].ToString())+"', '"+EscapeSingleQuotes(row[textField].ToString())+"');\n";
                i++;
            }

            strJScript			+= "var "+refById+"OptionsArrayLength = "+refById+"OptionsArray.length;";
            strJScript			+= "\n//--></SCRIPT>";

            return strJScript;
            */

            // let's try this with a stringbuilder...
            System.Text.StringBuilder b = new System.Text.StringBuilder();
            b.Append("<SCRIPT LANGUAGE=javascript>\n<!-- \nvar ");
            b.Append(refById);
            b.Append("OptionsArray = new Array();\n");

            // loop
            int i = 0;
            foreach (DataRow row in datasource.Table.Rows)
            {
                b.Append(refById);
                b.Append("OptionsArray[");
                b.Append(i.ToString());
                b.Append("] = new Array('");
                b.Append(EscapeSingleQuotes(row[valueField].ToString()));
                b.Append("', '");
                b.Append(EscapeSingleQuotes(row[textField].ToString()));
                b.Append("');\n");
                i++;
            }

            b.Append("var ");
            b.Append(refById);
            b.Append("OptionsArrayLength = ");
            b.Append(refById);
            b.Append("OptionsArray.length;\n//--></SCRIPT>");

            return b.ToString();
        }

        /// <summary>
        /// Adds the DHTML popup calendar to the calendar image next to a date text field. 
        /// </summary>
        /// <param name="calImageId"></param>
        /// <param name="field"></param>
        public static void AddCalendarFunction(HtmlImage calImageId, HtmlInputText field)
        {
            calImageId.Attributes.Add("onClick", "showCal(this, dataForm." + field.ClientID.ToString() + ");");
        }

        /// <summary>
        /// Creates an interpretated date value and puts it in the readonly date field from data entered into the date text field. 
        /// </summary>
        /// <param name="dateTextField"></param>
        /// <param name="dateField"></param>
        public static void AddFuzzyDateFunction(HtmlInputText dateTextField, HtmlInputText dateField)
        {
            dateTextField.Attributes.Add("onBlur", "fuzzyDate(" + dateTextField.ClientID.ToString() + ", " + dateField.ClientID.ToString() + ");");
        }

        /// <summary>
        /// Prepolute date field with current date if form is new and specified in web.congfig
        /// </summary>
        /// <param name="dateTextField"></param>
        /// <param name="dateField"></param>
        public static void PopulateCurrentDate(HtmlInputText dateTextField, HtmlInputText dateField)
        {

            if (ConfigurationSettings.AppSettings["populateDateFields"] != null && ConfigurationSettings.AppSettings["populateDateFields"].Equals("true"))
            {
                if (HttpContext.Current.Request.QueryString.Get("primKey") == null || HttpContext.Current.Request.QueryString["primKey"].Length < 1)
                {
                    dateTextField.Value = DateTime.Now.ToShortDateString();
                    dateField.Value = DateTime.Now.ToShortDateString();
                }
            }
        }

        /// <summary>
        /// Fills dropdownlist with LkpCodes and selects item in list if stored in viewstate.  Mostly used in the
        /// DataEntryControls to work around enable/disable fields and disable viewstate for dropdown list.
        /// </summary>
        /// <param name="listName"></param>
        /// <param name="fieldName"></param>
        /// <param name="vs"></param>
        public static void FillLkpDropDown(HtmlSelect listName, string fieldName, StateBag vs)
        {
            FillLkpDropDown(listName, fieldName);
            SelectDropDownItem(listName, vs[listName.UniqueID]);
        }

        /// <summary>
        /// Fills dropdownlist with LkpCodes and selects item in list if stored in viewstate.  Mostly used in the
        /// DataEntryControls to work around enable/disable fields and disable viewstate for dropdown list.
        /// </summary>
        /// <param name="listName"></param>
        /// <param name="fieldName"></param>
        /// <param name="vs"></param>
        public static void FillLkpDropDown(HtmlSelect listName, string fieldName, System.Collections.Specialized.NameValueCollection vs)
        {
            FillLkpDropDown(listName, fieldName);
            SelectDropDownItem(listName, vs[listName.UniqueID]);
        }

        /// <summary>
        /// Fills HtmlSelect with lookupcodes and selects the value indicated.
        /// </summary>
        /// <param name="selectName">HtmlSelect to be populated.</param>
        /// <param name="lkpCategory">LkpCategory to be used to fill the HtmlSelect.</param>
        /// <param name="selectedValue">Value which should be highlighted in the HtmlSelect</param>
        public static void FillLkpDropDown(HtmlSelect selectName, string lkpCategory, object selectedValue)
        {
            FillLkpDropDown(selectName, lkpCategory);
            SelectDropDownItem(selectName, selectedValue);
        }

        public static string GetCurrentPage()
        {
            string[] pageNameWithQSArray = HttpContext.Current.Request.Url.ToString().Split(new Char[] { '/' });
            int pos = pageNameWithQSArray.GetUpperBound(0);
            string pageNameWithQS = pageNameWithQSArray.GetValue(pos).ToString();

            string[] pageNameArray = pageNameWithQS.Split(new Char[] { '?' });
            string pageName = pageNameArray.GetValue(0).ToString();

            return pageName;
        }

        public static string GetCurrentPageWithQueryString()
        {
            string[] urlPathComponents = HttpContext.Current.Request.Url.ToString().Split(new Char[] { '/' });
            int pos = urlPathComponents.GetUpperBound(0);
            string pageName = urlPathComponents.GetValue(pos).ToString();

            return pageName;
        }

        /// <summary>
        /// Retuns the virtual path to the current HttpRequest, without "/"
        /// </summary>
        /// <param name="req"></param>
        /// <returns></returns>
        public static string GetBasePath(HttpRequest req)
        {
            string basePath = req.ApplicationPath;
            basePath = basePath.Length > 1 ? basePath : "";
            return basePath;
        }

        //to set checkboxes
        public static void SetCheckBox(HtmlInputCheckBox chBox, object fieldValue)
        {
            if (chBox == null)
            {
                throw new ApplicationException(chBox.ID + " has not been instantiated.");
            }

            if (fieldValue != null)
            {
                if (fieldValue is byte && (byte)fieldValue == 1)
                {
                    chBox.Checked = true;
                }
                else if (fieldValue is string)
                {
                    if (fieldValue.ToString().Equals("1") || fieldValue.ToString().ToLower().Equals("true"))
                    {
                        chBox.Checked = true;
                    }
                }
            }
        }

        /// <summary>
        /// Converts an object to an integer.  If the object cannot be converted into an integer,
        /// returns DBNull.
        /// </summary>
        /// <param name="obj">Object to convert to an integer.</param>
        /// <returns>Integer.</returns>
        public static object ObjToInt(object obj)
        {
            if (obj != null && !obj.ToString().Equals(""))
            {
                return int.Parse(obj.ToString());
            }
            else
            {
                return System.DBNull.Value;
            }
        }

        /// <summary>
        /// Coverts an object into a DateString.
        /// </summary>
        /// <param name="obj">Object to be converted.</param>
        /// <returns>DateString</returns>
        public static string ObjToDateString(object obj)
        {
            if (obj == DBNull.Value)
            {
                return "";
            }
            else
            {
                return ((DateTime)obj).ToString("d");
            }
        }

        /// <summary>
        /// Converts an object into a DataTime object.  If the object is null, method returns
        /// DBNull.
        /// </summary>
        /// <param name="obj">Object to be converted.</param>
        /// <returns>DateTime returned.</returns>
        public static object ObjToDateTime(object obj)
        {
            if (obj != null && !obj.ToString().Equals(""))
            {
                return DateTime.Parse(obj.ToString());
            }
            else
            {
                return System.DBNull.Value;
            }
        }
                
        /// <summary>
        /// Returns if the specifed value represents true, i.e., "true", "True", "1"
        /// </summary>
        /// <param name="testValue"></param>
        /// <returns></returns>
        public static bool IsTrueString(string testValue)
        {
            return IsBoolString(testValue, bool.TrueString, (1).ToString());
        }

        /// <summary>
        /// Returns if the specifed value represents false, i.e., "false", "False", "0"
        /// </summary>
        /// <param name="testValue"></param>
        /// <returns></returns>
        public static bool IsFalseString(string testValue)
        {
            return IsBoolString(testValue, bool.FalseString, (0).ToString());
        }

        private static bool IsBoolString(string testValue, string boolValue, string intValue)
        {
            return !string.IsNullOrEmpty(testValue) && (testValue.Equals(boolValue, StringComparison.OrdinalIgnoreCase) || testValue.Equals(intValue, StringComparison.OrdinalIgnoreCase));
        }

        public static void SetParentKey(HtmlInputText parentKeyName)
        {
            if (HttpContext.Current.Request.QueryString["parentKey"] != null && !HttpContext.Current.Request.QueryString["parentKey"].Equals(""))
            {
                parentKeyName.Value = HttpContext.Current.Request.QueryString["parentKey"];//if parentKey is undefined null inserted
            }
        }
        public static void SetParentKey(HtmlInputHidden parentKeyName)
        {
            if (HttpContext.Current.Request.QueryString["parentKey"] != null && !HttpContext.Current.Request.QueryString["parentKey"].Equals(""))
            {
                parentKeyName.Value = HttpContext.Current.Request.QueryString["parentKey"];//if parentKey is undefined null inserted
            }
        }
        //used by datagrid pages to disable the isDirty warning
        public static void DisableIsDirtyFunction(HtmlInputHidden controlName)
        {
            if (controlName != null)
            {
                controlName.Value = "false";
            }
        }

        public static void HideContainerButton(ImageButton button)
        {
            button.Visible = false;
        }

        /// <summary>
        /// Enables buttons, default button state is off.
        /// </summary>
        /// <param name="imgBtn">Button to be turned on.</param>
        public static void TurnBtnOn(ImageButton imgBtn)
        {
            imgBtn.Enabled = true;
            string imageUrl = imgBtn.ImageUrl;

            //remove the string "_off" from the image URL, all buttons that use this fxn must follow this naming scheme
            if (imageUrl.IndexOf('_') != -1)
            {
                imageUrl = imageUrl.Remove(imageUrl.IndexOf('_'), 4);
                imgBtn.ImageUrl = imageUrl;
                imgBtn.CssClass = "PDButtonOn";
            }
        }

        /// <summary>
        /// Turns imagebuttons off.
        /// </summary>
        /// <param name="imgBtn"></param>
        public static void TurnBtnOff(ImageButton imgBtn)
        {
            imgBtn.Enabled = false;
            string imageUrl = imgBtn.ImageUrl;

            //remove the string "_off" from the image URL, all buttons that use this fxn must follow this naming scheme
            if (imageUrl.IndexOf("_off") == -1)
            {
                imageUrl = imageUrl.Substring(0, imageUrl.LastIndexOf(".")) + "_off.gif";
                imgBtn.ImageUrl = imageUrl;
            }
            imgBtn.CssClass = "PDButtonOff";
        }

        /*
                public static string GetPatientRedirectPath()  
                {
                    string pathString = HttpContext.Current.Request.Path; 
                    //removes the "valhalla" from the pathString so that relative path will work
                    pathString = ".." + pathString;
        //			pathString = ".." + pathString.Remove(0, 9);
                    return pathString;
                }
        */
        public static void RemoveHighlightListItem(HtmlSelect selCon)
        {
            if (selCon.Items.Count > 0)
            {
                int lastItem = selCon.Items.Count - 1;
                ListItem li = selCon.Items[lastItem];
                if (li.Attributes["style"] != null && li.Attributes["style"].IndexOf(_HIGHLIGHTCOLOR) != -1)
                {
                    selCon.Items.RemoveAt(lastItem);
                }
            }
        }





        /// <summary>
        /// Generates random password for admin and user update password. 
        /// </summary>
        /// <param name="i">Number of random alphanumeric digits returned</param>
        /// <returns></returns>
        public static string GenPassword(int i)
        {
            Random rGen = new Random();
            string[] strCharacters = { "A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V",
											   "W","X","Y","Z","1","2","3","4","5","6","7","8","9","0","a","b","c","d","e","f","g","h","i","j","k","l","m",
											   "n","o","p","q","r","s","t","u","v","w","x","y","z"};

            int p = 0;
            string strPass = "";
            for (int x = 0; x <= i; x++)
            {
                p = rGen.Next(0, 60);
                strPass += strCharacters[p];
            }

            return strPass;
        }

        /// <summary>
        /// Returns whether or not a string is a decimal.
        /// </summary>
        /// <param name="theValue">theValue</param>
        /// <returns>bool</returns>
        public static bool IsDecimal(string theValue)
        {
            try
            {
                Convert.ToDouble(theValue);
                return true;
            }
            catch
            {
                return false;
            }
        }

        /// <summary>
        /// Returns whether or not a string is an integer.
        /// </summary>
        /// <param name="theValue">theValue</param>
        /// <returns>bool</returns>
        public static bool IsInteger(string theValue)
        {
            try
            {
                Convert.ToInt32(theValue);
                return true;
            }
            catch
            {
                return false;
            }
        }

        /// <summary>
        /// Checks whether or not a date is a valid date.
        /// </summary>
        /// <param name="date"></param>
        /// <returns></returns>
        public static bool IsDate(string sdate)
        {
            DateTime dt;
            bool isDate = true;
            try
            {
                dt = DateTime.Parse(sdate);
            }
            catch
            {
                isDate = false;
            }
            return isDate;
        }

        /// <summary>
        /// Returns control value for HtmlInputText, HtmlTextAreas, HtmlSelects, Caisis.ComboBox
        /// (Webcontrols.RadioButton and HtmlCheckBox should still be tested)
        /// </summary>
        /// <param name="con">html control or combo box</param>
        /// <returns>empty string or string value of control</returns>
        public static string GetInputControlValue(object con)
        {
            // TODO: add support for WebControls
            if (con is HtmlInputText)
            {
                HtmlInputText text = (HtmlInputText)con;
                string val = HttpContext.Current.Request.Form[text.UniqueID];
                return val;
            }
            else if (con is HtmlInputHidden)
            {
                HtmlInputHidden text = (HtmlInputHidden)con;
                return HttpContext.Current.Request.Form[text.UniqueID];
            }
            else if (con is HtmlTextArea)
            {
                HtmlTextArea text = (HtmlTextArea)con;
                return HttpContext.Current.Request.Form[text.UniqueID];
            }
            else if (con is HtmlSelect)
            {
                HtmlSelect text = (HtmlSelect)con;
                return HttpContext.Current.Request.Form[text.UniqueID];
            }
            //else if (con is ComboBox)  
            //{
            //    ComboBox combo = (ComboBox)con;
            //    string val = HttpContext.Current.Request.Form[combo.UniqueID];
            //    combo.Value = val;
            //    return val;
            //}
            else if (con is System.Web.UI.WebControls.RadioButton)  // Never used yet. Only radio button lists in eform and that code is on EFormBasePage
            {
                RadioButton rb = (RadioButton)con;
                if (rb.Checked)
                    return rb.Text;
                else
                    return "";

                //return HttpContext.Current.Request.Form[rb.UniqueID];
            }
            else if (con is System.Web.UI.WebControls.CheckBox)  // Test this before using
            {
                CheckBox cb = (CheckBox)con;
                if (cb.Checked)
                {
                    return cb.Text;
                }
                else
                {
                    return "";
                }
            }
            else if (con is System.Web.UI.HtmlControls.HtmlInputCheckBox)  // Test this before using
            {
                HtmlInputCheckBox cb = (HtmlInputCheckBox)con;
                if (cb.Checked)
                {
                    return cb.Value;
                }
                else
                {
                    return "";
                }
            }
            else if (con is TextBox) // brandon: added support for other WebControls
            {
                return HttpContext.Current.Request.Form[((TextBox)con).UniqueID];
            }
            else if (con is DropDownList)
            {
                return HttpContext.Current.Request.Form[((DropDownList)con).UniqueID];
            }
            else if (con is EformCheckBoxList || con is EformRadioButtonList)
            {
                return (con as IEformInputField).Value;
            }
            else if (con is ICaisisInputControl)
            {
                return (con as ICaisisInputControl).Value;
            }

            return "";
        }

        public static void ResetFormField(Control con)
        {

            if (con is HtmlInputControl || con is EformTextBox)
            {
                ((HtmlInputControl)con).Value = null;
                if (con is HtmlInputCheckBox)
                {
                    ((HtmlInputCheckBox)con).Checked = false;
                }
            }
            else if (con is HtmlSelect || con is EformSelect)
            {
                HtmlSelect selCon = (HtmlSelect)con;
                selCon.SelectedIndex = -1;
                PageUtil.RemoveHighlightListItem(selCon);

            }
            else if (con is HtmlTextArea || con is EformTextArea)
            {
                ((HtmlTextArea)con).Value = null;
            }

            //else if (con is ComboBox || con is EformComboBox)
            //{
            //    ((ComboBox)con).Value = null;
            //}
            /* v4 else if (con is DataEntryCommonFields)  
            {
                DataEntryCommonFields com = (DataEntryCommonFields)con;
                foreach(Control comCon in com.Controls)  
                {
                    if (comCon is HtmlControl)  
                    {
                        ((HtmlInputControl)comCon).Value = null;
                    }
                }
            }*/


        }

        /// <summary>
        /// Recursively search for control identified by "id"
        /// </summary>
        /// <param name="namingContainer">Naming container</param>
        /// <param name="id">id to search for</param>
        /// <returns></returns>
        public static Control RecursiveFindControl(Control container, string id)
        {
			if (string.IsNullOrEmpty(id) || container == null)
				return null;

            Control c = container.FindControl(id);
            if (c == null)
                return RecursiveFindControl(container.NamingContainer, id);
            else
            {
                return c;
            }
        }

        /// <summary>
        /// Recursively Find a CaisisInputControl(upwards) by Field name
        /// </summary>
        /// <param name="container"></param>
        /// <param name="fieldName"></param>
        /// <returns></returns>
        public static ICaisisInputControl RecursiveFindICaisisInputControl(Control container, string fieldName)
        {
            if (container != null)
            {
                foreach (Control c in container.Controls)
                {
                    if (c is ICaisisInputControl)
                    {
                        ICaisisInputControl icic = (ICaisisInputControl)c;
                        if (icic.Field == fieldName)
                        {
                            return icic;
                        }
                    }
                }
                if (container.NamingContainer != null)
                {
                    return RecursiveFindICaisisInputControl(container.NamingContainer, fieldName);
                }
            }

            return null;
        }

        /// <summary>
        /// Recursively finds ICaisisInputControl (downwards)  by deep searching container for control
        /// </summary>
        /// <param name="container"></param>
        /// <param name="fieldName"></param>
        /// <returns></returns>
        public static ICaisisInputControl DeepFindICaisisInputControl(Control container, string fieldName)
        {
            if (container is ICaisisInputControl)
            {
                ICaisisInputControl icic = (ICaisisInputControl)container;
                if (icic.Field == fieldName)
                {
                    return icic;
                }
                else
                {
                    return null;
                }
            }
            else if (container.HasControls())
            {
                foreach (Control c in container.Controls)
                {
                    object o = DeepFindICaisisInputControl(c, fieldName);
                    if (o != null)
                    {
                        return (ICaisisInputControl)o;
                    }
                }
            }
            return null;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="container"></param>
        /// <param name="id"></param>
        /// <returns></returns>
        public static Control DeepFindControl(Control container, string id)
        {
            Control found = container.FindControl(id);
            if (found == null)
            {
                if (container.HasControls())
                {
                    foreach (Control child in container.Controls)
                    {
                        Control foundInChild = DeepFindControl(child, id);
                        if (foundInChild != null)
                        {
                            return foundInChild;
                        }
                    }
                }
                return null;
            }
            else
            {
                return found;
            }
        }

        /// <summary>
        /// Returns a list of controls of Type T
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="container">The container to perform the deep search</param>
        /// <returns>Return a list of T</returns>
        public static IEnumerable<T> GetControls<T>(Control container)
        {
            List<T> TList = new List<T>();
            VisitControls<T>(container, (a) => TList.Add(a));
            return TList;
        }

        /// <summary>
        /// Visits each controls of Type T
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="container"></param>
        /// <param name="callback"></param>
        public static void VisitControls<T>(Control container, Action<T> callback)
        {
            var children = container.Controls.Cast<Control>();
            foreach (var typedChild in children.OfType<T>())
                callback(typedChild);
            foreach (var child in children)
                VisitControls<T>(child, callback);
        }

        /// <summary>
        /// Find a list of Caisis Input Controls in a given container.
        /// </summary>
        /// <param name="container">container (Control) in which to search</param>
        /// <returns>a list of Caisis Input Controls inside container</returns>
        public static List<ICaisisInputControl> GetCaisisInputControlsInContainer(Control container)
        {
            return GetCaisisInputControlsInContainer(container, new List<Type>());
        }

        /// <summary>
        /// Returns a list of Caisis Input Controls in a given container, excluding controls within a Type Filter.
        /// </summary>
        /// <param name="container">container (Control) in which to search</param>
        /// <param name="exclusionContainerTypes">A list of container Types which will not deep search in container for CIC, i.e. Repeater,GridView...</param>
        /// <returns>a list of Caisis Input Controls inside container based on filter.</returns>
        public static List<ICaisisInputControl> GetCaisisInputControlsInContainer(Control container, List<Type> exclusionContainerTypes)
        {
            List<ICaisisInputControl> cicList = new List<ICaisisInputControl>();
            if (container is ICaisisInputControl)
            {
                cicList.Add((container as ICaisisInputControl));
            }
            else if (container.HasControls() && (exclusionContainerTypes.Count == 0 || !exclusionContainerTypes.Contains(container.GetType())))
            {
                List<ICaisisInputControl> subList = new List<ICaisisInputControl>();
                foreach (Control c in container.Controls)
                {
                    subList.AddRange(GetCaisisInputControlsInContainer(c));
                }
                if (subList.Count > 0)
                {
                    cicList.AddRange(subList);
                }
            }
            return cicList;
        }

        /// <summary>
        /// Attachs a client event to a control's inline atttribute collection(onclick, onkepress,etc...)
        /// If an inline attribute exists, it will append the new event, adding ";" if needed.
        /// </summary>
        /// <param name="webControl">The control </param>
        /// <param name="eventName"></param>
        /// <param name="eventScript"></param>
        public static void AttachClientEventToControl(WebControl webControl, string eventName, string eventScript)
        {
            if (!string.IsNullOrEmpty(eventName) && !string.IsNullOrEmpty(eventScript))
            {
                // ensures list of expressions ends in ";" exp1;exp2();exp3;...
                eventScript += !eventScript.EndsWith(";") ? ";" : "";
                // Check if eventName attribute exists
                if (!string.IsNullOrEmpty(webControl.Attributes[eventName]))
                {
                    string oldAttValue = webControl.Attributes[eventName];
                    oldAttValue += !oldAttValue.EndsWith(";") ? ";" : "";
                    webControl.Attributes[eventName] = oldAttValue + eventScript;
                }
                else
                {
                    webControl.Attributes.Add(eventName, eventScript);
                }
            }
        }

        /// <summary>
        /// Registers a client script which sets the value of the target field, based on the value of the source field.
        /// When the source field changes values (blur, change), the target field is updated.
        /// </summary>
        /// <param name="page">The current Page object</param>
        /// <param name="srcControl">The source Control</param>
        /// <param name="targetControl">The target Control</param>
        /// <param name="valueLookup">The DataTable which will contain the values(keys) to check against current source and the target values (values)</param>
        /// <param name="keyColumn">The name of the data column containing the keys, values which match source control value</param>
        /// <param name="valueColumn">The name of the data column containing the values,  which is set when source value = key values</param>
        /// <param name="uniqueArrayKey">A unique key for the client array generated by the DataTable, registers client script: "LabCodes" -> var DEPENDENT_ARRAY_LabCodes = [['key 1','val 1'],['key 2','val 2']];</param>
        public static void RegisterDependentFieldScript(Page page, Control srcControl, Control targetControl, DataTable valueLookup, string keyColumn, string valueColumn, string uniqueArrayKey)
        {
            RegisterDependentFieldScript(page, srcControl.ClientID, targetControl.ClientID, valueLookup, keyColumn, valueColumn, uniqueArrayKey);
        }

        /// <summary>
        /// Registers a client script which sets the value of the target field, based on the value of the source field.
        /// When the source field changes values (blur, change), the target field is updated.
        /// </summary>
        /// <param name="page">The current Page object</param>
        /// <param name="srcClientId">The client id of the source control</param>
        /// <param name="targetClientId">The client id of the target control</param>
        /// <param name="valueLookup">The DataTable which will contain the values(keys) to check against current source and the target values (values)</param>
        /// <param name="keyColumn">The name of the data column containing the keys, values which match source control value</param>
        /// <param name="valueColumn">The name of the data column containing the values,  which is set when source value = key values</param>
        /// <param name="uniqueArrayKey">A unique key for the client array generated by the DataTable, registers client script: "LabCodes" -> var DEPENDENT_ARRAY_LabCodes = [['key 1','val 1'],['key 2','val 2']];</param>
        public static void RegisterDependentFieldScript(Page page, string srcClientId, string targetClientId, DataTable valueLookup, string keyColumn, string valueColumn, string uniqueArrayKey)
        {
            string clientLookupArray = DataTableToJSArray(valueLookup, new string[] { keyColumn, valueColumn }, true);
            string uniqueClientArrayName = "DEPENDENT_ARRAY_" + (!string.IsNullOrEmpty(uniqueArrayKey) ? uniqueArrayKey : srcClientId + targetClientId);
            string uniqueDependentArray = string.Format("var {0} = {1};", uniqueClientArrayName, clientLookupArray);
            // register client array once for reuse by multiple controls
            if (!page.ClientScript.IsClientScriptBlockRegistered(page.GetType(), uniqueClientArrayName))
            {
                page.ClientScript.RegisterClientScriptBlock(page.GetType(), uniqueClientArrayName, uniqueDependentArray, true);
            }
            // when page has loaded, add event handlers to signal event
            string[] clientEvents = new string[] { "change", "blur" };
            List<string> clientEventScripts = new List<string>(clientEvents.Length);
            for (int i = 0; i < clientEvents.Length; i++)
            {
                string eventName = clientEvents[i];
                string onLoadScript = "if(window.$) { $('" + srcClientId + "').addEvent('" + eventName + "',function() { setDependentFieldValue('" + srcClientId + "','" + targetClientId + "'," + uniqueClientArrayName + "); }); }";
                clientEventScripts.Add(onLoadScript);
            }
            string fullOnLoadScript = string.Join(" ", clientEventScripts.ToArray());
            page.ClientScript.RegisterStartupScript(page.GetType(), "DEPENDENT_" + srcClientId + "_" + targetClientId, fullOnLoadScript, true);
        }

        /// <summary>
        /// Gets the absolute url path from a relative path, folder paths are returned with "/"
        /// 
        /// </summary>
        /// <param name="page"></param>
        /// <param name="relativeUrl"></param>
        /// <returns></returns>
        public static string GetAbsoluteUrl(Page page, string relativeUrl)
        {
            string serverName = page.Request.ServerVariables["SERVER_NAME"];
            string portNum = page.Request.ServerVariables["SERVER_PORT"];
            string secureConnection = page.Request.ServerVariables["SERVER_PORT_SECURE"];
            string basePath = GetBasePath(page.Request);
            if (!string.IsNullOrEmpty(portNum) && portNum != "80" && portNum != "443")
            {
                portNum = ":" + portNum;
            }
            else
            {
                portNum = "";
            }
            if (string.IsNullOrEmpty(secureConnection) || secureConnection == "0")
            {
                secureConnection = "http://";
            }
            else
            {
                secureConnection = "https://";
            }
            string url = secureConnection + serverName + page.ResolveUrl(relativeUrl);
            return url;
        }

        /// <summary>
        /// Converts a DataTable into JS Array
        /// </summary>
        /// <param name="dt">The DataTable to be used.</param>
        /// <param name="columns">A list of columns to use in building the array</param>
        /// <param name="allowEmptyCol">Controls if empty string/null values should be added to js array as ''</param>
        /// <returns></returns>
        public static string DataTableToJSArray(DataTable dt, string[] columns, bool allowEmptyCol)
        {
            if (columns == null)
            {
                columns = new string[dt.Columns.Count];
                for (int i = 0; i < dt.Columns.Count; i++)
                {
                    columns[i] = dt.Columns[i].ColumnName;
                }
            }
            if (dt.Rows.Count > 0)
            {
                int estBuffSize = dt.Rows.Count * dt.Columns.Count * 10;
                StringBuilder jsBuffer = new StringBuilder("new Array(", estBuffSize);
                foreach (DataRow row in dt.Rows)
                {
                    StringBuilder dataItem = new StringBuilder("[", columns.Length * 10);
                    foreach (string colName in columns)
                    {
                        if (dt.Columns.Contains(colName))
                        {
                            string colVal = row[colName].ToString();
                            if (string.IsNullOrEmpty(colVal) && allowEmptyCol)
                            {
                                dataItem.Append("'',");
                            }
                            else
                            {
                                colVal = EscapeSingleQuotes(colVal);
                                colVal = EscapeDoubleQuotes(colVal);
                                dataItem.Append("'" + colVal + "',");
                            }
                        }
                    }
                    dataItem = dataItem.Remove(dataItem.Length - 1, 1);
                    dataItem.Append("]");
                    jsBuffer.Append(dataItem + ",");
                }
                jsBuffer = jsBuffer.Replace(",", ")", jsBuffer.Length - 1, 1);
                return jsBuffer.ToString();
            }
            else
            {
                return "";
            }
        }

        /// <summary>
        /// Sets the inline styles of a control using an input string
        /// as key values pairs sepearated by ";", "key:value;"
        /// </summary>
        /// <param name="con">The control to set styles</param>
        /// <param name="styles"></param>
        public static void SetInlineControlStyles(Control con, string styles)
        {
            if (!string.IsNullOrEmpty(styles))
            {
                string[] keyValList = styles.Split(new char[] { ';' }, StringSplitOptions.RemoveEmptyEntries);
                foreach (string keyVal in keyValList)
                {
                    string[] styleKeyValuePair = keyVal.Split(new char[] { ':' }, StringSplitOptions.RemoveEmptyEntries);
                    if (con is WebControl)
                    {
                        (con as WebControl).Style[styleKeyValuePair[0]] = styleKeyValuePair[1];
                    }
                    else if (con is HtmlControl)
                    {
                        (con as HtmlControl).Style[styleKeyValuePair[0]] = styleKeyValuePair[1];
                    }
                }
            }
        }

        /// <summary>
        /// Returns an array of client ids bases on a CSV list of server control ids 
        /// </summary>
        /// <param name="container">The container(control) containining the server controls, else method will search up containers to find controls</param>
        /// <param name="listOfServerIds">A CSV of server ids in the form "controlId1,controlId2,...etc"</param>
        /// <returns>an array of client ids as ["ctrl01","ctrl02"]</returns>
        public static string[] GetListClientIds(Control container, string listOfServerIds)
        {
            char[] splitter = new char[] { ',' };
            string[] splitIds = listOfServerIds.Split(splitter, StringSplitOptions.RemoveEmptyEntries);
            string[] clientIds = new string[splitIds.Length];
            for (int i = 0; i < splitIds.Length; i++)
            {
                string id = splitIds[i];
                Control con = RecursiveFindControl(container, id);
                clientIds[i] = con.ClientID;
            }
            return clientIds;
        }

        /// <summary>
        /// Gets a list of values from an htmlselect's posted values.
        /// </summary>
        /// <param name="select"></param>
        /// <returns></returns>
        public static int[] GetKeysFromMultiSelect(HttpRequest request, string formKey)
        {
            string[] keys = new string[] { };
            if (request.Form[formKey] != null)
            {
                string postedValues = request.Form[formKey].ToString();
                if (!string.IsNullOrEmpty(postedValues))
                {
                    keys = postedValues.Split(",".ToCharArray(), StringSplitOptions.RemoveEmptyEntries);
                }
            }
            int[] returnKeys = new int[keys.Length];
            for (int i = 0; i < keys.Length; i++)
            {
                returnKeys[i] = int.Parse(keys[i]);
            }
            return returnKeys;
        }

        /// <summary>
        /// Registers a client sccript for initiating postback, firing server event
        /// </summary>
        /// <param name="eventSrc">The control which which triggers postback event</param>
        /// <param name="scriptName">The name of the client script used to initiate postback</param>
        public static void RegitserControlPostBackScript(Control eventSrc, string scriptName)
        {
            Page page = eventSrc.Page;
            PostBackOptions pbo = new PostBackOptions(eventSrc);
            string pbScript = "function " + scriptName + "() { " + page.ClientScript.GetPostBackEventReference(pbo) + "}";
            // Scripts are registed late (startup) to ensure data entry fields are loaded
            page.ClientScript.RegisterStartupScript(eventSrc.GetType(), scriptName, pbScript, true);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="context"></param>
        public static void RegisterJQuery(Page page)
        {
            // IMPORTANT: scripts must be registered in correct order
            page.ClientScript.RegisterClientScriptInclude(page.GetType(), "jQuery", page.ResolveUrl(BASE_JQUERY_SCRIPT));
            page.ClientScript.RegisterClientScriptInclude(page.GetType(), "jQueryUI", page.ResolveUrl(BASE_JQUERY_UI_SCRIPT));
            // IMPORTANT: script needed to prevent conflict with caisis $ function
            page.ClientScript.RegisterClientScriptBlock(page.GetType(), "jQueryNoConflict", "jQuery.noConflict();", true);
        }

        /// <summary>
        /// Returns a trimmed description if description > maxLength.
        /// i.e. "Hello World", 10 -> "Hello W..."
        /// </summary>
        /// <param name="description"></param>
        /// <param name="maxDescriptionLength"></param>
        /// <returns></returns>
        public static string GetTrimmedDescription(string description, int maxDescriptionLength)
        {
            // trip description
            if (description.Length > maxDescriptionLength)
            {
                return description.Substring(0, maxDescriptionLength - 3) + "...";
            }
            // unaltered description
            else
            {
                return description;
            }
        }

        /// <summary>
        /// Returns a fuzzy date.
        /// </summary>
        /// <param name="DateText"></param>
        /// <returns>a fuzzy date or null</returns>
        public static DateTime? GetFuzzyDate(string DateText)
        {
            DateTime? fuzz = null;
            DateTime tempfuzz;
            if (DateTime.TryParse(DateText, out tempfuzz))
            {
                fuzz = tempfuzz;
            }
            else
            {
                int fuzzyYear;
                if (int.TryParse(DateText, out fuzzyYear) && (fuzzyYear >= (DateTime.MinValue.Year) && fuzzyYear <= (DateTime.MaxValue.Year)))
                {
                    fuzz = new DateTime(fuzzyYear, 7, 1);
                }
            }

            return fuzz;

        }



        #region TEXT Utilities

        /// <summary>
        /// Returns the specified Camel Case version of the input string.
        /// i.e., hello world => Hello World
        /// </summary>
        /// <param name="source"></param>
        /// <returns></returns>
        public static string ToCamelCase(string source)
        {
            var words = source.Split(" ".ToCharArray(), StringSplitOptions.RemoveEmptyEntries).Select(w => w[0].ToString().ToUpper() + w.Substring(1, w.Length - 1)).ToArray();
            return string.Join(" ", words);
        }

        #endregion

        #region URL Utilities

        /// <summary>
        /// Creates a proper url encoded query string from urlParams
        /// where key and values will be url encoded
        /// </summary>
        /// <param name="urlParams">The dictionary of key value pairs</param>
        /// <returns>A url encoded string of key value parirs</returns>
        public static string CreateUrlPairs(Dictionary<string, string> urlParams)
        {
            var pairs = from key in urlParams.Keys
                        let value = urlParams[key]
                        // for each pair, create query string pair
                        select string.Format("{0}={1}", HttpUtility.UrlEncode(key), HttpUtility.UrlEncode(value));
            // for each pair, join into query string, param1=val1&param2=val2....
            return string.Join("&", pairs.ToArray());
        }

        /// <summary>
        /// Gets a dictionary of key value paris represented in query string
        /// </summary>
        /// <param name="qs">the raw query string to parse</param>
        /// <returns>A dictionary of key value pairs in query string</returns>
        public static Dictionary<string, string> GetUrlPairs(string qs)
        {
            // trim leading "?"
            qs = qs.TrimStart("?".ToCharArray());
            // parse into pairs
            System.Collections.Specialized.NameValueCollection collection = HttpUtility.ParseQueryString(qs);
            // fill pairs as simple dictionary
            Dictionary<string, string> pairs = new Dictionary<string, string>(StringComparer.OrdinalIgnoreCase);
            for (int i = 0; i < collection.Count; i++)
            {
                string key = collection.Keys[i];
                string value = collection[key];
                pairs.Add(key, value);
            }
            return pairs;
        }

        #endregion
    }
}
