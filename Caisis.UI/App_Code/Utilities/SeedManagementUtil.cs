using System;

using Caisis.UI;
using Caisis.UI.Core.Classes;

namespace Caisis.UI.Modules.SeedMgmt
{
	/// <summary>
	/// Summary description for PhysicsUtil.
	/// </summary>
	public partial class SeedManagementUtil
	{
		//CONSTANTS USED IN PHYSICS SECTION
		//TODO: Add booking/action values to this page? 
		private const string RADONCSPECIALTY	= "Radiation Oncology";//DEPENDENCY: value must match specialty lkp code
		private const string UROLOGICSPECIALTY = "Urology";//DEPENDENCY: value must match specialty lkp code

		//NOTE: Cut off values are also in the SQL Server function: fnBrachyGetActivityCutoff 
		private const double IODINE_CUTOFF		= 0.3 * 1.27; //99 std
		private const double PALLADIUM_CUTOFF		= 1.2 * 1.686; 

		//round all values to 3 decimal places
		private const int SIGN_DIGITS = 3;

		public SeedManagementUtil()
		{
			
		}

		public static string RadOncSpecialty
		{
			get
			{
				return  RADONCSPECIALTY;
			}
		}

		public static string UrologistSpecialty
		{
			get
			{
				return  UROLOGICSPECIALTY;
			}
		}

		public static double PalladiumCutoff
		{
			get
			{
				return  PALLADIUM_CUTOFF;
			}
		}

		public static double IodineCutoff
		{
			get
			{
				return  IODINE_CUTOFF;
			}
		}

		public static int SignificantDigits
		{
			get
			{
				return  SIGN_DIGITS;
			}
		}

		/*
		 * 'calculate RecTotActivity
			'check to be sure all numbers are present for calculating
			If Not IsNull(txtIsotope) And IsNumeric(txtPrescribedDose) And IsNumeric(txtAvgDimension) Then
				Select Case txtIsotope
				Case "Palladium"
					'if we can ever figure out what these magic numbers mean, they
					'should go into the config table!!!
					If CSng(txtAvgDimension) < CSng(3) Then
						x = 17.8 * CSng(txtAvgDimension)
					Else
						x = 3.2 * (CSng(txtAvgDimension) ^ 2.56)
					End If
					sngRecTotActivity = 1.686 * x * CSng(txtPrescribedDose) / 140 * 1.1 'changed 3/23/2000
		            
				Case "Iodine"
					If CSng(txtAvgDimension) < 3 Then
						x = 5 * CSng(txtAvgDimension)
					Else
						x = 1.338 * (CSng(txtAvgDimension) ^ 2.2)
					End If
					sngRecTotActivity = 0.897 * 1.27 * x * CSng(txtPrescribedDose) / 144 * 1.1
		        
				End Select
				txtRecTotActivity = sngRecTotActivity
				blnDosimetrySaved = False
				cmdPrintDosimetry.SetFocus 'prevent error in next line
				cmdSaveDosimetry.Enabled = True
			ElseIf Not blnPrePlan Then
				blnComplete = False
			End If
		*/

		public static string CalcRecTotActivity(string isotope, string prescribedDose, string avgDimension)
		{
			double recTotActivity = 0;

			if(PageUtil.IsDecimal(prescribedDose) && PageUtil.IsDecimal(avgDimension))
			{
				double x;

				if(isotope.Equals("Palladium"))
				{
					if(double.Parse(avgDimension) < 3)
						x = 17.8 * double.Parse(avgDimension);
					else
						x = 3.2 * (Math.Pow(double.Parse(avgDimension), 2.56));
					
					recTotActivity = 1.686 * x * double.Parse(prescribedDose) / 140 * 1.1 ;	
				}
				else if(isotope.Equals("Iodine"))
				{
					if(double.Parse(avgDimension)< 3)
						x = 5 * double.Parse(avgDimension);
					else
						x = 1.388 * Math.Pow(double.Parse(avgDimension), 2.2);
					
					recTotActivity = 0.987 * 1.27 * x * double.Parse(prescribedDose) / 144 * 1.1 ;
				}
			}
			recTotActivity = RoundFloat(recTotActivity);

			return recTotActivity.ToString();
		}

		public static string CalcTotActivity(string numSeeds, string seedStrength)
		{
			double totActivity = 0;

			if(PageUtil.IsDecimal(numSeeds) && PageUtil.IsDecimal(seedStrength))
			{
				totActivity = int.Parse(numSeeds) * double.Parse(seedStrength);
			}

			//totActivity = Math.Round((totActivity * 100), PhysicsUtil.SignificantDigits);
			totActivity = RoundFloat(totActivity);
			
			return totActivity.ToString();
		}

		/// <summary>
		/// Calculate percent of recommened activity = Total Seed Activity / (Recommended Total Activity + 10%)	
		/// </summary>
		/// <param name="totActivity"></param>
		/// <param name="recTotActivity"></param>
		/// <returns></returns>
		public static string CalcPercentActivity(string totActivity, string recTotActivity)
		{
			double percentActivity = 0;

			if(PageUtil.IsDecimal(totActivity) && (PageUtil.IsDecimal(recTotActivity) && double.Parse(recTotActivity) != 0) )
			{
				percentActivity = double.Parse(totActivity) / double.Parse(recTotActivity); // X 10%? 
			}

			percentActivity = RoundFloat(percentActivity) * 100;
			
			return percentActivity.ToString();
		}

		public static double RoundFloat(double numberToRound)
		{
			double roundVal =  Math.Round(numberToRound, SeedManagementUtil.SignificantDigits);

			return roundVal;
		}
		/* 'actual seeds assigned to patient
		If IsNumeric(txtSeedStrength) Then
			If IsNumeric(txtNumSeeds) Then
				txtTotalActivity = CSng(txtNumSeeds) * CSng(txtSeedStrength)
				blnDosimetrySaved = False
			Else
				blnComplete = False
			End If
			'reccommended activity calculated above
			'see if actual is greater than recommended, should be about 100-110%
			If IsNumeric(txtRecTotActivity) Then
				If IsNumeric(txtTotalActivity) And CSng(txtRecTotActivity) > 0 Then
					txtPercentActivity = CSng(txtTotalActivity) / CSng(txtRecTotActivity)
					blnDosimetrySaved = False
				Else
					blnComplete = False
				End If
			Else
				blnComplete = False
			End If
		Else
			blnComplete = False
		End If
		*/

		/// <summary>
		/// 
		/// </summary>
		/// <param name="isotope"></param>
		/// <param name="assayActivity"></param>
		/// <param name="assayDate"></param>
		/// <param name="implantDate"></param>
		/// <returns></returns>
		public static string GetImplantActivity(string isotope, string assayActivity, string assayDate, string implantDate)
		{
			string implantActivity = "";

			if(PageUtil.IsInteger(assayActivity) || PageUtil.IsDecimal(assayActivity))
			{	
				if(PageUtil.IsDate(assayDate) && PageUtil.IsDate(implantDate) )
				{

				DateTime d1, d2;  

				d1 = Convert.ToDateTime(implantDate);//implant date comes from BrachyDate field in Brachy table
				d2 = Convert.ToDateTime(assayDate);

				TimeSpan ts = d1-d2;

				int days = ts.Days;
					//GetCurrentActivity = sngAssayActivity * 0.5 ^ ((Date - dAssayDate) / 59.4)
					if(isotope.Equals("Iodine") || isotope.Equals("I-125") || isotope.Equals("I125"))
					{
						double Itotal = Convert.ToDouble(assayActivity) * (Math.Pow(0.5, (days / 59.4)));
						implantActivity = Math.Round(Itotal, 6).ToString();// could remove this to store full value in db and round to six places on output
					}
					else if( isotope.Equals("Palladium") || isotope.Equals("Pd-103") || isotope.Equals("Pd103") )
					{
						double Ptotal = Convert.ToDouble(assayActivity) * (Math.Pow(0.5, (days / 16.97)));
						implantActivity = Math.Round(Ptotal, 6).ToString();
						
					}
				}
			}

			return implantActivity;
		}

			/*Public Function GetImplantActivity(strIsotope As String, vAssayActivity As Variant, vAssayDate As Variant) As Variant
			Dim dImplantDate As Date
			GetImplantActivity = Null
			If IsNumeric(vAssayActivity) Then
				If IsDate(vAssayDate) Then
					If objPatient.ImplantDate <> vbNullString Then
						dImplantDate = objPatient.ImplantDate
						If dImplantDate <> MISSING_DATE Then
							Select Case strIsotope
							Case "Iodine", "I-125", "I125"
								'half-life
								GetImplantActivity = CSng(vAssayActivity) * 0.5 ^ ((dImplantDate - CDate(vAssayDate)) / 59.4)
							Case "Palladium", "Pd-103", "Pd103"
								GetImplantActivity = CSng(vAssayActivity) * 0.5 ^ ((dImplantDate - CDate(vAssayDate)) / 16.97)
							End Select
						End If
					End If
				End If
			End If		 
			Exit_Procedure:
			Exit Function*/

		/// <summary>
		/// 
		/// If this is too slow/performance hit, then move function to back end.
		/// </summary>
		/// <param name="isotope"></param>
		/// <param name="assayActivity"></param>
		/// <param name="assayDate"></param>
		/// <returns></returns>
		public static object GetCurrentActivity(string isotope, string assayActivity, string assayDate)
		{
			object currentActivity = System.DBNull.Value;

			if(PageUtil.IsInteger(assayActivity) || PageUtil.IsDecimal(assayActivity))
			{	
				if(PageUtil.IsDate(assayDate))
				{

					DateTime d1, d2;  

					d1 = System.DateTime.Now;
					d2 = Convert.ToDateTime(assayDate);

					TimeSpan ts = d1-d2;

					int days = ts.Days;
					//GetCurrentActivity = sngAssayActivity * 0.5 ^ ((Date - dAssayDate) / 59.4)
					if(isotope.Equals("Iodine") || isotope.Equals("I-125") || isotope.Equals("I125"))
					{
						double Itotal = Convert.ToDouble(assayActivity) * (Math.Pow(0.5, (days / 59.4)));
						currentActivity = Math.Round(Itotal, 6).ToString();// could remove this to store full value in db and round to six places on output
					}
					else if( isotope.Equals("Palladium") || isotope.Equals("Pd-103") || isotope.Equals("Pd103") )
					{
						double Ptotal = Convert.ToDouble(assayActivity) * (Math.Pow(0.5, (days / 16.97)));
						currentActivity = Math.Round(Ptotal, 6).ToString();
						
					}
				}
			}

			return currentActivity;
		}
		/*Public Function GetCurrentActivity(strIsotope As String, vAssayActivity As Variant, vAssayDate As Variant) As Variant
		On Error GoTo Error_Handler
		    
			If strIsotope = vbNullString Then
				GetCurrentActivity = Null
			ElseIf Not IsNumeric(vAssayActivity) Then
				GetCurrentActivity = Null
			ElseIf Not IsDate(vAssayDate) Then
				GetCurrentActivity = Null
			Else
		            
				'stop using variant data types
				dAssayDate = CDate(vAssayDate)
				sngAssayActivity = CSng(vAssayActivity)
		        
				Select Case strIsotope '99std (Rapid Strand)
				Case "Iodine", "I-125"
					GetCurrentActivity = sngAssayActivity * 0.5 ^ ((Date - dAssayDate) / 59.4)
				Case "Palladium", "Pd-103"
					GetCurrentActivity = sngAssayActivity * 0.5 ^ ((Date - dAssayDate) / 16.97)
				Case Else
					GetCurrentActivity = Null
				End Select
		        
			End If
		Exit_Procedure:
		Exit Function*/

		public static string ActivityForSelectedSeeds()
		{
			//FROM ACCESS:
			//SELECT Sum(([SelectedSeeds].[NumSeeds]*GetImplantActivity([Isotope] & "",[AssayActivity],[AssayDate]))) AS Activity, Sum(SelectedSeeds.NumSeeds) AS SumOfNumSeeds
			//FROM Seeds INNER JOIN SelectedSeeds ON Seeds.SeedID = SelectedSeeds.SeedID;

			string totalActivity = "TODO";

			return totalActivity;
		}

		/*TODO: Do we need to calculate volume? stored in SQL Server already.
		//Public Function CalcVolume(vLength As Variant, vWidth As Variant, vHeight As Variant) As Variant
		// Const pi = 3.141592654
		//must have dimensions
		//If IsNumeric(vLength + vWidth + vHeight) Then
        //	CalcVolume = CSng(pi / 6 * (vLength * vWidth * vHeight))
		//Else
		//	CalcVolume = Null
		//End If
        //Exit_Procedure:
		//Exit Function
		*/

		/*TODO: Calculate Mu for front end conversions
		Public Function CalcMu(strIsotope As String, vmCi As Variant) As Variant
			On Error GoTo Error_Handler

			If IsNumeric(vmCi) Then

				Select Case strIsotope
				Case "Iodine", "I-125", "I125" ' 99 std (Rapid Strand)
					CalcMu = vmCi * 1.27
				Case "Palladium", "Pd-103", "Pd103"
					CalcMu = vmCi * 1.293
				Case Else
					CalcMu = Null
				End Select
			Else
				CalcMu = Null
			End If

			Exit_Procedure:
		Exit Function
		*/
	}
}
