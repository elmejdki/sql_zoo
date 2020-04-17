SELECT A_STRONGLY_AGREE
FROM nss
WHERE 
  question='Q01'
  AND institution='Edinburgh Napier University'
  AND subject='(8) Computer Science';


SELECT institution, subject
FROM nss
WHERE 
  question='Q15'
  AND score >= 100;


SELECT institution, score
FROM nss
WHERE 
  question='Q15'
  AND score < 50
  AND subject='(8) Computer Science'


SELECT subject, SUM(response)
FROM nss
WHERE
  question='Q22'
  AND ( 
    subject='(8) Computer Science' OR 
    subject = '(H) Creative Arts and Design')
GROUP BY subject;


SELECT subject, SUM(response * A_STRONGLY_AGREE) / 100
FROM nss
WHERE 
  question='Q22'
  AND ( 
    subject='(8) Computer Science' OR 
    subject = '(H) Creative Arts and Design')
GROUP BY subject;



SELECT 
  subject, 
  ROUND(
    (SUM(response * A_STRONGLY_AGREE) / 100) / 
    (
      (SUM(response * A_STRONGLY_DISAGREE) / 100) + 
      (SUM(response * A_STRONGLY_AGREE) / 100) + 
      (SUM(response * A_AGREE) / 100) + 
      (SUM(response * A_DISAGREE) / 100) + 
      (SUM(response * A_NEUTRAL) / 100))*100
    )
  FROM nss
 WHERE question='Q22'
   AND ( subject='(8) Computer Science' OR subject = '(H) Creative Arts and Design')
GROUP BY subject;


SELECT institution,round(sum(response*score)/sum(response)) as score
FROM nss
WHERE question='Q22'
AND (institution LIKE '%Manchester%')
GROUP BY institution
ORDER BY institution;


SELECT 
  institution,
  SUM(sample), 
  SUM(
    CASE
      WHEN subject = '(8) Computer Science' THEN sample
      ELSE 0
    END
  )
FROM nss
WHERE 
  question='Q01' AND 
  (institution LIKE '%Manchester%')
GROUP BY institution
