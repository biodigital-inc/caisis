using System;

namespace Caisis.DataAccess
{
	/// <summary>
	/// Summary description for UserConcurrencyException.
	/// </summary>
	public class UserConcurrencyException : DataAccessException
	{
		public UserConcurrencyException() : base() { }

		public UserConcurrencyException(object newValues) : base(DataAccessExceptionType.UserConcurrency, newValues) { }
	}
}
