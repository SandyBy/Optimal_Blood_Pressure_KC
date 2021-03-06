SELECT qid, max(medianARS), max(medianARD), max(medianARM)
FROM(SELECT qid, ooff,
PERCENTILE_CONT(ARS, 0.5) OVER(PARTITION BY qid) as medianARS,
PERCENTILE_CONT(ARD,0.5) OVER(PARTITION BY qid) AS medianARD,
PERCENTILE_CONT(ARM,0.5) OVER(PARTITION BY qid) AS medianARM
FROM `team02bloodpressure.datathon.AR_bp`
WHERE ooff <= 72*60)
GROUP BY qid
