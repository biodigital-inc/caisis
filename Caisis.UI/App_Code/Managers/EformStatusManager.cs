using System;
using System.Collections;
using System.Collections.Generic;

using System.Reflection;
using System.Linq;

namespace Caisis.UI.Core.Classes
{
	public enum EformStatusType
	{
		None = 0,
		DataEntryInProgress = 1,
		DataEntryComplete = 2,
		// DateEntryReviewed = 3,
		Narrated = 4,
		Approved = 5,
		Printed = 6
	}

	public enum EformPageType
	{
		None = 0,
		Edit = 1,
		// Review = 2,
		Narrative = 3,
		Approval = 4,
		Print = 5
	}

	/// <summary>
	/// Summary description for EformStatusManager.
	/// </summary>
	public class EformStatusManager
	{
		public const string Status_DataEntryInProgress = "Data Entry In Progress";
		public const string Status_DataEntryComplete = "Data Entry Complete";
		public const string Status_Narrated = "Narrated";
		public const string Status_Approved = "Approved";
		public const string Status_Printed = "Printed";
		public const string Status_Deleted = "Deleted";


        private static IEnumerable<string> _eformStatuses;

		public EformStatusManager() { }

        static EformStatusManager()
        {
            // init a list of eform statuses
            _eformStatuses = from field in typeof(EformStatusManager).GetFields(BindingFlags.Public | BindingFlags.Static | BindingFlags.FlattenHierarchy)
                             where field.IsLiteral && !field.IsInitOnly
                             select field.GetValue(null).ToString();
        }

        /// <summary>
        /// Returns a list of Eform status constants
        /// </summary>
        /// <returns></returns>
        public static IEnumerable<string> GetEformStatuses()
        {
            return _eformStatuses;
        }

		/// <summary>
		/// Determines the next eform status based on current status, referring page, and destination page.
		/// The status may stay the same.
		/// </summary>
		/// <param name="status"></param>
		/// <param name="fromPage"></param>
		/// <param name="toPage"></param>
		/// <returns></returns>
		public static string GetNextStatus(string status, string fromPage, string toPage)
		{
			if(!status.Equals(EformStatusManager.Status_Approved)) // make sure eform has not already been approved
			{
				EformStatusType statusType = EformStatusManager.GetStatusType(status);
				EformPageType fromPageType = EformStatusManager.GetPageType(fromPage);
				EformPageType toPageType = EformStatusManager.GetPageType(toPage);
				EformStatusType nextType = GetNextStatusByToPage(statusType, fromPageType, toPageType);
				return EformStatusManager.GetStatusString(nextType);
			}
			else
			{
				return "";
			}
		}

		private static EformStatusType GetNextStatusByToPage(EformStatusType status, EformPageType fromPage, EformPageType toPage)
		{
			if (status == EformStatusType.None)
			{
				return EformStatusType.DataEntryInProgress;
			} 
			else if (status == EformStatusType.Approved) // maintain approved status
			{
				return status;
			}

			switch (toPage)
			{
				case EformPageType.Edit:
					if (fromPage != EformPageType.None)
					{
						return EformStatusType.DataEntryInProgress;
					}
					break;

				case EformPageType.Narrative:
					if (status == EformStatusType.DataEntryInProgress)
					{
						return EformStatusType.DataEntryComplete;
					}
					break;

				case EformPageType.Approval:
					if (fromPage == EformPageType.Narrative && status < EformStatusType.Narrated)
					{
						return EformStatusType.Narrated;
					}
					else if (status == EformStatusType.DataEntryInProgress)
					{
						return EformStatusType.DataEntryComplete;
					}
					break;

				default:
					break;
			}

			return status; // propagate current status
		}

		public static string GetStatusString(EformStatusType status)
		{
			switch (status)
			{
				case EformStatusType.Approved:
					return "Approved";
				case EformStatusType.DataEntryComplete:
					return "Data Entry Complete";
				case EformStatusType.DataEntryInProgress:
					return "Data Entry In Progress";
				case EformStatusType.Narrated:
					return "Narrated";
				case EformStatusType.Printed:
					return "Printed";
				default:
					return "";
			}
		}

		public static EformStatusType GetStatusType(string status)
		{
			switch (status)
			{
				case "Approved":
					return EformStatusType.Approved;
				case "Data Entry Complete":
					return EformStatusType.DataEntryComplete;
				case "Data Entry In Progress":
					return EformStatusType.DataEntryInProgress;
				case "Narrated":
					return EformStatusType.Narrated;
				case "Printed":
					return EformStatusType.Printed;
				default:
					return EformStatusType.None;
			}
		}

		private static EformPageType GetPageType(string path)
		{
			if (path == null)
				return EformPageType.None;

			if (path.IndexOf("EditEFormContainer.aspx") != -1 || path.IndexOf("EditEFormContainer.aspx") != -1)
			{
				return EformPageType.Edit;
			}
			else if (path.IndexOf("ReviewEForm.aspx") != -1 || path.IndexOf("ReviewEForm.aspx") != -1)
			{
				return EformPageType.Narrative;
			}
			else if (path.IndexOf("ApproveEFormContainer.aspx") != -1 || path.IndexOf("ApproveEFormContainer.aspx") != -1)
			{
				return EformPageType.Approval;
			}
			else
			{
				return EformPageType.None;
			}
		}
	}
}
