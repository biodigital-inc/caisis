using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Caisis.DataAnalysis;
using Caisis.Security;
using Caisis.UI.Core.Classes;

namespace Caisis.UI.Core.DataAnalysis.Export
{
    public partial class ProstateDataExportButton : BasePage
    {
        protected override void Page_Load(object sender, EventArgs e)
        {
          //  SubmitButton.Click += new EventHandler(SubmitButton_Click);
        }

        protected void SubmitButton_Click(object sender, EventArgs e)
        {
            string filename = GenerateFilename("csv");

            Response.Clear();
            Response.ContentType = "text/csv";
            Response.BufferOutput = false;
            Response.AppendHeader("content-disposition", "attachment; filename=" + filename);
            Response.Flush();

            WriteAlgorithmOutput(Response.Output);

            Response.End();
        }

        void WriteAlgorithmOutput(TextWriter writer)
        {
            string whConnStr = ConfigurationManager.AppSettings["warehouseConnectionString"];
            int userId = (int) Session[SessionKey.LoginId];

            //AlgorithmOptions options = new AlgorithmOptions();
            //options.SelectedRP_Types = AlgorithmOptions.RP_Types.LP | AlgorithmOptions.RP_Types.RP | AlgorithmOptions.RP_Types.RALP;
            //options.MinimumDxDate = DateTime.Parse("01/01/2009");
            //options.MaximumDxDate = DateTime.Parse("01/01/2012");
            //options.MinimumRP_Date = DateTime.Parse("01/01/2010");
            //options.MaximumRP_Date = DateTime.Parse("01/01/2013");
            
            Algorithm algorithm = new Algorithm(whConnStr, userId);
            algorithm.ProjectPurpose = Purpose.Text;
            algorithm.ProjectInvestigator = Investigator.Text;
            algorithm.ProjectIRB_ApprovalType = IRB_ApprovalType.SelectedValue;

            DateTime approvalDate;
            if (DateTime.TryParse(IRB_ApprovalDate.Text, out approvalDate))
            {
                algorithm.ProjectIRB_ApprovalDate = approvalDate;
            }

            IEnumerable<DataRow> records = algorithm.GenerateOutput();
            var _records = records.Select(d => d.ItemArray);

            CSV.Write(_records, algorithm.OutputHeaders, writer);
        }

        string GenerateFilename(string fileExtension)
        {
            SecurityController sc = new SecurityController();
            string username = sc.GetUserName();
            string dateString = DateTime.Now.ToString("yyyyMMdd");
            return string.Format("ProstateDataExport_{0}_{1}.{2}", username, dateString, fileExtension);
        }
    }
}