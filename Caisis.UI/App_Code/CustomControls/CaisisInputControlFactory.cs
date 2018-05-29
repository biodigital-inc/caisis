using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Xml.Linq;

using Caisis.BOL;

/// <summary>
/// Summary description for CaisisInputControlFactory
/// </summary>
namespace Caisis.UI.Core.Classes.CustomControls
{
	public static class CaisisInputControlFactory
	{
        /// <summary>
        /// The default input control type
        /// </summary>
        private static readonly string DEFAULT_CONTROL_TYPE = typeof(CaisisTextBox).Name;

		// TODO: have the generator generate text boxes for now (i.e. build everything else)

		// TODO: document me
		public static ICaisisInputControl BuildUnboundControl(Func<string, ICaisisInputControl> generator, string tablename, string fieldname)
		{
            string controlType = DEFAULT_CONTROL_TYPE;

			if (Caisis.BOL.BusinessObject.HasControlType(tablename, fieldname))
				controlType = Caisis.BOL.BusinessObject.GetControlType(tablename, fieldname);

			ICaisisInputControl control = generator(controlType);

			control.Field = fieldname;
			control.Table = tablename;

			return control;
		}

		// TODO: document me
		public static ICaisisInputControl BuildControl(Func<string, ICaisisInputControl> generator, IBusinessObject b, string fieldname)
		{
            string controlType = DEFAULT_CONTROL_TYPE;

			if (b.HasControlType(fieldname))
				controlType = b.GetControlType(fieldname);

			return _BuildControl(controlType, generator, b, fieldname);
		}

		// extend control support for eforms, protocols (e.g. Protocol_ControlType) with fallback to default control type if necessary
		// TODO: document me
		public static ICaisisInputControl BuildExtendedControl(Func<string, ICaisisInputControl> generator, string extensionName, IBusinessObject b, string fieldname)
		{
            string extendedControlType = DEFAULT_CONTROL_TYPE;

			if (b.HasMetadataFieldAttribute(fieldname, extensionName))
				extendedControlType = b.GetMetadataFieldAttribute(fieldname, extensionName);

			return _BuildControl(extendedControlType, generator, b, fieldname);
		}

		static ICaisisInputControl _BuildControl(string controlType, Func<string, ICaisisInputControl> generator, IBusinessObject b, string fieldname)
		{
			ICaisisInputControl control = generator(controlType);

			control.Field = fieldname;
			control.Table = b.TableName;

			if (control == null)
				throw new ArgumentException(string.Format("Generator delegate failed to generate an input control for type: {0}.", controlType));

			if (b != null)
				BindControl(control, b, fieldname);

			return control;
		}

		public static void BindControl(ICaisisInputControl control, IBusinessObject b, string fieldname)
		{
            // special case: data bound controls (select, radio list, check box list, etc... get values set late bound
            if (control is System.Web.UI.WebControls.ListControl)
            {
                var setter = new EventHandler((o, e) =>
                {
                    control.Value = b[fieldname].ToString();
                    if (b.IsLocked)
                        control.Enabled = false;
                });
                var iListControl = control as System.Web.UI.WebControls.ListControl;
                iListControl.DataBound += setter;
            }
            else
            {
                var setter = new CaisisEventHandler((o, e) =>
                {
                    control.Value = b[fieldname].ToString();
                    if (b.IsLocked)
                        control.Enabled = false;
                });
                control.PreRender += setter;
            }
            // track control change during POSTs
            control.ValueChanged += new CaisisEventHandler((o, e) => b[fieldname] = control.Value);
            // control.ValueChanged += new CaisisEventHandler((o, e) => DebugHack(o, o.Value));
		}

		public static IEnumerable<ICaisisInputControl> BuildControls(XElement xml)
		{
			throw new NotImplementedException();
		}

		public static void DebugHack(ICaisisInputControl c, string newValue)
		{
			Console.Out.WriteLine("new value: {0}", newValue);
		}
	}
}
