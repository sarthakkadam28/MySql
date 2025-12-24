SELECT
    t.id,
    t.Name AS test_name,
    t.status
FROM tests t
LEFT JOIN testquestions tq
       ON tq.testid = t.id
WHERE tq.id IS NULL;
