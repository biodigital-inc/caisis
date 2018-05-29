using System;
using System.Data;

namespace Caisis.DataAccess
	{/// <summary>
	/// Used to determine type of DataAccessException
	/// </summary>
	
	public enum DataAccessExceptionType  
	{
		UserConcurrency
	}
	
	/// <summary>
	/// Summary description for DataAccessException.
	/// </summary>
	public class DataAccessException : System.ApplicationException
	{
		private object _newValues;
		private DataAccessExceptionType _type;

		public DataAccessException() : base()
		{
			//
			// TODO: Add constructor logic here
			//
		}

		public DataAccessException(DataAccessExceptionType ex) : base()
		{
			_type = ex;
		
		}
		/// <summary>
		/// This method is used for DataAccessExceptionType user concurrency to set the
		/// new values in the database.  These will be displayed by UI page for overwrite or keep.
		/// </summary>
		public DataAccessException(DataAccessExceptionType ex, object newValues) : base()
		{
			_type = ex;
			_newValues= newValues;
		}

		public DataAccessException(string message) : base(message)
		{
		}


		public DataAccessExceptionType ExceptionType  
		{
			get 
			{
				return _type;
			}
		}

		public object NewValues  
		{
			get  
			{
				return _newValues;
			}
		}

	}
}
