/*
	Description: Calculate FSFI, SSS and VAS scores based on formulas provided by statistician, 
				where surveyType = 'Sexual Medicine Clinical Assessment'
				User will enter date range as search criteria to generate list of patients of interest
*/

-- declare Parameters
 --DECLARE @FromDate DateTime
 --DECLARE @ToDate DateTime

-- Set parameters (user input)
 --SET @FromDate = '' -- this is an input Paremeter (user chooses from-date)
 --SET @ToDate = '' -- this is an input Paremeter (user chooses to-date)

-- UPDATE 11.13.2012
   /*LAST UPATED 7.02.2013 
	 Description: updated VAS scoring section to accommodate new survey items requested/added by users
		New section (vulvar assessment scale)was added to survey with similar survey items used in previous calculation.
		This threw off the scoring.
    */

SELECT PtMrn  MRN, PtLastName 'Last Name', PtFirstName 'First Name', FSFI_SSS.SurveyId SurveyID, FSFI_SSS.SurveyDate, CONVERT(VARCHAR, FSFI_SSS.SurveyDate, 101) 'Survey Date', FSFI_SSS.SurveyNotes, FSFI_SSS.Calculated_FSFI 'FSFI Score', 
	   VAS.TotalVASscore 'Total VAS Score', VAS.CompositeVASscore 'Composite VAS Score', FSFI_SSS.Calculated_SSS 'SSS Score'
FROM(
	SELECT a.PtMrn, a.PtLastName, a.PtFirstName, b.SurveyId, b.SurveyDate, b.SurveyNotes, a.PatientId, b.Calculated_FSFI, c.Calculated_SSS
	FROM Patients a INNER JOIN (

	SELECT	SurveyDate, PatientId, SurveyId, SurveyNotes, ((SUM(Q1) + SUM(Q2)) * 0.6) + ((SUM(Q3) + SUM(Q4) + SUM(Q5) + SUM(Q6)) * 0.3) + 
		   ((SUM(Q7) +SUM(Q8)+ SUM(Q9)+ SUM(Q10)) * 0.3)+ ((SUM(Q11)+ SUM(Q12)+ SUM(Q13)) * 0.4) + 
		   ((SUM(Q14)+ SUM(Q15)+ SUM(Q16)) * 0.4) + ((SUM(Q17)+ SUM(Q18) + SUM(Q19)) * 0.4) AS Calculated_FSFI
		FROM
			(
			SELECT a.SurveyDate, a.PatientId, a.SurveyId, a.SurveyNotes, Q1, Q2,Q3,Q4,Q5,Q6,Q7,Q8,Q9,Q10,Q11,Q12,Q13,Q14,Q15,Q16,Q17,Q18,Q19--   * --a.SurveyId, b.SurveyId, Q1, Q2
			FROM
			(
				(SELECT DISTINCT SurveyDate, PatientId, a.SurveyId, SurveyItem, SurveyItemNum, SurveyNotes, SurveyItemResult,
					CASE WHEN SurveyItemNum = '1' AND SurveyItemResult IS NOT NULL THEN SurveyItemResult 
						 WHEN SurveyItemNum = '1' AND SurveyItemResult IS NULL THEN 0
					END Q1
				FROM Surveys a inner join surveyItems b on a.SurveyId =  b.SurveyId
						WHERE surveyType IN ('Sexual Medicine Clinical Assessment', 'Sexual Medicine Clinical Assessment Form')
						--and a.enteredby LIKE '%stabilec%'
						AND SurveyItem LIKE  'Over the past 4 weeks%'
						AND SurveyItemNum = '1'
				) a
			INNER JOIN 
				(SELECT DISTINCT SurveyDate, PatientId, a.SurveyId, SurveyItem, SurveyItemNum, SurveyNotes, SurveyItemResult,
				CASE WHEN SurveyItemNum = '2' AND SurveyItemResult IS NOT NULL THEN SurveyItemResult 
					 WHEN SurveyItemNum = '2' AND SurveyItemResult IS NULL THEN 0 
				END Q2
				FROM Surveys a inner join surveyItems b on a.SurveyId =  b.SurveyId
					WHERE surveyType IN ('Sexual Medicine Clinical Assessment', 'Sexual Medicine Clinical Assessment Form')
					--and a.enteredby LIKE '%stabilec%'
					AND SurveyItem LIKE  'Over the past 4 weeks%'
					AND SurveyItemNum = '2'
				) b on a.SurveyId = b.SurveyId AND a.PatientId = b.PatientId AND a.SurveyDate = b.SurveyDate
			INNER JOIN 
				(SELECT DISTINCT SurveyDate, PatientId, a.SurveyId, SurveyItem, SurveyItemNum, SurveyNotes, SurveyItemResult,
				CASE WHEN SurveyItemNum = '3' AND SurveyItemResult IS NOT NULL THEN SurveyItemResult 
					 WHEN SurveyItemNum = '3' AND SurveyItemResult IS NULL THEN 0 
				END Q3
				FROM Surveys a inner join surveyItems b on a.SurveyId =  b.SurveyId
					WHERE surveyType IN ('Sexual Medicine Clinical Assessment', 'Sexual Medicine Clinical Assessment Form')
					--and a.enteredby LIKE '%stabilec%'
					AND SurveyItem LIKE  'Over the past 4 weeks%'
					AND SurveyItemNum = '3'
				) c on a.SurveyId = c.SurveyId AND a.PatientId = c.PatientId AND a.SurveyDate = c.SurveyDate
			INNER JOIN 
				(SELECT DISTINCT SurveyDate, PatientId, a.SurveyId, SurveyItem, SurveyItemNum, SurveyNotes, SurveyItemResult,
				CASE WHEN SurveyItemNum = '4' AND SurveyItemResult IS NOT NULL THEN SurveyItemResult 
					 WHEN SurveyItemNum = '4' AND SurveyItemResult IS NULL THEN 0 
				END Q4
				FROM Surveys a inner join surveyItems b on a.SurveyId =  b.SurveyId
					WHERE surveyType IN ('Sexual Medicine Clinical Assessment', 'Sexual Medicine Clinical Assessment Form')
					--and a.enteredby LIKE '%stabilec%'
					AND SurveyItem LIKE  'Over the past 4 weeks%'
					AND SurveyItemNum = '4'
				) d on a.SurveyId = d.SurveyId AND a.PatientId = d.PatientId AND a.SurveyDate = d.SurveyDate

			INNER JOIN 
				(SELECT DISTINCT SurveyDate, PatientId, a.SurveyId, SurveyItem, SurveyItemNum, SurveyNotes, SurveyItemResult,
				CASE WHEN SurveyItemNum = '5' AND SurveyItemResult IS NOT NULL THEN SurveyItemResult 
					 WHEN SurveyItemNum = '5' AND SurveyItemResult IS NULL THEN 0 
				END Q5
				FROM Surveys a inner join surveyItems b on a.SurveyId =  b.SurveyId
					WHERE surveyType IN ('Sexual Medicine Clinical Assessment', 'Sexual Medicine Clinical Assessment Form')
					--and a.enteredby LIKE '%stabilec%'
					AND SurveyItem LIKE  'Over the past 4 weeks%'
					AND SurveyItemNum = '5'
				) e on a.SurveyId = e.SurveyId AND a.PatientId = e.PatientId AND a.SurveyDate = e.SurveyDate

			INNER JOIN 
				(SELECT DISTINCT SurveyDate, PatientId, a.SurveyId, SurveyItem, SurveyItemNum, SurveyNotes, SurveyItemResult,
				CASE WHEN SurveyItemNum = '6' AND SurveyItemResult IS NOT NULL THEN SurveyItemResult 
					 WHEN SurveyItemNum = '6' AND SurveyItemResult IS NULL THEN 0 
				END Q6
				FROM Surveys a inner join surveyItems b on a.SurveyId =  b.SurveyId
					WHERE surveyType IN ('Sexual Medicine Clinical Assessment', 'Sexual Medicine Clinical Assessment Form')
					--and a.enteredby LIKE '%stabilec%'
					AND SurveyItem LIKE  'Over the past 4 weeks%'
					AND SurveyItemNum = '6'
				) f on a.SurveyId = f.SurveyId AND a.PatientId = f.PatientId AND a.SurveyDate = f.SurveyDate

			INNER JOIN 
				(SELECT DISTINCT SurveyDate, PatientId, a.SurveyId, SurveyItem, SurveyItemNum, SurveyNotes, SurveyItemResult,
				CASE WHEN SurveyItemNum = '7' AND SurveyItemResult IS NOT NULL THEN SurveyItemResult 
					 WHEN SurveyItemNum = '7' AND SurveyItemResult IS NULL THEN 0 
				END Q7
				FROM Surveys a inner join surveyItems b on a.SurveyId =  b.SurveyId
					WHERE surveyType IN ('Sexual Medicine Clinical Assessment', 'Sexual Medicine Clinical Assessment Form')
					--and a.enteredby LIKE '%stabilec%'
					AND SurveyItem LIKE  'Over the past 4 weeks%'
					AND SurveyItemNum = '7'
				) g on a.SurveyId = g.SurveyId AND a.PatientId = g.PatientId AND a.SurveyDate = g.SurveyDate

			INNER JOIN 
				(SELECT DISTINCT SurveyDate, PatientId, a.SurveyId, SurveyItem, SurveyItemNum, SurveyNotes, SurveyItemResult,
				CASE WHEN SurveyItemNum = '8' AND SurveyItemResult IS NOT NULL THEN SurveyItemResult 
					 WHEN SurveyItemNum = '8' AND SurveyItemResult IS NULL THEN 0 
				END Q8
				FROM Surveys a inner join surveyItems b on a.SurveyId =  b.SurveyId
					WHERE surveyType IN ('Sexual Medicine Clinical Assessment', 'Sexual Medicine Clinical Assessment Form')
					--and a.enteredby LIKE '%stabilec%'
					AND SurveyItem LIKE  'Over the past 4 weeks%'
					AND SurveyItemNum = '8'
				) h on a.SurveyId = h.SurveyId AND a.PatientId = h.PatientId AND a.SurveyDate = h.SurveyDate

			INNER JOIN 
				(SELECT DISTINCT SurveyDate, PatientId, a.SurveyId, SurveyItem, SurveyItemNum, SurveyNotes, SurveyItemResult,
				CASE WHEN SurveyItemNum = '9' AND SurveyItemResult IS NOT NULL THEN SurveyItemResult 
					 WHEN SurveyItemNum = '9' AND SurveyItemResult IS NULL THEN 0 
				END Q9
				FROM Surveys a inner join surveyItems b on a.SurveyId =  b.SurveyId
					WHERE surveyType IN ('Sexual Medicine Clinical Assessment', 'Sexual Medicine Clinical Assessment Form')
					--and a.enteredby LIKE '%stabilec%'
					AND SurveyItem LIKE  'Over the past 4 weeks%'
					AND SurveyItemNum = '9'
				) i on a.SurveyId = i.SurveyId AND a.PatientId = i.PatientId AND a.SurveyDate = i.SurveyDate

			INNER JOIN 
				(SELECT DISTINCT SurveyDate, PatientId, a.SurveyId, SurveyItem, SurveyItemNum, SurveyNotes, SurveyItemResult,
				CASE WHEN SurveyItemNum = '10' AND SurveyItemResult IS NOT NULL THEN SurveyItemResult 
					 WHEN SurveyItemNum = '10' AND SurveyItemResult IS NULL THEN 0 
				END Q10
				FROM Surveys a inner join surveyItems b on a.SurveyId =  b.SurveyId
					WHERE surveyType IN ('Sexual Medicine Clinical Assessment', 'Sexual Medicine Clinical Assessment Form')
					--and a.enteredby LIKE '%stabilec%'
					AND SurveyItem LIKE  'Over the past 4 weeks%'
					AND SurveyItemNum = '10'
				) j on a.SurveyId = j.SurveyId AND a.PatientId = j.PatientId AND a.SurveyDate = j.SurveyDate
			INNER JOIN 
				(SELECT DISTINCT SurveyDate, PatientId, a.SurveyId, SurveyItem, SurveyItemNum, SurveyNotes, SurveyItemResult,
				CASE WHEN SurveyItemNum = '11' AND SurveyItemResult IS NOT NULL THEN SurveyItemResult 
					 WHEN SurveyItemNum = '11' AND SurveyItemResult IS NULL THEN 0 
				END Q11
				FROM Surveys a inner join surveyItems b on a.SurveyId =  b.SurveyId
					WHERE surveyType IN ('Sexual Medicine Clinical Assessment', 'Sexual Medicine Clinical Assessment Form')
					--and a.enteredby LIKE '%stabilec%'
					AND SurveyItem LIKE  'Over the past 4 weeks%'
					AND SurveyItemNum = '11'
				) k on a.SurveyId = k.SurveyId AND a.PatientId = k.PatientId AND a.SurveyDate = k.SurveyDate

			INNER JOIN 
				(SELECT DISTINCT SurveyDate, PatientId, a.SurveyId, SurveyItem, SurveyItemNum, SurveyNotes, SurveyItemResult,
				CASE WHEN SurveyItemNum = '12' AND SurveyItemResult IS NOT NULL THEN SurveyItemResult 
					 WHEN SurveyItemNum = '12' AND SurveyItemResult IS NULL THEN 0 
				END Q12
				FROM Surveys a inner join surveyItems b on a.SurveyId =  b.SurveyId
					WHERE surveyType IN ('Sexual Medicine Clinical Assessment', 'Sexual Medicine Clinical Assessment Form')
					--and a.enteredby LIKE '%stabilec%'
					AND SurveyItem LIKE  'Over the past 4 weeks%'
					AND SurveyItemNum = '12'
				) l on a.SurveyId = l.SurveyId AND a.PatientId = l.PatientId AND a.SurveyDate = l.SurveyDate
			INNER JOIN 
				(SELECT DISTINCT SurveyDate, PatientId, a.SurveyId, SurveyItem, SurveyItemNum, SurveyNotes, SurveyItemResult,
				CASE WHEN SurveyItemNum = '13' AND SurveyItemResult IS NOT NULL THEN SurveyItemResult 
					 WHEN SurveyItemNum = '13' AND SurveyItemResult IS NULL THEN 0 
				END Q13
				FROM Surveys a inner join surveyItems b on a.SurveyId =  b.SurveyId
					WHERE surveyType IN ('Sexual Medicine Clinical Assessment', 'Sexual Medicine Clinical Assessment Form')
					--and a.enteredby LIKE '%stabilec%'
					AND SurveyItem LIKE  'Over the past 4 weeks%'
					AND SurveyItemNum = '13'
				) m on a.SurveyId = m.SurveyId AND a.PatientId = m.PatientId AND a.SurveyDate = m.SurveyDate
			INNER JOIN 
				(SELECT DISTINCT SurveyDate, PatientId, a.SurveyId, SurveyItem, SurveyItemNum, SurveyNotes, SurveyItemResult,
				CASE WHEN SurveyItemNum = '14' AND SurveyItemResult IS NOT NULL THEN SurveyItemResult 
					 WHEN SurveyItemNum = '14' AND SurveyItemResult IS NULL THEN 0 
				END Q14
				FROM Surveys a inner join surveyItems b on a.SurveyId =  b.SurveyId
					WHERE surveyType IN ('Sexual Medicine Clinical Assessment', 'Sexual Medicine Clinical Assessment Form')
					--and a.enteredby LIKE '%stabilec%'
					AND SurveyItem LIKE  'Over the past 4 weeks%'
					AND SurveyItemNum = '14'
				) n on a.SurveyId = n.SurveyId AND a.PatientId = n.PatientId AND a.SurveyDate = n.SurveyDate
			INNER JOIN 
				(SELECT DISTINCT SurveyDate, PatientId, a.SurveyId, SurveyItem, SurveyItemNum, SurveyNotes, SurveyItemResult,
				CASE WHEN SurveyItemNum = '15' AND SurveyItemResult IS NOT NULL THEN SurveyItemResult 
					 WHEN SurveyItemNum = '15' AND SurveyItemResult IS NULL THEN 0 
				END Q15
				FROM Surveys a inner join surveyItems b on a.SurveyId =  b.SurveyId
					WHERE surveyType IN ('Sexual Medicine Clinical Assessment', 'Sexual Medicine Clinical Assessment Form')
					--and a.enteredby LIKE '%stabilec%'
					AND SurveyItem LIKE  'Over the past 4 weeks%'
					AND SurveyItemNum = '15'
				) o on a.SurveyId = o.SurveyId AND a.PatientId = o.PatientId AND a.SurveyDate = o.SurveyDate
			INNER JOIN 
				(SELECT DISTINCT SurveyDate, PatientId, a.SurveyId, SurveyItem, SurveyItemNum, SurveyNotes, SurveyItemResult,
				CASE WHEN SurveyItemNum = '16' AND SurveyItemResult IS NOT NULL THEN SurveyItemResult 
					 WHEN SurveyItemNum = '16' AND SurveyItemResult IS NULL THEN 0 
				END Q16
				FROM Surveys a inner join surveyItems b on a.SurveyId =  b.SurveyId
					WHERE surveyType IN ('Sexual Medicine Clinical Assessment', 'Sexual Medicine Clinical Assessment Form')
					--and a.enteredby LIKE '%stabilec%'
					AND SurveyItem LIKE  'Over the past 4 weeks%'
					AND SurveyItemNum = '16'
				) p on a.SurveyId = p.SurveyId AND a.PatientId = p.PatientId AND a.SurveyDate = p.SurveyDate
			INNER JOIN 
				(SELECT DISTINCT SurveyDate, PatientId, a.SurveyId, SurveyItem, SurveyItemNum, SurveyNotes, SurveyItemResult,
				CASE WHEN SurveyItemNum = '17' AND SurveyItemResult IS NOT NULL THEN SurveyItemResult 
					 WHEN SurveyItemNum = '17' AND SurveyItemResult IS NULL THEN 0 
				END Q17
				FROM Surveys a inner join surveyItems b on a.SurveyId =  b.SurveyId
					WHERE surveyType IN ('Sexual Medicine Clinical Assessment', 'Sexual Medicine Clinical Assessment Form')
					--and a.enteredby LIKE '%stabilec%'
					AND SurveyItem LIKE  'Over the past 4 weeks%'
					AND SurveyItemNum = '17'
				) q on a.SurveyId = q.SurveyId AND a.PatientId = q.PatientId AND a.SurveyDate = q.SurveyDate
			INNER JOIN 
				(SELECT DISTINCT SurveyDate, PatientId, a.SurveyId, SurveyItem, SurveyItemNum, SurveyNotes, SurveyItemResult,
				CASE WHEN SurveyItemNum = '18' AND SurveyItemResult IS NOT NULL THEN SurveyItemResult 
					 WHEN SurveyItemNum = '18' AND SurveyItemResult IS NULL THEN 0 
				END Q18
				FROM Surveys a inner join surveyItems b on a.SurveyId =  b.SurveyId
					WHERE surveyType IN ('Sexual Medicine Clinical Assessment', 'Sexual Medicine Clinical Assessment Form')
					--and a.enteredby LIKE '%stabilec%'
					AND SurveyItem LIKE  'Over the past 4 weeks%'
					AND SurveyItemNum = '18'
				) r on a.SurveyId = r.SurveyId AND a.PatientId = r.PatientId AND a.SurveyDate = r.SurveyDate
			INNER JOIN 
				(SELECT DISTINCT SurveyDate, PatientId, a.SurveyId, SurveyItem, SurveyItemNum, SurveyNotes, SurveyItemResult,
				CASE WHEN SurveyItemNum = '19' AND SurveyItemResult IS NOT NULL THEN SurveyItemResult 
					 WHEN SurveyItemNum = '19' AND SurveyItemResult IS NULL THEN 0 
				END Q19
				FROM Surveys a inner join surveyItems b on a.SurveyId =  b.SurveyId
					WHERE surveyType IN ('Sexual Medicine Clinical Assessment', 'Sexual Medicine Clinical Assessment Form')
					--and a.enteredby LIKE '%stabilec%'
					AND SurveyItem LIKE  'Over the past 4 weeks%'
					AND SurveyItemNum = '19'
				) s on a.SurveyId = s.SurveyId AND a.PatientId = s.PatientId AND a.SurveyDate = s.SurveyDate

			) 
		)FSFI_Sum 
	GROUP BY SurveyDate, PatientId, SurveyId, SurveyNotes
	) b on a.patientId = b.PatientId
	--Order BY PtMrn
	INNER JOIN
	(
	SELECT SurveyDate, PatientId, SurveyId, ((SUM(S5)+ SUM(S11)+SUM(S20)+SUM(S35)+SUM(S37)+SUM(S39)+SUM(S44)+SUM(S45)+SUM(S48)+SUM(S50)) + 
		   (SUM(S2)+SUM(S6)+SUM(S9)+SUM(S13)+SUM(S16)+SUM(S18)+SUM(S24)+SUM(S25)+SUM(S32))) - 
		   (SUM(S3)+SUM(S8)+SUM(S22)+SUM(S28)+SUM(S31)+SUM(S38)+SUM(S41)) AS Calculated_SSS
	FROM(
		SELECT a.SurveyDate, a.PatientId, a.SurveyId, a.SurveyNotes, S5, S11,S20, S35, S37,S39,S44,S45,S48,S50,
		S2,S6,S9,S13,S16,S18,S24,S25,S32,S3,S8,S22,S28,S31,S38,S41
		FROM(
			(
				SELECT  DISTINCT SurveyDate, PatientId, a.SurveyID, SurveyItem, surveyItemNum, SurveyNotes, SurveyItemResult,
						CASE WHEN SurveyItemResult IS NOT NULL THEN CAST(SurveyItemResult AS INT)
							 WHEN SurveyItemResult IS NULL THEN 0
						END S5
				FROM Surveys a inner join surveyItems b on a.SurveyId =  b.SurveyId
					WHERE surveyType IN ('Sexual Medicine Clinical Assessment', 'Sexual Medicine Clinical Assessment Form')
				AND SurveyItemNum = 'S5'
			)a
			INNER JOIN
			(
				SELECT  DISTINCT SurveyDate, PatientId, a.SurveyID, SurveyItem, surveyItemNum, SurveyNotes, SurveyItemResult,
						CASE WHEN SurveyItemResult IS NOT NULL THEN CAST(SurveyItemResult AS INT)
							 WHEN SurveyItemResult IS NULL THEN 0
						END S11
				FROM Surveys a inner join surveyItems b on a.SurveyId =  b.SurveyId
					WHERE surveyType IN ('Sexual Medicine Clinical Assessment', 'Sexual Medicine Clinical Assessment Form')
				AND SurveyItemNum = 'S11'
			)b ON a.SurveyId = b.SurveyId AND a.PatientId = b.PatientId AND a.SurveyDate = b.SurveyDate
			INNER JOIN 
			(
				SELECT  DISTINCT SurveyDate, PatientId, a.SurveyID, SurveyItem, surveyItemNum, SurveyNotes, SurveyItemResult,
						CASE WHEN SurveyItemResult IS NOT NULL THEN CAST(SurveyItemResult AS INT)
							 WHEN SurveyItemResult IS NULL THEN 0
						END S20
				FROM Surveys a inner join surveyItems b on a.SurveyId =  b.SurveyId
					WHERE surveyType IN ('Sexual Medicine Clinical Assessment', 'Sexual Medicine Clinical Assessment Form')
				AND SurveyItemNum = 'S20'
			)c ON a.SurveyId = c.SurveyId AND a.PatientId = c.PatientId AND a.SurveyDate = c.SurveyDate
			INNER JOIN 
			(
				SELECT  DISTINCT SurveyDate, PatientId, a.SurveyID, SurveyItem, surveyItemNum, SurveyNotes, SurveyItemResult,
						CASE WHEN SurveyItemResult IS NOT NULL THEN CAST(SurveyItemResult AS INT)
							 WHEN SurveyItemResult IS NULL THEN 0
						END S35
				FROM Surveys a inner join surveyItems b on a.SurveyId =  b.SurveyId
					WHERE surveyType IN ('Sexual Medicine Clinical Assessment', 'Sexual Medicine Clinical Assessment Form')
				AND SurveyItemNum = 'S35'
			)d ON a.SurveyId = d.SurveyId AND a.PatientId = d.PatientId AND a.SurveyDate = d.SurveyDate
			INNER JOIN 
			(
				SELECT  DISTINCT SurveyDate, PatientId, a.SurveyID, SurveyItem, surveyItemNum, SurveyNotes, SurveyItemResult,
						CASE WHEN SurveyItemResult IS NOT NULL THEN CAST(SurveyItemResult AS INT)
							 WHEN SurveyItemResult IS NULL THEN 0
						END S37
				FROM Surveys a inner join surveyItems b on a.SurveyId =  b.SurveyId
					WHERE surveyType IN ('Sexual Medicine Clinical Assessment', 'Sexual Medicine Clinical Assessment Form')
				AND SurveyItemNum = 'S37'
			)e ON a.SurveyId = e.SurveyId AND a.PatientId = e.PatientId AND a.SurveyDate = e.SurveyDate
			INNER JOIN 
			(
				SELECT  DISTINCT SurveyDate, PatientId, a.SurveyID, SurveyItem, surveyItemNum, SurveyNotes, SurveyItemResult,
						CASE WHEN SurveyItemResult IS NOT NULL THEN CAST(SurveyItemResult AS INT)
							 WHEN SurveyItemResult IS NULL THEN 0
						END S39
				FROM Surveys a inner join surveyItems b on a.SurveyId =  b.SurveyId
					WHERE surveyType IN ('Sexual Medicine Clinical Assessment', 'Sexual Medicine Clinical Assessment Form')
				AND SurveyItemNum = 'S39'
			)f ON a.SurveyId = f.SurveyId AND a.PatientId = f.PatientId AND a.SurveyDate = f.SurveyDate
			INNER JOIN 
			(
				SELECT  DISTINCT SurveyDate, PatientId, a.SurveyID, SurveyItem, surveyItemNum, SurveyNotes, SurveyItemResult,
						CASE WHEN SurveyItemResult IS NOT NULL THEN CAST(SurveyItemResult AS INT)
							 WHEN SurveyItemResult IS NULL THEN 0
						END S44
				FROM Surveys a inner join surveyItems b on a.SurveyId =  b.SurveyId
					WHERE surveyType IN ('Sexual Medicine Clinical Assessment', 'Sexual Medicine Clinical Assessment Form')
				AND SurveyItemNum = 'S44'
			)g ON a.SurveyId = g.SurveyId AND a.PatientId = g.PatientId AND a.SurveyDate = g.SurveyDate
			INNER JOIN 
			(
				SELECT  DISTINCT SurveyDate, PatientId, a.SurveyID, SurveyItem, surveyItemNum, SurveyNotes, SurveyItemResult,
						CASE WHEN SurveyItemResult IS NOT NULL THEN CAST(SurveyItemResult AS INT)
							 WHEN SurveyItemResult IS NULL THEN 0
						END S45
				FROM Surveys a inner join surveyItems b on a.SurveyId =  b.SurveyId
					WHERE surveyType IN ('Sexual Medicine Clinical Assessment', 'Sexual Medicine Clinical Assessment Form')
				AND SurveyItemNum = 'S45'
			)h ON a.SurveyId = h.SurveyId AND a.PatientId = h.PatientId AND a.SurveyDate = h.SurveyDate
			INNER JOIN 
			(
				SELECT  DISTINCT SurveyDate, PatientId, a.SurveyID, SurveyItem, surveyItemNum, SurveyNotes, SurveyItemResult,
						CASE WHEN SurveyItemResult IS NOT NULL THEN CAST(SurveyItemResult AS INT)
							 WHEN SurveyItemResult IS NULL THEN 0
						END S48
				FROM Surveys a inner join surveyItems b on a.SurveyId =  b.SurveyId
					WHERE surveyType IN ('Sexual Medicine Clinical Assessment', 'Sexual Medicine Clinical Assessment Form')
				AND SurveyItemNum = 'S48'
			)i ON a.SurveyId = i.SurveyId AND a.PatientId = i.PatientId AND a.SurveyDate = i.SurveyDate
			INNER JOIN 
			(
				SELECT  DISTINCT SurveyDate, PatientId, a.SurveyID, SurveyItem, surveyItemNum, SurveyNotes, SurveyItemResult,
						CASE WHEN SurveyItemResult IS NOT NULL THEN CAST(SurveyItemResult AS INT)
							 WHEN SurveyItemResult IS NULL THEN 0
						END S50
				FROM Surveys a inner join surveyItems b on a.SurveyId =  b.SurveyId
					WHERE surveyType IN ('Sexual Medicine Clinical Assessment', 'Sexual Medicine Clinical Assessment Form')
				AND SurveyItemNum = 'S50'
			)j ON a.SurveyId = j.SurveyId AND a.PatientId = j.PatientId AND a.SurveyDate = j.SurveyDate
			INNER JOIN 
			(
				SELECT  DISTINCT SurveyDate, PatientId, a.SurveyID, SurveyItem, surveyItemNum, SurveyNotes, SurveyItemResult,
						CASE WHEN SurveyItemResult IS NOT NULL THEN CAST(SurveyItemResult AS INT)
							 WHEN SurveyItemResult IS NULL THEN 0
						END S2
				FROM Surveys a inner join surveyItems b on a.SurveyId =  b.SurveyId
					WHERE surveyType IN ('Sexual Medicine Clinical Assessment', 'Sexual Medicine Clinical Assessment Form')
				AND SurveyItemNum = 'S2'
			)k ON a.SurveyId = k.SurveyId AND a.PatientId = k.PatientId AND a.SurveyDate = k.SurveyDate
			INNER JOIN 
			(
				SELECT  DISTINCT SurveyDate, PatientId, a.SurveyID, SurveyItem, surveyItemNum, SurveyNotes, SurveyItemResult,
						CASE WHEN SurveyItemResult IS NOT NULL THEN CAST(SurveyItemResult AS INT)
							 WHEN SurveyItemResult IS NULL THEN 0
						END S6
				FROM Surveys a inner join surveyItems b on a.SurveyId =  b.SurveyId
					WHERE surveyType IN ('Sexual Medicine Clinical Assessment', 'Sexual Medicine Clinical Assessment Form')
				AND SurveyItemNum = 'S6'
			)l ON a.SurveyId = l.SurveyId AND a.PatientId = l.PatientId AND a.SurveyDate = l.SurveyDate
			INNER JOIN 
			(
				SELECT  DISTINCT SurveyDate, PatientId, a.SurveyID, SurveyItem, surveyItemNum, SurveyNotes, SurveyItemResult,
						CASE WHEN SurveyItemResult IS NOT NULL THEN CAST(SurveyItemResult AS INT)
							 WHEN SurveyItemResult IS NULL THEN 0
						END S9
				FROM Surveys a inner join surveyItems b on a.SurveyId =  b.SurveyId
					WHERE surveyType IN ('Sexual Medicine Clinical Assessment', 'Sexual Medicine Clinical Assessment Form')
				AND SurveyItemNum = 'S9'
			)z ON a.SurveyId = z.SurveyId AND a.PatientId = z.PatientId AND a.SurveyDate = z.SurveyDate
			INNER JOIN 
			(
				SELECT  DISTINCT SurveyDate, PatientId, a.SurveyID, SurveyItem, surveyItemNum, SurveyNotes, SurveyItemResult,
						CASE WHEN SurveyItemResult IS NOT NULL THEN CAST(SurveyItemResult AS INT)
							 WHEN SurveyItemResult IS NULL THEN 0
						END S13
				FROM Surveys a inner join surveyItems b on a.SurveyId =  b.SurveyId
					WHERE surveyType IN ('Sexual Medicine Clinical Assessment', 'Sexual Medicine Clinical Assessment Form')
				AND SurveyItemNum = 'S13'
			)m ON a.SurveyId = m.SurveyId AND a.PatientId = m.PatientId AND a.SurveyDate = m.SurveyDate
			INNER JOIN 
			(
				SELECT  DISTINCT SurveyDate, PatientId, a.SurveyID, SurveyItem, surveyItemNum, SurveyNotes, SurveyItemResult,
						CASE WHEN SurveyItemResult IS NOT NULL THEN CAST(SurveyItemResult AS INT)
							 WHEN SurveyItemResult IS NULL THEN 0
						END S16
				FROM Surveys a inner join surveyItems b on a.SurveyId =  b.SurveyId
					WHERE surveyType IN ('Sexual Medicine Clinical Assessment', 'Sexual Medicine Clinical Assessment Form')
				AND SurveyItemNum = 'S16'
			)n ON a.SurveyId = n.SurveyId AND a.PatientId = n.PatientId AND a.SurveyDate = n.SurveyDate
			INNER JOIN 
			(
				SELECT  DISTINCT SurveyDate, PatientId, a.SurveyID, SurveyItem, surveyItemNum, SurveyNotes, SurveyItemResult,
						CASE WHEN SurveyItemResult IS NOT NULL THEN CAST(SurveyItemResult AS INT)
							 WHEN SurveyItemResult IS NULL THEN 0
						END S18
				FROM Surveys a inner join surveyItems b on a.SurveyId =  b.SurveyId
					WHERE surveyType IN ('Sexual Medicine Clinical Assessment', 'Sexual Medicine Clinical Assessment Form')
				AND SurveyItemNum = 'S18'
			)o ON a.SurveyId = o.SurveyId AND a.PatientId = o.PatientId AND a.SurveyDate = o.SurveyDate
			INNER JOIN 
			(
				SELECT  DISTINCT SurveyDate, PatientId, a.SurveyID, SurveyItem, surveyItemNum, SurveyNotes, SurveyItemResult,
						CASE WHEN SurveyItemResult IS NOT NULL THEN CAST(SurveyItemResult AS INT)
							 WHEN SurveyItemResult IS NULL THEN 0
						END S24
				FROM Surveys a inner join surveyItems b on a.SurveyId =  b.SurveyId
					WHERE surveyType IN ('Sexual Medicine Clinical Assessment', 'Sexual Medicine Clinical Assessment Form')
				AND SurveyItemNum = 'S24'
			)p ON a.SurveyId = p.SurveyId AND a.PatientId = p.PatientId AND a.SurveyDate = p.SurveyDate
			INNER JOIN 
			(
				SELECT  DISTINCT SurveyDate, PatientId, a.SurveyID, SurveyItem, surveyItemNum, SurveyNotes, SurveyItemResult,
						CASE WHEN SurveyItemResult IS NOT NULL THEN CAST(SurveyItemResult AS INT)
							 WHEN SurveyItemResult IS NULL THEN 0
						END S25
				FROM Surveys a inner join surveyItems b on a.SurveyId =  b.SurveyId
					WHERE surveyType IN ('Sexual Medicine Clinical Assessment', 'Sexual Medicine Clinical Assessment Form')
				AND SurveyItemNum = 'S25'
			)q ON a.SurveyId = q.SurveyId AND a.PatientId = q.PatientId AND a.SurveyDate = q.SurveyDate
			INNER JOIN 
			(
				SELECT  DISTINCT SurveyDate, PatientId, a.SurveyID, SurveyItem, surveyItemNum, SurveyNotes, SurveyItemResult,
						CASE WHEN SurveyItemResult IS NOT NULL THEN CAST(SurveyItemResult AS INT)
							 WHEN SurveyItemResult IS NULL THEN 0
						END S32
				FROM Surveys a inner join surveyItems b on a.SurveyId =  b.SurveyId
					WHERE surveyType IN ('Sexual Medicine Clinical Assessment', 'Sexual Medicine Clinical Assessment Form')
				AND SurveyItemNum = 'S32'
			)r ON a.SurveyId = r.SurveyId AND a.PatientId = r.PatientId AND a.SurveyDate = r.SurveyDate
			INNER JOIN 
			(
				SELECT  DISTINCT SurveyDate, PatientId, a.SurveyID, SurveyItem, surveyItemNum, SurveyNotes, SurveyItemResult,
						CASE WHEN SurveyItemResult IS NOT NULL THEN CAST(SurveyItemResult AS INT)
							 WHEN SurveyItemResult IS NULL THEN 0
						END S3
				FROM Surveys a inner join surveyItems b on a.SurveyId =  b.SurveyId
					WHERE surveyType IN ('Sexual Medicine Clinical Assessment', 'Sexual Medicine Clinical Assessment Form')
				AND SurveyItemNum = 'S3'
			)s ON a.SurveyId = s.SurveyId AND a.PatientId = s.PatientId AND a.SurveyDate = s.SurveyDate
			INNER JOIN 
			(
				SELECT  DISTINCT SurveyDate, PatientId, a.SurveyID, SurveyItem, surveyItemNum, SurveyNotes, SurveyItemResult,
						CASE WHEN SurveyItemResult IS NOT NULL THEN CAST(SurveyItemResult AS INT)
							 WHEN SurveyItemResult IS NULL THEN 0
						END S8
				FROM Surveys a inner join surveyItems b on a.SurveyId =  b.SurveyId
					WHERE surveyType IN ('Sexual Medicine Clinical Assessment', 'Sexual Medicine Clinical Assessment Form')
				AND SurveyItemNum = 'S8'
			)t ON a.SurveyId = t.SurveyId AND a.PatientId = t.PatientId AND a.SurveyDate = t.SurveyDate
			INNER JOIN 
			(
				SELECT  DISTINCT SurveyDate, PatientId, a.SurveyID, SurveyItem, surveyItemNum, SurveyNotes, SurveyItemResult,
						CASE WHEN SurveyItemResult IS NOT NULL THEN CAST(SurveyItemResult AS INT)
							 WHEN SurveyItemResult IS NULL THEN 0
						END S22
				FROM Surveys a inner join surveyItems b on a.SurveyId =  b.SurveyId
					WHERE surveyType IN ('Sexual Medicine Clinical Assessment', 'Sexual Medicine Clinical Assessment Form')
				AND SurveyItemNum = 'S22'
			)u ON a.SurveyId = u.SurveyId AND a.PatientId = u.PatientId AND a.SurveyDate = u.SurveyDate
			INNER JOIN 
			(
				SELECT  DISTINCT SurveyDate, PatientId, a.SurveyID, SurveyItem, surveyItemNum, SurveyNotes, SurveyItemResult,
						CASE WHEN SurveyItemResult IS NOT NULL THEN CAST(SurveyItemResult AS INT)
							 WHEN SurveyItemResult IS NULL THEN 0
						END S28
				FROM Surveys a inner join surveyItems b on a.SurveyId =  b.SurveyId
					WHERE surveyType IN ('Sexual Medicine Clinical Assessment', 'Sexual Medicine Clinical Assessment Form')
				AND SurveyItemNum = 'S28'
			)v ON a.SurveyId = v.SurveyId AND a.PatientId = v.PatientId AND a.SurveyDate = v.SurveyDate
			INNER JOIN 
			(
				SELECT  DISTINCT SurveyDate, PatientId, a.SurveyID, SurveyItem, surveyItemNum, SurveyNotes, SurveyItemResult,
						CASE WHEN SurveyItemResult IS NOT NULL THEN CAST(SurveyItemResult AS INT)
							 WHEN SurveyItemResult IS NULL THEN 0
						END S31
				FROM Surveys a inner join surveyItems b on a.SurveyId =  b.SurveyId
					WHERE surveyType IN ('Sexual Medicine Clinical Assessment', 'Sexual Medicine Clinical Assessment Form')
				AND SurveyItemNum = 'S31'
			)w ON a.SurveyId = w.SurveyId AND a.PatientId = w.PatientId AND a.SurveyDate = w.SurveyDate
			INNER JOIN 
			(
				SELECT  DISTINCT SurveyDate, PatientId, a.SurveyID, SurveyItem, surveyItemNum, SurveyNotes, SurveyItemResult,
						CASE WHEN SurveyItemResult IS NOT NULL THEN CAST(SurveyItemResult AS INT)
							 WHEN SurveyItemResult IS NULL THEN 0
						END S38
				FROM Surveys a inner join surveyItems b on a.SurveyId =  b.SurveyId
					WHERE surveyType IN ('Sexual Medicine Clinical Assessment', 'Sexual Medicine Clinical Assessment Form')
				AND SurveyItemNum = 'S38'
			)x ON a.SurveyId = x.SurveyId AND a.PatientId = x.PatientId AND a.SurveyDate = x.SurveyDate
			INNER JOIN 
			(
				SELECT  DISTINCT SurveyDate, PatientId, a.SurveyID, SurveyItem, surveyItemNum, SurveyNotes, SurveyItemResult,
						CASE WHEN SurveyItemResult IS NOT NULL THEN CAST(SurveyItemResult AS INT)
							 WHEN SurveyItemResult IS NULL THEN 0
						END S41
				FROM Surveys a inner join surveyItems b on a.SurveyId =  b.SurveyId
					WHERE surveyType IN ('Sexual Medicine Clinical Assessment', 'Sexual Medicine Clinical Assessment Form')
				AND SurveyItemNum = 'S41'
			)y ON a.SurveyId = y.SurveyId AND a.PatientId = y.PatientId AND a.SurveyDate = y.SurveyDate
		) 
	) a 
	GROUP BY SurveyDate, PatientId, SurveyId, SurveyNotes
	)c ON b.SurveyId = c.SurveyId AND b.PatientId = c.PatientId AND b.SurveyDate = c.SurveyDate
	--ORDER BY PtMrn
) FSFI_SSS
LEFT OUTER JOIN 
(
SELECT SurveyDate, PatientId, SurveyId, SurveyNotes, SUM(Dryness)+SUM(Soreness)+SUM(Irritation)+SUM(Dyspareunia) TotalVASscore,(CAST(Dryness as numeric)+ CAST(Soreness AS Numeric)+ CAST(Irritation AS NUMERIC)+ CAST(Dyspareunia AS NUMERIC))/4 CompositeVASscore
FROM(
	SELECT a.SurveyDate, a.PatientId, a.SurveyId, a.SurveyNotes, Dryness, Soreness, Irritation, Dyspareunia
	FROM(

			(SELECT DISTINCT SurveyDate, a.PatientId, a.SurveyId, SurveyItem, SurveyItemNum, SurveyNotes, SurveyItemResult,
						CASE WHEN SurveyItem = 'Dryness' AND SurveyItemNum = '1' AND SurveyItemResult IS NOT NULL THEN CAST(SurveyItemResult AS int)
							 WHEN SurveyItem = 'Dryness' AND SurveyItemNum = '1' AND SurveyItemResult IS NULL THEN 0 
						END Dryness
			FROM Surveys a INNER JOIN surveyItems b on a.SurveyId =  b.SurveyId
				INNER JOIN Patients c on a.patientId = c.PatientId
			WHERE surveyType IN ('Sexual Medicine Clinical Assessment', 'Sexual Medicine Clinical Assessment Form') AND 
				surveyItem = 'Dryness' AND SurveyItemNum = '1') a --IN ('Dryness', 'Soreness', 'Irritation', 'Dyspareunia (Pain w/intercourse)')
			INNER JOIN 
			(SELECT DISTINCT SurveyDate, a.PatientId, a.SurveyId, SurveyItem, SurveyItemNum, SurveyNotes, SurveyItemResult,
						CASE WHEN SurveyItem = 'Soreness' AND SurveyItemNum = '2' AND SurveyItemResult IS NOT NULL THEN CAST(SurveyItemResult AS int)
							 WHEN SurveyItem = 'Soreness' AND SurveyItemNum = '2' AND SurveyItemResult IS NULL THEN 0 
						END Soreness
			FROM Surveys a INNER JOIN surveyItems b on a.SurveyId =  b.SurveyId
				INNER JOIN Patients c on a.patientId = c.PatientId
			WHERE surveyType IN ('Sexual Medicine Clinical Assessment', 'Sexual Medicine Clinical Assessment Form') AND 
				surveyItem = 'Soreness' AND SurveyItemNum = '2') b on a.SurveyId = b.SurveyId AND a.PatientId = b.PatientId AND a.SurveyDate = b.SurveyDate
			INNER JOIN 
			(SELECT DISTINCT SurveyDate, a.PatientId, a.SurveyId, SurveyItem, SurveyItemNum, SurveyNotes, SurveyItemResult,
						CASE WHEN SurveyItem = 'Irritation' AND SurveyItemNum = '3' AND SurveyItemResult IS NOT NULL THEN CAST(SurveyItemResult AS int)
							 WHEN SurveyItem = 'Irritation' AND SurveyItemNum = '3' AND SurveyItemResult IS NULL THEN 0 
						END Irritation
			FROM Surveys a INNER JOIN surveyItems b on a.SurveyId =  b.SurveyId
				INNER JOIN Patients c on a.patientId = c.PatientId
			WHERE surveyType IN ('Sexual Medicine Clinical Assessment', 'Sexual Medicine Clinical Assessment Form') AND 
				surveyItem = 'Irritation' AND SurveyItemNum = '3') c on a.SurveyId = c.SurveyId AND a.PatientId = c.PatientId AND a.SurveyDate = c.SurveyDate
			INNER JOIN 
			(SELECT DISTINCT SurveyDate, a.PatientId, a.SurveyId, SurveyItem, SurveyItemNum, SurveyNotes, SurveyItemResult,
						CASE WHEN SurveyItem = 'Dyspareunia (Pain w/intercourse)' AND SurveyItemNum = '4' AND SurveyItemResult IS NOT NULL THEN CAST(SurveyItemResult AS int)
							 WHEN SurveyItem = 'Dyspareunia (Pain w/intercourse)' AND SurveyItemNum = '4' AND SurveyItemResult IS NULL THEN 0 
						END Dyspareunia
			FROM Surveys a INNER JOIN surveyItems b on a.SurveyId =  b.SurveyId
				INNER JOIN Patients c on a.patientId = c.PatientId
			WHERE surveyType IN ('Sexual Medicine Clinical Assessment', 'Sexual Medicine Clinical Assessment Form') AND 
				surveyItem = 'Dyspareunia (Pain w/intercourse)' AND SurveyItemNum = '4') d on a.SurveyId = d.SurveyId AND a.PatientId = d.PatientId AND a.SurveyDate = d.SurveyDate

	)
) a
GROUP BY SurveyDate, PatientId, SurveyId, SurveyNotes, Dryness, Soreness, Irritation, Dyspareunia
) VAS ON FSFI_SSS.SurveyDate = VAS.SurveyDate AND FSFI_SSS.PatientId = VAS.PatientId AND FSFI_SSS.SurveyId = VAS.SurveyId
WHERE
	ISDATE(@FromDate)=1 AND ISDATE(@ToDate)=1
	AND FSFI_SSS.SurveyDate BETWEEN CAST(@FromDate AS datetime) AND CAST(@ToDate AS datetime)
ORDER BY surveyDate DESC