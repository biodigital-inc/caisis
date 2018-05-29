namespace Caisis.UI.Modules.Prostate.Eforms
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
    ///		Summary description for ChiefComplaint.
    /// </summary>
    public partial class BiopsyOfProstateSize : BaseEFormControl
    {

        override protected void Page_Load(object sender, System.EventArgs e)
        {
            base.Page_Load(sender, e);

            // calculation in utilities.js 

            // calls to client scripts to calculate Prostate Volume
            //string strJs = ImgProstateVolume.ClientID + ".value = calcProstateVolume(" + ImgProstateLength.ClientID + ".value, " + ImgProstateWidth.ClientID + ".value, " + ImgProstateHeight.ClientID + ".value);calcPSADensity('" + ProstatePSADensity.ClientID + "', '" + ImgProstateVolume.ClientID + "');";

            string strJs = "calcProstateSizeValues('prostate');";

            ImgProstateLength.Attributes.Add("onchange", strJs);
            ImgProstateWidth.Attributes.Add("onchange", strJs);
            ImgProstateHeight.Attributes.Add("onchange", strJs);
            ImgProstateVolume.Attributes.Add("onmouseover", strJs);
            ProstatePSADensity.Attributes.Add("ProstatePSADensity", strJs);


            // calls to client scripts to calculate Transition zone using same calculation as Prostate Volume
            //string strJs1 = ImgTZ_Volume.ClientID + ".value = calcProstateVolume(" + ImgTZ_Length.ClientID + ".value, " + ImgTZ_Width.ClientID + ".value, " + ImgTZ_Height.ClientID + ".value);calcPSADensity('" + TZPSADensity.ClientID + "', '" + ImgTZ_Volume.ClientID + "');";


            string strJs1 = "calcProstateSizeValues('tz');";

            ImgTZ_Length.Attributes.Add("onchange", strJs1);
            ImgTZ_Width.Attributes.Add("onchange", strJs1);
            ImgTZ_Height.Attributes.Add("onchange", strJs1);
            ImgTZ_Volume.Attributes.Add("onmouseover", strJs1);
            TZPSADensity.Attributes.Add("onmouseover", strJs1);
        }

    }
}

