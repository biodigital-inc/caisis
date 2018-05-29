namespace Caisis.Security
{
	using System;	
	using System.Security.Principal;
	using System.Collections;


	public class CustomPrincipal : GenericPrincipal
	{
		private Hashtable _userProfile;
		public const string CurrentDataSet = "currentDataSet";
		public const string DiseaseMode = "diseaseMode";


		public CustomPrincipal(IIdentity id, string[] roles) : base(id, roles)
		{
			_userProfile = new Hashtable();


		}

		public virtual bool IsInRoles (string [] roles)
		{
			foreach(string _role in roles)
			{
				bool isInRole = base.IsInRole(_role);
				if (isInRole == true)
					return true;
			}
			return false;
		}

		public virtual bool IsInRoles(string roles)
		{
			string [] _roles = roles.Split(',');
			return IsInRoles(_roles);
		}

		public Hashtable UserProfile  
		{
			get  
			{
				return _userProfile;
			}
			set 
			{
				_userProfile = value;
			}
		}
	}
}
