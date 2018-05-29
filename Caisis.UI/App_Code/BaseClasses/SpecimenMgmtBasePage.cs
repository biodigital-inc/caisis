using System;
using System.Data;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Text;

using System.Web.SessionState;
using System.Text.RegularExpressions;
using System.Web.Mail;
using Caisis.DataAccess;

using Caisis.UI.Core.Classes;
using Caisis.UI.Core.Classes.CustomControls;

/// <summary>
/// Summary description for SpecimenMgmtBasePage again
/// </summary>
namespace Caisis.UI.Modules.SpecimenMgmt
{

    public class SpecimenMgmtBasePage : Caisis.UI.Core.Classes.BasePage
    {
        public SpecimenMgmtBasePage()
            : base()
        {
        }

        protected string EncryptPatientId(string pid)
        {
            return !string.IsNullOrEmpty(pid) ? Server.UrlEncode(Security.CustomCryptoHelper.EasyEncrypt(pid)) : string.Empty;
        }


        public string DecryptPatientId(string pid)
        {
            return !string.IsNullOrEmpty(pid) ? Security.CustomCryptoHelper.EasyDecrypt(pid) : string.Empty;

        }

        protected string getQS(string urlVariable)
        {
            if (Request.QueryString[urlVariable] != null)
            {
                return HttpUtility.HtmlDecode(Request.QueryString[urlVariable].ToString());
                //return Request.QueryString[urlVariable].ToString();
            }
            else
            {
                return "";
            }
        }


        /// <summary>
        /// Concatenates all selected values in a CheckBoxList, separated by comma.
        /// </summary>
        /// <param name="cbl"></param>
        /// <returns></returns>
        protected string GetStringOfCheckedItems(CheckBoxList cbl)
        {
            StringBuilder sb = new StringBuilder("");
            if (cbl.SelectedIndex > -1)
            {
                foreach (ListItem item in cbl.Items)
                {
                    if (item.Selected)
                    {
                        sb.Append(item.Text + ",");
                    }
                }
                sb.Remove(sb.Length - 1, 1);
            }
            return sb.ToString();
        }


        /// <summary>
        /// Checks the checkboxes with value present in the comma delimited string. 
        /// </summary>
        /// <param name="cbl"></param>
        /// <param name="s">comma delimited string</param>
        protected void CheckItemsInCheckBoxList(CheckBoxList cbl, string s)
        {
            for (int i = 0; i < cbl.Items.Count; i++)
            {
                if (s.IndexOf(cbl.Items[i].Value) >= 0) 
                {
                    cbl.Items[i].Selected = true;
                }
            }
        }

        /// <summary>
        /// Checks checkbox if its value is equal to a value in the array of strings
        /// </summary>
        /// <param name="cbl"></param>
        /// <param name="s"></param>
        protected void CheckItemsInCheckBoxList(CheckBoxList cbl, string[] s)
        {
            for (int i = 0; i < cbl.Items.Count; i++)
            {
                for (int j = 0; j < s.Length; j++)
                {
                    if(cbl.Items[i].Value.Equals(s[j]))
                    {
                        cbl.Items[i].Selected = true;
                        break;
                    }
                }
            }
        }

        /// <summary>
        /// Truncates the dateTime and returns a short date string. 
        /// </summary>
        /// <param name="s"></param>
        /// <returns></returns>
        protected string GetValidDisplayDate(string s)
        {
            if (s != "" && s.Length > 0)
            {
                s = DateTime.Parse(s).ToShortDateString();
            }

            return s;
        }


        virtual public bool IsValidVolume(String strNumber)
        {
            if (strNumber.EndsWith("ml") || strNumber.EndsWith("mm"))
            {

            }
            else
                return false;
            strNumber = strNumber.Replace("ml", "");
            strNumber = strNumber.Replace("mm", "");


            Regex objNotPositivePattern = new Regex("[^0-9.]");
            Regex objPositivePattern = new Regex("^[.][0-9]+$|[0-9]*[.]*[0-9]+$");
            Regex objTwoDotPattern = new Regex("[0-9]*[.][0-9]*[.][0-9]*");
            return !objNotPositivePattern.IsMatch(strNumber) &&
                objPositivePattern.IsMatch(strNumber) &&
                !objTwoDotPattern.IsMatch(strNumber);
        }

        virtual public bool IsPositionFull(string positionId)
        {
            return true;
        }
      
        virtual public void ShowMessage(Label lblControl, string message, string color)
        {
            lblControl.Text = message;

            if (color.Equals("red"))
            {
                lblControl.ForeColor = System.Drawing.Color.Red;
                lblControl.Font.Bold = true;
            }
            else if (color.Equals("megenta"))
            {
                lblControl.ForeColor = System.Drawing.Color.Magenta;
                lblControl.Font.Bold = true;
            }
            else if (color.Equals("green"))
            {
                lblControl.ForeColor = System.Drawing.Color.Green;
                lblControl.Font.Bold = false;
            }
            else
            {
                lblControl.ForeColor = System.Drawing.Color.Magenta;
                lblControl.Font.Bold = true;
            }



        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="parentStr">specimen id list</param>
        /// <param name="childStr">a single specimen id</param>
        /// <returns></returns>
        virtual public bool IsMemberOfgSpecimenIdList(string parentStr, string childStr)
        {
            string temp = "," + parentStr + ",";
            childStr = "," + childStr + ",";
            int i = temp.IndexOf(childStr);
            if (i >= 0)
                return true;
            else
                return false;

        }

        virtual public string RemoveSpecimenIdFromCurList(string specimenIdList, string specimenIdToRemove)
        {
            specimenIdList = "," + specimenIdList + ",";
            string temp = "";
            specimenIdToRemove = "," + specimenIdToRemove + ",";
            int pos = specimenIdList.IndexOf(specimenIdToRemove, 0, specimenIdList.Length);
            temp = specimenIdList.Replace(specimenIdToRemove, "");
            temp = temp.Insert(pos, ",");
            temp = temp.Remove(0, 1);
            if (temp.Length > 0)
                temp = temp.Remove(temp.Length - 1, 1);
            else
                temp = "0";
            return temp;
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="qStr">query string</param>
        /// <param name="sStr">session variable</param>
        /// <returns></returns>
        virtual public string MyQueryString(string qStr, string sStr)
        {
            // TODO: put entire query string in session as one variable instead of all these session vars
            string str = "";
            if (Request.QueryString[qStr] != null)
            {
                Session[sStr] = Request.QueryString[qStr];
                str = Session[sStr].ToString();

            }
            else if (Session[sStr] != null)
            {
                str = Session[sStr].ToString();
            }
            else
            {
                str = "";
            }
            return str;
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="svStr">session variable</param>
        /// <returns></returns>
        virtual public string MySessionString(string svStr)
        {
            string str = "";
            if (Session[svStr] == null) //for the first time
            {
                str = "";
            }
            else if (Session[svStr] != null) //next time when session variable exist
            {
                str = Session[svStr].ToString();
            }
            else
            {
                str = "";
            }
            return str;

        }

        virtual public void SaveMySessionVariable(string svStr, string valStr)
        {
            // TODO: this makes no sense 
            if (valStr.Length > 0 && Session[svStr] != null)  //if session variable alrady exist
                Session[svStr] = valStr;
            else if (valStr.Length > 0)
                Session[svStr] = valStr;

            if (valStr.Length > 0)
            {
                Session[svStr] = valStr;
            }
        }

        virtual public void ClearMySessionVariable(string svStr)
        {
            Session.Contents.Remove(svStr);

        }

        public static void CreateConfirmBox(ref System.Web.UI.WebControls.Button btn, string strMessage)
        {
            btn.Attributes.Add("onclick", "return confirm('" + strMessage + "');");
        }

        virtual public void FillDDList(System.Web.UI.WebControls.DropDownList ddl, string str)
        {
            if (str.Length == 0)
                return;
            try
            {
                ddl.SelectedValue = str;
            }
            catch (Exception ex)
            {
                ddl.Items.Add(new ListItem(str, str));
            }

        }

        virtual public void FillDDListByName(System.Web.UI.WebControls.DropDownList ddl, string str)
        {
            if (str.Length == 0)
                return;
            string val = "";
            int i = 0;
            if (ddl.Items.FindByText(str).Text.Equals(str))
            {
                val = ddl.Items.FindByText(str).Value;
                i = ddl.Items.IndexOf(new ListItem(str, val));
                ddl.SelectedIndex = i;
            }
            else
                ddl.SelectedIndex = 0;

        }

        virtual public void SetInvalidStyle(Control con, string highlightColor)
        {
            string myStyle = "";

            string color = highlightColor + ";";

            if (con is HtmlControl)
            {
                myStyle = ((HtmlControl)con).Attributes["style"];
            }
            else if (con is WebControl)
            {
                myStyle = ((WebControl)con).Attributes["style"];
            }

            if (myStyle == null || myStyle == "")
            {
                if (con is HtmlControl)
                {
                    ((HtmlControl)con).Style.Add("background-color", color);
                }
                else if (con is WebControl)
                {
                    ((WebControl)con).Style.Add("background-color", color);
                }

            }
            else // append styles
            {
                string newStyle;

                if (myStyle.Trim().EndsWith(";"))
                {
                    newStyle = myStyle + "background-color: " + color;
                }
                else
                {
                    newStyle = myStyle + "; background-color: " + color;
                }

                if (con is HtmlControl)
                {
                    ((HtmlControl)con).Attributes["style"] = newStyle;
                }
                else if (con is WebControl)
                {
                    ((WebControl)con).Attributes["style"] = newStyle;
                }


            }

        }
    }

    /// <summary>
    /// Provides base functionality for data entry related Specimen forms
    /// </summary>
    public class SpecimenMgmtDataEntryPage : SpecimenMgmtBasePage
    {
        public SpecimenMgmtDataEntryPage()
            : base()
        {
        }

        /// <summary>
        /// Returns if the current User can edit specimen data
        /// </summary>
        /// <returns></returns>
        protected bool CanEditData()
        {
            return Caisis.Security.PermissionManager.HasPermission("Edit Specimen Data");
        }

        /// <summary>
        /// Suppress data entry fields for entry
        /// </summary>
        protected void SuppressDataEntry()
        {
            IEnumerable<ICaisisInputControl> inputs = PageUtil.GetControls<ICaisisInputControl>(Page);
            IEnumerable<IButtonControl> buttons = PageUtil.GetControls<IButtonControl>(Page);
            // diable caisis input controls
            foreach (ICaisisInputControl input in inputs)
                input.Enabled = false;
            // disable buttons/image buttons
            foreach (IButtonControl button in buttons)
                (button as Control).Visible = false;
        }

        protected override void OnPreRender(EventArgs e)
        {
            // disable data entry is user doesn't have required permissions
            bool canEdit = CanEditData();
            if (!canEdit)
            {
                SuppressDataEntry();
            }
            base.OnPreRender(e);
        }

    }
}
