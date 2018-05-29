using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace Caisis.BOL
{
	/// <summary>
	/// This is the base class for exceptions thrown by classes in Caisis.BOL
	/// </summary>
	public class CaisisDataException : ApplicationException
	{
		public CaisisDataException() : base() { }
		public CaisisDataException(string message) : base(message) { }
	}

	public class InvalidSelectException : CaisisDataException
    {
        public InvalidSelectException() : base() { }

        public InvalidSelectException(string msg) : base(msg) { }
    }

	public class InvalidInsertException : CaisisDataException
	{
		public InvalidInsertException() : base() { }

		public InvalidInsertException(string msg) : base(msg) { }
	}

	public class InvalidUpdateException : CaisisDataException
	{
		public InvalidUpdateException() : base() { }

		public InvalidUpdateException(string msg) : base(msg) { }
	}

	public class InvalidDeleteException : CaisisDataException
	{
		public InvalidDeleteException() : base() { }

		public InvalidDeleteException(string msg) : base(msg) { }
	}

	public class InvalidPatientException : CaisisDataException
	{
		private static readonly string msg = "The save could not be validated. The PatientId associated with the record in the database does not match the current PatientId.";

		public InvalidPatientException() : base(msg) { }
	}

	public class UniqueKeyConstraintException : CaisisDataException
	{
		private IEnumerable<string> uniqueConstraintColumns;

		public IEnumerable<string> UniqueConstraintColumns
		{
			get { return uniqueConstraintColumns; }
		}

		public UniqueKeyConstraintException(string message, IEnumerable<string> uniqueConstraintColumns)
			: base(message)
		{
			this.uniqueConstraintColumns = uniqueConstraintColumns;
		}
	}

	public class ChildDataPreventsDeleteException : CaisisDataException
	{
		public delegate string MessageBuilderDelegate(DataTable table, string singularName);

		private string msg;

		public ChildDataPreventsDeleteException(DataTable childDataInfo, string singularName)
			: base()
		{
			msg = BuildMessage(childDataInfo, singularName);
		}

		public ChildDataPreventsDeleteException(DataTable childDataInfo, string singularName,
			MessageBuilderDelegate messageBuilder)
			: base()
		{
			if (messageBuilder != null)
			{
				msg = messageBuilder(childDataInfo, singularName);
			}
			else
			{
				msg = BuildMessage(childDataInfo, singularName);
			}
		}

		public override string Message
		{
			get
			{
				return msg;
			}
		}

		// TODO: we could provide a hashtable of tables and records; i.e. the "raw materials" for the message
		// TODO: should we allow clients to inject a callback for message-building, or should we extend this class (but where would we put the "fork code" for Patients - BusinessObject should not mention "Patients")

		private string BuildMessage(DataTable dt, string singularName)
		{
			System.Text.StringBuilder b = new System.Text.StringBuilder();

			b.AppendFormat("This {0} cannot be deleted at this time.\n", singularName);
			b.AppendFormat("The following tables contain data associated with this {0}:", singularName);
			b.Append("\n");

			foreach (DataRow r in dt.Rows)
			{
				string t = r["TableName"].ToString();
				int c = (int) r["TableCount"];

				b.AppendFormat("    {0}: {1} Record", t, c);
				if (c > 1)
				{
					b.Append("s");
				}
				b.Append("\n");
			}

			b.AppendFormat("References to this {0} in the records listed above must\n", singularName);
			b.AppendFormat("be removed before this {0} can be deleted from the database.", singularName);

			return b.ToString();
		}
	}
}
