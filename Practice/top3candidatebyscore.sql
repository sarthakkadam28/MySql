SELECT 
    e.id AS candidateId,
    e.firstname,
    e.lastname,
    SUM(ctr.score) AS totalScore
FROM candidatetestresults ctr
JOIN employees e 
     ON e.id = ctr.candidateid
GROUP BY e.id, e.firstname, e.lastname
ORDER BY totalScore DESC
LIMIT 3;
