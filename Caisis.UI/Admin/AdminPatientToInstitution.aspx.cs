using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

using System.Web.Security;

using Caisis.DataAccess;
using Caisis.BOL;
using Caisis.Security;

public partial class Admin_AdminPatientToInstitution : Caisis.UI.Admin.AdminBasePage
{
    protected ImageButton DeleteBtn;

    override protected void Page_Load(object sender, System.EventArgs e)
    {
        base.Page_Load(sender, e);

        valMsg.Text = "";
        groupMessage.Text = "";
        AddBtn.ImageUrl = "../Images/AdminImages/submit.gif";
        AddBtn.Width = 65;
        AddBtn.Height = 21;

        SelectPatientName.Attributes.Add("onchange", "this.form." + SelectSubmitted.ClientID + ".value = 'true'; this.form.submit();");

        if (Page.IsPostBack)
        {
            //check if form is submitted from select box or to update password	
            if (!Request.Form["SelectPatientName"].Equals("") && Request.Form["SelectSubmitted"] != null && Request.Form["SelectSubmitted"].Equals("true"))
            {
                this.ShowInstitutionSelect(int.Parse(Request.Form["SelectPatientName"]));
            }
        }
        else
        {
            // Put user code to initialize the page here
            //don't use AdminUtil function because need username here
            if (Request.QueryString["firstLetter"] != null && Request.QueryString["firstLetter"].ToString().Length > 0)
            {
                PatientDa das = new PatientDa();
                string searchTerm = Request.QueryString["firstLetter"].ToString() + "%";
                DataTable dt = das.GetPatientsByLastName(searchTerm);

                DataView view = dt.DefaultView;
                view.Sort = "PatientName ASC";
                SelectPatientName.DataSource = view;
                SelectPatientName.DataValueField = "PatientId";
                SelectPatientName.DataTextField = "PatientName";
                SelectPatientName.DataBind();
                SelectPatientName.Items.Insert(0, new ListItem(""));

                SelectedLetter.Value = Request.QueryString["firstLetter"].ToString();
            }
            else
            {
                SelectedLetter.Value = "";
            }
            SelectInstitutionTable.Visible = false;

        }

    }//end page_load

    protected void ShowInstitutionSelect(int patientId)
    {
        groupMessage.Text = "";

        PatientInstitutionDa da = new PatientInstitutionDa();

        //get users existing insts
        DataTable dt = da.GetPatientInstitutionsByPatientId(patientId);
        rptInstitutions.DataSource = dt.DefaultView;
        rptInstitutions.DataBind();

        if (dt.Rows.Count == 0)
        {
            groupMessage.Text = "No Institutions Assigned. This patient will only be accessible in the All Dataset";
        }

        //get groups
        InstitutionDa i = new InstitutionDa();
        DataTable iDt = i.GetInstitutions();
        Institutions.DataSource = iDt.DefaultView;
        Institutions.DataValueField = "InstitutionId";
        Institutions.DataTextField = "Institution";
        Institutions.DataBind();
        Institutions.Items.Insert(0, new ListItem(""));

        SelectInstitutionTable.Visible = true;
    }

    protected void AddButtonClick(object sender, System.Web.UI.ImageClickEventArgs e)
    {
        if (!Request.Form["Institutions"].Equals("") && !Request.Form["SelectPatientName"].Equals(""))
        {

            UserGroupDa userGroupDa = new UserGroupDa();
            int patientId = int.Parse(Request.Form["SelectPatientName"]);
            int institutionId = int.Parse(Request.Form["Institutions"]);

            SecurityController sc = new SecurityController();

            PatientInstitution ptInstitution = new PatientInstitution();
            ptInstitution[PatientInstitution.InstitutionId] = institutionId;
            ptInstitution[PatientInstitution.PatientId] = patientId;
            //ptInstitution[PatientInstitution.EnteredBy] = sc.GetUserName();
            //ptInstitution[PatientInstitution.EnteredTime] = DateTime.Now;

            ptInstitution.Save();

            this.ShowInstitutionSelect(patientId);
            //this.Page_Load(sender, (System.EventArgs)e);
        }
        else
        {
            valMsg.Text = "You must select a patient and institution.";
        }
    }

    protected void DeleteButtonClick(object sender, CommandEventArgs e)
    {
        int patientInstitutionId = int.Parse(e.CommandArgument.ToString());
        PatientInstitution biz = new PatientInstitution();
        biz.Delete(patientInstitutionId);

        this.Page_Load(sender, (System.EventArgs)e);
    }


}
