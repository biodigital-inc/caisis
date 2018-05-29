using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Caisis.BOL;
using Caisis.UI.Core.Classes;
using Caisis.UI.Core.Classes.CustomControls;
using Caisis.DataAccess;

namespace Caisis.UI.Modules.All.DataEntryForms
{
    public partial class AbsentEventYesNo : BaseControl
    {
        private string absentTable;
        private string absentField;
        private string absentFieldValue;

        private string panelId;

        /// <summary>
        /// Gets or sets the absent event table
        /// </summary>
        public virtual string AbsentTable
        {
            get
            {
                return absentTable;
            }
            set
            {
                absentTable = value;
            }
        }

        /// <summary>
        /// Gets or sets the absent event field
        /// </summary>
        public virtual string AbsentField
        {
            get
            {
                return absentField;
            }
            set
            {
                absentField = value;
            }
        }

        /// <summary>
        /// Gets or sets the absent event field value
        /// </summary>
        public virtual string AbsentFieldValue
        {
            get
            {
                return absentFieldValue;
            }
            set
            {
                absentFieldValue = value;
            }
        }

        /// <summary>
        /// Gets or sets the absent field question
        /// </summary>
        public virtual string AbsentQuestionText
        {
            get
            {
                return AbsentText.Text;
            }
            set
            {
                AbsentText.Text = value;
            }
        }

        /// <summary>
        /// The id of the panel to toggle
        /// </summary>
        public virtual string PanelId
        {
            get
            {
                return panelId;
            }
            set
            {
                panelId = value;
            }
        }

        /// <summary>
        /// Gets or sets the yes radio
        /// </summary>
        public virtual bool YesChecked
        {
            get
            {
                return YesCheck.Checked;
            }
            set
            {
                YesCheck.Checked = value;
            }
        }

        /// <summary>
        /// Gets or sets the no radio
        /// </summary>
        public virtual bool NoChecked
        {
            get
            {
                return NoCheck.Checked;
            }
            set
            {
                NoCheck.Checked = value;
            }
        }

        protected override void Page_Load(object sender, System.EventArgs e)
        {
            base.Page_Load(sender, e);
        }

        protected override void OnPreRender(EventArgs e)
        {
            // set checkbox scripts
            if (!string.IsNullOrEmpty(PanelId))
            {
                // add radio button scripts, and run default
                string scriptFormat = "showHidePanel('{0}', {1});";
                string yes = string.Format(scriptFormat, PanelId, true.ToString().ToLower());
                string no = string.Format(scriptFormat, PanelId, false.ToString().ToLower());
                YesCheck.Attributes["onclick"] = yes;
                NoCheck.Attributes["onclick"] = no;
                // run default script
                string defaultScript = YesChecked ? yes : (NoChecked ? no : "");
                if (!string.IsNullOrEmpty(defaultScript))
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "showHideAbsentEvent_" + PanelId, defaultScript, true);
                }
            }
            base.OnPreRender(e);
        }

        /// <summary>
        /// Sets the current absent event and returns the record.
        /// </summary>
        /// <param name="patientId"></param>
        /// <returns></returns>
        public virtual AbsentEvent SetAbsentEvent(int patientId)
        {
            AbsentEvent ae = GetAbsentEvent(patientId);
            if (ae != null && ae.PrimaryKeyHasValue)
            {
                AbsentEventId.Value = ae[AbsentEvent.AbsentEventId].ToString();
                NoChecked = true;
            }
            else
            {
                AbsentEventId.Value = "";
                NoChecked = false;
            }
            return ae;
        }

        /// <summary>
        /// Saves/deletes the current absent event based on the yes/no state
        /// </summary>
        /// <param name="patientId"></param>
        /// <returns></returns>
        public virtual AbsentEvent SaveAbsentEvent(int patientId)
        {
            // delete
            if (YesChecked)
            {
                DeleteAbsentEvent();
            }
            // insert/update
            else if (NoChecked)
            {
                return SaveAbsentEventRecord(patientId);
            }
            return null;
        }

        public virtual AbsentEvent SaveAbsentEventRecord(int patientId)
        {
            AbsentEvent ae = new AbsentEvent();
            // update record
            if (!string.IsNullOrEmpty(AbsentEventId.Value))
            {
                ae.Get(int.Parse(AbsentEventId.Value));
                // validate
                Dictionary<string, string> pairs = new Dictionary<string, string> 
                {
                    { AbsentEvent.TableName, AbsentTable },
                    { AbsentEvent.FieldName,AbsentField } ,
                    { AbsentEvent.FieldValue, AbsentFieldValue } 
                };
                // if any pairs don't match, update record
                bool update = pairs.Any(p => ae[p.Key].ToString() != p.Value);
                if (!update)
                    return ae;
            }
            // create record
            else
            {
                ae[AbsentEvent.PatientId] = patientId;
                ae[AbsentEvent.TableName] = AbsentTable;
                ae[AbsentEvent.FieldName] = AbsentField;
                ae[AbsentEvent.FieldValue] = AbsentFieldValue;
            }
            ae.Save();
            // update pri key
            AbsentEventId.Value = ae[AbsentEvent.AbsentEventId] + "";
            return ae;
        }

        public virtual void DeleteAbsentEvent()
        {
            AbsentEvent ae = new AbsentEvent();
            if (!string.IsNullOrEmpty(AbsentEventId.Value))
            {
                int absentEventId = int.Parse(AbsentEventId.Value);
                ae.Delete(absentEventId);

                AbsentEventId.Value = "";
            }
        }

        private AbsentEvent GetAbsentEvent(int patientId)
        {
            // build query
            Dictionary<string, object> queryParams = new Dictionary<string, object>();
            // required
            queryParams.Add(AbsentEvent.PatientId, patientId);
            // optional
            if (!string.IsNullOrEmpty(AbsentTable))
            {
                queryParams.Add(AbsentEvent.TableName, AbsentTable);
                if (!string.IsNullOrEmpty(AbsentField))
                {
                    queryParams.Add(AbsentEvent.FieldName, AbsentField);
                    if (!string.IsNullOrEmpty(AbsentFieldValue))
                    {
                        queryParams.Add(AbsentEvent.FieldValue, AbsentFieldValue);
                    }
                }
            }
            // get first record
            return BusinessObject.GetByFields<AbsentEvent>(queryParams).FirstOrDefault();
        }
    }
}