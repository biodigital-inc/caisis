using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Caisis.UI.Core.Classes;

namespace Caisis.UI.Core.DataEntry
{
    /// <summary>
    /// Represents a stylized tooltip
    /// </summary>
    public partial class DataEntryTooltip : BaseControl
    {
        private string tooltip;

        /// <summary>
        /// Gets or sets the tooltip
        /// </summary>
        public virtual string ToolTip
        {
            get
            {
                return tooltip;
            }
            set
            {
                tooltip = value;
            }
        }

        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);
        }
    }
}