SELECT
    ca.candidateid,
    ca.testid,
    COUNT(*) AS score
FROM candidateanswers ca
JOIN questionbank qb
       ON qb.id = ca.testquestionid
WHERE ca.candidateid = :candidateId
  AND ca.testid = :testId
  AND ca.answerkey = qb.answerkey;
