using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Linq;

using Caisis.BOL;
using Caisis.UI.Core.Classes.CustomControls;

namespace Caisis.UI.Core.Classes
{

	/// <summary>
	///		This class contains functionality common to all user controls in the application.
	///		Functionality includes defining PageLoad and PageUnload methods.
	/// </summary>
	public class BaseControl : System.Web.UI.UserControl
	{

		/// <summary>
		/// Function is called when page initializes, can be overriden in child classes to 
		/// provide specific functionality.
		/// </summary>
		/// <param name="sender"></param>
		/// <param name="e"></param>
		protected virtual void Page_Load(object sender, System.EventArgs e)
		{
		}

		#region Web Form Designer generated code
		/// <summary>
		/// Overrides base method to add linking of PageLoad method.  By default, ViewState is turned off
		/// to minimize page overhead and page loading times, method may be overridden if individual controls
		/// require viewstate.
		/// </summary>
		/// <param name="e"></param>
		override protected void OnInit(EventArgs e)
		{	
//			InitializeComponent();
			base.OnInit(e);
			this.EnableViewState = true;
		}
		
		/// <summary>
		/// Required method for Designer support - do not modify
		///		the contents of this method with the code editor.
		/// </summary>
		private void InitializeComponent()
		{
			this.Load += new System.EventHandler(this.Page_Load);
		}
		#endregion
	}

    /// <summary>
    /// Defines a data entry component capable of populating and saving records
    /// </summary>
    public abstract class BaseDataEntryControl : BaseControl
    {
        protected int patientId;
        protected Label controlTitle;
        protected bool isFormDirty = false;
        protected DateTime? fromDate;
        protected DateTime? toDate;

        /// <summary>
        /// Represents various shared state info to be used by component (i.e., "PtAge", "PtDiagnosticBiospy", etc...)
        /// </summary>
        protected Dictionary<string, object> StateVariables = new Dictionary<string,object>();

        protected string appendToUserName;

        /// <summary>
        /// controls if dirty input fields are tracked in data bound componenets (Rptr,GridView)
        /// </summary>
        protected bool trackDirtyFields = true;

        protected List<Control> dirtyControls = new List<Control>();

        /// <summary>
        /// Gets or sets the baseline from date filter
        /// </summary>
        public DateTime? BaselineFromDate
        {
            get
            {
                return fromDate;
            }
            set
            {
                fromDate = value;
            }
        }

        /// <summary>
        /// Gets or sets the baseline to date filter
        /// </summary>
        public DateTime? BaselineToDate
        {
            get
            {
                return toDate;
            }
            set
            {
                toDate = value;
            }
        }

        /// <summary>
        /// Gets or sets the suffix for records saved in this data entry component
        /// </summary>
        public virtual string AppendToUserName
        {
            get
            {
                return appendToUserName;
            }
            set
            {
                appendToUserName = value;
            }
        }

        public BaseDataEntryControl()
            : base()
        {
            this.Init += (o, e) => InitControl();
        }

       /// <summary>
        /// Defines a method for populating the current component
        /// </summary>
        public abstract void Populate();

        /// <summary>
        /// Defines a method for saving the current component
        /// </summary>
        /// <returns>A list of saved/updated BusinessObjects</returns>
        public abstract IEnumerable<BusinessObject> Save();

        /// <summary>
        /// Initialize required variables, i.e., patientId and events
        /// </summary>
        protected void InitControl()
        {
            patientId = int.Parse(Session[SessionKey.PatientId].ToString());
            isFormDirty = false;
            // track field changes on load
            this.Load += (o, e) =>
                {
                    var inputs = PageUtil.GetCaisisInputControlsInContainer(this);
                    foreach (var input in inputs)
                    {
                        input.ValueChanged += MarkFormDirty;
                    }
                    var grid = PageUtil.GetControls<GridView>(this).Cast<Control>();
                    var rptr = PageUtil.GetControls<Repeater>(this).Cast<Control>(); ;
                    var dataBoundComponenets = grid.Concat(rptr);
                    foreach (var componenet in dataBoundComponenets)
                    {
                        InitDirtyControlTracking(componenet);
                    }
                };
        }

        /// <summary>
        /// Adds the list of controls from the "dirty" control list.
        /// </summary>
        /// <param name="controls"></param>
        protected void AddDirtyInputControls(params Control[] controls)
        {
            foreach (Control control in controls)
            {
                if (!dirtyControls.Contains(control))
                    dirtyControls.Add(control);
            }
        }

        /// <summary>
        /// Removes the list of controls from the "dirty" control list.
        /// </summary>
        /// <param name="controls"></param>
        protected void RemoveDirtyInputControls(params Control[] controls)
        {
            foreach (Control control in controls)
            {
                if (dirtyControls.Contains(control))
                    dirtyControls.Remove(control);
            }
        }

        /// <summary>
        /// Returns a list of "dirty" controls. i.e., GridViewRow, RepeaterItem, Control
        /// </summary>
        /// <param name="control"></param>
        /// <returns></returns>
        protected IEnumerable<Control> GetDirtyInputControls(Control control)
        {
            List<Control> _dirty = new List<Control>();
            if (control is Repeater)
            {
                _dirty.AddRange((control as Repeater).Items.Cast<Control>());
            }
            else if (control is GridView)
            {
                _dirty.AddRange((control as GridView).Rows.Cast<Control>());
            }
            else
            {
                _dirty.Add(control);
            }
            return dirtyControls.Intersect(_dirty);
        }

        /// <summary>
        /// Add dirty input controls tracking
        /// </summary>
        /// <param name="control"></param>
        protected void InitDirtyControlTracking(Control control)
        {
            if (control is Repeater)
            {
                Repeater rptr = control as Repeater;
                // reset dirty values
                rptr.DataBinding += (o, e) =>
                {
                    ClearDirtyInputControls(rptr.Items.Cast<Control>().ToArray());
                };
                // track dirty values
                rptr.ItemCreated += (o, e) => TrackDirtyInputControl(e.Item);
            }
            else if (control is GridView)
            {
                GridView grid = control as GridView;
                // reset dirty values
                grid.DataBinding += (o, e) =>
                {
                    ClearDirtyInputControls(grid.Rows.Cast<Control>().ToArray());
                };
                // track dirty values
                grid.RowCreated += (o, e) => TrackDirtyInputControl(e.Row);
                // special AppendTo logic
                if (grid is ExtendedGridView)
                {
                    ExtendedGridView extendedGridView = grid as ExtendedGridView;
                    extendedGridView.AppendToUserName = AppendToUserName;
                }
            }
            // TODO: better handling
            else
            {
                // reset dirty values
               control.Load += (o, e) => ClearDirtyInputControls(control);
                //var inputs = CICHelper.GetCaisisInputControls(control).Cast<Control>().ToArray();
                TrackDirtyInputControl(control);
            }
        }

        protected void ClearDirtyInputControls(params Control[] controls)
        {
            foreach (Control control in controls)
            {
                RemoveDirtyInputControls(control);
            }
        }

        protected void TrackDirtyInputControl(params Control[] controls)
        {
            foreach (Control control in controls)
            {
                IEnumerable<ICaisisInputControl> inputs = CICHelper.GetCaisisInputControls(control);
                foreach (ICaisisInputControl input in inputs)
                {
                    // mark container "dirty" when contained controls changes value
                    input.ValueChanged += (o, e) =>
                    {
                        AddDirtyInputControls(control);
                    };
                }
            }
        }

        /// <summary>
        /// Marks the current control as having "dirty" values
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void MarkFormDirty(CustomControls.ICaisisInputControl sender, EventArgs e)
        {
            isFormDirty = true;
        }

        /// <summary>
        /// Sets the enabled state of the input fields in the container
        /// </summary>
        /// <param name="container"></param>
        /// <param name="doLock"></param>
        protected void SetControlsLockState(Control container, bool doLock)
        {
            var inputs = CICHelper.GetCaisisInputControls(container);
            inputs.ForEach(i => i.Enabled = false);
        }

        /// <summary>
        /// Save/update the current form record for the given T Business object, using this component's fields.
        /// </summary>
        /// <typeparam name="T">The BusinessObject type param</typeparam>
        /// <param name="container">The container containing the input controls</param>
        /// <param name="parKey">The optional parent key</param>
        /// <param name="priKey">The optional primary key to load BusinessObject</param>
        /// <returns>A new instance of BusinessObject T with the saved record.</returns>
        public T SaveRecord<T>(Control container, int? parKey, int? priKey) where T : BusinessObject, IBusinessObject, new()
        {
            T biz = new T();
            if (priKey.HasValue)
            {
                biz.Get(priKey.Value);
            }
            else if(parKey.HasValue)
            {
                string parKeyName = biz.ParentKeyName;
                if (!string.IsNullOrEmpty(parKeyName))
                {
                    biz[parKeyName] = parKey.Value;
                }
            }
            // filter inputs by table
            var inputs = PageUtil.GetCaisisInputControlsInContainer(container).Where(i => i.Table == biz.TableName && !string.IsNullOrEmpty(i.Field) && biz.HasField(i.Field));
            foreach (var input in inputs)
            {
                if (biz.HasField(input.Field + ""))
                    biz[input.Field] = input.Value;
            }
            SaveBizo(biz);
            return biz;
        }

        /// <summary>
        /// Inserts/Updates the specified bizo, appending optional markers
        /// </summary>
        /// <param name="bizo"></param>
        public void SaveBizo(BusinessObject bizo)
        {
            if (!string.IsNullOrEmpty(appendToUserName))
                bizo.AppendToUserName(appendToUserName);
            bizo.Save();
        }
    }
}
