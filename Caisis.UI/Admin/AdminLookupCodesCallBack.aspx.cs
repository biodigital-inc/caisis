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
using Caisis.UI.Core.Classes;

namespace Caisis.UI.Admin
{
    public partial class AdminLookupCodesCallBack : AdminBasePage
    {

        // Form variables name
        private static readonly string LookupCodeFieldName = "lookupCodeFieldName";
        private static readonly string LookupCodeValue = "lookupCodeValue";
        private static readonly string LookupCodeDescription = "lookupCodeDescription";
        private static readonly string LookupCodeId = "lookupCodeId";
        private static readonly string ParentLookupId = "parentLookupId";
        private static readonly string ChildLookupFieldName = "childLookupFieldName";
        private static readonly string ChildLookupCodeIdList = "lookupCodeIdList";

        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);

            string methodName = Request.Form["methodName"];
            if (!string.IsNullOrEmpty(methodName))
            {
                switch (methodName)
                {
                    case "addCode":
                        break;
                    case "getCodes":
                        GetCodes();
                        break;
                    case "getAllCodesByParentId":
                        GetAllCodesByParentId();
                        break;
                    case "getCodesByParentIdAndChildFieldName":
                        GetCodesByParentIdAndChildFieldName();
                        break;
                    case "addAssociations":
                        AddAssociations();
                        break;
                    case "removeAssociations":
                        RemoveAssociations();
                        break;
                }
            }
        }

        protected void GetAllCodesByParentId()
        {
            int parentLkpId = int.Parse(Request.Form[ParentLookupId]);
            LookupCodeDa da = new LookupCodeDa();
            DataTable results = da.GetChildsCodeByLookupId(parentLkpId);
            string outputBuffer = "[";
            string s = "";
            foreach (DataRow row in results.Rows)
            {
                string lkpFieldName = row[LookupCode.LkpFieldName].ToString();
                if (lkpFieldName != s)
                {
                    outputBuffer += "{ \"field\" : '" + lkpFieldName + "', \"codes\": " + GetOutputArray(results.Select("LkpFieldName = '" + lkpFieldName + "'")) + " } ,";
                    s = lkpFieldName;
                }

            }
            outputBuffer = outputBuffer.TrimEnd(",".ToCharArray());
            outputBuffer += "]";
            Response.Write(outputBuffer);
        }

        protected void AddLookupCode()
        {
            string lkpField = Request.Form[LookupCodeFieldName];
            string lkpCode = Request.Form[LookupCodeValue];
            string lkpCodeDescription = Request.Form[LookupCodeDescription];

            // Validate Input
            if (!string.IsNullOrEmpty(lkpField) && !string.IsNullOrEmpty(lkpCode) && lkpCodeDescription != null)
            {
                //LookupCode biz = new LookupCode();
                //biz[LookupCode.LkpFieldName] = lkpField;
                //biz[LookupCode.LkpCode] = lkpCode;
                //biz[LookupCode.LkpDescription] = lkpCodeDescription;
                //biz[LookupCode.LkpOrder] = PageUtil.ObjToInt(lkpOrder.Value);
                //biz[LookupCode.LkpSuppress] = lkpSuppress.Checked;
                //biz[LookupCode.UpdatedBy] = User.Identity.Name;
                //biz[LookupCode.UpdatedTime] = DateTime.Now;
                //biz[LookupCode.EnteredBy] = User.Identity.Name;
                //biz[LookupCode.EnteredTime] = DateTime.Now;
                //biz.Save();
            }
        }

        protected void DeleteLookupCode()
        {
        }

        protected void GetCodes()
        {
            string lkpField = Request.Form[LookupCodeFieldName];
            LookupCodeDa da = new LookupCodeDa();
            DataTable dt = da.GetLookupsByFieldName(lkpField).Tables[0];
            string codes = "{ \"codes\": " + GetOutputArray(dt) + " }";
            Response.Write(codes);
        }

        protected void GetCodesByParentIdAndChildFieldName()
        {
            int parentLkpId = int.Parse(Request.Form[ParentLookupId]);
            string childFieldName = Request.Form[ChildLookupFieldName];
            LookupCodeDa da = new LookupCodeDa();
            DataTable lookupCodes = da.GetLookupCodesExcludingCodesByParentLookupId(parentLkpId, childFieldName);
            DataTable childNodes = da.GetChildCodesByLookupIdAndChildLookupName(parentLkpId, childFieldName);
            string codes = "{ \"codes\": " + GetOutputArray(lookupCodes) + ", \"childCodes\": " + GetOutputArray(childNodes) + " }";
            Response.Write(codes);
        }

        protected void AddAssociations()
        {
            LookupCodeDa da = new LookupCodeDa();
            string parentLkpId = Request.Form[ParentLookupId];
            string keyList = Request.Form[ChildLookupCodeIdList];
            if (!string.IsNullOrEmpty(parentLkpId) && !string.IsNullOrEmpty(keyList))
            {
                int parentKey = int.Parse(parentLkpId);
                string[] childKeys = keyList.Split(",".ToCharArray(), StringSplitOptions.RemoveEmptyEntries);
                da.InsertChildCodes(parentKey, childKeys);
            }
            GetCodesByParentIdAndChildFieldName();
        }

        protected void RemoveAssociations()
        {
            LookupCodeDa da = new LookupCodeDa();
            string parentLkpId = Request.Form[ParentLookupId];
            string keyList = Request.Form[ChildLookupCodeIdList];
            if (!string.IsNullOrEmpty(parentLkpId) && !string.IsNullOrEmpty(keyList))
            {
                int parentKey = int.Parse(parentLkpId);
                string[] childKeys = keyList.Split(",".ToCharArray(), StringSplitOptions.RemoveEmptyEntries);
                da.RemoveChildCodes(parentKey, childKeys);
            }
            GetCodesByParentIdAndChildFieldName();
        }

        protected string GetOutputArray(DataTable dt)
        {
            DataRow[] rows = new DataRow[dt.Rows.Count];
            dt.Rows.CopyTo(rows, 0);
            return GetOutputArray(rows);
        }

        protected string GetOutputArray(DataRow[] rows)
        {
            string returnString = "[";
            foreach (DataRow row in rows)
            {
                string lookupCodeId = row[LookupCode.LookupCodeId].ToString();
                string lookupCode = PageUtil.EscapeSingleQuotes(row[LookupCode.LkpCode].ToString());
                returnString += "[\"" + lookupCodeId + "\",\"" + lookupCode + "\"],";
            }
            returnString = returnString.TrimEnd(",".ToCharArray()) + "]";
            return returnString;
        }
    }
}
