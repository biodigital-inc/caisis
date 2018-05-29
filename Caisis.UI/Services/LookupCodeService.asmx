<%@ WebService Language="C#" Class="Caisis.WebServices.LookupCodeService" %>

using System;
using System.Data;
using System.Web;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.Runtime.Serialization;
using System.Linq;

using Caisis.BOL;
using Caisis.DataAccess;
using Caisis.UI.Core;
using Caisis.UI.Core.Classes;
using Caisis.Controller;

namespace Caisis.WebServices
{
    /// <summary>
    /// A service for searching Lookup Codes.
    /// </summary>
    [WebService(Namespace = "http://www.caisis.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class LookupCodeService : CaisisWebService
    {
        public LookupCodeService()
            : base()
        {
        }


        [WebMethod(EnableSession = true)]
        public LookupCode[] GetLookupCodes(string lkpFieldName)
        {
            var codes = GetLookupCodes(lkpFieldName, false);
            return ToLookupCodes(codes);
        }

        [WebMethod(EnableSession = true)]
        public LookupCode[] GetLookupDistinct(string lkpDistinctName)
        {
            var codes = GetLookupCodes(lkpDistinctName, true);
            return ToLookupCodes(codes);
        }

        [WebMethod(EnableSession = true)]
        public LookupCode[] GetParentCodeByChildCode(string childLkpField, string childLkpCode, string parentLkpField)
        {
            LookupCodeDa da = new LookupCodeDa();
            var codes = da.GetParentLookupCodeByChildCode(parentLkpField, childLkpField, childLkpCode);
            // select first or NULL
            var singleCode = ToLookupCodes(codes).Take(1).ToArray();
            return singleCode;
        }

        /// <summary>
        /// For the given list of codes, convert to service objects
        /// </summary>
        /// <param name="codes"></param>
        /// <returns></returns>
        public static LookupCode[] ToLookupCodes(DataTable codes)
        {
            string lkpCodeColumn = BOL.LookupCode.LkpCode;
            string lkpDescriptionColumn = BOL.LookupCode.LkpDescription;
            if (!codes.Columns.Contains(BOL.LookupCode.LkpCode))
            {
                lkpCodeColumn = "DropDownValue";
                lkpDescriptionColumn = "DropDownText";
            }
            var _codes = from code in codes.AsEnumerable()
                         let lkpCode = code[lkpCodeColumn].ToString()
                         let lkpDescription = code[lkpDescriptionColumn].ToString()
                         select new LookupCode(lkpCode, lkpDescription);
            return _codes.ToArray();
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
                    System.Web.SessionState.HttpSessionState tempSession = HttpContext.Current.Session;
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
                        int lkpCodeId = int.Parse(results[0][BOL.LookupCode.LookupCodeId].ToString());
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

    [DataContract]
    public class LookupCode
    {
        [DataMember]
        public string Code;
        [DataMember]
        public string Description;

        public LookupCode(string code, string description)
        {
            this.Code = code;
            this.Description = description;
        }
    }
}