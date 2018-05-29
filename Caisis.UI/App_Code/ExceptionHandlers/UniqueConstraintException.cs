using System;

namespace Caisis.UI.Core.Classes
{
	/// <summary>
	/// We will use this class to customize the error handling of unique constraint violations.
	/// </summary>
    public class UniqueConstraintException : ClientException
	{
		public UniqueConstraintException() : base() {}

		public UniqueConstraintException(string message) : base(message) {}

		public UniqueConstraintException(string message, bool logError) : base(message)
		{
			this.LogError = logError;
		}

		public UniqueConstraintException(ClientExceptionType type) : base()
		{
			this.ExceptionType = type;
		}
	}
}
