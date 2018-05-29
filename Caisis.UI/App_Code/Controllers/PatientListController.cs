using System;
using System.Data;
using Caisis.DataAccess;
using System.Configuration;
using Caisis.Security;

namespace Caisis.Controller
{
	/// <summary>
	/// Gets list of patients based on list type and search criteria passed to it
	/// </summary>
	public class PatientListController 
	{
		public PatientListController() 
		{
		
		}
		/// <summary>
		/// 
		/// </summary>
		/// <param name="dsSQL"></param>
		/// <param name="listName"></param>
		/// <param name="listValue"></param>
		/// <param name="listModifier"></param>
		/// <param name="orderBy"></param>
		/// <param name="startRow"></param>
		/// <param name="numRows"></param>
		/// <param name="clinicDate"></param>
		/// <param name="listUser"></param>
		/// <returns></returns>
		public DataSet GetList(string dsSQL, string listName, string listValue, string listModifier, string orderBy, int startRow, int numRows, string clinicDate, string listUser)  
		{
            DataSet ds = new DataSet();
            try
			{
				PatientDa da = new PatientDa();
				ds = da.ListPatients(dsSQL, listName, listValue, listModifier, orderBy, startRow, numRows, listUser);
			}
			catch(Exception e)
			{
                Caisis.UI.Core.Classes.ExceptionHandler.Publish(e);
                //throw new ClientException(e.Message);
			}
            return ds;
		}

	}
}
