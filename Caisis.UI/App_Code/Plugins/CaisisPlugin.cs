using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.ComponentModel;

using Caisis.UI;

namespace Caisis.PluginFramework
{
    public enum PluginType
    {
        WebCodeInline = 0,
        WebCodeBehind = 1,
        WebHtml = 2,
        WebControl = 3,
    }

    public delegate void ActionPerformedEventHandler(IPlugin plugin, IPluginContext context);


    public interface IPlugin
    {
        string ControlIdToModify { get; }
        string Name { get; }
        PluginType Type { get; }

        event ActionPerformedEventHandler ActionPerformed;

        void OnActionPerformed(IPluginContext context);
        void PerformAction(IPluginContext context);
    }

    public interface IPluginContext
    {
        string IdOfControl { get; set; }
        string ValueOfControl { get; set; }
    }

}

namespace Caisis.UI.Core.Classes
{
    using Caisis.PluginFramework;

    /// <summary>
    /// Summary description for CaisisPlugin.
    /// </summary>
    [DefaultProperty("Text"),
    ToolboxData("<{0}:CaisisPlugin runat=server></{0}:CaisisPlugin>")]
    public abstract class CaisisPlugin : System.Web.UI.UserControl, Caisis.PluginFramework.IPlugin
    {
        private int _patientID = 0;
        private int _primaryKey = 0;

        private bool _enabled = true;

        public CaisisPlugin() { }

        protected override void OnLoad(EventArgs e)
        {
            if (this.Page.Session[SessionKey.PatientId] != null && !this.Page.Session[SessionKey.PatientId].ToString().Equals(""))
            {
                this.PatientId = int.Parse(this.Page.Session[SessionKey.PatientId].ToString());
            }
            base.OnLoad(e);
        }

        public abstract string Name { get; }
        public abstract string ControlIdToModify { get;}

        public int PrimaryKey
        {
            get { return _primaryKey; }
            set { this._primaryKey = value; }
        }

        public int PatientId
        {
            get { return _patientID; }
            set { this._patientID = value; }
        }

        public bool Enabled
        {
            get
            {
                return _enabled;
            }
            set
            {
                _enabled = true;
            }
        }


        #region IPlugin Members

        public abstract PluginType Type { get;}

        public virtual void PerformAction(IPluginContext context)
        {
            OnActionPerformed(context);
        }

        public event ActionPerformedEventHandler ActionPerformed;

        public void OnActionPerformed(IPluginContext context)
        {
            if (ActionPerformed != null)
                ActionPerformed(this, context);
        }

        #endregion

    }
}
