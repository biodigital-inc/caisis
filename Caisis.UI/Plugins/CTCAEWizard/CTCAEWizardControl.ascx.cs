using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Caisis.UI.Core.Classes;
using Caisis.UI.Core.Classes.CustomControls;
using Caisis.UI.Core;
using Caisis.PluginFramework;

using Caisis.BOL;

namespace Caisis.UI.Plugins.CTCAEWizard
{
    public partial class CTCAEWizardControl : CaisisPlugin
    {
        /// <summary>
        /// A list of fields to collect client ids by field name
        /// </summary>
        private static readonly string[] ToxFieldKeys = new string[] { Toxicity.ToxScale, Toxicity.ToxCategory, Toxicity.ToxName, Toxicity.ToxGrade };

        /// <summary>
        /// a list of client ids used for populating fields in the CTCAE interface
        /// </summary>
        private List<string> ClientCTCAEArgumentList = new List<string>();


        public CTCAEWizardControl()
            : base()
        {
            // add event to capture late bound client ids of CTCAE Fields
            this.PreRender += new EventHandler(WireClientScriptsToCTCAEFields);
        }

        protected override void OnLoad(EventArgs e)
        {
            base.OnLoad(e);
        }

        /// <summary>
        /// Crawl through page and collect CTC realted fields for use on client
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void WireClientScriptsToCTCAEFields(object sender, EventArgs e)
        {
            List<GridView> grids = new List<GridView>();
            // TEMP enumeration
            foreach (Control search in Page.Controls)
            {

                DeepFindGrids(grids, search);
                deep(search);

            }
            foreach (GridView grid in grids)
            {
                foreach (GridViewRow row in grid.Rows)
                {
                    CollectClientCTCAEFields(row);
                }
            }
            // Register client object for ctc field lookup
            string clientObject = " var CTCAELookup = { " + string.Join(",", ClientCTCAEArgumentList.ToArray()) + "} ;";
            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "CTCAELookup", clientObject, true);
        }

        private void deep(Control con)
        {
            foreach (Control search in con.Controls)
            {
                if (!(search is GridView))
                {
                    CollectClientCTCAEFields(search);
                }
            }
        }

        // TEMP

        private void DeepFindGrids(List<GridView> grids, Control con)
        {
            foreach (Control search in con.Controls)
            {
                if (search is GridView)
                {
                    grids.Add(search as GridView);
                }
                else if (search.HasControls())
                {
                    DeepFindGrids(grids, search);
                }
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="container"></param>
        private void CollectClientCTCAEFields(Control container)
        {
            // find controls in container
            Dictionary<string, ICaisisInputControl> lookup = new Dictionary<string, ICaisisInputControl>();
            var cicList = PageUtil.GetCaisisInputControlsInContainer(container, new List<Type>() { typeof(GridView), typeof(Repeater) });
            foreach (ICaisisInputControl icic in cicList)
            {
                if (!lookup.ContainsKey(icic.Field))
                {
                    lookup.Add(icic.Field, icic);
                }
            }
            // tox name is required key
            if (lookup.ContainsKey(Toxicity.ToxName))
            {
                // collect client ids based on Field Name
                string[] clientIDs = new string[ToxFieldKeys.Length];
                for (var i = 0; i < ToxFieldKeys.Length; i++)
                {
                    string clientId = string.Empty;
                    string fieldName = ToxFieldKeys[i];
                    if (lookup.ContainsKey(fieldName))
                    {
                        clientId = (lookup[fieldName] as Control).ClientID;
                    }
                    else
                    {
                        clientId = string.Empty;
                    }
                    clientIDs[i] = clientId;
                }

                string key = string.Format("'{0}'", clientIDs[2]);
                string value = string.Format("['{0}']", string.Join("','", clientIDs));
                string clientObject = string.Format("{0} : {1}", key, value);
                // add client object 'key' : ['a1','a2','a3','a4']
                ClientCTCAEArgumentList.Add(clientObject);
            }
        }

        #region CaisisPlugin members

        public override string ControlIdToModify
        {
            get
            {
                return null; //since we aren't modifying any controls on the parent page, just return null.
            }
        }

        public override PluginType Type
        {
            get
            {
                return PluginType.WebControl;
            }
        }

        public override string Name
        {
            get
            {
                return "CTCAE Wizard";
            }
        }

        #endregion
    }
}