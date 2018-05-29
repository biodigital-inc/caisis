using System;
using System.Collections;
using System.Data.SqlClient;

namespace Caisis.DataAccess
{
	/// <summary>
	/// Summary description for Class1.
	/// </summary>
	public interface IDataAccess
	{
		bool UpdateRecord(Hashtable args);
		int InsertRecord(Hashtable args);
		bool DeleteRecord(int primKey);

	}
}
