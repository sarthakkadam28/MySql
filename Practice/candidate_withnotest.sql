SELECT
    e.id AS candidate_id,
    e.firstname,
    e.lastname,
    e.email
FROM employees e
LEFT JOIN candidatetestresults ctr
       ON ctr.candidateid = e.id
WHERE ctr.id IS NULL;
