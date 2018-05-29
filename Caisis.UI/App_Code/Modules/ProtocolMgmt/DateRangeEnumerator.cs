using System;
using System.Collections;

namespace Caisis.UI.Modules.ProtocolMgmt
{
	internal delegate object ProcessDate(DateTime date);

	/// <summary>
	/// Useful utilities for date ranges
	/// </summary>
	public class DateRangeEnumerator
	{
		public DateRangeEnumerator()
		{
			//
			// TODO: Add constructor logic here
			//
		}

		/// <summary>
		/// Dates will be "trimmed" of time
		/// </summary>
		/// <param name="startDate"></param>
		/// <param name="endDate"></param>
		/// <returns></returns>
		public static ArrayList EnumerateDates(DateTime startDate, DateTime endDate)
		{
			return DateRangeEnumerator._EnumerateDates(
				DateTime.Parse(startDate.ToShortDateString()), 
				DateTime.Parse(endDate.ToShortDateString()),
				new ProcessDate(DateRangeEnumerator._passDate));
		}

		public static ArrayList EnumerateDates(string startDate, string endDate)
		{
			return DateRangeEnumerator.EnumerateDates(DateTime.Parse(startDate), DateTime.Parse(endDate));
		}

		/// <summary>
		/// Returns the range in the following format: "_date_[month]_[day]"
		/// </summary>
		/// <param name="startDate"></param>
		/// <param name="endDate"></param>
		/// <returns></returns>
		public static ArrayList EnumerateVisits(DateTime startDate, DateTime endDate)
		{
			return DateRangeEnumerator._EnumerateDates(
				DateTime.Parse(startDate.ToShortDateString()), 
				DateTime.Parse(endDate.ToShortDateString()),
				new ProcessDate(DateRangeEnumerator._parseVisit));
		}

		public static ArrayList EnumerateVisits(string startDate, string endDate)
		{
			return DateRangeEnumerator.EnumerateVisits(DateTime.Parse(startDate), DateTime.Parse(endDate));
		}

		private static ArrayList _EnumerateDates(DateTime startDate, DateTime endDate, ProcessDate _p)
		{
			ArrayList list = new ArrayList();
			list.Add(_p(startDate));

			// we've already trimmed the dates
			if (startDate != endDate)
			{
				for (DateTime date = startDate.AddDays(1); date <= endDate; date = date.AddDays(1))
				{
					list.Add(_p(date));
				}
			}

			return list;
		}

		private static object _parseVisit(DateTime date)
		{
			return "_day_" + date.Month + "_" + date.Day;
		}

		private static object _passDate(DateTime date)
		{
			return date;
		}
	}
}
