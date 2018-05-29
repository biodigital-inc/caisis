using System;

namespace Caisis
{

	public enum ClientExceptionType  
	{
		InvalidPassword // 4.1 leave for now because used in Global.asax; need to determine why
        //InvalidUser,
		//InvalidPassword,
		//InactiveUser,
        //RepeatPassword,
        //InvalidPasswordLength
	}
	/// <summary>
	/// Summary description for ClientException.
	/// </summary>
	public class ClientException : System.ApplicationException
	{
		public ClientExceptionType ExceptionType;
		public bool LogError = false;
		public ClientException() : base()
		{
			//
			// TODO: Add constructor logic here
			//
		}
		public ClientException(string message) : base(message)
		{
		}

		public ClientException(string message, bool logError) : base(message)  
		{
			this.LogError = logError;
            
		}

		public ClientException(ClientExceptionType type) : base()  
		{
			this.ExceptionType = type;
        }
    }
}
