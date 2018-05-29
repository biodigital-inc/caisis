using System;
using System.Collections.Specialized;
using System.Collections.Generic;
using System.ComponentModel;
using System.IO;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI;
using System.Web;
using System.Linq;

using Caisis.Security;

namespace Caisis.UI.Core.Classes.CustomControls
{
    #region interfaces
    public interface ICaisisInputControl
    {
        /// <summary>
        /// The name of the Database Table corresponding to a control.
        /// </summary>
        [CaisisMetaDataField]
        string Table
        {
            get;
            set;
        }

        /// <summary>
        /// The name of the Database Table's field corresponding to a control.
        /// </summary>
        [CaisisMetaDataField]
        string Field
        {
            get;
            set;
        }

        /// <summary>
        /// An string representation of a Control's "Value"
        /// </summary>
        string Value
        {
            get;
            set;
        }

        /// <summary>
        /// The name of the Database Table corresponding to a control.
        /// </summary>
        [CaisisMetaDataField]
        bool Visible
        {
            get;
            set;
        }

        /// <summary>
        /// The name to display next to the control.
        /// </summary>
        [CaisisMetaDataField]
        string FieldLabel
        {
            get;
            set;
        }

        /// <summary>
        /// Shows if this field is required on data entry forms.
        /// </summary>
        [CaisisMetaDataField]
        bool Required
        {
            get;
            set;
        }

        /// <summary>
        /// True or False value indicating wheather to show a help description for a control.
        /// </summary>
        [CaisisMetaDataField]
        bool ShowHelpBubble
        {
            get;
            set;
        }

        /// <summary>
        /// The help description displayed for a control.
        /// </summary>
        [CaisisMetaDataField]
        string HelpDescription
        {
            get;
            set;
        }

        /// <summary>
        /// True or False indicating weather to show a control.
        /// </summary>
        [CaisisMetaDataField]
        bool ShowLabel
        {
            get;
            set;
        }

        /// <summary>
        /// True or False indicating weather to is enabled for editing/modifying.
        /// </summary>
        [CaisisMetaDataField]
        bool Enabled
        {
            get;
            set;
        }

        ///// <summary>
        ///// 
        ///// </summary>
        //[CaisisMetaDataField]
        //bool ReadOnly
        //{
        //    get;
        //    set;
        //}

        /// <summary>
        /// The CSS class name to apply to the control.
        /// </summary>
        [CaisisMetaDataField]
        string CssClass
        {
            set;
        }

        /// <summary>
        /// 
        /// </summary>
        [CaisisMetaDataField]
        string LabelClass
        {
            get;
            set;
        }

        /// <summary>
        /// An event which occurs when a control's Value has changed during PostBack
        /// </summary>
        event CaisisEventHandler ValueChanged;

        /// <summary>
        /// An event which occurs during PreRender stage
        /// </summary>
        event CaisisEventHandler PreRender;
    }

    public interface ICaisisLookupControl
    {
        [CaisisMetaDataField]
        string LookupCode
        {
            get;
            set;
        }

        [CaisisMetaDataField]
        string LookupDistinct
        {
            get;
            set;
        }

        [CaisisMetaDataField]
        string CascadeValuesBasedOn
        {
            get;
            set;
        }

        [CaisisMetaDataField]
        string CascadeFormatString
        {
            get;
            set;
        }
    }
    #endregion

    #region delegates

    /// <summary>
    /// Represents a method which will have events invoked by an ICaisisInputControl passing no event arguments
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    public delegate void CaisisEventHandler(ICaisisInputControl sender, EventArgs e);

    #endregion

    #region enums
    public enum CaisisAdjunctType
    {
        WebConfig,
        Session,
        String
    }
    #endregion

    /// <summary>
    /// A non-UI (no html content) control used to activating values server side
    /// </summary>
    public class CaisisAdjunct : Control
    {
        private string _value;

        private string[] watchList = new string[0];
        private CaisisAdjunctType valueType = CaisisAdjunctType.String;
        private string valueKey;
        private bool activated;

        /// <summary>
        /// An event signalizing that a control has activated the Adjunct Value
        /// </summary>
        public event CaisisEventHandler ControlActivated;

        /// <summary>
        /// A comma seperated list of IDs
        /// </summary>
        [TypeConverter(typeof(StringArrayConverter))]
        public string[] WatchList
        {
            get
            {
                return watchList;
            }
            set
            {
                watchList = value;
            }
        }

        /// <summary>
        /// A type of value to be stored 
        /// </summary>
        public CaisisAdjunctType ValueType
        {
            get
            {
                return valueType;
            }
            set
            {
                valueType = value;
            }
        }

        /// <summary>
        /// A key used in conjuntion with the ValueType property to retrieve values from Session, WebConfig
        /// </summary>
        public string ValueKey
        {
            get
            {
                return valueKey;
            }
            set
            {
                valueKey = value;
            }
        }

        /// <summary>
        /// Gets or sets a value 
        /// </summary>
        public string Value
        {
            get
            {
                // Static values are returned without processing
                if (IsStaticValue)
                {
                    return this._value;
                }
                // "live" value types need to be processed
                else
                {
                    string processedValue = this._value;
                    // Determine if any of the controls being watch have a value
                    foreach (ICaisisInputControl field in this.ControlWatchList)
                    {
                        if (!string.IsNullOrEmpty(field.Value))
                        {
                            if (valueType == CaisisAdjunctType.WebConfig)
                            {
                                processedValue = CaisisConfiguration.GetWebConfigValue(this.Value);
                            }
                            else if (valueType == CaisisAdjunctType.Session)
                            {
                                processedValue = Page.Session[this.Value] != null ? Page.Session[this.Value].ToString() : string.Empty;
                            }
                            // Return value after first "non-empty/null" control encountered
                            return processedValue;
                        }
                    }
                    return processedValue;
                }
            }
            set
            {
                _value = value;
            }
        }

        /// <summary>
        /// Gets a list of ICaisisInputControl being watched for a value change
        /// </summary>
        public List<ICaisisInputControl> ControlWatchList
        {
            get
            {
                List<ICaisisInputControl> foundFields = new List<ICaisisInputControl>();
                foreach (string field in watchList)
                {
                    ICaisisInputControl foundField = this.NamingContainer.FindControl(field) as ICaisisInputControl;
                    if (foundField != null)
                    {
                        foundFields.Add(foundField);
                    }
                }
                return foundFields;
            }
        }

        /// <summary>
        /// Returns if a static value is saved for this field
        /// </summary>
        public bool IsStaticValue
        {
            get
            {
                return valueType == CaisisAdjunctType.String;
            }
        }

        /// <summary>
        /// Gets if control has been activated, i.e. value change for observed controls
        /// </summary>
        public bool Activated
        {
            get
            {
                return activated;
            }
        }

        protected override void OnLoad(EventArgs e)
        {
            base.OnLoad(e);
            AddActivationHandler();
        }

        /// <summary>
        /// 
        /// </summary>
        private void AddActivationHandler()
        {
            foreach (ICaisisInputControl iCIC in ControlWatchList)
            {
                iCIC.ValueChanged += new CaisisEventHandler(ActivateOnValueChange);
            }
        }

        /// <summary>
        /// Signals the control to "activate"
        /// </summary>
        /// <param name="iCIC"></param>
        /// <param name="e"></param>
        private void ActivateOnValueChange(ICaisisInputControl iCIC, EventArgs e)
        {
            this.activated = true;
            if (ControlActivated != null)
            {
                ControlActivated(iCIC, e);
            }
        }
    }

    /// <summary>
    /// A TextBox based control used for displaying/editing values of database fields.
    /// </summary>
    [DefaultProperty("CIC"), ToolboxData("<{0}:CaisisTextBox runat=server></{0}:CaisisTextBox>")]
    public class CaisisTextBox : TextBox, ICaisisInputControl
    {
        public CaisisTextBox()
            : base()
        {
            showLabel = true;
            showHelpBubble = true;
            showTextEditor = false;

            // Attach EventHandler to handle CaisisEventHandler event
            this.TextChanged += (i, e) => OnValueChanged(this, e);
            base.PreRender += (i, e) => this.OnPreRender(this, e);
            // set max length during load
            base.Load += (i, e) => CICHelper.DefaultInputControlMaxLength(this);
            // before rendering, attach max length javascript
            base.PreRender += (a, b) => CICHelper.BuildInputControlMaxLengthScript(this);
        }

        #region private instance members
        private string table;
        private string field;
        private string fieldLabel;
        private bool required;
        private bool showHelpBubble;
        private string helpDescription;
        private bool showLabel;
        private string labelClass;
        private bool enabled;

        // default to null
        private bool showNumberPad;
        private bool showCalendar;
        private bool calcDate;
        private bool showTextEditor;
        private bool showICDWizard;
        #endregion

        #region protected instance members
        protected Label inputFieldLabel;
        #endregion

        /// <summary>
        /// An event signaling that the control's Value(text in TextBox) has changed during PostBack
        /// </summary>
        public event CaisisEventHandler ValueChanged;

        /// <summary>
        /// 
        /// </summary>
        public event CaisisEventHandler PreRender;

        #region Properties required to implement ICaisisInputControl
        /// <summary>
        /// Gets or sets the name of the Database Table corresponding to this control.
        /// </summary>
        public string Table
        {
            get { return table; }
            set { table = value; }
        }

        /// <summary>
        /// Gets or sets the column name which maps to the Database Table specified by the "Table" property.
        /// </summary>
        public string Field
        {
            get { return field; }
            set { field = value; }
        }

        /// <summary>
        /// Gets or sets the visibility of the control.
        /// </summary>
        public bool Visible
        {
            get { return base.Visible; }
            set { base.Visible = value; }
        }

        /// <summary>
        /// Gets or sets the value of the textbox.
        /// </summary>
        public string Value
        {
            get { return this.Text; }
            set { this.Text = value; }
        }

        /// <summary>
        /// Gets or sets the text label for the textbox.
        /// </summary>
        public string FieldLabel
        {
            get { return fieldLabel; }
            set { fieldLabel = value; }
        }

        /// <summary>
        /// Gets or sets whether a value is requied for this control.
        /// </summary>
        public bool Required
        {
            get { return required; }
            set { required = value; }
        }

        /// <summary>
        /// Gets or sets whether a help description bubble should appear when mousing over
        /// this control's Field Label.
        /// </summary>
        public bool ShowHelpBubble
        {
            get { return showHelpBubble; }
            set { showHelpBubble = value; }
        }

        /// <summary>
        /// Gets or sets the help description shown in the help bubble, when the user mouse's over this control's Field Label.
        /// </summary>
        public string HelpDescription
        {
            get { return helpDescription; }
            set { helpDescription = value; }
        }

        /// <summary>
        /// Gets or sets whether to display the Field Label for this control.
        /// </summary>
        public bool ShowLabel
        {
            get { return showLabel; }
            set { showLabel = value; }
        }

        /// <summary>
        /// Gets or sets the class of just the Label, if not defined defaults to pdFormFieldLabel.
        /// </summary>
        public string LabelClass
        {
            get { return labelClass; }
            set { labelClass = value; }
        }

        /// <summary>
        /// Gets or sets whether the textbox is editable.
        /// </summary>
        public bool Enabled
        {
            get
            {
                enabled = base.Enabled;
                return enabled;
            }
            set
            {
                base.Enabled = value;
                enabled = value;
            }
        }


        public string CssClass
        {
            set { base.CssClass = value; }
        }


        #endregion

        #region TextBox-specific Properties
        [CaisisMetaDataField]
        public bool ShowNumberPad
        {
            get { return showNumberPad; }
            set { showNumberPad = value; }
        }

        [CaisisMetaDataField]
        public bool ShowCalendar
        {
            get { return showCalendar; }
            set { showCalendar = value; }
        }

        [CaisisMetaDataField]
        public bool ShowTextEditor
        {
            get { return showTextEditor; }
            set { showTextEditor = value; }
        }

        [CaisisMetaDataField]
        public bool ShowICDWizard
        {
            get { return showICDWizard; }
            set { showICDWizard = value; }
        }

        [CaisisMetaDataField]
        public bool ReadOnly
        {
            get { return base.ReadOnly; }
            set { base.ReadOnly = value; }
        }



        [CaisisMetaDataField]
        /// <summary>
        /// Intepretes the date entered into the date text field into the readonly date field
        /// </summary>
        public bool CalcDate
        {
            get { return calcDate; }
            set { calcDate = value; }
        }
        #endregion

        protected override void OnInit(EventArgs e)
        {
            if (this.ID == null)
            {
                this.ID = Table + "_" + Field;
            }
            base.OnInit(e);
        }

        /// <summary>
        /// Occurs when the TextBox's Value has changed during server posts
        /// </summary>
        /// <param name="iCIC"></param>
        /// <param name="e"></param>
        protected void OnValueChanged(ICaisisInputControl iCIC, EventArgs e)
        {
            if (ValueChanged != null)
            {
                ValueChanged(iCIC, e);
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="iCIC"></param>
        /// <param name="e"></param>
        protected void OnPreRender(ICaisisInputControl iCIC, EventArgs e)
        {
            if (PreRender != null)
            {
                PreRender(iCIC, e);
            }
        }

        protected override void Render(HtmlTextWriter w)
        {
            try
            {
                // No need for ViewState
                this.EnableViewState = false;

                // only render when visible
                if (this.Visible == true)
                {
                    CICHelper.RenderFieldLabel(showLabel, FieldLabel, w, Required, showHelpBubble, helpDescription, labelClass);


                    // NOTE, for this to work the hard date field MUST be the same as the date text field without "Text" in it
                    // IMPORTANT: attributes must be set before control is rendered.
                    if (CalcDate)
                    {
                        //string calcDateFieldClientID = this.ClientID.Replace("Text", ""); // remove "Text" to get client Id of hard date field
                        //this.Attributes.Add("onBlur", "fuzzyDate(" + this.ClientID.ToString() + ", " + calcDateFieldClientID + ");");
                        PageUtil.AttachClientEventToControl(this, "onblur", "UpdateAssociatedDate(this);");
                    }
                    // IMPORTANT: prevent submit on ENTER key for calendar
                    if ((!string.IsNullOrEmpty(this.Field) && this.Field.EndsWith("DateText")) || ShowCalendar || CalcDate)
                    {
                        PageUtil.AttachClientEventToControl(this, "onkeydown", "if(event.keyCode == 13) { return false; }");
                    }
                    base.Render(w); // renders this control; sequence matters

                    if (ShowNumberPad)
                    {
                        Image numberPad = new Image();
                        numberPad.ImageUrl = "~/Images/icon_NumPad.gif";
                        numberPad.Style.Add("vertical-align", "middle"); //onclick="showNumPad('_ctl0_ORDateText');
                        numberPad.Attributes.Add("vspace", "1");
                        numberPad.Attributes.Add("hspace", "1");
                        numberPad.Attributes.Add("onclick", "showNumPad(event, '" + this.ClientID + "')");
                        numberPad.CssClass = "imageButtonOn";
                        numberPad.RenderControl(w);
                    }
                    if (ShowCalendar)
                    {
                        Image calendar = new Image();
                        calendar.ImageUrl = "~/Images/calendar/cal.png";
                        calendar.CssClass = "CalendarWidget";
                        //calendar.Style.Add("vertical-align", "middle");
                        //calendar.Attributes.Add("hspace", "3");
                        //calendar.Width = 16;
                        //calendar.Height = 18;
                        calendar.ID = this.ClientID + "_Cal";
                        if (Enabled)
                        {
                            calendar.Attributes.Add("onclick", "showCal(this, document.getElementById('" + this.ClientID + "'));");
                        }
                        calendar.RenderControl(w);
                    }
                    if (ShowTextEditor)
                    {
                        Image textAreaHelper = new Image();
                        textAreaHelper.ImageUrl = "~/Images/TextAreaBtn.png";
                        textAreaHelper.CssClass = "TextEditorWidget";
                        int maxCharCount = MaxLength > 0 ? MaxLength : 1000;
                        textAreaHelper.Attributes.Add("onclick", "NotesEditor.show('" + this.ClientID + "'," + maxCharCount + ");");
                        textAreaHelper.Style.Add(HtmlTextWriterStyle.VerticalAlign, "top");
                        textAreaHelper.RenderControl(w);
                    }
                    if (ShowICDWizard)
                    {
                        Image icdHelper = new Image();
                        icdHelper.ImageUrl = "~/Images/ICD.gif";
                        icdHelper.CssClass = "PDButtonOn";
                        //string icdType = "10";
                        icdHelper.Attributes.Add("onclick", "ICDEditor.show('" + this.ClientID + "');");
                        icdHelper.Style.Add(HtmlTextWriterStyle.VerticalAlign, "middle");
                        icdHelper.RenderControl(w);
                    }
                }
            }
            catch (Exception ex)
            {
                w.Write("Error building CaisisTextBox:<br>");
                w.Write(ex.Message);
            }
        }
    }


    [DefaultProperty("CIC"), ToolboxData("<{0}:CaisisTextArea runat=server></{0}:CaisisTextArea>")]
    public class CaisisTextArea : TextBox, ICaisisInputControl
    {
        #region private instance members
        private string table;
        private string field;
        private string fieldLabel;
        private bool required;
        private bool enabled;

        private bool showHelpBubble;
        private bool showLabel;
        private string labelClass;
        private string helpDescription;
        private bool showTextEditor;
        private bool showAsTextInGrid = true;
        #endregion

        #region protected instance members
        protected Label inputFieldLabel;
        #endregion

        /// <summary>
        /// An event signaling that the control's Value(text in TextArea) has changed during PostBack
        /// </summary>
        public event CaisisEventHandler ValueChanged;

        /// <summary>
        /// 
        /// </summary>
        public event CaisisEventHandler PreRender;

        #region Properties required to implement ICaisisInputControl
        /// <summary>
        /// Gets or sets the name of the Database Table corresponding to this control.
        /// </summary>
        public string Table
        {
            get { return table; }
            set { table = value; }
        }

        /// <summary>
        /// Gets or sets the column name which maps to the Database Table specified by the "Table" property.
        /// </summary>
        public string Field
        {
            get { return field; }
            set { field = value; }
        }

        /// <summary>
        /// Gets or sets the text in the textarea.
        /// </summary>
        public string Value
        {
            get { return base.Text; }
            set { base.Text = value; }
        }

        /// <summary>
        /// Gets or sets the visibility of the control.
        /// </summary>
        public bool Visible
        {
            get { return base.Visible; }
            set { base.Visible = value; }
        }

        /// <summary>
        /// Gets or sets the text label for the textarea.
        /// </summary>
        public string FieldLabel
        {
            get { return fieldLabel; }
            set { fieldLabel = value; }
        }

        /// <summary>
        /// Gets or sets whether a value is requied for this control.
        /// </summary>
        public bool Required
        {
            get { return required; }
            set { required = value; }
        }

        /// <summary>
        /// Gets or sets whether a help description bubble should appear when mousing over
        /// this control's Field Label.
        /// </summary>
        public bool ShowHelpBubble
        {
            get { return showHelpBubble; }
            set { showHelpBubble = value; }
        }

        /// <summary>
        /// Gets or sets the help description shown in the help bubble, when the user mouse's over this control's Field Label.
        /// </summary>
        public string HelpDescription
        {
            get { return helpDescription; }
            set { helpDescription = value; }
        }

        /// <summary>
        /// Gets or sets whether to display the Field Label for this control.
        /// </summary>
        public bool ShowLabel
        {
            get { return showLabel; }
            set { showLabel = value; }
        }

        /// <summary>
        /// Gets or sets the class of just the Label, if not defined defaults to pdFormFieldLabel.
        /// </summary>
        public string LabelClass
        {
            get { return labelClass; }
            set { labelClass = value; }
        }

        [CaisisMetaDataField]
        public bool ShowTextEditor
        {
            get { return showTextEditor; }
            set { showTextEditor = value; }
        }

        /// <summary>
        /// Gets or sets whether the textarea's text can be edited.
        /// </summary>
        public bool Enabled
        {
            get
            {
                enabled = base.Enabled;
                return enabled;
            }
            set
            {
                base.Enabled = value;
                enabled = value;
            }
        }

        public string CssClass
        {
            set { base.CssClass = value; }
        }

        public override TextBoxMode TextMode
        {
            get
            {
                return base.TextMode;
            }
            set
            {
                base.TextMode = value;
                // if explicitly set by user, supress special grid logic
                if (value != TextBoxMode.MultiLine)
                {
                    showAsTextInGrid = false;
                }
            }
        }
        #endregion

        public CaisisTextArea()
            : base()
        {
            base.TextMode = TextBoxMode.MultiLine;
            base.Height = 60; // DEFAULT TEXT BOX HEIGHT
            showLabel = true;
            showHelpBubble = true;
            showTextEditor = true;

            // Attach EventHandler to handle CaisisEventHandler event
            this.TextChanged += (i, e) => OnValueChanged(this, e); ;
            base.PreRender += (i, e) => this.OnPreRender(this, e);
            // set max length during load
            base.Load += (i, e) => CICHelper.DefaultInputControlMaxLength(this);
            // before rendering, attach max length javascript
            base.PreRender += (a, b) => CICHelper.BuildInputControlMaxLengthScript(this);
        }

        protected override void OnInit(EventArgs e)
        {
            if (this.ID == null)
            {
                this.ID = Table + "_" + Field;
            }

            base.OnInit(e);
        }

        /// <summary>
        /// Occurs when the TextArea's Value has changed during server posts
        /// </summary>
        /// <param name="iCIC"></param>
        /// <param name="e"></param>
        protected void OnValueChanged(ICaisisInputControl iCIC, EventArgs e)
        {
            if (ValueChanged != null)
            {
                ValueChanged(iCIC, e);
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="iCIC"></param>
        /// <param name="e"></param>
        protected void OnPreRender(ICaisisInputControl iCIC, EventArgs e)
        {
            if (PreRender != null)
            {
                PreRender(iCIC, e);
            }
        }

        protected override void OnPreRender(EventArgs e)
        {
            // handle specail case (show as textbox in grids)
            if (this.NamingContainer != null && this.NamingContainer is GridViewRow && this.showAsTextInGrid)
            {
                this.TextMode = TextBoxMode.SingleLine;
                this.ShowTextEditor = true;
                this.Height = Unit.Empty;
            }
            base.OnPreRender(e);
        }
        protected override void Render(HtmlTextWriter w)
        {
            CICHelper.RenderFieldLabel(showLabel, FieldLabel, w, Required, showHelpBubble, helpDescription, labelClass);
            base.Render(w);
            if (ShowTextEditor)
            {
                Image textAreaHelper = new Image();
                textAreaHelper.ImageUrl = "~/Images/TextAreaBtn.png";
                textAreaHelper.CssClass = "TextEditorWidget";
                int maxCharCount = MaxLength > 0 ? MaxLength : 1000;
                textAreaHelper.Attributes.Add("onclick", "NotesEditor.show('" + this.ClientID + "'," + maxCharCount + ");");
                textAreaHelper.Style.Add(HtmlTextWriterStyle.VerticalAlign, "top");
                textAreaHelper.RenderControl(w);
            }
        }
    }


    // note, this is not a WebControl; there is no asp.net hidden webcontrol
    [DefaultProperty("CIC"), ToolboxData("<{0}:CaisisHidden runat=server></{0}:CaisisHidden>")]
    public class CaisisHidden : HtmlInputHidden, ICaisisInputControl
    {
        public CaisisHidden()
            : base()
        {
            // Attach EventHandler to handle CaisisEventHandler event
            this.ServerChange += (i, e) => OnValueChanged(this, e);
            base.PreRender += (i, e) => this.OnPreRender(this, e);
        }

        #region private members
        private string fieldLabel;
        private string table;
        private string field;
        private bool required;
        private bool enabled;

        private bool showHelpBubble;
        private bool showLabel;
        private string helpDescription;
        private bool displayCalculatedDate;
        private bool displayHiddenValue;
        private Label shownValue;
        private Label dateLabel;
        private bool showICDWizard;

        // v5.0
        private bool showSpacer = true;
        private string displayCSSClass = "";

        #endregion

        /// <summary>
        /// An event signaling that the control's Value has changed during PostBack
        /// </summary>
        public event CaisisEventHandler ValueChanged;

        /// <summary>
        /// 
        /// </summary>
        public event CaisisEventHandler PreRender;

        #region Properties required to implement ICaisisInputControl
        /// <summary>
        /// Gets or sets the name of the Database Table corresponding to this control.
        /// </summary>
        public string Table
        {
            get { return table; }
            set { table = value; }
        }

        /// <summary>
        /// Gets or sets the column name which maps to the Database Table specified by the "Table" property.
        /// </summary>
        public string Field
        {
            get { return field; }
            set { field = value; }
        }

        /// <summary>
        /// Gets or sets the value stored in the hidden field.
        /// </summary>
        public string Value
        {
            get { return base.Value; }
            set { base.Value = value; }
        }

        /// <summary>
        /// CaisisHidden, as regular hidden field has to visibility
        /// </summary>
        public bool Visible
        {
            get { return true; }
            set { }
        }

        public string FieldLabel
        {
            get { return fieldLabel; }
            set { fieldLabel = value; }
        }

        /// <summary>
        /// Gets or sets whether a value is requied for this control.
        /// </summary>
        public bool Required
        {
            get { return required; }
            set { required = value; }
        }

        /// <summary>
        /// Gets or sets whether a help description bubble should appear when mousing over
        /// this control's Field Label.
        /// </summary>
        public bool ShowHelpBubble
        {
            get { return showHelpBubble; }
            set { showHelpBubble = value; }
        }

        /// <summary>
        /// Gets or sets the help description shown in the help bubble, when the user mouse's over this control's Field Label.
        /// </summary>
        public string HelpDescription
        {
            get { return helpDescription; }
            set { helpDescription = value; }
        }

        /// <summary>
        /// Gets or sets whether to display the Field Label for this control.
        /// </summary>
        public bool ShowLabel
        {
            get { return showLabel; }
            set { showLabel = value; }
        }

        public string CssClass
        {
            set
            {
                // I'm hidden- why style me? 
            }
        }

        /// <summary>
        /// Gets or sets the CSS class name for the hidden field's rendered (as Label) value
        /// </summary>
        public string DisplayCSSClass
        {
            get
            {
                return displayCSSClass;
            }
            set
            {
                displayCSSClass = value;
            }
        }

        /// <summary>
        /// 
        /// </summary>
        public string LabelClass
        {
            get
            {
                return string.Empty;
            }
            set
            {

            }
        }

        /// <summary>
        /// Gets or sets whether a hidden field is enabled.
        /// </summary>
        public bool Enabled
        {
            get
            {
                if (base.Disabled)
                {
                    enabled = false;
                }
                else
                {
                    enabled = true;
                }
                return enabled;
            }
            set
            {
                enabled = value;
                if (value)
                {
                    base.Disabled = false;
                }
                else
                {
                    base.Disabled = true;
                }
            }
        }

        /// <summary>
        /// Gets or sets whether a spacer IMG is rendered for display text value
        /// </summary>
        public bool ShowSpacer
        {
            get
            {
                return showSpacer;
            }
            set
            {
                showSpacer = value;
            }
        }
        #endregion

        [CaisisMetaDataField]
        public bool DisplayCalculatedDate
        {
            get { return displayCalculatedDate; }
            set { displayCalculatedDate = value; }
        }

        [CaisisMetaDataField]
        public bool DisplayHiddenValue
        {
            get { return displayHiddenValue; }
            set { displayHiddenValue = value; }
        }

        [CaisisMetaDataField]
        public bool ShowICDWizard
        {
            get { return showICDWizard; }
            set { showICDWizard = value; }
        }

        protected override void OnInit(EventArgs e)
        {
            if (this.ID == null)
            {
                this.ID = Table + "_" + Field;
            }

            base.OnInit(e);

            if (displayCalculatedDate)
            {
                dateLabel = new Label();
            }

            if (displayHiddenValue)
            {
                shownValue = new Label();
            }
        }

        /// <summary>
        /// Occurs when the Hidden Field's Value has changed during server posts
        /// </summary>
        /// <param name="iCIC"></param>
        /// <param name="e"></param>
        protected void OnValueChanged(ICaisisInputControl iCIC, EventArgs e)
        {
            if (ValueChanged != null)
            {
                ValueChanged(iCIC, e);
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="iCIC"></param>
        /// <param name="e"></param>
        protected void OnPreRender(ICaisisInputControl iCIC, EventArgs e)
        {
            if (PreRender != null)
            {
                PreRender(iCIC, e);
            }
        }


        /// <summary>
        /// Renders the hidden input tag, but not the FieldLabel, since this is a hidden control
        /// </summary>
        /// <param name="writer"></param>
        protected override void Render(HtmlTextWriter writer)
        {
            if (ShowSpacer && (displayCalculatedDate || displayHiddenValue))
            {
                HtmlImage img = new HtmlImage();
                img.Src = "~/Images/spacer.gif";
                img.Width = 128;
                img.Height = 1;
                img.RenderControl(writer);
            }


            if (ShowICDWizard)
            {
                Image icdHelper = new Image();
                icdHelper.ImageUrl = "~/Images/ICD10Codes.gif";
                icdHelper.CssClass = "PDButtonOn";
                //string icdType = "10";
                icdHelper.Attributes.Add("onclick", "ICDEditor.show('" + this.ClientID + "');");
                icdHelper.Style.Add(HtmlTextWriterStyle.VerticalAlign, "middle");
                icdHelper.RenderControl(writer);
            }


            base.Render(writer);

            if (displayCalculatedDate)
            {
                dateLabel.ID = this.ClientID + "Display";
                dateLabel.CssClass = !string.IsNullOrEmpty(DisplayCSSClass) ? DisplayCSSClass : "DateDisplay";

                if (this.Value == null || this.Value == "")
                {
                    dateLabel.Text = "&nbsp;";
                }
                else
                {
                    DateTime date;

                    if (DateTime.TryParse(this.Value, out date))
                    {
                        dateLabel.Text = date.ToShortDateString();
                    }
                }

                dateLabel.RenderControl(writer);
            }

            if (displayHiddenValue)
            {
                shownValue.ID = this.ClientID + "Display";
                shownValue.CssClass = !string.IsNullOrEmpty(DisplayCSSClass) ? DisplayCSSClass : "DateDisplay";

                if (this.Value == null || this.Value == "")
                {
                    shownValue.Text = "&nbsp;";
                }
                else
                {
                    shownValue.Text = this.Value;
                }

                shownValue.RenderControl(writer);
            }

        }

    }


    [DefaultProperty("CIC"), ToolboxData("<{0}:CaisisSelect runat=server></{0}:CaisisSelect>")]
    public class CaisisSelect : DropDownList, ICaisisInputControl, ICaisisLookupControl
    {
        public CaisisSelect()
            : base()
        {
            showLabel = true;
            showHelpBubble = true;
            showEmptyListItem = true;

            // Attach EventHandler to handle CaisisEventHandler event
            this.SelectedIndexChanged += (i, e) => OnValueChanged(this, e);
            base.PreRender += (i, e) => this.OnPreRender(this, e);
        }

        private string table;
        private string field;
        private string fieldLabel;
        private bool required;
        private bool enabled;
        private bool showHelpBubble;
        private bool showLabel;
        private string labelClass;
        private string helpDescription;
        private string lookupCode;
        private string lookupDistinct;
        private string cascadeValuesBasedOn;
        protected Label inputFieldLabel;
        private string newLookup = "";
        private string cascadeFormatString;
        private bool showEmptyListItem;

        private System.Collections.Hashtable reflist = new System.Collections.Hashtable();

        /// <summary>
        /// An event signaling that the control's SelectedIndex(selected item in dropdown) has changed during PostBack
        /// </summary>
        public event CaisisEventHandler ValueChanged;

        /// <summary>
        /// 
        /// </summary>
        public event CaisisEventHandler PreRender;

        #region Properties required to implement ICaisisInputControl
        /// <summary>
        /// Gets or sets the name of the Database Table corresponding to this control.
        /// </summary>
        public string Table
        {
            get { return table; }
            set { table = value; }
        }

        /// <summary>
        /// Gets or sets the column name which maps to the Database Table specified by the "Table" property.
        /// </summary>
        public string Field
        {
            get { return field; }
            set { field = value; }
        }

        /// <summary>
        /// Gets or sets the selected value in the Drop Down List.
        /// </summary>
        public string Value
        {
            get { return base.SelectedValue; }
            //set { base.SelectedValue = value; }
            set { PageUtil.SelectDropDownItem(this, value); }
        }

        /// <summary>
        /// Gets or sets the visibility of the control.
        /// </summary>
        public bool Visible
        {
            get { return base.Visible; }
            set { base.Visible = value; }
        }
        /// <summary>
        /// Gets or sets the text label for the drop down list.
        /// </summary>
        public string FieldLabel
        {
            get { return fieldLabel; }
            set { fieldLabel = value; }
        }

        /// <summary>
        /// Gets or sets whether a value is requied for this control.
        /// </summary>
        public bool Required
        {
            get { return required; }
            set { required = value; }
        }

        /// <summary>
        /// Gets or sets whether a help description bubble should appear when mousing over
        /// this control's Field Label.
        /// </summary>
        public bool ShowHelpBubble
        {
            get { return showHelpBubble; }
            set { showHelpBubble = value; }
        }

        /// <summary>
        /// Gets or sets the help description shown in the help bubble, when the user mouse's over this control's Field Label.
        /// </summary>
        public string HelpDescription
        {
            get { return helpDescription; }
            set { helpDescription = value; }
        }

        /// <summary>
        /// Gets or sets whether to display the Field Label for this control.
        /// </summary>
        public bool ShowLabel
        {
            get { return showLabel; }
            set { showLabel = value; }
        }

        /// <summary>
        /// Gets or sets the class of just the Label, if not defined defaults to pdFormFieldLabel.
        /// </summary>
        public string LabelClass
        {
            get { return labelClass; }
            set { labelClass = value; }
        }
        #endregion

        public string LookupCode
        {
            get { return lookupCode; }
            set { lookupCode = value; }
        }

        public string LookupDistinct
        {
            get { return lookupDistinct; }
            set { lookupDistinct = value; }
        }

        public string CascadeValuesBasedOn
        {
            get { return cascadeValuesBasedOn; }
            set { cascadeValuesBasedOn = value; }
        }

        /// <summary>
        /// Gets or Set whether to append an Empty List Item to the beginning of Item List
        /// </summary>
        public bool ShowEmptyListItem
        {
            get
            {
                return showEmptyListItem;
            }
            set
            {
                showEmptyListItem = value;
            }
        }

        /// <summary>
        /// Gets or set whether the drop down list is enabled.
        /// </summary>
        public bool Enabled
        {
            get
            {
                enabled = base.Enabled;
                return enabled;
            }
            set
            {
                base.Enabled = value;
                enabled = value;
            }
        }

        public string CssClass
        {
            set { base.CssClass = value; }
        }

        public System.Collections.Hashtable RefList
        {
            get
            {
                return this.reflist;
            }
        }

        public string CascadeFormatString
        {
            get
            {
                return cascadeFormatString;
            }
            set
            {
                cascadeFormatString = value;
            }
        }

        protected override void OnInit(EventArgs e)
        {
            base.OnInit(e);

            // Handle Cascading Options
            WireEventsToObservedControls();

            if (this.ID == null)
            {
                this.ID = Table + "_" + Field;
            }

            if (lookupDistinct != null && lookupDistinct.Length > 0)
            {
                CICHelper.HandleLookupDistinctAttribute(this, lookupDistinct, this.Page.Session);
                this.EnableViewState = true;
            }
            else if (lookupCode != null && lookupCode.Length > 0)
            {
                this.DataSource = CacheManager.GetLookupCodeList(lookupCode).DefaultView;
                this.DataTextField = BOL.LookupCode.LkpCode;
                this.DataValueField = BOL.LookupCode.LkpCode;
                this.DataBind();

                this.EnableViewState = true;
            }
        }

        /// <summary>
        /// Occurs when the selected index of the dropdown changes during posts
        /// </summary>
        /// <param name="iCIC"></param>
        /// <param name="e"></param>
        protected void OnValueChanged(ICaisisInputControl iCIC, EventArgs e)
        {
            if (ValueChanged != null)
            {
                ValueChanged(iCIC, e);
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="iCIC"></param>
        /// <param name="e"></param>
        protected void OnPreRender(ICaisisInputControl iCIC, EventArgs e)
        {
            if (PreRender != null)
            {
                PreRender(iCIC, e);
            }
        }

        // events that set control values MUST fire on prerender, not OnInit nor Render
        protected override void OnPreRender(EventArgs e)
        {
            // If first time visiting page, need to fire cascading event, in order
            // to set the dynamic lookupcode for this control.
            if (!string.IsNullOrEmpty(CascadeValuesBasedOn))
            {
                string oldVal = this.Value;
                OnObserveredSelectChange(this, new EventArgs());
                this.Value = oldVal;
            }
            base.OnPreRender(e);
        }

        /// <summary>
        /// Override DataBound to insert blank ListItem at index 0
        /// </summary>
        /// <param name="e"></param>
        protected override void OnDataBound(EventArgs e)
        {
            base.OnDataBound(e);
            if (this.Items.Count > 0 && this.ShowEmptyListItem)
            {
                ListItem emptyItem = new ListItem(String.Empty, String.Empty);
                if (!(this.Items[0].Text.Equals(String.Empty) && this.Items[0].Value.Equals(String.Empty)))
                {
                    this.Items.Insert(0, emptyItem);
                }
            }
        }

        protected override void Render(HtmlTextWriter w)
        {
            CICHelper.RenderFieldLabel(showLabel, fieldLabel, w, Required, showHelpBubble, helpDescription, labelClass);

            base.Render(w);
        }

        #region CASCADING EVENT HANDLERS

        public delegate void CascadeEventHandler(object sender, EventArgs e);
        public event CascadeEventHandler CascadeEvent;

        /// <summary>
        /// Fires when a change occurs on an observed control.
        /// If a user specified CascadeEvent is specified, it will fire.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        void OnObserveredSelectChange(object sender, EventArgs e)
        {
            FillRefList();
            if (this.CascadeEvent != null)
            {
                this.CascadeEvent(this, e);
            }
            else if (!string.IsNullOrEmpty(CascadeFormatString))
            {
                this.LocalCascade();
            }
        }

        /// <summary>
        /// If a CascadeFormatSting is specified, will format new LookupCode based on observed controls
        /// </summary>
        private void LocalCascade()
        {
            if (!string.IsNullOrEmpty(CascadeFormatString))
            {
                string[] tmpValues = new string[RefList.Count];
                RefList.Values.CopyTo(tmpValues, 0);

                if (tmpValues.Length > 0)
                {
                    LookupCode = GetFormattedString(CascadeFormatString, tmpValues);
                    LookupCode = LookupCode.Replace(" ", "");
                }
                if (!string.IsNullOrEmpty(LookupCode))
                {
                    this.DataSource = CacheManager.GetLookupCodeList(LookupCode).DefaultView;
                    this.DataTextField = BOL.LookupCode.LkpCode;
                    this.DataValueField = BOL.LookupCode.LkpCode;
                    this.DataBind();
                }
            }
        }

        #endregion

        #region CASCADE HELPERS

        /// <summary>
        /// Wires up controls in CascadeValuesBasedOn to fire when their values change
        /// </summary>
        private void WireEventsToObservedControls()
        {
            if (!string.IsNullOrEmpty(CascadeValuesBasedOn))
            {
                string[] ListOfFields = CascadeValuesBasedOn.Split(',');
                foreach (string ControlField in ListOfFields)
                {
                    string field = ControlField.Trim();
                    ICaisisInputControl iCIC = null;
                    bool isServerID = field.StartsWith("$") && field.Length > 1;
                    if (isServerID && this.NamingContainer != null)
                    {
                        string serverControlId = field.Substring(1, field.Length - 1);
                        iCIC = this.NamingContainer.FindControl(serverControlId) as ICaisisInputControl;
                    }
                    else
                    {
                        if (CaisisGridView.GetGridViewRowByControl(this) != null)
                        {
                            iCIC = PageUtil.DeepFindICaisisInputControl(CaisisGridView.GetGridViewRowByControl(this), field);
                        }
                        if (iCIC == null)
                        {
                            iCIC = PageUtil.DeepFindICaisisInputControl(this.Page, field);
                        }
                    }

                    if (iCIC != null)
                    {
                        reflist[field] = null;
                        if (iCIC is TextBox)
                        {
                            ((TextBox)iCIC).TextChanged += new EventHandler(OnObserveredSelectChange);
                            ((TextBox)iCIC).Attributes.Add("onblur", "var ele = event.srcElement || event.target; if(ele.value != this.defaultValue){ disIsDirty();this.form.submit(); }");
                        }
                        else if (iCIC is DropDownList)
                        {
                            ((DropDownList)iCIC).SelectedIndexChanged += new EventHandler(OnObserveredSelectChange);
                            ((DropDownList)iCIC).Attributes.Add("onchange", "disIsDirty();this.form.submit();");
                        }
                    }
                }
            }
        }

        /// <summary>
        /// Fills the RefList with values based on Observed controls
        /// </summary>
        private void FillRefList()
        {
            object[] FieldList = new object[RefList.Count];
            RefList.Keys.CopyTo(FieldList, 0);
            foreach (object fieldName in FieldList)
            {
                string key = fieldName.ToString();
                Control container;
                // IMPORTANT
                // Logic needs to be determined
                // Sometimes cascading will happen with control in same gridrow or control
                // in parent form, needs to be evaluated
                if ((container = CaisisGridView.GetGridViewRowByControl(this)) == null)
                {
                    container = this.Page;
                }
                ICaisisInputControl refControl = PageUtil.DeepFindICaisisInputControl(container, key);
                if (refControl == null)
                {
                    refControl = PageUtil.DeepFindICaisisInputControl(this.Page, key);
                }
                reflist[key] = refControl.Value;
            }
        }

        /// <summary>
        /// Formats strings to extract numbers out of strings
        /// </summary>
        /// <param name="orig"></param>
        /// <param name="parms"></param>
        /// <returns></returns>
        private string GetFormattedString(string orig, string[] parms)
        {
            for (int i = 0; i < parms.Length; i++)
            {
                if (orig.Contains("n." + i))
                {
                    orig = orig.Replace("n." + i, "" + i);
                    string preParse = parms[i];
                    string postParse = string.Join(null, System.Text.RegularExpressions.Regex.Split(preParse, "[^\\d]"));

                    int parsedNum;
                    if (!string.IsNullOrEmpty(postParse) && int.TryParse(postParse, out parsedNum))
                    {
                        parms[i] = postParse;
                    }
                    else
                    {
                        parms[i] = preParse;
                    }
                }
            }
            string postFormatted = string.Format(orig, parms);
            return postFormatted;
        }
        #endregion
    }

    /// <summary>
    /// A text-box based control which displays a drop down layer containing values based on Lookup Codes.
    /// These values are available for selction, but user is also enabled to enter custom values.
    /// Specify ReadOnly="true" to allow users to only enter pre-defined lookup code values.
    /// </summary>
    [DefaultProperty("CIC"), ToolboxData("<{0}:CaisisComboBox runat=server></{0}:CaisisComboBox>")]
    public class CaisisComboBox : TextBox, ICaisisInputControl, ICaisisLookupControl
    {
        protected string SearchDropDownImageSrc = "~/Images/icon_combo.png";
        protected string SearchDropDownReadOnlyImageSrc = "~/Images/icon_select.png";

        private string _refBy;
        private string _value;
        private string _tabIndex;
        private string _maxLength;
        private string _style;
        private bool _readOnly;
        private bool _disabled;

        #region private members
        private string table;
        private string field;
        private string fieldLabel;

        private bool required;
        private string lookupCode;
        private string lookupDistinct;
        private bool enabled;

        private bool showHelpBubble;
        private bool showLabel;
        private string labelClass;
        private string helpDescription;

        private string cascadeValuesBasedOn;
        private string cascadeFormatString;
        private string dropDownWidth;
        private string dropDownHeight;
        private bool showLookupDescription;

        private string staticComboData = string.Empty;
        #endregion

        /// <summary>
        /// An event signaling that the control's Value(text in TextBox) has changed during PostBack
        /// </summary>
        public event CaisisEventHandler ValueChanged;

        /// <summary>
        /// 
        /// </summary>
        public event CaisisEventHandler PreRender;

        #region combobox specific properties

        /// <summary>
        /// Gets or Sets the format of the Dynamic Lookup Code based on the values of fields in CascadeValuesBasedOn
        /// </summary>
        public string CascadeFormatString
        {
            get
            {
                return cascadeFormatString;
            }
            set
            {
                cascadeFormatString = value;
            }
        }

        /// <summary>
        /// Get or Set the comma-seperated-list of Fields in which to observe used in obtaining Dynamic Lookup Codes
        /// </summary>
        public string CascadeValuesBasedOn
        {
            get
            {
                return cascadeValuesBasedOn;
            }
            set
            {
                cascadeValuesBasedOn = value;
            }
        }

        public string LookupCode
        {
            get
            {
                return lookupCode;
            }
            set
            {
                lookupCode = value;
            }
        }

        public string LookupDistinct
        {
            get { return lookupDistinct; }
            set { lookupDistinct = value; }
        }

        #endregion

        #region Properties required to implement ICaisisInputControl
        /// <summary>
        /// Gets or sets the name of the Database Table corresponding to this control.
        /// </summary>
        public string Table
        {
            get { return table; }
            set { table = value; }
        }

        public string RefBy
        {
            get
            {
                return _refBy;
            }
            set
            {
                _refBy = value;
            }
        }

        /// <summary>
        /// Gets or sets the column name which maps to the Database Table specified by the "Table" property.
        /// </summary>
        public string Field
        {
            get { return field; }
            set { field = value; }
        }

        /// <summary>
        /// Gets or sets the text in the textbox.
        /// </summary>
        public string Value
        {
            get
            {
                return this.Text;
            }
            set
            {
                this.Text = value;

            }

        }

        public string TabIndex
        {
            get
            {
                return _tabIndex;
            }
            set
            {
                _tabIndex = value;
            }
        }

        /// <summary>
        /// Gets or sets the visibility of the control.
        /// </summary>
        public bool Visible
        {
            get { return base.Visible; }
            set { base.Visible = value; }
        }

        /// <summary>
        /// Gets or sets the text label for the textbox.
        /// </summary>
        public string FieldLabel
        {
            get { return fieldLabel; }
            set { fieldLabel = value; }
        }

        public bool ReadOnly
        {
            get
            {
                return _readOnly;
            }
            set
            {
                _readOnly = value;
            }
        }

        /// <summary>
        /// Gets or sets whether a value is requied for this control.
        /// </summary>
        public bool Required
        {
            get { return required; }
            set { required = value; }
        }

        /// <summary>
        /// Gets or sets whether a help description bubble should appear when mousing over
        /// this control's Field Label.
        /// </summary>
        public bool ShowHelpBubble
        {
            get { return showHelpBubble; }
            set { showHelpBubble = value; }
        }

        /// <summary>
        /// Gets or sets the help description shown in the help bubble, when the user mouse's over this control's Field Label.
        /// </summary>
        public string HelpDescription
        {
            get { return helpDescription; }
            set { helpDescription = value; }
        }

        /// <summary>
        /// Gets or sets whether to display the Field Label for this control.
        /// </summary>
        public bool ShowLabel
        {
            get { return showLabel; }
            set { showLabel = value; }
        }

        /// <summary>
        /// Gets or sets the class of just the Label, if not defined defaults to pdFormFieldLabel.
        /// </summary>
        public string LabelClass
        {
            get { return labelClass; }
            set { labelClass = value; }
        }

        /// <summary>
        /// Gets or sets whether the control's textbox is enabled.
        /// </summary>
        public bool Enabled
        {
            get
            {
                enabled = base.Enabled;
                return enabled;
            }
            set
            {
                base.Enabled = value;
                enabled = value;
            }
        }

        /// <summary>
        /// Gets or sets the inline width of the combo box dropdown.
        /// Specified as a valid CSS width (i.e. px,em,%)
        /// </summary>
        public string DropDownWidth
        {
            get
            {
                return dropDownWidth;
            }
            set
            {
                dropDownWidth = value;
            }
        }

        /// <summary>
        /// Gets or sets the inline height of the combo box dropdown.
        /// Specified as a valid CSS height (i.e. px,em,%)
        /// </summary>
        public string DropDownHeight
        {
            get
            {
                return dropDownHeight;
            }
            set
            {
                dropDownHeight = value;
            }
        }

        /// <summary>
        /// Gets or sets whether to show the LookupDescription on drop down options
        /// </summary>
        public bool ShowLookupDescription
        {
            get
            {
                return showLookupDescription;
            }
            set
            {
                showLookupDescription = value;
            }
        }

        #endregion

        public CaisisComboBox()
        {
            showLabel = true;
            ShowHelpBubble = true;
            showLookupDescription = true;

            // Attach EventHandler to handle CaisisEventHandler event
            this.TextChanged += (i, e) => OnValueChanged(this, e); ;
            base.PreRender += (i, e) => this.OnPreRender(this, e);
            // set max length during load
            base.Load += (i, e) => CICHelper.DefaultInputControlMaxLength(this);
            // before rendering, attach max length javascript
            base.PreRender += (a, b) => CICHelper.BuildInputControlMaxLengthScript(this);
        }

        protected override void OnInit(EventArgs e)
        {
            if (this.ID == null)
            {
                this.ID = Table + "_" + Field;
            }
            base.OnInit(e);
        }

        /// <summary>
        /// Add client event to Text Field
        /// </summary>
        /// <param name="eventName"></param>
        /// <param name="script"></param>
        public void OnClientEvent(string eventName, string script)
        {
            PageUtil.AttachClientEventToControl(this, eventName, script);
        }

        /// <summary>
        /// Builds a static datasource for the combo
        /// </summary>
        /// <param name="dataSource">The data source used to build combo items</param>
        /// <param name="textField">The column containing the text and value</param>
        /// <param name="descriptionField">the optional column containing the description</param>
        public void BuildComboData(System.Data.DataTable dataSource, string textField, string descriptionField)
        {
            string[] dataColumns = !string.IsNullOrEmpty(descriptionField) ? new string[] { textField, descriptionField } : new string[] { textField };
            staticComboData = PageUtil.DataTableToJSArray(dataSource, dataColumns, false);
        }

        /// <summary>
        /// Clears the static combo data.
        /// </summary>
        public void ClearComboData()
        {
            staticComboData = string.Empty;
        }

        protected override void OnLoad(EventArgs e)
        {
            // Dynamically set callback path
            string CallBackPath = "var LOOKCODES_CALLBACK_PATH = '" + PageUtil.GetBasePath(this.Page.Request) + "/Core/Utilities/AjaxCallBacks/LookupCodesCallBack.aspx" + "';";
            Page.ClientScript.RegisterClientScriptBlock(typeof(Page), "ComboCallBackPath", CallBackPath, true);
            base.OnLoad(e);
        }

        /// <summary>
        /// Occurs when the text box's value changes during posts
        /// </summary>
        /// <param name="iCIC"></param>
        /// <param name="e"></param>
        protected void OnValueChanged(ICaisisInputControl iCIC, EventArgs e)
        {
            if (ValueChanged != null)
            {
                ValueChanged(iCIC, e);
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="iCIC"></param>
        /// <param name="e"></param>
        protected void OnPreRender(ICaisisInputControl iCIC, EventArgs e)
        {
            if (PreRender != null)
            {
                PreRender(iCIC, e);
            }
        }

        protected override void Render(HtmlTextWriter w)
        {

            // If lookup code contains ";", it is distinct, but may not have 
            bool isDistinctLookup = !string.IsNullOrEmpty(LookupDistinct) ? true : false;
            string isDistinctString = isDistinctLookup.ToString().ToLower();
            string clientLookupCode = isDistinctLookup ? (string.IsNullOrEmpty(LookupDistinct) ? LookupCode : LookupDistinct) : LookupCode;
            clientLookupCode = clientLookupCode == null ? string.Empty : clientLookupCode;
            string dynamicLookup = "";
            string alwaysGetDynamic = "false";
            if (!string.IsNullOrEmpty(CascadeValuesBasedOn))
            {
                this.ReadOnly = true;
                dynamicLookup = GetDynamicLookupJavaScript();
                alwaysGetDynamic = "true";
            }
            else
            {
                clientLookupCode = clientLookupCode.Trim().Replace("'", @"\'");
                dynamicLookup = "'" + clientLookupCode + "'";
            }
            string dropDownResults = "showResultsDropDown(event,'" + this.ClientID + "'," + dynamicLookup + "," + isDistinctString + "," + alwaysGetDynamic + ", " + showLookupDescription.ToString().ToLower() + "," + (string.IsNullOrEmpty(staticComboData) ? "null" : staticComboData) + ");";
            string fetchResults = "fetchResults(event,'" + this.ClientID + "'," + dynamicLookup + "," + isDistinctString + "," + alwaysGetDynamic + ", " + showLookupDescription.ToString().ToLower() + "," + (string.IsNullOrEmpty(staticComboData) ? "null" : staticComboData) + ");";
            string handleSpecialKeys = "handleSpecialKeys(event,'" + this.ClientID + "');";
            string imageSrc = SearchDropDownImageSrc;

            if (this.Visible == true)
            {
                if (!string.IsNullOrEmpty(TabIndex))
                {
                    this.Attributes.Add("tabIndex", TabIndex);
                }

                CICHelper.RenderFieldLabel(showLabel, FieldLabel, w, Required, showHelpBubble, helpDescription, labelClass);
                Panel _dropDown = new Panel();
                _dropDown.ID = this.ClientID + "drop_down";
                _dropDown.CssClass = "ComboBoxResults";
                // Set inline width and height of dropdown is specified
                if (!string.IsNullOrEmpty(DropDownWidth))
                {
                    string computedCSSWidth = DropDownWidth;
                    if (!computedCSSWidth.Equals("auto", StringComparison.CurrentCultureIgnoreCase) && !computedCSSWidth.EndsWith("px"))
                    {
                        computedCSSWidth = computedCSSWidth + "px";
                    }
                    _dropDown.Style["width"] = computedCSSWidth;
                }
                if (!string.IsNullOrEmpty(DropDownHeight))
                {
                    string computedCSSHeight = DropDownHeight;
                    if (!computedCSSHeight.Equals("auto", StringComparison.CurrentCultureIgnoreCase) && !computedCSSHeight.EndsWith("px"))
                    {
                        computedCSSHeight = computedCSSHeight + "px";
                    }
                    _dropDown.Style["height"] = computedCSSHeight;
                }

                Image _dropDownImage = new Image();
                _dropDownImage.CssClass = "ComboWidget";
                _dropDownImage.ImageUrl = imageSrc;
                _dropDownImage.Style.Add(HtmlTextWriterStyle.VerticalAlign, "bottom");
                if (ReadOnly)
                {
                    _dropDownImage.ImageUrl = SearchDropDownReadOnlyImageSrc;
                    _dropDownImage.CssClass = "ComboWidget";

                    //this.CssClass = "pdComboBox";
                    // Uncomment next line if you want readonly combo
                    //this.OnClientEvent("onfocus", "this.blur();");
                }
                if (!ReadOnly || !string.IsNullOrEmpty(cascadeValuesBasedOn)) // Non-readonly fields and cascading fields
                {
                    this.OnClientEvent("onkeyup", fetchResults);
                    // on read-only, prevent entering of values
                    this.OnClientEvent("onkeydown", (ReadOnly ? "if(event.keyCode!=9) { return false; }" : "") + handleSpecialKeys);
                }
                if (!string.IsNullOrEmpty(TabIndex))
                {
                    this.Attributes.Add("tabIndex", TabIndex);
                }
                this.OnClientEvent("onclick", dropDownResults);
                _dropDownImage.Attributes.Add("onclick", dropDownResults);
                this.Attributes.Add("autocomplete", "off");
                //holder.Attributes.Add("onmouseout", "if (isMouseLeave(this,event)) { hideResults(this); };");
                base.Render(w);
                _dropDownImage.RenderControl(w);
                _dropDown.RenderControl(w);
            }
        }

        /// <summary>
        /// Obtain javascript list of fields/cliend-ids to get dynamic lookup on client.
        /// </summary>
        /// <returns></returns>
        private string GetDynamicLookupJavaScript()
        {
            string[] ListOfFields = CascadeValuesBasedOn.Split(',');
            int baseBufferLength = CascadeValuesBasedOn.Length * 3;
            System.Text.StringBuilder sb = new System.Text.StringBuilder(baseBufferLength);
            string lkpCode = PageUtil.EscapeSingleQuotes(this.LookupCode);
            sb.Append("getDynamicLookupCode('" + lkpCode + "',[");
            foreach (string fieldName in ListOfFields)
            {
                // clean whitespace
                string field = fieldName.Trim();
                Control observedControl;
                // special case where field is server control ID
                bool isServerID = field.StartsWith("$") && field.Length > 1;
                if (isServerID && this.NamingContainer != null)
                {
                    string serverControlId = field.Substring(1, field.Length - 1);
                    observedControl = this.NamingContainer.FindControl(serverControlId);
                }
                else
                {
                    observedControl = CaisisGridView.GetGridViewRowByControl(this);

                    if (observedControl != null)
                    {
                        observedControl = (Control)PageUtil.DeepFindICaisisInputControl(observedControl, field);
                        if (observedControl == null)
                        {
                            observedControl = (Control)PageUtil.DeepFindICaisisInputControl(this.Page, field);
                        }
                    }
                    else
                    {
                        observedControl = (Control)PageUtil.DeepFindICaisisInputControl(this.Page, field);

                    }
                }
                if (observedControl != null)
                {
                    string clientID = observedControl.ClientID;
                    string clientFieldName = observedControl is ICaisisInputControl ? (observedControl as ICaisisInputControl).Field : field;
                    sb.Append("['" + clientFieldName + "','" + clientID + "'],");
                }
            }
            if (sb[sb.Length - 1] == ',')
                sb = sb.Remove(sb.Length - 1, 1);
            sb.Append("],'" + CascadeFormatString + "')");

            return sb.ToString();
        }
    }


    // has not been tested anywhere. radio button list currenty used in eforms
    [DefaultProperty("CIC"), ToolboxData("<{0}:CaisisRadioButton runat=server></{0}:CaisisRadioButton>")]
    public class CaisisRadioButton : RadioButton, ICaisisInputControl
    {
        #region private members
        private string table;
        private string field;
        private string fieldLabel;
        private bool required;
        private bool enabled;

        private bool showHelpBubble;
        private bool showLabel;
        private string labelClass;
        private string helpDescription;
        private bool uncheckable;
        #endregion

        #region protected members
        protected Label inputFieldLabel;
        #endregion

        /// <summary>
        /// An event signaling that the control's Value(radiobutton check state) has changed during PostBack
        /// </summary>
        public event CaisisEventHandler ValueChanged;

        /// <summary>
        /// 
        /// </summary>
        public event CaisisEventHandler PreRender;

        #region Properties required to implement ICaisisInputControl
        /// <summary>
        /// Gets or sets the name of the Database Table corresponding to this control.
        /// </summary>
        public string Table
        {
            get { return table; }
            set { table = value; }
        }

        /// <summary>
        /// Gets or sets the column name which maps to the Database Table specified by the "Table" property.
        /// </summary>
        public string Field
        {
            get { return field; }
            set { field = value; }
        }


        public string Value // THIS PROBABLY NEEDS CORRECTION
        {
            get
            {
                return base.Text;
            }
            set
            {
                if (value.Equals(base.Text))
                {
                    base.Checked = true;
                }
            }
        }

        /// <summary>
        /// Gets or sets the visibility of the control.
        /// </summary>
        public bool Visible
        {
            get { return base.Visible; }
            set { base.Visible = value; }
        }

        /// <summary>
        /// Gets or sets the text label for the radio button.
        /// </summary>
        public string FieldLabel
        {
            get { return fieldLabel; }
            set { fieldLabel = value; }
        }

        /// <summary>
        /// Gets or sets whether a value is requied for this control.
        /// </summary>
        public bool Required
        {
            get { return required; }
            set { required = value; }
        }

        /// <summary>
        /// Gets or sets whether a help description bubble should appear when mousing over
        /// this control's Field Label.
        /// </summary>
        public bool ShowHelpBubble
        {
            get { return showHelpBubble; }
            set { showHelpBubble = value; }
        }

        /// <summary>
        /// Gets or sets the help description shown in the help bubble, when the user mouse's over this control's Field Label.
        /// </summary>
        public string HelpDescription
        {
            get { return helpDescription; }
            set { helpDescription = value; }
        }

        /// <summary>
        /// Gets or sets whether to display the Field Label for this control.
        /// </summary>
        public bool ShowLabel
        {
            get { return showLabel; }
            set { showLabel = value; }
        }

        /// <summary>
        /// Gets or sets the class of just the Label, if not defined defaults to pdFormFieldLabel.
        /// </summary>
        public string LabelClass
        {
            get { return labelClass; }
            set { labelClass = value; }
        }

        /// <summary>
        /// Gets or sets whether the radio button is enabled (selectable).
        /// </summary>
        public bool Enabled
        {
            get
            {
                enabled = base.Enabled;
                return enabled;
            }
            set
            {
                base.Enabled = value;
                enabled = value;
            }
        }

        public string CssClass
        {
            set { base.CssClass = value; }
        }

        /// <summary>
        /// Gets or sets if the radio button is uncheckable
        /// </summary>
        public bool Uncheckable
        {
            get
            {
                return uncheckable;
            }
            set
            {
                uncheckable = value;
            }
        }

        #endregion

        public CaisisRadioButton()
            : base()
        {
            showLabel = true;
            showHelpBubble = true;
            // default ability to uncheck
            this.uncheckable = false;

            // Attach EventHandler to handle CaisisEventHandler event
            this.CheckedChanged += (i, e) => OnValueChanged(this, e);
            base.PreRender += (i, e) => this.OnPreRender(this, e);
        }

        public void AddClientSideEventHandler(string eventName, string script)
        {
            if (eventName != "" && script != "")
            {
                base.Style.Add(eventName, script);
            }
        }

        protected override void OnInit(EventArgs e)
        {
            if (this.ID == null)
            {
                this.ID = Table + "_" + Field;
            }

            base.OnInit(e);
        }

        /// <summary>
        /// Occurs when the radio button's selected state has changed during posts
        /// </summary>
        /// <param name="iCIC"></param>
        /// <param name="e"></param>
        protected void OnValueChanged(ICaisisInputControl iCIC, EventArgs e)
        {
            if (ValueChanged != null)
            {
                ValueChanged(this, e);
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="iCIC"></param>
        /// <param name="e"></param>
        protected void OnPreRender(ICaisisInputControl iCIC, EventArgs e)
        {
            if (PreRender != null)
            {
                PreRender(iCIC, e);
            }
        }

        protected override void Render(HtmlTextWriter w)
        {
            CICHelper.RenderFieldLabel(showLabel, FieldLabel, w, Required, showHelpBubble, helpDescription, labelClass);
            // add helper script for uncheckable radio
            if (Uncheckable)
            {
                // important:  uncheckable scipt should happen 1st
                string clientEventName = "onclick";
                string uncheckScript = "handleUncheckableControl(this, event);";
                string currentOnClick = this.Attributes[clientEventName];
                if (!string.IsNullOrEmpty(currentOnClick))
                {
                    uncheckScript = uncheckScript + " " + currentOnClick;
                }
                this.Attributes[clientEventName] = uncheckScript;
            }
            base.Render(w);
        }
    }

    /// <summary>
    /// A list of radiobuttons bindable to LookupCodes
    /// </summary>
    [DefaultProperty("CIC"), ToolboxData("<{0}:CaisisRadioButtonList runat=server></{0}:CaisisRadioButtonList>")]
    public class CaisisRadioButtonList : RadioButtonList, ICaisisInputControl, ICaisisLookupControl
    {
        // internal representation of the RadioButtonList value
        private string _value;
        private bool showOther;
        private static string _otherListItemText = "Other";
        protected TextBox _otherTextBox = new TextBox();
        private string _otherFieldStyle;

        #region private instance members
        private string table;
        private string field;
        private string fieldLabel;
        private bool required;
        private bool showHelpBubble;
        private string helpDescription;
        private bool showLabel;
        private string labelClass;
        private bool enabled;
        private string lookupCode;
        private string lookupDistinct;
        private bool uncheckable;

        // default to null
        private bool showNumberPad;
        private bool showCalendar;
        private bool calcDate;
        private bool showTextEditor;
        #endregion

        /// <summary>
        /// An event signaling that the control's Value(selected radio button item) has changed during PostBack
        /// </summary>
        public event CaisisEventHandler ValueChanged;

        /// <summary>
        /// 
        /// </summary>
        public event CaisisEventHandler PreRender;

        public CaisisRadioButtonList()
            : base()
        {
            this.ShowOther = false;
            base.AppendDataBoundItems = true;
            this.uncheckable = false;

            // Attach EventHandler to handle CaisisEventHandler event
            this.SelectedIndexChanged += (i, e) => OnValueChanged(this, e);
            base.PreRender += (i, e) => this.OnPreRender(this, e);
        }


        public string Table
        {
            get
            {
                return table;
            }
            set
            {
                table = value;
            }
        }


        public string Field
        {
            get
            {
                return field;
            }
            set
            {
                field = value;
            }
        }

        /// <summary>
        /// Gets or sets the selected radio button.
        ///     get: If "Other" item is selected, returns the text box value.
        ///     set: If value is not in list of radio items, text box will represent value.
        /// </summary>
        public string Value
        {
            get
            {
                string returnValue = string.Empty;
                // normal .NET persistent
                if (this.SelectedItem != null)
                {
                    // if other item is selected, return textbox value
                    if (this.IsOtherSelected)
                    {
                        returnValue = this._otherTextBox.Text;
                    }
                    // otherwise return select item value
                    else
                    {
                        returnValue = this.SelectedValue;
                    }
                }// early call to get value
                else
                {
                    returnValue = this.ValueFromForm;
                }
                // normalize return value to empty string
                return returnValue != null ? returnValue : string.Empty;
            }
            set
            {
                // Search for value in current items
                foreach (ListItem item in this.Items)
                {
                    if (item != OtherListItem)
                    {
                        if (item.Value == value)
                        {
                            item.Selected = true;
                        }
                        else
                        {
                            item.Selected = false;
                        }
                    }
                }
                // If none selected, use other item to show value 
                if (this.SelectedItem == null && !string.IsNullOrEmpty(value))
                {
                    if (OtherListItem == null)
                    {
                        InsertOtherListItem();
                    }
                    OtherListItem.Selected = true;
                }
                // set other item values
                if (this.IsOtherSelected)
                {
                    // radio item, textbox and viewstate
                    OtherListItem.Value = value;
                    this._otherTextBox.Text = value;
                }
                // clear values if not set
                else if (OtherListItem != null)
                {
                    OtherListItem.Value = string.Empty;
                    this._otherTextBox.Text = string.Empty;
                }
                _value = value;
            }
        }

        /// <summary>
        /// Gets the "Other" List Item
        /// </summary>
        public ListItem OtherListItem
        {
            get
            {
                foreach (ListItem item in this.Items)
                {
                    if (item.Text == _otherListItemText)
                    {
                        return item;
                    }
                }
                return null;
            }
        }

        /// <summary>
        /// Gets if the Other List Item is selected
        /// </summary>
        private bool IsOtherSelected
        {
            get
            {
                if (OtherListItem != null)
                {
                    return OtherListItem.Selected;
                }
                else
                {
                    return false;
                }
            }
        }

        /// <summary>
        /// Gets the value for the textbox from the Form
        /// </summary>
        private string ValueFromForm
        {
            get
            {
                return !string.IsNullOrEmpty(POSTedRadioButtonValue) ? POSTedRadioButtonValue : POSTedTextBoxValue;
                //// return the POSTed value for the other textbox
                //return this.Page.Request[_otherTextBox.UniqueID];
            }
        }

        private string POSTedRadioButtonValue
        {
            get
            {
                return GetFormPOSTedValue(this.UniqueID);
            }
        }

        private string POSTedTextBoxValue
        {
            get
            {
                return GetFormPOSTedValue(_otherTextBox.UniqueID);
            }
        }

        public bool Visible
        {
            get
            {
                return base.Visible;
            }
            set
            {
                base.Visible = false;

            }
        }

        public string FieldLabel
        {
            get
            {
                return fieldLabel;
            }
            set
            {
                fieldLabel = value;
            }
        }

        /// <summary>
        /// Gets or sets the class of just the Label, if not defined defaults to pdFormFieldLabel.
        /// </summary>
        public string LabelClass
        {
            get { return labelClass; }
            set { labelClass = value; }
        }

        public bool Required
        {
            get
            {
                return required;
            }
            set
            {
                required = value;
            }
        }

        public bool ShowHelpBubble
        {
            get
            {
                return showHelpBubble;
            }
            set
            {
                showHelpBubble = value;
            }
        }

        public string HelpDescription
        {
            get
            {
                return helpDescription;
            }
            set
            {
                helpDescription = value;
            }
        }

        public bool ShowLabel
        {
            get
            {
                return showLabel;
            }
            set
            {
                showLabel = value;
            }
        }

        public bool Enabled
        {
            get
            {
                return base.Enabled;
            }
            set
            {
                base.Enabled = value;
            }
        }

        private bool readOnly = false;
        public bool ReadOnly
        {
            get
            {
                return readOnly;
            }
            set
            {
                readOnly = value;
            }
        }

        public string CssClass
        {
            get
            {
                return base.CssClass;
            }
            set
            {
                base.CssClass = value;
            }
        }

        public string LookupCode
        {
            get
            {
                return lookupCode;
            }
            set
            {
                lookupCode = value;
            }
        }

        public string LookupDistinct
        {
            get
            {
                return lookupDistinct;
            }
            set
            {
                lookupDistinct = value;
            }
        }

        public string CascadeValuesBasedOn
        {
            get
            {
                return "";
            }
            set
            {

            }
        }

        public string CascadeFormatString
        {
            get
            {
                return "";
            }
            set
            {

            }
        }

        public bool ShowEmptyListItem
        {
            get
            {
                return false;
            }
            set
            {

            }
        }

        /// <summary>
        /// Gets or sets whether to Show the "Other" List Item
        /// </summary>
        public bool ShowOther
        {
            get
            {
                return showOther;
            }
            set
            {
                showOther = value;
            }
        }

        /// <summary>
        /// Gets or sets the inline styles of the Other Item TextBox
        /// as key values pairs sepearated by ";", "key:value;"
        /// </summary>
        public string OtherFieldStyle
        {
            get
            {
                return _otherFieldStyle;
            }
            set
            {
                _otherFieldStyle = value;
            }
        }

        /// <summary>
        /// Gets or sets if values of list items are uncheckable
        /// </summary>
        public bool Uncheckable
        {
            get
            {
                return uncheckable;
            }
            set
            {
                uncheckable = value;
            }
        }

        /// <summary>
        /// Gets the form posted value
        /// </summary>
        /// <param name="key"></param>
        /// <returns></returns>
        private string GetFormPOSTedValue(string key)
        {
            if (this.Page != null && this.Page.Request != null)
            {
                return this.Page.Request.Form[key];
            }
            else
            {
                return string.Empty;
            }
        }

        /// <summary>
        /// When control is initalized, initalize a unique key used for accessing
        /// over Other Text Box's form value
        /// </summary>
        /// <param name="e"></param>
        protected override void OnInit(EventArgs e)
        {
            base.OnInit(e);
            // set id of other textbox for tracking during posts
            _otherTextBox.ID = this.UniqueID + "OtherTextBox";

            // Set internal _value of radio button list
            // on PostBacks
            //if (Page.IsPostBack)
            //{


            //    if (ValueFromForm != null)
            //    {
            //        _value = ValueFromForm;
            //    }
            //}

            // Bind to Lookup Codes
            if (!string.IsNullOrEmpty(this.LookupDistinct))
            {
                CICHelper.HandleLookupDistinctAttribute(this, lookupDistinct, this.Page.Session);
                this.EnableViewState = true;
            }
            else if (!string.IsNullOrEmpty(this.LookupCode))
            {
                this.DataTextField = BOL.LookupCode.LkpCode;
                this.DataValueField = BOL.LookupCode.LkpCode;
                this.DataSource = CacheManager.GetLookupCodeList(this.LookupCode);
                this.DataBind();
            }
        }

        protected override bool LoadPostData(string postDataKey, NameValueCollection postCollection)
        {
            // call base functionality
            bool raiseEvent = base.LoadPostData(postDataKey, postCollection);
            // during posts, set the other textbox value with form data

            // actual radio button list POSTed value
            string postedRadioValue = postCollection[this.UniqueID];
            // textbox POSTed value
            string postedTextValue = postCollection[_otherTextBox.UniqueID];
            // textbox "previous" value, used to track value changes
            object viewStateTextValue = this.ViewState["TextBoxValue"];
            // other textbox will persists value from FORM
            _otherTextBox.Text = postedTextValue;

            // check if radio posted value (if item checked)
            if (!string.IsNullOrEmpty(postedRadioValue))
            {
                // if textbox value was original set, check if value changed
                if (viewStateTextValue != null && postedTextValue != null)
                {
                    string prevTextValue = viewStateTextValue.ToString();
                    // if textbox value changed during posts
                    bool textBoxChanged = prevTextValue != postedTextValue;
                    // if the posted value = prev textbox value 
                    if (postedRadioValue == prevTextValue)
                    {
                        // set value of textbox as current "Value"
                        if (textBoxChanged)
                        {
                            this.Value = postedTextValue;
                            // raise value change
                            raiseEvent = true;
                        }
                    }
                    else if (textBoxChanged)
                    {
                        this.Value = postedTextValue;
                        // raise value change
                        raiseEvent = true;
                    }
                }
            }
            // otherwise, check textbox posted value
            else if (!string.IsNullOrEmpty(postedTextValue))
            {
                if (viewStateTextValue.ToString() != postedTextValue)
                {
                    this.Value = postedTextValue;
                    // raise value change
                    raiseEvent = true;
                }
            }
            return raiseEvent;
        }

        protected override void OnLoad(EventArgs e)
        {
            base.OnLoad(e);
            if (OtherListItem == null)
            {
                InsertOtherListItem();
            }
            //if (Page.IsPostBack)
            //{
            //    if (ValueFromForm != null)
            //    {
            //        this.Value = ValueFromForm;
            //    }
            //}
        }

        /// <summary>
        /// Add "Other" List Item when bound to Lookup Code/DataSource
        /// </summary>
        /// <param name="e"></param>
        protected override void OnDataBound(EventArgs e)
        {
            base.OnDataBound(e);
            if (OtherListItem == null)
            {
                InsertOtherListItem();
            }
        }

        protected override void OnPreRender(EventArgs e)
        {
            base.OnPreRender(e);
            // before rendering, track text value for post back changes
            //if (!IsOtherSelected)
            //{
            //    _otherTextBox.Text = string.Empty;
            //}
            this.ViewState["TextBoxValue"] = _otherTextBox.Text;
        }

        /// <summary>
        /// Occurs when the selected indexes of the list change during posts
        /// </summary>
        /// <param name="iCIC"></param>
        /// <param name="e"></param>
        protected void OnValueChanged(ICaisisInputControl iCIC, EventArgs e)
        {
            if (ValueChanged != null)
            {
                ValueChanged(iCIC, e);
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="iCIC"></param>
        /// <param name="e"></param>
        protected void OnPreRender(ICaisisInputControl iCIC, EventArgs e)
        {
            if (PreRender != null)
            {
                PreRender(iCIC, e);
            }
        }

        /// <summary>
        /// Render Text box for "Other" selectio, as well as hidden field, used to
        /// track value during post backs.
        /// </summary>
        /// <param name="writer"></param>
        protected override void Render(HtmlTextWriter writer)
        {
            CICHelper.RenderFieldLabel(ShowLabel, FieldLabel, writer, Required, ShowHelpBubble, HelpDescription, labelClass);
            base.Render(writer);
        }

        /// <summary>
        /// Controls rendering of List Items, Other List Item has special rendering
        /// </summary>
        /// <param name="itemType"></param>
        /// <param name="repeatIndex"></param>
        /// <param name="repeatInfo"></param>
        /// <param name="writer"></param>
        protected override void RenderItem(ListItemType itemType, int repeatIndex, RepeatInfo repeatInfo, HtmlTextWriter writer)
        {
            // add required scripts for uncheckable radios
            if (Uncheckable)
            {
                ListItem renderItem = this.Items[repeatIndex];
                string uncheckScript = "handleUncheckableControl(this, event);";
                renderItem.Attributes["onclick"] = uncheckScript;
            }
            if (this.Items[repeatIndex] == OtherListItem)
            {
                // adjust value if needed
                if (OtherListItem != null && !IsOtherSelected)
                {
                    OtherListItem.Value = string.Empty;
                }

                _otherTextBox.Style["margin-left"] = "10px";

                // Enable client events, only when control is enabled
                _otherTextBox.Enabled = this.Enabled;
                // when enabled attach script for checkbox last radio on foucs
                if (this.Enabled)
                {
                    string[] itemTextArray = new string[this.Items.Count];
                    for (int i = 0; i < this.Items.Count; i++)
                    {
                        ListItem item = this.Items[i];
                        string key = PageUtil.EscapeSingleQuotes(OtherListItem == item ? _otherListItemText : item.Text);
                        string value = PageUtil.EscapeSingleQuotes(OtherListItem == item ? _otherListItemText : item.Value);
                        itemTextArray[i] = "['" + key + "','" + value + "']";
                    }
                    string jsArray = "[" + string.Join(",", itemTextArray) + "]";

                    // Register client events to other text box
                    string _checkOtherItemEvent = "checkOtherItem('" + this.ClientID + "'," + jsArray + ", this, event);";
                    PageUtil.AttachClientEventToControl(_otherTextBox, "onclick", _checkOtherItemEvent);
                    PageUtil.AttachClientEventToControl(_otherTextBox, "onfocus", _checkOtherItemEvent);

                    //_otherTextBox.Attributes.Add("onclick", "document.getElementById('" + this.ClientID + "').getElementsByTagName('input')[" + (this.Items.Count - 1) + "].checked = true;");
                    //_otherTextBox.Attributes.Add("onkeyup", "document.getElementById('" + this.ClientID + "').getElementsByTagName('input')[" + (this.Items.Count - 1) + "].value = this.value");
                }
                if (OtherListItem != null)
                {
                    // during render, other textbox will displayed text will always match other item value
                    _otherTextBox.Text = OtherListItem.Value;
                }
                // Only render "Other" item if ShowOther=true or if OtherItem
                // is selected (in cases where values don't exist in the default ListItems)
                if (ShowOther || IsOtherSelected)
                {
                    PageUtil.SetInlineControlStyles(_otherTextBox, OtherFieldStyle);
                    base.RenderItem(itemType, repeatIndex, repeatInfo, writer);
                    _otherTextBox.RenderControl(writer);
                }
            }
            else
            {
                base.RenderItem(itemType, repeatIndex, repeatInfo, writer);
            }
        }

        /// <summary>
        /// Helper method to insert "Other" List Item
        /// </summary>
        private void InsertOtherListItem()
        {
            int insertIndex = this.Items.Count;
            ListItem otherItem = new ListItem(_otherListItemText, !string.IsNullOrEmpty(POSTedTextBoxValue) ? POSTedTextBoxValue : string.Empty);
            this.Items.Insert(insertIndex, otherItem);
        }
    }

    /// <summary>
    /// 
    /// </summary>
    [DefaultProperty("CIC"), ToolboxData("<{0}:CaisisCheckBoxList runat=server></{0}:CaisisCheckBoxList>")]
    public class CaisisCheckBoxList : CheckBoxList, ICaisisInputControl, ICaisisLookupControl
    {
        #region private instance members
        private string table;
        private string field;
        private string fieldLabel;
        private bool required;
        private bool showHelpBubble;
        private string helpDescription;
        private bool showLabel;
        private bool enabled;
        private string labelClass;
        private string lookupCode;
        private string lookupDistinct;
        private bool showOther;

        private bool mutuallyExclusive;
        private bool dropDown;
        private Unit dropDownTextWidth;
        private Unit dropDownTextHeight;
        private string dropDownTextCssClass;
        private int maxLength;

        // default to null
        private bool showNumberPad;
        private bool showCalendar;
        private bool calcDate;
        private bool showTextEditor;
        #endregion

        private static readonly string CHECKBOX_DROPDOWN_IMAGE_SRC = "~/Images/icon_combo.png";

        /// <summary>
        /// An event signaling the Value(selected items changed) of the control has changed during PostBack
        /// </summary>
        public event CaisisEventHandler ValueChanged;

        /// <summary>
        /// 
        /// </summary>
        public event CaisisEventHandler PreRender;


        #region expanded checkboxlist specific instance members
        protected string _uniqueTextBoxKey;

        protected TextBox _otherListItemTextBox = new TextBox();
        protected string _uniqueHiddenFieldKey;
        private string _internalValue;
        private static string _otherListItemText = "Other";
        private string _clientUpdateScript;
        private string _otherFieldStyle;
        #endregion

        public CaisisCheckBoxList()
            : base()
        {
            showOther = false;
            showLabel = true;
            showHelpBubble = true;
            mutuallyExclusive = false;
            dropDown = false;
            // default max length (0=no restriction)
            maxLength = 0;
            base.AppendDataBoundItems = true;

            // Attach EventHandler to handle CaisisEventHandler event
            this.SelectedIndexChanged += (i, e) => OnValueChanged(this, e);
            base.PreRender += (i, e) => this.OnPreRender(this, e);
            // set max length during load
            base.Load += (i, e) => CICHelper.DefaultInputControlMaxLength(this);
        }

        #region Public Properties

        public string Table
        {
            get
            {
                return table;
            }
            set
            {
                table = value;
            }
        }


        public string Field
        {
            get
            {
                return field;
            }
            set
            {
                field = value;
            }
        }

        /// <summary>
        /// Gets or sets the "Value" of our control
        /// I/O is a comma seperated list
        /// </summary>
        public string Value
        {
            get
            {
                // return a comma seperate list of checked item values
                var selectedValues = from item in this.Items.Cast<ListItem>()
                                     // only include selected items
                                     where item.Selected
                                     // get item value, "Other" item value is represented by textbox
                                     let selectedValue = item == OtherListItem ? _otherListItemTextBox.Text : item.Value
                                     // only select values which are non empty
                                     where !string.IsNullOrEmpty(selectedValue)
                                     select selectedValue;
                // create CSV
                string cbListValue = string.Join(",", selectedValues.ToArray());
                return cbListValue;                 
            }
            set
            {
                // create list of distinct values
                var splitValues = value.Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries).Distinct();
                // a list of values which have been set
                List<string> setValues = new List<string>();

                foreach (ListItem item in this.Items)
                {
                    // Only need to search non-Other items
                    if (item != OtherListItem)
                    {
                        // if item's value exists, check, otherwise uncheck
                        if (splitValues.Contains(item.Value))
                        {
                            item.Selected = true;
                            // track set values
                            setValues.Add(item.Value);
                        }
                        else
                        {
                            item.Selected = false;
                        }
                    }
                }
                // get a list of left over values which haven't been assigned
                var otherValues = splitValues.Except(setValues);
                string otherValue = string.Join(",", otherValues.ToArray());

                // if there are left over items, check Other item
                if (otherValues.Count() > 0)
                {
                    SetOtherListItem();
                    OtherListItem.Selected = true;
                }
                else if (OtherListItem != null)
                {
                    OtherListItem.Selected = false;
                    OtherListItem.Value = string.Empty;
                }
                // ensure other checkbox/textbox values
                SetOtherListItemValue(otherValue);
                SetInternalValue(string.Join(",", splitValues.ToArray()));
            }
        }

        /// <summary>
        /// Gets or sets the array of values(strings) for this control
        /// </summary>
        public string[] ValueList
        {
            get
            {
                return Value.Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries);
            }
            set
            {
                this.Value = string.Join(",", value);
            }
        }

        /// <summary>
        /// Gets or sets whether to Show the "Other" List Item
        /// </summary>
        public bool ShowOther
        {
            get
            {
                return showOther;
            }
            set
            {
                showOther = value;
            }
        }

        public bool Visible
        {
            get
            {
                return base.Visible;
            }
            set
            {
                base.Visible = false;

            }
        }

        public string FieldLabel
        {
            get
            {
                return fieldLabel;
            }
            set
            {
                fieldLabel = value;
            }
        }

        /// <summary>
        /// Gets or sets the class of just the Label, if not defined defaults to pdFormFieldLabel.
        /// </summary>
        public string LabelClass
        {
            get { return labelClass; }
            set { labelClass = value; }
        }

        public bool Required
        {
            get
            {
                return required;
            }
            set
            {
                required = value;
            }
        }

        public bool ShowHelpBubble
        {
            get
            {
                return showHelpBubble;
            }
            set
            {
                showHelpBubble = value;
            }
        }

        public string HelpDescription
        {
            get
            {
                return helpDescription;
            }
            set
            {
                helpDescription = value;
            }
        }

        public bool ShowLabel
        {
            get
            {
                return showLabel;
            }
            set
            {
                showLabel = value;
            }
        }

        public bool Enabled
        {
            get
            {
                return base.Enabled;
            }
            set
            {
                base.Enabled = value;
            }
        }

        private bool readOnly = false;
        public bool ReadOnly
        {
            get
            {
                return readOnly;
            }
            set
            {
                readOnly = value;
            }
        }

        public string CssClass
        {
            get
            {
                return base.CssClass;
            }
            set
            {
                base.CssClass = value;
            }
        }


        public string LookupCode
        {
            get
            {
                return lookupCode;
            }
            set
            {
                lookupCode = value;
            }
        }

        public string LookupDistinct
        {
            get
            {
                return lookupDistinct;
            }
            set
            {
                lookupDistinct = value;
            }
        }

        public string CascadeValuesBasedOn
        {
            get
            {
                return "";
            }
            set
            {

            }
        }

        public string CascadeFormatString
        {
            get
            {
                return "";
            }
            set
            {

            }
        }

        /// <summary>
        /// Gets or sets the inline styles of the Other Item TextBox
        /// as key values pairs sepearated by ";", "key:value;"
        /// </summary>
        public string OtherFieldStyle
        {
            get
            {
                return _otherFieldStyle;
            }
            set
            {
                _otherFieldStyle = value;
            }
        }

        /// <summary>
        /// Gets or sets whether checkboxes are mutually exclusive (default: false)
        /// </summary>
        public bool MutuallyExclusive
        {
            get
            {
                return mutuallyExclusive;
            }
            set
            {
                mutuallyExclusive = value;
            }
        }

        /// <summary>
        /// Gets or sets whether the list is displayed as a label and values set in dropdown list
        /// </summary>
        public bool DropDown
        {
            get
            {
                return dropDown;
            }
            set
            {
                dropDown = value;
            }
        }

        /// <summary>
        /// Gets or sets the Width of the textbox rendered when using DropDown="true"
        /// </summary>
        public Unit DropDownTextWidth
        {
            get
            {
                return dropDownTextWidth;
            }
            set
            {
                dropDownTextWidth = value;
            }
        }

        /// <summary>
        /// Gets or sets the Height of the textbox rendered when using DropDown="true"
        /// </summary>
        public Unit DropDownTextHeight
        {
            get
            {
                return dropDownTextHeight;
            }
            set
            {
                dropDownTextHeight = value;
            }
        }

        /// <summary>
        /// Gets or sets the css class attribute of the textbox rendered when using DropDown="true"
        /// </summary>
        public string DropDownTextCssClass
        {
            get
            {
                return dropDownTextCssClass;
            }
            set
            {
                dropDownTextCssClass = value;
            }
        }

        #endregion

        #region Private Properties

        /// <summary>
        /// Gets the "Other" List Item
        /// </summary>
        public ListItem OtherListItem
        {
            get
            {
                // The OtherListItem
                if (this.Items.Count > 0)
                {
                    int lastItemIndex = this.Items.Count - 1;
                    ListItem lastItem = this.Items[lastItemIndex];
                    if (lastItem.Text == _otherListItemText)
                    {
                        return lastItem;
                    }
                }
                return null;
            }
        }

        /// <summary>
        /// Gets if the Other List Item is selected
        /// </summary>
        private bool IsOtherSelected
        {
            get
            {
                if (OtherListItem != null)
                {
                    return OtherListItem.Selected;
                }
                else
                {
                    return false;
                }
            }
        }

        /// <summary>
        /// Gets or sets the max length of the value represented by this field
        /// </summary>
        public int MaxLength
        {
            get
            {
                return maxLength;
            }
            set
            {
                maxLength = value;
            }
        }

        private string POSTedTextBoxValue
        {
            get
            {
                return GetFormPOSTedValue(_uniqueHiddenFieldKey);
            }
        }
        #endregion

        /// <summary>
        /// Gets the form posted value
        /// </summary>
        /// <param name="key"></param>
        /// <returns></returns>
        private string GetFormPOSTedValue(string key)
        {
            if (this.Page != null && this.Page.Request != null)
            {
                return this.Page.Request.Form[key];
            }
            else
            {
                return string.Empty;
            }
        }

        /// <summary>
        /// When control is initalized, initalize a unique key used for accessing
        /// over Other Text Box's form value
        /// </summary>
        /// <param name="e"></param>
        protected override void OnInit(EventArgs e)
        {
            base.OnInit(e);
            // Set Unique Keys used for getting form variable during posts
            SetUniqueKeys();


            //When page is initalized, check form values and set interval
            if (this.Page.Request.Form[this._uniqueHiddenFieldKey] != null)
            {                
                SetInternalValue(this.Page.Request.Form[this._uniqueHiddenFieldKey]);
                this.Value = this._internalValue;
            }

            // init checkbox value
            this._otherListItemTextBox.Text = POSTedTextBoxValue;
            if (this.Items.Count > 0)
            {
                SetOtherListItem();
            }
            // Bind to Lookup Codes
            if (!string.IsNullOrEmpty(this.LookupDistinct))
            {
                CICHelper.HandleLookupDistinctAttribute(this, lookupDistinct, this.Page.Session);
                this.EnableViewState = true;
            }
            else if (!string.IsNullOrEmpty(this.LookupCode))
            {
                this.DataTextField = BOL.LookupCode.LkpCode;
                this.DataValueField = BOL.LookupCode.LkpCode;
                this.DataSource = CacheManager.GetLookupCodeList(this.LookupCode);
                this.DataBind();
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="e"></param>
        protected override void OnLoad(EventArgs e)
        {
            base.OnLoad(e);
            this.SetOtherListItem();

            if (Page.IsPostBack && _internalValue != null)
            {
                SetInternalValue(_internalValue);
                this.Value = _internalValue;
            }
        }


        /// <summary>
        /// Add "Other" List Item when bound to Lookup Code DataSource
        /// </summary>
        /// <param name="e"></param>
        protected override void OnDataBound(EventArgs e)
        {
            base.OnDataBound(e);
            this.SetOtherListItem();
        }

        /// <summary>
        /// Occurs when the selected value of the list change during posts
        /// </summary>
        /// <param name="iCIC"></param>
        /// <param name="e"></param>
        protected void OnValueChanged(ICaisisInputControl iCIC, EventArgs e)
        {
            if (ValueChanged != null)
            {
                ValueChanged(iCIC, e);
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="iCIC"></param>
        /// <param name="e"></param>
        protected void OnPreRender(ICaisisInputControl iCIC, EventArgs e)
        {
            if (PreRender != null)
            {
                PreRender(iCIC, e);
            }
        }

        protected override void OnPreRender(EventArgs e)
        {
            base.OnPreRender(e);
            // determine if checkboxes are mutually exclusive
            if (this.MutuallyExclusive)
            {
                PageUtil.AttachClientEventToControl(this, "onclick", "handleMutalCheckBoxList('" + this.ClientID + "',event);");
            }

            _otherListItemTextBox.ID = _uniqueTextBoxKey;
            this.RegisterClientSciptAndUIEvents();
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="writer"></param>
        protected override void Render(HtmlTextWriter writer)
        {
            CICHelper.RenderFieldLabel(ShowLabel, FieldLabel, writer, Required, ShowHelpBubble, HelpDescription, labelClass);
            HtmlInputHidden _hiddenValueHolder = new HtmlInputHidden();
            _hiddenValueHolder.ID = _uniqueHiddenFieldKey;
            _hiddenValueHolder.Value = this.Value;

            Panel dropDownContainer = null;

            // determine if displaying as Label
            if (dropDown)
            {
                // init container
                dropDownContainer = new Panel();
                dropDownContainer.CssClass = "CheckBoxListLayerContainer";

                // create textbox to display csv value
                TextBox cbLabel = new TextBox();
                cbLabel.Enabled = false;
                cbLabel.ID = this.ClientID + "Label";
                cbLabel.ToolTip = this.Value;
                cbLabel.Text = this.Value;

                // set textbox related styling
                if (this.DropDownTextWidth != null && !this.DropDownTextWidth.IsEmpty)
                {
                    cbLabel.Width = this.DropDownTextWidth;
                }
                if (this.DropDownTextHeight != null && !this.DropDownTextHeight.IsEmpty)
                {
                    cbLabel.Height = this.DropDownTextHeight;
                }
                if (!string.IsNullOrEmpty(this.DropDownTextCssClass))
                {
                    cbLabel.CssClass = this.DropDownTextCssClass;
                }
                else
                {
                    cbLabel.CssClass = "CheckBoxListLabel";
                }
                // REQUIRED to place layer on top of text box !!
                cbLabel.Style["z-index"] = "100";
                this.Style["z-index"] = "101";

                // create img to click, and attach events
                Image cbImg = new Image();
                cbImg.ImageUrl = CHECKBOX_DROPDOWN_IMAGE_SRC;
                cbImg.CssClass = "CheckBoxListDropDown";
                string cbLayerId = this.ClientID;
                string cbLabelId = cbLabel.ID;
                dropDownContainer.Attributes["onmouseout"] = string.Format("hideEnhancedCheckBoxList('{0}','{1}',event);", cbLayerId, cbLabelId);
                cbImg.Attributes["onclick"] = string.Format("showEnhancedCheckBoxList('{0}','{1}',event);", cbLayerId, cbLabelId);

                // if no css class specified for list, use default style
                if (string.IsNullOrEmpty(CssClass))
                {
                    this.CssClass = "CheckBoxListLayer";
                }
                // otherwise use user selected css class, and add POSITION: ABSOLUTE
                else
                {
                    this.Style["position"] = "absolute";
                }

                // render helper controls
                cbLabel.RenderControl(writer);               
                cbImg.RenderControl(writer);
            }
            if (dropDown)
            {
                dropDownContainer.RenderBeginTag(writer);
                base.Render(writer);
                dropDownContainer.RenderEndTag(writer);
            }
            else
            {
                base.Render(writer);
            }
            _hiddenValueHolder.RenderControl(writer);
        }

        /// <summary>
        /// When rendering last item, we need to render the Text Box to show the other Value
        /// </summary>
        /// <param name="itemType"></param>
        /// <param name="repeatIndex"></param>
        /// <param name="repeatInfo"></param>
        /// <param name="writer"></param>
        protected override void RenderItem(ListItemType itemType, int repeatIndex, RepeatInfo repeatInfo, HtmlTextWriter writer)
        {
            int lastIndex = this.Items.Count - 1;
            // If we're at the Other List Item, handle special rendering
            // else, render List Item as normal
            if (repeatIndex == lastIndex && this.Items[repeatIndex] == OtherListItem)
            {
                _otherListItemTextBox.Enabled = this.Enabled;
                _otherListItemTextBox.Style["margin-left"] = "10px";

                if (IsOtherSelected)
                {
                    _otherListItemTextBox.Text = OtherListItem.Value;
                }
                // Only render Other Item and TextBox when ShowOther is true
                // or when a value is not contained in other Items
                if (ShowOther || OtherListItem.Value != String.Empty)
                {
                    PageUtil.SetInlineControlStyles(_otherListItemTextBox, OtherFieldStyle);
                    base.RenderItem(itemType, repeatIndex, repeatInfo, writer);
                    _otherListItemTextBox.RenderControl(writer);
                }
            }
            else
            {
                base.RenderItem(itemType, repeatIndex, repeatInfo, writer);
            }
        }

        #region Helper Methods

        /// <summary>
        /// Sets unique keys which are used for ID's of Hidden Field and Other Field TextBox
        /// </summary>
        private void SetUniqueKeys()
        {
            this._uniqueTextBoxKey = this.ClientID + "HiddenKey";
            this._uniqueHiddenFieldKey = this.ClientID + "TextBoxKey";
        }

        /// <summary>
        /// Sets the internal value removing trailing ","
        /// </summary>
        /// <param name="val"></param>
        private void SetInternalValue(string val)
        {
            string[] trueValues = val.Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries);
            SetInternalValue(trueValues);
        }

        /// <summary>
        /// Sets the internal value removing trailing ","
        /// </summary>
        /// <param name="valList"></param>
        private void SetInternalValue(string[] valList)
        {
            _internalValue = string.Join(",", valList);
        }

        /// <summary>
        /// Checks if the current list of items contains the Other Item.
        /// If it exists, make sure it is at last index, else insert at end of list.
        /// </summary>
        private void SetOtherListItem()
        {
            ListItem otherListItem = null;
            int lastIndex = this.Items.Count - 1;
            // Find the "Other" List item in the list
            foreach (ListItem item in this.Items)
            {
                if (item.Text == _otherListItemText)
                {
                    otherListItem = item;
                    break;
                }
            }
            // If Other Item is found, set correct position
            // else create empty item
            if (otherListItem != null)
            {
                // If other item is not in last position, remove item
                // else, the Other Item is in the last position
                if (this.Items[lastIndex] != otherListItem)
                {
                    this.Items.Remove(otherListItem);
                }
                else
                {
                    return;
                }
            }
            else
            {
                otherListItem = new ListItem(_otherListItemText, string.Empty);
            }
            otherListItem.Value = _otherListItemTextBox.Text;
            // Insert of Other Item into the list
            InsertOtherListItem(otherListItem);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="otherValue"></param>
        private void SetOtherListItemValue(string otherValue)
        {
            if (OtherListItem != null)
            {
                OtherListItem.Value = otherValue;
            }
            _otherListItemTextBox.Text = otherValue;
        }

        /// <summary>
        /// Helper method to insert "Other" List Item
        /// </summary>
        private void InsertOtherListItem(ListItem otherItem)
        {
            int insertIndex = this.Items.Count;
            this.Items.Insert(insertIndex, otherItem);
        }

        /// <summary>
        /// Registers a helper function which is used for populate the HiddenField (which tracks our CSV)
        /// </summary>
        private void RegisterClientSciptAndUIEvents()
        {

            // Set update function used to update Hidden Field
            string[] itemTextArray = new string[this.Items.Count];
            for (int i = 0; i < this.Items.Count; i++)
            {
                ListItem item = this.Items[i];
                string key = PageUtil.EscapeSingleQuotes(OtherListItem == item ? _otherListItemText : item.Text);
                string value = PageUtil.EscapeSingleQuotes(OtherListItem == item ? _otherListItemText : item.Value);
                itemTextArray[i] = "['" + key + "','" + value + "']";
                //itemTextArray[i] = "'" + value + "'";
            }
            string jsArray = "[" + string.Join(",", itemTextArray) + "]";

            // Register this event on our checkbox list, will also be used in Other textbox
            string cbLabelId = this.ClientID + "Label";
            _clientUpdateScript = "return updateEnhancedCheckBoxList('" + this.ClientID + "','" + _uniqueTextBoxKey + "','" + _uniqueHiddenFieldKey + "','" + cbLabelId + "'," + jsArray + "," + (maxLength == 0 ? "null" : maxLength.ToString()) + ");";

            PageUtil.AttachClientEventToControl(this, "onclick", _clientUpdateScript);
            // Register client events to other text box
            string _checkOtherItemEvent = "checkOtherItem('" + this.ClientID + "'," + jsArray + ", this, event);";
            PageUtil.AttachClientEventToControl(_otherListItemTextBox, "onclick", _checkOtherItemEvent);
            PageUtil.AttachClientEventToControl(_otherListItemTextBox, "onfocus", _checkOtherItemEvent);
            PageUtil.AttachClientEventToControl(_otherListItemTextBox, "onkeyup", _clientUpdateScript);
        }
        #endregion
    }

    /// <summary>
    /// A checkbox used to represent bit-fields (0/1).
    /// </summary>
    [DefaultProperty("CIC"), ToolboxData("<{0}:CaisisCheckBox runat=server></{0}:CaisisCheckBox>")]
    public class CaisisCheckBox : CheckBox, ICaisisInputControl
    {
        public CaisisCheckBox()
            : base()
        {
            showLabel = true;
            showHelpBubble = true;

            // Attach EventHandler to handle CaisisEventHandler event
            this.CheckedChanged += (i, e) => OnValueChanged(this, e);
            base.PreRender += (i, e) => this.OnPreRender(this, e);
        }

        protected Label inputFieldLabel;

        #region private members
        private string table;
        private string field;
        private string fieldLabel;
        private bool required;
        private bool enabled;

        private bool showHelpBubble;
        private bool showLabel;
        private string labelClass;
        private string helpDescription;
        private string _value;
        #endregion

        /// <summary>
        /// An event signaling the Value(check state) of the control has changed during PostBack
        /// </summary>
        public event CaisisEventHandler ValueChanged;

        /// <summary>
        /// 
        /// </summary>
        public event CaisisEventHandler PreRender;

        #region Properties required to implement ICaisisInputControl
        /// <summary>
        /// Gets or sets the name of the Database Table corresponding to this control.
        /// </summary>
        public string Table
        {
            get { return table; }
            set { table = value; }
        }

        /// <summary>
        /// Gets or sets the column name which maps to the Database Table specified by the "Table" property.
        /// </summary>
        public string Field
        {
            get { return field; }
            set { field = value; }
        }

        /// <summary>
        /// Gets or sets the "Value" represented by a checkbox.
        /// Get: (default) behavior is to return "0" (unchecked),else "1" (checked)
        ///      if "value" set with string value, return "value" (checked), else "(empty string)" (unchecked)
        /// Set: "0", "false", "no" trigger uncheck, all others trigger check
        /// </summary>
        public string Value
        {
            get
            {
                // If control has a "value"
                if (!string.IsNullOrEmpty(_value))
                {
                    // return that value when checked
                    if (this.Checked)
                    {
                        return this._value;
                    }
                    // otherwise return empty string/null
                    else
                    {
                        return string.Empty;
                    }
                }
                // else, return bit behavior
                else
                {
                    return (this.Checked ? 1 : 0).ToString();
                }
            }
            set
            {
                // always track interval "value"
                this._value = value;
                // if value is NULL,"", "0", "false" and "no" will trigger unchecking
                if (string.IsNullOrEmpty(value) || value == (0).ToString() || value.ToLower() == bool.FalseString.ToLower() || value.ToLower() == "no")
                {
                    this.Checked = false;
                }
                // other other values trigger check
                else
                {
                    this.Checked = true;
                }
            }
        }

        /// <summary>
        /// Gets or sets the visibility of the control.
        /// </summary>
        public bool Visible
        {
            get { return base.Visible; }
            set { base.Visible = value; }
        }

        /// <summary>
        /// Gets or sets the text label for the checkbox.
        /// </summary>
        public string FieldLabel
        {
            get { return fieldLabel; }
            set { fieldLabel = value; }
        }

        /// <summary>
        /// Gets or sets the class of just the Label, if not defined defaults to pdFormFieldLabel.
        /// </summary>
        public string LabelClass
        {
            get { return labelClass; }
            set { labelClass = value; }
        }

        /// <summary>
        /// Gets or sets whether a value is requied for this control.
        /// </summary>
        public bool Required
        {
            get { return required; }
            set { required = value; }
        }

        /// <summary>
        /// Gets or sets whether a help description bubble should appear when mousing over
        /// this control's Field Label.
        /// </summary>
        public bool ShowHelpBubble
        {
            get { return showHelpBubble; }
            set { showHelpBubble = value; }
        }

        /// <summary>
        /// Gets or sets the help description shown in the help bubble, when the user mouse's over this control's Field Label.
        /// </summary>
        public string HelpDescription
        {
            get { return helpDescription; }
            set { helpDescription = value; }
        }

        /// <summary>
        /// Gets or sets whether to display the Field Label for this control.
        /// </summary>
        public bool ShowLabel
        {
            get { return showLabel; }
            set { showLabel = value; }
        }

        /// <summary>
        /// Gets or sets whether a checkbox is enabled (selectable).
        /// </summary>
        public bool Enabled
        {
            get
            {
                enabled = base.Enabled;
                return enabled;
            }
            set
            {
                base.Enabled = value;
                enabled = value;
            }
        }

        public string CssClass
        {
            set { base.CssClass = value; }
        }

        #endregion

        public void AddClientSideEventHandler(string eventName, string script)
        {
            if (eventName != "" && script != "")
            {
                base.Attributes.Add(eventName, script);
            }
        }

        protected override void OnInit(EventArgs e)
        {
            if (this.ID == null)
            {
                this.ID = Table + "_" + Field;
            }
        }

        /// <summary>
        /// Occurs when the checkbox's check state changes during post backs
        /// </summary>
        /// <param name="iCIC"></param>
        /// <param name="e"></param>
        protected void OnValueChanged(ICaisisInputControl iCIC, EventArgs e)
        {
            if (ValueChanged != null)
            {
                ValueChanged(iCIC, e);
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="iCIC"></param>
        /// <param name="e"></param>
        protected void OnPreRender(ICaisisInputControl iCIC, EventArgs e)
        {
            if (PreRender != null)
            {
                PreRender(iCIC, e);
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="e"></param>
        protected override void OnPreRender(EventArgs e)
        {
            base.Attributes.Add("value", "");
            base.OnPreRender(e);
        }

        protected override void Render(HtmlTextWriter w)
        {

            string cbClass = "DataEntryRowCheckBox";
            if (!string.IsNullOrEmpty(base.CssClass))
            {
                this.CssClass = base.CssClass + " " + cbClass;
            }
            else
            {
                this.CssClass = cbClass;
            }
            // if field label is defined then show it unless explicity set to false
            CICHelper.RenderFieldLabel(showLabel, FieldLabel, w, Required, showHelpBubble, helpDescription, labelClass);



            base.Render(w);
        }
    }

    #region Deprecated Controls - Remain for backwards compatibility

    [DefaultProperty("CIC"), ToolboxData("<{0}:CaisisExtendedRadioButtonList runat=server></{0}:CaisisExtendedRadioButtonList>")]
    [Obsolete("This control has been deprecated, funcionality acquired by CaisisRadioButtonList.")]
    public class CaisisExtendedRadioButtonList : CaisisRadioButtonList { }

    [DefaultProperty("CIC"), ToolboxData("<{0}:CaisisExtendedCheckBoxList runat=server></{0}:CaisisExtendedCheckBoxList>")]
    [Obsolete("This control has been deprecated, funcionality acquired by CaisisCheckBoxList.")]
    public class CaisisExtendedCheckBoxList : CaisisCheckBoxList { }

    #endregion

    #region utility classes : move to helper
    public class _CustomHtmlTextWriter : HtmlTextWriter
    {
        private NameValueCollection atts;

        public _CustomHtmlTextWriter(TextWriter writer, NameValueCollection customAttributes)
            : base(writer)
        {
            atts = customAttributes;
        }

        public override void RenderBeginTag(HtmlTextWriterTag tagKey)
        {
            if (base.IsAttributeDefined(HtmlTextWriterAttribute.Type))
            {
                foreach (string k in atts.Keys)
                {
                    base.AddAttribute(k, atts[k]);
                }
            }
            base.RenderBeginTag(tagKey);
        }
    }
    #endregion
}
