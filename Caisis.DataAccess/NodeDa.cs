using System;
using System.Collections;
using System.Data;
using System.Data.SqlClient;



namespace Caisis.DataAccess
{
	/// <summary>
	/// Summary description for NodeDa.
	/// </summary>
	public class NodeDa : BaseDA//ChildDataAccessRelOne
	{
		protected override void SetParams()  
		{
			this._GetStoredProc = "spGetProcNodesRecord";
			this._InsertStoredProc = "spInsertProcNodesRecord";
			this._UpdateStoredProc = "spUpdateProcNodesRecord";
			this._DeleteStoredProc = "spDeleteProcNodesRecord";
			this._GetByParentStoredProc = "spGetProcNodes";
		}
			
	}
}