using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Web;

namespace Caisis.BOL
{
	public class BusinessObjectFactory
	{
		private static Dictionary<string, ConstructorInfo> defaultConstructorMap = new Dictionary<string, ConstructorInfo>();
		private static Dictionary<string, ConstructorInfo> childConstructorMap = new Dictionary<string, ConstructorInfo>();

		static BusinessObjectFactory()
		{
			Init();
		}

		private static void Init()
		{
			var q =
				from type in Assembly.GetExecutingAssembly().GetTypes()
				where type.IsSubclassOf(typeof(BusinessObject))
				select new { Type = type, Tablename = (type.GetCustomAttributes(typeof(TablenameAttribute), true)[0] as TablenameAttribute).Tablename };

			foreach (var v in q)
			{
				defaultConstructorMap[v.Tablename] =
					v.Type.GetConstructor(BindingFlags.Instance | BindingFlags.Public, null, new Type[0], null);

				childConstructorMap[v.Tablename] =
					v.Type.GetConstructor(BindingFlags.Instance | BindingFlags.Public, null, new Type[] { typeof(BusinessObject[]) }, null);
			}
		}
		
		// TODO: IBusinessObject wrappers for external use

		public static bool CanBuildBusinessObject(string tablename)
		{
			return defaultConstructorMap.ContainsKey(tablename);
		}

		public static BusinessObject BuildBusinessObject(string tablename)
		{
			if (!defaultConstructorMap.ContainsKey(tablename))
			{
				string err = string.Format("The assembly does not contain a business object associated with the tablename: {0}.", tablename);
				throw new ArgumentException(err, "tablename");
			}

			return defaultConstructorMap[tablename].Invoke(new object[0]) as BusinessObject;
		}
	}
}
