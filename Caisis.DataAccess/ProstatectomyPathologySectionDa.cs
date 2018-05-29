using System;
using System.Collections;
using System.Data;
using System.Data.SqlClient;



namespace Caisis.DataAccess
{
	/// <summary>
	/// Summary description for Prostatectomy Pathology Section Da.
	/// </summary>
	public class ProstatectomyPathologySectionDa : BaseDA // ChildDataAccess
	{
		

		public DataSet ValidatePathSectionsDeletion (int PathSectionId)  
		{
			SqlCommand com = DataAccessHelper.CreateCommand("spValidatePathSectionsDeletion");
			DataAccessHelper.AddIntInputParam(com, "PathSectionId", PathSectionId);
			return DataAccessHelper.GetList(com);
		}


	}
}