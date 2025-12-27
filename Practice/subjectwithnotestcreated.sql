SELECT s.id, s.title
FROM subjects s
LEFT JOIN tests t 
       ON t.subjectid = s.id
WHERE t.id IS NULL;
