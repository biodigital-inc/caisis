using System;
using System.Data;
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel;
using System.Configuration;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

using Caisis.BOL;
using Caisis.Extensions;

namespace Caisis.UI.Core.Classes
{

	/// <summary>
	/// Summary description for CustomObjectDataSource2
	/// </summary>
	[DefaultProperty("Text"), ToolboxData("<{0}:CustomObjectDataSource2 runat=server></{0}:CustomObjectDataSource2>")]
	public class CustomObjectDataSource : ObjectDataSource
	{
		private Type businessObjectType;
		private IEnumerable<IBusinessObject> businessObjects = null;
		private Action<int> _addNewRows = null;
		private Func<int?> _getSavedPrimaryKey = null;

		private object oAdapterArgsInstance = null;
		
		//public string BusinessObjectType
		//{
		//    get { return businessObjectType; }
		//    set { businessObjectType = value; }
		//}

		public IEnumerable<IBusinessObject> BusinessObjects
		{
			get { return businessObjects.Cast<IBusinessObject>(); }
		}

		public CustomObjectDataSource(IEnumerable<IBusinessObject> businessObjects)
			: base()
		{
			this.businessObjects = businessObjects;

			IBusinessObject b = businessObjects.First();
			businessObjectType = b.GetType();

			TypeName = "Caisis.BOL.ObjectDataSourceAdapter`1[[" + businessObjectType.FullName + ",Caisis.BOL]],Caisis.BOL";

			ObjectCreating += new ObjectDataSourceObjectEventHandler(CustomObjectDataSource_ObjectCreating);

			Inserting += new ObjectDataSourceMethodEventHandler(CustomObjectDataSource_Inserting);
			Updating += new ObjectDataSourceMethodEventHandler(CustomObjectDataSource_Updating);
			Updated += new ObjectDataSourceStatusEventHandler(CustomObjectDataSource_Updated);
			Deleting += new ObjectDataSourceMethodEventHandler(CustomObjectDataSource_Deleting);
		}

		public void AddNewRow()
		{
			AddNewRows(1);
		}

		public void AddNewRows(int numRows)
		{
			if (_addNewRows != null)
				_addNewRows(numRows);
		}

		#region lifecycle event handlers

		void CustomObjectDataSource_ObjectCreating(object sender, ObjectDataSourceEventArgs e)
		{
			// we need to use TypeName to load the generic type via reflection and construct w/ businessObject...
			// API note: if e.ObjectInstance is not null after this method completes, we have what we want...

			#region tangent - ObjectDataSourceView.InvokeMethod(...) contains the following...
			/***
             *   ObjectDataSourceEventArgs e = new ObjectDataSourceEventArgs(null);
             *   this.OnObjectCreating(e); // <- THIS IS OUR HOOK
             *   if (e.ObjectInstance == null)
             *   {
             *       e.ObjectInstance = Activator.CreateInstance(method.Type);
             *       this.OnObjectCreated(e);
             *   }
             *
             *   instance = e.ObjectInstance;
             ***/
			#endregion

			// businessObjects cannot be null, otherwise the constructor would have thrown an exception
			if (businessObjects != null) // if null, we will let the API instantiate via reflection
			{
				// we need an instance of ObjectDataSourceAdapter<$bo_type> to set e.ObjectInstance
				string adapterArgsTypeName = "Caisis.BOL.ObjectDataSourceAdapterArgs`1[[" + businessObjectType.FullName + ",Caisis.BOL]],Caisis.BOL";
				
				Type adapterArgsType = Type.GetType(adapterArgsTypeName, true);
				Type adapterType = Type.GetType(TypeName, true);
				
				ConstructorInfo adapter_cstor = adapterType.GetConstructor(new Type[] { adapterArgsType }); // TODO: adapter cstor now accepts ObjectDataSourceAdapterArgs!

				if (oAdapterArgsInstance == null)
				{
					// cast business Objects to businessObjectType via reflection (call Cast<> method via reflection)
					//MethodInfo castMethod = typeof(Enumerable).GetMethod("Cast").MakeGenericMethod(businessObjectType);
					//object oIEnumerableBO = castMethod.Invoke(null, new object[] { businessObjects });
					
					string listBOTypName = "System.Collections.Generic.List`1[[" + businessObjectType.FullName + ",Caisis.BOL]]";
					Type listBOType = Type.GetType(listBOTypName, true);

					ConstructorInfo listBO_cstor = listBOType.GetConstructor(Type.EmptyTypes);
					MethodInfo listBO_Add = listBOType.GetMethod("Add");

					object oIListBO = listBO_cstor.Invoke(null);

					// add each business object to the lst
					businessObjects.ForEach(b => listBO_Add.Invoke(oIListBO, new object[] { b }));

					string collectionTypeName = "System.Collections.Generic.IList`1[[" + businessObjectType.FullName + ",Caisis.BOL]]";
					Type collectionType = Type.GetType(collectionTypeName, true);

					ConstructorInfo adapterArgs_cstor = adapterArgsType.GetConstructor(new Type[] { collectionType });
					oAdapterArgsInstance = adapterArgs_cstor.Invoke(new object[] { oIListBO });
				}

				object[] cstor_args = { oAdapterArgsInstance };

				IObjectDataSourceAdapter odsAdapter = adapter_cstor.Invoke(cstor_args) as IObjectDataSourceAdapter;
				_addNewRows = odsAdapter.AddNewRows;
				_getSavedPrimaryKey = () => odsAdapter.SavedPrimaryKey;

				e.ObjectInstance = odsAdapter;
			}
		}

		// TODO: need a dynamic cast method

		void CustomObjectDataSource_Inserting(object sender, ObjectDataSourceMethodEventArgs e)
		{
			PackParams(e);
		}

		void CustomObjectDataSource_Updating(object sender, ObjectDataSourceMethodEventArgs e)
		{
			PackParams(e);
		}

		void CustomObjectDataSource_Updated(object sender, ObjectDataSourceStatusEventArgs e)
		{
			if (_getSavedPrimaryKey == null)
				return;

			var bo = businessObjects.First();
			int? pk = _getSavedPrimaryKey();

			if (!pk.HasValue)
				throw new ArgumentException("Updated primary key was null.");

			e.OutputParameters[bo.PrimaryKeyName] = pk.Value;
		}

		void CustomObjectDataSource_Deleting(object sender, ObjectDataSourceMethodEventArgs e)
		{
			if (e.InputParameters.Count == 0)
				e.Cancel = true;
			else if (!(e.InputParameters.Count == 1 && e.InputParameters.Contains("primaryKey")))
				PackParams(e);
		}

		#endregion

		void PackParams(ObjectDataSourceMethodEventArgs e)
		{
			IDictionary pageParams = e.InputParameters;
			Dictionary<string, string> packedParams = new Dictionary<string, string>();

			foreach (DictionaryEntry entry in pageParams)
			{
				if (entry.Value != null)
					packedParams[entry.Key.ToString()] = entry.Value.ToString();
			}

			var bo = businessObjects.First();

			if (BOL.BusinessObject.HasParentTable(bo.TableName) && !bo.IsNull(bo.ParentKeyName))
				packedParams[bo.ParentKeyName] = bo[bo.ParentKeyName].ToString();

			packedParams["_session_validation_patientid"] = new SessionHandler(Page).GetPatientId().ToString();

			pageParams.Clear();
			pageParams["parameters"] = packedParams;
		}
	}
}
