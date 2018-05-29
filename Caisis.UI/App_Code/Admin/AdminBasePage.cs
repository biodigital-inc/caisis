using System;

using Caisis.UI.Core.Classes;
using Caisis.Security;

namespace Caisis.UI.Admin
{
	/// <summary>
	/// All Admin pages inherit from AdminBasePage. Edit Security permission is validated on page load.
	/// </summary>
	public class AdminBasePage : BasePage  
	{
        private int? _queryDiseaseId;
        private string _queryDiseaseName;

        public int? QueryDiseaseId
        {
            get
            {
                string diseaseId = Request.QueryString["DiseaseId"];
                if (!string.IsNullOrEmpty(diseaseId))
                {
                    return int.Parse(diseaseId);
                }
                else
                {
                    return null;
                }
            }
        }

        public string QueryDiseaseName
        {
            get
            {
                return _queryDiseaseName;
            }
        }
        
        public AdminBasePage()
            : base()
        {
            this.Init += (a, b) =>
                {
                    if (QueryDiseaseId.HasValue)
                    {
                        BOL.Disease disease = new BOL.Disease();
                        disease.Get(QueryDiseaseId.Value);
                        _queryDiseaseName = disease[BOL.Disease.DiseaseName].ToString();
                    }
                };
        }

		override protected void Page_Load(object sender, System.EventArgs e)
		{    
            if(!PermissionManager.HasPermission("EditSecurity"))
			{
				//user does not have edit security permission! throw them out!
				Response.Redirect("../logout.aspx");
				//Server.Transfer("../logout.aspx");
			}
		}

		override protected void Page_Unload(object sender, System.EventArgs e)
		{
		}

		override protected void OnUnload(EventArgs e)  
		{
			FinalizeComponent();
			base.OnUnload(e);
		}
		
		/* THIS IS DONE IS BASE PAGE SO REMOVED. OTHERWISE PAGE LOADS TWICE 
		#region Web Form Designer generated code
		override protected void OnInit(EventArgs e)
		{
			InitializeComponent();
			base.OnInit(e);
		}
		
		/// <summary>
		/// Required method for Designer support - do not modify
		/// the contents of this method with the code editor.
		/// </summary>
		private void InitializeComponent()
		{    
			this.Load += new System.EventHandler(this.Page_Load);

		}
		#endregion
		*/

		private void FinalizeComponent()  
		{
			this.Unload += new System.EventHandler(this.Page_Unload);
		}
	}
}
