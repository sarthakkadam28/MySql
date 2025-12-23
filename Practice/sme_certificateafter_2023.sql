SELECT 
    sme.id,
    e.firstname,
    e.lastname,
    s.title AS subject,
    sme.certificationdate
FROM subjectmatterexperts sme
JOIN employees e ON sme.employeeid = e.id
JOIN subjects s ON sme.subjectid = s.id
WHERE sme.certificationdate > '2023-12-31';
