SELECT 
    t.id AS testId,
    t.Name AS testName,
    AVG(ctr.score) AS averageScore
FROM tests t
JOIN candidatetestresults ctr
     ON ctr.testid = t.id
GROUP BY t.id, t.Name;
