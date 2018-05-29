using System;
using System.Data.Odbc;

namespace Caisis.DataAccess
{
	/// <summary>
	/// Summary description for AccessHelper.
	/// 
	/// Was used when exporting directly to MS Access
	/// </summary>
	public class AccessHelper
	{

		
		//int randCount = 0;


		public AccessHelper()
		{
			//
			// TODO: Add constructor logic here
			//
		}


		static public OdbcConnection GetConnection(string dbName)  
		{
			OdbcConnection conn = new OdbcConnection("Driver={Microsoft Access Driver (*.mdb)};DBQ="+dbName);
			return conn;
		}

		static public void ExecuteScalar(string sql, string dbFile)  
		{		
			OdbcConnection conn = GetConnection(dbFile);
			try 
			{

				OdbcCommand com = new OdbcCommand(sql, conn);
				
				conn.Open();
				com.ExecuteNonQuery();
				conn.Close();
			} 
			catch (Exception ex)  
			{
				conn.Close();
				throw ex;
			}
		}

		static public void ExecuteScalar(string sql, OdbcConnection conn)  
		{
			OdbcCommand com = new OdbcCommand(sql, conn);
			try 
			{
				com.ExecuteNonQuery();
			}
			catch (Exception ex)  
			{
				conn.Close();
				throw ex;
			}
		}


		static public void MakeNewDataBase(string dbName)  
		{
			/* ADOX used to create Access databases. OBSOLETE
			ADOX.CatalogClass cat = new ADOX.CatalogClass();

			//dbName = "C:\\Temp\\test.mdb";

			cat.Create("Provider=Microsoft.Jet.OLEDB.4.0;" +
				"Data Source="+dbName+";" +
				"Jet OLEDB:Engine Type=5");
			cat.ActiveConnection = null;

			cat = null;

			
			GC.Collect();
			*/
		}
	}
}
