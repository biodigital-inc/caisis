
using System;	
using System.Security.Permissions;
using System.Data;
using System.Collections;
using System.Configuration;


namespace Caisis.Security  {

	/// <summary>
	/// Defines available permissions for assignment to user groups
	/// </summary>
	public class PermissionManager
	{
		// TODO: move permissions to Modules.xml to ease association with new modules
        // TODO: logically group permissions

        // DEFINE ALL 
		
		public const string ViewData = "ViewData";
		public const string EditData = "EditData";
		public const string DeleteData = "DeleteData";
		public const string UnlockData = "UnlockData";
        public const string AddPatient = "AddPatient";
		public const string DeletePatient = "DeletePatient";
		public const string EditNarrative = "EditNarrative";
		public const string EditSecurity = "EditSecurity";	
		public const string EFormApprove = "ApproveEForm"; 
		public const string EFormEdit = "EditEForm";
		public const string EFormInitiate = "InitiateEForm";
        
        // v5.0 updated from DenyPatientAccess; added to BasePage
        public const string ViewPatientIdentifiers = "ViewPatientIdentifiers";
        public const string ExportData = "ExportData";

        // v5.1 ability to move patients between datasets
        public const string MovePatient = "MovePatient";

        // specific to modules
        public const string EditProtocolSchema = "EditProtocolSchema";
        
        public const string PatientEdAdmin = "PatientEdAdmin";
        
        public const string AdminProject = "AdminProject";
        public const string AdminProjectModule = "AdminProjectModule";
        public const string UpdateProject = "UpdateProject";
        
        //public const string AdminSpecimen = "AdminSpecimen";

       
		private static Hashtable _perm = null;
		

		static 	PermissionManager()
		{
			_perm = new Hashtable();
			
		}

        /// <summary>
        /// Validates user has permissions to do the operation
        /// </summary>
        /// <param name="permissionName">permission</param>
        /// <returns>true/false</returns>
		public static bool HasPermission(string permissionName)
		{				
			CustomPrincipal p = System.Threading.Thread.CurrentPrincipal as CustomPrincipal;	
			return p.IsInRoles(permissionName);
		}



		/*
		public static string[] GetPermissionRoles(string permissionName)  
		{			
			string[] roleList = (string[])_perm[permissionName];
			if (roleList == null)  
			{
				PermissionDa permDa = new PermissionDa();
				DataSet ds = permDa.GetByName(permissionName);
				int permissionId = (int)ds.Tables[0].Rows[0]["permissionId"];

				RoleDa da = new RoleDa();
				ds = da.GetByPermission(permissionId);
			
				roleList = new string[ds.Tables[0].Rows.Count];
				DataRowCollection drCol = ds.Tables[0].Rows;
				int i = 0;
				foreach (DataRow dr in drCol)  
				{
					roleList[i] = dr["Role"].ToString();
					i++;
				}
			
				_perm.Add(permissionName, roleList);
			}
			return roleList;
		}
		*/


		
	}
}
