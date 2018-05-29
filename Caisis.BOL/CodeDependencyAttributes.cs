using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text;

namespace Caisis
{
	public class CodeAttribute
	{
		// use reflection to display all the code dependency's from the admin

		/*public DataSet GetCodeDependencyAttributeValues() 
		{ 
			Assembly ass = Assembly.Load();
			Type type = cattDemo.GetType(); 
			Object obj = type.GetCustomAttributes(false)[0]; 
			if(obj is CodeDependencyAttribute) 
			{ 
				// add to DataSet
			} 
			
		}*/
	}

	[AttributeUsage(AttributeTargets.All, Inherited = false, AllowMultiple = true)]
	public class CodeDependencyAttribute : Attribute
	{

		private string _dependentOn;
		private string _description;

		// Constructor 
		public CodeDependencyAttribute(string dependentOn, string description)
		{
			this._dependentOn = dependentOn;
			this._description = description;
		}

		public string DependentOn
		{
			get
			{
				return _dependentOn;
			}
		}

		public string Description
		{
			get
			{
				return _description;
			}
		}
	} 
}
