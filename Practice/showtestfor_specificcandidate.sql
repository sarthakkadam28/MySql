SELECT
    ts.id AS schedule_id,
    t.id AS test_id,
    t.Name AS test_name,
    t.duration,
    ts.scheduledstart,
    ts.scheduledend,
    ts.status
FROM testschedules ts
JOIN tests t ON ts.testid = t.id
WHERE ts.candidateid = :candidateId;
