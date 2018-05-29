using System;
using System.Collections;
using System.Data;
using System.Data.SqlClient;




namespace Caisis.DataAccess
{
	/// <summary>
	/// Summary description for EndoscopyPathologyFindingDa.
	/// </summary>
	public class EndoscopyPathologyFindingDa : BaseDA
	{
		protected override void SetParams()  
		{
			this._GetStoredProc		= "spGetEndoscopyPathFindingsRecord";
			this._InsertStoredProc	= "spInsertEndoscopyPathFindingsRecord";
			this._UpdateStoredProc	= "spUpdateEndoscopyPathFindingsRecord";
			this._DeleteStoredProc	= "spDeleteEndoscopyPathFindingsRecord";
			//if parent id is the same as primkey then know its one to one
			
			this._GetByParentStoredProc = "spGetEndoscopyPathFindings";
		}
	}
}