using System;
using System.Web;

namespace Caisis.UI.Core.Classes
{
	/// <summary>
	/// All static forms in the patient data module should extend BasePatientDataControl.
	/// </summary>
	public class BasePatientDataControl : BaseControl
    {    
		override protected void OnInit(System.EventArgs e)  
		{
			base.OnInit(e);
		}

        protected override void Page_Load(object sender, EventArgs e)
        {
            //base.Page_Load (sender, e);
        }
    }

	
}
