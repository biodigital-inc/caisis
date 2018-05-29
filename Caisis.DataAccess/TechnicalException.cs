using System;

namespace Caisis.DataAccess
{
	/// <summary>
	/// Summary description for TechnicalException.
	/// </summary>
	public class TechnicalException: System.ApplicationException
										  	{
		public TechnicalException() :base()
		{
			//
			// TODO: Add constructor logic here
			//
		}
		public TechnicalException(string message) :base(message)  
		{
		}
		public TechnicalException(string message, System.Exception e) : base(message, e) 
		{
		}
	}
}
