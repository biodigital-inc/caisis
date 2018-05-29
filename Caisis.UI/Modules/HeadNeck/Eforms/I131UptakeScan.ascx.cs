namespace Caisis.UI.Modules.HeadNeck.Eforms
{
    using System;
    using System.Data;
    using System.Data.SqlClient;
    using System.Drawing;
    using System.Web;
    using System.Web.UI.WebControls;
    using System.Web.UI.HtmlControls;

    using Caisis.BOL;
    using Caisis.UI.Core.Classes;
    using Caisis.UI.Core.Classes.CustomControls;
    using Caisis.DataAccess;

    /// <summary>
    ///		Summary description for I-131 Uptake Scan
    /// </summary>

    public partial class I131UptakeScan : BaseEFormControl
    {
        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);
            SetDxValues();  
            SetOtherDxValues();

            if (chkThyroidBed.Checked == true || chkOutsideThyroid.Checked == true || chkThyroidLobe.Checked == true)
            {
                ImgFindingsDiv.Style.Add("display", "block");

                if (!string.IsNullOrEmpty(DiagDateText.Value) )
                {
                    DxDateText_1.Value = DiagDateText.Value;
                    DxDate_1.Value = DiagDateText.Value;
                }
            }
            if (chkOutsideThyroid.Checked == true)
            {
                OutChecksRow.Style.Add("display", "block");
            }

            CheckOutThyroidValues(OutsideChk1, ImgFindSite_2);
            CheckOutThyroidValues(OutsideChk2, ImgFindSite_3);
            CheckOutThyroidValues(OutsideChk3, ImgFindSite_4);
            CheckOutThyroidValues(OutsideChk4, ImgFindSite_5);
            CheckOutThyroidValues(OutsideChk5, ImgFindSite_6);

            //Other Uptake Scans
            if (chkThyroidBed_Other.Checked == true || chkOutsideThyroid_Other.Checked == true )
            {
                Other_ImgFindingsDiv.Style.Add("display", "block");

                if (!string.IsNullOrEmpty(DiagDateText_Other.Value) )
                {
                    DxDateText_4.Value = DiagDateText_Other.Value;
                    DxDate_4.Value = DiagDateText_Other.Value;
                }
            }

            if (chkOutsideThyroid_Other.Checked == true)
            {
                OutChecksRow_Other.Style.Add("display", "block");
            }

            CheckOutThyroidValues(Other_OutsideChk1, Other_ImgFindSite_2);
            CheckOutThyroidValues(Other_OutsideChk2, Other_ImgFindSite_3);
            CheckOutThyroidValues(Other_OutsideChk3, Other_ImgFindSite_4);
            CheckOutThyroidValues(Other_OutsideChk4, Other_ImgFindSite_5);
            CheckOutThyroidValues(Other_OutsideChk5, Other_ImgFindSite_6);
           
        }

        protected void CheckOutThyroidValues(CheckBox OutSideChkBox, EformTextBox ImgSite)
        {
            if (!string.IsNullOrEmpty(ImgSite.Value))
            {
                OutSideChkBox.Checked = true;
            }
        }

        protected void SetDxValues()
        {
            SetDxSite(chkThyroidBed, DxDateText_1, DxDate_1, ImgFindSite_1, DxType_1, DxTarget_1, DxSide_1, DxQuality_1, DxIndication_1, DxResult_1);
            SetDxSite(chkOutsideThyroid, DxDateText_1, DxDate_1, HiddenSite, DxType_1, DxTarget_1, DxSide_1, DxQuality_1, DxIndication_1, DxResult_1);
            SetDxSite(chkThyroidLobe, DxDateText_1, DxDate_1, ImgFindSite_11, DxType_1, DxTarget_1, DxSide_1, DxQuality_1, DxIndication_1, DxResult_1);

            SetImgSite(OutsideChk1, ImgFindSite_2, ImgFindSide_2, ImgFindSubsite_2, ImgFindResult_2, ImgFindSUV_2);
            SetImgSite(OutsideChk2, ImgFindSite_3, ImgFindSide_3, ImgFindSubsite_3, ImgFindResult_3, ImgFindSUV_3);
            SetImgSite(OutsideChk3, ImgFindSite_4, ImgFindSide_4, ImgFindSubsite_4, ImgFindResult_4, ImgFindSUV_4);
            SetImgSite(OutsideChk4, ImgFindSite_5, ImgFindSide_5, ImgFindSubsite_5, ImgFindResult_5, ImgFindSUV_5);
            SetImgSite(OutsideChk5, ImgFindSite_6, ImgFindSide_6, ImgFindSubsite_6, ImgFindResult_6, ImgFindSUV_6);
        }

        protected void SetDxSite(EformCheckBox DxResultChk, EformTextBox DxDateTxt, EformHidden DxDate, EformTextBox DxSite, EformTextBox DxType, EformTextBox DxTarget, EformTextBox DxSide, EformTextBox DxQlty, EformTextBox DxIndc, EformTextBox DxResult)
        {
            DxResultChk.Attributes.Add("onclick", "DiagResultCheck(this,'" + DxResultChk.Value + "','" + DxDateTxt.ClientID + "','" + DxDate.ClientID + "', '" + DxSite.ClientID + "', '" + DxType.ClientID + "','" + DxTarget.ClientID + "','" + DxSide.ClientID + "','" + DxQlty.ClientID + "','" + DxIndc.ClientID + "','" + DxResult.ClientID + "');");
        }

        protected void SetImgSite(CheckBox OutResultChkBox, EformTextBox DxImgSiteTxt, EformDropDownList DxImgSideDD, EformTextBox DxImgsubSiteTxt, EformTextBox DxImgResultTxt, EformTextBox DxImgFindSUV_Txt)
        {
            OutResultChkBox.Attributes.Add("onclick", "OutResultCheck(this,'" + OutResultChkBox.Text + "','" + DxImgSiteTxt.ClientID + "','" + DxImgSideDD.ClientID + "','" + DxImgsubSiteTxt.ClientID + "','" + DxImgResultTxt.ClientID + "','" + DxImgFindSUV_Txt.ClientID + "');");
        }

        protected void SetOtherDxValues()
        {
            //SetOtherDxDetails(DxResult_4, DxDateText_4, DxDate_4, DxType_4, DxTarget_4, DxSide_4, DxQuality_4);
            //SetOtherDxDetails(DxResult_5, DxDateText_5, DxDate_5, DxType_5, DxTarget_5, DxSide_5, DxQuality_5);
            SetOtherDxDetails(chkThyroidBed_Other, DxDateText_4, DxDate_4, Other_ImgFindSite_1, DxType_4, DxTarget_4, DxSide_4, DxQuality_4, DxIndication_4, DxResult_4);
            SetOtherDxDetails(chkOutsideThyroid_Other, DxDateText_4, DxDate_4, HiddenSite_Other, DxType_4, DxTarget_4, DxSide_4, DxQuality_4, DxIndication_4, DxResult_4);

            SetImgSite(Other_OutsideChk1, Other_ImgFindSite_2, Other_ImgFindSide_2, Other_ImgFindSubsite_2, Other_ImgFindResult_2, Other_ImgFindSUV_2);
            SetImgSite(Other_OutsideChk2, Other_ImgFindSite_3, Other_ImgFindSide_3, Other_ImgFindSubsite_3, Other_ImgFindResult_3, Other_ImgFindSUV_3);
            SetImgSite(Other_OutsideChk3, Other_ImgFindSite_4, Other_ImgFindSide_4, Other_ImgFindSubsite_4, Other_ImgFindResult_4, Other_ImgFindSUV_4);
            SetImgSite(Other_OutsideChk4, Other_ImgFindSite_5, Other_ImgFindSide_5, Other_ImgFindSubsite_5, Other_ImgFindResult_5, Other_ImgFindSUV_5);
            SetImgSite(Other_OutsideChk5, Other_ImgFindSite_6, Other_ImgFindSide_6, Other_ImgFindSubsite_6, Other_ImgFindResult_6, Other_ImgFindSUV_6);
        }

        protected void SetOtherDxDetails(EformCheckBox DxResultChk, EformTextBox DxDateTxt, EformHidden DxDate, EformTextBox DxSite, EformTextBox DxType, EformTextBox DxTarget, EformTextBox DxSide, EformTextBox DxQlty, EformTextBox DxIndc, EformTextBox DxResult)
        {
            DxResultChk.Attributes.Add("onclick", "OtherDiagResultCheck(this,'" + DxResultChk.Value + "','" + DxDateTxt.ClientID + "','" + DxDate.ClientID + "', '" + DxSite.ClientID + "', '" + DxType.ClientID + "','" + DxTarget.ClientID + "','" + DxSide.ClientID + "','" + DxQlty.ClientID + "','" + DxIndc.ClientID + "','" + DxResult.ClientID + "');");
            
        }
    }
}