using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

using Caisis.Extensions;
using Caisis.BOL;

namespace Caisis.UI.Core.Classes.CustomControls
{
	public class BusinessObjectDataSource : DataSourceControl
	{
		// List<IBusinessObject> businessObjects; // needs to be parent.children, if applicable

		// TODO: two closures?
		Action<IBusinessObject> addBusinessObject;
		Func<IEnumerable<IBusinessObject>> datasource;

		XElement metadata;
		XElement blankMetadata;

		int createdRowIndex = -1;

		private readonly string viewName = "DefaultView";

		public BusinessObjectDataSource(XElement metadata, Func<IEnumerable<IBusinessObject>> datasource, Action<IBusinessObject> addBusinessObject)
		{
			// this.businessObjects = new List<IBusinessObject>(businessObjects);
			this.datasource = datasource;
			this.addBusinessObject = addBusinessObject;
			this.metadata = metadata;

			blankMetadata = new XElement(metadata);
			ClearMetadata(blankMetadata);
		}

		public void AddNewRows(int count)
		{
			IBusinessObject reference = null;
			
			if (datasource().Count() > 0)
				reference = datasource().Last();

			for (int i = 0; i < count; i++)
			{
				// TODO: copy last row in bizo instead... (modifying underlying BOs before calling this could FUBAR this approach...)
				//foreach (IBusinessObject b in Caisis.BOL.BusinessObject.Convert(metadata).Cast<IBusinessObject>())
				//    addBusinessObject(b);
				IBusinessObject b = Caisis.BOL.BusinessObject.Convert(blankMetadata).Cast<IBusinessObject>().First();

				// copy values
				//if (reference != null)
				//    Copy(reference, b);

				addBusinessObject(b);
			}
		}

		public void IncrementRowIndex()
		{
			createdRowIndex++;
		}

		public IBusinessObject FetchCurrentBusinessObject()
		{
			return datasource().ElementAt(createdRowIndex);
		}

		protected override DataSourceView GetView(string viewName)
		{
			return new BusinessObjectDataSourceView(this, this.viewName, datasource(), metadata);
		}

		protected override ICollection GetViewNames()
		{
			return new string[] { viewName };
		}

		private void Copy(IBusinessObject source, IBusinessObject target)
		{
			source.FieldNames.ForEach(f => target[f] = source[f]);

			for (int i = 0; i < source.Children.Count(); i++)
			{
				Copy(source.Children.ElementAt(i), target.Children.ElementAt(i));
			}
		}

		private void ClearMetadata(XElement x)
		{
			x.Value = "";

			x.Elements().ForEach(c => ClearMetadata(c));
		}
	}
}
