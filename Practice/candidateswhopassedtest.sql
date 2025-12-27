SELECT 
    e.id AS candidateId,
    e.firstname,
    e.lastname,
    t.Name AS testName,
    ctr.score,
    t.passinglevel
FROM candidatetestresults ctr
JOIN tests t 
     ON ctr.testid = t.id
JOIN employees e 
     ON ctr.candidateid = e.id
WHERE ctr.score >= t.passinglevel;
