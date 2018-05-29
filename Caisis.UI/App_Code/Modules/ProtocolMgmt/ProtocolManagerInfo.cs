using System;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.SessionState;

using Caisis.BOL;
using Caisis.UI.Core.Classes;
using Caisis.DataAccess;

namespace Caisis.UI.Modules.ProtocolMgmt
{
	/// <summary>
	/// Information about the current schema, protocol, etc. Suitable for
	/// caching in the Session. Could be a struct, but we'll see.
	/// </summary>
	[Serializable]
	public class ProtocolManagerInfo
	{
		private static readonly string _SESSIONKEY = "prmgmt_info";
		#region instance members
		private string protocol;
		private string schema;
		private string version;

		private string patientName;
		private DateTime date;
		private string month;
		private int schemaid;
		private string lastURL;
		#endregion

		#region Properties
		public string CurrentProtocolName
		{
			get { return protocol; }
			set { protocol = value; }
		}

		public string CurrentSchemaName
		{
			get { return schema; }
			set { schema = value; }
		}

		public string CurrentVersionName
		{
			get { return version; }
			set { version = value; }
		}

		public string CurrentPatientName
		{
			get { return patientName; }
			set { patientName = value; }
		}

		public DateTime ActiveCalendarDate
		{
			get { return date; }
			set { date = value; }
		}

		public string ActiveCalendarMonth
		{
			get { return month; }
			set { month = value; }
		}

		public int CurrentProtocolSchemaId
		{
			get { return schemaid; }
			set { schemaid = value; }
		}

		public string LastURL
		{
			get { return lastURL; }
			set { lastURL = value; }
		}
		#endregion
		
		private ProtocolManagerInfo()
		{
			// initialize current date automatically
			date = DateTime.Now;
			month = date.ToString("MMMM");
		}

		public static ProtocolManagerInfo GetInfo(HttpSessionState session)
		{
			if (session[ProtocolManagerInfo._SESSIONKEY] == null)
			{
				session[ProtocolManagerInfo._SESSIONKEY] = new ProtocolManagerInfo();
			}
			return (ProtocolManagerInfo) session[ProtocolManagerInfo._SESSIONKEY];
		}

		public static void SaveCurrentURL(HttpSessionState session, HttpRequest request)
		{
			ProtocolManagerInfo info = ProtocolManagerInfo.GetInfo(session);
			info.LastURL = request.Url.ToString();
		}

		public static void ClearCurrentURL(HttpSessionState session)
		{
			ProtocolManagerInfo info = ProtocolManagerInfo.GetInfo(session);
			info.LastURL = null;
		}
	}
}
