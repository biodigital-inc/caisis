using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

using Caisis.BOL;
using Caisis.DataAccess;
using Caisis.Security;
using Caisis.UI.Core.Classes;

namespace Caisis.UI.Core.Utilities
{
    public partial class LookupCodesCallBack : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string output = "";
            string methodName = Request.Form["methodName"];            
            string lookupField = Request.Form["field"];
            string searchTerm = Request.Form["search"];
            bool isDistinct = string.IsNullOrEmpty(Request.Form["isDistinct"]) ? false : bool.Parse(Request.Form["isDistinct"]);

            switch (methodName)
            {
                case ("GetParentCodeByChildCode"):
                    string childLkpField = Request.Form["childLkpField"];
                    string childLkpCode = Request.Form["childLkpCode"];
                    string parentLkpField = Request.Form["parentLkpField"];
                    LookupCodeDa da = new LookupCodeDa();
                    DataTable dt = da.GetParentLookupCodeByChildCode(parentLkpField, childLkpField, childLkpCode);
                    // 0 || > 1 results, return empty value (prevent ambiguity)
                    output = dt.Rows.Count == 1 ? dt.Rows[0][LookupCode.LkpCode].ToString() : "";
                    break;
                default:
                    if (!string.IsNullOrEmpty(lookupField))
                    {
                        DataTable lkpTable = GetLookupCodes(lookupField, isDistinct);
                        if (lkpTable.Columns.Contains(LookupCode.LkpCode))
                        {
                            string[] lkpFields = new string[] { LookupCode.LkpCode, LookupCode.LkpDescription };
                            output = PageUtil.DataTableToJSArray(lkpTable, lkpFields, false);
                        }
                        else
                        {
                            string[] lkpFields = new string[] { "DropDownValue", "DropDownText" };
                            output = PageUtil.DataTableToJSArray(lkpTable, lkpFields, false);
                        }
                    }
                    break;
            }
            
            
            Response.Write(output);
        }

        /// <summary>
        /// Returns a DataTable of lookupcodes 
        /// </summary>
        /// <param name="lkpCode"></param>
        /// <param name="isDistinct"></param>
        /// <returns></returns>
        private DataTable GetLookupCodes(string lkpCode, bool isDistinct)
        {
            DataTable dataSourceTable = new DataTable();
            string LookupColumn = LookupCode.LkpCode;
            string LookupDescriptionColumn = LookupCode.LkpDescription;
            if (isDistinct)
            {
                string[] lookupDistinctVals = lkpCode.Split(new char[] { ';' });
                string tablename = lookupDistinctVals[0].Trim();
                string valuefield = lookupDistinctVals[1].Trim();
                string textfield = lookupDistinctVals[2].Trim();
                string restriction = null;
                string order = null;

                if (lookupDistinctVals.Length >= 4)
                {
                    restriction = lookupDistinctVals[3].Trim();
                    System.Web.SessionState.HttpSessionState tempSession = Page.Session;
                    if (restriction.Contains("@PatientId") && tempSession != null && tempSession[SessionKey.PatientId] != null)
                    {
                        restriction = restriction.Replace("@PatientId", tempSession[SessionKey.PatientId].ToString());
                    }

                    if (restriction.Contains("@UserName"))
                    {
                        Caisis.Security.SecurityController sc = new Caisis.Security.SecurityController();
                        restriction = restriction.Replace("@UserName", String.Format("'{0}'", sc.GetUserName()));
                    }

                    if (lookupDistinctVals.Length >= 5)
                    {
                        order = lookupDistinctVals[4].Trim();
                    }
                }

                dataSourceTable = LookupCodeDa.GetLookupData(tablename, valuefield, textfield, restriction, order).Table;
                LookupColumn = "DropDownText";
            }
            else
            {
                string[] specialLkpCode = lkpCode.Split(';');
                if (specialLkpCode.Length == 3)
                {
                    LookupCodeDa da = new LookupCodeDa();
                    string childLkpCode = specialLkpCode[0];
                    string parentLkpCode = specialLkpCode[1];
                    string parentLkpCodeValue = specialLkpCode[2];

                    DataTable parentLkpCodes = da.GetLookupsByFieldName(parentLkpCode).Tables[0];
                    DataRow[] results = parentLkpCodes.Select("LkpCode = '" + parentLkpCodeValue + "'");
                    if (results.Length > 0)
                    {
                        int lkpCodeId = int.Parse(results[0][LookupCode.LookupCodeId].ToString());
                        dataSourceTable = da.GetChildCodesByLookupIdAndChildLookupName(lkpCodeId, childLkpCode);
                    }
                }
                else
                {
                    dataSourceTable = CacheManager.GetLookupCodeList(lkpCode);
                }
            }
            return dataSourceTable;
        }
    }
}