SELECT
    e.id AS candidate_id,
    qb.title AS question,
    ca.answerkey AS candidate_answer,
    qb.answerkey AS correct_answer,
    CASE
        WHEN ca.answerkey IS NULL THEN 'Not Answered'
        WHEN ca.answerkey = qb.answerkey THEN 'Correct'
        ELSE 'Incorrect'
    END AS answer_status
FROM candidateanswers ca
JOIN questionbank qb
       ON qb.id = ca.testquestionid
JOIN employees e
       ON e.id = ca.candidateid
WHERE ca.candidateid = :candidateId;
