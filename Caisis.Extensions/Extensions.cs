using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Caisis.Extensions
{
	public static class Extensions
	{
		public static void ForEach<T>(this IEnumerable<T> enumerable, Action<T> action)
		{
			foreach (T obj in enumerable)
				action(obj);
		}

		public static void Adjoin<K, V>(this IDictionary<K, V> map, K key, V value)
		{
			if (!map.ContainsKey(key))
				map[key] = value;
		}

        // credit: samjudson (StackOverflow)
        public static string ToOrdinalString(this int num)
        {
            switch (num % 100)
            {
                case 11:
                case 12:
                case 13:
                    return num.ToString() + "th";
            }

            switch (num % 10)
            {
                case 1:
                    return num.ToString() + "st";
                case 2:
                    return num.ToString() + "nd";
                case 3:
                    return num.ToString() + "rd";
                default:
                    return num.ToString() + "th";
            }
        }
	}
}
