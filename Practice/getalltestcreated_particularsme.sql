SELECT
    t.id,
    t.Name AS test_name,
    t.duration,
    t.creationdate,
    t.passinglevel,
    t.status
FROM tests t
WHERE t.smeid = :smeId;
