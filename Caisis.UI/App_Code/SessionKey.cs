using System;

namespace Caisis.UI.Core.Classes
{
	/// <summary>
	/// Used to keep track of the names of the session variables.
	/// </summary>
	public class SessionKey
	{
				// username and userid not stored in session- if you need username call SecurityController GetUserName() to get it from the asp Identity object;
			
				public const string LoginId = "loginId";				// not the userID! stores unique id assigned at login to track when user logs out
				
				public const string DatasetId = "DatasetId";			// stores id that allows access to groups of patients defined by the Datasets.xml file
				
				public const string GroupViewCode = "GroupViewCode";	// stores code assigned to user group that determines tab visibility
		
				//public const string UserPurpose = "UserPurpose";

				// Patient Session Vars
				public const string PatientId = "patientId";		
				
				public const string PtFirstName = "ptFirstName";
				
				public const string PtLastName = "ptLastName";
				
				public const string PtMRN = "ptMRN";
				
				public const string PtDOB = "ptDOB";

				// Form Session Vars
				public const string CurrentPage = "currentPage";
				
				public const string CurrentListType = "currentListType";
				
				public const string CurrentListCrit = "currentListCrit";
				
				public const string CurrentListCritName = "currentListCritName";
				
				public const string RecentSearchList = "recentSearchList";
				
				public const string CurrentClinicDate = "currentClinicDate";
	
				public const string FormStyle = "formStyle";

				// Tracks View of Labs Available on Chronological: should be on object that can be used accross session such as cookie or database 
				public const string LabsFilter = "LabsFilter";
	}

	// TODO: should add handler to centralize all gets/sets of session variables. Anytime PatientId is set- the user who viewed the patient should be logged! currently handled by FramePage.cs
}
