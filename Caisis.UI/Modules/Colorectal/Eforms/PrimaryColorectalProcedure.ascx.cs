namespace Caisis.UI.Modules.Colorectal.Eforms
{
    using System;
    using System.Data;
    using System.Data.SqlClient;
    using System.Drawing;
    using System.Web;
    using System.Web.UI.WebControls;
    using System.Web.UI.HtmlControls;

    using Caisis.UI.Core.Classes;
    using Caisis.UI.Core.Classes.CustomControls;
    using Caisis.DataAccess;

    /// <summary>
    ///		Summary description for PrimaryColorectalProcedure
    /// </summary>
    public partial class PrimaryColorectalProcedure : BaseEFormControl
    {
        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);

            string SurgeryDate = "";
            if (Session[SessionKey.CurrentClinicDate] != null) SurgeryDate = Session[SessionKey.CurrentClinicDate].ToString();
            if (SurgeryDate.Length > 0)
            {
                procHiddenDate.Value = SurgeryDate;
            }


            foreach (ListItem proc in PrimProcOther.Items)
            {
                string procStr = "primProcSelection('" + proc.Value + "');";

                proc.Attributes.Add("onclick", procStr);

                if (proc.Selected)
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "procjScript", procStr, true);
                }
            }
        }


        //override protected void SetHiddenDateFieldPair(EformHidden hiddenDateTextField, EformHidden hiddenDateField, string SurgeryDate)
        //{
        //    if (string.IsNullOrEmpty(hiddenDateTextField.Value))
        //    {
        //        hiddenDateTextField.Value = SurgeryDate;
        //        hiddenDateTextField.Disabled = false;
        //    }
        //    if (string.IsNullOrEmpty(hiddenDateField.Value))
        //    {
        //        hiddenDateField.Value = SurgeryDate;
        //        hiddenDateField.Disabled = false;  // this method overrides method from base class because in this situation we don't want to disable the hidden field.  
        //        // this is ok because this record is required.
        //    }
        //}


    }
}
