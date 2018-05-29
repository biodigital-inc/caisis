using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

using Caisis.UI.Core.Classes;
using Caisis.UI.Core.Classes.CustomControls;
using Caisis.Extensions;
using Caisis.BOL;

namespace Caisis.Controller
{
	public class DataEntryController
	{
		class CaisisControlEventArgs : EventArgs
		{
			public ICaisisInputControl control;

			public CaisisControlEventArgs(ICaisisInputControl control)
			{
				this.control = control;
			}
		}

		class CustomCaisisDataBoundField : CaisisDataBoundField
		{
			public CustomCaisisDataBoundField()
				: base()
			{

			}

			public CustomCaisisDataBoundField(ICaisisInputControl caisisControlBase)
				: base(caisisControlBase)
			{

			}

			public event EventHandler<CaisisControlEventArgs> BindControl;

			/// <summary>
			/// Adds a new instance of controlBase (a CaisisInputControl) to the row's cell
			/// </summary>
			/// <param name="cell"></param>
			/// <param name="rowState"></param>
			protected override void InitializeDataCell(DataControlFieldCell cell, DataControlRowState rowState)
			{
				ICaisisInputControl iCIC = new CaisisTextBox();
				if (BaseCaisisInputControl == null)
				{
					if (!string.IsNullOrEmpty(CaisisControlTypeName))
					{
						//// Create Control, set Field, then set MetaData values
						//iCIC = CICHelper.InvokeInputControl(CaisisControlTypeName);
						//iCIC.Field = cicFieldName;
						//CICHelper.SetCICAttributes(iCIC, CaisisControlMetaTable);
					}
				}
				else
				{
					iCIC = CICHelper.CloneCIC(controlBase);
				}
				// Supress FieldLabel
				iCIC.ShowLabel = false;

				// handle binding
				BindControl(this, new CaisisControlEventArgs(iCIC));

				// Add control to cell
				cell.Controls.Add(iCIC as Control);
			}
		}

		private Func<string, ICaisisInputControl> generator;

		public DataEntryController(Func<string, ICaisisInputControl> controlGenerator)
		{
			generator = controlGenerator;
		}

		// we could also do this on init
		public IEnumerable<Caisis.BOL.IBusinessObject> Build(
			IEnumerable<KeyValuePair<string, bool>> tableSequence, 
			string keyName,
			int? keyValue,
			Action<ICaisisInputControl> append,
			Action<string> separator,
			Action<GridView, ImageButton, string> appendGrid)
		{
			// turn table sequence into metadata based on (among other things) grid settings
			XElement metadata = GetMetadata(tableSequence);

			return Build(metadata, keyName, keyValue, append, separator, appendGrid);
		}

		// TODO: remove redundancy
		public IEnumerable<Caisis.BOL.IBusinessObject> Build(
			IEnumerable<XElement> metadataList,
			string keyName,
			int? keyValue,
			Action<ICaisisInputControl> append,
			Action<string> separator,
			Action<GridView, ImageButton, string> appendGrid)
		{
            string tableName = metadataList.First().Name.LocalName;
            string name = Caisis.BOL.BusinessObject.GetTableLabel(tableName);

			Action<Caisis.BOL.BusinessObject, string, IDictionary<string, string>> fieldNotifier = (b, f, m) => append(BuildControl(b, f));
			// TODO: BuildGrid needs correct subset of metadata
			// Action<IEnumerable<Caisis.BOL.BusinessObject>, IEnumerable<string>, XElement, string> gridNotifier = (b, c, x, n) => appendGrid(BuildGrid(b, x, n));

			Action<Func<IEnumerable<Caisis.BOL.IBusinessObject>>,
				   Action<Caisis.BOL.IBusinessObject>,
				   IEnumerable<string>,
				   XElement>
				gridNotifier =
					(f, a, c, x) =>
					{
						var kvp = BuildGrid(f, a, x, name);
						appendGrid(kvp.Key, kvp.Value, tableName);
					};

			// call BO.Convert(), passing [(b, f) => append(BuildAndBindControl(b.GetControlType(f)))] as field consumer
			// IEnumerable<Caisis.BOL.BusinessObject> bizos = Caisis.BOL.BusinessObject.Convert(metadata, fieldNotifier, gridNotifier, separator, rootKey);
			IEnumerable<Caisis.BOL.IBusinessObject> bizos = Caisis.BOL.BusinessObject.Convert(metadataList, fieldNotifier, gridNotifier, separator, keyName, keyValue);

			// return BO;
			return bizos;
        }

        #region TESTING (load grid by pri key)
        public IEnumerable<Caisis.BOL.IBusinessObject> Build(
            IEnumerable<XElement> metadataList,
            IDictionary<XElement, int?> identifierNameToValue,
            Action<ICaisisInputControl> append,
            Action<string> separator,
            Action<GridView, ImageButton, string> appendGrid)
        {
            string tableName = metadataList.First().Name.LocalName;
            string name = Caisis.BOL.BusinessObject.GetTableLabel(tableName);

            Action<Caisis.BOL.BusinessObject, string, IDictionary<string, string>> fieldNotifier = (b, f, m) => append(BuildControl(b, f));
            // TODO: BuildGrid needs correct subset of metadata
            // Action<IEnumerable<Caisis.BOL.BusinessObject>, IEnumerable<string>, XElement, string> gridNotifier = (b, c, x, n) => appendGrid(BuildGrid(b, x, n));

            Action<Func<IEnumerable<Caisis.BOL.IBusinessObject>>,
                   Action<Caisis.BOL.IBusinessObject>,
                   IEnumerable<string>,
                   XElement>
                gridNotifier =
                    (f, a, c, x) =>
                    {
                        var kvp = BuildGrid(f, a, x, name);
                        appendGrid(kvp.Key, kvp.Value, tableName);
                    };

            // call BO.Convert(), passing [(b, f) => append(BuildAndBindControl(b.GetControlType(f)))] as field consumer
            IEnumerable<Caisis.BOL.IBusinessObject> bizos = Caisis.BOL.BusinessObject.Convert(metadataList, fieldNotifier, gridNotifier, separator, identifierNameToValue);

            // return BO;
            return bizos;
        }
        #endregion

        public IEnumerable<Caisis.BOL.IBusinessObject> Build(
			XElement metadata,
			string keyName,
			int? keyValue,
			Action<ICaisisInputControl> append,
			Action<string> separator,
            Action<GridView, ImageButton, string> appendGrid)
		{
            string tableName = metadata.Name.LocalName;
            string name = Caisis.BOL.BusinessObject.GetTableLabel(tableName);

			Action<Caisis.BOL.BusinessObject, string, IDictionary<string, string>> fieldNotifier = (b, f, m) => append(BuildControl(b, f));
			// TODO: BuildGrid needs correct subset of metadata
			// Action<IEnumerable<Caisis.BOL.BusinessObject>, IEnumerable<string>, XElement, string> gridNotifier = (b, c, x, n) => appendGrid(BuildGrid(b, x, n));

			Action<Func<IEnumerable<Caisis.BOL.IBusinessObject>>,
				   Action<Caisis.BOL.IBusinessObject>,
				   IEnumerable<string>,
				   XElement>
				gridNotifier =
					(f, a, c, x) =>
					{
						var kvp = BuildGrid(f, a, x, name);
						appendGrid(kvp.Key, kvp.Value, tableName);
					};

			// call BO.Convert(), passing [(b, f) => append(BuildAndBindControl(b.GetControlType(f)))] as field consumer
			// IEnumerable<Caisis.BOL.BusinessObject> bizos = Caisis.BOL.BusinessObject.Convert(metadata, fieldNotifier, gridNotifier, separator, rootKey);
			IEnumerable<Caisis.BOL.IBusinessObject> bizos = Caisis.BOL.BusinessObject.Convert(metadata, fieldNotifier, gridNotifier, separator, keyName, keyValue);

			// return BO;
			return bizos;
		}

		private XElement GetMetadata(IEnumerable<KeyValuePair<string, bool>> sequence)
		{
			// sort sequence
			List<KeyValuePair<string, bool>> sortedSequence = Caisis.BOL.BusinessObject.SortTablenamesByParent(sequence, kvp => kvp.Key);

			XElement el = null;
			Dictionary<string, XElement> map = new Dictionary<string, XElement>();

			foreach (KeyValuePair<string, bool> kvp in sortedSequence)
			{
				string tablename = kvp.Key;
				bool grid = kvp.Value;
				string parent = Caisis.BOL.BusinessObject.GetParentTablename(tablename);

				XElement xe =
					new XElement(tablename,
						new XAttribute("GridView", grid ? "True" : "False"),
						from f in Caisis.BOL.BusinessObject.GetFieldNames(tablename)
						where !Caisis.BOL.BusinessObject.IsSuppressed(tablename, f)
						orderby Caisis.BOL.BusinessObject.HasFieldOrder(tablename, f) ? Caisis.BOL.BusinessObject.GetFieldOrder(tablename, f) : null ascending
						select new XElement(f));

				map[tablename] = xe;

				if (map.ContainsKey(parent))
				{
					map[parent].Add(xe);
				}
				else if (el == null)
				{
					el = xe;
				}
			}

			return el;
		}

		public void CustomizeControl(ICaisisInputControl control, string tablename, string fieldname)
		{
			if (Caisis.BOL.BusinessObject.HasLabel(tablename, fieldname))
			{
				string label = Caisis.BOL.BusinessObject.GetLabel(tablename, fieldname);

				if (string.IsNullOrEmpty(label) && !fieldname.Contains("Date"))
					control.FieldLabel = fieldname;
				else
					control.FieldLabel = Caisis.BOL.BusinessObject.GetLabel(tablename, fieldname);
			}

			// description
			if (Caisis.BOL.BusinessObject.HasDescription(tablename, fieldname))
				control.HelpDescription = Caisis.BOL.BusinessObject.GetDescription(tablename, fieldname);

			// required
			control.Required = Caisis.BOL.BusinessObject.IsRequired(tablename, fieldname);

			Action<string, Action<string>> setProp =
				(att, setter) =>
				{
					if (Caisis.BOL.BusinessObject.HasMetadataFieldAttribute(tablename, fieldname, att))
						setter(Caisis.BOL.BusinessObject.GetMetadataFieldAttribute(tablename, fieldname, att));
				};

			// javascript
			Action<string, string> handleJs =
				(att, eventName) =>
				{
					setProp(att, s => CICHelper.HandleJsEventAttribute(control as WebControl, eventName, s));
				};

			if (control is WebControl)
			{
				handleJs("jsOnBlur", "onblur");
				handleJs("jsOnClick", "onclick");
				handleJs("jsOnSelectedIndexChanged", "onselectedindexchanged");
				setProp("FieldWidth", s => (control as WebControl).Style.Add("width", s + "px"));
			}

			// lookup controls
			if (control is ICaisisLookupControl)
			{
				ICaisisLookupControl c = control as ICaisisLookupControl;

				setProp("LookupDistinct", s => c.LookupDistinct = s);
				setProp("LookupCode", s => c.LookupCode = s);
				setProp("CascadeValuesBasedOn", s => c.CascadeValuesBasedOn = s);
				setProp("CascadeFormatString", s => c.CascadeFormatString = s);
			}

			// text box MaxLength
			if (control is TextBox)
			{
				setProp("MaxLength",
					s =>
					{
						int maxLength = 0;
						if (int.TryParse(s, out maxLength))
							(control as TextBox).MaxLength = maxLength;
					});
			}

			Func<string, bool> isSet =
				s =>
				{
					string val = "";
					bool parsed;
					setProp(s, x => val = x);
					return bool.TryParse(val, out parsed) && parsed;
				};

			// CaisisTextBox
			if (control is CaisisTextBox)
			{
				CaisisTextBox tb = control as CaisisTextBox;

				tb.ShowCalendar = isSet("ShowCalendar");
				tb.CalcDate = isSet("CalcDate");
				tb.ShowNumberPad = isSet("ShowNumberPad");
				tb.ReadOnly = isSet("ReadOnly");
				tb.ShowTextEditor = isSet("ShowTextEditor");
				tb.ShowICDWizard = isSet("ShowICDWizard");
			}

			// CaisisTextArea
			if (control is CaisisTextArea)
				(control as CaisisTextArea).ShowTextEditor = isSet("ShowTextEditor");

			// CaisisHidden
			if (control is CaisisHidden)
			{
				CaisisHidden h = control as CaisisHidden;

				h.DisplayCalculatedDate = isSet("DisplayCalculatedDate");
				h.DisplayHiddenValue = isSet("DisplayHiddenValue");
				h.ShowICDWizard = isSet("ShowICDWizard");
			}
		}

		// TODO: use BO's static methods
		public ICaisisInputControl BuildControl(Caisis.BOL.BusinessObject b, string fieldname)
		{
			ICaisisInputControl control = CaisisInputControlFactory.BuildControl(GetControlInstance, b, fieldname);

			CustomizeControl(control, b.TableName, fieldname);
			
			return control;
		}

		public KeyValuePair<GridView,ImageButton> BuildGrid(Func<IEnumerable<Caisis.BOL.IBusinessObject>> datasource, Action<Caisis.BOL.IBusinessObject> adder, XElement metadata, string name)
		{
			string tablename = metadata.Name.LocalName;

			BusinessObjectDataSource ods = new BusinessObjectDataSource(metadata, datasource, adder);
			ods.ID = tablename + "_ODS";
			
			// init CaisisGridView
			CaisisSimpleGridView grid = new CaisisSimpleGridView();

			grid.ShowDeleteButton = false;

			grid.EnableViewState = true;
			grid.RowCreated += new GridViewRowEventHandler((o, e) => ods.IncrementRowIndex());
			// grid.DataSourceID = ods.ID;
			grid.DataSource = ods;
			grid.ID = tablename + "_CGV";
			grid.AutoGenerateColumns = false;
			grid.Visible = true;
			grid.AllowSorting = false;
			grid.AllowPaging = false;
			//grid.HorizontalAlign = HorizontalAlign.Center;
			//grid.EditButtonID = "EditBtn";
			grid.TotalBlankRows = 20; // TODO: metadata support
			grid.VisibleBlankRows = 3; // TODO: metadata support

			// add columns
			// grid.DataKeyNames = new string[] { primaryKeyName, foreignKeyNames, ... };
			

			List<string> dataKeys = new List<string> { Caisis.BOL.BusinessObject.GetPrimaryKeyName(tablename) };
			dataKeys.AddRange(Caisis.BOL.BusinessObject.GetForeignKeyNames(tablename));

			grid.DataKeyNames = dataKeys.ToArray();

			// foreach visible field, add CaisisDataBoundField(ICaisisInputControl) to grid.Columns
			GetColumns(metadata, tablename, dataKeys, ods.FetchCurrentBusinessObject).ForEach(f => grid.Columns.Add(f));
			
			// TODO: we need access to the grid container
			// add image button 
			ImageButton addNewRowBtn = new ImageButton();
			addNewRowBtn.ImageUrl = "../../Images/DataGridAddNewRow.gif";
			addNewRowBtn.ID = grid.ID + "_NewRow";
			addNewRowBtn.CssClass = "dataGridImageButton";
			grid.AddButtonId = addNewRowBtn.ID;

			// attach addBtn modifier to appropriate grid event (OnLoad?)
			grid.Load += new EventHandler((o, e) => { addNewRowBtn.OnClientClick = "var grid = document.getElementById('" + grid.ID + "'); if(grid.showNextRow) {return grid.showNextRow(); } else { return true; }"; });

			return new KeyValuePair<GridView, ImageButton>(grid, addNewRowBtn);
		}

		// TODO: what about grids for more complex (i.e. multitable) paths?

		private IEnumerable<CaisisDataBoundField> GetColumns(XElement metadata, string tablename, IEnumerable<string> keyNames, Func<IBusinessObject> fetch)
		{
			// var u = keyNames.Select(k => new KeyValuePair<string, string>(tablename, k)).Union(GetColumnPath(metadata));
			var u = GetColumnPath(metadata);

			foreach (KeyValuePair<string, string> kvp in u)
				yield return GetColumnControlBase(kvp.Key, kvp.Value, fetch);
		}

		private IEnumerable<KeyValuePair<string, string>> GetColumnPath(XElement metadata)
		{
			string tablename = metadata.Name.LocalName;

			foreach (XElement child in metadata.Elements())
			{
				string fieldname = child.Name.LocalName;

				if (Caisis.BOL.BusinessObject.HasField(tablename, fieldname))
					yield return new KeyValuePair<string, string>(tablename, fieldname);
				else
					foreach (KeyValuePair<string, string> kvp in GetColumnPath(child))
						yield return kvp;
			}
		}

		private CaisisDataBoundField GetColumnControlBase(string tablename, string fieldname, Func<IBusinessObject> fetch)
		{
			ICaisisInputControl control = CaisisInputControlFactory.BuildUnboundControl(GetControlInstance, tablename, fieldname);
			CustomizeControl(control, tablename, fieldname);

			// control.Init += new EventHandler((o, e) => DebugHook(control, fetch, fieldname));

			CustomCaisisDataBoundField dbf = new CustomCaisisDataBoundField(control);
			// dbf.BindControl += new EventHandler<CaisisControlEventArgs>((o, c) => DebugHook(c.control, fetch, fieldname));
			dbf.BindControl += new EventHandler<CaisisControlEventArgs>((o, c) => CaisisInputControlFactory.BindControl(c.control, fetch(), fieldname));
			
			return dbf;
		}

		//private void DebugHook(ICaisisInputControl control, Func<IBusinessObject> fetch, string fieldname)
		//{
		//    CaisisInputControlFactory.BindControl(control, fetch(), fieldname);
		//}

		private ICaisisInputControl GetControlInstance(string controlType)
		{
			return generator(controlType);
		}
	}
}
