using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Xml;

using Caisis.UI.Core.Classes;

namespace Caisis.UI.Core.PaperForms
{
	/// <summary>
	/// Summary description for FormsContent.
	/// </summary>
	public partial class FormsContent : BasePage
	{
		private BasePaperFormControl  formControl = null;
		public string batchPrintPatientId = null;
        //2.0 public Literal nowDate;

		override protected void Page_Load(object sender, System.EventArgs e)
		{
			nowDate.Text = DateTime.Now.ToShortDateString();

			base.RedirectOnTimeout();
		}

		protected override void CreateChildControls()
		{
			// module will be assigned value based on XML confif file
			string moduleDirectory;
			
			if (null != formHolder)
			{
				if (Request["batchPrint"] != null && Request["batchPrint"].Equals("true"))
				{
					foreach (string formPatientId in Request.QueryString)
					{
						if (formPatientId != "batchPrint" && formPatientId != "createBatchButton")
						{
							string batchModuleDirectory;
							string formControlFileName = Request[formPatientId] + ".ascx";
						


							batchModuleDirectory = Caisis.UI.Core.Classes.XmlUtil.GetParentModuleDirectory(formControlFileName, "PaperForms");

							formControl = (BasePaperFormControl)this.LoadControl("../../Modules/" + batchModuleDirectory +"/PaperForms/" + formControlFileName);


							// load form
							//formControl = (Caisis.UI.FormControl)this.LoadControl("../../Modules/" + moduleDirectory +"/PaperForms/" + Request[formPatientId] + ".ascx");
							// v2.2: formControl = (Caisis.UI.FormControl)this.LoadControl(Request[formPatientId]+".ascx");
							
							// this if statement was added to give those patients with no ID an ID of 0
							if (formPatientId.StartsWith("_noId_"))
							{
								formControl.BatchPatientId = 0;
							}
							else if (formPatientId.StartsWith("_AppointmentId_"))
							{
								formControl.BatchPatientId = 0;
								
								string trimmedFormAppointmentId = formPatientId.Remove(0, 15);

								formControl.FormAppointmentId = Convert.ToInt32(trimmedFormAppointmentId);
							}
							else if (formPatientId.StartsWith("_InPatientId_"))
							{
								formControl.BatchPatientId = 0;
								
								string trimmedFormInPatientId = formPatientId.Remove(0, 13);

								formControl.FormAppointmentId = 0;

								formControl.FormInPatientId = Convert.ToInt32(trimmedFormInPatientId);
							}
							else
							{
								int trimFormPatientIdAt = formPatientId.IndexOf("_Appt");
								
								string trimmedFormPatientId;


								if (trimFormPatientIdAt >= 0)
								{
									trimmedFormPatientId = formPatientId.Substring(0,trimFormPatientIdAt);
								}
								else
								{
									trimmedFormPatientId = formPatientId;
								}

								formControl.BatchPatientId= Convert.ToInt32(trimmedFormPatientId);
							}

							formHolder.Controls.Add(formControl);
						
						}
					}

				}
				else //not batch print, load individual form for printing
				{
					string controlName = Request["formType"];

					if (controlName == null || controlName.Equals(""))  
					{
						controlName = "SelectAForm.ascx";//set splash page

						formControl = (BasePaperFormControl)this.LoadControl(controlName);
					}
					else
					{
						// get directory name of form; note controlName CONTAINS extension
						moduleDirectory = Caisis.UI.Core.Classes.XmlUtil.GetParentModuleDirectory(controlName, "PaperForms");
				
						// load form
						formControl = (BasePaperFormControl)this.LoadControl("../../Modules/" + moduleDirectory +"/PaperForms/" + controlName);
					}

					formHolder.Controls.Add(formControl);

					if (!IsPostBack)  
					{
                        formContentBody.Attributes.Add("onload", "if(top.FormsContainer) { top.FormsContainer.setFormTitle('" + formControl.FormTitle + "'); } if(top.showMenus) { top.showMenus(true); }");
					}
				}
			}
		}

	}
}
